Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4955ED125
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 01:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1810E1A0;
	Tue, 27 Sep 2022 23:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3677410E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 23:38:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 991DD47C;
 Wed, 28 Sep 2022 01:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664321908;
 bh=TwgQTxiVPNfnpoNHYHwpinSSfCuJWbr7ECeUKqbXkLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SXIF2PoN+lZt0XL7yagcaOakIvQ/m7vCXdJna9+jwzTeF0AMAIR1caTAzzBVl++2C
 czfzVQUyxDoF6D9XpzYIR984oADepKFCq6Vyo4D4vHSO5soSfDUV5Y9iPsawJkDH6g
 2tXkeVRAh0JWe8tKNV2Qb2jJspjgrfhzc1Y1/+ag=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm: lcdif: Add support for YUV planes
Date: Wed, 28 Sep 2022 02:38:21 +0300
Message-Id: <20220927233821.8007-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The LCDIF includes a color space converter that supports YUV input. Use
it to support YUV planes, either through the converter if the output
format is RGB, or in conversion bypass mode otherwise. For now only
BT.601 YCbCr encoding in limited quantization range is supported,
additional encodings and ranges may be added later.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 117 ++++++++++++++++++++++++-----
 drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
 2 files changed, 101 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index ba84b51598b3..a97a5f512aae 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -15,6 +15,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
@@ -37,9 +38,10 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 {
 	struct drm_device *drm = lcdif->drm;
 	const u32 format = lcdif->crtc.primary->state->fb->format->format;
+	bool in_yuv = false;
+	bool out_yuv = false;
 
-	writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
-
+	/* HDMI output */
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_RGB565_1X16:
 		writel(DISP_PARA_LINE_PATTERN_RGB565,
@@ -52,24 +54,7 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
 		       lcdif->base + LCDC_V8_DISP_PARA);
-
-		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
-		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x042),
-		       lcdif->base + LCDC_V8_CSC0_COEF0);
-		writel(CSC0_COEF1_B1(0x7da) | CSC0_COEF1_A3(0x019),
-		       lcdif->base + LCDC_V8_CSC0_COEF1);
-		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
-		       lcdif->base + LCDC_V8_CSC0_COEF2);
-		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
-		       lcdif->base + LCDC_V8_CSC0_COEF3);
-		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
-		       lcdif->base + LCDC_V8_CSC0_COEF4);
-		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
-		       lcdif->base + LCDC_V8_CSC0_COEF5);
-
-		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
-		       lcdif->base + LCDC_V8_CSC0_CTRL);
-
+		out_yuv = true;
 		break;
 	default:
 		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);
