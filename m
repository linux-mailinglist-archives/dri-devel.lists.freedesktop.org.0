Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD520EF6A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82AF89CAC;
	Tue, 30 Jun 2020 07:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F56E89D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1593474740; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=P5Qq095rKF3uyYrOAeCOssNQFzeyNSGNN2mhlGuYWGE=;
 b=UIDT07o7LqUOtL3gDxuLzAWkaKUkTQrPveZZfJwId6GzoldMh/f6XTvM+P/+1ujwHEbpwy
 koAK17MI2X92+mkPcLwl+iWo2YBkuwK1llyf10gXnQsMnG+WjbojRFc9tM3tIAW8VConjr
 JhugrEsLFTEQpoP5qmvNW7+iO/uAZQQ=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 01/10] dt-bindings: display: Convert ingenic,
 lcd.txt to YAML
Date: Tue, 30 Jun 2020 01:52:01 +0200
Message-Id: <20200629235210.441709-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.

In the process, the new ingenic,jz4780-lcd compatible string has been
added.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Add info about IPU at port@8

 .../bindings/display/ingenic,lcd.txt          |  45 -------
 .../bindings/display/ingenic,lcd.yaml         | 126 ++++++++++++++++++
 2 files changed, 126 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
deleted file mode 100644
index 01e3261defb6..000000000000
--- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Ingenic JZ47xx LCD driver
-
-Required properties:
-- compatible: one of:
-  * ingenic,jz4740-lcd
-  * ingenic,jz4725b-lcd
-  * ingenic,jz4770-lcd
-- reg: LCD registers location and length
-- clocks: LCD pixclock and device clock specifiers.
-	   The device clock is only required on the JZ4740.
-- clock-names: "lcd_pclk" and "lcd"
-- interrupts: Specifies the interrupt line the LCD controller is connected to.
-
-Example:
-
-panel {
-	compatible = "sharp,ls020b1dd01d";
-
-	backlight = <&backlight>;
-	power-supply = <&vcc>;
-
-	port {
-		panel_input: endpoint {
-			remote-endpoint = <&panel_output>;
-		};
-	};
-};
-
-
-lcd: lcd-controller@13050000 {
-	compatible = "ingenic,jz4725b-lcd";
-	reg = <0x13050000 0x1000>;
-
-	interrupt-parent = <&intc>;
-	interrupts = <31>;
-
-	clocks = <&cgu JZ4725B_CLK_LCD>;
-	clock-names = "lcd";
-
-	port {
-		panel_output: endpoint {
-			remote-endpoint = <&panel_input>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
new file mode 100644
index 000000000000..d56db1802fad
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs LCD controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^lcd-controller@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - ingenic,jz4740-lcd
+      - ingenic,jz4725b-lcd
+      - ingenic,jz4770-lcd
+      - ingenic,jz4780-lcd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel clock
+      - description: Module clock
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: lcd_pclk
+      - const: lcd
+    minItems: 1
+
+  port:
+    description: OF graph bindings (specified in bindings/graph.txt).
+
+  ports:
+    description: OF graph bindings (specified in bindings/graph.txt).
+    type: object
+    properties:
+      port@0:
+        type: object
+        description: DPI output, to interface with TFT panels.
+
+      port@8:
+        type: object
+        description: Link to the Image Processing Unit (IPU).
+          (See ingenic,ipu.yaml).
+
+    required:
+      - port@0
+
+required:
+    - compatible
+    - reg
+    - interrupts
+    - clocks
+    - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ingenic,jz4740-lcd
+          - ingenic,jz4780-lcd
+then:
+  properties:
+    clocks:
+      minItems: 2
+    clock-names:
+      minItems: 2
+else:
+  properties:
+    clocks:
+      maxItems: 1
+    clock-names:
+      maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4740-cgu.h>
+    lcd-controller@13050000 {
+      compatible = "ingenic,jz4740-lcd";
+      reg = <0x13050000 0x1000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <30>;
+
+      clocks = <&cgu JZ4740_CLK_LCD_PCLK>, <&cgu JZ4740_CLK_LCD>;
+      clock-names = "lcd_pclk", "lcd";
+
+      port {
+        endpoint {
+          remote-endpoint = <&panel_input>;
+        };
+      };
+    };
+
+  - |
+    #include <dt-bindings/clock/jz4725b-cgu.h>
+    lcd-controller@13050000 {
+      compatible = "ingenic,jz4725b-lcd";
+      reg = <0x13050000 0x1000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <31>;
+
+      clocks = <&cgu JZ4725B_CLK_LCD>;
+      clock-names = "lcd_pclk";
+
+      port {
+        endpoint {
+          remote-endpoint = <&panel_input>;
+        };
+      };
+    };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
