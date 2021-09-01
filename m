Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268073FD573
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 10:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF906E134;
	Wed,  1 Sep 2021 08:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5496E134
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 08:32:28 +0000 (UTC)
X-UUID: e089cb96eca044f1b7190c1bbe18e0d7-20210901
X-UUID: e089cb96eca044f1b7190c1bbe18e0d7-20210901
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 227080881; Wed, 01 Sep 2021 16:32:27 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 16:32:25 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:32:24 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6,
 05/15] dt-bindings: media: mtk-vcodec: Separate video encoder and
 decoder dt-bindings
Date: Wed, 1 Sep 2021 16:32:05 +0800
Message-ID: <20210901083215.25984-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Decoder will use component framework to manage hardware, it is big
difference with encoder.

Reviewed-by: Rob Herring<robh@kernel.org>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/mediatek,vcodec-decoder.yaml        | 175 +++++++++++++++++
 .../media/mediatek,vcodec-encoder.yaml        | 185 ++++++++++++++++++
 .../bindings/media/mediatek-vcodec.txt        | 130 ------------
 3 files changed, 360 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
new file mode 100644
index 000000000000..b6b97110024d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Video Decode Accelerator With Component
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |+
+  Mediatek Video Decode is the video decode hardware present in Mediatek
+  SoCs which supports high resolution decoding functionalities.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8173-vcodec-dec
+      - mediatek,mt8183-vcodec-dec
+
+  reg:
+    maxItems: 12
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: vcodecpll
+      - const: univpll_d2
+      - const: clk_cci400_sel
+      - const: vdec_sel
+      - const: vdecpll
+      - const: vencpll
+      - const: venc_lt_sel
+      - const: vdec_bus_clk_src
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  assigned-clock-rates: true
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      Must contain the local arbiters in the current Socs.
+
+  mediatek,vpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description:
+      Describes point to vpu.
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description:
+      Describes point to scp.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - assigned-clocks
+  - assigned-clock-parents
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8183-vcodec-dec
+
+    then:
+      required:
+        - mediatek,scp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-vcodec-dec
+
+    then:
+      required:
+        - mediatek,vpu
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    vcodec_dec: vcodec@16000000 {
+      compatible = "mediatek,mt8173-vcodec-dec";
+      reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
+          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
+          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
+          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
+          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
+          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
+          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
+          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
+          <0 0x16026800 0 0x800>,   /*VP8_VD*/
+          <0 0x16027000 0 0x800>,   /*VP6_VD*/
+          <0 0x16027800 0 0x800>,   /*VP8_VL*/
+          <0 0x16028400 0 0x400>;   /*VP9_VD*/
+      interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+      mediatek,larb = <&larb1>;
+      iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
+      mediatek,vpu = <&vpu>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
+      clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
+             <&topckgen CLK_TOP_UNIVPLL_D2>,
+             <&topckgen CLK_TOP_CCI400_SEL>,
+             <&topckgen CLK_TOP_VDEC_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL>,
+             <&apmixedsys CLK_APMIXED_VENCPLL>,
+             <&topckgen CLK_TOP_VENC_LT_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL_370P5>;
+      clock-names = "vcodecpll",
+                  "univpll_d2",
+                  "clk_cci400_sel",
+                  "vdec_sel",
+                  "vdecpll",
+                  "vencpll",
+                  "venc_lt_sel",
+                  "vdec_bus_clk_src";
+      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
+                      <&topckgen CLK_TOP_CCI400_SEL>,
+                      <&topckgen CLK_TOP_VDEC_SEL>,
+                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
+                      <&apmixedsys CLK_APMIXED_VENCPLL>;
+      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
+                             <&topckgen CLK_TOP_UNIVPLL_D2>,
+                             <&topckgen CLK_TOP_VCODECPLL>;
+      assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
new file mode 100644
index 000000000000..6f28394e8ce3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -0,0 +1,185 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Video Encode Accelerator With Component
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |+
+  Mediatek Video Encode is the video encode hardware present in Mediatek
+  SoCs which supports high resolution encoding functionalities.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8173-vcodec-enc-vp8
+      - mediatek,mt8173-vcodec-enc
+      - mediatek,mt8183-vcodec-enc
+      - mediatek,mt8192-vcodec-enc
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
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      Must contain the local arbiters in the current Socs.
+
+  mediatek,vpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description:
+      Describes point to vpu.
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description:
+      Describes point to scp.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - assigned-clocks
+  - assigned-clock-parents
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8183-vcodec-enc
+              - mediatek,mt8192-vcodec-enc
+
+    then:
+      required:
+        - mediatek,scp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-vcodec-enc-vp8
+              - mediatek,mt8173-vcodec-enc
+
+    then:
+      required:
+        - mediatek,vpu
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8173-vcodec-enc
+            - mediatek,mt8192-vcodec-enc
+            - mediatek,mt8173-vcodec-enc
+
+    then:
+      properties:
+        clock:
+          items:
+            minItems: 1
+            maxItems: 1
+        clock-names:
+          items:
+            - const: venc_sel
+    else:  # for vp8 hw decoder
+      properties:
+        clock:
+          items:
+            minItems: 1
+            maxItems: 1
+        clock-names:
+          items:
+            - const: venc_lt_sel
+ 
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    vcodec_enc_avc: vcodec@18002000 {
+      compatible = "mediatek,mt8173-vcodec-enc";
+      reg = <0 0x18002000 0 0x1000>;
+      interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+      iommus = <&iommu M4U_PORT_VENC_RCPU>,
+             <&iommu M4U_PORT_VENC_REC>,
+             <&iommu M4U_PORT_VENC_BSDMA>,
+             <&iommu M4U_PORT_VENC_SV_COMV>,
+             <&iommu M4U_PORT_VENC_RD_COMV>,
+             <&iommu M4U_PORT_VENC_CUR_LUMA>,
+             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
+             <&iommu M4U_PORT_VENC_REF_LUMA>,
+             <&iommu M4U_PORT_VENC_REF_CHROMA>,
+             <&iommu M4U_PORT_VENC_NBM_RDMA>,
+             <&iommu M4U_PORT_VENC_NBM_WDMA>;
+      mediatek,larb = <&larb3>;
+      mediatek,vpu = <&vpu>;
+      clocks = <&topckgen CLK_TOP_VENC_SEL>;
+      clock-names = "venc_sel";
+      assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+    };
+
+    vcodec_enc_vp8: vcodec@19002000 {
+      compatible = "mediatek,mt8173-vcodec-enc-vp8";
+      reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
+      interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+      iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
+             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
+             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
+             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
+             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+      mediatek,larb = <&larb5>;
+      mediatek,vpu = <&vpu>;
+      clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+      clock-names = "venc_lt_sel";
+      assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+      assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
deleted file mode 100644
index c44a6e6943af..000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ /dev/null
@@ -1,130 +0,0 @@
-Mediatek Video Codec
-
-Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
-supports high resolution encoding and decoding functionalities.
-
-Required properties:
-- compatible : must be one of the following string:
-  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
-  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
-  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
-  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
-  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
-  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
-- reg : Physical base address of the video codec registers and length of
-  memory mapped region.
-- interrupts : interrupt number to the cpu.
-- mediatek,larb : must contain the local arbiters in the current Socs.
-- clocks : list of clock specifiers, corresponding to entries in
-  the clock-names property.
-- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
-  contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
-  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
-  "vdec_bus_clk_src".
-- iommus : should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-- dma-ranges : describes the dma address range space that the codec hw access.
-One of the two following nodes:
-- mediatek,vpu : the node of the video processor unit, if using VPU.
-- mediatek,scp : the node of the SCP unit, if using SCP.
-
-
-Example:
-
-vcodec_dec: vcodec@16000000 {
-    compatible = "mediatek,mt8173-vcodec-dec";
-    reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
-          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
-          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
-          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
-          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
-          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
-          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
-          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
-          <0 0x16026800 0 0x800>,   /*VP8_VD*/
-          <0 0x16027000 0 0x800>,   /*VP6_VD*/
-          <0 0x16027800 0 0x800>,   /*VP8_VL*/
-          <0 0x16028400 0 0x400>;   /*VP9_VD*/
-    interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-    mediatek,larb = <&larb1>;
-    iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
-             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
-    mediatek,vpu = <&vpu>;
-    power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
-    clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
-             <&topckgen CLK_TOP_UNIVPLL_D2>,
-             <&topckgen CLK_TOP_CCI400_SEL>,
-             <&topckgen CLK_TOP_VDEC_SEL>,
-             <&topckgen CLK_TOP_VCODECPLL>,
-             <&apmixedsys CLK_APMIXED_VENCPLL>,
-             <&topckgen CLK_TOP_VENC_LT_SEL>,
-             <&topckgen CLK_TOP_VCODECPLL_370P5>;
-    clock-names = "vcodecpll",
-                  "univpll_d2",
-                  "clk_cci400_sel",
-                  "vdec_sel",
-                  "vdecpll",
-                  "vencpll",
-                  "venc_lt_sel",
-                  "vdec_bus_clk_src";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
-                      <&topckgen CLK_TOP_CCI400_SEL>,
-                      <&topckgen CLK_TOP_VDEC_SEL>,
-                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
-                      <&apmixedsys CLK_APMIXED_VENCPLL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
-                             <&topckgen CLK_TOP_UNIVPLL_D2>,
-                             <&topckgen CLK_TOP_VCODECPLL>;
-    assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
-  };
-
-vcodec_enc_avc: vcodec@18002000 {
-    compatible = "mediatek,mt8173-vcodec-enc";
-    reg = <0 0x18002000 0 0x1000>;
-    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
-    iommus = <&iommu M4U_PORT_VENC_RCPU>,
-             <&iommu M4U_PORT_VENC_REC>,
-             <&iommu M4U_PORT_VENC_BSDMA>,
-             <&iommu M4U_PORT_VENC_SV_COMV>,
-             <&iommu M4U_PORT_VENC_RD_COMV>,
-             <&iommu M4U_PORT_VENC_CUR_LUMA>,
-             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
-             <&iommu M4U_PORT_VENC_REF_LUMA>,
-             <&iommu M4U_PORT_VENC_REF_CHROMA>,
-             <&iommu M4U_PORT_VENC_NBM_RDMA>,
-             <&iommu M4U_PORT_VENC_NBM_WDMA>;
-    mediatek,larb = <&larb3>;
-    mediatek,vpu = <&vpu>;
-    clocks = <&topckgen CLK_TOP_VENC_SEL>;
-    clock-names = "venc_sel";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
-  };
-
-vcodec_enc_vp8: vcodec@19002000 {
-    compatible = "mediatek,mt8173-vcodec-enc-vp8";
-    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
-    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
-    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
-             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
-             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
-             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
-             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
-             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
-             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
-             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
-             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
-    mediatek,larb = <&larb5>;
-    mediatek,vpu = <&vpu>;
-    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
-    clock-names = "venc_lt_sel";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
-  };
-- 
2.25.1

