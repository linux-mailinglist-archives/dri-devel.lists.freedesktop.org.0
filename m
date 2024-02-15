Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB4855ED0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DB310E504;
	Thu, 15 Feb 2024 10:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HfCkjZMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C8510E295
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:11:28 +0000 (UTC)
X-UUID: 926ba2eacbea11ee9e680517dc993faa-20240215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=I7cVLoCIGZryICIea5pm/7QKmeb5VjO8IC3m/+bitNs=; 
 b=HfCkjZMKowEJpK2M1UfpntfUFYGudRXQgSHxLnWFDCIA5Ua0Q0QzDoD1V4Em3Vmh1LalJFbg8lULirKRkXBylQH8ijnQG0ax4eug1ZCC2kBQHq9bhQTqPlRYKxOX3stmUNvG4hck6TdLx9oh0jrmCBOrkfiSCDRmmfIwoK6usEA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:52af26f8-60b6-4890-99e9-613b75677204, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:65636b80-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 926ba2eacbea11ee9e680517dc993faa-20240215
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1655895590; Thu, 15 Feb 2024 18:11:23 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Feb 2024 18:11:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Feb 2024 18:11:22 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Sean Paul
 <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 05/13] drm/mediatek: Set DRM mode configs accordingly
Date: Thu, 15 Feb 2024 18:11:11 +0800
Message-ID: <20240215101119.12629-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240215101119.12629-1-shawn.sung@mediatek.com>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
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

Set DRM mode configs limitation according to the hardware capabilities
and pass the IGT checks as below:

- The test "graphics.IgtKms.kms_plane" requires a frame buffer with
  width of 4512 pixels (> 4096).
- The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size is
  defined, and run the test with cursor size from 1x1 to 512x512.

Please notice that the test conditions may change as IGT is updated.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 890e1e93a2227..8cf157ec66ba6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -296,6 +296,9 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.conn_routes = mt8188_mtk_ddp_main_routes,
 	.num_conn_routes = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
+	.min_width = 1,
+	.min_height = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -310,6 +313,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
+	.min_width = 1,
+	.min_height = 1,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
@@ -317,6 +323,9 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
 	.mmsys_id = 1,
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
+	.min_width = 2, /* 2-pixel align when ethdr is bypassed */
+	.min_height = 1,
 };
 
 static const struct of_device_id mtk_drm_of_ids[] = {
@@ -495,6 +504,18 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
 			priv_n = private->all_drm_private[j];
 
+			if (priv_n->data->max_pitch) {
+				/* Save 4 bytes for the color depth (pitch = width * bpp) */
+				drm->mode_config.max_width  = priv_n->data->max_pitch >> 2;
+				drm->mode_config.max_height = priv_n->data->max_pitch >> 2;
+			}
+
+			if (priv_n->data->min_width)
+				drm->mode_config.min_width = priv_n->data->min_width;
+
+			if (priv_n->data->min_height)
+				drm->mode_config.min_height = priv_n->data->min_height;
+
 			if (i == CRTC_MAIN && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
 							  priv_n->data->main_len, j,
@@ -522,6 +543,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		}
 	}
 
+	/* IGT will check if the cursor size is configured */
+	drm->mode_config.cursor_width = drm->mode_config.max_width;
+	drm->mode_config.cursor_height = drm->mode_config.max_height;
+
 	/* Use OVL device for all DMA memory allocations */
 	crtc = drm_crtc_from_index(drm, 0);
 	if (crtc)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 33fadb08dc1c7..414764b4546ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,6 +46,9 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 	unsigned int mmsys_id;
 	unsigned int mmsys_dev_num;
+
+	u32 max_pitch;
+	int min_width, min_height;
 };
 
 struct mtk_drm_private {
-- 
2.18.0

