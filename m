Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E32B0650
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 14:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6296E252;
	Thu, 12 Nov 2020 13:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2144B6E226;
 Thu, 12 Nov 2020 13:21:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0562DAD5C;
 Thu, 12 Nov 2020 13:21:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 5/7] drm/radeon: Replace framebuffer console with generic
 implementation
Date: Thu, 12 Nov 2020 14:21:15 +0100
Message-Id: <20201112132117.27228-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112132117.27228-1-tzimmermann@suse.de>
References: <20201112132117.27228-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev code in radeon can be replaced by the generic fbdev helpers.
This allows for using fbdev shadow buffers and IGT testcases.

Generic fbdev acts like a regular DRM client and has to be initialized
after registering the DRM device. Change the driver initialization
accordingly. The release happens automatically during shutdown.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_display.c |   2 -
 drivers/gpu/drm/radeon/radeon_drv.c     |   5 +-
 drivers/gpu/drm/radeon/radeon_fb.c      | 337 +-----------------------
 drivers/gpu/drm/radeon/radeon_kms.c     |  12 -
 drivers/gpu/drm/radeon/radeon_mode.h    |   7 +-
 5 files changed, 16 insertions(+), 347 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index b79686cf8bdb..a7bae33636c3 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1638,7 +1638,6 @@ int radeon_modeset_init(struct radeon_device *rdev)
 	/* setup afmt */
 	radeon_afmt_init(rdev);
 
-	radeon_fbdev_init(rdev);
 	drm_kms_helper_poll_init(rdev->ddev);
 
 	/* do pm late init */
@@ -1653,7 +1652,6 @@ void radeon_modeset_fini(struct radeon_device *rdev)
 		drm_kms_helper_poll_fini(rdev->ddev);
 		radeon_hpd_fini(rdev);
 		drm_helper_force_disable_all(rdev->ddev);
-		radeon_fbdev_fini(rdev);
 		radeon_afmt_fini(rdev);
 		drm_mode_config_cleanup(rdev->ddev);
 		rdev->mode_info.mode_config_initialized = false;
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index bfadb799d6a3..63c3bf1a3a3c 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -114,7 +114,6 @@
 #define KMS_DRIVER_PATCHLEVEL	0
 int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
 void radeon_driver_unload_kms(struct drm_device *dev);
-void radeon_driver_lastclose_kms(struct drm_device *dev);
 int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void radeon_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
@@ -374,6 +373,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_agp;
 
+	radeon_fbdev_init(dev->dev_private);
+
 	return 0;
 
 err_agp:
