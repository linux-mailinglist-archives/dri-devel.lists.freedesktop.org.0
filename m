Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F00A1BE112
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83DF6EEB4;
	Wed, 29 Apr 2020 14:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322466EEA8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:32:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09D34AF93;
 Wed, 29 Apr 2020 14:32:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH 16/17] drm/mgag200: Convert to simple KMS helper
Date: Wed, 29 Apr 2020 16:32:37 +0200
Message-Id: <20200429143238.10115-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200429143238.10115-1-tzimmermann@suse.de>
References: <20200429143238.10115-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mgag200 supports a single pipeline with only a primary plane. It can
be converted to simple KMS helpers. This also adds support for atomic
modesetting. Wayland compositors, which use pageflip ioctls, can now be
used with mgag200.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |   4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 396 +++++++++++--------------
 3 files changed, 171 insertions(+), 231 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 3298b7ef18b03..b1272165621ed 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -140,7 +140,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
 }
 
 static struct drm_driver driver = {
-	.driver_features = DRIVER_GEM | DRIVER_MODESET,
+	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 	.fops = &mgag200_driver_fops,
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index b10da90e0f35a..2e407508714c8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -19,6 +19,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "mgag200_reg.h"
 
@@ -107,6 +108,7 @@
 
 #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
 #define to_mga_connector(x) container_of(x, struct mga_connector, base)
+#define to_mga_device(x) (dev->dev_private)
 
 struct mga_crtc {
 	struct drm_crtc base;
@@ -176,7 +178,7 @@ struct mga_device {
 	u32 unique_rev_id;
 
 	struct mga_connector connector;
-	struct drm_encoder encoder;
+	struct drm_simple_display_pipe display_pipe;
 };
 
 static inline enum mga_type
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 884fc668a6dae..d9b4055e38982 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -11,10 +11,13 @@
 #include <linux/delay.h>
 #include <linux/pci.h>
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -30,13 +33,18 @@ static void mga_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = dev->dev_private;
-	struct drm_framebuffer *fb = crtc->primary->fb;
+	struct drm_framebuffer *fb;
 	u16 *r_ptr, *g_ptr, *b_ptr;
 	int i;
 
 	if (!crtc->enabled)
 		return;
 
+	if (!mdev->display_pipe.plane.state)
+		return;
+
+	fb = mdev->display_pipe.plane.state->fb;
+
 	r_ptr = crtc->gamma_store;
 	g_ptr = r_ptr + crtc->gamma_size;
 	b_ptr = g_ptr + crtc->gamma_size;
@@ -845,56 +853,6 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
-static int mga_crtc_do_set_base(struct mga_device *mdev,
-				const struct drm_framebuffer *fb,
-				const struct drm_framebuffer *old_fb)
-{
-	struct drm_gem_vram_object *gbo;
-	int ret;
-	s64 gpu_addr;
-
-	if (old_fb) {
-		gbo = drm_gem_vram_of_gem(old_fb->obj[0]);
-		drm_gem_vram_unpin(gbo);
-	}
-
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
-	if (ret)
-		return ret;
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (gpu_addr < 0) {
-		ret = (int)gpu_addr;
-		goto err_drm_gem_vram_unpin;
-	}
-
-	mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
-
-	return 0;
-
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
-	return ret;
-}
-
-static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
-				  struct drm_framebuffer *old_fb)
-{
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
-	struct drm_framebuffer *fb = crtc->primary->fb;
-	unsigned int count;
-
-	while (RREG8(0x1fda) & 0x08) { }
-	while (!(RREG8(0x1fda) & 0x08)) { }
-
-	count = RREG8(MGAREG_VCOUNT) + 2;
-	while (RREG8(MGAREG_VCOUNT) < count) { }
-
-	return mga_crtc_do_set_base(mdev, fb, old_fb);
-}
-
 static void mgag200_set_pci_regs(struct mga_device *mdev)
 {
 	uint32_t option = 0, option2 = 0;
@@ -1291,93 +1249,6 @@ static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
 	WREG_ECRT(0x06, 0x00);
 }
 
-static int mga_crtc_mode_set(struct drm_crtc *crtc,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode,
-				int x, int y, struct drm_framebuffer *old_fb)
-{
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
-	const struct drm_framebuffer *fb = crtc->primary->fb;
-
-	mgag200_init_regs(mdev);
-
-	mgag200_set_format_regs(mdev, fb);
-	mga_crtc_do_set_base(mdev, fb, old_fb);
-	mgag200_set_offset(mdev, fb);
-
-	mgag200_set_mode_regs(mdev, mode);
-
-	if (mdev->type == G200_ER)
-		mgag200_g200er_reset_tagfifo(mdev);
-
-	if (IS_G200_SE(mdev))
-		mgag200_g200se_set_hiprilvl(mdev, mode, fb);
-	else if (mdev->type == G200_EV)
-		mgag200_g200ev_set_hiprilvl(mdev);
-
-	return 0;
-}
-
-#if 0 /* code from mjg to attempt D3 on crtc dpms off - revisit later */
-static int mga_suspend(struct drm_crtc *crtc)
-{
-	struct mga_crtc *mga_crtc = to_mga_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
-	struct pci_dev *pdev = dev->pdev;
-	int option;
-
-	if (mdev->suspended)
-		return 0;
-
-	WREG_SEQ(1, 0x20);
-	WREG_ECRT(1, 0x30);
-	/* Disable the pixel clock */
-	WREG_DAC(0x1a, 0x05);
-	/* Power down the DAC */
-	WREG_DAC(0x1e, 0x18);
-	/* Power down the pixel PLL */
-	WREG_DAC(0x1a, 0x0d);
-
-	/* Disable PLLs and clocks */
-	pci_read_config_dword(pdev, PCI_MGA_OPTION, &option);
-	option &= ~(0x1F8024);
-	pci_write_config_dword(pdev, PCI_MGA_OPTION, option);
-	pci_set_power_state(pdev, PCI_D3hot);
-	pci_disable_device(pdev);
-
-	mdev->suspended = true;
-
-	return 0;
-}
-
-static int mga_resume(struct drm_crtc *crtc)
-{
-	struct mga_crtc *mga_crtc = to_mga_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
-	struct pci_dev *pdev = dev->pdev;
-	int option;
-
-	if (!mdev->suspended)
-		return 0;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_device(pdev);
-
-	/* Disable sysclk */
-	pci_read_config_dword(pdev, PCI_MGA_OPTION, &option);
-	option &= ~(0x4);
-	pci_write_config_dword(pdev, PCI_MGA_OPTION, option);
-
-	mdev->suspended = false;
-
-	return 0;
-}
-
-#endif
-
 static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1470,7 +1341,6 @@ static void mga_crtc_commit(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = dev->dev_private;
-	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
 	u8 tmp;
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
@@ -1489,78 +1359,7 @@ static void mga_crtc_commit(struct drm_crtc *crtc)
 		WREG_SEQ(0x1, tmp);
 		WREG_SEQ(0, 3);
 	}
-	crtc_funcs->dpms(crtc, DRM_MODE_DPMS_ON);
-}
-
-/*
- * The core can pass us a set of gamma values to program. We actually only
- * use this for 8-bit mode so can't perform smooth fades on deeper modes,
- * but it's a requirement that we provide the function
- */
-static int mga_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
-			      u16 *blue, uint32_t size,
-			      struct drm_modeset_acquire_ctx *ctx)
-{
-	mga_crtc_load_lut(crtc);
-
-	return 0;
-}
-
-/* Simple cleanup function */
-static void mga_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct mga_crtc *mga_crtc = to_mga_crtc(crtc);
-
-	drm_crtc_cleanup(crtc);
-	kfree(mga_crtc);
-}
-
-static void mga_crtc_disable(struct drm_crtc *crtc)
-{
-	DRM_DEBUG_KMS("\n");
-	mga_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
-	if (crtc->primary->fb) {
-		struct drm_framebuffer *fb = crtc->primary->fb;
-		struct drm_gem_vram_object *gbo =
-			drm_gem_vram_of_gem(fb->obj[0]);
-		drm_gem_vram_unpin(gbo);
-	}
-	crtc->primary->fb = NULL;
-}
-
-/* These provide the minimum set of functions required to handle a CRTC */
-static const struct drm_crtc_funcs mga_crtc_funcs = {
-	.gamma_set = mga_crtc_gamma_set,
-	.set_config = drm_crtc_helper_set_config,
-	.destroy = mga_crtc_destroy,
-};
-
-static const struct drm_crtc_helper_funcs mga_helper_funcs = {
-	.disable = mga_crtc_disable,
-	.dpms = mga_crtc_dpms,
-	.mode_set = mga_crtc_mode_set,
-	.mode_set_base = mga_crtc_mode_set_base,
-	.prepare = mga_crtc_prepare,
-	.commit = mga_crtc_commit,
-};
-
-/* CRTC setup */
-static void mga_crtc_init(struct mga_device *mdev)
-{
-	struct mga_crtc *mga_crtc;
-
-	mga_crtc = kzalloc(sizeof(struct mga_crtc) +
-			      (MGAG200FB_CONN_LIMIT * sizeof(struct drm_connector *)),
-			      GFP_KERNEL);
-
-	if (mga_crtc == NULL)
-		return;
-
-	drm_crtc_init(mdev->dev, &mga_crtc->base, &mga_crtc_funcs);
-
-	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
-
-	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
+	mga_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 }
 
 /*
@@ -1694,14 +1493,16 @@ static void mga_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
-	.get_modes = mga_vga_get_modes,
+	.get_modes  = mga_vga_get_modes,
 	.mode_valid = mga_vga_mode_valid,
 };
 
 static const struct drm_connector_funcs mga_vga_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = mga_connector_destroy,
+	.reset                  = drm_atomic_helper_connector_reset,
+	.fill_modes             = drm_helper_probe_single_connector_modes,
+	.destroy                = mga_connector_destroy,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
 };
 
 static int mgag200_vga_connector_init(struct mga_device *mdev)
@@ -1733,8 +1534,138 @@ static int mgag200_vga_connector_init(struct mga_device *mdev)
 	return ret;
 }
 
+/*
+ * Simple Display Pipe
+ */
+
+static enum drm_mode_status
+mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
+				       const struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static void
+mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_plane_state *plane_state)
+{
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_device *dev = crtc->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
+
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
+
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
+		return; /* BUG: BO should have been pinned to VRAM. */
+
+	mga_crtc_prepare(crtc);
+
+	mgag200_set_format_regs(mdev, fb);
+	mgag200_set_mode_regs(mdev, adjusted_mode);
+
+	if (mdev->type == G200_ER)
+		mgag200_g200er_reset_tagfifo(mdev);
+
+	if (IS_G200_SE(mdev))
+		mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, fb);
+	else if (mdev->type == G200_EV)
+		mgag200_g200ev_set_hiprilvl(mdev);
+
+	mga_crtc_commit(crtc);
+}
+
+static void
+mgag200_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct drm_crtc *crtc = &pipe->crtc;
+
+	mga_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+}
+
+static int
+mgag200_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
+				  struct drm_plane_state *plane_state,
+				  struct drm_crtc_state *crtc_state)
+{
+	struct drm_plane *plane = plane_state->plane;
+	struct drm_framebuffer *new_fb = plane_state->fb;
+	struct drm_framebuffer *fb = NULL;
+
+	if (!new_fb)
+		return 0;
+
+	if (plane->state)
+		fb = plane->state->fb;
+
+	if (!fb || (fb->format != new_fb->format))
+		crtc_state->mode_changed = true; /* update PLL settings */
+
+	return 0;
+}
+
+static void
+mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
+				   struct drm_plane_state *old_state)
+{
+	struct drm_plane *plane = &pipe->plane;
+	struct drm_device *dev = plane->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	struct drm_plane_state *state = plane->state;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
+
+	if (!fb)
+		return;
+
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
+
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
+		return; /* BUG: BO should have been pinned to VRAM. */
+
+	mgag200_set_format_regs(mdev, fb);
+	mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
+	mgag200_set_offset(mdev, fb);
+}
+
+static const struct drm_simple_display_pipe_funcs
+mgag200_simple_display_pipe_funcs = {
+	.mode_valid = mgag200_simple_display_pipe_mode_valid,
+	.enable	    = mgag200_simple_display_pipe_enable,
+	.disable    = mgag200_simple_display_pipe_disable,
+	.check	    = mgag200_simple_display_pipe_check,
+	.update	    = mgag200_simple_display_pipe_update,
+	.prepare_fb = drm_gem_vram_simple_display_pipe_prepare_fb,
+	.cleanup_fb = drm_gem_vram_simple_display_pipe_cleanup_fb,
+};
+
+static const uint32_t mgag200_simple_display_pipe_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+};
+
+static const uint64_t mgag200_simple_display_pipe_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+/*
+ * Mode config
+ */
+
 static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create
