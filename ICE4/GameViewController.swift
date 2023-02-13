
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var currentScene:GKScene?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var endButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentStartScene()
        //init
        CollisionManager.gameViewController = self;



    }
    
    func updateLivesLabel(){
        liveLabel.text = "Live: \(ScoreManager.lives)"
    }
    
    func updateScoreLabel(){
        scoreLabel.text = "Score: \(ScoreManager.score)"

    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setScene(sceneName:String) {
        
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene? {
            
            scene.scaleMode = .aspectFill
            
            if let view = self.view as! SKView? {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
        
    }
    
    func presentStartScene(){
        scoreLabel.isHidden = true
        liveLabel.isHidden = true
        
        endLabel.isHidden = true
        endButton.isHidden = true
        
        startLabel.isHidden = false
        startButton.isHidden = false
        
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene(){
        scoreLabel.isHidden = true
        liveLabel.isHidden = true
        
        endLabel.isHidden = false
        endButton.isHidden = false
        
        
        startLabel.isHidden = true
        startButton.isHidden = true
        
        setScene(sceneName: "EndScene")
        
    }
    
    func presentGameScene(){
        endLabel.isHidden = true
        endButton.isHidden = true
        
        scoreLabel.isHidden = false
        liveLabel.isHidden = false
        
        startLabel.isHidden = true
        startButton.isHidden = true
        
        setScene(sceneName: "GameScene")
        
        
        ScoreManager.score = 0
        ScoreManager.lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }
    
    @IBAction func startButtonPressEvent(_ sender: Any) {
        presentGameScene()
    }
    
    
    @IBAction func endButtonPressEvent(_ sender: Any) {
        presentGameScene()
    }
}
