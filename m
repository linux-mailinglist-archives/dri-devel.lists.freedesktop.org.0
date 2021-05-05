Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374237384A
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D05589C1E;
	Wed,  5 May 2021 10:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF7C89C1E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 10:03:19 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5C9EA82A89;
 Wed,  5 May 2021 12:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620208997;
 bh=3zRlsEWjrcNIuCNfYrV3hRYLZJizMi4v1CIgzLcRvCQ=;
 h=From:To:Cc:Subject:Date:From;
 b=zsjcHleDFWwFOT86cpA1b8sWDgwW5IFRvUISxe+2xWSJQ5qq2ceJGXdc8ovg0WhA6
 Lqx2rwll+mzdH2srWpDFtJs/L9+xssscBzh1umo7ZdKPnZvSkoILzqC+fXb6SC8WxE
 iRqFXX3mGgRvIDzcTTejIProVxz8aO58fNezvZVE5ljxgaGiVJybMjURBglyF9xRV/
 Mre0r3WRaNsV0BWHhYzw4/uOPlHx/Q5NPHhia8fN805CLWNg5tDZqAvLNnM5BOAQ93
 aMAtH0mSFUB3VucPhdJwVcSGQvRgxOyrfkJ9J46hYSmHy3i8QP4rWd4Fs/blH8F1C4
 +ZWAC8mRj0NMA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
Date: Wed,  5 May 2021 12:02:17 +0200
Message-Id: <20210505100218.108024-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT binding document for TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: Add compatible string for SN65DSI84, since this is now tested on it
V3: - Add 0x2c as valid i2c address
    - Switch to schemas/graph.yaml
    - Constraint data-lanes to <1>, <1 2>, <1 2 3>, <1 2 3 4> only
    - Indent example by 4 spaces
    - Handle dual-link LVDS with two ports and describe the second DSI
      channel-B port as well. Based on the register defaults of DSI83
      and DSI84, it is likely that the LVDS-channel-B and DSI-channel-B
      hardware is present in all the chips, so just reuse port@0 and 2
      for DSI83, port@0,2,3 for DSI84 and all of 0,1,2,3 for DSI85 when
      that is supported
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml | 171 ++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
new file mode 100644
index 000000000000..4e7df92446a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SN65DSI83 and SN65DSI84 DSI to LVDS bridge chip
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  Texas Instruments SN65DSI83 1x Single-link MIPI DSI
+  to 1x Single-link LVDS
+  https://www.ti.com/lit/gpn/sn65dsi83
+  Texas Instruments SN65DSI84 1x Single-link MIPI DSI
+  to 1x Dual-link or 2x Single-link LVDS
+  https://www.ti.com/lit/gpn/sn65dsi84
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,sn65dsi83
+      - const: ti,sn65dsi84
+
+  reg:
+    oneOf:
+      - const: 0x2c
+      - const: 0x2d
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for bridge_en pin (active high).
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for MIPI DSI Channel-A input
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                maxItems: 4
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for MIPI DSI Channel-B input
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                maxItems: 4
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-A output (panel or bridge).
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: LVDS Channel-A output endpoint
+            unevaluatedProperties: false
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-A output (panel or bridge).
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: LVDS Channel-B output endpoint
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,sn65dsi83
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+            port@3: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,sn65dsi84
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@2d {
+            compatible = "ti,sn65dsi83";
+            reg = <0x2d>;
+
+            enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                        data-lanes = <1 2 3 4>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    endpoint {
+                        remote-endpoint = <&panel_in_lvds>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