+	.fb_create     = drm_gem_fb_create,
+	.mode_valid    = drm_vram_helper_mode_valid,
+	.atomic_check  = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
@@ -1748,10 +1679,13 @@ static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
 int mgag200_modeset_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
-	struct drm_encoder *encoder = &mdev->encoder;
 	struct drm_connector *connector = &mdev->connector.base;
+	struct drm_simple_display_pipe *pipe = &mdev->display_pipe;
+	size_t format_count = ARRAY_SIZE(mgag200_simple_display_pipe_formats);
 	int ret;
 
+	mgag200_init_regs(mdev);
+
 	ret = drmm_mode_config_init(dev);
 	if (ret) {
 		drm_err(dev, "drmm_mode_config_init() failed, error %d\n",
@@ -1769,26 +1703,30 @@ int mgag200_modeset_init(struct mga_device *mdev)
 
 	dev->mode_config.funcs = &mgag200_mode_config_funcs;
 
-	mga_crtc_init(mdev);
-
-	ret = drm_simple_encoder_init(mdev->dev, encoder,
-				      DRM_MODE_ENCODER_DAC);
+	ret = mgag200_vga_connector_init(mdev);
 	if (ret) {
-		drm_err(mdev->dev,
-			"drm_simple_encoder_init() failed, error %d\n",
+		drm_err(dev, "mga_vga_connector_init() failed, error %d\n",
 			ret);
 		return ret;
 	}
-	encoder->possible_crtcs = 0x1;
 
-	ret = mgag200_vga_connector_init(mdev);
+	ret = drm_simple_display_pipe_init(dev, pipe,
+					   &mgag200_simple_display_pipe_funcs,
+					   mgag200_simple_display_pipe_formats,
+					   format_count,
+					   mgag200_simple_display_pipe_modifiers,
+					   connector);
 	if (ret) {
-		drm_err(mdev->dev,
-			"mga_vga_connector_init() failed, error %d\n", ret);
-		return -1;
+		drm_err(dev,
+			"drm_simple_display_pipe_init() failed, error %d\n",
+			ret);
+		return ret;
 	}
 
-	drm_connector_attach_encoder(connector, encoder);
+	/* FIXME: legacy gamma tables; convert to CRTC state */
+	drm_mode_crtc_set_gamma_size(&pipe->crtc, MGAG200_LUT_SIZE);
+
+	drm_mode_config_reset(dev);
 
 	return 0;
 }
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
