Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4C6BCB15
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0534F10EA5A;
	Thu, 16 Mar 2023 09:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1E710E085;
 Thu, 16 Mar 2023 09:37:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C08DF21A35;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9QarJSO8yuVDGvCVwAy/FoigH3LkBCix6D3ROCjwk8=;
 b=vuULXdB6LA9mC9ggx5r4X0FtY8ubKW66j79lq39y2QmO7EKt/UI+vCEb6Wq+RqWisr53St
 V7LbpbdZN6dtyEYWEXfGG6DwxB1/9Tu3G1ETGkUaKBfG2oKPAsJehitQfgYw7j9CKncyck
 kNbL8Mnc797o74J9Xtiu7/nHCDyA8cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9QarJSO8yuVDGvCVwAy/FoigH3LkBCix6D3ROCjwk8=;
 b=pN987ktCJYr2fHFql7Ybc+mzHBqS8TaFq8U0q8WdREZ4W5P60ZyZuVJX7jVl/hU2/5WFM8
 S1qEVOsSRwggrhCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FA24133E0;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJhKImXjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 09/10] drm/radeon: Implement client-based fbdev emulation
Date: Thu, 16 Mar 2023 10:37:37 +0100
Message-Id: <20230316093738.28866-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement fbdev emulation on top of struct drm_client and its helpers.
Replaces ad-hoc interfaces for restoring and closing fbdev emulation with
per-client callbacks for hotplugging, restoring and unregistering.

A single function, radeon_fbdev_setup(), starts fbdev emulation after
the DRM device has been registered. Hence, fbdev acts like a regular
DRM client.

The setup call prepares the fbdev emulation and invokes connector
hotplugging. The first successful hotplug event initializes fbdev
emulation with a framebuffer, device file, etc.

