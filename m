Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5DF954A60
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7010E771;
	Fri, 16 Aug 2024 12:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12CC10E701;
 Fri, 16 Aug 2024 12:54:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5291922899;
 Fri, 16 Aug 2024 12:54:38 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2A0713ACA;
 Fri, 16 Aug 2024 12:54:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EGT8OQ1Mv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH 78/86] drm/radeon: Run DRM default client setup
Date: Fri, 16 Aug 2024 14:23:44 +0200
Message-ID: <20240816125408.310253-79-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5291922899
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
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

Rework fbdev probing to support fbdev_probe in struct drm_driver
and remove the old fb_probe callback. Provide an initializer macro
for struct drm_driver that sets the callback according to the kernel
configuration.

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The radeon driver specifies a preferred color mode depending on
the available video memory, with a default of 32. Adapt this for
the new client interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c   |  13 ++-
 drivers/gpu/drm/radeon/radeon_fbdev.c | 114 ++------------------------
 drivers/gpu/drm/radeon/radeon_mode.h  |  12 ++-
 3 files changed, 26 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..08ccfec6f6ec 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -38,8 +38,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_pciids.h>
@@ -260,6 +262,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 {
 	unsigned long flags = 0;
 	struct drm_device *dev;
+	struct radeon_device *rdev;
 	int ret;
 
 	if (!ent)
@@ -314,7 +317,13 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_agp;
 
-	radeon_fbdev_setup(dev->dev_private);
+	rdev = dev->dev_private;
+	if (rdev->mc.real_vram_size <= (8 * 1024 * 1024))
+		drm_client_setup(dev, drm_format_info(DRM_FORMAT_C8));
+	else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <= (32 * 1024 * 1024))
+		drm_client_setup(dev, drm_format_info(DRM_FORMAT_RGB565));
+	else
+		drm_client_setup(dev, NULL);
 
 	return 0;
 
@@ -581,6 +590,8 @@ static const struct drm_driver kms_driver = {
 
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
 
+	RADEON_FBDEV_DRIVER_OPS,
+
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 02bf25759059..4c81f9a87c16 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -198,12 +198,11 @@ static const struct fb_ops radeon_fbdev_fb_ops = {
 	.fb_destroy = radeon_fbdev_fb_destroy,
 };
 
-/*
- * Fbdev helpers and struct drm_fb_helper_funcs
- */
+static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
+};
 
-static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
-					   struct drm_fb_helper_surface_size *sizes)
+int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
@@ -243,6 +242,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	}
 
 	/* setup helper */
+	fb_helper->funcs = &radeon_fbdev_fb_helper_funcs;
 	fb_helper->fb = fb;
 
 	/* okay we have an object now allocate the framebuffer */
@@ -288,110 +288,6 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
-	.fb_probe = radeon_fbdev_fb_helper_fb_probe,
-};
-
-/*
- * Fbdev client and struct drm_client_funcs
- */
-
-static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = fb_helper->dev;
-	struct radeon_device *rdev = dev->dev_private;
-
-	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
-		drm_helper_force_disable_all(dev);
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_client_release(&fb_helper->client);
-		drm_fb_helper_unprepare(fb_helper);
-		kfree(fb_helper);
-	}
-}
-
-static int radeon_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-	vga_switcheroo_process_delayed_switch();
-
-	return 0;
-}
-
-static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
-	struct radeon_device *rdev = dev->dev_private;
-	int ret;
-
-	if (dev->fb_helper)
-		return drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	ret = drm_fb_helper_init(dev, fb_helper);
-	if (ret)
-		goto err_drm_err;
-
-	if (!drm_drv_uses_atomic_modeset(dev))
-		drm_helper_disable_unused_functions(dev);
-
-	ret = drm_fb_helper_initial_config(fb_helper);
-	if (ret)
-		goto err_drm_fb_helper_fini;
-
-	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "Failed to setup radeon fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs radeon_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= radeon_fbdev_client_unregister,
-	.restore	= radeon_fbdev_client_restore,
-	.hotplug	= radeon_fbdev_client_hotplug,
-};
-
-void radeon_fbdev_setup(struct radeon_device *rdev)
-{
-	struct drm_fb_helper *fb_helper;
-	int bpp_sel = 32;
-	int ret;
-
-	if (rdev->mc.real_vram_size <= (8 * 1024 * 1024))
-		bpp_sel = 8;
-	else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <= (32 * 1024 * 1024))
-		bpp_sel = 16;
-
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
-
-	ret = drm_client_init(rdev->ddev, &fb_helper->client, "radeon-fbdev",
-			      &radeon_fbdev_client_funcs);
-	if (ret) {
-		drm_err(rdev->ddev, "Failed to register client: %d\n", ret);
-		goto err_drm_client_init;
-	}
-
-	drm_client_register(&fb_helper->client);
-
-	return;
-
-err_drm_client_init:
-	drm_fb_helper_unprepare(fb_helper);
-	kfree(fb_helper);
-}
-
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 {
 	if (rdev->ddev->fb_helper)
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index e0a5af180801..8e916729f393 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -38,6 +38,9 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+
 struct edid;
 struct radeon_bo;
 struct radeon_device;
@@ -935,12 +938,15 @@ void dce8_program_fmt(struct drm_encoder *encoder);
 
 /* fbdev layer */
 #if defined(CONFIG_DRM_FBDEV_EMULATION)
-void radeon_fbdev_setup(struct radeon_device *rdev);
+int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				    struct drm_fb_helper_surface_size *sizes);
+#define RADEON_FBDEV_DRIVER_OPS \
+	.fbdev_probe = radeon_fbdev_driver_fbdev_probe
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
 #else
-static inline void radeon_fbdev_setup(struct radeon_device *rdev)
-{ }
+#define RADEON_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 static inline void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 { }
 static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
-- 
2.46.0

