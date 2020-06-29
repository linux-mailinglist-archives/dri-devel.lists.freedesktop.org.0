Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552820EF82
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C093089CE1;
	Tue, 30 Jun 2020 07:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0B489F77
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 22:34:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 9CDE12A018C
Received: by jupiter.universe (Postfix, from userid 1000)
 id BCC6A480103; Tue, 30 Jun 2020 00:34:50 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sam Ravnborg <sam@ravnborg.org>, Tony Lindgren <tony@atomide.com>
Subject: [PATCHv1 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Date: Tue, 30 Jun 2020 00:33:12 +0200
Message-Id: <20200629223315.118256-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629223315.118256-1-sebastian.reichel@collabora.com>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert panel-dsi-cm bindings to YAML and add
missing properties while at it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/display/panel/panel-dsi-cm.txt   |  29 -----
 .../bindings/display/panel/panel-dsi-cm.yaml  | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
deleted file mode 100644
index dce48eb9db57..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Generic MIPI DSI Command Mode Panel
-===================================
-
-Required properties:
-- compatible: "panel-dsi-cm"
-
-Optional properties:
-- label: a symbolic name for the panel
-- reset-gpios: panel reset gpio
-- te-gpios: panel TE gpio
-
-Required nodes:
-- Video port for DSI input
-
-Example
--------
-
-lcd0: display {
-	compatible = "tpo,taal", "panel-dsi-cm";
-	label = "lcd0";
-
-	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
-
-	port {
-		lcd0_in: endpoint {
-			remote-endpoint = <&dsi1_out_ep>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
new file mode 100644
index 000000000000..8d6a20f26470
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-dsi-cm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DSI command mode panels
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+  - Sebastian Reichel <sre@kernel.org>
+
+description: |
+  This binding file is a collection of the DSI panels that
+  are usually driven in command mode. If no backlight is
+  referenced via the optional backlight property, the DSI
+  panel is assumed to have native backlight support.
+  The panel may use an OF graph binding for the association
+  to the display, or it may be a direct child node of the
+  display.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    items:
+      - enum:
+        - motorola,droid4-panel        # Panel from Motorola Droid4 phone
+        - nokia,himalaya               # Panel from Nokia N950 phone
+        - tpo,taal                     # Panel from OMAP4 SDP board
+      - const: panel-dsi-cm            # Generic DSI command mode panel compatible fallback
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vddi-supply:
+    description:
+      Display panels require power to be supplied. While several panels need
+      more than one power supply with panel-specific constraints governing the
+      order and timings of the power supplies, in many cases a single power
+      supply is sufficient, either because the panel has a single power rail, or
+      because all its power rails can be driven by the same supply. In that case
+      the vddi-supply property specifies the supply powering the panel as a
+      phandle to a regulator.
+
+  vpnl-supply:
+    description:
+      When the display panel needs a second power supply, this property can be
+      used in addition to vddi-supply. Both supplies will be enabled at the
+      same time before the panel is being accessed.
+
+  width-mm: true
+  height-mm: true
+  label: true
+  rotation: true
+  panel-timing: true
+  port: true
+  reset-gpios: true
+  te-gpios: true
+  backlight: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - port
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi-controller {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      port {
+        dsi1_out_ep: endpoint {
+          remote-endpoint = <&lcd0_in>;
+          lanes = <0 1 2 3 4 5>;
+        };
+      };
+
+      panel@0 {
+        compatible = "tpo,taal", "panel-dsi-cm";
+        label = "lcd0";
+        reg = <0>;
+        reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+
+        port {
+          lcd0_in: endpoint {
+            remote-endpoint = <&dsi1_out_ep>;
+          };
+        };
+      };
+
+    };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
