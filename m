Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1A424190
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DC96ED18;
	Wed,  6 Oct 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C036ED91
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 15:22:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 16E841F44BDC
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: airlied@linux.ie, daniel@ffwll.ch, m.purski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: display/bridge: sil,
 sii9234: Convert to YAML binding
Date: Wed,  6 Oct 2021 17:21:58 +0200
Message-Id: <20211006152158.601856-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Oct 2021 15:43:56 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Silicon Image SiI9234 HDMI/MHL bridge documentation to YAML.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/bridge/sii9234.txt       |  49 --------
 .../bindings/display/bridge/sil,sii9234.yaml  | 110 ++++++++++++++++++
 2 files changed, 110 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/sii9234.txt b/Documentation/devicetree/bindings/display/bridge/sii9234.txt
deleted file mode 100644
index a55bf77bd960..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/sii9234.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Silicon Image SiI9234 HDMI/MHL bridge bindings
-
-Required properties:
-	- compatible : "sil,sii9234".
-	- reg : I2C address for TPI interface, use 0x39
-	- avcc33-supply : MHL/USB Switch Supply Voltage (3.3V)
-	- iovcc18-supply : I/O Supply Voltage (1.8V)
-	- avcc12-supply : TMDS Analog Supply Voltage (1.2V)
-	- cvcc12-supply : Digital Core Supply Voltage (1.2V)
-	- interrupts: interrupt specifier of INT pin
-	- reset-gpios: gpio specifier of RESET pin (active low)
-	- video interfaces: Device node can contain two video interface port
-			    nodes for HDMI encoder and connector according to [1].
-			    - port@0 - MHL to HDMI
-			    - port@1 - MHL to connector
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-
-Example:
-	sii9234@39 {
-		compatible = "sil,sii9234";
-		reg = <0x39>;
-		avcc33-supply = <&vcc33mhl>;
-		iovcc18-supply = <&vcc18mhl>;
-		avcc12-supply = <&vsil12>;
-		cvcc12-supply = <&vsil12>;
-		reset-gpios = <&gpf3 4 GPIO_ACTIVE_LOW>;
-		interrupt-parent = <&gpf3>;
-		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				mhl_to_hdmi: endpoint {
-					remote-endpoint = <&hdmi_to_mhl>;
-				};
-			};
-			port@1 {
-				reg = <1>;
-				mhl_to_connector: endpoint {
-					remote-endpoint = <&connector_to_mhl>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
new file mode 100644
index 000000000000..f88ddfe4818b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/sil,sii9234.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Image SiI9234 HDMI/MHL bridge
+
+maintainers:
+  - Maciej Purski <m.purski@samsung.com>
+
+properties:
+  compatible:
+    const: sil,sii9234
+
+  reg:
+    description: I2C address for TPI interface
+    maxItems: 1
+
+  avcc12-supply:
+    description: TMDS Analog Supply Voltage, 1.2V
+
+  avcc33-supply:
+    description: MHL/USB Switch Supply Voltage, 3.3V
+
+  cvcc12-supply:
+    description: Digital Core Supply Voltage, 1.2V
+
+  iovcc18-supply:
+    description: I/O voltage supply, 1.8V
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the reset pin.
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for HDMI (encoder) input
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          MHL to connector port
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - avcc12-supply
+  - avcc33-supply
+  - cvcc12-supply
+  - iovcc18-supply
+  - interrupts
+  - reset-gpios
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@39 {
+        compatible = "sil,sii9234";
+        reg = <0x39>;
+        avcc12-supply = <&vsil12>;
+        avcc33-supply = <&vcc33mhl>;
+        cvcc12-supply = <&vsil12>;
+        iovcc18-supply = <&vcc18mhl>;
+        interrupt-parent = <&gpf3>;
+        interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+        reset-gpios = <&gpf3 4 GPIO_ACTIVE_LOW>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            mhl_to_hdmi: endpoint {
+              remote-endpoint = <&hdmi_to_mhl>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            mhl_to_connector: endpoint {
+              remote-endpoint = <&connector_to_mhl>;
+            };
+          };
+        };
+      };
+    };
+
+...
-- 
2.33.0

