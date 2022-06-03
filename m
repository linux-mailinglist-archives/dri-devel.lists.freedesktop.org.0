Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85253CBEE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 17:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5753C11326B;
	Fri,  3 Jun 2022 15:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B013111327F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 15:02:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2539LorH004996;
 Fri, 3 Jun 2022 17:01:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=tG0Xrps0gSb8j0LO/2hOXRkpfo2qB4od4SXrRGwS0Gs=;
 b=GUHE2LXoCAgbFsCsL5BpOdlRvRysydFy0yE8RDe3fKVFCXdImx2/PgmGqRBtdBAQH52o
 f6XoCwbR/6xPtlFsJeDD7UPvXaANzD7hCrZO64pl4BA8T2KGpB9ls/NkGoZyZTpHXwvr
 0uwAf6rLcR7dDE2Q3yMJIvY0qpy2bCpAJorPsKoFJ0EI+v51F7C+2aFE+HI7LXIIP8uO
 YdzJQdfehNHWR93EWt03rn0dO5HAP6S2Fq1NDxegRJ4c/4fEig3T6D+WbCmwz4O9E8oO
 ogexgufgeV1TvIPOg8hsDAQLGmak++OdDK4uBuzxYy1yJZw1AYmYKKhvnsAwFQsyB+1X gw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc516qt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jun 2022 17:01:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2F83E4008A;
 Fri,  3 Jun 2022 15:46:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CA6F2278A1;
 Fri,  3 Jun 2022 15:45:49 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 3 Jun
 2022 15:45:48 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: add support of horizontal & vertical mirroring
Date: Fri, 3 Jun 2022 15:45:47 +0200
Message-ID: <20220603134547.593790-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_05,2022-06-03_01,2022-02-23_01
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

Support of vertical & horizontal mirroring features thanks to
the plane rotation property.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 163 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/stm/ltdc.h |   1 +
 2 files changed, 108 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 00a6bc1b1d7c..ff2075dd9474 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -180,6 +180,7 @@
 #define LXCR_LEN	BIT(0)		/* Layer ENable */
 #define LXCR_COLKEN	BIT(1)		/* Color Keying Enable */
 #define LXCR_CLUTEN	BIT(4)		/* Color Look-Up Table ENable */
+#define LXCR_HMEN	BIT(8)		/* Horizontal Mirroring ENable */
 
 #define LXWHPCR_WHSTPOS	GENMASK(11, 0)	/* Window Horizontal StarT POSition */
 #define LXWHPCR_WHSPPOS	GENMASK(27, 16)	/* Window Horizontal StoP POSition */
@@ -197,7 +198,7 @@
 #define LXBFCR_BOR	GENMASK(18, 16) /* Blending ORder */
 
 #define LXCFBLR_CFBLL	GENMASK(12, 0)	/* Color Frame Buffer Line Length */
-#define LXCFBLR_CFBP	GENMASK(28, 16)	/* Color Frame Buffer Pitch in bytes */
+#define LXCFBLR_CFBP	GENMASK(31, 16) /* Color Frame Buffer Pitch in bytes */
 
 #define LXCFBLNR_CFBLN	GENMASK(10, 0)	/* Color Frame Buffer Line Number */
 
@@ -1237,7 +1238,8 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	u32 y0 = newstate->crtc_y;
 	u32 y1 = newstate->crtc_y + newstate->crtc_h - 1;
 	u32 src_x, src_y, src_w, src_h;
-	u32 val, pitch_in_bytes, line_length, line_number, paddr, ahbp, avbp, bpcr;
+	u32 val, pitch_in_bytes, line_length, line_number, ahbp, avbp, bpcr;
+	u32 paddr, paddr1, paddr2;
 	enum ltdc_pix_fmt pf;
 
 	if (!newstate->crtc || !fb) {
@@ -1289,13 +1291,6 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	}
 	regmap_write_bits(ldev->regmap, LTDC_L1PFCR + lofs, LXPFCR_PF, val);
 
-	/* Configures the color frame buffer pitch in bytes & line length */
-	pitch_in_bytes = fb->pitches[0];
-	line_length = fb->format->cpp[0] *
-		      (x1 - x0 + 1) + (ldev->caps.bus_width >> 3) - 1;
-	val = ((pitch_in_bytes << 16) | line_length);
-	regmap_write_bits(ldev->regmap, LTDC_L1CFBLR + lofs, LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
-
 	/* Specifies the constant alpha value */
 	val = newstate->alpha >> 8;
 	regmap_write_bits(ldev->regmap, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
@@ -1319,76 +1314,115 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 				  LXBFCR_BF2 | LXBFCR_BF1, val);
 	}
 
