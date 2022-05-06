Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7765C51D9DC
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DDD10ECFD;
	Fri,  6 May 2022 14:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18E5410EC6D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:05:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0681152B;
 Fri,  6 May 2022 07:05:52 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C5243F885;
 Fri,  6 May 2022 07:05:51 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 09/11] dt-bindings: display: convert Arm HDLCD to DT schema
Date: Fri,  6 May 2022 15:05:31 +0100
Message-Id: <20220506140533.3566431-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140533.3566431-1-andre.przywara@arm.com>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Arm HDLCD is a display controller that scans out a framebuffer and
hands a signal to a digital encoder to generate a DVI or HDMI signal.

Convert the existing DT binding to DT schema.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/display/arm,hdlcd.txt | 79 ----------------
 .../bindings/display/arm,hdlcd.yaml           | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/arm,hdlcd.txt
 create mode 100644 Documentation/devicetree/bindings/display/arm,hdlcd.yaml

diff --git a/Documentation/devicetree/bindings/display/arm,hdlcd.txt b/Documentation/devicetree/bindings/display/arm,hdlcd.txt
deleted file mode 100644
index 78bc24296f3e4..0000000000000
--- a/Documentation/devicetree/bindings/display/arm,hdlcd.txt
+++ /dev/null
@@ -1,79 +0,0 @@
-ARM HDLCD
-
-This is a display controller found on several development platforms produced
-by ARM Ltd and in more modern of its' Fast Models. The HDLCD is an RGB
-streamer that reads the data from a framebuffer and sends it to a single
-digital encoder (DVI or HDMI).
-
-Required properties:
-  - compatible: "arm,hdlcd"
-  - reg: Physical base address and length of the controller's registers.
-  - interrupts: One interrupt used by the display controller to notify the
-    interrupt controller when any of the interrupt sources programmed in
-    the interrupt mask register have activated.
-  - clocks: A list of phandle + clock-specifier pairs, one for each
-    entry in 'clock-names'.
-  - clock-names: A list of clock names. For HDLCD it should contain:
-      - "pxlclk" for the clock feeding the output PLL of the controller.
-
-Required sub-nodes:
-  - port: The HDLCD connection to an encoder chip. The connection is modeled
-    using the OF graph bindings specified in
-    Documentation/devicetree/bindings/graph.txt.
-
-Optional properties:
-  - memory-region: phandle to a node describing memory (see
-    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt) to be
-    used for the framebuffer; if not present, the framebuffer may be located
-    anywhere in memory.
-
-
-Example:
-
-/ {
-	...
-
-	hdlcd@2b000000 {
-		compatible = "arm,hdlcd";
-		reg = <0 0x2b000000 0 0x1000>;
-		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&oscclk5>;
-		clock-names = "pxlclk";
-		port {
-			hdlcd_output: endpoint@0 {
-				remote-endpoint = <&hdmi_enc_input>;
-			};
-		};
-	};
-
-	/* HDMI encoder on I2C bus */
-	i2c@7ffa0000 {
-		....
-		hdmi-transmitter@70 {
-			compatible = ".....";
-			reg = <0x70>;
-			port@0 {
-				hdmi_enc_input: endpoint {
-					remote-endpoint = <&hdlcd_output>;
-				};
-
-				hdmi_enc_output: endpoint {
-					remote-endpoint = <&hdmi_1_port>;
-				};
-			};
-		};
-
-	};
-
-	hdmi1: connector@1 {
-		compatible = "hdmi-connector";
-		type = "a";
-		port {
-			hdmi_1_port: endpoint {
-				remote-endpoint = <&hdmi_enc_output>;
-			};
-		};
-	};
-
-	...
-};
diff --git a/Documentation/devicetree/bindings/display/arm,hdlcd.yaml b/Documentation/devicetree/bindings/display/arm,hdlcd.yaml
new file mode 100644
index 0000000000000..a2670258c48d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/arm,hdlcd.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/arm,hdlcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm HDLCD display controller binding
+
+maintainers:
+  - Liviu Dudau <Liviu.Dudau@arm.com>
+  - Andre Przywara <andre.przywara@arm.com>
+
+description:
+  The Arm HDLCD is a display controller found on several development platforms
+  produced by ARM Ltd and in more modern of its Fast Models. The HDLCD is an
+  RGB streamer that reads the data from a framebuffer and sends it to a single
+  digital encoder (DVI or HDMI).
+
+properties:
+  compatible:
+    const: arm,hdlcd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    const: pxlclk
+
+  clocks:
+    maxItems: 1
+    description: The input reference for the pixel clock.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing memory to be used for the framebuffer.
+      If not present, the framebuffer may be located anywhere in memory.
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    unevaluatedProperties: false
+    description:
+      Output endpoint of the controller, connecting the LCD panel signals.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - port
+
+examples:
+  - |
+    hdlcd@2b000000 {
+        compatible = "arm,hdlcd";
+        reg = <0x2b000000 0x1000>;
+        interrupts = <0 85 4>;
+        clocks = <&oscclk5>;
+        clock-names = "pxlclk";
+        port {
+            hdlcd_output: endpoint {
+                remote-endpoint = <&hdmi_enc_input>;
+            };
+        };
+    };
+
+    /* HDMI encoder on I2C bus */
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        hdmi-transmitter@70 {
+            compatible = "nxp,tda998x";
+            reg = <0x70>;
+            port {
+                hdmi_enc_input: endpoint {
+                    remote-endpoint = <&hdlcd_output>;
+                };
+            };
+        };
+    };
+...
-- 
2.25.1

