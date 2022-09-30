Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A35F06B8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD5510EBE3;
	Fri, 30 Sep 2022 08:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E8710E14E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:40:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A49A34D5;
 Fri, 30 Sep 2022 10:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664527202;
 bh=+O3baT9+RYTn6XsP0bc/HwRKWf9l0O3n10tlKY+vjHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MXDXYawiR7lSNcJkFY9uHeDN7UXChBhZYmNPe/gaehnGqlR+uu3VlVhp+nUmXyp71
 PWv7XT/3bYHhRPqBWtsEP7ivHP8RFVMappJsZEltKYpXi/k3FINc2yY4LeTKZuSurO
 jUwXNUY01KX44+uKUEDaYW2kfyCz38nW05UXzFAc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm: lcdif: Add support for YUV planes
Date: Fri, 30 Sep 2022 11:39:55 +0300
Message-Id: <20220930083955.31580-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930083955.31580-1-laurent.pinchart@ideasonboard.com>
References: <20220930083955.31580-1-laurent.pinchart@ideasonboard.com>
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
 Liu Ying <victor.liu@nxp.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The LCDIF includes a color space converter that supports YUV input. Use
it to support YUV planes, either through the converter if the output
format is RGB, or in conversion bypass mode otherwise.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
Changes since v3:

- Add YCbCr to RGB conversion formula in a comment
- Fix small typo in comment

Changes since v2:

- Fix YUV to RGB coefficients
- List floating point coefficient values in comment
- Express CSC coefficients with three hex digits
- Move | to the end of the line
- Add comment header before RGB formats

Changes since v1:

- Support all YCbCr encodings and quantization ranges
- Drop incorrect comment
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 267 ++++++++++++++++++++++++-----
 drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
 2 files changed, 231 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 9f212e29059b..33ee40876994 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -15,6 +15,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
@@ -31,13 +32,126 @@
 /* -----------------------------------------------------------------------------
  * CRTC
  */
