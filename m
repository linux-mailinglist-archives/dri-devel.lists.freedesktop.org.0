Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7371B99B1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5156E0A8;
	Mon, 27 Apr 2020 08:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6989FC8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 4CEBA2A018F
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v8 07/10] dt-bindings: display: add i.MX6 MIPI DSI host
 controller doc
Date: Mon, 27 Apr 2020 11:19:49 +0300
Message-Id: <20200427081952.3536741-8-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
References: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martyn Welch <martyn.welch@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This provides an example DT binding for the MIPI DSI host controller
present on the i.MX6 SoC based on Synopsis DesignWare v1.01 IP.

Cc: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Tested-by: Adrian Pop <pop.adrian61@gmail.com>
Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
Changes since v7:
  - Clarified port@0,1 descriptions, marked them as required and
  added missing port@0 in example (Laurent)

Changes since v6:
  - Added ref to the newly created snps,dw-mipi-dsi.yaml (Laurent)
  - Moved *-cells properties outside patternProperties (Laurent)
  - Removed the panel port documentation (Laurent)
  - Wrapped lines at 80 chars, typo fixes, sort includes (Laurent)

Changes since v5:
  - Fixed missing reg warning (Fabio)
  - Updated dt-schema and fixed warnings (Rob)

Changes since v4:
  - Fixed yaml binding to pass `make dt_binding_check dtbs_check`
  and addressed received binding feedback (Rob)

Changes since v3:
  - Added commit message (Neil)
  - Converted to yaml format (Neil)
  - Minor dt node + driver fixes (Rob)
  - Added small panel example to the host controller binding

Changes since v2:
  - Fixed commit tags (Emil)
---
 .../display/imx/fsl,mipi-dsi-imx6.yaml        | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
new file mode 100644
index 0000000000000..c2c3489e63fa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,mipi-dsi-imx6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX6 DW MIPI DSI Host Controller
+
+maintainers:
+  - Adrian Ratiu <adrian.ratiu@collabora.com>
+
+description: |
+  The i.MX6 DSI host controller is a Synopsys DesignWare MIPI DSI v1.01
+  IP block with a companion PHY IP.
+
+  These DT bindings follow the Synopsys DW MIPI DSI bindings defined in
+  Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt with
+  the following device-specific properties.
+
+allOf:
+  - $ref: ../bridge/snps,dw-mipi-dsi.yaml#
+
+properties:
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  compatible:
+    items:
+      - const: fsl,imx6q-mipi-dsi
+      - const: snps,dw-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+      - description: DSI bus clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: pclk
+
+  fsl,gpr:
+    description:
+      Phandle to the iomuxc-gpr region containing the multiplexer ctrl register.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  ports:
+    type: object
+    description: |
+      A node containing DSI input & output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+    properties:
+      port@0:
+        type: object
+        description:
+          DSI input port connected to a parallel RGB LTDC output port.
+
+      port@1:
+        type: object
+        description:
+          DSI serial RGB output port connected to a panel or bridge input port.
+
+    required:
+      - port@0
+      - port@1
+
+additionalProperties: false
+
+patternProperties:
+  "^panel@[0-3]$":
+    type: object
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+examples:
+  - |+
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dsi: dsi@21e0000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
+        reg = <0x021e0000 0x4000>;
+        interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
+        fsl,gpr = <&gpr>;
+        clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
+                 <&clks IMX6QDL_CLK_MIPI_IPG>;
+        clock-names = "ref", "pclk";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                mipi_mux_0: endpoint {
+                    remote-endpoint = <&ipu1_di0_mipi>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                dsi_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+
+        panel@0 {
+            compatible = "sharp,ls032b3sx01";
+            reg = <0>;
+            reset-gpios = <&gpio6 8 GPIO_ACTIVE_LOW>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    panel_in: endpoint {
+                        remote-endpoint = <&dsi_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
