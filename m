Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AAA27579C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 13:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B3C6E996;
	Wed, 23 Sep 2020 11:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1C26E996
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 11:58:37 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwXTK029844;
 Wed, 23 Sep 2020 06:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600862313;
 bh=HSH6w98vZ5KUzWOPpRJA2krlz2qkBQvm0lL/aJtWvbM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=af7DSjr3JpkAyT9Ujp0748sak2zxzcnKpk8jugHdIj2G48Ik9now49Zcwk6kJ8coD
 qNkk6SRYlM6ou+QqQ+iYa3YQtJIbacxQ/7KnAwX+yNQPjOyYL3UkY5kWaNE+TT2vg6
 w6he08t9XzWonYKht0fVtgfjSLHA1S5QZjQeCj08=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwXP3047931;
 Wed, 23 Sep 2020 06:58:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 06:58:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 06:58:33 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwJi1038765;
 Wed, 23 Sep 2020 06:58:31 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jyri Sarha <jsarha@ti.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 5/5] drm/omap: Enable COLOR_ENCODING and COLOR_RANGE
 properties for planes
Date: Wed, 23 Sep 2020 14:57:27 +0300
Message-ID: <20200923115727.248705-6-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200923115727.248705-1-tomi.valkeinen@ti.com>
References: <20200923115727.248705-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jyri Sarha <jsarha@ti.com>

Adds support for COLOR_ENCODING and COLOR_RANGE properties to
omap_plane.c and dispc.c. The supported encodings and ranges are
presets are:

For COLOR_ENCODING:
- YCbCr BT.601 (default)
- YCbCr BT.709

For COLOR_RANGE:
- YCbCr limited range
- YCbCr full range (default)

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c   | 104 ++++++++++++++++----------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |   4 +
 drivers/gpu/drm/omapdrm/omap_plane.c  |  30 ++++++++
 3 files changed, 97 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 48593932bddf..bf0c9d293077 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -874,50 +874,67 @@ static void dispc_ovl_write_color_conv_coef(struct dispc_device *dispc,
 #undef CVAL
 }
 
-static void dispc_wb_write_color_conv_coef(struct dispc_device *dispc,
-					   const struct csc_coef_rgb2yuv *ct)
-{
-	const enum omap_plane_id plane = OMAP_DSS_WB;
-
-#define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
+/* YUV -> RGB, ITU-R BT.601, full range */
+static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt601_full = {
+	256,   0,  358,		/* ry, rcb, rcr |1.000  0.000  1.402|*/
+	256, -88, -182,		/* gy, gcb, gcr |1.000 -0.344 -0.714|*/
+	256, 452,    0,		/* by, bcb, bcr |1.000  1.772  0.000|*/
+	true,			/* full range */
+};
 
-	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 0), CVAL(ct->yg,  ct->yr));
-	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 1), CVAL(ct->crr, ct->yb));
-	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->crb, ct->crg));
-	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 3), CVAL(ct->cbg, ct->cbr));
-	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 4), CVAL(0, ct->cbb));
+/* YUV -> RGB, ITU-R BT.601, limited range */
+static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt601_lim = {
+	298,    0,  409,	/* ry, rcb, rcr |1.164  0.000  1.596|*/
+	298, -100, -208,	/* gy, gcb, gcr |1.164 -0.392 -0.813|*/
+	298,  516,    0,	/* by, bcb, bcr |1.164  2.017  0.000|*/
+	false,			/* limited range */
+};
 
-	REG_FLD_MOD(dispc, DISPC_OVL_ATTRIBUTES(plane), ct->full_range, 11, 11);
+/* YUV -> RGB, ITU-R BT.709, full range */
+static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt709_full = {
+	256,    0,  402,        /* ry, rcb, rcr |1.000  0.000  1.570|*/
+	256,  -48, -120,        /* gy, gcb, gcr |1.000 -0.187 -0.467|*/
+	256,  475,    0,        /* by, bcb, bcr |1.000  1.856  0.000|*/
+	true,                   /* full range */
+};
 
