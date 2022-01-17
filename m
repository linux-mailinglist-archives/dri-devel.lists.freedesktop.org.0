Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8237C49025A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4EF10F044;
	Mon, 17 Jan 2022 07:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C6310E910
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:05:42 +0000 (UTC)
X-UUID: 67f1cd228a5d43eab20cc3452fb1b444-20220117
X-UUID: 67f1cd228a5d43eab20cc3452fb1b444-20220117
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2115300835; Mon, 17 Jan 2022 15:05:39 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 15:05:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 15:05:36 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Joerg Roedel <jroedel@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
Subject: [PATCH v10 01/13] dt-binding: mediatek: Get rid of mediatek,
 larb for multimedia HW
Date: Mon, 17 Jan 2022 15:04:58 +0800
Message-ID: <20220117070510.17642-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117070510.17642-1-yong.wu@mediatek.com>
References: <20220117070510.17642-1-yong.wu@mediatek.com>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, yong.wu@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After adding device_link between the consumer with the smi-larbs,
if the consumer call its owner pm_runtime_get(_sync), the
pm_runtime_get(_sync) of smi-larb and smi-common will be called
automatically. Thus, the consumer don't need this property.

And IOMMU also know which larb this consumer connects with from
iommu id in the "iommus=" property.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/mediatek/mediatek,disp.txt          | 9 ---------
 .../bindings/media/mediatek,vcodec-decoder.yaml          | 7 -------
 .../bindings/media/mediatek,vcodec-encoder.yaml          | 8 --------
 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml | 9 ---------
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml | 9 ---------
 Documentation/devicetree/bindings/media/mediatek-mdp.txt | 8 --------
 6 files changed, 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 78044c340e20..8b575e11bcec 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -61,8 +61,6 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
   the supported chips are mt2701, mt8167 and mt8173.
-- larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
@@ -91,7 +89,6 @@ ovl0: ovl@1400c000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_OVL0>;
 	iommus = <&iommu M4U_PORT_DISP_OVL0>;
-	mediatek,larb = <&larb0>;
 };
 
 ovl1: ovl@1400d000 {
@@ -101,7 +98,6 @@ ovl1: ovl@1400d000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_OVL1>;
 	iommus = <&iommu M4U_PORT_DISP_OVL1>;
-	mediatek,larb = <&larb4>;
 };
 
 rdma0: rdma@1400e000 {
@@ -111,7 +107,6 @@ rdma0: rdma@1400e000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-	mediatek,larb = <&larb0>;
 	mediatek,rdma-fifosize = <8192>;
 };
 
@@ -122,7 +117,6 @@ rdma1: rdma@1400f000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-	mediatek,larb = <&larb4>;
 };
 
 rdma2: rdma@14010000 {
@@ -132,7 +126,6 @@ rdma2: rdma@14010000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA2>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA2>;
-	mediatek,larb = <&larb4>;
 };
 
 wdma0: wdma@14011000 {
@@ -142,7 +135,6 @@ wdma0: wdma@14011000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_WDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-	mediatek,larb = <&larb0>;
 };
 
 wdma1: wdma@14012000 {
@@ -152,7 +144,6 @@ wdma1: wdma@14012000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_WDMA1>;
 	iommus = <&iommu M4U_PORT_DISP_WDMA1>;
-	mediatek,larb = <&larb4>;
 };
 
 color0: color@14013000 {
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index df1d677098fd..9b179bb44dfb 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -61,12 +61,6 @@ properties:
     description: |
       Describes the physical address space of IOMMU maps to memory.
 
-  mediatek,larb:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    maxItems: 1
-    description: |
-      Must contain the local arbiters in the current Socs.
-
   mediatek,vpu:
     $ref: /schemas/types.yaml#/definitions/phandle
     maxItems: 1
@@ -137,7 +131,6 @@ examples:
           <0x16027800 0x800>,   /*VP8_VL*/
           <0x16028400 0x400>;   /*VP9_VD*/
       interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-      mediatek,larb = <&larb1>;
       iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
              <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
              <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index b72c1a50e89e..e7b65a91c92c 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -53,12 +53,6 @@ properties:
     description: |
       Describes the physical address space of IOMMU maps to memory.
 
-  mediatek,larb:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    maxItems: 1
-    description: |
-      Must contain the local arbiters in the current Socs.
-
   mediatek,vpu:
     $ref: /schemas/types.yaml#/definitions/phandle
     maxItems: 1
@@ -157,7 +151,6 @@ examples:
              <&iommu M4U_PORT_VENC_REF_CHROMA>,
              <&iommu M4U_PORT_VENC_NBM_RDMA>,
              <&iommu M4U_PORT_VENC_NBM_WDMA>;
-      mediatek,larb = <&larb3>;
       mediatek,vpu = <&vpu>;
       clocks = <&topckgen CLK_TOP_VENC_SEL>;
       clock-names = "venc_sel";
@@ -178,7 +171,6 @@ examples:
              <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
              <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
              <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
-      mediatek,larb = <&larb5>;
       mediatek,vpu = <&vpu>;
       clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
       clock-names = "venc_lt_sel";
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index 9b87f036f178..052e752157b4 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -42,13 +42,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,larb:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: |
-      Must contain the local arbiters in the current Socs, see
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-      for details.
-
   iommus:
     maxItems: 2
     description: |
@@ -63,7 +56,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - mediatek,larb
   - iommus
 
 additionalProperties: false
@@ -83,7 +75,6 @@ examples:
       clock-names = "jpgdec-smi",
                     "jpgdec";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-      mediatek,larb = <&larb2>;
       iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
                <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
     };
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index fcd9b829e036..8bfdfdfaba59 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -35,13 +35,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,larb:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: |
-      Must contain the local arbiters in the current Socs, see
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-      for details.
-
   iommus:
     maxItems: 2
     description: |
@@ -56,7 +49,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - mediatek,larb
   - iommus
 
 additionalProperties: false
@@ -75,7 +67,6 @@ examples:
       clocks =  <&imgsys CLK_IMG_VENC>;
       clock-names = "jpgenc";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-      mediatek,larb = <&larb2>;
       iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
                <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
     };
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index caa24943da33..53ef26e2c857 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -27,9 +27,6 @@ Required properties (DMA function blocks, child node):
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
-- mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-  for details.
 
 Example:
 	mdp_rdma0: rdma@14001000 {
@@ -40,7 +37,6 @@ Example:
 			 <&mmsys CLK_MM_MUTEX_32K>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-		mediatek,larb = <&larb0>;
 		mediatek,vpu = <&vpu>;
 	};
 
@@ -51,7 +47,6 @@ Example:
 			 <&mmsys CLK_MM_MUTEX_32K>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-		mediatek,larb = <&larb4>;
 	};
 
 	mdp_rsz0: rsz@14003000 {
@@ -81,7 +76,6 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WDMA>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	mdp_wrot0: wrot@14007000 {
@@ -90,7 +84,6 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WROT0>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WROT0>;
-		mediatek,larb = <&larb0>;
 	};
 
 	mdp_wrot1: wrot@14008000 {
@@ -99,5 +92,4 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WROT1>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WROT1>;
-		mediatek,larb = <&larb4>;
 	};
-- 
2.18.0