@@ -635,7 +636,7 @@ static const struct drm_driver kms_driver = {
 	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
-	.lastclose = radeon_driver_lastclose_kms,
+	.lastclose = drm_fb_helper_lastclose,
 	.unload = radeon_driver_unload_kms,
 	.irq_preinstall = radeon_driver_irq_preinstall_kms,
 	.irq_postinstall = radeon_driver_irq_postinstall_kms,
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index fc4212633bdf..50fdc2aaa463 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -24,66 +24,12 @@
  *     David Airlie
  */
 
-#include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/pm_runtime.h>
-#include <linux/slab.h>
-#include <linux/vga_switcheroo.h>
 
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
-#include <drm/radeon_drm.h>
 
 #include "radeon.h"
 
-/* object hierarchy -
- * this contains a helper + a radeon fb
- * the helper contains a pointer to radeon framebuffer baseclass.
- */
-struct radeon_fbdev {
-	struct drm_fb_helper helper; /* must be first */
-	struct drm_framebuffer fb;
-	struct radeon_device *rdev;
-};
-
-static int
-radeonfb_open(struct fb_info *info, int user)
-{
-	struct radeon_fbdev *rfbdev = info->par;
-	struct radeon_device *rdev = rfbdev->rdev;
-	int ret = pm_runtime_get_sync(rdev->ddev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_mark_last_busy(rdev->ddev->dev);
-		pm_runtime_put_autosuspend(rdev->ddev->dev);
-		return ret;
-	}
-	return 0;
-}
-
-static int
-radeonfb_release(struct fb_info *info, int user)
-{
-	struct radeon_fbdev *rfbdev = info->par;
-	struct radeon_device *rdev = rfbdev->rdev;
-
-	pm_runtime_mark_last_busy(rdev->ddev->dev);
-	pm_runtime_put_autosuspend(rdev->ddev->dev);
-	return 0;
-}
-
-static const struct fb_ops radeonfb_ops = {
-	.owner = THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_open = radeonfb_open,
-	.fb_release = radeonfb_release,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
-};
-
-
 int radeon_align_pitch(struct radeon_device *rdev, int width, int cpp, bool tiled)
 {
 	int aligned = width;
@@ -108,294 +54,35 @@ int radeon_align_pitch(struct radeon_device *rdev, int width, int cpp, bool tile
 	return aligned * cpp;
 }
 
-static void radeonfb_destroy_pinned_object(struct drm_gem_object *gobj)
-{
-	struct radeon_bo *rbo = gem_to_radeon_bo(gobj);
-	int ret;
-
-	ret = radeon_bo_reserve(rbo, false);
-	if (likely(ret == 0)) {
-		radeon_bo_kunmap(rbo);
-		radeon_bo_unpin(rbo);
-		radeon_bo_unreserve(rbo);
-	}
-	drm_gem_object_put(gobj);
-}
-
-static int radeonfb_create_pinned_object(struct radeon_fbdev *rfbdev,
-					 struct drm_mode_fb_cmd2 *mode_cmd,
-					 struct drm_gem_object **gobj_p)
-{
-	const struct drm_format_info *info;
-	struct radeon_device *rdev = rfbdev->rdev;
-	struct drm_gem_object *gobj = NULL;
-	struct radeon_bo *rbo = NULL;
-	bool fb_tiled = false; /* useful for testing */
-	u32 tiling_flags = 0;
-	int ret;
-	int aligned_size, size;
-	int height = mode_cmd->height;
-	u32 cpp;
-
-	info = drm_get_format_info(rdev->ddev, mode_cmd);
-	cpp = info->cpp[0];
-
-	/* need to align pitch with crtc limits */
-	mode_cmd->pitches[0] = radeon_align_pitch(rdev, mode_cmd->width, cpp,
-						  fb_tiled);
-
-	if (rdev->family >= CHIP_R600)
-		height = ALIGN(mode_cmd->height, 8);
-	size = mode_cmd->pitches[0] * height;
-	aligned_size = ALIGN(size, PAGE_SIZE);
-	ret = radeon_gem_object_create(rdev, aligned_size, 0,
-				       RADEON_GEM_DOMAIN_VRAM,
-				       0, true, &gobj);
-	if (ret) {
-		pr_err("failed to allocate framebuffer (%d)\n", aligned_size);
-		return -ENOMEM;
-	}
-	rbo = gem_to_radeon_bo(gobj);
-
-	if (fb_tiled)
-		tiling_flags = RADEON_TILING_MACRO;
-
-#ifdef __BIG_ENDIAN
-	switch (cpp) {
-	case 4:
-		tiling_flags |= RADEON_TILING_SWAP_32BIT;
-		break;
-	case 2:
-		tiling_flags |= RADEON_TILING_SWAP_16BIT;
-	default:
-		break;
-	}
-#endif
-
-	if (tiling_flags) {
-		ret = radeon_bo_set_tiling_flags(rbo,
-						 tiling_flags | RADEON_TILING_SURFACE,
-						 mode_cmd->pitches[0]);
-		if (ret)
-			dev_err(rdev->dev, "FB failed to set tiling flags\n");
-	}
-
-
-	ret = radeon_bo_reserve(rbo, false);
-	if (unlikely(ret != 0))
-		goto out_unref;
-	/* Only 27 bit offset for legacy CRTC */
-	ret = radeon_bo_pin_restricted(rbo, RADEON_GEM_DOMAIN_VRAM,
-				       ASIC_IS_AVIVO(rdev) ? 0 : 1 << 27,
-				       NULL);
-	if (ret) {
-		radeon_bo_unreserve(rbo);
-		goto out_unref;
-	}
-	if (fb_tiled)
-		radeon_bo_check_tiling(rbo, 0, 0);
-	ret = radeon_bo_kmap(rbo, NULL);
-	radeon_bo_unreserve(rbo);
-	if (ret) {
-		goto out_unref;
-	}
-
-	*gobj_p = gobj;
-	return 0;
-out_unref:
-	radeonfb_destroy_pinned_object(gobj);
-	*gobj_p = NULL;
-	return ret;
-}
-
-static int radeonfb_create(struct drm_fb_helper *helper,
-			   struct drm_fb_helper_surface_size *sizes)
-{
-	struct radeon_fbdev *rfbdev =
-		container_of(helper, struct radeon_fbdev, helper);
-	struct radeon_device *rdev = rfbdev->rdev;
-	struct fb_info *info;
-	struct drm_framebuffer *fb = NULL;
-	struct drm_mode_fb_cmd2 mode_cmd;
-	struct drm_gem_object *gobj = NULL;
-	struct radeon_bo *rbo = NULL;
-	int ret;
-	unsigned long tmp;
-
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-
-	/* avivo can't scanout real 24bpp */
-	if ((sizes->surface_bpp == 24) && ASIC_IS_AVIVO(rdev))
-		sizes->surface_bpp = 32;
-
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
-
-	ret = radeonfb_create_pinned_object(rfbdev, &mode_cmd, &gobj);
-	if (ret) {
-		DRM_ERROR("failed to create fbcon object %d\n", ret);
-		return ret;
-	}
-
-	rbo = gem_to_radeon_bo(gobj);
-
-	/* okay we have an object now allocate the framebuffer */
-	info = drm_fb_helper_alloc_fbi(helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto out;
-	}
-
-	/* radeon resume is fragile and needs a vt switch to help it along */
-	info->skip_vt_switch = false;
-
-	ret = radeon_framebuffer_init(rdev->ddev, &rfbdev->fb, &mode_cmd, gobj);
-	if (ret) {
-		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
-		goto out;
-	}
-
-	fb = &rfbdev->fb;
-
-	/* setup helper */
-	rfbdev->helper.fb = fb;
-
-	memset_io(rbo->kptr, 0x0, radeon_bo_size(rbo));
-
-	info->fbops = &radeonfb_ops;
-
-	tmp = radeon_bo_gpu_offset(rbo) - rdev->mc.vram_start;
-	info->fix.smem_start = rdev->mc.aper_base + tmp;
-	info->fix.smem_len = radeon_bo_size(rbo);
-	info->screen_base = rbo->kptr;
-	info->screen_size = radeon_bo_size(rbo);
-
-	drm_fb_helper_fill_info(info, &rfbdev->helper, sizes);
-
-	/* setup aperture base/size for vesafb takeover */
-	info->apertures->ranges[0].base = rdev->ddev->mode_config.fb_base;
-	info->apertures->ranges[0].size = rdev->mc.aper_size;
-
-	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
-
-	if (info->screen_base == NULL) {
-		ret = -ENOSPC;
-		goto out;
-	}
-
-	DRM_INFO("fb mappable at 0x%lX\n",  info->fix.smem_start);
-	DRM_INFO("vram apper at 0x%lX\n",  (unsigned long)rdev->mc.aper_base);
-	DRM_INFO("size %lu\n", (unsigned long)radeon_bo_size(rbo));
-	DRM_INFO("fb depth is %d\n", fb->format->depth);
-	DRM_INFO("   pitch is %d\n", fb->pitches[0]);
-
-	vga_switcheroo_client_fb_set(rdev->ddev->pdev, info);
-	return 0;
-
-out:
-	if (rbo) {
-
-	}
-	if (fb && ret) {
-		drm_gem_object_put(gobj);
-		drm_framebuffer_unregister_private(fb);
-		drm_framebuffer_cleanup(fb);
-		kfree(fb);
-	}
-	return ret;
-}
-
-static int radeon_fbdev_destroy(struct drm_device *dev, struct radeon_fbdev *rfbdev)
-{
-	struct drm_framebuffer *fb = &rfbdev->fb;
-
-	drm_fb_helper_unregister_fbi(&rfbdev->helper);
-
-	if (fb->obj[0]) {
-		radeonfb_destroy_pinned_object(fb->obj[0]);
-		fb->obj[0] = NULL;
-		drm_framebuffer_unregister_private(fb);
-		drm_framebuffer_cleanup(fb);
-	}
-	drm_fb_helper_fini(&rfbdev->helper);
-
-	return 0;
-}
-
-static const struct drm_fb_helper_funcs radeon_fb_helper_funcs = {
-	.fb_probe = radeonfb_create,
-};
-
-int radeon_fbdev_init(struct radeon_device *rdev)
+void radeon_fbdev_init(struct radeon_device *rdev)
 {
-	struct radeon_fbdev *rfbdev;
+	struct drm_device *ddev = rdev->ddev;
 	int bpp_sel = 32;
-	int ret;
-
-	/* don't enable fbdev if no connectors */
-	if (list_empty(&rdev->ddev->mode_config.connector_list))
-		return 0;
 
 	/* select 8 bpp console on 8MB cards, or 16 bpp on RN50 or 32MB */
 	if (rdev->mc.real_vram_size <= (8*1024*1024))
 		bpp_sel = 8;
-	else if (ASIC_IS_RN50(rdev) ||
-		 rdev->mc.real_vram_size <= (32*1024*1024))
+	else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <= (32*1024*1024))
 		bpp_sel = 16;
 
-	rfbdev = kzalloc(sizeof(struct radeon_fbdev), GFP_KERNEL);
-	if (!rfbdev)
-		return -ENOMEM;
-
-	rfbdev->rdev = rdev;
-	rdev->mode_info.rfbdev = rfbdev;
-
-	drm_fb_helper_prepare(rdev->ddev, &rfbdev->helper,
-			      &radeon_fb_helper_funcs);
-
-	ret = drm_fb_helper_init(rdev->ddev, &rfbdev->helper);
-	if (ret)
-		goto free;
-
-	/* disable all the possible outputs/crtcs before entering KMS mode */
-	drm_helper_disable_unused_functions(rdev->ddev);
-
-	ret = drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
-	if (ret)
-		goto fini;
-
-	return 0;
-
-fini:
-	drm_fb_helper_fini(&rfbdev->helper);
-free:
-	kfree(rfbdev);
-	return ret;
-}
-
-void radeon_fbdev_fini(struct radeon_device *rdev)
-{
-	if (!rdev->mode_info.rfbdev)
-		return;
+	/* radeon resume is fragile and needs a vt switch to help it along */
+	ddev->mode_config.require_vt_switch_fbdev = true;
 
-	radeon_fbdev_destroy(rdev->ddev, rdev->mode_info.rfbdev);
-	kfree(rdev->mode_info.rfbdev);
-	rdev->mode_info.rfbdev = NULL;
+	drm_fbdev_generic_setup(ddev, bpp_sel);
 }
 
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 {
-	if (rdev->mode_info.rfbdev)
-		drm_fb_helper_set_suspend(&rdev->mode_info.rfbdev->helper, state);
+	drm_fb_helper_set_suspend(rdev->ddev->fb_helper, state);
 }
 
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 {
-	if (!rdev->mode_info.rfbdev)
+	if (!rdev->ddev->fb_helper)
+		return false;
+
+	if (gem_to_radeon_bo(rdev->ddev->fb_helper->buffer->gem) != robj)
 		return false;
 
-	if (robj == gem_to_radeon_bo(rdev->mode_info.rfbdev->fb.obj[0]))
-		return true;
-	return false;
+	return true;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 75b038740ea8..76e18e589ccd 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -608,18 +608,6 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 /*
  * Outdated mess for old drm with Xorg being in charge (void function now).
  */
-/**
- * radeon_driver_lastclose_kms - drm callback for last close
- *
- * @dev: drm dev pointer
- *
- * Switch vga_switcheroo state after last close (all asics).
- */
-void radeon_driver_lastclose_kms(struct drm_device *dev)
-{
-	drm_fb_helper_lastclose(dev);
-	vga_switcheroo_process_delayed_switch();
-}
 
 /**
  * radeon_driver_open_kms - drm callback for open
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index c7f223743d46..fe192ef0aafa 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -230,8 +230,6 @@ enum radeon_dvo_chip {
 	DVO_SIL1178,
 };
 
-struct radeon_fbdev;
-
 struct radeon_afmt {
 	bool enabled;
 	int offset;
@@ -268,8 +266,6 @@ struct radeon_mode_info {
 	struct edid *bios_hardcoded_edid;
 	int bios_hardcoded_edid_size;
 
-	/* pointer to fbdev info structure */
-	struct radeon_fbdev *rfbdev;
 	/* firmware flags */
 	u16 firmware_flags;
 	/* pointer to backlight encoder */
@@ -979,8 +975,7 @@ void dce4_program_fmt(struct drm_encoder *encoder);
 void dce8_program_fmt(struct drm_encoder *encoder);
 
 /* fbdev layer */
-int radeon_fbdev_init(struct radeon_device *rdev);
-void radeon_fbdev_fini(struct radeon_device *rdev);
+void radeon_fbdev_init(struct radeon_device *rdev);
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