-#undef CVAL
-}
+/* YUV -> RGB, ITU-R BT.709, limited range */
+static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt709_lim = {
+	298,    0,  459,	/* ry, rcb, rcr |1.164  0.000  1.793|*/
+	298,  -55, -136,	/* gy, gcb, gcr |1.164 -0.213 -0.533|*/
+	298,  541,    0,	/* by, bcb, bcr |1.164  2.112  0.000|*/
+	false,			/* limited range */
+};
 
-static void dispc_setup_color_conv_coef(struct dispc_device *dispc)
+static int dispc_ovl_set_csc(struct dispc_device *dispc,
+			     enum omap_plane_id plane,
+			     enum drm_color_encoding color_encoding,
+			     enum drm_color_range color_range)
 {
-	int i;
-	int num_ovl = dispc_get_num_ovls(dispc);
-
-	/* YUV -> RGB, ITU-R BT.601, limited range */
-	const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt601_lim = {
-		298,    0,  409,	/* ry, rcb, rcr */
-		298, -100, -208,	/* gy, gcb, gcr */
-		298,  516,    0,	/* by, bcb, bcr */
-		false,			/* limited range */
-	};
+	const struct csc_coef_yuv2rgb *csc;
 
-	/* RGB -> YUV, ITU-R BT.601, limited range */
-	const struct csc_coef_rgb2yuv coefs_rgb2yuv_bt601_lim = {
-		 66, 129,  25,		/* yr,   yg,  yb */
-		-38, -74, 112,		/* cbr, cbg, cbb */
-		112, -94, -18,		/* crr, crg, crb */
-		false,			/* limited range */
-	};
+	switch (color_encoding) {
+	case DRM_COLOR_YCBCR_BT601:
+		if (color_range == DRM_COLOR_YCBCR_FULL_RANGE)
+			csc = &coefs_yuv2rgb_bt601_full;
+		else
+			csc = &coefs_yuv2rgb_bt601_lim;
+		break;
+	case DRM_COLOR_YCBCR_BT709:
+		if (color_range == DRM_COLOR_YCBCR_FULL_RANGE)
+			csc = &coefs_yuv2rgb_bt709_full;
+		else
+			csc = &coefs_yuv2rgb_bt709_lim;
+		break;
+	default:
+		DSSERR("Unsupported CSC mode %d for plane %d\n",
+		       color_encoding, plane);
+		return -EINVAL;
+	}
 
-	for (i = 1; i < num_ovl; i++)
-		dispc_ovl_write_color_conv_coef(dispc, i, &coefs_yuv2rgb_bt601_lim);
+	dispc_ovl_write_color_conv_coef(dispc, plane, csc);
 
-	if (dispc->feat->has_writeback)
-		dispc_wb_write_color_conv_coef(dispc, &coefs_rgb2yuv_bt601_lim);
+	return 0;
 }
 
 static void dispc_ovl_set_ba0(struct dispc_device *dispc,
@@ -2598,7 +2615,9 @@ static int dispc_ovl_setup_common(struct dispc_device *dispc,
 				  u8 pre_mult_alpha, u8 global_alpha,
 				  enum omap_dss_rotation_type rotation_type,
 				  bool replication, const struct videomode *vm,
-				  bool mem_to_mem)
+				  bool mem_to_mem,
+				  enum drm_color_encoding color_encoding,
+				  enum drm_color_range color_range)
 {
 	bool five_taps = true;
 	bool fieldmode = false;
@@ -2747,6 +2766,9 @@ static int dispc_ovl_setup_common(struct dispc_device *dispc,
 				      fieldmode, fourcc, rotation);
 		dispc_ovl_set_output_size(dispc, plane, out_width, out_height);
 		dispc_ovl_set_vid_color_conv(dispc, plane, cconv);
+
+		if (plane != OMAP_DSS_WB)
+			dispc_ovl_set_csc(dispc, plane, color_encoding, color_range);
 	}
 
 	dispc_ovl_set_rotation_attrs(dispc, plane, rotation, rotation_type,
@@ -2783,7 +2805,8 @@ static int dispc_ovl_setup(struct dispc_device *dispc,
 		oi->screen_width, oi->pos_x, oi->pos_y, oi->width, oi->height,
 		oi->out_width, oi->out_height, oi->fourcc, oi->rotation,
 		oi->zorder, oi->pre_mult_alpha, oi->global_alpha,
-		oi->rotation_type, replication, vm, mem_to_mem);
+		oi->rotation_type, replication, vm, mem_to_mem,
+		oi->color_encoding, oi->color_range);
 
 	return r;
 }