-	/* Configures the frame buffer line number */
-	line_number = y1 - y0 + 1;
-	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, line_number);
-
 	/* Sets the FB address */
 	paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 0);
 
+	if (newstate->rotation & DRM_MODE_REFLECT_X)
+		paddr += (fb->format->cpp[0] * (x1 - x0 + 1)) - 1;
+
+	if (newstate->rotation & DRM_MODE_REFLECT_Y)
+		paddr += (fb->pitches[0] * (y1 - y0));
+
 	DRM_DEBUG_DRIVER("fb: phys 0x%08x", paddr);
 	regmap_write(ldev->regmap, LTDC_L1CFBAR + lofs, paddr);
 
+	/* Configures the color frame buffer pitch in bytes & line length */
+	line_length = fb->format->cpp[0] *
+		      (x1 - x0 + 1) + (ldev->caps.bus_width >> 3) - 1;
+
+	if (newstate->rotation & DRM_MODE_REFLECT_Y)
+		/* Compute negative value (signed on 16 bits) for the picth */
+		pitch_in_bytes = 0x10000 - fb->pitches[0];
+	else
+		pitch_in_bytes = fb->pitches[0];
+
+	val = (pitch_in_bytes << 16) | line_length;
+	regmap_write_bits(ldev->regmap, LTDC_L1CFBLR + lofs, LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
+
+	/* Configures the frame buffer line number */
+	line_number = y1 - y0 + 1;
+	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, line_number);
+
 	if (ldev->caps.ycbcr_input) {
 		if (fb->format->is_yuv) {
 			switch (fb->format->format) {
 			case DRM_FORMAT_NV12:
 			case DRM_FORMAT_NV21:
-			/* Configure the auxiliary frame buffer address 0 & 1 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
-			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
-			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr + 1);
+			/* Configure the auxiliary frame buffer address 0 */
+			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+
+			if (newstate->rotation & DRM_MODE_REFLECT_X)
+				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
 
-			/* Configure the buffer length */
-			val = ((pitch_in_bytes << 16) | line_length);
-			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
+			if (newstate->rotation & DRM_MODE_REFLECT_Y)
+				paddr1 += (fb->pitches[1] * (y1 - y0 - 1)) >> 1;
 
-			/* Configure the frame buffer line number */
-			val = (line_number >> 1);
-			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
+			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr1);
 			break;
 			case DRM_FORMAT_YUV420:
-			/* Configure the auxiliary frame buffer address 0 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
-			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
-
-			/* Configure the auxiliary frame buffer address 1 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
-			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
+			/* Configure the auxiliary frame buffer address 0 & 1 */
+			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			paddr2 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
 
-			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
-				      (ldev->caps.bus_width >> 3) - 1;
+			if (newstate->rotation & DRM_MODE_REFLECT_X) {
+				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
+				paddr2 += ((fb->format->cpp[2] * (x1 - x0 + 1)) >> 1) - 1;
+			}
 
-			/* Configure the buffer length */
-			val = (((pitch_in_bytes >> 1) << 16) | line_length);
-			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
+			if (newstate->rotation & DRM_MODE_REFLECT_Y) {
+				paddr1 += (fb->pitches[1] * (y1 - y0 - 1)) >> 1;
+				paddr2 += (fb->pitches[2] * (y1 - y0 - 1)) >> 1;
+			}
 
-			/* Configure the frame buffer line number */
-			val = (line_number >> 1);
-			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
+			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr1);
+			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr2);
 			break;
 			case DRM_FORMAT_YVU420:
-			/* Configure the auxiliary frame buffer address 0 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
-			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
-
-			/* Configure the auxiliary frame buffer address 1 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
-			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
+			/* Configure the auxiliary frame buffer address 0 & 1 */
+			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
+			paddr2 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
 
-			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
-				      (ldev->caps.bus_width >> 3) - 1;
+			if (newstate->rotation & DRM_MODE_REFLECT_X) {
+				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
+				paddr2 += ((fb->format->cpp[2] * (x1 - x0 + 1)) >> 1) - 1;
+			}
 
-			/* Configure the buffer length */
-			val = (((pitch_in_bytes >> 1) << 16) | line_length);
-			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
+			if (newstate->rotation & DRM_MODE_REFLECT_Y) {
+				paddr1 += (fb->pitches[1] * (y1 - y0 - 1)) >> 1;
+				paddr2 += (fb->pitches[2] * (y1 - y0 - 1)) >> 1;
+			}
 
