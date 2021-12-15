Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0C4764D8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5108710FAE0;
	Wed, 15 Dec 2021 21:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B9710FAE0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:48:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFIjXQb026335;
 Wed, 15 Dec 2021 22:48:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=KDBBSC2Jp0beHPBPjDebpa/g/sde3MElNeSyHWIo9O0=;
 b=V/I0QUjJ8VMHjgu+zXByyzXAGVjy2XC3KRgxhx7eq9mVqn6wDcuDVD/X/rROEUftMi4J
 qItSVK3n01tEvvOjHG1eU0gca2UuxrQJYC4sikz+ZRyI583TIwKmZerya3+/i7SKYPAq
 7j+31+2hF37trNvk2Yji12efP9IVir+685pCHA392+SRMOpt9LsVtfLO9x3+O7Ur8vAI
 uSB+lljYU9oeqUE6O+SWZA3HLmNgu/5nV1G5S67KaMuhDv8KX1tzrVarTooSV4JD4dAL
 IObkSHURg/yOdiRxCA+izdXnlqo1vPp4atevcl6RoVUI5M8KxEdbPC67tV/dg4u0jbN/ 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cyfpxjj3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 22:48:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A546610002A;
 Wed, 15 Dec 2021 22:48:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BB2620A74F;
 Wed, 15 Dec 2021 22:48:45 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 22:48:45
 +0100
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] drm/stm: ltdc: add support of ycbcr pixel formats
Date: Wed, 15 Dec 2021 22:48:43 +0100
Message-ID: <20211215214843.20703-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
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

This patch adds the following YCbCr input pixel formats on the latest
LTDC hardware version:

1 plane  (co-planar)  : YUYV, YVYU, UYVY, VYUY
2 planes (semi-planar): NV12, NV21
3 planes (full-planar): YU12=I420=DRM YUV420, YV12=DRM YVU420

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 251 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/stm/ltdc.h |   1 +
 2 files changed, 245 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 4d249bc99894..7fd173390b9f 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -198,6 +198,21 @@
 
 #define LXCFBLNR_CFBLN	GENMASK(10, 0)	/* Color Frame Buffer Line Number */
 
+#define LXCR_C1R_YIA	BIT(0)		/* Ycbcr 422 Interleaved Ability */
+#define LXCR_C1R_YSPA	BIT(1)		/* Ycbcr 420 Semi-Planar Ability */
+#define LXCR_C1R_YFPA	BIT(2)		/* Ycbcr 420 Full-Planar Ability */
+#define LXCR_C1R_SCA	BIT(31)		/* SCaling Ability*/
+
+#define LxPCR_YREN	BIT(9)		/* Y Rescale Enable for the color dynamic range */
+#define LxPCR_OF	BIT(8)		/* Odd pixel First */
+#define LxPCR_CBF	BIT(7)		/* CB component First */
+#define LxPCR_YF	BIT(6)		/* Y component First */
+#define LxPCR_YCM	GENMASK(5, 4)	/* Ycbcr Conversion Mode */
+#define YCM_I		0x0		/* Interleaved 422 */
+#define YCM_SP		0x1		/* Semi-Planar 420 */
+#define YCM_FP		0x2		/* Full-Planar 420 */
+#define LxPCR_YCEN	BIT(3)		/* YCbCr-to-RGB Conversion Enable */
+
 #define LXRCR_IMR	BIT(0)		/* IMmediate Reload */
 #define LXRCR_VBR	BIT(1)		/* Vertical Blanking Reload */
 #define LXRCR_GRMSK	BIT(2)		/* Global (centralized) Reload MaSKed */
@@ -311,6 +326,23 @@ static const u32 ltdc_drm_fmt_a2[] = {
 	DRM_FORMAT_C8
 };
 
