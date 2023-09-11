Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9179A563
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774AF10E188;
	Mon, 11 Sep 2023 08:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59CD10E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 07:42:50 +0000 (UTC)
X-UUID: cd925d5e507611ee8051498923ad61e6-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7PqPiul3eWZr/vPIxBZBIKaOcN9JGOOW3J7ZWxHv7SY=; 
 b=YgCrIxEFJObgImszr/9UiW0fzaxkZFEKV6IHInxRbVJp/Oc3jwMPWOgJnYyUeyAk0hy8fsD7DZIvsrjCB4+jjyx2hi0Re0SqNJWQfQwDLo9H1DUws/hC1YlYxoJJuOuIKsTSVHAlmPPB4pDLQDJDV3bNybgkvk+iD3OcyAhzFBg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:22be6217-8548-44c8-bc5b-37ecd68c936c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:be22cb13-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd925d5e507611ee8051498923ad61e6-20230911
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 400026659; Mon, 11 Sep 2023 15:42:48 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 15:42:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 15:42:46 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v6 15/20] drm/mediatek: Manage component's clock with
 function pointers
Date: Mon, 11 Sep 2023 15:42:28 +0800
Message-ID: <20230911074233.31556-16-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911074233.31556-1-shawn.sung@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.356300-8.000000
X-TMASE-MatchedRID: g7nni+nG95Ab7D0aLEL5Ob2xWbKjBfWP1UmdGU7dMlUIgSDinsA6bPDR
 cRAxsuj73lSO+pJ4e/aZdGqzigSjzOn2wHlv5vGuh2VzUlo4HVN51GakW92m5na2ZEC0WTlXMG4
 kjAsJeaBdb8mglGT2afH3pT9Q6mGUNyl1nd9CIt0URSScn+QSXt0H8LFZNFG7CKFCmhdu5cXA0G
 lfD981K45m1U5VkLWQl/929ovNjhbdPeLZjorYa9dLSKJmsGVObjB/1RxQ+W4Q7sG6Pez9I8g3I
 8z77TH65IBwTcHkpp4XRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.356300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B11AF5F99EF1B64FF17CEE2D48E1B74424C83C02AD3C362FC900CB83E7E21E8C2000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 11 Sep 2023 08:04:25 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, "Jason-JH
 . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By registering component related functions to the pointers,
we can easily manage them within a for-loop and simplify the
logic of clock control significantly.

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

