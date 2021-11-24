Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A72B45C845
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19CF6E947;
	Wed, 24 Nov 2021 15:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4716E93A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:08:23 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id B788680180;
 Wed, 24 Nov 2021 16:08:21 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	david@lechnology.com
Subject: [PATCH 4/6] dt-bindings: display: sitronix,
 st7735r: Add initialization properties
Date: Wed, 24 Nov 2021 16:07:55 +0100
Message-Id: <20211124150757.17929-5-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124150757.17929-1-noralf@tronnes.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZLv5Z0zb c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=qaASi1jwlc7jzXMbZoAA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add initialization properties that are commonly used to initialize the
controller for a specific display panel. It is common for displays to have
a datasheet listing the necessary controller settings or some example code
doing the same. These settings can be matched directly to the DT
properties.

The commands FRMCTR2, FRMCTR3, PWCTR4 and PWCTR5 are usually part of the
setup examples but they are skipped here since they deal with partial and
idle mode which are powersaving modes for very special use cases.

dc-gpios is made optional because its absence indicates 3-line mode.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 .../bindings/display/sitronix,st7735r.yaml    | 118 +++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index 157b1a7b18f9..2db1cfe6ae30 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -19,6 +19,10 @@ allOf:
 properties:
   compatible:
     oneOf:
+      - description:
+          Sitronix ST7735R 262K Color Single-Chip TFT Controller/Driver
+        items:
+          - const: sitronix,st7735r
       - description:
           Adafruit 1.8" 160x128 Color TFT LCD (Product ID 358 or 618)
         items:
@@ -32,20 +36,99 @@ properties:
               - okaya,rh128128t
           - const: sitronix,st7715r
 
+  width:
+    description:
+      Width of display panel in pixels
+
+  height:
+    description:
+      Height of display panel in pixels
+
+  frmctr1:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Frame Rate Control (In normal mode/Full colors) (B1h)
+    minItems: 3
+    maxItems: 3
+
+  invctr:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Display Inversion Control (B4h)
+    minItems: 1
+    maxItems: 1
+
+  pwctr1:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Power Control 1 (C0h)
+    minItems: 3
+    maxItems: 3
+
+  pwctr2:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Power Control 2 (C1h)
+    minItems: 1
+    maxItems: 1
+
+  pwctr3:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Power Control 3 (in Normal mode/Full colors) (C2h)
+    minItems: 2
+    maxItems: 2
+
+  vmctr1:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      VCOM Control 1 (C5h)
+    minItems: 1
+    maxItems: 1
+
+  madctl:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Memory Data Access Control (36h)
+    minItems: 1
+    maxItems: 1
+
+  gamctrp1:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Gamma Positive Polarity Correction Characteristics Setting (E0h)
+    minItems: 16
+    maxItems: 16
+
+  gamctrn1:
+    $ref: /schemas/types.yaml#definitions/uint8-array
+    description:
+      Gamma Negative Polarity Correction Characteristics Setting (E1h)
+    minItems: 16
+    maxItems: 16
+
+  write-only:
+    type: boolean
+    description:
+      Controller is not readable (ie. MISO is not wired up).
+
   dc-gpios:
     maxItems: 1
-    description: Display data/command selection (D/CX)
+    description: |
+      Controller data/command selection (D/CX) in 4-line SPI mode.
+      If not set, the controller is in 3-line SPI mode.
 
   backlight: true
   reg: true
   spi-max-frequency: true
   reset-gpios: true
   rotation: true
+  width-mm: true
+  height-mm: true
 
 required:
   - compatible
   - reg
-  - dc-gpios
 
 additionalProperties: false
 
@@ -72,5 +155,36 @@ examples:
                     backlight = <&backlight>;
             };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            sainsmart18@0{
+                    compatible = "sitronix,st7735r";
+                    reg = <0>;
+                    spi-max-frequency = <40000000>;
+
+                    width = <160>;
+                    height = <128>;
+
+                    frmctr1 = [ 01 2C 2D ];
+                    invctr = [ 07 ];
+                    pwctr1 = [ A2 02 84 ];
+                    pwctr2 = [ C5 ];
+                    pwctr3 = [ 0A 00 ];
+                    vmctr1 = [ 0E ];
+                    madctl = [ 60 ];
+                    gamctrp1 = [ 0F 1A 0F 18 2F 28 20 22 1F 1B 23 37 00 07 02 10 ];
+                    gamctrn1 = [ 0F 1B 0F 17 33 2C 29 2E 30 30 39 3F 00 07 03 10 ];
+
+                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
+                    write-only;
+            };
+    };
+
 
 ...
-- 
2.33.0

