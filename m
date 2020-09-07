Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CCC25F4D7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CAF6E3A0;
	Mon,  7 Sep 2020 08:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086BE6E3A0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:18:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so14792728wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XiGLEbE2dKDD12JitgDtEsxbd+0LxnrAdV1CrEXmiRQ=;
 b=kAzq7EJGLz995AvTFpcAo4rOeCWw30p5YQ4JtG2UgAr5asHU5qAUoN9Cc/BqxxrNN7
 nA5Z72ugY3Ag07/mJnmb/pUbLbZpIBzcD5Q1ww7lbojklUkQ1caz1b+uRS7fS/AshHcc
 Bj9iPX7NG4vHdRxO0V2FQPMuLFQV2x/aGt8ov8ya/bQypMBcOhapbdaNfuZND2lX6Nq6
 C2lp3/x2FXUWsR8uNCXAShZMecxIoZecF9cX3cXPaukVY0DJH6DcCC7fAvYALyk1YPsg
 YFKleImq0NZOkUBwZmFC8di3CHS8KYdLubuEstpP0whNU891V/5YVBHqqtkqWTmGX02P
 LFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XiGLEbE2dKDD12JitgDtEsxbd+0LxnrAdV1CrEXmiRQ=;
 b=krBaVl6jzVDo/jM0CkFCC98rR6LWb3aWmCph6yIqqv6C1xCR3LLWDsrim3rX8OuSYf
 G0E7bDj6wUyb+IsOg14kVLkxoMPjG4Ve03M6cuuJzjb8vfPKDh9sGhZUqLnYu4WjG/fm
 LM+3s+5pIhIErvZcHDJow12ACtMt63S+RblNlI33d0+A/GdwJIj9/HU+83CDevYNE73Z
 Oa4uYT3L5uftv2BSRRQ3jeqfEsCFzCfjkXGhQUXDdyy4lgK2QPe7LmTq68SQydheIxTj
 nOGJZfMYRZ73jttgimh9S6OQB19rAPSbtaCNzex+V5NJOnDtHS8k+RmQrdfIGqbzaIVk
 72ww==
X-Gm-Message-State: AOAM533Osywz+WoaHOLf2htZkftpktyKq/KA+lHm7jfoopDSJsLHIgd2
 iR4FMyS+GzctB9Th3I8oYW4LSQ==
X-Google-Smtp-Source: ABdhPJxZ3Iny+4mL/4lW4MM/cgzEAFywNr2pwQjrzpGJmPzKxeTVHerIt0uR9zKBXCHK0wlHXFjiIQ==
X-Received: by 2002:adf:f846:: with SMTP id d6mr21862018wrq.56.1599466714491; 
 Mon, 07 Sep 2020 01:18:34 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 3/6] drm/meson: add support for VPU found in AXG SoCs
Date: Mon,  7 Sep 2020 10:18:22 +0200
Message-Id: <20200907081825.1654-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic AXG SoC family has a downgraded VPU with the following
changes :
- Only a single OSD plane, no overlay video plane
- The primary plane doesn't support HW scaling
- The pixels are read directly from DDR without any Canvas module
- Doesn't support HDMI or CVBS
- Ouputs only with ENCL encoder to a DPI-to-DSI Synopsys DW-MIPI-DSI transceiver

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_crtc.c      |   8 +-
 drivers/gpu/drm/meson/meson_drv.c       | 115 ++++++++++++++++--------
 drivers/gpu/drm/meson/meson_drv.h       |  10 ++-
 drivers/gpu/drm/meson/meson_plane.c     |  74 +++++++++++++--
 drivers/gpu/drm/meson/meson_registers.h |   1 +
 drivers/gpu/drm/meson/meson_viu.c       |  50 ++++++++++-
 drivers/gpu/drm/meson/meson_vpp.c       |   6 +-
 7 files changed, 215 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 2854272dc2d9..430599caa5a0 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -366,7 +366,13 @@ void meson_crtc_irq(struct meson_drm *priv)
 		writel_relaxed(priv->viu.osd_sc_v_ctrl0,
 				priv->io_base + _REG(VPP_OSD_VSC_CTRL0));
 
