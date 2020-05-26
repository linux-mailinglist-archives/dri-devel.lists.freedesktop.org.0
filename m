Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156AB1D4841
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE7D6EC19;
	Fri, 15 May 2020 08:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD256EC20
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9275B00D;
 Fri, 15 May 2020 08:32:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 15/15] drm/mgag200: Replace VRAM helpers with SHMEM helpers
Date: Fri, 15 May 2020 10:32:33 +0200
Message-Id: <20200515083233.32036-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515083233.32036-1-tzimmermann@suse.de>
References: <20200515083233.32036-1-tzimmermann@suse.de>
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
Cc: John Donnelly <John.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VRAM helpers managed the framebuffer memory for mgag200. This came
with several problems, as some MGA device require the scanout address
to be located at VRAM offset 0. It's incompatible with the page-flip
semantics of DRM's atomic modesettting. With atomic modesetting, old and
new framebuffers have to be located in VRAM at the same time. So at least
one of them has to reside at a non-0 offset.

This patch replaces VRAM helpers with SHMEM helpers. GEM SHMEM buffers
reside in system memory, and are shadow-copied into VRAM during page
flips. The shadow copy always starts at VRAM offset 0.

v2:
	* revert dev->pdev changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/Kconfig        |  4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 49 +---------------------
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 58 ++++++++++++++++----------
 drivers/gpu/drm/mgag200/mgag200_ttm.c  | 28 +++++++------
 5 files changed, 56 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index d60aa4b9ccd47..93be766715c9b 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -2,10 +2,8 @@
 config DRM_MGAG200
 	tristate "Kernel modesetting driver for MGA G200 server engines"
 	depends on DRM && PCI && MMU
+	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
-	select DRM_VRAM_HELPER
-	select DRM_TTM
-	select DRM_TTM_HELPER
 	help
 	 This is a KMS driver for the MGA G200 server chips, it
 	 does not support the original MGA G200 or any of the desktop
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index a06ce4198adea..00ddea7d7d270 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -22,15 +22,11 @@
  * which then performs further device association and calls our graphics init
  * functions
  */
-int mgag200_modeset = -1;
 
+int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
-int mgag200_hw_bug_no_startadd = -1;
-MODULE_PARM_DESC(modeset, "HW does not interpret scanout-buffer start address correctly");
-module_param_named(hw_bug_no_startadd, mgag200_hw_bug_no_startadd, int, 0400);
-
 static struct drm_driver driver;
 
 static const struct pci_device_id pciidlist[] = {
@@ -101,44 +97,6 @@ static void mga_pci_remove(struct pci_dev *pdev)
 
 DEFINE_DRM_GEM_FOPS(mgag200_driver_fops);
 
-static bool mgag200_pin_bo_at_0(const struct mga_device *mdev)
-{
-	if (mgag200_hw_bug_no_startadd > 0) {
-		DRM_WARN_ONCE("Option hw_bug_no_startradd is enabled. Please "
-			      "report the output of 'lspci -vvnn' to "
-			      "<dri-devel@lists.freedesktop.org> if this "
-			      "option is required to make mgag200 work "
-			      "correctly on your system.\n");
-		return true;
-	} else if (!mgag200_hw_bug_no_startadd) {
-		return false;
-	}
-	return mdev->flags & MGAG200_FLAG_HW_BUG_NO_STARTADD;
-}
-
-int mgag200_driver_dumb_create(struct drm_file *file,
-			       struct drm_device *dev,
-			       struct drm_mode_create_dumb *args)
-{
-	struct mga_device *mdev = to_mga_device(dev);
-	unsigned long pg_align;
-
-	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
-		return -EINVAL;
-
-	pg_align = 0ul;
-
-	/*
-	 * Aligning scanout buffers to the size of the video ram forces
-	 * placement at offset 0. Works around a bug where HW does not
-	 * respect 'startadd' field.
-	 */
-	if (mgag200_pin_bo_at_0(mdev))
-		pg_align = PFN_UP(mdev->mc.vram_size);
-
-	return drm_gem_vram_fill_create_dumb(file, dev, pg_align, 0, args);
-}
-
 static struct drm_driver driver = {
 	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 	.fops = &mgag200_driver_fops,
@@ -148,10 +106,7 @@ static struct drm_driver driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-	.debugfs_init = drm_vram_mm_debugfs_init,
-	.dumb_create = mgag200_driver_dumb_create,
-	.dumb_map_offset = drm_gem_vram_driver_dumb_mmap_offset,
-	.gem_prime_mmap = drm_gem_prime_mmap,
+	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
 static struct pci_driver mgag200_pci_driver = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index d929ca3a767a3..47df62b1ad290 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -18,7 +18,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "mgag200_reg.h"
@@ -151,7 +151,8 @@ struct mga_device {
 
 	struct mga_mc			mc;
 
-	size_t vram_fb_available;
+	void __iomem			*vram;
+	size_t				vram_fb_available;
 
 	enum mga_type			type;
 	int				has_sdram;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index b50c1beb7b7b9..0155d4eb5fa6b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -14,6 +14,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -1573,6 +1575,26 @@ mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
+static void
+mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
+		      struct drm_rect *clip)
+{
+	struct drm_device *dev = mdev->dev;
+	void *vmap;
+
+	vmap = drm_gem_shmem_vmap(fb->obj[0]);
+	if (drm_WARN_ON(dev, !vmap))
+		return; /* BUG: SHMEM BO should always be vmapped */
+
+	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
+
+	drm_gem_shmem_vunmap(fb->obj[0], vmap);
+
+	/* Always scanout image at VRAM offset 0 */
+	mgag200_set_startadd(mdev, (u32)0);
+	mgag200_set_offset(mdev, fb);
+}
+
 static void
 mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 				   struct drm_crtc_state *crtc_state,
@@ -1583,14 +1605,12 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
-
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
-		return; /* BUG: BO should have been pinned to VRAM. */
+	struct drm_rect fullscreen = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height,
+	};
 
 	mga_crtc_prepare(crtc);
 
@@ -1606,6 +1626,8 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		mgag200_g200ev_set_hiprilvl(mdev);
 
 	mga_crtc_commit(crtc);
+
+	mgag200_handle_damage(mdev, fb, &fullscreen);
 }
 
 static void
