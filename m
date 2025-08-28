Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A9B3964B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59D310E6CD;
	Thu, 28 Aug 2025 08:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jjNIXMT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283A910E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:13 +0000 (UTC)
X-UUID: 44d5fe5883e611f0bd5779446731db89-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=utMEZLQpB/iSzCTOgfYvzWLQ6vi7bXRKfstpmmrvNHs=; 
 b=jjNIXMT7Dze293Bjo7zj76yTxMNjLhJnnEHJTF4d7tCaaMICsVIeJ07S7OQECuGOV4l38SKggOq7b81TMgUUhyEaok2crPMOqWUx6xROXjtYPKvVLinMCf4PBduyZPVt7YPQyVwtsP19GfiURtenagZ64VBF2IaapfctxQRNgV4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:bfa70b67-1f62-49f1-8921-557d4afc3252, IP:0,
 UR
 L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-25
X-CID-META: VersionHash:f1326cf, CLOUDID:130b9920-786d-4870-a017-e7b4f3839b3f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 44d5fe5883e611f0bd5779446731db89-20250828
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 733620803; Thu, 28 Aug 2025 16:09:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:06 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 19/19] drm/mediatek: Add support for MT8196 multiple mmsys
Date: Thu, 28 Aug 2025 16:07:14 +0800
Message-ID: <20250828080855.3502514-20-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Nancy Lin <nancy.lin@mediatek.com>

Add code to support MT8196 SOC Multi MMSYS Driver

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 119 ++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 13fceb0389cb..1cd37052e47c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -192,6 +192,10 @@ static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
 	{0, DDP_COMPONENT_DSI0},
 };
 
+static const struct mtk_drm_route mt8196_mtk_ddp_routes[] = {
+	{2, DDP_COMPONENT_DSI0},
+};
+
 static const unsigned int mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
@@ -230,6 +234,50 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DP_INTF1,
 };
 
+static const unsigned int mt8196_mtk_ddp_ovl0_main[] = {
+	DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0,
+	DDP_COMPONENT_OVL0_DLO_ASYNC5,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp0_main[] = {
+	DDP_COMPONENT_DLI_ASYNC0,
+	DDP_COMPONENT_DLO_ASYNC1,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp1_main[] = {
+	DDP_COMPONENT_DLI_ASYNC21,
+	DDP_COMPONENT_DVO0,
+};
+
+static const unsigned int mt8196_mtk_ddp_ovl0_ext[] = {
+	DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1,
+	DDP_COMPONENT_OVL0_DLO_ASYNC6,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp0_ext[] = {
+	DDP_COMPONENT_DLI_ASYNC1,
+	DDP_COMPONENT_DLO_ASYNC2,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp1_ext[] = {
+	DDP_COMPONENT_DLI_ASYNC22,
+	DDP_COMPONENT_DP_INTF0,
+};
+
+static const unsigned int mt8196_mtk_ddp_ovl1_third[] = {
+	DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2,
+	DDP_COMPONENT_OVL1_DLO_ASYNC5,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp0_third[] = {
+	DDP_COMPONENT_DLI_ASYNC8,
+	DDP_COMPONENT_DLO_ASYNC3,
+};
+
+static const unsigned int mt8196_mtk_ddp_disp1_third[] = {
+	DDP_COMPONENT_DLI_ASYNC23,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -326,8 +374,65 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.min_height = 1,
 };
 
-static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
-	.mmsys_dev_num = 1,
+static const struct mtk_mmsys_driver_data mt8196_dispsys0_driver_data = {
+	.main_path = mt8196_mtk_ddp_disp0_main,
+	.main_len = ARRAY_SIZE(mt8196_mtk_ddp_disp0_main),
+	.main_order = 1,
+	.ext_path = mt8196_mtk_ddp_disp0_ext,
+	.ext_len = ARRAY_SIZE(mt8196_mtk_ddp_disp0_ext),
+	.ext_order = 1,
+	.third_path = mt8196_mtk_ddp_disp0_third,
+	.third_len = ARRAY_SIZE(mt8196_mtk_ddp_disp0_third),
+	.third_order = 1,
+	.mmsys_id = DISPSYS0,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_dispsys1_driver_data = {
+	.main_path = mt8196_mtk_ddp_disp1_main,
+	.main_len = ARRAY_SIZE(mt8196_mtk_ddp_disp1_main),
+	.main_order = 2,
+	.ext_path = mt8196_mtk_ddp_disp1_ext,
+	.ext_len = ARRAY_SIZE(mt8196_mtk_ddp_disp1_ext),
+	.ext_order = 2,
+	.third_path = mt8196_mtk_ddp_disp1_third,
+	.third_len = ARRAY_SIZE(mt8196_mtk_ddp_disp1_third),
+	.conn_routes = mt8196_mtk_ddp_routes,
+	.num_conn_routes = ARRAY_SIZE(mt8196_mtk_ddp_routes),
+	.third_order = 2,
+	.mmsys_id = DISPSYS1,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_ovlsys0_driver_data = {
+	.main_path = mt8196_mtk_ddp_ovl0_main,
+	.main_len = ARRAY_SIZE(mt8196_mtk_ddp_ovl0_main),
+	.main_order = 0,
+	.ext_path = mt8196_mtk_ddp_ovl0_ext,
+	.ext_len = ARRAY_SIZE(mt8196_mtk_ddp_ovl0_ext),
+	.ext_order = 0,
+	.mmsys_id = OVLSYS0,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_ovlsys1_driver_data = {
+	.third_path = mt8196_mtk_ddp_ovl1_third,
+	.third_len = ARRAY_SIZE(mt8196_mtk_ddp_ovl1_third),
+	.third_order = 0,
+	.mmsys_id = OVLSYS1,
+	.mmsys_dev_num = 4,
+	.max_width = 8191,
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
 };
 
 static const struct of_device_id mtk_drm_of_ids[] = {
@@ -357,8 +462,14 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
-	{ .compatible = "mediatek,mt8365-mmsys",
-	  .data = &mt8365_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8196-dispsys0",
+	  .data = &mt8196_dispsys0_driver_data},
+	{ .compatible = "mediatek,mt8196-dispsys1",
+	  .data = &mt8196_dispsys1_driver_data},
+	{ .compatible = "mediatek,mt8196-ovlsys0",
+	  .data = &mt8196_ovlsys0_driver_data},
+	{ .compatible = "mediatek,mt8196-ovlsys1",
+	  .data = &mt8196_ovlsys1_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
-- 
2.45.2

