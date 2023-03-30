Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8BF6CFE79
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E0E10ED41;
	Thu, 30 Mar 2023 08:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989CF10ED39
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:36:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43A4221A98;
 Thu, 30 Mar 2023 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680165370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyAsvLxxSPqqEMN8Gwy8wMJEbceObIlovA8CqeT0y+Q=;
 b=giwPQGS3vm4BpGpDGSflHaF1pqxz7lBuM8F3XcijfWLVEN37pLoiOruz2Qha9t70087EqZ
 1io08d+q8XGaJa1AGXQREV4Tpib6+bVXYkxJZLkygPxHVZgiTwOmdmeQrmIOJy2u/7eyO9
 G029+V7pgGaKN8m/9lW7ILwqB5zqNro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680165370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyAsvLxxSPqqEMN8Gwy8wMJEbceObIlovA8CqeT0y+Q=;
 b=AicTgmMexa0A+z8APTIrq971nngVtsL1cOB4/ncUCTtjAq+hjH3JcNSrYX0eu+xC+44ppT
 6Lx3mqwLhNo7u2Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 182A0138FF;
 Thu, 30 Mar 2023 08:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MC/EBPpJJWQHHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:36:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 7/7] drm/tegra: Implement fbdev emulation as in-kernel client
Date: Thu, 30 Mar 2023 10:36:07 +0200
Message-Id: <20230330083607.12834-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
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
Cc: linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
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
single call to tegra_fbdev_setup() after tegra has registered
its DRM device. As in most drivers, tegra's fbdev emulation now
acts like a regular DRM client.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_dev_unregister() releases the client automatically.
No further action is required within tegra. If the fbdev
framebuffer has been fully set up, struct fb_ops.fb_destroy
implements the release. For partially initialized emulation, the
fbdev client reverts the initial setup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/drm.c   |  23 +----
 drivers/gpu/drm/tegra/drm.h   |  18 +---
 drivers/gpu/drm/tegra/fbdev.c | 177 +++++++++++++++-------------------
 3 files changed, 86 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6ca9f396e55b..85ba96cddd51 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -56,9 +56,6 @@ static int tegra_atomic_check(struct drm_device *drm,
 
 static const struct drm_mode_config_funcs tegra_drm_mode_config_funcs = {
 	.fb_create = tegra_fb_create,
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
-#endif
 	.atomic_check = tegra_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -885,7 +882,6 @@ static const struct drm_driver tegra_drm_driver = {
 			   DRIVER_ATOMIC | DRIVER_RENDER | DRIVER_SYNCOBJ,
 	.open = tegra_drm_open,
 	.postclose = tegra_drm_postclose,
-	.lastclose = drm_fb_helper_lastclose,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = tegra_debugfs_init,
@@ -1185,15 +1181,11 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &tegra_drm_mode_config_helpers;
 
-	err = tegra_drm_fb_prepare(drm);
-	if (err < 0)
-		goto config;
-
 	drm_kms_helper_poll_init(drm);
 
 	err = host1x_device_init(dev);
 	if (err < 0)
-		goto fbdev;
+		goto poll;
 
 	/*
 	 * Now that all display controller have been initialized, the maximum
@@ -1256,18 +1248,14 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	if (err < 0)
 		goto hub;
 
-	err = tegra_drm_fb_init(drm);
+	err = drm_dev_register(drm, 0);
 	if (err < 0)
 		goto hub;
 
-	err = drm_dev_register(drm, 0);
-	if (err < 0)
-		goto fb;
+	tegra_fbdev_setup(drm);
 
 	return 0;
 
-fb:
-	tegra_drm_fb_exit(drm);
 hub:
 	if (tegra->hub)
 		tegra_display_hub_cleanup(tegra->hub);
@@ -1280,10 +1268,8 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	}
 
 	host1x_device_exit(dev);
-fbdev:
+poll:
 	drm_kms_helper_poll_fini(drm);
-	tegra_drm_fb_free(drm);
-config:
 	drm_mode_config_cleanup(drm);
 domain:
 	if (tegra->domain)
@@ -1304,7 +1290,6 @@ static int host1x_drm_remove(struct host1x_device *dev)
 	drm_dev_unregister(drm);
 
 	drm_kms_helper_poll_fini(drm);
-	tegra_drm_fb_exit(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_mode_config_cleanup(drm);
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 576f03b8434e..f9d18e8cf6ab 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -15,7 +15,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_probe_helper.h>
 #include <uapi/drm/tegra_drm.h>
@@ -194,22 +193,9 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 					const struct drm_mode_fb_cmd2 *cmd);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-int tegra_drm_fb_prepare(struct drm_device *drm);
-void tegra_drm_fb_free(struct drm_device *drm);
-int tegra_drm_fb_init(struct drm_device *drm);
-void tegra_drm_fb_exit(struct drm_device *drm);
+void tegra_fbdev_setup(struct drm_device *drm);
 #else
-static inline int tegra_drm_fb_prepare(struct drm_device *drm)
-{
-	return 0;
-}
-static inline void tegra_drm_fb_free(struct drm_device *drm)
-{ }
-static inline int tegra_drm_fb_init(struct drm_device *drm)
-{
-	return 0;
-}
-static inline void tegra_drm_fb_exit(struct drm_device *drm)
+static inline void tegra_fbdev_setup(struct drm_device *drm)
 { }
 #endif
 
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 31a95a955efb..dc6dda641d1c 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -9,6 +9,9 @@
 
 #include <linux/console.h>
 
+#include <drm/drm_drv.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -32,6 +35,26 @@ static int tegra_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return __tegra_gem_mmap(&bo->gem, vma);
 }
 
+static void tegra_fbdev_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *helper = info->par;
+	struct drm_framebuffer *fb = helper->fb;
+	struct tegra_bo *bo = tegra_fb_get_plane(fb, 0);
+
+	drm_fb_helper_fini(helper);
+
+	/* Undo the special mapping we made in fbdev probe. */
+	if (bo->pages) {
+		vunmap(bo->vaddr);
+		bo->vaddr = NULL;
+	}
+	drm_framebuffer_remove(fb);
+
+	drm_client_release(&helper->client);
+	drm_fb_helper_unprepare(helper);
+	kfree(helper);
+}
+
 static const struct fb_ops tegra_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -41,6 +64,7 @@ static const struct fb_ops tegra_fb_ops = {
 	.fb_copyarea = drm_fb_helper_sys_copyarea,
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
 	.fb_mmap = tegra_fb_mmap,
+	.fb_destroy = tegra_fbdev_fb_destroy,
 };
 
 static int tegra_fbdev_probe(struct drm_fb_helper *helper,
@@ -130,16 +154,52 @@ static const struct drm_fb_helper_funcs tegra_fb_helper_funcs = {
  */
 
 static void tegra_fbdev_client_unregister(struct drm_client_dev *client)
-{ }
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (fb_helper->info) {
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
 
-static int tregra_fbdev_client_restore(struct drm_client_dev *client)
+static int tegra_fbdev_client_restore(struct drm_client_dev *client)
 {
+	drm_fb_helper_lastclose(client->dev);
+
 	return 0;
 }
 
 static int tegra_fbdev_client_hotplug(struct drm_client_dev *client)
 {
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
 	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
+	return ret;
 }
 
 static const struct drm_client_funcs tegra_fbdev_client_funcs = {
@@ -149,109 +209,32 @@ static const struct drm_client_funcs tegra_fbdev_client_funcs = {
 	.hotplug	= tegra_fbdev_client_hotplug,
 };
 
-static struct drm_fb_helper *tegra_fbdev_create(struct drm_device *drm)
+void tegra_fbdev_setup(struct drm_device *dev)
 {
 	struct drm_fb_helper *helper;
+	int ret;
+
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
 
 	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
 	if (!helper)
-		return ERR_PTR(-ENOMEM);
-
-	drm_fb_helper_prepare(drm, helper, 32, &tegra_fb_helper_funcs);
-
-	return helper;
-}
-
-static void tegra_fbdev_free(struct drm_fb_helper *helper)
-{
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
-}
-
-static int tegra_fbdev_init(struct drm_fb_helper *helper,
-			    unsigned int num_crtc,
-			    unsigned int max_connectors)
-{
-	struct drm_device *drm = helper->dev;
-	int err;
-
-	err = drm_client_init(dev, &helper->client, "fbdev", &tegra_fbdev_client_funcs);
-	if (err)
-		return err;
-
-	err = drm_fb_helper_init(drm, helper);
-	if (err < 0) {
-		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
-			err);
-		goto err_drm_client_release;
-	}
+		return;
+	drm_fb_helper_prepare(dev, helper, 32, &tegra_fb_helper_funcs);
 
-	err = drm_fb_helper_initial_config(helper);
-	if (err < 0) {
-		dev_err(drm->dev, "failed to set initial configuration: %d\n",
-			err);
-		goto fini;
-	}
+	ret = drm_client_init(dev, &helper->client, "fbdev", &tegra_fbdev_client_funcs);
+	if (ret)
+		goto err_drm_client_init;
 
-	return 0;
+	ret = tegra_fbdev_client_hotplug(&helper->client);
+	if (ret)
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-fini:
-	drm_fb_helper_fini(helper);
-err_drm_client_release:
-	drm_client_release(&helper->client);
-	return err;
-}
+	drm_client_register(&helper->client);
 
-static void tegra_fbdev_exit(struct drm_fb_helper *helper)
-{
-	struct drm_framebuffer *fb = helper->fb;
-
-	drm_fb_helper_unregister_info(helper);
-
-	if (fb) {
-		struct tegra_bo *bo = tegra_fb_get_plane(fb, 0);
-
-		/* Undo the special mapping we made in fbdev probe. */
-		if (bo && bo->pages) {
-			vunmap(bo->vaddr);
-			bo->vaddr = NULL;
-		}
-
-		drm_framebuffer_remove(fb);
-	}
-
-	drm_fb_helper_fini(helper);
-	drm_client_release(&helper->client);
-	tegra_fbdev_free(helper);
-}
+	return;
 
-int tegra_drm_fb_prepare(struct drm_device *drm)
-{
-	drm->fb_helper = tegra_fbdev_create(drm);
-	if (IS_ERR(drm->fb_helper))
-		return PTR_ERR(drm->fb_helper);
-
-	return 0;
-}
-
-void tegra_drm_fb_free(struct drm_device *drm)
-{
-	tegra_fbdev_free(drm->fb_helper);
-}
-
-int tegra_drm_fb_init(struct drm_device *drm)
-{
-	int err;
-
-	err = tegra_fbdev_init(drm->fb_helper, drm->mode_config.num_crtc,
-			       drm->mode_config.num_connector);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
-void tegra_drm_fb_exit(struct drm_device *drm)
-{
-	tegra_fbdev_exit(drm->fb_helper);
+err_drm_client_init:
+	drm_fb_helper_unprepare(helper);
+	kfree(helper);
 }
-- 
2.40.0

