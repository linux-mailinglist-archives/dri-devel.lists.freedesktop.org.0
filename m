Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF26D4257
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 12:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5010E3B7;
	Mon,  3 Apr 2023 10:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B14310E3C7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 10:40:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E6DC1FDE2;
 Mon,  3 Apr 2023 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680518438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nqy1Nbmo6vTa1ea1Ma5wzqrMYmpG7PAfvsUdoceA2D4=;
 b=tRXSxRgyOtm5ZzRpM9g69osZx71DuZFaHqFfEyti1T2i0HwQDiYttyw5LnAPvy6X7SvCl5
 tKeOHuHaTz/+btpFziQY5AEndkCEOjr4F0cVl43UZtJDCXa2oeb95//ws1GNLfiPi8Rp9l
 eblEYjM/O869FaaZsZo7v9Q2V2EYtAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680518438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nqy1Nbmo6vTa1ea1Ma5wzqrMYmpG7PAfvsUdoceA2D4=;
 b=xfIDJqc2OH+kl9ln1BS+X257ZGpHDwR1E88R4EZIU7FNRLzfkLBDg0QtDuUydrf5J2KqP/
 ZGlNJV9eZug4CXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53F3213A0E;
 Mon,  3 Apr 2023 10:40:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wKmlEyatKmQsDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 10:40:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 5/5] drm/omapdrm: Implement fbdev emulation as in-kernel
 client
Date: Mon,  3 Apr 2023 12:40:35 +0200
Message-Id: <20230403104035.15288-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403104035.15288-1-tzimmermann@suse.de>
References: <20230403104035.15288-1-tzimmermann@suse.de>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move code from ad-hoc fbdev callbacks into DRM client functions
and remove the old callbacks. The functions instruct the client
to poll for changed output or restore the display. The DRM core
calls both, the old callbacks and the new client helpers, from
the same places. The new functions perform the same operation as
before, so there's no change in functionality.

Replace all code that initializes or releases fbdev emulation
throughout the driver. Instead initialize the fbdev client by a
single call to omapdrm_fbdev_setup() after omapdrm has registered
its DRM device. As in most drivers, omapdrm's fbdev emulation now
acts like a regular DRM client.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_dev_unregister() releases the client automatically.
No further action is required within omapdrm. If the fbdev
framebuffer has been fully set up, struct fb_ops.fb_destroy
implements the release. For partially initialized emulation, the
fbdev client reverts the initial setup.

v2:
	* init drm_client in this patch (Tomi)
	* don't handle non-atomic modesetting (Tomi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c   |  11 +--
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 132 +++++++++++++++++----------
 drivers/gpu/drm/omapdrm/omap_fbdev.h |   9 +-
 3 files changed, 90 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 6a2f446c960f..5ed549726104 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -15,7 +15,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_panel.h>
@@ -221,7 +220,6 @@ static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs =
 
 static const struct drm_mode_config_funcs omap_mode_config_funcs = {
 	.fb_create = omap_framebuffer_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = omap_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -654,7 +652,6 @@ static const struct drm_driver omap_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM  |
 		DRIVER_ATOMIC | DRIVER_RENDER,
 	.open = dev_open,
-	.lastclose = drm_fb_helper_lastclose,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = omap_debugfs_init,
 #endif
@@ -743,8 +740,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 		goto err_cleanup_modeset;
 	}
 
-	omap_fbdev_init(ddev);
-
 	drm_kms_helper_poll_init(ddev);
 
 	/*
@@ -755,12 +750,12 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	if (ret)
 		goto err_cleanup_helpers;
 
+	omap_fbdev_setup(ddev);
+
 	return 0;
 
 err_cleanup_helpers:
 	drm_kms_helper_poll_fini(ddev);
-
-	omap_fbdev_fini(ddev);
 err_cleanup_modeset:
 	omap_modeset_fini(ddev);
 err_free_overlays:
@@ -786,8 +781,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	drm_kms_helper_poll_fini(ddev);
 
-	omap_fbdev_fini(ddev);
-
 	drm_atomic_helper_shutdown(ddev);
 
 	omap_modeset_fini(ddev);
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 9ea863781ac6..b950e93b3846 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -4,13 +4,14 @@
  * Author: Rob Clark <rob@ti.com>
  */
 
-#include <drm/drm_crtc.h>
-#include <drm/drm_util.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_util.h>
 
 #include "omap_drv.h"
 #include "omap_fbdev.h"
@@ -73,6 +74,25 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return drm_fb_helper_pan_display(var, fbi);
 }
 