+
+/*
+ * For conversion from YCbCr to RGB, the CSC operates as follows:
+ *
+ * |R|   |A1 A2 A3|   |Y  + D1|
+ * |G| = |B1 B2 B3| * |Cb + D2|
+ * |B|   |C1 C2 C3|   |Cr + D3|
+ *
+ * The A, B and C coefficients are expressed as Q2.8 fixed point values, and
+ * the D coefficients as Q0.8. Despite the reference manual stating the
+ * opposite, the D1, D2 and D3 offset values are added to Y, Cb and Cr, not
+ * subtracted. They must thus be programmed with negative values.
+ */
+static const u32 lcdif_yuv2rgb_coeffs[3][2][6] = {
+	[DRM_COLOR_YCBCR_BT601] = {
+		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+			/*
+			 * BT.601 limited range:
+			 *
+			 * |R|   |1.1644  0.0000  1.5960|   |Y  - 16 |
+			 * |G| = |1.1644 -0.3917 -0.8129| * |Cb - 128|
+			 * |B|   |1.1644  2.0172  0.0000|   |Cr - 128|
+			 */
+			CSC0_COEF0_A1(0x12a) | CSC0_COEF0_A2(0x000),
+			CSC0_COEF1_A3(0x199) | CSC0_COEF1_B1(0x12a),
+			CSC0_COEF2_B2(0x79c) | CSC0_COEF2_B3(0x730),
+			CSC0_COEF3_C1(0x12a) | CSC0_COEF3_C2(0x204),
+			CSC0_COEF4_C3(0x000) | CSC0_COEF4_D1(0x1f0),
+			CSC0_COEF5_D2(0x180) | CSC0_COEF5_D3(0x180),
+		},
+		[DRM_COLOR_YCBCR_FULL_RANGE] = {
+			/*
+			 * BT.601 full range:
+			 *
+			 * |R|   |1.0000  0.0000  1.4020|   |Y  - 0  |
+			 * |G| = |1.0000 -0.3441 -0.7141| * |Cb - 128|
+			 * |B|   |1.0000  1.7720  0.0000|   |Cr - 128|
+			 */
+			CSC0_COEF0_A1(0x100) | CSC0_COEF0_A2(0x000),
+			CSC0_COEF1_A3(0x167) | CSC0_COEF1_B1(0x100),
+			CSC0_COEF2_B2(0x7a8) | CSC0_COEF2_B3(0x749),
+			CSC0_COEF3_C1(0x100) | CSC0_COEF3_C2(0x1c6),
+			CSC0_COEF4_C3(0x000) | CSC0_COEF4_D1(0x000),
+			CSC0_COEF5_D2(0x180) | CSC0_COEF5_D3(0x180),
+		},
+	},
+	[DRM_COLOR_YCBCR_BT709] = {
+		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+			/*
+			 * Rec.709 limited range:
+			 *
+			 * |R|   |1.1644  0.0000  1.7927|   |Y  - 16 |
+			 * |G| = |1.1644 -0.2132 -0.5329| * |Cb - 128|
+			 * |B|   |1.1644  2.1124  0.0000|   |Cr - 128|
+			 */
+			CSC0_COEF0_A1(0x12a) | CSC0_COEF0_A2(0x000),
+			CSC0_COEF1_A3(0x1cb) | CSC0_COEF1_B1(0x12a),
+			CSC0_COEF2_B2(0x7c9) | CSC0_COEF2_B3(0x778),
+			CSC0_COEF3_C1(0x12a) | CSC0_COEF3_C2(0x21d),
+			CSC0_COEF4_C3(0x000) | CSC0_COEF4_D1(0x1f0),
+			CSC0_COEF5_D2(0x180) | CSC0_COEF5_D3(0x180),
+		},
+		[DRM_COLOR_YCBCR_FULL_RANGE] = {
+			/*
+			 * Rec.709 full range:
+			 *
+			 * |R|   |1.0000  0.0000  1.5748|   |Y  - 0  |
+			 * |G| = |1.0000 -0.1873 -0.4681| * |Cb - 128|
+			 * |B|   |1.0000  1.8556  0.0000|   |Cr - 128|
+			 */
+			CSC0_COEF0_A1(0x100) | CSC0_COEF0_A2(0x000),
+			CSC0_COEF1_A3(0x193) | CSC0_COEF1_B1(0x100),
+			CSC0_COEF2_B2(0x7d0) | CSC0_COEF2_B3(0x788),
+			CSC0_COEF3_C1(0x100) | CSC0_COEF3_C2(0x1db),
+			CSC0_COEF4_C3(0x000) | CSC0_COEF4_D1(0x000),
+			CSC0_COEF5_D2(0x180) | CSC0_COEF5_D3(0x180),
+		},
+	},
+	[DRM_COLOR_YCBCR_BT2020] = {
+		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+			/*
+			 * BT.2020 limited range:
+			 *
+			 * |R|   |1.1644  0.0000  1.6787|   |Y  - 16 |
+			 * |G| = |1.1644 -0.1874 -0.6505| * |Cb - 128|
+			 * |B|   |1.1644  2.1418  0.0000|   |Cr - 128|
+			 */
+			CSC0_COEF0_A1(0x12a) | CSC0_COEF0_A2(0x000),
+			CSC0_COEF1_A3(0x1ae) | CSC0_COEF1_B1(0x12a),
+			CSC0_COEF2_B2(0x7d0) | CSC0_COEF2_B3(0x759),
+			CSC0_COEF3_C1(0x12a) | CSC0_COEF3_C2(0x224),
+			CSC0_COEF4_C3(0x000) | CSC0_COEF4_D1(0x1f0),
+			CSC0_COEF5_D2(0x180) | CSC0_COEF5_D3(0x180),
+		},
+		[DRM_COLOR_YCBCR_FULL_RANGE] = {
+			/*
+			 * BT.2020 full range:
+			 *
+			 * |R|   |1.0000  0.0000  1.4746|   |Y  - 0  |
+			 * |G| = |1.0000 -0.1646 -0.5714| * |Cb - 128|
+			 * |B|   |1.0000  1.8814  0.0000|   |Cr - 128|
+			 */
+			CSC0_COEF0_A1(0x100) | CSC0_COEF0_A2(0x000),
+			CSC0_COEF1_A3(0x179) | CSC0_COEF1_B1(0x100),
+			CSC0_COEF2_B2(0x7d6) | CSC0_COEF2_B3(0x76e),
+			CSC0_COEF3_C1(0x100) | CSC0_COEF3_C2(0x1e2),
+			CSC0_COEF4_C3(0x000) | CSC0_COEF4_D1(0x000),
+			CSC0_COEF5_D2(0x180) | CSC0_COEF5_D3(0x180),
+		},
+	},
+};
+
 static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
+			      struct drm_plane_state *plane_state,
 			      const u32 bus_format)
 {
 	struct drm_device *drm = lcdif->drm;
-	const u32 format = lcdif->crtc.primary->state->fb->format->format;
-
-	writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
+	const u32 format = plane_state->fb->format->format;
+	bool in_yuv = false;
+	bool out_yuv = false;
 
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_RGB565_1X16:
@@ -51,6 +165,78 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
 		       lcdif->base + LCDC_V8_DISP_PARA);