@@ -77,6 +62,7 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 	}
 
 	switch (format) {
+	/* RGB Formats */
 	case DRM_FORMAT_RGB565:
 		writel(CTRLDESCL0_5_BPP_16_RGB565,
 		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
@@ -101,10 +87,87 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
 		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
 		break;
+
+	/* YUYV Formats */
+	case DRM_FORMAT_YUYV:
+		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_VY2UY1,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		in_yuv = true;
+		break;
+	case DRM_FORMAT_YVYU:
+		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_UY2VY1,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		in_yuv = true;
+		break;
+	case DRM_FORMAT_UYVY:
+		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2VY1U,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		in_yuv = true;
+		break;
+	case DRM_FORMAT_VYUY:
+		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2UY1V,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		in_yuv = true;
+		break;
+
 	default:
 		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
 		break;
 	}
+
+	/*
+	 * The CSC differentiates between "YCbCr" and "YUV", but the reference
+	 * manual doesn't detail how they differ. Experiments showed that the
+	 * luminance value is unaffected, only the calculations involving chroma
+	 * values differ. The YCbCr mode behaves as expected, with chroma values
+	 * being offset by 128. The YUV mode isn't fully understood.
+	 */
+	if (!in_yuv && out_yuv) {
+		/* RGB -> YCbCr */
+		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
+		       lcdif->base + LCDC_V8_CSC0_CTRL);
+
+		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
+		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x042),
+		       lcdif->base + LCDC_V8_CSC0_COEF0);
+		writel(CSC0_COEF1_B1(0x7da) | CSC0_COEF1_A3(0x019),
+		       lcdif->base + LCDC_V8_CSC0_COEF1);
+		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
+		       lcdif->base + LCDC_V8_CSC0_COEF2);
+		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
+		       lcdif->base + LCDC_V8_CSC0_COEF3);
+		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
+		       lcdif->base + LCDC_V8_CSC0_COEF4);
+		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
+		       lcdif->base + LCDC_V8_CSC0_COEF5);
+	} else if (in_yuv && !out_yuv) {
+		/* YCbCr -> RGB */
+		writel(CSC0_CTRL_CSC_MODE_YCbCr2RGB,
+		       lcdif->base + LCDC_V8_CSC0_CTRL);
+
+		/*
+		 * CSC: BT.601 Limited Range YCbCr to RGB coefficients.
+		 *
+		 * Despite the reference manual stating the opposite, the D1,
+		 * D2 and D3 values are added to Y, U and V, not subtracted.
+		 * They must thus be programmed with negative values.
+		 */
+		writel(CSC0_COEF0_A2(0x000) | CSC0_COEF0_A1(0x12a),
+		       lcdif->base + LCDC_V8_CSC0_COEF0);
+		writel(CSC0_COEF1_B1(0x123) | CSC0_COEF1_A3(0x1a2),
+		       lcdif->base + LCDC_V8_CSC0_COEF1);
+		writel(CSC0_COEF2_B3(0x730) | CSC0_COEF2_B2(0x79c),
+		       lcdif->base + LCDC_V8_CSC0_COEF2);
+		writel(CSC0_COEF3_C2(0x204) | CSC0_COEF3_C1(0x124),
+		       lcdif->base + LCDC_V8_CSC0_COEF3);
+		writel(CSC0_COEF4_D1(0x1f0) | CSC0_COEF4_C3(0x000),
+		       lcdif->base + LCDC_V8_CSC0_COEF4);
+		writel(CSC0_COEF5_D3(0x180) | CSC0_COEF5_D2(0x180),
+		       lcdif->base + LCDC_V8_CSC0_COEF5);
+	} else {
+		/* RGB -> RGB, YCbCr -> YCbCr: bypass colorspace converter. */
+		writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
+	}
 }
 
 static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
@@ -456,6 +519,12 @@ static const u32 lcdif_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_XRGB4444,
 	DRM_FORMAT_XRGB8888,
+
+	/* packed YCbCr */
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
 };
 
 static const u64 lcdif_modifiers[] = {
@@ -484,6 +553,14 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 	if (ret)
 		return ret;
 
+	ret = drm_plane_create_color_properties(&lcdif->planes.primary,
+						BIT(DRM_COLOR_YCBCR_BT601),
+						BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						DRM_COLOR_YCBCR_BT601,
+						DRM_COLOR_YCBCR_LIMITED_RANGE);
+	if (ret)
+		return ret;
+
 	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
 	ret = drm_crtc_init_with_planes(lcdif->drm, crtc,
 					&lcdif->planes.primary, NULL,
diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index bc4d020aaa7c..c53f2eb6818a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -216,7 +216,10 @@
 #define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(3 << 14)
 #define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
 
-#define CSC0_CTRL_CSC_MODE_RGB2YCbCr	GENMASK(2, 1)
+#define CSC0_CTRL_CSC_MODE_YUV2RGB	(0 << 1)
+#define CSC0_CTRL_CSC_MODE_YCbCr2RGB	(1 << 1)
+#define CSC0_CTRL_CSC_MODE_RGB2YUV	(2 << 1)
+#define CSC0_CTRL_CSC_MODE_RGB2YCbCr	(3 << 1)
 #define CSC0_CTRL_CSC_MODE_MASK		GENMASK(2, 1)
 #define CSC0_CTRL_BYPASS		BIT(0)
 
-- 
Regards,

Laurent Pinchart