@@ -2816,7 +2839,8 @@ static int dispc_wb_setup(struct dispc_device *dispc,
 		wi->buf_width, pos_x, pos_y, in_width, in_height, wi->width,
 		wi->height, wi->fourcc, wi->rotation, zorder,
 		wi->pre_mult_alpha, global_alpha, wi->rotation_type,
-		replication, vm, mem_to_mem);
+		replication, vm, mem_to_mem, DRM_COLOR_YCBCR_BT601,
+		DRM_COLOR_YCBCR_LIMITED_RANGE);
 	if (r)
 		return r;
 
@@ -3927,8 +3951,6 @@ static void _omap_dispc_initial_config(struct dispc_device *dispc)
 	    dispc->feat->has_gamma_table)
 		REG_FLD_MOD(dispc, DISPC_CONFIG, 1, 9, 9);
 
-	dispc_setup_color_conv_coef(dispc);
-
 	dispc_set_loadmode(dispc, OMAP_DSS_LOAD_FRAME_ONLY);
 
 	dispc_init_fifos(dispc);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 8e9a2019f173..816424eb2d41 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -7,6 +7,7 @@
 #ifndef __OMAP_DRM_DSS_H
 #define __OMAP_DRM_DSS_H
 
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mode.h>
 #include <linux/device.h>
@@ -243,6 +244,9 @@ struct omap_overlay_info {
 	u8 global_alpha;
 	u8 pre_mult_alpha;
 	u8 zorder;
+
+	enum drm_color_encoding color_encoding;
+	enum drm_color_range color_range;
 };
 
 struct omap_overlay_manager_info {
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 73ec99819a3d..1f433fb5f207 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -59,6 +59,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 		info.pre_mult_alpha = 1;
 	else
 		info.pre_mult_alpha = 0;
+	info.color_encoding = state->color_encoding;
+	info.color_range = state->color_range;
 
 	/* update scanout: */
 	omap_framebuffer_update_scanout(state->fb, state, &info);
@@ -189,6 +191,8 @@ static void omap_plane_reset(struct drm_plane *plane)
 	 */
 	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
 			   ? 0 : omap_plane->id;
+	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
+	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
 
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
@@ -232,6 +236,23 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.atomic_get_property = omap_plane_atomic_get_property,
 };
 
+static bool omap_plane_supports_yuv(struct drm_plane *plane)
+{
+	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_plane *omap_plane = to_omap_plane(plane);
+	const u32 *formats =
+		priv->dispc_ops->ovl_get_color_modes(priv->dispc, omap_plane->id);
+	u32 i;
+
+	for (i = 0; formats[i]; i++)
+		if (formats[i] == DRM_FORMAT_YUYV ||
+		    formats[i] == DRM_FORMAT_UYVY ||
+		    formats[i] == DRM_FORMAT_NV12)
+			return true;
+
+	return false;
+}
+
 static const char *plane_id_to_name[] = {
 	[OMAP_DSS_GFX] = "gfx",
 	[OMAP_DSS_VIDEO1] = "vid1",
@@ -293,6 +314,15 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_PREMULTI) |
 					     BIT(DRM_MODE_BLEND_COVERAGE));
 
+	if (omap_plane_supports_yuv(plane))
+		drm_plane_create_color_properties(plane,
+						  BIT(DRM_COLOR_YCBCR_BT601) |
+						  BIT(DRM_COLOR_YCBCR_BT709),
+						  BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
+						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						  DRM_COLOR_YCBCR_BT601,
+						  DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return plane;
 
 error:
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
