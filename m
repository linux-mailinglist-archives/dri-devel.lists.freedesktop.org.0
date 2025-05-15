Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038FAB82D1
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185D710E7EE;
	Thu, 15 May 2025 09:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FtZudCx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD5510E7EA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:35:17 +0000 (UTC)
X-UUID: e5f76174316f11f0813e4fe1310efc19-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nxPGKgHl8CDQ+wEKQDyOKmdyZ4bgpTYi2mPwNGB15/s=; 
 b=FtZudCx8Hrq+y6g3kmr3glyClIbJ57k2S0ZKtJdTVkCcA+dGjkXyilyiXJe5E/p3z3xn19Q5H00Zod8r1WgLlwlP8Rt7fpn7bM7u6LiEx4S3ktHyFh3PzSMgZDe2Vr/55PHjPVZhI/D5/HvIQPSQT6v7sqKx7c1trmL7CsCt5q8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:e8ad27dc-cf92-4e1c-8e80-776211712e9a, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:b1e504c0-eade-4d5b-9f81-31d7b5452436,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e5f76174316f11f0813e4fe1310efc19-20250515
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1209373319; Thu, 15 May 2025 17:35:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:08 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
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
Subject: [PATCH v3 10/17] drm/mediatek: Export OVL formats definitions and
 format conversion API
Date: Thu, 15 May 2025 17:34:22 +0800
Message-ID: <20250515093454.1729720-11-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
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

In upcoming SoCs, the OVL component will be divided into multiple
smaller hardware units to enhance flexibility. To facilitate this
transition, the OVL format definitions and format conversion API
should be exported for reuse across these units.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 214 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h |  28 ++++
 2 files changed, 150 insertions(+), 92 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl.h

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index d0581c4e3c99..a516b7c82b5a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -3,8 +3,6 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
-#include <drm/drm_blend.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 
 #include <linux/clk.h>
@@ -18,6 +16,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
+#include "mtk_disp_ovl.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
@@ -62,22 +61,15 @@
 /* OVL_CON_RGB_SWAP works only if OVL_CON_CLRFMT_MAN is enabled */
 #define OVL_CON_RGB_SWAP	BIT(25)
 
-#define OVL_CON_CLRFMT_RGB	(1 << 12)
-#define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
-#define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
-#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_UYVY	(4 << 12)
-#define OVL_CON_CLRFMT_YUYV	(5 << 12)
-#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
-#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)
-#define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
-#define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
-					0 : OVL_CON_CLRFMT_RGB)
-#define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
-					OVL_CON_CLRFMT_RGB : 0)
+#define OVL_CON_CLRFMT_RGB565(shift)	(0 << (shift))
+#define OVL_CON_CLRFMT_RGB888(shift)	(1 << (shift))
+#define OVL_CON_CLRFMT_ARGB8888(shift)	(2 << (shift))
+#define OVL_CON_CLRFMT_RGBA8888(shift)	(3 << (shift))
+#define OVL_CON_CLRFMT_UYVY(shift)	(4 << (shift))
+#define OVL_CON_CLRFMT_YUYV(shift)	(5 << (shift))
+#define OVL_CON_MTX_YUV_TO_RGB		(6 << 16)
+#define OVL_CON_CLRFMT_PARGB8888(shift, man) ((3 << (shift)) | (man))
+
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
 #define	OVL_CON_VIRT_FLIP	BIT(9)
@@ -85,23 +77,7 @@
 
 #define OVL_COLOR_ALPHA		GENMASK(31, 24)
 