-		if (!priv->viu.osd1_afbcd)
+		/* AXG doesn't use CANVAS since it support a single plane */
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG)) {
+			writel_relaxed(priv->viu.osd1_addr,
+				priv->io_base + _REG(VIU_OSD1_BLK1_CFG_W4));
+			writel_relaxed(priv->viu.osd1_blk2_cfg4,
+				priv->io_base + _REG(VIU_OSD1_BLK2_CFG_W4));
+		} else if (!priv->viu.osd1_afbcd)
 			meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
 					    priv->viu.osd1_addr,
 					    priv->viu.osd1_stride,
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 8b9c8dd788c4..92346653223f 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -223,6 +223,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	drm->dev_private = priv;
 	priv->drm = drm;
 	priv->dev = dev;
+	priv->data = match;
 	priv->compat = match->compat;
 	priv->afbcd.ops = match->afbcd_ops;
 
@@ -255,32 +256,34 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto free_drm;
 	}
 
-	priv->canvas = meson_canvas_get(dev);
-	if (IS_ERR(priv->canvas)) {
-		ret = PTR_ERR(priv->canvas);
-		goto free_drm;
-	}
+	if (priv->data->requires_canvas) {
+		priv->canvas = meson_canvas_get(dev);
+		if (IS_ERR(priv->canvas)) {
+			ret = PTR_ERR(priv->canvas);
+			goto free_drm;
+		}
 
-	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
-	if (ret)
-		goto free_drm;
-	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
-	if (ret) {
-		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
-		goto free_drm;
-	}
-	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_1);
-	if (ret) {
-		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
-		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
-		goto free_drm;
-	}
-	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_2);
-	if (ret) {
-		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
-		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
-		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
-		goto free_drm;
+		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
+		if (ret)
+			goto free_drm;
+		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
+		if (ret) {
+			meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
+			goto free_drm;
+		}
+		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_1);
+		if (ret) {
+			meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
+			meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
+			goto free_drm;
+		}
+		ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_2);
+		if (ret) {
+			meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
+			meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
+			meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
+			goto free_drm;
+		}
 	}
 
 	priv->vsync_irq = platform_get_irq(pdev, 0);
@@ -303,8 +306,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		goto free_drm;
-	drm->mode_config.max_width = 3840;
-	drm->mode_config.max_height = 2160;
+	drm->mode_config.max_width = priv->data->max_width;
+	drm->mode_config.max_height = priv->data->max_height;
 	drm->mode_config.funcs = &meson_mode_config_funcs;
 	drm->mode_config.helper_private	= &meson_mode_config_helpers;
 
@@ -322,9 +325,11 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	/* Encoder Initialization */
 
-	ret = meson_venc_cvbs_create(priv);
-	if (ret)
-		goto free_drm;
+	if (priv->data->provides_cvbs) {
+		ret = meson_venc_cvbs_create(priv);
+		if (ret)
+			goto free_drm;
+	}
 
 	if (has_components) {
 		ret = component_bind_all(drm->dev, drm);
@@ -334,13 +339,17 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		}
 	}
 
-	ret = meson_plane_create(priv);
-	if (ret)
-		goto free_drm;
+	if (priv->data->osd_count) {
+		ret = meson_plane_create(priv);
+		if (ret)
+			goto free_drm;
+	}
 
-	ret = meson_overlay_create(priv);
-	if (ret)
-		goto free_drm;
+	if (priv->data->vd_count) {
+		ret = meson_overlay_create(priv);
+		if (ret)
+			goto free_drm;
+	}
 
 	ret = meson_crtc_create(priv);
 	if (ret)
