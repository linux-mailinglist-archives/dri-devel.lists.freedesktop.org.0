Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B507471750
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 00:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE84210E2E8;
	Sat, 11 Dec 2021 23:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [94.230.151.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D6A10E2E8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 23:38:38 +0000 (UTC)
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 3FB7D24AF5;
 Sun, 12 Dec 2021 00:38:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1639265914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dG9cEjITJ2Ie+kdqJbPAtJRjOIdju1WIOYnTVU9mmJ0=;
 b=elnD2pM6Z46CxOHmrTui0wZ7q1ovP2LA5b8mPJqk1obtJHss7s1Ef3N+QDOx7OKlmjy9DG
 sN+ZYBfquVNtzYcIIkuIgL4qG1WHdudvLhSzGpFV6WU0HFJ4US3Zx/rFZeVljq+NatHuOo
 o37/b0X1rrpf9hl5Kv6tI3zwlkNZYE0=
From: David Heidelberg <david@ixit.cz>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, - <opensource@rock-chips.com>
Subject: [PATCH v2 2/2] dt-bindings: convert Rockchip DW MIPI DSI binding to
 YAML format
Date: Sun, 12 Dec 2021 00:38:18 +0100
Message-Id: <20211211233818.88482-2-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211211233818.88482-1-david@ixit.cz>
References: <20211211233818.88482-1-david@ixit.cz>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 David Heidelberg <david@ixit.cz>, ~okias/devicetree@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert into YAML format into format, which can be validated.

Changes:
 - drop panel from example

Signed-off-by: David Heidelberg <david@ixit.cz>
---
v2:
 - rename patch
 - drop possibility for only one compatible string
 - add patch for adding compatible to the PX30 dtsi

.../display/rockchip/dw_mipi_dsi_rockchip.txt |  93 ---------
 .../rockchip/rockchip,dw-mipi-dsi.yaml        | 194 ++++++++++++++++++
 2 files changed, 194 insertions(+), 93 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
deleted file mode 100644
index 39792f051d2d..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
+++ /dev/null
@@ -1,93 +0,0 @@
-Rockchip specific extensions to the Synopsys Designware MIPI DSI
-================================
-
-Required properties:
-- #address-cells: Should be <1>.
-- #size-cells: Should be <0>.
-- compatible: one of
-	"rockchip,px30-mipi-dsi", "snps,dw-mipi-dsi"
-	"rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi"
-	"rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi"
-- reg: Represent the physical address range of the controller.
-- interrupts: Represent the controller's interrupt to the CPU(s).
-- clocks, clock-names: Phandles to the controller's pll reference
-  clock(ref) when using an internal dphy and APB clock(pclk).
-  For RK3399, a phy config clock (phy_cfg) and a grf clock(grf)
-  are required. As described in [1].
-- rockchip,grf: this soc should set GRF regs to mux vopl/vopb.
-- ports: contain a port node with endpoint definitions as defined in [2].
-  For vopb,set the reg = <0> and set the reg = <1> for vopl.
-- video port 0 for the VOP input, the remote endpoint maybe vopb or vopl
-- video port 1 for either a panel or subsequent encoder
-
-Optional properties:
-- phys: from general PHY binding: the phandle for the PHY device.
-- phy-names: Should be "dphy" if phys references an external phy.
-- #phy-cells: Defined when used as ISP phy, should be 0.
-- power-domains: a phandle to mipi dsi power domain node.
-- resets: list of phandle + reset specifier pairs, as described in [3].
-- reset-names: string reset name, must be "apb".
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/media/video-interfaces.txt
-[3] Documentation/devicetree/bindings/reset/reset.txt
-
-Example:
-	mipi_dsi: mipi@ff960000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
-		reg = <0xff960000 0x4000>;
-		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_MIPI_24M>, <&cru PCLK_MIPI_DSI0>;
-		clock-names = "ref", "pclk";
-		resets = <&cru SRST_MIPIDSI0>;
-		reset-names = "apb";
-		rockchip,grf = <&grf>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			mipi_in: port@0 {
-				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				mipi_in_vopb: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vopb_out_mipi>;
-				};
-				mipi_in_vopl: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vopl_out_mipi>;
-				};
-			};
-
-			mipi_out: port@1 {
-				reg = <1>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				mipi_out_panel: endpoint {
-					remote-endpoint = <&panel_in_mipi>;
-				};
-			};
-		};
-
-		panel {
-			compatible ="boe,tv080wum-nl0";
-			reg = <0>;
-
-			enable-gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&lcd_en>;
-			backlight = <&backlight>;
-
-			port {
-				panel_in_mipi: endpoint {
-					remote-endpoint = <&mipi_out_panel>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..9165c578d721
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -0,0 +1,194 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip specific extensions to the Synopsys Designware MIPI DSI
+
+maintainers:
+  - opensource@rock-chips.com
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,px30-mipi-dsi
+      then:
+        properties:
+          clocks:
+            maxItems: 1
+          clock-names:
+            items:
+              - const: pclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3288-mipi-dsi
+      then:
+        properties:
+          clocks:
+            maxItems: 2
+          clock-names:
+            items:
+              - const: ref
+              - const: pclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3399-mipi-dsi
+      then:
+        properties:
+          clocks:
+            minItems: 4
+            maxItems: 4
+          clock-names:
+            items:
+              - const: ref
+              - const: pclk
+              - const: phy_cfg
+              - const: grf
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,px30-mipi-dsi
+              - rockchip,rk3288-mipi-dsi
+              - rockchip,rk3399-mipi-dsi
+          - const: snps,dw-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks: true
+
+  clock-names: true
+
+  phys:
+    maxItems: 1
+    description: Optional external PHY
+
+  phy-names:
+    const: dphy
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: >
+          Video port for the VOP input.
+
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Connection to the VOPB
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Connection to the VOPL
+
+        required:
+          - endpoint@0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: >
+          Video port for panel or subsequent encoder
+
+    required:
+      - port@0
+      - port@1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: apb
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the GRF to mux vopl/vopb
+
+  power-domains: true
+
+  '#address-cells':
+    const: 1
+
+  '#phy-cells':
+    const: 0
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - rockchip,grf
+  - ports
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3288-cru.h>
+
+    mipi_dsi: mipi@ff960000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
+        reg = <0xff960000 0x4000>;
+        interrupts = <0 83 4>;
+        clocks = <&cru 148>, <&cru PCLK_MIPI_DSI0>;
+        clock-names = "ref", "pclk";
+        resets = <&cru SRST_MIPIDSI0>;
+        reset-names = "apb";
+        rockchip,grf = <&grf>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mipi_in: port@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                mipi_in_vopb: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&vopb_out_mipi>;
+                };
+                mipi_in_vopl: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&vopl_out_mipi>;
+                };
+            };
+
+            mipi_out: port@1 {
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                mipi_out_panel: endpoint {
+                    remote-endpoint = <&panel_in_mipi>;
+                };
+            };
+        };
+    };
-- 
2.33.0

