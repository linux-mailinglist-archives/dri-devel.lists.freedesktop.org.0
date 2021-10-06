Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998A42418C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC46E846;
	Wed,  6 Oct 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4680B6ECB5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 14:49:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7DDE81F44C3D
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: airlied@linux.ie, daniel@ffwll.ch, a.hajda@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: display/bridge: sil,
 sii8620: Convert to YAML binding
Date: Wed,  6 Oct 2021 16:49:14 +0200
Message-Id: <20211006144914.568787-1-angelogioacchino.delregno@collabora.com>
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

Convert the Silicon Image SiI8620 MIPI-DSI to LVDS bridge documentation
to YAML.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/bridge/sil,sii8620.yaml  | 96 +++++++++++++++++++
 .../bindings/display/bridge/sil-sii8620.txt   | 33 -------
 2 files changed, 96 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
new file mode 100644
index 000000000000..4e32409eff17
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/sil,sii8620.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Image SiI8620 MIPI-DSI to LVDS bridge
+
+maintainers:
+  - Andrzej Hajda <a.hajda@samsung.com>
+
+description: |
+  The SiI8620 is bridge device which converts MIPI DSI or MIPI DPI to DP/eDP.
+
+properties:
+  compatible:
+    const: sil,sii8620
+
+  reg:
+    description: I2C address of the bridge
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xtal
+
+  cvcc10-supply:
+    description: Digital Core Supply Voltage, 1.0V
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
+          Video port for HDMI input
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - cvcc10-supply
+  - iovcc18-supply
+  - interrupts
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
+        compatible = "sil,sii8620";
+        reg = <0x39>;
+        cvcc10-supply = <&ldo36_reg>;
+        iovcc18-supply = <&ldo34_reg>;
+        interrupt-parent = <&gpf0>;
+        interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+        reset-gpios = <&gpv7 0 GPIO_ACTIVE_HIGH>;
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
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
deleted file mode 100644
index b05052f7d62f..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Silicon Image SiI8620 HDMI/MHL bridge bindings
-
-Required properties:
-	- compatible: "sil,sii8620"
-	- reg: i2c address of the bridge
-	- cvcc10-supply: Digital Core Supply Voltage (1.0V)
-	- iovcc18-supply: I/O Supply Voltage (1.8V)
-	- interrupts: interrupt specifier of INT pin
-	- reset-gpios: gpio specifier of RESET pin
-	- clocks, clock-names: specification and name of "xtal" clock
-	- video interfaces: Device node can contain video interface port
-			    node for HDMI encoder according to [1].
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	sii8620@39 {
-		reg = <0x39>;
-		compatible = "sil,sii8620";
-		cvcc10-supply = <&ldo36_reg>;
-		iovcc18-supply = <&ldo34_reg>;
-		interrupt-parent = <&gpf0>;
-		interrupts = <2 0>;
-		reset-gpio = <&gpv7 0 0>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "xtal";
-
-		port {
-			mhl_to_hdmi: endpoint {
-				remote-endpoint = <&hdmi_to_mhl>;
-			};
-		};
-	};
-- 
2.33.0

