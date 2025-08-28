Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF84CB39659
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB92710E83A;
	Thu, 28 Aug 2025 08:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WFsoErXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEEC10E6CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:14 +0000 (UTC)
X-UUID: 44bd0ab083e611f0bd5779446731db89-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sJtZdzMUi0J8KSQhlaX0XqgnDJIEayUG+GPNWLg4MYI=; 
 b=WFsoErXUBKrEjn8EtjP0uUH1QnlsXC8Be6qTDiUPoae9XUU6peGqxD8jUYSaXNQ2P1OQSRZjuBm1F6X+vrzli/XNTb6Q/tW6SUGS027RmEBpkZVJa8M8Jwi1B6FhPcWS5/oiBBvBQLiU7qnXuRhrkwQitMLUpQ5eQOB3ABJvs1w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:a6beb168-627a-406b-9cb3-2603cec3d83b, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:1c719d7a-966c-41bd-96b5-7d0b3c22e782,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 44bd0ab083e611f0bd5779446731db89-20250828
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1573888553; Thu, 28 Aug 2025 16:09:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:04 +0800
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
Subject: [PATCH v4 12/19] drm/mediatek: Export OVL formats definitions and
 format conversion API
Date: Thu, 28 Aug 2025 16:07:07 +0800
Message-ID: <20250828080855.3502514-13-paul-pl.chen@mediatek.com>
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

In upcoming SoCs, the OVL component will be divided into multiple
smaller hardware units to enhance flexibility. To facilitate this
transition, the OVL format definitions and format conversion API
should be exported for reuse across these units.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 177 +++++++++++++++---------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h |  21 +++
 2 files changed, 133 insertions(+), 65 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl.h

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index d4f096d37abc..e3ee3f60f4ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -4,7 +4,6 @@
  */
 
 #include <drm/drm_blend.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 
 #include <linux/clk.h>
@@ -18,6 +17,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
+#include "mtk_disp_ovl.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
@@ -62,22 +62,15 @@
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
@@ -101,7 +94,7 @@ static inline bool is_10bit_rgb(u32 fmt)
 	return false;
 }
 
-static const u32 mt8173_ovl_formats[] = {
+const u32 mt8173_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_BGRX8888,
@@ -115,7 +108,9 @@ static const u32 mt8173_ovl_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
-static const u32 mt8195_ovl_formats[] = {
+const size_t mt8173_ovl_formats_len = ARRAY_SIZE(mt8173_ovl_formats);
+
+const u32 mt8195_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB2101010,
@@ -139,6 +134,8 @@ static const u32 mt8195_ovl_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+const size_t mt8195_ovl_formats_len = ARRAY_SIZE(mt8195_ovl_formats);
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -167,6 +164,22 @@ struct mtk_disp_ovl {
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
@@ -302,7 +315,7 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
 	if (!ovl->data->supports_clrfmt_ext)
 		return;
 
-	if (is_10bit_rgb(format))
+	if (mtk_ovl_is_10bit_rgb(format))
 		bit_depth = OVL_CON_CLRFMT_10_BIT;
 
 	mtk_ddp_write_mask(cmdq_pkt, OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx),
@@ -401,70 +414,96 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int mtk_ovl_fmt_convert(struct mtk_disp_ovl *ovl,
-					struct mtk_plane_state *state)
+unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
+				 bool fmt_rgb565_is_0, bool color_convert,
+				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap)
 {
-	unsigned int fmt = state->pending.format;
-	unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
-
-	/*
-	 * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
-	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
-	 *
-	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
-	 * If not, use coverage mode instead to set it to the supported color formats.
-	 *
-	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
-	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
-	 * will get an error return from drm_plane_create_blend_mode_property() and
-	 * state->base.pixel_blend_mode should not be used.
-	 */
-	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
-		blend_mode = state->base.pixel_blend_mode;
+	unsigned int con = 0;
+	bool need_byte_swap = false, need_rgb_swap = false;
 
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
@@ -511,7 +550,15 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = mtk_ovl_fmt_convert(ovl, state);
+	if (ovl->data->blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
+		con = mtk_ovl_fmt_convert(fmt, blend_mode,
+					  ovl->data->fmt_rgb565_is_0, true, 12,
+					  OVL_CON_CLRFMT_MAN, OVL_CON_BYTE_SWAP, OVL_CON_RGB_SWAP);
+	else
+		con = mtk_ovl_fmt_convert(fmt, DRM_MODE_BLEND_COVERAGE,
+					  ovl->data->fmt_rgb565_is_0, true, 12,
+					  OVL_CON_CLRFMT_MAN, OVL_CON_BYTE_SWAP, OVL_CON_RGB_SWAP);
+
 	if (state->base.fb) {
 		con |= state->base.alpha & OVL_CON_ALPHA;
 
@@ -668,7 +715,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
@@ -677,7 +724,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
@@ -686,7 +733,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
@@ -695,7 +742,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
@@ -708,7 +755,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
@@ -721,7 +768,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
+	.num_formats = mt8173_ovl_formats_len,
 };
 
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
@@ -735,7 +782,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8195_ovl_formats,
-	.num_formats = ARRAY_SIZE(mt8195_ovl_formats),
+	.num_formats = mt8195_ovl_formats_len,
 	.supports_clrfmt_ext = true,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
new file mode 100644
index 000000000000..4f446d2e0712
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OVL_H__
+#define __MTK_DISP_OVL_H__
+
+#include <drm/drm_fourcc.h>
+
+extern const u32 mt8173_ovl_formats[];
+extern const size_t mt8173_ovl_formats_len;
+extern const u32 mt8195_ovl_formats[];
+extern const size_t mt8195_ovl_formats_len;
+
+bool mtk_ovl_is_10bit_rgb(unsigned int fmt);
+unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
+				 bool fmt_rgb565_is_0, bool color_convert,
+				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap);
+
+#endif
-- 
2.45.2

