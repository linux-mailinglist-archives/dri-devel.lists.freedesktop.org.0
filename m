Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D18AAA83
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD61510FE35;
	Fri, 19 Apr 2024 08:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9A910FE0C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:33:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB04A3758C;
 Fri, 19 Apr 2024 08:33:46 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A3B513687;
 Fri, 19 Apr 2024 08:33:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yFKIIGosImb9agAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 42/43] drm/fbdev-generic: Convert to fbdev-ttm
Date: Fri, 19 Apr 2024 10:29:35 +0200
Message-ID: <20240419083331.7761-43-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419083331.7761-1-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: BB04A3758C
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

Only TTM-based drivers use fbdev-generic. Rename it to fbdev-ttm and
change the symbol infix from _generic_ to _ttm_. Link the source file
into TTM helpers, so that it is only build if TTM-based drivers have
been selected. Select DRM_TTM_HELPER for loongson.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 Documentation/gpu/drm-kms-helpers.rst         |  2 +-
 drivers/gpu/drm/Makefile                      |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +-
 .../{drm_fbdev_generic.c => drm_fbdev_ttm.c}  | 80 +++++++++----------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  4 +-
 drivers/gpu/drm/loongson/Kconfig              |  1 +
 drivers/gpu/drm/loongson/lsdc_drv.c           |  4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  6 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  4 +-
 drivers/gpu/drm/tiny/bochs.c                  |  4 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
 include/drm/drm_fbdev_generic.h               | 15 ----
 include/drm/drm_fbdev_ttm.h                   | 15 ++++
 14 files changed, 77 insertions(+), 77 deletions(-)
 rename drivers/gpu/drm/{drm_fbdev_generic.c => drm_fbdev_ttm.c} (76%)
 delete mode 100644 include/drm/drm_fbdev_generic.h
 create mode 100644 include/drm/drm_fbdev_ttm.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 59cfe8a7a8bac..e46ab9b670acd 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -116,7 +116,7 @@ fbdev Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
    :export:
 
-.. kernel-doc:: drivers/gpu/drm/drm_fbdev_generic.c
+.. kernel-doc:: drivers/gpu/drm/drm_fbdev_ttm.c
    :export:
 
 format Helper Functions Reference
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 50a2f0cffdac2..7bd4c525fd825 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -117,6 +117,7 @@ drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
 drm_ttm_helper-y := drm_gem_ttm_helper.o
+drm_ttm_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_ttm.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
 #
@@ -142,9 +143,7 @@ drm_kms_helper-y := \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
-drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += \
-	drm_fbdev_generic.o \
-	drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 #
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e4277298cf1aa..a4a63daab9e10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -24,7 +24,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_pciids.h>
@@ -2318,9 +2318,9 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	    !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) {
 		/* select 8 bpp console on low vram cards */
 		if (adev->gmc.real_vram_size <= (32*1024*1024))
-			drm_fbdev_generic_setup(adev_to_drm(adev), 8);
+			drm_fbdev_ttm_setup(adev_to_drm(adev), 8);
 		else
-			drm_fbdev_generic_setup(adev_to_drm(adev), 32);
+			drm_fbdev_ttm_setup(adev_to_drm(adev), 32);
 	}
 
 	ret = amdgpu_debugfs_init(adev);
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_ttm.c
similarity index 76%
rename from drivers/gpu/drm/drm_fbdev_generic.c
rename to drivers/gpu/drm/drm_fbdev_ttm.c
index 97e579c33d84a..bb7898cd7dc63 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -10,10 +10,10 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 
 /* @user: 1=userspace, 0=fbcon */
