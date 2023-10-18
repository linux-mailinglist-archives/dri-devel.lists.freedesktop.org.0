Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF77CD311
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 06:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA3F10E376;
	Wed, 18 Oct 2023 04:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FF410E366
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 04:37:03 +0000 (UTC)
X-UUID: f72bf8766d6f11ee8051498923ad61e6-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oOExZfi3ZwsinMwpbhDKJn1i8xkobiv3Uwmdg8bEDNU=; 
 b=gU1CdrYaNfQq1ME/zVDeCNhBRIJ3roiTwiExWG3/LscxIdKpWXhhELt+9o4iCaxsoDvXfDZ9xOtOD2xjiCuCaoDDmkdWzKCQNqAonaoemIy2n9w/iUfb/m6AsA/4ua/EqJoDqPQxmKAjIpr4O1JE3m+kuLAh9L9gljJmb4pPJC0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:3d724397-68dd-4940-a302-ab3ac968c132, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:b054ecf0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f72bf8766d6f11ee8051498923ad61e6-20231018
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 132285120; Wed, 18 Oct 2023 12:36:55 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 12:36:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 12:36:53 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 14/23] drm/mediatek: Add component ID to component match
 structure
Date: Wed, 18 Oct 2023 12:36:41 +0800
Message-ID: <20231018043650.22532-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231018043650.22532-1-shawn.sung@mediatek.com>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 69 ++++++++-----------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 094e508ac70b..60e5dfe9ef0d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -51,6 +51,7 @@ enum mtk_ovl_adaptor_comp_id {
 
 struct ovl_adaptor_comp_match {
 	enum mtk_ovl_adaptor_comp_type type;
+	enum mtk_ddp_comp_id comp_id;
 	int alias_id;
 };
 
@@ -67,19 +68,19 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
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
@@ -313,36 +314,26 @@ size_t mtk_ovl_adaptor_get_num_formats(struct device *dev)
 
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