+static const u32 ltdc_drm_fmt_ycbcr_cp[] = {
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY
+};
+
+static const u32 ltdc_drm_fmt_ycbcr_sp[] = {
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21
+};
+
+static const u32 ltdc_drm_fmt_ycbcr_fp[] = {
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420
+};
+
 /* Layer register offsets */
 static const u32 ltdc_layer_regs_a0[] = {
 	0x80,	/* L1 configuration 0 */
@@ -410,6 +442,26 @@ static const struct regmap_config stm32_ltdc_regmap_cfg = {
 	.cache_type = REGCACHE_NONE,
 };
 
+static const u32 ltdc_ycbcr2rgb_coeffs[DRM_COLOR_ENCODING_MAX][DRM_COLOR_RANGE_MAX][2] = {
+	[DRM_COLOR_YCBCR_BT601][DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+		0x02040199,	/* (b_cb = 516 / r_cr = 409) */
+		0x006400D0	/* (g_cb = 100 / g_cr = 208) */
+	},
+	[DRM_COLOR_YCBCR_BT601][DRM_COLOR_YCBCR_FULL_RANGE] = {
+		0x01C60167,	/* (b_cb = 454 / r_cr = 359) */
+		0x005800B7	/* (g_cb = 88 / g_cr = 183) */
+	},
+	[DRM_COLOR_YCBCR_BT709][DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+		0x021D01CB,	/* (b_cb = 541 / r_cr = 459) */
+		0x00370089	/* (g_cb = 55 / g_cr = 137) */
+	},
+	[DRM_COLOR_YCBCR_BT709][DRM_COLOR_YCBCR_FULL_RANGE] = {
+		0x01DB0193,	/* (b_cb = 475 / r_cr = 403) */
+		0x00300078	/* (g_cb = 48 / g_cr = 120) */
+	}
+	/* BT2020 not supported */
+};
+
 static inline struct ltdc_device *crtc_to_ltdc(struct drm_crtc *crtc)
 {
 	return (struct ltdc_device *)crtc->dev->dev_private;
@@ -540,6 +592,78 @@ static inline u32 is_xrgb(u32 drm)
 	return ((drm & 0xFF) == 'X' || ((drm >> 8) & 0xFF) == 'X');
 }
 
+static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fmt)
+{
+	struct ltdc_device *ldev = plane_to_ltdc(plane);
+	struct drm_plane_state *state = plane->state;
+	u32 lofs = plane->index * LAY_OFS;
+	u32 val;
+
+	switch (drm_pix_fmt) {
+	case DRM_FORMAT_YUYV:
+		val = (YCM_I << 4) | LxPCR_YF | LxPCR_CBF;
+		break;
+	case DRM_FORMAT_YVYU:
+		val = (YCM_I << 4) | LxPCR_YF;
+		break;
+	case DRM_FORMAT_UYVY:
+		val = (YCM_I << 4) | LxPCR_CBF;
+		break;
+	case DRM_FORMAT_VYUY:
+		val = (YCM_I << 4);
+		break;
+	case DRM_FORMAT_NV12:
+		val = (YCM_SP << 4) | LxPCR_CBF;
+		break;
+	case DRM_FORMAT_NV21:
+		val = (YCM_SP << 4);
+		break;
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YVU420:
+		val = (YCM_FP << 4);
+		break;
+	default:
+		/* RGB or not a YCbCr supported format */
+		break;
+	}
+
+	/* Enable limited range */
+	if (state->color_range == DRM_COLOR_YCBCR_LIMITED_RANGE)
+		val |= LxPCR_YREN;
+
+	/* enable ycbcr conversion */
+	val |= LxPCR_YCEN;
+
+	regmap_write(ldev->regmap, LTDC_L1PCR + lofs, val);
+}
+
+static inline void ltdc_set_ycbcr_coeffs(struct drm_plane *plane)
+{
+	struct ltdc_device *ldev = plane_to_ltdc(plane);
+	struct drm_plane_state *state = plane->state;
+	enum drm_color_encoding enc = state->color_encoding;
+	enum drm_color_range ran = state->color_range;
+	u32 lofs = plane->index * LAY_OFS;
+
+	if (enc != DRM_COLOR_YCBCR_BT601 && enc != DRM_COLOR_YCBCR_BT709) {
+		DRM_ERROR("color encoding %d not supported, use bt601 by default\n", enc);
+		/* set by default color encoding to DRM_COLOR_YCBCR_BT601 */
+		enc = DRM_COLOR_YCBCR_BT601;
+	}
+
+	if (ran != DRM_COLOR_YCBCR_LIMITED_RANGE && ran != DRM_COLOR_YCBCR_FULL_RANGE) {
+		DRM_ERROR("color range %d not supported, use limited range by default\n", ran);
+		/* set by default color range to DRM_COLOR_YCBCR_LIMITED_RANGE */
+		ran = DRM_COLOR_YCBCR_LIMITED_RANGE;
+	}
+
+	DRM_DEBUG_DRIVER("Color encoding=%d, range=%d\n", enc, ran);
+	regmap_write(ldev->regmap, LTDC_L1CYR0R + lofs,
+		     ltdc_ycbcr2rgb_coeffs[enc][ran][0]);
+	regmap_write(ldev->regmap, LTDC_L1CYR1R + lofs,
+		     ltdc_ycbcr2rgb_coeffs[enc][ran][1]);
+}
+
 static irqreturn_t ltdc_irq_thread(int irq, void *arg)
 {
 	struct drm_device *ddev = arg;
@@ -1010,7 +1134,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	u32 y0 = newstate->crtc_y;
 	u32 y1 = newstate->crtc_y + newstate->crtc_h - 1;
 	u32 src_x, src_y, src_w, src_h;
-	u32 val, pitch_in_bytes, line_length, paddr, ahbp, avbp, bpcr;
+	u32 val, pitch_in_bytes, line_length, line_number, paddr, ahbp, avbp, bpcr;
 	enum ltdc_pix_fmt pf;
 
 	if (!newstate->crtc || !fb) {
@@ -1086,8 +1210,8 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs, LXBFCR_BF2 | LXBFCR_BF1, val);
 
 	/* Configures the frame buffer line number */
-	val = y1 - y0 + 1;
-	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, val);
+	line_number = y1 - y0 + 1;
+	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, line_number);
 
 	/* Sets the FB address */
 	paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 0);