@@ -516,20 +525,52 @@ static int meson_drv_probe(struct platform_device *pdev)
 
 static struct meson_drm_match_data meson_drm_gxbb_data = {
 	.compat = VPU_COMPATIBLE_GXBB,
+	.requires_canvas = true,
+	.provides_cvbs = true,
+	.osd_count = 2,
+	.vd_count = 2,
+	.max_width = 3840,
+	.max_height = 2160,
 };
 
 static struct meson_drm_match_data meson_drm_gxl_data = {
 	.compat = VPU_COMPATIBLE_GXL,
+	.requires_canvas = true,
+	.provides_cvbs = true,
+	.osd_count = 2,
+	.vd_count = 2,
+	.max_width = 3840,
+	.max_height = 2160,
 };
 
 static struct meson_drm_match_data meson_drm_gxm_data = {
 	.compat = VPU_COMPATIBLE_GXM,
 	.afbcd_ops = &meson_afbcd_gxm_ops,
+	.requires_canvas = true,
+	.provides_cvbs = true,
+	.osd_count = 2,
+	.vd_count = 2,
+	.max_width = 3840,
+	.max_height = 2160,
+};
+
+static struct meson_drm_match_data meson_drm_axg_data = {
+	.compat = VPU_COMPATIBLE_AXG,
+	.osd_count = 1,
+	.vd_count = 0,
+	.max_width = 1920,
+	.max_height = 1080,
 };
 
 static struct meson_drm_match_data meson_drm_g12a_data = {
 	.compat = VPU_COMPATIBLE_G12A,
 	.afbcd_ops = &meson_afbcd_g12a_ops,
+	.requires_canvas = true,
+	.provides_cvbs = true,
+	.osd_count = 4,
+	.vd_count = 2,
+	.max_width = 3840,
+	.max_height = 2160,
 };
 
 static const struct of_device_id dt_match[] = {
@@ -539,6 +580,8 @@ static const struct of_device_id dt_match[] = {
 	  .data       = (void *)&meson_drm_gxl_data },
 	{ .compatible = "amlogic,meson-gxm-vpu",
 	  .data       = (void *)&meson_drm_gxm_data },
+	{ .compatible = "amlogic,meson-axg-vpu",
+	  .data       = (void *)&meson_drm_axg_data },
 	{ .compatible = "amlogic,meson-g12a-vpu",
 	  .data       = (void *)&meson_drm_g12a_data },
 	{}
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 177dac3ca3be..5d67f97ec298 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -22,12 +22,19 @@ enum vpu_compatible {
 	VPU_COMPATIBLE_GXBB = 0,
 	VPU_COMPATIBLE_GXL  = 1,
 	VPU_COMPATIBLE_GXM  = 2,
-	VPU_COMPATIBLE_G12A = 3,
+	VPU_COMPATIBLE_AXG  = 3,
+	VPU_COMPATIBLE_G12A = 4,
 };
 
 struct meson_drm_match_data {
 	enum vpu_compatible compat;
 	struct meson_afbcd_ops *afbcd_ops;
+	bool requires_canvas;
+	bool provides_cvbs;
+	unsigned int osd_count;
+	unsigned int vd_count;
+	unsigned int max_width;
+	unsigned int max_height;
 };
 
 struct meson_drm_soc_limits {
@@ -52,6 +59,7 @@ struct meson_drm {
 	struct drm_plane *primary_plane;
 	struct drm_plane *overlay_plane;
 
+	const struct meson_drm_match_data *data;
 	const struct meson_drm_soc_limits *limits;
 
 	/* Components Data */
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 35338ed18209..9111b3540bdf 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -93,6 +93,25 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
 						   false, true);
 }
 
+static int meson_plane_atomic_check_axg(struct drm_plane *plane,
+					struct drm_plane_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+
+	if (!state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	/* AXG VPU OSD plane doesn't support scaling */
+	return drm_atomic_helper_check_plane_state(state, crtc_state,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   true, true);
+}
+
 #define MESON_MOD_AFBC_VALID_BITS (AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |	\
 				   AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |	\
 				   AFBC_FORMAT_MOD_YTR |		\
@@ -125,6 +144,29 @@ static u32 meson_g12a_afbcd_line_stride(struct meson_drm *priv)
 	return ((line_stride + 1) >> 1) << 1;
 }
 
+static u32 meson_axg_line_stride(struct meson_drm *priv, u32 format)
+{
+	u32 line_stride = 0;
+	u32 bwidth;
+
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		bwidth = priv->viu.osd1_stride >> 1;
+		line_stride = ((bwidth << 4) + 127) >> 7;
+		break;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		bwidth = priv->viu.osd1_stride >> 2;
+		line_stride = ((bwidth << 5) + 127) >> 7;
+		break;
+	}
+
+	return ((line_stride + 1) >> 1) << 1;
+}
+
 static void meson_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