+		out_yuv = true;
+		break;
+	default:
+		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);
+		break;
+	}
+
+	switch (format) {
+	/* RGB Formats */
+	case DRM_FORMAT_RGB565:
+		writel(CTRLDESCL0_5_BPP_16_RGB565,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_RGB888:
+		writel(CTRLDESCL0_5_BPP_24_RGB888,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XRGB1555:
+		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XRGB4444:
+		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XBGR8888:
+		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XRGB8888:
+		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
+		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+
+	/* YUV Formats */
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
+	default:
+		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
+		break;
+	}
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
 
 		/*
 		 * CSC: BT.601 Limited Range RGB to YCbCr coefficients.
@@ -71,44 +257,24 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 		       lcdif->base + LCDC_V8_CSC0_COEF4);
 		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
 		       lcdif->base + LCDC_V8_CSC0_COEF5);
+	} else if (in_yuv && !out_yuv) {
+		/* YCbCr -> RGB */
+		const u32 *coeffs =
+			lcdif_yuv2rgb_coeffs[plane_state->color_encoding]
+					    [plane_state->color_range];
 
-		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
+		writel(CSC0_CTRL_CSC_MODE_YCbCr2RGB,
 		       lcdif->base + LCDC_V8_CSC0_CTRL);
 
-		break;
-	default:
-		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);
-		break;
-	}
-
-	switch (format) {
-	case DRM_FORMAT_RGB565:
-		writel(CTRLDESCL0_5_BPP_16_RGB565,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
-		break;
-	case DRM_FORMAT_RGB888:
-		writel(CTRLDESCL0_5_BPP_24_RGB888,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
-		break;
-	case DRM_FORMAT_XRGB1555:
-		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
-		break;
-	case DRM_FORMAT_XRGB4444:
-		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
-		break;
-	case DRM_FORMAT_XBGR8888:
-		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
-		break;
-	case DRM_FORMAT_XRGB8888:
-		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
-		break;
-	default:
-		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
-		break;
+		writel(coeffs[0], lcdif->base + LCDC_V8_CSC0_COEF0);
+		writel(coeffs[1], lcdif->base + LCDC_V8_CSC0_COEF1);
+		writel(coeffs[2], lcdif->base + LCDC_V8_CSC0_COEF2);
+		writel(coeffs[3], lcdif->base + LCDC_V8_CSC0_COEF3);
+		writel(coeffs[4], lcdif->base + LCDC_V8_CSC0_COEF4);
+		writel(coeffs[5], lcdif->base + LCDC_V8_CSC0_COEF5);
+	} else {
+		/* RGB -> RGB, YCbCr -> YCbCr: bypass colorspace converter. */
+		writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
 	}
 }
 
@@ -194,6 +360,7 @@ static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
 }
 
 static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
+				     struct drm_plane_state *plane_state,
 				     struct drm_bridge_state *bridge_state,
 				     const u32 bus_format)
 {
@@ -216,7 +383,7 @@ static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
 	/* Mandatory eLCDIF reset as per the Reference Manual */
 	lcdif_reset_block(lcdif);
 
-	lcdif_set_formats(lcdif, bus_format);
+	lcdif_set_formats(lcdif, plane_state, bus_format);
 
 	lcdif_set_mode(lcdif, bus_flags);
 }
@@ -299,7 +466,7 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	pm_runtime_get_sync(drm->dev);
 
-	lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
+	lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
 	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
@@ -443,12 +610,19 @@ static const struct drm_plane_funcs lcdif_plane_funcs = {
 };
 
 static const u32 lcdif_primary_plane_formats[] = {
+	/* RGB */
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_XRGB4444,
 	DRM_FORMAT_XRGB8888,
+
+	/* Packed YCbCr */
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
 };
 
 static const u64 lcdif_modifiers[] = {
@@ -462,6 +636,11 @@ static const u64 lcdif_modifiers[] = {
 
 int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 {
+	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
+					BIT(DRM_COLOR_YCBCR_BT709) |
+					BIT(DRM_COLOR_YCBCR_BT2020);
+	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 	struct drm_encoder *encoder = &lcdif->encoder;
 	struct drm_crtc *crtc = &lcdif->crtc;
 	int ret;
@@ -477,6 +656,14 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 	if (ret)
 		return ret;
 
+	ret = drm_plane_create_color_properties(&lcdif->planes.primary,
+						supported_encodings,
+						supported_ranges,
+						DRM_COLOR_YCBCR_BT601,
+						DRM_COLOR_YCBCR_LIMITED_RANGE);
+	if (ret)
+		return ret;
+
 	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
 	ret = drm_crtc_init_with_planes(lcdif->drm, crtc,
 					&lcdif->planes.primary, NULL,
diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index 03c7827bdf5a..2d3920b8371e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -212,7 +212,10 @@
 #define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(0x3 << 14)
 #define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
 
-#define CSC0_CTRL_CSC_MODE_RGB2YCbCr	GENMASK(2, 1)
+#define CSC0_CTRL_CSC_MODE_YUV2RGB	(0x0 << 1)
+#define CSC0_CTRL_CSC_MODE_YCbCr2RGB	(0x1 << 1)
+#define CSC0_CTRL_CSC_MODE_RGB2YUV	(0x2 << 1)
+#define CSC0_CTRL_CSC_MODE_RGB2YCbCr	(0x3 << 1)
 #define CSC0_CTRL_CSC_MODE_MASK		GENMASK(2, 1)
 #define CSC0_CTRL_BYPASS		BIT(0)
 
-- 
Regards,

Laurent Pinchart