@@ -1095,6 +1219,77 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	DRM_DEBUG_DRIVER("fb: phys 0x%08x", paddr);
 	regmap_write(ldev->regmap, LTDC_L1CFBAR + lofs, paddr);
 
+	if (ldev->caps.ycbcr_input) {
+		if (fb->format->is_yuv) {
+			switch (fb->format->format) {
+			case DRM_FORMAT_NV12:
+			case DRM_FORMAT_NV21:
+			/* Configure the auxiliary frame buffer address 0 & 1 */
+			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
+			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr + 1);
+
+			/* Configure the buffer length */
+			val = ((pitch_in_bytes << 16) | line_length);
+			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
+
+			/* Configure the frame buffer line number */
+			val = (line_number >> 1);
+			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
+			break;
+			case DRM_FORMAT_YUV420:
+			/* Configure the auxiliary frame buffer address 0 */
+			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
+
+			/* Configure the auxiliary frame buffer address 1 */
+			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
+			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
+
+			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
+				      (ldev->caps.bus_width >> 3) - 1;
+
+			/* Configure the buffer length */
+			val = (((pitch_in_bytes >> 1) << 16) | line_length);
+			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
+
+			/* Configure the frame buffer line number */
+			val = (line_number >> 1);
+			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
+			break;
+			case DRM_FORMAT_YVU420:
+			/* Configure the auxiliary frame buffer address 0 */
+			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
+			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
+
+			/* Configure the auxiliary frame buffer address 1 */
+			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
+
+			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
+				      (ldev->caps.bus_width >> 3) - 1;
+
+			/* Configure the buffer length */
+			val = (((pitch_in_bytes >> 1) << 16) | line_length);
+			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
+
+			/* Configure the frame buffer line number */
+			val = (line_number >> 1);
+			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
+			break;
+			}
+
+			/* Configure YCbC conversion coefficient */
+			ltdc_set_ycbcr_coeffs(plane);
+
+			/* Configure YCbCr format and enable/disable conversion */
+			ltdc_set_ycbcr_config(plane, fb->format->format);
+		} else {
+			/* disable ycbcr conversion */
+			regmap_write(ldev->regmap, LTDC_L1PCR + lofs, 0);
+		}
+	}
+
 	/* Enable layer and CLUT if needed */
 	val = fb->format->format == DRM_FORMAT_C8 ? LXCR_CLUTEN : 0;
 	val |= LXCR_LEN;
@@ -1186,7 +1381,8 @@ static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs = {
 };
 
 static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
-					   enum drm_plane_type type)
+					   enum drm_plane_type type,
+					   int index)
 {
 	unsigned long possible_crtcs = CRTC_MASK;
 	struct ltdc_device *ldev = ddev->dev_private;
@@ -1196,9 +1392,16 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 	u32 *formats;
 	u32 drm_fmt;
 	const u64 *modifiers = ltdc_format_modifiers;
+	u32 lofs = index * LAY_OFS;
+	u32 val;
 	int ret;
 
-	formats = devm_kzalloc(dev, ldev->caps.pix_fmt_nb * sizeof(*formats), GFP_KERNEL);
+	/* Allocate the biggest size according to supported color formats */
+	formats = devm_kzalloc(dev, (ldev->caps.pix_fmt_nb +
+			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_cp) +
+			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_sp) +
+			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_fp)) *
+			       sizeof(*formats), GFP_KERNEL);
 
 	for (i = 0; i < ldev->caps.pix_fmt_nb; i++) {
 		drm_fmt = ldev->caps.pix_fmt_drm[i];
@@ -1212,6 +1415,26 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 		formats[nb_fmt++] = drm_fmt;
 	}
 