-static inline bool is_10bit_rgb(u32 fmt)
-{
-	switch (fmt) {
-	case DRM_FORMAT_XRGB2101010:
-	case DRM_FORMAT_ARGB2101010:
-	case DRM_FORMAT_RGBX1010102:
-	case DRM_FORMAT_RGBA1010102:
-	case DRM_FORMAT_XBGR2101010:
-	case DRM_FORMAT_ABGR2101010:
-	case DRM_FORMAT_BGRX1010102:
-	case DRM_FORMAT_BGRA1010102:
-		return true;
-	}
-	return false;
-}
-
-static const u32 mt8173_formats[] = {
+const u32 mt8173_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_BGRX8888,
@@ -115,7 +91,9 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
-static const u32 mt8195_formats[] = {
+const size_t mt8173_ovl_formats_len = ARRAY_SIZE(mt8173_ovl_formats);
+
+const u32 mt8195_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB2101010,
@@ -139,6 +117,8 @@ static const u32 mt8195_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+const size_t mt8195_ovl_formats_len = ARRAY_SIZE(mt8195_ovl_formats);
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -167,6 +147,22 @@ struct mtk_disp_ovl {
 	void				*vblank_cb_data;
 };
 
+bool mtk_ovl_is_10bit_rgb(unsigned int fmt)
+{
+	switch (fmt) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return true;
+	}
+	return false;
+}
+
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
@@ -295,7 +291,7 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
 	if (!ovl->data->supports_clrfmt_ext)
 		return;
 
-	if (is_10bit_rgb(format))
+	if (mtk_ovl_is_10bit_rgb(format))
 		bit_depth = OVL_CON_CLRFMT_10_BIT;
 
 	mtk_ddp_write_mask(cmdq_pkt, OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx),
@@ -394,10 +390,8 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
-					struct mtk_plane_state *state)
+unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
 {
-	unsigned int fmt = state->pending.format;
 	unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
 
 	/*
@@ -412,52 +406,102 @@ static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
 	 * will get an error return from drm_plane_create_blend_mode_property() and
 	 * state->base.pixel_blend_mode should not be used.
 	 */
-	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
+	if (blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
 		blend_mode = state->base.pixel_blend_mode;
 
+	return blend_mode;
+}
+
+unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
+				 bool fmt_rgb565_is_0, bool color_convert,
+				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap)
+{
+	unsigned int con = 0;
+	bool need_byte_swap = false, need_rgb_swap = false;
+
 	switch (fmt) {
 	default:
 	case DRM_FORMAT_RGB565:
-		return OVL_CON_CLRFMT_RGB565(ovl);
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB565(clrfmt_shift) : OVL_CON_CLRFMT_RGB888(clrfmt_shift);
+	break;
 	case DRM_FORMAT_BGR565:
-		return OVL_CON_CLRFMT_RGB565(ovl) | OVL_CON_BYTE_SWAP;
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB565(clrfmt_shift) : OVL_CON_CLRFMT_RGB888(clrfmt_shift);
+		need_byte_swap = true;	/* RGB565 -> BGR565 */
+	break;
 	case DRM_FORMAT_RGB888:
-		return OVL_CON_CLRFMT_RGB888(ovl);
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB888(clrfmt_shift) : OVL_CON_CLRFMT_RGB565(clrfmt_shift);
+	break;
 	case DRM_FORMAT_BGR888:
-		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
+		con = fmt_rgb565_is_0 ?
+			OVL_CON_CLRFMT_RGB888(clrfmt_shift) : OVL_CON_CLRFMT_RGB565(clrfmt_shift);
+		need_byte_swap = true;	/* RGB888 -> BGR888 */
+	break;
 	case DRM_FORMAT_RGBX8888:
 	case DRM_FORMAT_RGBA8888:
 	case DRM_FORMAT_RGBX1010102:
 	case DRM_FORMAT_RGBA1010102:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_RGBA8888 :
-		       OVL_CON_CLRFMT_PRGBA8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE) {
+			con = OVL_CON_CLRFMT_RGBA8888(clrfmt_shift);
+		} else {
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+			need_byte_swap = true;	/* PARGB8888 -> PBGRA8888 */
+			need_rgb_swap = true;	/* PBGRA8888 -> PRGBA8888 */
+		}
+	break;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_BGRA8888 :
-		       OVL_CON_CLRFMT_PBGRA8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE) {
+			con = OVL_CON_CLRFMT_RGBA8888(clrfmt_shift);
+			need_byte_swap = true;	/* RGB8888 -> BGR8888 */
+		} else {
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+			need_byte_swap = true;	/* PARGB8888 -> PBGRA8888 */
+		}
+	break;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_ARGB8888 :
-		       OVL_CON_CLRFMT_PARGB8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE)
+			con = OVL_CON_CLRFMT_ARGB8888(clrfmt_shift);
+		else
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+	break;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR2101010:
 	case DRM_FORMAT_ABGR2101010:
