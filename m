Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DDF425123
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CA06F3F7;
	Thu,  7 Oct 2021 10:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81886F3A6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 07:58:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6C4A81F44EA8
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: airlied@linux.ie, daniel@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: display/bridge: ptn3460: Convert to YAML binding
Date: Thu,  7 Oct 2021 09:58:22 +0200
Message-Id: <20211007075822.62411-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Oct 2021 10:33:58 +0000
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

Convert the NXP PTN3460 eDP to LVDS bridge documentation to YAML.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/bridge/nxp,ptn3460.yaml  | 106 ++++++++++++++++++
 .../bindings/display/bridge/ptn3460.txt       |  39 -------
 2 files changed, 106 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ptn3460.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
new file mode 100644
index 000000000000..107dd138e6c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/nxp,ptn3460.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PTN3460 eDP to LVDS bridge
+
+maintainers:
+  - Sean Paul <seanpaul@chromium.org>
+
+properties:
+  compatible:
+    const: nxp,ptn3460
+
+  reg:
+    description: I2C address of the bridge
+    maxItems: 1
+
+  edid-emulation:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description:
+      The EDID emulation entry to use
+      Value  Resolution  Description
+        0     1024x768   NXP Generic
+        1     1920x1080  NXP Generic
+        2     1920x1080  NXP Generic
+        3     1600x900   Samsung LTM200KT
+        4     1920x1080  Samsung LTM230HT
+        5     1366x768   NXP Generic
+        6     1600x900   ChiMei M215HGE
+    enum: [0, 1, 2, 3, 4, 5, 6]
+
+  powerdown-gpios:
+    description: GPIO connected to the PD_N signal.
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the RST_N signal.
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for LVDS output
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Video port for eDP input
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - edid-emulation
+  - powerdown-gpios
+  - reset-gpios
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
+      bridge@20 {
+        compatible = "nxp,ptn3460";
+        reg = <0x20>;
+        edid-emulation = <5>;
+        powerdown-gpios = <&gpy2 5 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpx1 5 GPIO_ACTIVE_LOW>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            bridge_out: endpoint {
+              remote-endpoint = <&panel_in>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            bridge_in: endpoint {
+              remote-endpoint = <&dp_out>;
+            };
+          };
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/bridge/ptn3460.txt b/Documentation/devicetree/bindings/display/bridge/ptn3460.txt
deleted file mode 100644
index 361971ba104d..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/ptn3460.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-ptn3460 bridge bindings
-
-Required properties:
-	- compatible: "nxp,ptn3460"
-	- reg: i2c address of the bridge
-	- powerdown-gpio: OF device-tree gpio specification  for PD_N pin.
-	- reset-gpio: OF device-tree gpio specification for RST_N pin.
-	- edid-emulation: The EDID emulation entry to use
-		+-------+------------+------------------+
-		| Value | Resolution | Description      |
-		|   0   |  1024x768  | NXP Generic      |
-		|   1   |  1920x1080 | NXP Generic      |
-		|   2   |  1920x1080 | NXP Generic      |
-		|   3   |  1600x900  | Samsung LTM200KT |
-		|   4   |  1920x1080 | Samsung LTM230HT |
-		|   5   |  1366x768  | NXP Generic      |
-		|   6   |  1600x900  | ChiMei M215HGE   |
-		+-------+------------+------------------+
-
-	- video interfaces: Device node can contain video interface port
-			    nodes for panel according to [1].
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	lvds-bridge@20 {
-		compatible = "nxp,ptn3460";
-		reg = <0x20>;
-		powerdown-gpio = <&gpy2 5 1 0 0>;
-		reset-gpio = <&gpx1 5 1 0 0>;
-		edid-emulation = <5>;
-		ports {
-			port@0 {
-				bridge_out: endpoint {
-					remote-endpoint = <&panel_in>;
-				};
-			};
-		};
-	};
-- 
2.33.0