-static int drm_fbdev_generic_fb_open(struct fb_info *info, int user)
+static int drm_fbdev_ttm_fb_open(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 
@@ -24,7 +24,7 @@ static int drm_fbdev_generic_fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
+static int drm_fbdev_ttm_fb_release(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 
@@ -34,11 +34,11 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_generic,
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_ttm,
 				   drm_fb_helper_damage_range,
 				   drm_fb_helper_damage_area);
 
-static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
+static void drm_fbdev_ttm_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	void *shadow = info->screen_buffer;
@@ -56,19 +56,19 @@ static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
 	kfree(fb_helper);
 }
 
-static const struct fb_ops drm_fbdev_generic_fb_ops = {
+static const struct fb_ops drm_fbdev_ttm_fb_ops = {
 	.owner		= THIS_MODULE,
-	.fb_open	= drm_fbdev_generic_fb_open,
-	.fb_release	= drm_fbdev_generic_fb_release,
-	FB_DEFAULT_DEFERRED_OPS(drm_fbdev_generic),
+	.fb_open	= drm_fbdev_ttm_fb_open,
+	.fb_release	= drm_fbdev_ttm_fb_release,
+	FB_DEFAULT_DEFERRED_OPS(drm_fbdev_ttm),
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_destroy	= drm_fbdev_generic_fb_destroy,
+	.fb_destroy	= drm_fbdev_ttm_fb_destroy,
 };
 
 /*
  * This function uses the client API to create a framebuffer backed by a dumb buffer.
  */
-static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
+static int drm_fbdev_ttm_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					     struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
@@ -108,7 +108,7 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
-	info->fbops = &drm_fbdev_generic_fb_ops;
+	info->fbops = &drm_fbdev_ttm_fb_ops;
 
 	/* screen */
 	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
@@ -137,9 +137,9 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-static void drm_fbdev_generic_damage_blit_real(struct drm_fb_helper *fb_helper,
-					       struct drm_clip_rect *clip,
-					       struct iosys_map *dst)
+static void drm_fbdev_ttm_damage_blit_real(struct drm_fb_helper *fb_helper,
+					   struct drm_clip_rect *clip,
+					   struct iosys_map *dst)
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
 	size_t offset = clip->y1 * fb->pitches[0];
@@ -176,8 +176,8 @@ static void drm_fbdev_generic_damage_blit_real(struct drm_fb_helper *fb_helper,
 	}
 }
 