-		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
-		       OVL_CON_CLRFMT_ABGR8888 :
-		       OVL_CON_CLRFMT_PABGR8888;
+		if (blend_mode == DRM_MODE_BLEND_COVERAGE) {
+			con = OVL_CON_CLRFMT_ARGB8888(clrfmt_shift);
+			need_rgb_swap = true;	/* ARGB8888 -> ABGR8888 */
+		} else {
+			con = OVL_CON_CLRFMT_PARGB8888(clrfmt_shift, clrfmt_man);
+			need_rgb_swap = true;	/* PARGB8888 -> PABGR8888 */
+		}
+	break;
 	case DRM_FORMAT_UYVY:
-		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
+		con = OVL_CON_CLRFMT_UYVY(clrfmt_shift);
+	break;
 	case DRM_FORMAT_YUYV:
-		return OVL_CON_CLRFMT_YUYV | OVL_CON_MTX_YUV_TO_RGB;
+		con = OVL_CON_CLRFMT_YUYV(clrfmt_shift);
+	break;
 	}
+
+	if (color_convert)
+		con |= OVL_CON_MTX_YUV_TO_RGB;
+
+	if (need_byte_swap)
+		con |= byte_swap;
+
+	if (need_rgb_swap)
+		con |= rgb_swap;
+
+	return con;
 }
 
 static void mtk_ovl_afbc_layer_config(struct mtk_disp_ovl *ovl,
@@ -504,7 +548,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = mtk_ovl_fmt_convert(ovl, state);
+	con = mtk_ovl_fmt_convert(fmt, blend_mode, ovl->data->fmt_rgb565_is_0, true,
+				  12, OVL_CON_CLRFMT_MAN, OVL_CON_BYTE_SWAP, OVL_CON_RGB_SWAP);
 	if (state->base.fb) {
 		con |= state->base.alpha & OVL_CON_ALPHA;
 
@@ -514,15 +559,6 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		 */
 		if (blend_mode || state->base.fb->format->has_alpha)
 			con |= OVL_CON_AEN;
-
-		/*
-		 * Although the alpha channel can be ignored, CONST_BLD must be enabled
-		 * for XRGB format, otherwise OVL will still read the value from memory.
-		 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
-		 * affect the result. Therefore we use !has_alpha as the condition.
-		 */
-		if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
-			ignore_pixel_alpha = OVL_CONST_BLEND;
 	}
 
 	/*
@@ -660,8 +696,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
@@ -669,8 +705,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
@@ -678,8 +714,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
@@ -687,8 +723,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
@@ -697,11 +733,9 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
+	.formats = mt8173_ovl_formats,
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
@@ -710,11 +744,9 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
+	.formats = mt8173_ovl_formats,
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
@@ -724,11 +756,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8195_formats,
-	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
+	.formats = mt8195_ovl_formats,
+	.num_formats = mt8195_ovl_formats_len,
 	.supports_clrfmt_ext = true,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
new file mode 100644
index 000000000000..3f7d7d54479d
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OVL_H__
+#define __MTK_DISP_OVL_H__
+
+#include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
+
+#define MTK_OVL_SUPPORT_BLEND_MODES \
+	(BIT(DRM_MODE_BLEND_PREMULTI) | \
+	 BIT(DRM_MODE_BLEND_COVERAGE) | \
+	 BIT(DRM_MODE_BLEND_PIXEL_NONE))
+
+extern const u32 mt8173_ovl_formats[];
+extern const size_t mt8173_ovl_formats_len;
+extern const u32 mt8195_ovl_formats[];
+extern const size_t mt8195_ovl_formats_len;
+
+bool mtk_ovl_is_10bit_rgb(unsigned int fmt);
+unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes);
+unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
+				 bool fmt_rgb565_is_0, bool color_convert,
+				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap);
+
+#endif
-- 
2.45.2