Unregistering depends on the hotplug status. Fully initialized emulation
is cleaned up through drm_fb_helper_unregister_info() and fb_destroy.
For prepared-only setups, unregistering unprepares the emulation and
releases all resources. In both cases, fbdev emulation will be cleaned
up.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_display.c |   4 -
 drivers/gpu/drm/radeon/radeon_drv.c     |   3 +-
 drivers/gpu/drm/radeon/radeon_drv.h     |   1 -
 drivers/gpu/drm/radeon/radeon_fb.c      | 126 ++++++++++++++++--------
 drivers/gpu/drm/radeon/radeon_kms.c     |  18 ----
 drivers/gpu/drm/radeon/radeon_mode.h    |   3 +-
 6 files changed, 89 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index f34a7f63261d..901e75ec70ff 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -34,7 +34,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -1354,7 +1353,6 @@ radeon_user_framebuffer_create(struct drm_device *dev,
 
 static const struct drm_mode_config_funcs radeon_mode_funcs = {
 	.fb_create = radeon_user_framebuffer_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 };
 
 static const struct drm_prop_enum_list radeon_tmds_pll_enum_list[] =
@@ -1642,7 +1640,6 @@ int radeon_modeset_init(struct radeon_device *rdev)
 	/* setup afmt */
 	radeon_afmt_init(rdev);
 
-	radeon_fbdev_init(rdev);
 	drm_kms_helper_poll_init(rdev->ddev);
 
 	/* do pm late init */
@@ -1657,7 +1654,6 @@ void radeon_modeset_fini(struct radeon_device *rdev)
 		drm_kms_helper_poll_fini(rdev->ddev);
 		radeon_hpd_fini(rdev);
 		drm_helper_force_disable_all(rdev->ddev);
-		radeon_fbdev_fini(rdev);
 		radeon_afmt_fini(rdev);
 		drm_mode_config_cleanup(rdev->ddev);
 		rdev->mode_info.mode_config_initialized = false;
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 716ab85a376b..e4374814f0ef 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -341,6 +341,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_agp;
 
+	radeon_fbdev_setup(dev->dev_private);
+
 	return 0;
 
 err_agp:
@@ -595,7 +597,6 @@ static const struct drm_driver kms_driver = {
 	.load = radeon_driver_load_kms,
 	.open = radeon_driver_open_kms,
 	.postclose = radeon_driver_postclose_kms,
-	.lastclose = radeon_driver_lastclose_kms,
 	.unload = radeon_driver_unload_kms,
 	.ioctls = radeon_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(radeon_ioctls_kms),
diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
index ac7970919c4d..2ffe0975ee54 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.h
+++ b/drivers/gpu/drm/radeon/radeon_drv.h
@@ -120,7 +120,6 @@ long radeon_drm_ioctl(struct file *filp,
 
 int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
 void radeon_driver_unload_kms(struct drm_device *dev);
-void radeon_driver_lastclose_kms(struct drm_device *dev);
 int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void radeon_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index 2b629bb23be8..fe76e29910ef 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -24,19 +24,16 @@
  *     David Airlie
  */
 
-#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
-#include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/radeon_drm.h>
 
 #include "radeon.h"
 
@@ -179,14 +176,16 @@ static void radeon_fbdev_fb_destroy(struct fb_info *info)
 	struct drm_framebuffer *fb = fb_helper->fb;
 	struct drm_gem_object *gobj = drm_gem_fb_get_obj(fb, 0);
 
+	drm_fb_helper_fini(fb_helper);
+
 	drm_framebuffer_unregister_private(fb);
 	drm_framebuffer_cleanup(fb);
 	kfree(fb);
-	fb_helper->fb = NULL;
-
 	radeon_fbdev_destroy_pinned_object(gobj);
 
-	drm_fb_helper_fini(fb_helper);
+	drm_client_release(&fb_helper->client);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
 }
 
 static const struct fb_ops radeon_fbdev_fb_ops = {
@@ -279,7 +278,6 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	DRM_INFO("fb depth is %d\n", fb->format->depth);
 	DRM_INFO("   pitch is %d\n", fb->pitches[0]);
 
-	vga_switcheroo_client_fb_set(rdev->pdev, info);
 	return 0;
 
 err_drm_framebuffer_unregister_private:
@@ -297,59 +295,107 @@ static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs = {
 	.fb_probe = radeon_fbdev_fb_helper_fb_probe,
 };
 
-int radeon_fbdev_init(struct radeon_device *rdev)
+/*
+ * Fbdev client and struct drm_client_funcs
+ */
+
+static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
 {
-	struct drm_fb_helper *fb_helper;
-	int bpp_sel = 32;
-	int ret;
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = fb_helper->dev;
+	struct radeon_device *rdev = dev->dev_private;
+
+	if (fb_helper->info) {
+		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
 
-	/* don't enable fbdev if no connectors */
-	if (list_empty(&rdev->ddev->mode_config.connector_list))
-		return 0;
+static int radeon_fbdev_client_restore(struct drm_client_dev *client)
+{
+	drm_fb_helper_lastclose(client->dev);
+	vga_switcheroo_process_delayed_switch();
 
-	/* select 8 bpp console on 8MB cards, or 16 bpp on RN50 or 32MB */
-	if (rdev->mc.real_vram_size <= (8*1024*1024))
-		bpp_sel = 8;
-	else if (ASIC_IS_RN50(rdev) ||
-		 rdev->mc.real_vram_size <= (32*1024*1024))
-		bpp_sel = 16;
+	return 0;
+}
 
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return -ENOMEM;
+static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	struct radeon_device *rdev = dev->dev_private;
+	int ret;
 
-	drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
-	ret = drm_fb_helper_init(rdev->ddev, fb_helper);
+	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
-		goto free;
+		goto err_drm_err;
 
-	/* disable all the possible outputs/crtcs before entering KMS mode */
-	drm_helper_disable_unused_functions(rdev->ddev);
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
 
 	ret = drm_fb_helper_initial_config(fb_helper);
 	if (ret)
-		goto fini;
+		goto err_drm_fb_helper_fini;
+
+	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
 
 	return 0;
 
-fini:
+err_drm_fb_helper_fini:
 	drm_fb_helper_fini(fb_helper);
-free:
-	drm_fb_helper_unprepare(fb_helper);
-	kfree(fb_helper);
+err_drm_err:
+	drm_err(dev, "Failed to setup radeon fbdev emulation (ret=%d)\n", ret);
 	return ret;
 }
 
-void radeon_fbdev_fini(struct radeon_device *rdev)
+static const struct drm_client_funcs radeon_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= radeon_fbdev_client_unregister,
+	.restore	= radeon_fbdev_client_restore,
+	.hotplug	= radeon_fbdev_client_hotplug,
+};
+
+void radeon_fbdev_setup(struct radeon_device *rdev)
 {
-	if (!rdev->ddev->fb_helper)
+	struct drm_fb_helper *fb_helper;
+	int bpp_sel = 32;
+	int ret;
+
+	if (rdev->mc.real_vram_size <= (8 * 1024 * 1024))
+		bpp_sel = 8;
+	else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <= (32 * 1024 * 1024))
+		bpp_sel = 16;
+
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
 		return;
+	drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
+
+	ret = drm_client_init(rdev->ddev, &fb_helper->client, "radeon-fbdev",
+			      &radeon_fbdev_client_funcs);
+	if (ret) {
+		drm_err(rdev->ddev, "Failed to register client: %d\n", ret);
+		goto err_drm_client_init;
+	}
 
-	drm_fb_helper_unregister_info(rdev->ddev->fb_helper);
-	drm_fb_helper_unprepare(rdev->ddev->fb_helper);
-	kfree(rdev->ddev->fb_helper);
-	rdev->ddev->fb_helper = NULL;
+	ret = radeon_fbdev_client_hotplug(&fb_helper->client);
+	if (ret)
+		drm_dbg_kms(rdev->ddev, "client hotplug ret=%d\n", ret);
+
+	drm_client_register(&fb_helper->client);
+
+	return;
+
+err_drm_client_init:
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
 }
 
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 965161b8565b..e0214cf1b43b 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -32,7 +32,6 @@
 #include <linux/uaccess.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/radeon_drm.h>
@@ -622,23 +621,6 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	return 0;
 }
 
-
-/*
- * Outdated mess for old drm with Xorg being in charge (void function now).
- */
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
-
 /**
  * radeon_driver_open_kms - drm callback for open
  *
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 64cf263ae646..d81f61e5a95c 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -939,8 +939,7 @@ void dce4_program_fmt(struct drm_encoder *encoder);
 void dce8_program_fmt(struct drm_encoder *encoder);
 
 /* fbdev layer */
-int radeon_fbdev_init(struct radeon_device *rdev);
-void radeon_fbdev_fini(struct radeon_device *rdev);
+void radeon_fbdev_setup(struct radeon_device *rdev);
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
 
-- 
2.39.2