-			/* Configure the frame buffer line number */
-			val = (line_number >> 1);
-			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
+			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr1);
+			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr2);
 			break;
 			}
 
+			/*
+			 * Set the length and the number of lines of the auxiliary
+			 * buffers if the framebuffer contains more than one plane.
+			 */
+			if (fb->format->num_planes > 1) {
+				if (newstate->rotation & DRM_MODE_REFLECT_Y)
+					/*
+					 * Compute negative value (signed on 16 bits)
+					 * for the picth
+					 */
+					pitch_in_bytes = 0x10000 - fb->pitches[1];
+				else
+					pitch_in_bytes = fb->pitches[1];
+
+				line_length = ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) +
+					      (ldev->caps.bus_width >> 3) - 1;
+
+				/* Configure the auxiliary buffer length */
+				val = (pitch_in_bytes << 16) | line_length;
+				regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
+
+				/* Configure the auxiliary frame buffer line number */
+				val = line_number >> 1;
+				regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
+			}
+
 			/* Configure YCbC conversion coefficient */
 			ltdc_set_ycbcr_coeffs(plane);
 
@@ -1403,7 +1437,12 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	/* Enable layer and CLUT if needed */
 	val = fb->format->format == DRM_FORMAT_C8 ? LXCR_CLUTEN : 0;
 	val |= LXCR_LEN;
-	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN, val);
+
+	/* Enable horizontal mirroring if requested */
+	if (newstate->rotation & DRM_MODE_REFLECT_X)
+		val |= LXCR_HMEN;
+
+	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN | LXCR_HMEN, val);
 
 	/* Commit shadow registers = update plane at next vblank */
 	if (ldev->caps.plane_reg_shadow)
@@ -1432,8 +1471,8 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
 	struct ltdc_device *ldev = plane_to_ltdc(plane);
 	u32 lofs = plane->index * LAY_OFS;
 
-	/* disable layer */
-	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN, 0);
+	/* Disable layer */
+	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN |  LXCR_HMEN, 0);
 
 	/* Commit shadow registers = update plane at next vblank */
 	if (ldev->caps.plane_reg_shadow)
@@ -1577,6 +1616,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = ddev->dev_private;
 	struct drm_plane *primary, *overlay;
+	int supported_rotations = DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
 	unsigned int i;
 	int ret;
 
@@ -1591,6 +1631,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 	else
 		drm_plane_create_zpos_immutable_property(primary, 0);
 
+	if (ldev->caps.plane_rotation)
+		drm_plane_create_rotation_property(primary, DRM_MODE_ROTATE_0,
+						   supported_rotations);
+
 	/* Init CRTC according to its hardware features */
 	if (ldev->caps.crc)
 		ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
@@ -1622,6 +1666,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 			drm_plane_create_zpos_property(overlay, i, 0, ldev->caps.nb_layers - 1);
 		else
 			drm_plane_create_zpos_immutable_property(overlay, i);
+
+		if (ldev->caps.plane_rotation)
+			drm_plane_create_rotation_property(overlay, DRM_MODE_ROTATE_0,
+							   supported_rotations);
 	}
 
 	return 0;
@@ -1752,6 +1800,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.plane_reg_shadow = false;
 		ldev->caps.crc = false;
 		ldev->caps.dynamic_zorder = false;
+		ldev->caps.plane_rotation = false;
 		break;
 	case HWVER_20101:
 		ldev->caps.layer_ofs = LAY_OFS_0;
@@ -1768,6 +1817,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.plane_reg_shadow = false;
 		ldev->caps.crc = false;
 		ldev->caps.dynamic_zorder = false;
+		ldev->caps.plane_rotation = false;
 		break;
 	case HWVER_40100:
 		ldev->caps.layer_ofs = LAY_OFS_1;
@@ -1784,6 +1834,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.plane_reg_shadow = true;
 		ldev->caps.crc = true;
 		ldev->caps.dynamic_zorder = true;
+		ldev->caps.plane_rotation = true;
 		break;
 	default:
 		return -ENODEV;
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index 4855898bd4c0..15139980d8ea 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -29,6 +29,7 @@ struct ltdc_caps {
 	bool plane_reg_shadow;	/* plane shadow registers ability */
 	bool crc;		/* cyclic redundancy check supported */
 	bool dynamic_zorder;	/* dynamic z-order */
+	bool plane_rotation;	/* plane rotation */
 };
 
 #define LTDC_MAX_LAYER	4
-- 
2.25.1

