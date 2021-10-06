Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F599424191
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D396ED23;
	Wed,  6 Oct 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382A46E514
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 13:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5E48B1F41CD9
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: a.hajda@samsung.com, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: display/bridge: tc358767: Convert to YAML binding
Date: Wed,  6 Oct 2021 15:52:04 +0200
Message-Id: <20211006135204.505144-1-angelogioacchino.delregno@collabora.com>
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

Convert the Toshiba TC358767 txt documentation to YAML.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/bridge/toshiba,tc358767.txt       |  54 --------
 .../display/bridge/toshiba,tc358767.yaml      | 118 ++++++++++++++++++
 2 files changed, 118 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
deleted file mode 100644
index 583c5e9dbe6b..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-Toshiba TC358767 eDP bridge bindings
-
-Required properties:
- - compatible: "toshiba,tc358767"
- - reg: i2c address of the bridge, 0x68 or 0x0f, depending on bootstrap pins
- - clock-names: should be "ref"
- - clocks: OF device-tree clock specification for refclk input. The reference
-   clock rate must be 13 MHz, 19.2 MHz, 26 MHz, or 38.4 MHz.
-
-Optional properties:
- - shutdown-gpios: OF device-tree gpio specification for SD pin
-                   (active high shutdown input)
- - reset-gpios: OF device-tree gpio specification for RSTX pin
-                (active low system reset)
- - toshiba,hpd-pin: TC358767 GPIO pin number to which HPD is connected to (0 or 1)
- - ports: the ports node can contain video interface port nodes to connect
-   to a DPI/DSI source and to an eDP/DP sink according to [1][2]:
-    - port@0: DSI input port
-    - port@1: DPI input port
-    - port@2: eDP/DP output port
-
-[1]: Documentation/devicetree/bindings/graph.txt
-[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	edp-bridge@68 {
-		compatible = "toshiba,tc358767";
-		reg = <0x68>;
-		shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
-		clock-names = "ref";
-		clocks = <&edp_refclk>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-
-				bridge_in: endpoint {
-					remote-endpoint = <&dpi_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				bridge_out: endpoint {
-					remote-endpoint = <&panel_in>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
new file mode 100644
index 000000000000..8e27e6f0fc7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358767.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC358767 MIPI-DSI or MIPI-DPI to DP/eDP bridge
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - toshiba,tc358767
+
+  reg:
+    description: I2C address of the bridge
+    enum: [0x68, 0x0f]
+
+  clocks:
+    description:
+      Reference clock input. The reference clock rate must be 13MHz, 19.2MHz,
+      26MHz, or 38.4MHz.
+    maxItems: 1
+
+  clock-names:
+    const: ref
+
+  reset-gpios:
+    description: GPIO connected to the RSTX signal.
+    maxItems: 1
+
+  shutdown-gpios:
+    description: GPIO connected to the SD signal.
+    maxItems: 1
+
+  toshiba,hpd-pin:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: TC356767 GPIO pin number to which HPD is connected
+    enum:
+      - 0
+      - 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for MIPI DSI input
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for MIPI DPI input
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for DP/eDP output (panel or connector).
+
+    oneOf:
+      - required:
+          - port@0
+          - port@2
+      - required:
+          - port@1
+          - port@2
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@68 {
+        compatible = "toshiba,tc358767";
+        reg = <0x68>;
+        clock-names = "ref";
+        clocks = <&edp_refclk>;
+        reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
+        shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@1 {
+            reg = <1>;
+            bridge_in: endpoint {
+              remote-endpoint = <&dpi_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+            bridge_out: endpoint {
+              remote-endpoint = <&panel_in>;
+            };
+          };
+        };
+      };
+    };
+
+...
-- 
2.33.0

