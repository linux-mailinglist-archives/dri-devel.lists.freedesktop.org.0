Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE87A41F6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D435D10E1C7;
	Mon, 18 Sep 2023 07:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165D810E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:58:14 +0000 (UTC)
X-UUID: 1c5f5920514211ee8051498923ad61e6-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xSDQna8REA3X3uSlIAry+oO7NAIfkEBRlPmEHh+5k3Y=; 
 b=PgtxnOH0FZeP/7HL0UR2KTvgnoksylTTO+Dv2C6XQcC27yf/fmb9r/wEw4AGRWzX8o8mhiA9vK+ZyeYzwlK9Wc7EKrSVU7XDUcnNjiKarn0Gr8PPyCgnG4mvPpg0UfKa2uXBtAVyfiBA4/cNNSXGXFirIsm7dYB1cuHtqCYdmOM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:d5372bba-0f55-477d-966c-977315f91cb7, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:0ad78a4, CLOUDID:28fbbcbe-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c5f5920514211ee8051498923ad61e6-20230912
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1997302553; Tue, 12 Sep 2023 15:58:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:07 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 08/14] media: platform: mtk-mdp3: avoid multiple driver
 registrations
Date: Tue, 12 Sep 2023 15:57:59 +0800
Message-ID: <20230912075805.11432-9-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.861000-8.000000
X-TMASE-MatchedRID: t43B5J96WnkBCIpkUn74FLg7LINv5AfgLL6mJOIs/vYs/uUAk6xP7PlY
 oV6p/cSxARdN2JeGGT9JYgJHd90gXxElELPcdUQnGVyS87Wb4lzEoDEGChh7CU1KG1YrOQW/vYS
 gGqfGrUjftLFtxOSbQ4Ay6p60ZV62fJ5/bZ6npdjKayT/BQTiGsxWxQI7PtA5XSCZzMZeoii5jf
 clWSk2ytPCZ+p6duiIqPG8weO90G0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.861000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4ED9F94F69DF90427B6D9211F70D41B3F83357F682DB26E0356534A3810D87E42000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
 dri-devel@lists.freedesktop.org, Moudy
 Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amount of MDP3 driver probes is determined by the registered
clocks of MMSYS.
Since MT8195 MDP3 utilizes VPPSYS0 and VPPSYS1, it's necessary to
prevent multiple driver registrations.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c  | 1 +
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 8 ++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
index b7efdafb1620..8eac09f9d3dd 100644
--- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -410,6 +410,7 @@ static const struct mdp_pipe_info mt8183_pipe_info[] = {
 
 const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_plat_id = MT8183,
+	.mdp_con_res = 0x14001000,
 	.mdp_probe_infra = mt8183_mdp_probe_infra,
 	.mdp_cfg = &mt8183_plat_cfg,
 	.mdp_mutex_table_idx = mt8183_mutex_idx,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 239f496b7a30..06b7d2b0b814 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -161,6 +161,7 @@ static int mdp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mdp_dev *mdp;
 	struct platform_device *mm_pdev, *mm2_pdev;
+	struct resource *res;
 	int ret, i, mutex_id;
 
 	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
@@ -172,6 +173,12 @@ static int mdp_probe(struct platform_device *pdev)
 	mdp->pdev = pdev;
 	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res->start != mdp->mdp_data->mdp_con_res) {
+		platform_set_drvdata(pdev, mdp);
+		goto success_return;
+	}
+
 	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_MMSYS);
 	if (IS_ERR_OR_NULL(mm_pdev)) {
 		ret = -ENODEV;
@@ -279,6 +286,7 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_unregister_device;
 	}
 
+success_return:
 	dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
 	return 0;
 
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index e4ffa25b9271..a063a655248c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -61,6 +61,7 @@ enum mdp_pipe_id {
 
 struct mtk_mdp_driver_data {
 	const int mdp_plat_id;
+	const resource_size_t mdp_con_res;
 	const struct of_device_id *mdp_probe_infra;
 	const struct mdp_platform_config *mdp_cfg;
 	const u32 *mdp_mutex_table_idx;
-- 
2.18.0