-static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
-					 struct drm_clip_rect *clip)
+static int drm_fbdev_ttm_damage_blit(struct drm_fb_helper *fb_helper,
+				     struct drm_clip_rect *clip)
 {
 	struct drm_client_buffer *buffer = fb_helper->buffer;
 	struct iosys_map map, dst;
@@ -201,7 +201,7 @@ static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
 		goto out;
 
 	dst = map;
-	drm_fbdev_generic_damage_blit_real(fb_helper, clip, &dst);
+	drm_fbdev_ttm_damage_blit_real(fb_helper, clip, &dst);
 
 	drm_client_buffer_vunmap_local(buffer);
 
@@ -211,8 +211,8 @@ static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-static int drm_fbdev_generic_helper_fb_dirty(struct drm_fb_helper *helper,
-					     struct drm_clip_rect *clip)
+static int drm_fbdev_ttm_helper_fb_dirty(struct drm_fb_helper *helper,
+					 struct drm_clip_rect *clip)
 {
 	struct drm_device *dev = helper->dev;
 	int ret;
@@ -221,7 +221,7 @@ static int drm_fbdev_generic_helper_fb_dirty(struct drm_fb_helper *helper,
 	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
 		return 0;
 
-	ret = drm_fbdev_generic_damage_blit(helper, clip);
+	ret = drm_fbdev_ttm_damage_blit(helper, clip);
 	if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
 		return ret;
 
@@ -234,12 +234,12 @@ static int drm_fbdev_generic_helper_fb_dirty(struct drm_fb_helper *helper,
 	return 0;
 }
 
-static const struct drm_fb_helper_funcs drm_fbdev_generic_helper_funcs = {
-	.fb_probe = drm_fbdev_generic_helper_fb_probe,
-	.fb_dirty = drm_fbdev_generic_helper_fb_dirty,
+static const struct drm_fb_helper_funcs drm_fbdev_ttm_helper_funcs = {
+	.fb_probe = drm_fbdev_ttm_helper_fb_probe,
+	.fb_dirty = drm_fbdev_ttm_helper_fb_dirty,
 };
 
-static void drm_fbdev_generic_client_unregister(struct drm_client_dev *client)
+static void drm_fbdev_ttm_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
@@ -252,14 +252,14 @@ static void drm_fbdev_generic_client_unregister(struct drm_client_dev *client)
 	}
 }
 
-static int drm_fbdev_generic_client_restore(struct drm_client_dev *client)
+static int drm_fbdev_ttm_client_restore(struct drm_client_dev *client)
 {
 	drm_fb_helper_lastclose(client->dev);
 
 	return 0;
 }
 
-static int drm_fbdev_generic_client_hotplug(struct drm_client_dev *client)
+static int drm_fbdev_ttm_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = client->dev;
@@ -284,32 +284,32 @@ static int drm_fbdev_generic_client_hotplug(struct drm_client_dev *client)
 err_drm_fb_helper_fini:
 	drm_fb_helper_fini(fb_helper);
 err_drm_err:
-	drm_err(dev, "fbdev: Failed to setup generic emulation (ret=%d)\n", ret);
+	drm_err(dev, "fbdev: Failed to setup emulation (ret=%d)\n", ret);
 	return ret;
 }
 
-static const struct drm_client_funcs drm_fbdev_generic_client_funcs = {
+static const struct drm_client_funcs drm_fbdev_ttm_client_funcs = {
 	.owner		= THIS_MODULE,
-	.unregister	= drm_fbdev_generic_client_unregister,
-	.restore	= drm_fbdev_generic_client_restore,
-	.hotplug	= drm_fbdev_generic_client_hotplug,
+	.unregister	= drm_fbdev_ttm_client_unregister,
+	.restore	= drm_fbdev_ttm_client_restore,
+	.hotplug	= drm_fbdev_ttm_client_hotplug,
 };
 
 /**
- * drm_fbdev_generic_setup() - Setup generic fbdev emulation
+ * drm_fbdev_ttm_setup() - Setup fbdev emulation for TTM-based drivers
  * @dev: DRM device
  * @preferred_bpp: Preferred bits per pixel for the device.
  *
- * This function sets up generic fbdev emulation for drivers that supports
+ * This function sets up fbdev emulation for TTM-based drivers that support
  * dumb buffers with a virtual address and that can be mmap'ed.
- * drm_fbdev_generic_setup() shall be called after the DRM driver registered
+ * drm_fbdev_ttm_setup() shall be called after the DRM driver registered
  * the new DRM device with drm_dev_register().
  *
  * Restore, hotplug events and teardown are all taken care of. Drivers that do
  * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
  * Simple drivers might use drm_mode_config_helper_suspend().
  *
- * In order to provide fixed mmap-able memory ranges, generic fbdev emulation
+ * In order to provide fixed mmap-able memory ranges, fbdev emulation
  * uses a shadow buffer in system memory. The implementation blits the shadow
  * fbdev buffer onto the real buffer in regular intervals.
  *
@@ -318,7 +318,7 @@ static const struct drm_client_funcs drm_fbdev_generic_client_funcs = {
  *
  * The fbdev is destroyed by drm_dev_unregister().
  */
-void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
+void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
 {
 	struct drm_fb_helper *fb_helper;
 	int ret;
@@ -329,9 +329,9 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
 	if (!fb_helper)
 		return;
-	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_generic_helper_funcs);
+	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_ttm_helper_funcs);
 
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_generic_client_funcs);
+	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_ttm_client_funcs);
 	if (ret) {
 		drm_err(dev, "Failed to register client: %d\n", ret);
 		goto err_drm_client_init;
@@ -346,4 +346,4 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 	kfree(fb_helper);
 	return;
 }
