Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02412A3E83
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B406EC2E;
	Tue,  3 Nov 2020 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76D36E58A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 22:07:48 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/ingenic: Add option to alloc cached GEM buffers
Date: Mon,  2 Nov 2020 22:06:51 +0000
Message-Id: <20201102220651.22069-6-paul@crapouillou.net>
In-Reply-To: <20201102220651.22069-1-paul@crapouillou.net>
References: <20201102220651.22069-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the module parameter ingenic-drm.cached_gem_buffers, it is possible
to specify that we want GEM buffers backed by non-coherent memory.

This dramatically speeds up software rendering on Ingenic SoCs, even for
tasks where write-combine memory should in theory be faster (e.g. simple
blits).

Leave it disabled by default, since it is specific to one use-case
(software rendering).

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 58 +++++++++++++++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h     |  4 ++
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 12 ++++-
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index b9c156e13156..1ec2ec2faa04 100644
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
@@ -22,6 +23,7 @@
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -97,6 +99,11 @@ struct ingenic_drm {
 	struct notifier_block clock_nb;
 };
 
+static bool ingenic_drm_cached_gem_buf;
+module_param_named(cached_gem_buffers, ingenic_drm_cached_gem_buf, bool, 0400);
+MODULE_PARM_DESC(cached_gem_buffers,
+		 "Enable fully cached GEM buffers [default=false]");
+
 static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -400,6 +407,8 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	     plane->state->fb->format->format != state->fb->format->format))
 		crtc_state->mode_changed = true;
 
+	drm_atomic_helper_check_plane_damage(state->state, state);
+
 	return 0;
 }
 
@@ -531,6 +540,14 @@ static void ingenic_drm_update_palette(struct ingenic_drm *priv,
 	}
 }
 
+void ingenic_drm_sync_data(struct device *dev,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state)
+{
+	if (ingenic_drm_cached_gem_buf)
+		drm_gem_cma_sync_data(dev, old_state, state);
+}
+
 static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_plane_state *oldstate)
 {
@@ -543,6 +560,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	u32 fourcc;
 
 	if (state && state->fb) {
+		ingenic_drm_sync_data(priv->dev, oldstate, state);
+
 		crtc_state = state->crtc->state;
 
 		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
@@ -714,7 +733,36 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL, JZ_LCD_CTRL_EOF_IRQ, 0);
 }
 
-DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
+static struct drm_framebuffer *
+ingenic_drm_gem_fb_create(struct drm_device *dev, struct drm_file *file,
+			  const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	if (ingenic_drm_cached_gem_buf)
+		return drm_gem_fb_create_with_dirty(dev, file, mode_cmd);
+
+	return drm_gem_fb_create(dev, file, mode_cmd);
+}
+
+static int ingenic_drm_gem_cma_mmap(struct file *filp,
+				    struct vm_area_struct *vma)
+{
+	if (ingenic_drm_cached_gem_buf)
+		return drm_gem_cma_mmap_noncoherent(filp, vma);
+
+	return drm_gem_cma_mmap(filp, vma);
+}
+
+static const struct file_operations ingenic_drm_fops = {
+	.owner		= THIS_MODULE,
+	.open		= drm_open,
+	.release	= drm_release,
+	.unlocked_ioctl	= drm_ioctl,
+	.compat_ioctl	= drm_compat_ioctl,
+	.poll		= drm_poll,
+	.read		= drm_read,
+	.llseek		= noop_llseek,
+	.mmap		= ingenic_drm_gem_cma_mmap,
+};
 
 static struct drm_driver ingenic_drm_driver_data = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
@@ -726,7 +774,7 @@ static struct drm_driver ingenic_drm_driver_data = {
 	.patchlevel		= 0,
 
 	.fops			= &ingenic_drm_fops,
-	DRM_GEM_CMA_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_cma_dumb_create_noncoherent),
 
 	.irq_handler		= ingenic_drm_irq_handler,
 };
@@ -778,7 +826,7 @@ static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs =
 };
 
 static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
-	.fb_create		= drm_gem_fb_create,
+	.fb_create		= ingenic_drm_gem_fb_create,
 	.output_poll_changed	= drm_fb_helper_output_poll_changed,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
@@ -932,6 +980,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return ret;
 	}
 
+	drm_plane_enable_fb_damage_clips(&priv->f1);
+
 	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
 
 	ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->f1,
@@ -960,6 +1010,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			return ret;
 		}
 
+		drm_plane_enable_fb_damage_clips(&priv->f0);
+
 		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
 			ret = component_bind_all(dev, drm);
 			if (ret) {
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
index 9b48ce02803d..ee3a892c0383 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.h
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -171,6 +171,10 @@ void ingenic_drm_plane_config(struct device *dev,
 			      struct drm_plane *plane, u32 fourcc);
 void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane);
 
+void ingenic_drm_sync_data(struct device *dev,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state);
+
 extern struct platform_driver *ingenic_ipu_driver_ptr;
 
 #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index fc8c6e970ee3..38c83e8cc6a5 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -316,6 +317,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
 	}
 
+	ingenic_drm_sync_data(ipu->master, oldstate, state);
+
 	/* New addresses will be committed in vblank handler... */
 	ipu->addr_y = drm_fb_cma_get_gem_addr(state->fb, state, 0);
 	if (finfo->num_planes > 1)
@@ -534,7 +537,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (!state->crtc ||
 	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
-		return 0;
+		goto out_check_damage;
 
 	/* Plane must be fully visible */
 	if (state->crtc_x < 0 || state->crtc_y < 0 ||
@@ -551,7 +554,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	if (!osd_changed(state, plane->state))
-		return 0;
+		goto out_check_damage;
 
 	crtc_state->mode_changed = true;
 
@@ -578,6 +581,9 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	ipu->denom_w = denom_w;
 	ipu->denom_h = denom_h;
 
+out_check_damage:
+	drm_atomic_helper_check_plane_damage(state->state, state);
+
 	return 0;
 }
 
@@ -759,6 +765,8 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 		return err;
 	}
 
+	drm_plane_enable_fb_damage_clips(plane);
+
 	/*
 	 * Sharpness settings range is [0,32]
 	 * 0       : nearest-neighbor
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
