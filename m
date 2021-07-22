Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407463D20D0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF9E6E9EE;
	Thu, 22 Jul 2021 09:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608EE6E935
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:26:33 +0000 (UTC)
X-UUID: fa2c934f805a4cdaa5a377bae071f7f8-20210722
X-UUID: fa2c934f805a4cdaa5a377bae071f7f8-20210722
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1122934260; Thu, 22 Jul 2021 17:26:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:26:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:26:27 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v1 2/5] dt-bindings: mediatek: display: Change format to yaml
Date: Thu, 22 Jul 2021 17:26:21 +0800
Message-ID: <20210722092624.14401-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change mediatek,dislpay.txt to mediatek,display.yaml

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.txt        | 219 ---------
 .../display/mediatek/mediatek,disp.yaml       | 432 ++++++++++++++++++
 2 files changed, 432 insertions(+), 219 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
deleted file mode 100644
index fbb59c9ddda6..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ /dev/null
@@ -1,219 +0,0 @@
-Mediatek display subsystem
-==========================
-
-The Mediatek display subsystem consists of various DISP function blocks in the
-MMSYS register space. The connections between them can be configured by output
-and input selectors in the MMSYS_CONFIG register space. Pixel clock and start
-of frame signal are distributed to the other function blocks by a DISP_MUTEX
-function block.
-
-All DISP device tree nodes must be siblings to the central MMSYS_CONFIG node.
-For a description of the MMSYS_CONFIG binding, see
-Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt.
-
-DISP function blocks
-====================
-
-A display stream starts at a source function block that reads pixel data from
-memory and ends with a sink function block that drives pixels on a display
-interface, or writes pixels back to memory. All DISP function blocks have
-their own register space, interrupt, and clock gate. The blocks that can
-access memory additionally have to list the IOMMU and local arbiter they are
-connected to.
-
-For a description of the display interface sink function blocks, see
-Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
-Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.
-
-Required properties (all function blocks):
-- compatible: "mediatek,<chip>-disp-<function>", one of
-	"mediatek,<chip>-disp-ovl"   		- overlay (4 layers, blending, csc)
-	"mediatek,<chip>-disp-ovl-2l"           - overlay (2 layers, blending, csc)
-	"mediatek,<chip>-disp-rdma"  		- read DMA / line buffer
-	"mediatek,<chip>-disp-wdma"  		- write DMA
-	"mediatek,<chip>-disp-ccorr"            - color correction
-	"mediatek,<chip>-disp-color" 		- color processor
-	"mediatek,<chip>-disp-dither"           - dither
-	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
-	"mediatek,<chip>-disp-gamma" 		- gamma correction
-	"mediatek,<chip>-disp-merge" 		- merge streams from two RDMA sources
-	"mediatek,<chip>-disp-postmask" 	- control round corner for display frame
-	"mediatek,<chip>-disp-split" 		- split stream to two encoders
-	"mediatek,<chip>-disp-ufoe"  		- data compression engine
-	"mediatek,<chip>-dsi"        		- DSI controller, see mediatek,dsi.txt
-	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
-	"mediatek,<chip>-disp-mutex" 		- display mutex
-	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173, mt8183 and mt8192.
-- reg: Physical base address and length of the function block register space
-- interrupts: The interrupt signal from the function block (required, except for
-  merge and split function blocks).
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-  For most function blocks this is just a single clock input. Only the DSI and
-  DPI controller nodes have multiple clock inputs. These are documented in
-  mediatek,dsi.txt and mediatek,dpi.txt, respectively.
-  An exception is that the mt8183 mutex is always free running with no clocks property.
-
-Required properties (DMA function blocks):
-- compatible: Should be one of
-	"mediatek,<chip>-disp-ovl"
-	"mediatek,<chip>-disp-rdma"
-	"mediatek,<chip>-disp-wdma"
-  the supported chips are mt2701, mt8167 and mt8173.
-- larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-- iommus: Should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Optional properties (RDMA function blocks):
-- mediatek,rdma-fifo-size: rdma fifo size may be different even in same SOC, add this
-  property to the corresponding rdma
-  the value is the Max value which defined in hardware data sheet.
-  mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
-  mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
-  mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
-
-Examples:
-
-mmsys: clock-controller@14000000 {
-	compatible = "mediatek,mt8173-mmsys", "syscon";
-	reg = <0 0x14000000 0 0x1000>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	#clock-cells = <1>;
-};
-
-ovl0: ovl@1400c000 {
-	compatible = "mediatek,mt8173-disp-ovl";
-	reg = <0 0x1400c000 0 0x1000>;
-	interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_OVL0>;
-	iommus = <&iommu M4U_PORT_DISP_OVL0>;
-	mediatek,larb = <&larb0>;
-};
-
-ovl1: ovl@1400d000 {
-	compatible = "mediatek,mt8173-disp-ovl";
-	reg = <0 0x1400d000 0 0x1000>;
-	interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_OVL1>;
-	iommus = <&iommu M4U_PORT_DISP_OVL1>;
-	mediatek,larb = <&larb4>;
-};
-
-rdma0: rdma@1400e000 {
-	compatible = "mediatek,mt8173-disp-rdma";
-	reg = <0 0x1400e000 0 0x1000>;
-	interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
-	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-	mediatek,larb = <&larb0>;
-	mediatek,rdma-fifosize = <8192>;
-};
-
-rdma1: rdma@1400f000 {
-	compatible = "mediatek,mt8173-disp-rdma";
-	reg = <0 0x1400f000 0 0x1000>;
-	interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
-	iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-	mediatek,larb = <&larb4>;
-};
-
-rdma2: rdma@14010000 {
-	compatible = "mediatek,mt8173-disp-rdma";
-	reg = <0 0x14010000 0 0x1000>;
-	interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_RDMA2>;
-	iommus = <&iommu M4U_PORT_DISP_RDMA2>;
-	mediatek,larb = <&larb4>;
-};
-
-wdma0: wdma@14011000 {
-	compatible = "mediatek,mt8173-disp-wdma";
-	reg = <0 0x14011000 0 0x1000>;
-	interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_WDMA0>;
-	iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-	mediatek,larb = <&larb0>;
-};
-
-wdma1: wdma@14012000 {
-	compatible = "mediatek,mt8173-disp-wdma";
-	reg = <0 0x14012000 0 0x1000>;
-	interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_WDMA1>;
-	iommus = <&iommu M4U_PORT_DISP_WDMA1>;
-	mediatek,larb = <&larb4>;
-};
-
-color0: color@14013000 {
-	compatible = "mediatek,mt8173-disp-color";
-	reg = <0 0x14013000 0 0x1000>;
-	interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_COLOR0>;
-};
-
-color1: color@14014000 {
-	compatible = "mediatek,mt8173-disp-color";
-	reg = <0 0x14014000 0 0x1000>;
-	interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_COLOR1>;
-};
-
-aal@14015000 {
-	compatible = "mediatek,mt8173-disp-aal";
-	reg = <0 0x14015000 0 0x1000>;
-	interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_AAL>;
-};
-
-gamma@14016000 {
-	compatible = "mediatek,mt8173-disp-gamma";
-	reg = <0 0x14016000 0 0x1000>;
-	interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_GAMMA>;
-};
-
-ufoe@1401a000 {
-	compatible = "mediatek,mt8173-disp-ufoe";
-	reg = <0 0x1401a000 0 0x1000>;
-	interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_UFOE>;
-};
-
-dsi0: dsi@1401b000 {
-	/* See mediatek,dsi.txt for details */
-};
-
-dpi0: dpi@1401d000 {
-	/* See mediatek,dpi.txt for details */
-};
-
-mutex: mutex@14020000 {
-	compatible = "mediatek,mt8173-disp-mutex";
-	reg = <0 0x14020000 0 0x1000>;
-	interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_MUTEX_32K>;
-};
-
-od@14023000 {
-	compatible = "mediatek,mt8173-disp-od";
-	reg = <0 0x14023000 0 0x1000>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_OD>;
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
new file mode 100644
index 000000000000..f01ecf7fcbde
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -0,0 +1,432 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,disp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek Display Subsystem Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jason-JH Lin <jason-jh.lin@mediatek.com>
+
+description: |
+  The Mediatek display subsystem consists of various DISP function blocks in the
+  MMSYS register space. The connections between them can be configured by output
+  and input selectors in the MMSYS_CONFIG register space. Pixel clock and start
+  of frame signal are distributed to the other function blocks by a DISP_MUTEX
+  function block.
+  All DISP device tree nodes must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+  DISP function blocks
+  ====================
+  A display stream starts at a source function block that reads pixel data from
+  memory and ends with a sink function block that drives pixels on a display
+  interface, or writes pixels back to memory. All DISP function blocks have
+  their own register space, interrupt, and clock gate. The blocks that can
+  access memory additionally have to list the IOMMU and local arbiter they are
+  connected to.
+
+properties:
+  compatible:
+    description: |
+      If the display function block of different soc have the same function,
+      you can use the same compatible name after it.
+      For example, if mt8183 COLOR function is the same as mt8173, then the
+      compatible of mt8183 cholud be set as:
+      compatible = "mediatek,mt8183-disp-color", "mediatek,mt8173-disp-color";
+    oneOf:
+      # OVL: overlay (4 layers, blending, csc)
+      - items:
+          - const: mediatek,mt2701-disp-ovl
+      - items:
+          - const: mediatek,mt8173-disp-ovl
+      - items:
+          - const: mediatek,mt8183-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-ovl
+              - mediatek,mt2712-disp-ovl
+          - enum:
+              - mediatek,mt2701-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-ovl
+          - enum:
+              - mediatek,mt8183-disp-ovl
+
+      # OVL2L: overlay (2 layers, blending, csc)
+      - items:
+          - const: mediatek,mt8183-disp-ovl-2l
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-ovl-2l
+          - enum:
+              - mediatek,mt8183-disp-ovl-2l
+
+      # RDMA: read DMA / line buffer
+      - items:
+          - const: mediatek,mt2701-disp-rdma
+      - items:
+          - const: mediatek,mt8173-disp-rdma
+      - items:
+          - const: mediatek,mt8183-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-rdma
+              - mediatek,mt2712-disp-rdma
+          - enum:
+              - mediatek,mt2701-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-rdma
+          - enum:
+              - mediatek,mt8183-disp-rdma
+
+      # WDMA: write DMA
+      - items:
+          - const: mediatek,mt8173-disp-wdma
+
+      # CCORR: color correction
+      - items:
+          - const: mediatek,mt8183-disp-ccorr
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-ccorr
+          - enum:
+              - mediatek,mt8183-disp-ccorr
+
+      # COLOR: color processor
+      - items:
+          - const: mediatek,mt2701-disp-color
+      - items:
+          - const: mediatek,mt8167-disp-color
+      - items:
+          - const: mediatek,mt8173-disp-color
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-color
+              - mediatek,mt2712-disp-color
+          - enum:
+              - mediatek,mt2701-disp-color
+      - items:
+          - enum:
+              - mediatek,mt8183-disp-color
+              - mediatek,mt8192-disp-color
+          - enum:
+              - mediatek,mt8173-disp-color
+
+      # DITHER
+      - items:
+          - const: mediatek,mt8183-disp-dither
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-dither
+          - enum:
+              - mediatek,mt8183-disp-dither
+
+      # AAL: adaptive ambient light controller
+      - items:
+          - const: mediatek,mt8173-disp-aal
+      - items:
+          - enum:
+              - mediatek,mt2712-disp-aal
+              - mediatek,mt8183-disp-aal
+              - mediatek,mt8192-disp-aal
+          - enum:
+              - mediatek,mt8173-disp-aal
+
+      # GAMMA: gamma correction
+      - items:
+          - const: mediatek,mt8173-disp-gamma
+      - items:
+          - const: mediatek,mt8183-disp-gamma
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-gamma
+          - enum:
+              - mediatek,mt8183-disp-gamma
+
+      # MERGE: merge streams from two RDMA sources
+
+      # POSTMASK: control round corner for display frame
+      - items:
+          - const: mediatek,mt8192-disp-postmask
+
+      # SPLIT: split stream to two encoders
+
+      # UFOE: data compression engine
+      - items:
+          - const: mediatek,mt8173-disp-ufoe
+
+      # DSI: see Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt for details.
+      - items:
+          - const: mediatek,mt2701-disp-dsi
+      - items:
+          - const: mediatek,mt8173-disp-dsi
+      - items:
+          - const: mediatek,mt8183-disp-dsi
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-dsi
+              - mediatek,mt2712-disp-dsi
+          - enum:
+              - mediatek,mt2701-disp-dsi
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-dsi
+          - enum:
+              - mediatek,mt8183-disp-dsi
+
+      # DPI: see Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml for details.
+      - items:
+          - const: mediatek,mt2701-disp-dpi
+      - items:
+          - const: mediatek,mt8173-disp-dpi
+      - items:
+          - const: mediatek,mt8183-disp-dpi
+      - items:
+          - const: mediatek,mt8192-disp-dpi
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-dpi
+              - mediatek,mt2712-disp-dpi
+          - enum:
+              - mediatek,mt2701-disp-dpi
+
+      # MUTEX: display mutex
+      - items:
+          - const: mediatek,mt2701-disp-mutex
+      - items:
+          - const: mediatek,mt2712-disp-mutex
+      - items:
+          - const: mediatek,mt8167-disp-mutex
+      - items:
+          - const: mediatek,mt8173-disp-mutex
+      - items:
+          - const: mediatek,mt8183-disp-mutex
+      - items:
+          - const: mediatek,mt8192-disp-mutex
+
+      # OD: overdrive
+      - items:
+          - const: mediatek,mt2712-disp-od
+      - items:
+          - const: mediatek,mt8173-disp-od
+
+  reg:
+    description: Physical base address and length of the function block register space.
+
+  interrupts:
+    description: The interrupt signal from the function block required,
+      except for merge and split function blocks.
+
+  clocks:
+    description: clock drivers
+      See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+      For most function blocks this is just a single clock input.
+      Only the DSI and DPI controller nodes have multiple clock inputs. These are documented
+      in mediatek,dsi.txt and mediatek,dpi.yaml, respectively.
+      An exception is that the mt8183 mutex is always free running with no clocks property.
+
+  mediatek,larb:
+    description: The compatible property should be one of DMA function blocks,
+      such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      Should contain a phandle pointing to the local arbiter device as defined in
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
+      It must sort according to the local arbiter index, like larb0, larb1, larb2...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  iommus:
+    description: The compatible property should be one of DMA function blocks,
+      such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      Should point to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,rdma-fifo-size:
+    description: RDMA function blocks
+      rdma fifo size may be different even in same SOC, add this property to the
+      corresponding rdma.
+      The value below is the Max value which defined in hardware data sheet
+      mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
+      mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
+      mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8*1024, 5*1024, 2*1024]
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  mediatek,gce-client-reg:
+    description: The register of display function block to be set by gce.
+      There are 4 arguments in this property, such as gce node, subsys id, offset
+      and register size. The subsys id that is mapping to the register of display
+      function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+      For example, The mediatek,gce-client-reg property of OVL in mt8173 is
+      <&gce SUBSYS_1400XXXX 0xc000 0x1000>.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    ovl0: ovl@1400c000 {
+        compatible = "mediatek,mt8173-disp-ovl";
+        reg = <0 0x1400c000 0 0x1000>;
+        interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_OVL0>;
+        iommus = <&iommu M4U_PORT_DISP_OVL0>;
+        mediatek,larb = <&larb0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+    };
+
+    ovl1: ovl@1400d000 {
+        compatible = "mediatek,mt8173-disp-ovl";
+        reg = <0 0x1400d000 0 0x1000>;
+        interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_OVL1>;
+        iommus = <&iommu M4U_PORT_DISP_OVL1>;
+        mediatek,larb = <&larb4>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+    };
+
+    rdma0: rdma@1400e000 {
+        compatible = "mediatek,mt8173-disp-rdma";
+        reg = <0 0x1400e000 0 0x1000>;
+        interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+        iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+        mediatek,larb = <&larb0>;
+        mediatek,rdma-fifosize = <8192>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+    };
+
+    rdma1: rdma@1400f000 {
+        compatible = "mediatek,mt8173-disp-rdma";
+        reg = <0 0x1400f000 0 0x1000>;
+        interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+        iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+        mediatek,larb = <&larb4>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+    };
+
+    rdma2: rdma@14010000 {
+        compatible = "mediatek,mt8173-disp-rdma";
+        reg = <0 0x14010000 0 0x1000>;
+        interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_RDMA2>;
+        iommus = <&iommu M4U_PORT_DISP_RDMA2>;
+        mediatek,larb = <&larb4>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
+    };
+
+    wdma0: wdma@14011000 {
+        compatible = "mediatek,mt8173-disp-wdma";
+        reg = <0 0x14011000 0 0x1000>;
+        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+        iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+        mediatek,larb = <&larb0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+    };
+
+    wdma1: wdma@14012000 {
+        compatible = "mediatek,mt8173-disp-wdma";
+        reg = <0 0x14012000 0 0x1000>;
+        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_WDMA1>;
+        iommus = <&iommu M4U_PORT_DISP_WDMA1>;
+        mediatek,larb = <&larb4>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+    };
+
+    color0: color@14013000 {
+        compatible = "mediatek,mt8173-disp-color";
+        reg = <0 0x14013000 0 0x1000>;
+        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+    };
+
+    color1: color@14014000 {
+        compatible = "mediatek,mt8173-disp-color";
+        reg = <0 0x14014000 0 0x1000>;
+        interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_COLOR1>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
+    };
+
+    aal@14015000 {
+        compatible = "mediatek,mt8173-disp-aal";
+        reg = <0 0x14015000 0 0x1000>;
+        interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_AAL>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+    };
+
+    gamma@14016000 {
+        compatible = "mediatek,mt8173-disp-gamma";
+        reg = <0 0x14016000 0 0x1000>;
+        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+    };
+
+    ufoe@1401a000 {
+        compatible = "mediatek,mt8173-disp-ufoe";
+        reg = <0 0x1401a000 0 0x1000>;
+        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_UFOE>;
+    };
+
+    dsi0: dsi@1401b000 {
+        /* See mediatek,dsi.txt for details */
+    };
+
+    dpi0: dpi@1401d000 {
+        /* See mediatek,dpi.yaml for details */
+    };
+
+    mutex: mutex@14020000 {
+        compatible = "mediatek,mt8173-disp-mutex";
+        reg = <0 0x14020000 0 0x1000>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_MUTEX_32K>;
+        };
+
+    od@14023000 {
+        compatible = "mediatek,mt8173-disp-od";
+        reg = <0 0x14023000 0 0x1000>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_OD>;
+    };
-- 
2.18.0

