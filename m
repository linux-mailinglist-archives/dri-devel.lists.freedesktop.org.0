Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE47BB271
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850310E4B4;
	Fri,  6 Oct 2023 07:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D74710E2FD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:38:47 +0000 (UTC)
X-UUID: 5ebb394c641b11ee8051498923ad61e6-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+phuYPpu7Mh8BOkEUPGHIqYuIqzyNszw2Kd7do09Ce0=; 
 b=aad3SAO/YERLBIwuzYnIysuBHUCO0LUmN4gJWvE3qvftBntxF6YCe4uydKqiO3gXM5TzteFDknp+9drmB6ydY4Ek8IqdGEEQ4AaN5acT0aXjDqZ0QAnzPk6SovVYpVX6FDCHVDjb5A0naE552Hky9GOI59/mexIOsva50/E9nJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:8b449e95-53d0-492c-89b3-8c8af0a904f9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:d3adc014-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5ebb394c641b11ee8051498923ad61e6-20231006
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1240372402; Fri, 06 Oct 2023 15:38:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:36 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 15/23] drm/mediatek: Manage component's clock with function
 pointers
Date: Fri, 6 Oct 2023 15:38:23 +0800
Message-ID: <20231006073831.10402-16-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.901800-8.000000
X-TMASE-MatchedRID: uYOEf1I6Oo0b7D0aLEL5Ob2xWbKjBfWPy1y/jIuoZZ4x3z93vsEFGlaP
 6AhhdqyDkPk8oBU71Swz42d4hTjtM6h+3Rlbev+JkDpLRKO9xhSZ2scyRQcer19eTSR8I6du4uR
 3pP7Rlrc+1MUqk5HN+7u2F2cs3EHUIkzJoP2DD5eeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
 vEGAbTDud4SwFYISTISMMJHxYBUh/wFqjjvz1R1GIjnmkTMSStkmemp0mkTw3rTT0Iiifzbmccc
 uOL7tzOK8TLV5jhmHIRwPjwyc1QjHmVKZusLp922v9OjYWA2uMMswg45VMfPXY3pGDmoik6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.901800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1F53102C682366CFD9DEC59423D77EBD05D637BFB6549CA0DA4562085E9BC4F52000:8
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
 linux-mediatek@lists.infradead.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By registering component related functions to the pointers,
we can easily manage them within a for-loop and simplify the
logic of clock control significantly.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 111 +++++++-----------
 1 file changed, 44 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 8a52d1301e04..84133303a6ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -54,6 +54,7 @@ struct ovl_adaptor_comp_match {
 	enum mtk_ovl_adaptor_comp_type type;
 	enum mtk_ddp_comp_id comp_id;
 	int alias_id;
+	const struct mtk_ddp_comp_funcs *funcs;
 };
 
 struct mtk_disp_ovl_adaptor {
@@ -68,20 +69,35 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
 };
 
+static const struct mtk_ddp_comp_funcs _ethdr = {
+	.clk_enable = mtk_ethdr_clk_enable,
+	.clk_disable = mtk_ethdr_clk_disable,
+};
+
+static const struct mtk_ddp_comp_funcs _merge = {
+	.clk_enable = mtk_merge_clk_enable,
+	.clk_disable = mtk_merge_clk_disable,
+};
+
+static const struct mtk_ddp_comp_funcs _rdma = {
+	.clk_enable = mtk_mdp_rdma_clk_enable,
+	.clk_disable = mtk_mdp_rdma_clk_disable,
+};
+
 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
-	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0 },
-	[OVL_ADAPTOR_MDP_RDMA0] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA0, 0 },
-	[OVL_ADAPTOR_MDP_RDMA1] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA1, 1 },
-	[OVL_ADAPTOR_MDP_RDMA2] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA2, 2 },
-	[OVL_ADAPTOR_MDP_RDMA3] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA3, 3 },
-	[OVL_ADAPTOR_MDP_RDMA4] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA4, 4 },
-	[OVL_ADAPTOR_MDP_RDMA5] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA5, 5 },
-	[OVL_ADAPTOR_MDP_RDMA6] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA6, 6 },
-	[OVL_ADAPTOR_MDP_RDMA7] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA7, 7 },
-	[OVL_ADAPTOR_MERGE0] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE1, 1 },
-	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2 },
-	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3 },
-	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4 },
+	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0, &_ethdr },
+	[OVL_ADAPTOR_MDP_RDMA0] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA0, 0, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA1] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA1, 1, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA2] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA2, 2, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA3] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA3, 3, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA4] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA4, 4, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA5] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA5, 5, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA6] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA6, 6, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA7] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA7, 7, &_rdma },
+	[OVL_ADAPTOR_MERGE0] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE1, 1, &_merge },
+	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2, &_merge },
+	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3, &_merge },
+	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4, &_merge },
 };
 
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -187,73 +203,34 @@ void mtk_ovl_adaptor_stop(struct device *dev)
 
 int mtk_ovl_adaptor_clk_enable(struct device *dev)
 {
-	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
-	struct device *comp;
-	int ret;
 	int i;
-
-	for (i = 0; i < OVL_ADAPTOR_MERGE0; i++) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-		ret = pm_runtime_get_sync(comp);
-		if (ret < 0) {
-			dev_err(dev, "Failed to enable power domain %d, err %d\n", i, ret);
-			goto pwr_err;
-		}
-	}
+	int ret;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
 	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-
-		if (i < OVL_ADAPTOR_MERGE0)
-			ret = mtk_mdp_rdma_clk_enable(comp);
-		else if (i < OVL_ADAPTOR_ETHDR0)
-			ret = mtk_merge_clk_enable(comp);
-		else
-			ret = mtk_ethdr_clk_enable(comp);
+		dev = ovl_adaptor->ovl_adaptor_comp[i];
+		if (!dev)
+			continue;
+		ret = comp_matches[i].funcs->clk_enable(dev);
 		if (ret) {
-			dev_err(dev, "Failed to enable clock %d, err %d\n", i, ret);
-			goto clk_err;
+			while (--i >= 0)
+				comp_matches[i].funcs->clk_disable(dev);
+			return ret;
 		}
 	}
-
-	return ret;
-
-clk_err:
-	while (--i >= 0) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-		if (i < OVL_ADAPTOR_MERGE0)
-			mtk_mdp_rdma_clk_disable(comp);
-		else if (i < OVL_ADAPTOR_ETHDR0)
-			mtk_merge_clk_disable(comp);
-		else
-			mtk_ethdr_clk_disable(comp);
-	}
-	i = OVL_ADAPTOR_MERGE0;
-
-pwr_err:
-	while (--i >= 0)
-		pm_runtime_put(ovl_adaptor->ovl_adaptor_comp[i]);
-
-	return ret;
+	return 0;
 }
 
 void mtk_ovl_adaptor_clk_disable(struct device *dev)
 {
-	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
-	struct device *comp;
 	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
 	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-
-		if (i < OVL_ADAPTOR_MERGE0) {
-			mtk_mdp_rdma_clk_disable(comp);
-			pm_runtime_put(comp);
-		} else if (i < OVL_ADAPTOR_ETHDR0) {
-			mtk_merge_clk_disable(comp);
-		} else {
-			mtk_ethdr_clk_disable(comp);
-		}
+		dev = ovl_adaptor->ovl_adaptor_comp[i];
+		if (!dev)
+			continue;
+		comp_matches[i].funcs->clk_disable(dev);
 	}
 }
 
-- 
2.18.0

