Oscillator[] oscillators = new Oscillator[10];
float r = 0.5;
Table t;

void setup()  {   
  size(640,640);  
  smooth();  
  // Initialize all objects
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
  background(212,240,252);  
  t = loadTable("data.csv");
}   

void draw() {     
  background(212,240,252);  
  // Run all objects
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display();
    print(t);
  }
}   

class Oscillator {   

  PVector angle;
  PVector velocity;
  PVector amplitude;

  Oscillator() {   
    angle = new PVector();
    velocity = new PVector(random(-0.005, 0.005), random(-0.005, 0.005));
    amplitude = new PVector(random(50,width/2), random(50,height/2));
  }   

  void oscillate() {
    angle.add(velocity);
  }   

  void display() {   

    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2, height/2);
    r += 0.005;
    rotate(radians(r));
    stroke(2,87,122);
    strokeWeight(2);
    fill(2,87,122);
    ellipse(x, y, 32, 32);
    line(0, 0, x, y);  
    popMatrix();

  }
}