+	/* Add YCbCr supported pixel formats */
+	if (ldev->caps.ycbcr_input) {
+		regmap_read(ldev->regmap, LTDC_L1C1R + lofs, &val);
+		if (val & LXCR_C1R_YIA) {
+			memcpy(&formats[nb_fmt], ltdc_drm_fmt_ycbcr_cp,
+			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_cp) * sizeof(*formats));
+			nb_fmt += ARRAY_SIZE(ltdc_drm_fmt_ycbcr_cp);
+		}
+		if (val & LXCR_C1R_YSPA) {
+			memcpy(&formats[nb_fmt], ltdc_drm_fmt_ycbcr_sp,
+			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_sp) * sizeof(*formats));
+			nb_fmt += ARRAY_SIZE(ltdc_drm_fmt_ycbcr_sp);
+		}
+		if (val & LXCR_C1R_YFPA) {
+			memcpy(&formats[nb_fmt], ltdc_drm_fmt_ycbcr_fp,
+			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_fp) * sizeof(*formats));
+			nb_fmt += ARRAY_SIZE(ltdc_drm_fmt_ycbcr_fp);
+		}
+	}
+
 	plane = devm_kzalloc(dev, sizeof(*plane), GFP_KERNEL);
 	if (!plane)
 		return NULL;
@@ -1222,6 +1445,17 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 	if (ret < 0)
 		return NULL;
 
+	if (ldev->caps.ycbcr_input) {
+		if (val & (LXCR_C1R_YIA | LXCR_C1R_YSPA | LXCR_C1R_YFPA))
+			drm_plane_create_color_properties(plane,
+							  BIT(DRM_COLOR_YCBCR_BT601) |
+							  BIT(DRM_COLOR_YCBCR_BT709),
+							  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+							  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+							  DRM_COLOR_YCBCR_BT601,
+							  DRM_COLOR_YCBCR_LIMITED_RANGE);
+	}
+
 	drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
 
 	drm_plane_create_alpha_property(plane);
@@ -1247,7 +1481,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 	unsigned int i;
 	int ret;
 
-	primary = ltdc_plane_create(ddev, DRM_PLANE_TYPE_PRIMARY);
+	primary = ltdc_plane_create(ddev, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (!primary) {
 		DRM_ERROR("Can not create primary plane\n");
 		return -EINVAL;
@@ -1271,7 +1505,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 
 	/* Add planes. Note : the first layer is used by primary plane */
 	for (i = 1; i < ldev->caps.nb_layers; i++) {
-		overlay = ltdc_plane_create(ddev, DRM_PLANE_TYPE_OVERLAY);
+		overlay = ltdc_plane_create(ddev, DRM_PLANE_TYPE_OVERLAY, i);
 		if (!overlay) {
 			ret = -ENOMEM;
 			DRM_ERROR("Can not create overlay plane %d\n", i);
@@ -1403,6 +1637,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		if (ldev->caps.hw_version == HWVER_10200)
 			ldev->caps.pad_max_freq_hz = 65000000;
 		ldev->caps.nb_irq = 2;
+		ldev->caps.ycbcr_input = false;
 		ldev->caps.ycbcr_output = false;
 		ldev->caps.plane_reg_shadow = false;
 		break;
@@ -1416,6 +1651,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.non_alpha_only_l1 = false;
 		ldev->caps.pad_max_freq_hz = 150000000;
 		ldev->caps.nb_irq = 4;
+		ldev->caps.ycbcr_input = false;
 		ldev->caps.ycbcr_output = false;
 		ldev->caps.plane_reg_shadow = false;
 		break;
@@ -1429,6 +1665,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.non_alpha_only_l1 = false;
 		ldev->caps.pad_max_freq_hz = 90000000;
 		ldev->caps.nb_irq = 2;
+		ldev->caps.ycbcr_input = true;
 		ldev->caps.ycbcr_output = true;
 		ldev->caps.plane_reg_shadow = true;
 		break;
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index adc4f9cf7f95..6968d1ca5149 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -24,6 +24,7 @@ struct ltdc_caps {
 	bool non_alpha_only_l1; /* non-native no-alpha formats on layer 1 */
 	int pad_max_freq_hz;	/* max frequency supported by pad */
 	int nb_irq;		/* number of hardware interrupts */
+	bool ycbcr_input;	/* ycbcr input converter supported */
 	bool ycbcr_output;	/* ycbcr output converter supported */
 	bool plane_reg_shadow;	/* plane shadow registers ability */
 };
-- 
2.17.1

