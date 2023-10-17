Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A07CBB9F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 08:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A382310E265;
	Tue, 17 Oct 2023 06:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155FC10E264
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 06:47:30 +0000 (UTC)
X-UUID: 04bf65206cb911eea33bb35ae8d461a2-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BOknq7sF98YK+HRUp3woWcsMacelNgGfHkaunLKrevE=; 
 b=dTIQXiE4H1g+OppcVHEkZ+BI2vBytNubzycAgJ47GDm5nyjBGroXSbUfO84f3Yt1P2CU9q+/CwRVpcr+Yw5xrh20c9LrIZ7xHj6OV7Ephc8OPdDqoGymPjXN7cExhu1/NymyrKKFhYfta2fP+eCc+itzcGw16+c4teuHztwz4u0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:eb2c0085-3415-44ae-a6d3-381ea8566e30, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:7deb36c4-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 04bf65206cb911eea33bb35ae8d461a2-20231017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 709946702; Tue, 17 Oct 2023 14:47:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 14:47:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Oct 2023 14:47:18 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 05/11] drm/mediatek: Set DRM mode configs accordingly
Date: Tue, 17 Oct 2023 14:47:11 +0800
Message-ID: <20231017064717.21616-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231017064717.21616-1-shawn.sung@mediatek.com>
References: <20231017064717.21616-1-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Nancy Lin <nancy.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set DRM mode configs limitation accroding to the
hardware capabilities.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 28 ++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h | 17 ++++++++++++++++
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5d551bff6b3f..a4b740420ebb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -304,6 +304,7 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.conn_routes = mt8188_mtk_ddp_main_routes,
 	.conn_routes_num = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -318,6 +319,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
@@ -325,6 +327,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
 	.mmsys_id = 1,
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
 };
 
 static const struct of_device_id mtk_drm_of_ids[] = {
@@ -463,16 +466,16 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (ret)
 		goto put_mutex_dev;
 
-	drm->mode_config.min_width = 64;
-	drm->mode_config.min_height = 64;
-
 	/*
-	 * set max width and height as default value(4096x4096).
-	 * this value would be used to check framebuffer size limitation
-	 * at drm_mode_addfb().
+	 * Set default values for drm mode config
+	 * these values will be referenced by drm_mode_addfb() as
+	 * frame buffer size limitation.
 	 */
-	drm->mode_config.max_width = 4096;
-	drm->mode_config.max_height = 4096;
+	drm->mode_config.min_width = 1;
+	drm->mode_config.min_height = 1;
+	drm->mode_config.cursor_width = 512;
+	drm->mode_config.cursor_height = 512;
+
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
 
@@ -502,6 +505,15 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
 			priv_n = private->all_drm_private[j];
 
+			if (priv_n->data->max_pitch) {
+				/* Save 4 bytes for the color depth (pitch = width x bpp) */
+				drm->mode_config.max_width  = priv_n->data->max_pitch >> 2;
+				drm->mode_config.max_height = priv_n->data->max_pitch >> 2;
+			} else {
+				drm->mode_config.max_width = 4096;
+				drm->mode_config.max_height = 4096;
+			}
+
 			if (i == 0 && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
 							  priv_n->data->main_len, j,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index d2efd715699f..833ecee855bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -28,6 +28,21 @@ struct mtk_drm_route {
 	const unsigned int *route_ddp;
 };
 
+/**
+ * struct mtk_mmsys_driver_data - capabilities for the mmsys
+ * @main_path: path of the main display
+ * @main_len: length of the main display path
+ * @ext_path: path of the external display
+ * @ext_len: length of the external display path
+ * @third_path: path of the third display
+ * @third_len: length of the third display path
+ * @conn_routes: routing table of all the possible connectors
+ * @conn_routes_num: number of the routing table for the connectors
+ * @shadow_register: whether or not shadow register is enabled
+ * @mmsys_id: multi-media system ID
+ * @mmsys_dev_num: number of devices for in the mmsys as a whole
+ * @max_pitch: maximum pitch in bytes that the mmsys supports
+ */
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
@@ -41,6 +56,8 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 	unsigned int mmsys_id;
 	unsigned int mmsys_dev_num;
+
+	u32 max_pitch;
 };
 
 struct mtk_drm_private {
-- 
2.18.0