@@ -161,15 +203,20 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	else
 		priv->viu.osd1_afbcd = false;
 
-	/* Enable OSD and BLK0, set max global alpha */
-	priv->viu.osd1_ctrl_stat = OSD_ENABLE |
-				   (0xFF << OSD_GLOBAL_ALPHA_SHIFT) |
-				   OSD_BLK0_ENABLE;
+	priv->viu.osd1_ctrl_stat = OSD_ENABLE | OSD_BLK0_ENABLE;
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
+		priv->viu.osd1_ctrl_stat |= 0x100 << OSD_GLOBAL_ALPHA_SHIFT;
+	else
+		priv->viu.osd1_ctrl_stat |= 0xFF << OSD_GLOBAL_ALPHA_SHIFT;
 
 	priv->viu.osd1_ctrl_stat2 = readl(priv->io_base +
 					  _REG(VIU_OSD1_CTRL_STAT2));
 
-	canvas_id_osd1 = priv->canvas_id_osd1;
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
+		canvas_id_osd1 = 0x40;
+	else
+		canvas_id_osd1 = priv->canvas_id_osd1;
 
 	/* Set up BLK0 to point to the right canvas */
 	priv->viu.osd1_blk0_cfg[0] = canvas_id_osd1 << OSD_CANVAS_SEL;
@@ -366,7 +413,10 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	priv->viu.osd1_height = fb->height;
 	priv->viu.osd1_width = fb->width;
 
-	if (priv->viu.osd1_afbcd) {
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
+		priv->viu.osd1_blk2_cfg4 = meson_axg_line_stride(priv,
+							fb->format->format);
+	else if (priv->viu.osd1_afbcd) {
 		priv->afbcd.modifier = fb->modifier;
 		priv->afbcd.format = fb->format->format;
 
@@ -413,6 +463,13 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
 	priv->viu.osd1_enabled = false;
 }
 
+static const struct drm_plane_helper_funcs meson_plane_helper_funcs_axg = {
+	.atomic_check	= meson_plane_atomic_check_axg,
+	.atomic_disable	= meson_plane_atomic_disable,
+	.atomic_update	= meson_plane_atomic_update,
+	.prepare_fb	= drm_gem_fb_prepare_fb,
+};
+
 static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
 	.atomic_check	= meson_plane_atomic_check,
 	.atomic_disable	= meson_plane_atomic_disable,
@@ -550,7 +607,10 @@ int meson_plane_create(struct meson_drm *priv)
 				 format_modifiers,
 				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
 
-	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
+		drm_plane_helper_add(plane, &meson_plane_helper_funcs_axg);
+	else
+		drm_plane_helper_add(plane, &meson_plane_helper_funcs);
 
 	/* For now, OSD Primary plane is always on the front */
 	drm_plane_create_zpos_immutable_property(plane, 1);
diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 446e7961da48..18396b59e6cb 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -588,6 +588,7 @@
 #define VPP_OSD_SCALE_COEF_IDX 0x1dcc
 #define VPP_OSD_SCALE_COEF 0x1dcd
 #define VPP_INT_LINE_NUM 0x1dce
+#define VPP_MATRIX_CLIP 0x1dde
 
 #define VPP_WRAP_OSD1_MATRIX_COEF00_01 0x3d60
 #define VPP_WRAP_OSD1_MATRIX_COEF02_10 0x3d61
diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index aede0c67a57f..9b644e598211 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -423,19 +423,63 @@ void meson_viu_init(struct meson_drm *priv)
 
 	/* On GXL/GXM, Use the 10bit HDR conversion matrix */
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
-	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
 		meson_viu_load_matrix(priv);
 	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		meson_viu_set_g12a_osd1_matrix(priv, RGB709_to_YUV709l_coeff,
 					       true);
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG)) {
+		writel_bits_relaxed(BIT(0), BIT(0),
+				priv->io_base + _REG(VPP_MATRIX_CTRL));
+		writel_bits_relaxed(0x3 << 8, 0,
+				priv->io_base + _REG(VPP_MATRIX_CTRL));
+
+		writel_relaxed(0x0fc00e00,
+				priv->io_base + _REG(VPP_MATRIX_PRE_OFFSET0_1));
+		writel_relaxed(0x00000e00,
+				priv->io_base + _REG(VPP_MATRIX_PRE_OFFSET2));
+
+		/*
+		 * ycbcr limit range, 709 to RGB
+		 * -16      1.164  0      1.793  0
+		 * -128     1.164 -0.213 -0.534  0
+		 * -128     1.164  2.115  0      0
+		 */
+		writel_relaxed(0x04a80000,
+				priv->io_base + _REG(VPP_MATRIX_COEF00_01));
+		writel_relaxed(0x072c04a8,
+				priv->io_base + _REG(VPP_MATRIX_COEF02_10));
+		writel_relaxed(0x1f261ddd,
+				priv->io_base + _REG(VPP_MATRIX_COEF11_12));
+		writel_relaxed(0x04a80876,
+				priv->io_base + _REG(VPP_MATRIX_COEF20_21));
+		writel_relaxed(0x0, priv->io_base + _REG(VPP_MATRIX_COEF22));
+		writel_relaxed(0x0, priv->io_base + _REG(VPP_MATRIX_OFFSET0_1));
+		writel_relaxed(0x0, priv->io_base + _REG(VPP_MATRIX_OFFSET2));
+
+		writel_bits_relaxed(0x1f << 3, 0,
+				priv->io_base + _REG(VPP_MATRIX_CLIP));
+	}
+
 	/* Initialize OSD1 fifo control register */
 	reg = VIU_OSD_DDR_PRIORITY_URGENT |
