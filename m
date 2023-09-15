Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10EB7A1971
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E80310E5E9;
	Fri, 15 Sep 2023 08:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B8F10E5F0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:20 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
 by laurent.telenet-ops.be with bizsmtp
 id m8uE2A0053q21w7018uEgJ; Fri, 15 Sep 2023 10:54:19 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aJ-003lFx-4D;
 Fri, 15 Sep 2023 10:54:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ac-00Gdam-56;
 Fri, 15 Sep 2023 10:54:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 02/41] dt-bindings: display: Add Renesas SH-Mobile LCDC
 bindings
Date: Fri, 15 Sep 2023 10:53:17 +0200
Message-Id: <6d0a053502abd6555e9a6cbe055e1bdc3329999d.1694767208.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree bindings for the LCD Controller (LCDC) found in Renesas
SuperH SH-Mobile and ARM SH/R-Mobile SOCs.

Based on a plain text prototype by Laurent Pinchart.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org

v4:
  - No changes,

v3:
  - Add Reviewed-by,

v2:
  - Add myself as co-maintainer,
  - Make fck clock required,
  - Drop ports description referring to obsolete graph.txt,
  - Condition ports to compatible strings,
  - Drop label and status from example.

Changes compared to Laurent's original:
  - Convert to json-schema,
  - Rename compatible values from "renesas,lcdc-<SoC>" to
    "renesas,<SoC>-lcdc",
  - Add power-domains property,
  - Add MIPI-DSI port on SH-Mobile AG5,
  - Update example to reflect reality,
  - Add to MAINTAINERS.
---
 .../display/renesas,shmobile-lcdc.yaml        | 130 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml

diff --git a/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml b/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
new file mode 100644
index 0000000000000000..9816c4cacc7d9a7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/renesas,shmobile-lcdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas SH-Mobile LCD Controller (LCDC)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a7740-lcdc # R-Mobile A1
+      - renesas,sh73a0-lcdc  # SH-Mobile AG5
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+    description:
+      Only the functional clock is mandatory.
+      Some of the optional clocks are model-dependent (e.g. "video" (a.k.a.
+      "vou" or "dv_clk") is available on R-Mobile A1 only).
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: fck
+      - enum: [ media, lclk, hdmi, video ]
+      - enum: [ media, lclk, hdmi, video ]
+      - enum: [ media, lclk, hdmi, video ]
+      - enum: [ media, lclk, hdmi, video ]
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: LCD port (R-Mobile A1 and SH-Mobile AG5)
+        unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI port (R-Mobile A1 LCDC1 and SH-Mobile AG5)
+        unevaluatedProperties: false
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI-DSI port (SH-Mobile AG5)
+        unevaluatedProperties: false
+
+    required:
+      - port@0
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a7740-lcdc
+    then:
+      properties:
+        ports:
+          properties:
+            port@2: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sh73a0-lcdc
+    then:
+      properties:
+        ports:
+          required:
+            - port@1
+            - port@2
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7740-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    lcd-controller@fe940000 {
+        compatible = "renesas,r8a7740-lcdc";
+        reg = <0xfe940000 0x4000>;
+        interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp1_clks R8A7740_CLK_LCDC0>,
+                 <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk0_clk>,
+                 <&vou_clk>;
+        clock-names = "fck", "media", "lclk", "video";
+        power-domains = <&pd_a4lc>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                lcdc0_rgb: endpoint {
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 70535048b6a96d55..c6d4ea533fbc179a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7034,6 +7034,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 F:	drivers/gpu/drm/renesas/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
 
-- 
2.34.1

