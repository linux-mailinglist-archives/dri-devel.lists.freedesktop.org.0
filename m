Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DB66CFD1F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F062B10ED26;
	Thu, 30 Mar 2023 07:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC6710ED15;
 Thu, 30 Mar 2023 07:41:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA6D31FE95;
 Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680162113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjCvHpF+Kph2AgTs69/ppHdfUEOcbkMXSLFRHnMYSQ0=;
 b=NSuN7zqRmkNGSKELGbYljGLhQeLePBiI60aUyywMJZhh/VT3ILUPPqX7+zLQF50L0RY6Wr
 ri5mogFsBm4SXW5a2RMht6raSxPtPk86RFC5Hzl/7rtjfqEJmIahKLF460JpibPP8n5cSR
 OX9/hTRmzDf24VrGg9r7GsU5yuNaKTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680162113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjCvHpF+Kph2AgTs69/ppHdfUEOcbkMXSLFRHnMYSQ0=;
 b=AotYkq8iJJuSFjYyBAj/6yLkccy+cFE9bat9DwLjvUDbNVUHQ7tKi4toXs7Sxo8Pcw0Tzr
 5jYp3ErR/OoozkBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAEF51348E;
 Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oE5bOEA9JWSZfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 6/6] drm/msm: Implement fbdev emulation as in-kernel client
Date: Thu, 30 Mar 2023 09:41:49 +0200
Message-Id: <20230330074150.7637-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330074150.7637-1-tzimmermann@suse.de>
References: <20230330074150.7637-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
single call to msm_fbdev_setup() after msm has registered its
DRM device. As in most drivers, msm's fbdev emulation now acts
like a regular DRM client.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_dev_unregister() releases the client automatically.
No further action is required within msm. If the fbdev framebuffer
has been fully set up, struct fb_ops.fb_destroy implements the
release. For partially initialized emulation, the fbdev client
reverts the initial setup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_debugfs.c |   1 +
 drivers/gpu/drm/msm/msm_drv.c     |  15 +---
 drivers/gpu/drm/msm/msm_drv.h     |  10 ++-
 drivers/gpu/drm/msm/msm_fbdev.c   | 113 ++++++++++++++++++------------
 4 files changed, 80 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d4b31165708f..54f5c91a3e19 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/fault-inject.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9f076b9ab19b..339e3523ccb7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,7 +54,6 @@
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = msm_framebuffer_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -241,11 +240,6 @@ static int msm_drm_uninit(struct device *dev)
 	msm_perf_debugfs_cleanup(priv);
 	msm_rd_debugfs_cleanup(priv);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (ddev->fb_helper)
-		msm_fbdev_free(ddev);
-#endif
-
 	msm_disp_snapshot_destroy(ddev);
 
 	drm_mode_config_cleanup(ddev);
@@ -535,17 +529,15 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	}
 	drm_mode_config_reset(ddev);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (kms && fbdev)
-		msm_fbdev_init(ddev);
-#endif
-
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
 		goto err_msm_uninit;
 
 	drm_kms_helper_poll_init(ddev);
 
+	if (kms && fbdev)
+		msm_fbdev_setup(ddev);
+
 	return 0;
 
 err_msm_uninit:
@@ -1074,7 +1066,6 @@ static const struct drm_driver msm_driver = {
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose           = msm_postclose,
-	.lastclose          = drm_fb_helper_lastclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 852f88c36621..11a9d2ce07a1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/display/drm_dsc.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
@@ -304,8 +303,13 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
-struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev);
-void msm_fbdev_free(struct drm_device *dev);
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+void msm_fbdev_setup(struct drm_device *dev);
+#else
+static inline void msm_fbdev_setup(struct drm_device *dev)
+{
+}
+#endif
 
 struct hdmi;
 #ifdef CONFIG_DRM_MSM_HDMI
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 6c3665c5f4f6..33570ef504bf 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -4,7 +4,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
-#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -26,6 +27,25 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return drm_gem_prime_mmap(bo, vma);
 }
 
+static void msm_fbdev_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
+	struct drm_framebuffer *fb = helper->fb;
+	struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
+
+	DBG();
+
+	drm_fb_helper_fini(helper);
+
+	/* this will free the backing object */
+	msm_gem_put_vaddr(bo);
+	drm_framebuffer_remove(fb);
+
+	drm_client_release(&helper->client);
+	drm_fb_helper_unprepare(helper);
+	kfree(helper);
+}
+
 static const struct fb_ops msm_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -39,6 +59,7 @@ static const struct fb_ops msm_fb_ops = {
 	.fb_copyarea = drm_fb_helper_sys_copyarea,
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
 	.fb_mmap = msm_fbdev_mmap,
+	.fb_destroy = msm_fbdev_fb_destroy,
 };
 
 static int msm_fbdev_create(struct drm_fb_helper *helper,
@@ -124,16 +145,52 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
  */
 
 static void msm_fbdev_client_unregister(struct drm_client_dev *client)
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
 
 static int msm_fbdev_client_restore(struct drm_client_dev *client)
 {
+	drm_fb_helper_lastclose(client->dev);
+
 	return 0;
 }
 
 static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
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
 
 static const struct drm_client_funcs msm_fbdev_client_funcs = {
@@ -144,15 +201,17 @@ static const struct drm_client_funcs msm_fbdev_client_funcs = {
 };
 
 /* initialize fbdev helper */
-struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
+void msm_fbdev_setup(struct drm_device *dev)
 {
 	struct drm_fb_helper *helper;
 	int ret;
 
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
+
 	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
 	if (!helper)
-		return NULL;
-
+		return;
 	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
 
 	ret = drm_client_init(dev, &helper->client, "fbdev", &msm_fbdev_client_funcs);
@@ -161,49 +220,15 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 		goto err_drm_fb_helper_unprepare;
 	}
 
-	ret = drm_fb_helper_init(dev, helper);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=%d\n", ret);
-		goto err_drm_client_release;
-	}
-
-	ret = drm_fb_helper_initial_config(helper);
+	ret = msm_fbdev_client_hotplug(&helper->client);
 	if (ret)
-		goto fini;
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-	return helper;
+	drm_client_register(&helper->client);
 
-fini:
-	drm_fb_helper_fini(helper);
-err_drm_client_release:
-	drm_client_release(&helper->client);
-err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
-	return NULL;
-}
+	return;
 
-void msm_fbdev_free(struct drm_device *dev)
-{
-	struct drm_fb_helper *helper = dev->fb_helper;
-	struct drm_framebuffer *fb = helper->fb;
-
-	DBG();
-
-	drm_fb_helper_unregister_info(helper);
-
-	drm_fb_helper_fini(helper);
-
-	/* this will free the backing object */
-	if (fb) {
-		struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
-		msm_gem_put_vaddr(bo);
-		drm_framebuffer_remove(fb);
-	}
-
-	drm_client_release(&helper->client);
+err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
-
-	dev->fb_helper = NULL;
 }
-- 
2.40.0