-		VIU_OSD_HOLD_FIFO_LINES(31) |
-		VIU_OSD_FIFO_DEPTH_VAL(32) | /* fifo_depth_val: 32*8=256 */
 		VIU_OSD_WORDS_PER_BURST(4) | /* 4 words in 1 burst */
 		VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
+		reg |= VIU_OSD_HOLD_FIFO_LINES(24);
+	else
+		reg |= VIU_OSD_HOLD_FIFO_LINES(31);
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
+		reg |= VIU_OSD_FIFO_DEPTH_VAL(32); /* fifo_depth_val: 32*8=256 */
+	else
+		reg |= VIU_OSD_FIFO_DEPTH_VAL(64); /* fifo_depth_val: 64*8=512 */
+
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		reg |= VIU_OSD_BURST_LENGTH_32;
 	else
diff --git a/drivers/gpu/drm/meson/meson_vpp.c b/drivers/gpu/drm/meson/meson_vpp.c
index 154837688ab0..069f527d42c6 100644
--- a/drivers/gpu/drm/meson/meson_vpp.c
+++ b/drivers/gpu/drm/meson/meson_vpp.c
@@ -91,7 +91,8 @@ static void meson_vpp_write_vd_scaling_filter_coefs(struct meson_drm *priv,
 void meson_vpp_init(struct meson_drm *priv)
 {
 	/* set dummy data default YUV black */
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
 		writel_relaxed(0x108080, priv->io_base + _REG(VPP_DUMMY_DATA1));
 	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
 		writel_bits_relaxed(0xff << 16, 0xff << 16,
@@ -107,6 +108,9 @@ void meson_vpp_init(struct meson_drm *priv)
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		writel_relaxed(VPP_OFIFO_SIZE_DEFAULT,
 			       priv->io_base + _REG(VPP_OFIFO_SIZE));
+	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_AXG))
+		writel_bits_relaxed(VPP_OFIFO_SIZE_MASK, 0x400,
+				    priv->io_base + _REG(VPP_OFIFO_SIZE));
 	else
 		writel_bits_relaxed(VPP_OFIFO_SIZE_MASK, 0x77f,
 				    priv->io_base + _REG(VPP_OFIFO_SIZE));
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
