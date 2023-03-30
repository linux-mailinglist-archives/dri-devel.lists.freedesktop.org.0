Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADEA6CF98B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 05:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC99F10ECC8;
	Thu, 30 Mar 2023 03:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38F10ECC3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:26:21 +0000 (UTC)
X-UUID: a1be57f8ceaa11eda9a90f0bb45854f4-20230330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WoJKdEQIfvGalQRfL+XtubdnsJCZ9nJUfiXfe+9wORA=; 
 b=RHCeGJ3D25lsROLguJmQdTWCKFcpkpKqvn3HnRyL0jF+8UotYXRwicwiZcEBszJgbD70mCqDCRn+9eLG/UNETxr5dIq3rLspL7r2SIsk1I4pi6gD2hAfuuK4cnB7OOzqxJdNvb5IdAPHqC/vAxd/lGKP3fEkIktLEah77O9YjPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:d9a7740f-8b88-49e2-8bd3-6ca9496c9359, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:108ceb29-564d-42d9-9875-7c868ee415ec,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a1be57f8ceaa11eda9a90f0bb45854f4-20230330
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 580680964; Thu, 30 Mar 2023 11:26:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 30 Mar 2023 11:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 30 Mar 2023 11:26:15 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 1/2] drm/mediatek: Add mdp_rdma get format function
Date: Thu, 30 Mar 2023 11:26:13 +0800
Message-ID: <20230330032614.18837-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230330032614.18837-1-nancy.lin@mediatek.com>
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
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
Cc: shawn.sung@mediatek.com, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mdp_rdma get_format and get_num_formats function.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  3 +++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 0d28b2e2069c..17b169530beb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -152,4 +152,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 			 struct cmdq_pkt *cmdq_pkt);
+const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
+size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index eecfa98ff52e..e06db6e56b5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -62,6 +62,20 @@
 #define RDMA_CSC_FULL709_TO_RGB			5
 #define RDMA_CSC_BT601_TO_RGB			6
 
+static const u32 formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 enum rdma_format {
 	RDMA_INPUT_FORMAT_RGB565 = 0,
 	RDMA_INPUT_FORMAT_RGB888 = 1,
@@ -219,6 +233,16 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 			   MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
 }
 
+const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
+{
+	return formats;
+}
+
+size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
+{
+	return ARRAY_SIZE(formats);
+}
+
 int mtk_mdp_rdma_clk_enable(struct device *dev)
 {
 	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
-- 
2.18.0

