Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4123D2121
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0D6EB2B;
	Thu, 22 Jul 2021 09:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980B66E9D8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:45:58 +0000 (UTC)
X-UUID: 6b71f5171cc341b3b2b27483f0cb89d0-20210722
X-UUID: 6b71f5171cc341b3b2b27483f0cb89d0-20210722
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1727153762; Thu, 22 Jul 2021 17:45:54 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:52 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2 01/14] dt-bindings: mediatek: add vdosys1 RDMA/MERGE
 definition for mt8195
Date: Thu, 22 Jul 2021 17:45:38 +0800
Message-ID: <20210722094551.15255-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vdosys1 RDMA and MERGE definition.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.yaml       | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index aac1796e3f6b..b5a80c683ef6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -230,6 +230,14 @@ properties:
       - items:
           - const: mediatek,mt8173-disp-od
 
+      # RDMA: read DMA
+      - items:
+          - const: mediatek,mt8195-vdo1-rdma
+
+      # MERGE: merge streams from two RDMA sources
+      - items:
+          - const: mediatek,mt8195-vdo1-merge
+
   reg:
     description: Physical base address and length of the function block register space.
 
@@ -461,4 +469,26 @@ examples:
         /* See mediatek,dsc.yaml for details */
     };
 
+    vdo1_rdma0: vdo1_rdma@1c104000 {
+        compatible = "mediatek,mt8195-vdo1-rdma";
+        reg = <0 0x1c104000 0 0x1000>;
+        interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+        iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x4000 0x1000>;
+    };
+
+    merge1: disp_vpp_merge@1c10c000 {
+        compatible = "mediatek,mt8195-vdo1-merge";
+        reg = <0 0x1c10c000 0 0x1000>;
+        interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+                 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+        clock-names = "merge","merge_async";
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xc000 0x1000>;
+        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
+    };
+
 ...
-- 
2.18.0