-EXPORT_SYMBOL(drm_fbdev_generic_setup);
+EXPORT_SYMBOL(drm_fbdev_ttm_setup);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 57c21ec452b70..9f9b19ea05879 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -17,7 +17,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
@@ -339,7 +339,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 		goto err_unload;
 	}
 
-	drm_fbdev_generic_setup(dev, 32);
+	drm_fbdev_ttm_setup(dev, 32);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
index 8e59753e532de..9ed463a76ae29 100644
--- a/drivers/gpu/drm/loongson/Kconfig
+++ b/drivers/gpu/drm/loongson/Kconfig
@@ -6,6 +6,7 @@ config DRM_LOONGSON
 	depends on LOONGARCH || MIPS || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select DRM_TTM
+	select DRM_TTM_HELPER
 	select I2C
 	select I2C_ALGOBIT
 	help
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index d8ff60b46abe6..adc7344d2f807 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_modeset_helper.h>
@@ -314,7 +314,7 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(ddev, 32);
+	drm_fbdev_ttm_setup(ddev, 32);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a947e1d5f309a..a58c31089613e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -32,7 +32,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_vblank.h>
@@ -846,9 +846,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 		goto fail_drm_dev_init;
 
 	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32 * 1024 * 1024)
-		drm_fbdev_generic_setup(drm_dev, 8);
+		drm_fbdev_ttm_setup(drm_dev, 8);
 	else
-		drm_fbdev_generic_setup(drm_dev, 32);
+		drm_fbdev_ttm_setup(drm_dev, 32);
 
 	quirk_broken_nv_runpm(pdev);
 	return 0;
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index beee5563031aa..5eb3f5719fdf3 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -37,7 +37,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_module.h>
@@ -118,7 +118,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto modeset_cleanup;
 
-	drm_fbdev_generic_setup(&qdev->ddev, 32);
+	drm_fbdev_ttm_setup(&qdev->ddev, 32);
 	return 0;
 
 modeset_cleanup:
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index c23c9f0cf49cb..2d7ad808cc0e2 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -7,7 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -670,7 +670,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 	if (ret)
 		goto err_hw_fini;
 
-	drm_fbdev_generic_setup(dev, 32);
+	drm_fbdev_ttm_setup(dev, 32);
 	return ret;
 
 err_hw_fini:
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index cd9e66a06596a..ef36834c8673c 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -14,7 +14,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
@@ -80,7 +80,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto err_irq_fini;
 
-	drm_fbdev_generic_setup(&vbox->ddev, 32);
+	drm_fbdev_ttm_setup(&vbox->ddev, 32);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0a304706e0132..1e5dd0507d312 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -36,7 +36,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_module.h>
@@ -1680,7 +1680,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	vmw_fifo_resource_inc(vmw);
 	vmw_svga_enable(vmw);
-	drm_fbdev_generic_setup(&vmw->drm,  0);
+	drm_fbdev_ttm_setup(&vmw->drm,  0);
 
 	vmw_debugfs_gem_init(vmw);
 	vmw_debugfs_resource_managers_init(vmw);
diff --git a/include/drm/drm_fbdev_generic.h b/include/drm/drm_fbdev_generic.h
deleted file mode 100644
index 75799342098dc..0000000000000
--- a/include/drm/drm_fbdev_generic.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-
-#ifndef DRM_FBDEV_GENERIC_H
-#define DRM_FBDEV_GENERIC_H
-
-struct drm_device;
-
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp);
-#else
-static inline void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
-{ }
-#endif
-
-#endif
diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
new file mode 100644
index 0000000000000..9e6c3bdf35376
--- /dev/null
+++ b/include/drm/drm_fbdev_ttm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_FBDEV_TTM_H
+#define DRM_FBDEV_TTM_H
+
+struct drm_device;
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp);
+#else
+static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
+{ }
+#endif
+
+#endif
-- 
2.44.0

