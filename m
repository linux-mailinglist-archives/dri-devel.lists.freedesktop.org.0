Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90C425121
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270076F3ED;
	Thu,  7 Oct 2021 10:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988B66F3B3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 08:19:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 17CF71F44EF4
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: airlied@linux.ie, daniel@ffwll.ch, ajaykumar.rs@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: display/bridge: ps8622: Convert to YAML binding
Date: Thu,  7 Oct 2021 10:19:30 +0200
Message-Id: <20211007081930.84653-1-angelogioacchino.delregno@collabora.com>
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

Convert the Parade PS8622 eDP/DP to LVDS bridge documentation to YAML.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/bridge/parade,ps8622.yaml         | 102 ++++++++++++++++++
 .../bindings/display/bridge/ps8622.txt        |  31 ------
 2 files changed, 102 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ps8622.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml
new file mode 100644
index 000000000000..dda9ceeac60c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/parade,ps8622.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS8622 eDP/DP to LVDS bridge
+
+maintainers:
+  - Ajay Kumar <ajaykumar.rs@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - parade,ps8622
+      - parade,ps8625
+
+  reg:
+    description: I2C address of the bridge
+    maxItems: 1
+
+  lane-count:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: Number of DP lanes to use
+    maxItems: 1
+
+  use-external-pwm:
+    type: boolean
+    description: Backlight controlled by an external PWM
+
+  sleep-gpios:
+    description: GPIO connected to the PD_ signal.
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the RST_ signal.
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
+  - sleep-gpios
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
+      bridge@48 {
+        compatible = "parade,ps8622";
+        reg = <0x48>;
+        lane-count = <1>;
+        sleep-gpios = <&gpc3 5 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpy7 7 GPIO_ACTIVE_HIGH>;
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
diff --git a/Documentation/devicetree/bindings/display/bridge/ps8622.txt b/Documentation/devicetree/bindings/display/bridge/ps8622.txt
deleted file mode 100644
index c989c3807f2b..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/ps8622.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-ps8622-bridge bindings
-
-Required properties:
-	- compatible: "parade,ps8622" or "parade,ps8625"
-	- reg: first i2c address of the bridge
-	- sleep-gpios: OF device-tree gpio specification for PD_ pin.
-	- reset-gpios: OF device-tree gpio specification for RST_ pin.
-
-Optional properties:
-	- lane-count: number of DP lanes to use
-	- use-external-pwm: backlight will be controlled by an external PWM
-	- video interfaces: Device node can contain video interface port
-			    nodes for panel according to [1].
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	lvds-bridge@48 {
-		compatible = "parade,ps8622";
-		reg = <0x48>;
-		sleep-gpios = <&gpc3 6 1 0 0>;
-		reset-gpios = <&gpc3 1 1 0 0>;
-		lane-count = <1>;
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