+static void omap_fbdev_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *helper = info->par;
+	struct drm_framebuffer *fb = helper->fb;
+	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
+	struct omap_fbdev *fbdev = to_omap_fbdev(helper);
+
+	DBG();
+
+	drm_fb_helper_fini(helper);
+
+	omap_gem_unpin(bo);
+	drm_framebuffer_remove(fb);
+
+	drm_client_release(&helper->client);
+	drm_fb_helper_unprepare(helper);
+	kfree(fbdev);
+}
+
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
 
@@ -88,6 +108,8 @@ static const struct fb_ops omap_fb_ops = {
 	.fb_fillrect = drm_fb_helper_sys_fillrect,
 	.fb_copyarea = drm_fb_helper_sys_copyarea,
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
+
+	.fb_destroy = omap_fbdev_fb_destroy,
 };
 
 static int omap_fbdev_create(struct drm_fb_helper *helper,
@@ -222,76 +244,94 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi)
 	return fbi->par;
 }
 
-/* initialize fbdev helper */
-void omap_fbdev_init(struct drm_device *dev)
+/*
+ * struct drm_client
+ */
+
+static void omap_fbdev_client_unregister(struct drm_client_dev *client)
 {
-	struct omap_drm_private *priv = dev->dev_private;
-	struct omap_fbdev *fbdev = NULL;
-	struct drm_fb_helper *helper;
-	int ret = 0;
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
-	if (!priv->num_pipes)
-		return;
+	if (fb_helper->info) {
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
 
-	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
-	if (!fbdev)
-		return;
+static int omap_fbdev_client_restore(struct drm_client_dev *client)
+{
+	drm_fb_helper_lastclose(client->dev);
 
-	INIT_WORK(&fbdev->work, pan_worker);
+	return 0;
+}
 
-	helper = &fbdev->base;
+static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
 
-	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
-	ret = drm_fb_helper_init(dev, helper);
+	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
-		goto fail;
+		goto err_drm_err;
 
-	ret = drm_fb_helper_initial_config(helper);
+	ret = drm_fb_helper_initial_config(fb_helper);
 	if (ret)
-		goto fini;
-
-	return;
+		goto err_drm_fb_helper_fini;
 
-fini:
-	drm_fb_helper_fini(helper);
-fail:
-	drm_fb_helper_unprepare(helper);
-	kfree(fbdev);
+	return 0;
 
-	dev_warn(dev->dev, "omap_fbdev_init failed\n");
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
+	return ret;
 }
 
-void omap_fbdev_fini(struct drm_device *dev)
+static const struct drm_client_funcs omap_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= omap_fbdev_client_unregister,
+	.restore	= omap_fbdev_client_restore,
+	.hotplug	= omap_fbdev_client_hotplug,
+};
+
+void omap_fbdev_setup(struct drm_device *dev)
 {
-	struct drm_fb_helper *helper = dev->fb_helper;
-	struct drm_framebuffer *fb;
-	struct drm_gem_object *bo;
 	struct omap_fbdev *fbdev;
+	struct drm_fb_helper *helper;
+	int ret;
 
-	DBG();
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
 
-	if (!helper)
+	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
+	if (!fbdev)
 		return;
+	helper = &fbdev->base;
 
-	fb = helper->fb;
-
-	drm_fb_helper_unregister_info(helper);
+	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
 
-	drm_fb_helper_fini(helper);
+	ret = drm_client_init(dev, &helper->client, "fbdev", &omap_fbdev_client_funcs);
+	if (ret)
+		goto err_drm_client_init;
 
-	fbdev = to_omap_fbdev(helper);
+	INIT_WORK(&fbdev->work, pan_worker);
 
-	bo = drm_gem_fb_get_obj(fb, 0);
+	ret = omap_fbdev_client_hotplug(&helper->client);
+	if (ret)
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-	/* unpin the GEM object pinned in omap_fbdev_create() */
-	if (bo)
-		omap_gem_unpin(bo);
+	drm_client_register(&helper->client);
 
-	/* this will free the backing object */
-	if (fb)
-		drm_framebuffer_remove(fb);
+	return;
 
+err_drm_client_init:
 	drm_fb_helper_unprepare(helper);
 	kfree(fbdev);
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.h b/drivers/gpu/drm/omapdrm/omap_fbdev.h
index 74a68a5a6eab..74c691a8d45f 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.h
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.h
@@ -10,16 +10,11 @@
 #define __OMAPDRM_FBDEV_H__
 
 struct drm_device;
-struct drm_fb_helper;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-void omap_fbdev_init(struct drm_device *dev);
-void omap_fbdev_fini(struct drm_device *dev);
+void omap_fbdev_setup(struct drm_device *dev);
 #else
-static inline void omap_fbdev_init(struct drm_device *dev)
-{
-}
-static inline void omap_fbdev_fini(struct drm_device *dev)
+static inline void omap_fbdev_setup(struct drm_device *dev)
 {
 }
 #endif
-- 
2.40.0

