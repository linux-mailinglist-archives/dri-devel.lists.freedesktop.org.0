Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7E38118B
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DC06F45C;
	Fri, 14 May 2021 20:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A0C6F45C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 20:12:10 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 3/3] drm/ingenic: Add option to alloc cached GEM buffers
Date: Fri, 14 May 2021 21:11:38 +0100
Message-Id: <20210514201138.162230-4-paul@crapouillou.net>
In-Reply-To: <20210514201138.162230-1-paul@crapouillou.net>
References: <20210514201138.162230-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, od@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the module parameter ingenic-drm.cached_gem_buffers, it is possible
to specify that we want GEM buffers backed by non-coherent memory.

This dramatically speeds up software rendering on Ingenic SoCs, even for
tasks where write-combine memory should in theory be faster (e.g. simple
blits).

Enable it on SoCs where it is actually faster than write-combine.

v3: The option is now selected per-SoC instead of being a module
    parameter.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 56 ++++++++++++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 18 ++++++--
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 09225b770bb8..5f64e8583eec 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -9,6 +9,7 @@
 #include <linux/component.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
@@ -23,6 +24,7 @@
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -57,6 +59,7 @@ struct ingenic_dma_hwdescs {
 struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
+	bool map_noncoherent;
 	unsigned int max_width, max_height;
 	const u32 *formats_f0, *formats_f1;
 	unsigned int num_formats_f0, num_formats_f1;
@@ -410,6 +413,8 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	     old_plane_state->fb->format->format != new_plane_state->fb->format->format))
 		crtc_state->mode_changed = true;
 
+	drm_atomic_helper_check_plane_damage(state, new_plane_state);
+
 	return 0;
 }
 
@@ -544,8 +549,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
-	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
-									  plane);
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
 	unsigned int width, height, cpp, offset;
@@ -553,6 +558,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	u32 fourcc;
 
 	if (newstate && newstate->fb) {
+		drm_gem_cma_sync_data(&priv->drm, oldstate, newstate);
+
 		crtc_state = newstate->crtc->state;
 
 		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
@@ -742,6 +749,43 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL, JZ_LCD_CTRL_EOF_IRQ, 0);
 }
 
+static int ingenic_drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
+					     struct drm_file *file_priv,
+					     unsigned int flags,
+					     unsigned int color,
+					     struct drm_clip_rect *clips,
+					     unsigned int num_clips)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(fb->dev);
+
+	if (!priv->soc_info->map_noncoherent)
+		return 0;
+
+	return drm_atomic_helper_dirtyfb(fb, file_priv, flags,
+					 color, clips, num_clips);
+}
+
+static const struct drm_framebuffer_funcs ingenic_drm_gem_fb_funcs = {
+	.destroy	= drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+	.dirty          = ingenic_drm_atomic_helper_dirtyfb,
+};
+
+static struct drm_gem_object *
+ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(drm);
+	struct drm_gem_cma_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->map_noncoherent = priv->soc_info->map_noncoherent;
+
+	return &obj->base;
+}
+
 DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
 
 static const struct drm_driver ingenic_drm_driver_data = {
@@ -754,6 +798,7 @@ static const struct drm_driver ingenic_drm_driver_data = {
 	.patchlevel		= 0,
 
 	.fops			= &ingenic_drm_fops,
+	.gem_create_object	= ingenic_drm_gem_create_object,
 	DRM_GEM_CMA_DRIVER_OPS,
 
 	.irq_handler		= ingenic_drm_irq_handler,
@@ -961,6 +1006,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return ret;
 	}
 
+	drm_plane_enable_fb_damage_clips(&priv->f1);
+
 	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
 
 	ret = drm_crtc_init_with_planes(drm, &priv->crtc, primary,
@@ -989,6 +1036,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			return ret;
 		}
 
+		drm_plane_enable_fb_damage_clips(&priv->f0);
+
 		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
 			ret = component_bind_all(dev, drm);
 			if (ret) {
@@ -1245,6 +1294,7 @@ static const u32 jz4770_formats_f0[] = {
 static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = false,
+	.map_noncoherent = false,
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4740_formats,
@@ -1255,6 +1305,7 @@ static const struct jz_soc_info jz4740_soc_info = {
 static const struct jz_soc_info jz4725b_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
+	.map_noncoherent = false,
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4725b_formats_f1,
@@ -1266,6 +1317,7 @@ static const struct jz_soc_info jz4725b_soc_info = {
 static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
+	.map_noncoherent = true,
 	.max_width = 1280,
 	.max_height = 720,
 	.formats_f1 = jz4770_formats_f1,
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 3b1091e7c0cd..a4d1b500c3ad 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -20,10 +20,13 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_property.h>
@@ -285,8 +288,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
-	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
-									  plane);
+	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *oldstate = drm_atomic_get_new_plane_state(state, plane);
 	const struct drm_format_info *finfo;
 	u32 ctrl, stride = 0, coef_index = 0, format = 0;
 	bool needs_modeset, upscaling_w, upscaling_h;
@@ -317,6 +320,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
 	}
 
+	drm_gem_cma_sync_data(ipu->drm, oldstate, newstate);
+
 	/* New addresses will be committed in vblank handler... */
 	ipu->addr_y = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
 	if (finfo->num_planes > 1)
@@ -541,7 +546,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (!new_plane_state->crtc ||
 	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
-		return 0;
+		goto out_check_damage;
 
 	/* Plane must be fully visible */
 	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 ||
@@ -558,7 +563,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	if (!osd_changed(new_plane_state, old_plane_state))
-		return 0;
+		goto out_check_damage;
 
 	crtc_state->mode_changed = true;
 
@@ -592,6 +597,9 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	ipu->denom_w = denom_w;
 	ipu->denom_h = denom_h;
 
+out_check_damage:
+	drm_atomic_helper_check_plane_damage(state, new_plane_state);
+
 	return 0;
 }
 
@@ -773,6 +781,8 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 		return err;
 	}
 
+	drm_plane_enable_fb_damage_clips(plane);
+
 	/*
 	 * Sharpness settings range is [0,32]
 	 * 0       : nearest-neighbor
-- 
2.30.2

