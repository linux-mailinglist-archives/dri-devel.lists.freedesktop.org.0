Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337197B31F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 18:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5F10E4C5;
	Tue, 17 Sep 2024 16:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Op30LpBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0327610E4C5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 16:44:46 +0000 (UTC)
X-UUID: 216bfa9e751411efb66947d174671e26-20240918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+1AC3fNP1VonWnj0josaocduyAD66sB5A6D1HOYbBnE=; 
 b=Op30LpBsEhZzODLq1qGLtwxw149WW+50FeZLzbCN31ZERK90feAXS6Z3RDPkzzbmH56L9mEWfJGT6r+YdaCelsXwRYzwx63qOA7vfEv+e1ffCcba2BrzsxCwNQhGieJlASF3twKeT1Voj0bp82aPDKqP2drUrrYb1lZjptqwsNg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:d21eafd9-cb51-4532-bec7-45b15e705663, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6dc6a47, CLOUDID:e79323b7-8c4d-4743-b649-83c6f3b849d4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 216bfa9e751411efb66947d174671e26-20240918
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 654492005; Wed, 18 Sep 2024 00:44:39 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Sep 2024 00:44:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Sep 2024 00:44:36 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3] drm/mediatek: ovl: Add fmt_convert function pointer to
 driver data
Date: Wed, 18 Sep 2024 00:44:34 +0800
Message-ID: <20240917164434.17794-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.162200-8.000000
X-TMASE-MatchedRID: 4LZxuBlJqUUzP1+hKLmUcMu00lnG8+PWIaLR+2xKRDLb6Y+fnTZULz94
 HX24gqtCCInppypKAT/VoxB0j4x40LQ9EkyAW8JW2OSj4qJA9QbeHKxRMJ4P8diCsYPC4Ul22ft
 v/5jXki+muE8sHNH+0RUh680kRJ0sVWO7fs8MQC7k7k9yXJiqqhZO94uK1VSBWabPstVV86l6gt
 iEqf13+84WZ2e8JNtqZmkxQVgZGGRLdmeL82hot98tWTI1R8ep/5QRvrl2CZDzYcyIF7RSVb5Sd
 /nplJIc4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vOhFpIr55H3NVjx/3+Flhi5F2YlOFSiZmwi3T
 t1ZQFjCcb1Pw5XWcDw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.162200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4048DE2440AFB7BC677F4ECD18AB14426478FB263DF3AD24EB84EE36FFD723D02000:8
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

OVL_CON_CLRFMT_MAN is a configuration for extending color format
settings of DISP_REG_OVL_CON(n).
It will change some of the original color format settings.

Take the settings of (3 << 12) for example.
- If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
- If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.

Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
It breaks the OVL color format setting of MT8173.

Therefore, the fmt_convert function pointer is added to the driver data
and mtk_ovl_fmt_convert_with_blend is implemented for MT8192 and MT8195
that support OVL_CON_CLRFMT_MAN, and mtk_ovl_fmt_convert is implemented
for other SoCs that do not support it to solve the degradation problem.

Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 63 ++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..4948f269fb81 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -143,6 +143,7 @@ struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
+	unsigned int (*fmt_convert)(struct device *dev, struct mtk_plane_state *state);
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
 	bool supports_afbc;
@@ -386,13 +387,54 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
-				    unsigned int blend_mode)
+static unsigned int mtk_ovl_fmt_convert(struct device *dev, struct mtk_plane_state *state)
 {
-	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
-	 * is defined in mediatek HW data sheet.
-	 * The alphabet order in XXX is no relation to data
-	 * arrangement in memory.
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int fmt = state->pending.format;
+
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_RGB565:
+		return OVL_CON_CLRFMT_RGB565(ovl);
+	case DRM_FORMAT_BGR565:
+		return OVL_CON_CLRFMT_RGB565(ovl) | OVL_CON_BYTE_SWAP;
+	case DRM_FORMAT_RGB888:
+		return OVL_CON_CLRFMT_RGB888(ovl);
+	case DRM_FORMAT_BGR888:
+		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+		return OVL_CON_CLRFMT_RGBA8888;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+		return OVL_CON_CLRFMT_ARGB8888;
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return OVL_CON_CLRFMT_ABGR8888;
+	case DRM_FORMAT_UYVY:
+		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
+	case DRM_FORMAT_YUYV:
+		return OVL_CON_CLRFMT_YUYV | OVL_CON_MTX_YUV_TO_RGB;
+	}
+}
+
+static unsigned int mtk_ovl_fmt_convert_with_blend(struct device *dev,
+						   struct mtk_plane_state *state)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int fmt = state->pending.format;
+	unsigned int blend_mode = state->base.pixel_blend_mode;
+
+	/*
+	 * For the platforms where OVL_CON_CLRFMT_MAN is defined in the
+	 * hardware data sheet and supports premultiplied color formats
+	 * such as OVL_CON_CLRFMT_PRGB8888.
 	 */
 	switch (fmt) {
 	default:
@@ -471,7 +513,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = ovl_fmt_convert(ovl, fmt, blend_mode);
+	con = ovl->data->fmt_convert(dev, state);
 	if (state->base.fb) {
 		con |= OVL_CON_AEN;
 		con |= state->base.alpha & OVL_CON_ALPHA;
@@ -625,6 +667,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT2701,
 	.gmc_bits = 8,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = false,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -634,6 +677,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 8,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -643,6 +687,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -652,6 +697,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 2,
+	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -661,6 +707,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
@@ -671,6 +718,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 2,
+	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
@@ -681,6 +729,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
 	.layer_nr = 4,
+	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-- 
2.43.0

