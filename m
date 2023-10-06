Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D87BB26F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8282010E2EB;
	Fri,  6 Oct 2023 07:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7876E10E242
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:38:43 +0000 (UTC)
X-UUID: 5c962938641b11eea33bb35ae8d461a2-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z8ak7/r1AEty+IF2PEGBOyDYJC+zgGOQGr1zm8EoeFE=; 
 b=hePduZWsFm9H4KxRfUOixzQiwD3smuvPFDqKlTtzsja6KfTxL6qFpqUtS7M1cL+GoMvqPKcM90nQh7PQhRBwJ7uuOQK+SRnEhAFeyjfR1lS2e1iissYnhwKsqYNIOYGZP7fEiSyv/EbKn3G0GvUE0ikttRNcKBrf1dP+1kecN6Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:207e2d0b-13af-4df3-9ba8-014619b5aeaa, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:3072d7c3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 5c962938641b11eea33bb35ae8d461a2-20231006
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 223332423; Fri, 06 Oct 2023 15:38:37 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:36 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 14/23] drm/mediatek: Add component ID to component match
 structure
Date: Fri, 6 Oct 2023 15:38:22 +0800
Message-ID: <20231006073831.10402-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add component ID to component match structure so we can
configure them with a for-loop.

The main reason we do such code refactoring is that
there is a new hardware component called "Padding" since
MT8188, while MT8195 doesn't have this module, we can't
use the original logic to manage the components.

While MT8195 does not define Padding in the device tree,
the corresponding components will be NULL and being skipped
by the functions.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 69 ++++++++-----------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 72758e41b1e6..8a52d1301e04 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -52,6 +52,7 @@ enum mtk_ovl_adaptor_comp_id {
 
 struct ovl_adaptor_comp_match {
 	enum mtk_ovl_adaptor_comp_type type;
+	enum mtk_ddp_comp_id comp_id;
 	int alias_id;
 };
 
@@ -68,19 +69,19 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 };
 
 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
-	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
-	[OVL_ADAPTOR_MDP_RDMA0]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 0 },
-	[OVL_ADAPTOR_MDP_RDMA1]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 1 },
-	[OVL_ADAPTOR_MDP_RDMA2]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 2 },
-	[OVL_ADAPTOR_MDP_RDMA3]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 3 },
-	[OVL_ADAPTOR_MDP_RDMA4]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 4 },
-	[OVL_ADAPTOR_MDP_RDMA5]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 5 },
-	[OVL_ADAPTOR_MDP_RDMA6]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 6 },
-	[OVL_ADAPTOR_MDP_RDMA7]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 7 },
-	[OVL_ADAPTOR_MERGE0]	= { OVL_ADAPTOR_TYPE_MERGE, 1 },
-	[OVL_ADAPTOR_MERGE1]	= { OVL_ADAPTOR_TYPE_MERGE, 2 },
-	[OVL_ADAPTOR_MERGE2]	= { OVL_ADAPTOR_TYPE_MERGE, 3 },
-	[OVL_ADAPTOR_MERGE3]	= { OVL_ADAPTOR_TYPE_MERGE, 4 },
+	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0 },
+	[OVL_ADAPTOR_MDP_RDMA0] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA0, 0 },
+	[OVL_ADAPTOR_MDP_RDMA1] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA1, 1 },
+	[OVL_ADAPTOR_MDP_RDMA2] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA2, 2 },
+	[OVL_ADAPTOR_MDP_RDMA3] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA3, 3 },
+	[OVL_ADAPTOR_MDP_RDMA4] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA4, 4 },
+	[OVL_ADAPTOR_MDP_RDMA5] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA5, 5 },
+	[OVL_ADAPTOR_MDP_RDMA6] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA6, 6 },
+	[OVL_ADAPTOR_MDP_RDMA7] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA7, 7 },
+	[OVL_ADAPTOR_MERGE0] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE1, 1 },
+	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2 },
+	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3 },
+	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4 },
 };
 
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -314,36 +315,26 @@ size_t mtk_ovl_adaptor_get_num_formats(struct device *dev)
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
 {
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE1);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE2);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE3);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE4);
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i])
+			continue;
+		mtk_mutex_add_comp(mutex, comp_matches[i].comp_id);
+	}
 }
 
 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
 {
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA3);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA4);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA5);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA6);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA7);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE1);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE2);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE3);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE4);
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i])
+			continue;
+		mtk_mutex_remove_comp(mutex, comp_matches[i].comp_id);
+	}
 }
 
 void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
-- 
2.18.0