@@ -1646,20 +1668,13 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
+	struct drm_rect damage;
 
 	if (!fb)
 		return;
 
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
-		return; /* BUG: BO should have been pinned to VRAM. */
-
-	mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
-	mgag200_set_offset(mdev, fb);
+	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+		mgag200_handle_damage(mdev, fb, &damage);
 }
 
 static const struct drm_simple_display_pipe_funcs
@@ -1669,8 +1684,7 @@ mgag200_simple_display_pipe_funcs = {
 	.disable    = mgag200_simple_display_pipe_disable,
 	.check	    = mgag200_simple_display_pipe_check,
 	.update	    = mgag200_simple_display_pipe_update,
-	.prepare_fb = drm_gem_vram_simple_display_pipe_prepare_fb,
-	.cleanup_fb = drm_gem_vram_simple_display_pipe_cleanup_fb,
+	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
 };
 
 static const uint32_t mgag200_simple_display_pipe_formats[] = {
@@ -1689,8 +1703,7 @@ static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
  */
 
 static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
-	.fb_create     = drm_gem_fb_create,
-	.mode_valid    = drm_vram_helper_mode_valid,
+	.fb_create     = drm_gem_fb_create_with_dirty,
 	.atomic_check  = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -1729,7 +1742,6 @@ int mgag200_modeset_init(struct mga_device *mdev)
 	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
 
 	dev->mode_config.preferred_depth = mgag200_preferred_depth(mdev);
-	dev->mode_config.prefer_shadow = 1;
 
 	dev->mode_config.fb_base = mdev->mc.vram_base;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
index e89657630ea71..a683642fe4682 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
@@ -32,17 +32,8 @@
 
 int mgag200_mm_init(struct mga_device *mdev)
 {
-	struct drm_vram_mm *vmm;
-	int ret;
 	struct drm_device *dev = mdev->dev;
-
-	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
-				       mdev->mc.vram_size);
-	if (IS_ERR(vmm)) {
-		ret = PTR_ERR(vmm);
-		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
-		return ret;
-	}
+	int ret;
 
 	arch_io_reserve_memtype_wc(pci_resource_start(dev->pdev, 0),
 				   pci_resource_len(dev->pdev, 0));
@@ -50,9 +41,22 @@ int mgag200_mm_init(struct mga_device *mdev)
 	mdev->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
 					 pci_resource_len(dev->pdev, 0));
 
+	mdev->vram = ioremap(pci_resource_start(dev->pdev, 0),
+			     pci_resource_len(dev->pdev, 0));
+	if (!mdev->vram) {
+		ret = -ENOMEM;
+		goto err_arch_phys_wc_del;
+	}
+
 	mdev->vram_fb_available = mdev->mc.vram_size;
 
 	return 0;
+
+err_arch_phys_wc_del:
+	arch_phys_wc_del(mdev->fb_mtrr);
+	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
+				pci_resource_len(dev->pdev, 0));
+	return ret;
 }
 
 void mgag200_mm_fini(struct mga_device *mdev)
@@ -60,9 +64,7 @@ void mgag200_mm_fini(struct mga_device *mdev)
 	struct drm_device *dev = mdev->dev;
 
 	mdev->vram_fb_available = 0;
-
-	drm_vram_helper_release_mm(dev);
-
+	iounmap(mdev->vram);
 	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
 				pci_resource_len(dev->pdev, 0));
 	arch_phys_wc_del(mdev->fb_mtrr);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
