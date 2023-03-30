Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3606CFCF3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEDD10ED11;
	Thu, 30 Mar 2023 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212310ED0E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:36:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B7981FE94;
 Thu, 30 Mar 2023 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lytV5vCAPfPBoRHtGA4AV6p/TyLXKz5QPYdyjb2wLYw=;
 b=PpFobUuk5UHLHRouoH9N8eXt+2K2WCFb+S4Oc0OInbp/wS3etiQ2OWM7aLQOe/uC8St9Ch
 bmSpVIHT6o8Eff9733F9WP07Ff5IOJYg4TFRNl6abwRuO4MXJWsL/FzJHtHUji9Zytwh2P
 6Mys+UPIAv64CKcA3razaLPPL1byY28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lytV5vCAPfPBoRHtGA4AV6p/TyLXKz5QPYdyjb2wLYw=;
 b=kKR7F8lG8poe9E58S9sNmKU21Ty+mjiz1SQf+VIGRSyefdOBCVikOrE2CMXLO2wAfX4KuX
 DRZubB2/1C3RreBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A6C81390D;
 Thu, 30 Mar 2023 07:36:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6AFxCQg8JWQJewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: [PATCH 5/5] drm/exynos: Implement fbdev emulation as in-kernel client
Date: Thu, 30 Mar 2023 09:36:35 +0200
Message-Id: <20230330073635.7409-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073635.7409-1-tzimmermann@suse.de>
References: <20230330073635.7409-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
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
single call to exynos_fbdev_setup() after exynos has registered its
DRM device. As in most drivers, exynos' fbdev emulation now acts
like a regular DRM client.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_dev_unregister() releases the client automatically.
No further action is required within exynos. If the fbdev framebuffer
has been fully set up, struct fb_ops.fb_destroy implements the
release. For partially initialized emulation, the fbdev client
reverts the initial setup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  13 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 150 +++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  20 +--
 4 files changed, 77 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 16c539657f73..6b73fb7a83c3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -16,7 +16,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_ioctl.h>
@@ -108,7 +107,6 @@ static const struct drm_driver exynos_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM
 				  | DRIVER_ATOMIC | DRIVER_RENDER,
 	.open			= exynos_drm_open,
-	.lastclose		= drm_fb_helper_lastclose,
 	.postclose		= exynos_drm_postclose,
 	.dumb_create		= exynos_drm_gem_dumb_create,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
@@ -288,19 +286,15 @@ static int exynos_drm_bind(struct device *dev)
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(drm);
 
-	ret = exynos_drm_fbdev_init(drm);
-	if (ret)
-		goto err_cleanup_poll;
-
 	/* register the DRM device */
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
-		goto err_cleanup_fbdev;
+		goto err_cleanup_poll;
+
+	exynos_drm_fbdev_setup(drm);
 
 	return 0;
 
-err_cleanup_fbdev:
-	exynos_drm_fbdev_fini(drm);
 err_cleanup_poll:
 	drm_kms_helper_poll_fini(drm);
 err_unbind_all:
@@ -321,7 +315,6 @@ static void exynos_drm_unbind(struct device *dev)
 
 	drm_dev_unregister(drm);
 
-	exynos_drm_fbdev_fini(drm);
 	drm_kms_helper_poll_fini(drm);
 
 	component_unbind_all(drm->dev, drm);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 97f2dee2db29..fc1c5608db96 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -11,7 +11,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -157,7 +156,6 @@ static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helpers = {
 
 static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
 	.fb_create = exynos_user_fb_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index d1de49530c48..ea4b3d248aac 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -8,17 +8,12 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
-#include <linux/console.h>
-#include <linux/dma-mapping.h>
-#include <linux/vmalloc.h>
-
-#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_prime.h>
-#include <drm/drm_probe_helper.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
@@ -36,6 +31,20 @@ static int exynos_drm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return drm_gem_prime_mmap(obj, vma);
 }
 
+static void exynos_drm_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_framebuffer *fb = fb_helper->fb;
+
+	drm_fb_helper_fini(fb_helper);
+
+	drm_framebuffer_remove(fb);
+
+	drm_client_release(&fb_helper->client);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
+}
+
 static const struct fb_ops exynos_drm_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -45,6 +54,7 @@ static const struct fb_ops exynos_drm_fb_ops = {
 	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
 	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
 	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
+	.fb_destroy	= exynos_drm_fb_destroy,
 };
 
 static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
@@ -115,19 +125,13 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 	if (ret < 0)
 		goto err_destroy_framebuffer;
 
-	return ret;
+	return 0;
 
 err_destroy_framebuffer:
 	drm_framebuffer_cleanup(helper->fb);
+	helper->fb = NULL;
 err_destroy_gem:
 	exynos_drm_gem_destroy(exynos_gem);
-
-	/*
-	 * if failed, all resources allocated above would be released by
-	 * drm_mode_config_cleanup() when drm_load() had been called prior
-	 * to any specific driver such as fimd or hdmi driver.
-	 */
-
 	return ret;
 }
 
@@ -140,16 +144,52 @@ static const struct drm_fb_helper_funcs exynos_drm_fb_helper_funcs = {
  */
 
 static void exynos_drm_fbdev_client_unregister(struct drm_client_dev *client)
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
 
 static int exynos_drm_fbdev_client_restore(struct drm_client_dev *client)
 {
+	drm_fb_helper_lastclose(client->dev);
+
 	return 0;
 }
 
 static int exynos_drm_fbdev_client_hotplug(struct drm_client_dev *client)
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
 
 static const struct drm_client_funcs exynos_drm_fbdev_client_funcs = {
@@ -159,78 +199,32 @@ static const struct drm_client_funcs exynos_drm_fbdev_client_funcs = {
 	.hotplug	= exynos_drm_fbdev_client_hotplug,
 };
 
-int exynos_drm_fbdev_init(struct drm_device *dev)
+void exynos_drm_fbdev_setup(struct drm_device *dev)
 {
-	struct drm_fb_helper *helper;
+	struct drm_fb_helper *fb_helper;
 	int ret;
 
-	if (!dev->mode_config.num_crtc)
-		return 0;
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
 
-	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
-	if (!helper)
-		return -ENOMEM;
-
-	drm_fb_helper_prepare(dev, helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
+		return;
+	drm_fb_helper_prepare(dev, fb_helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
 
-	ret = drm_client_init(dev, &helper->client, "exynos-fbdev", &exynos_drm_fbdev_client_funcs);
+	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &exynos_drm_fbdev_client_funcs);
 	if (ret)
-		goto err_drm_fb_helper_unprepare;
-
-	ret = drm_fb_helper_init(dev, helper);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev->dev,
-			      "failed to initialize drm fb helper.\n");
-		goto err_drm_client_release;
-	}
-
-	ret = drm_fb_helper_initial_config(helper);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev->dev,
-			      "failed to set up hw configuration.\n");
-		goto err_setup;
-	}
-
-	return 0;
-
-err_setup:
-	drm_fb_helper_fini(helper);
-err_drm_client_release:
-	drm_client_release(&helper->client);
-err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
-
-	return ret;
-}
-
-static void exynos_drm_fbdev_destroy(struct drm_device *dev,
-				      struct drm_fb_helper *fb_helper)
-{
-	struct drm_framebuffer *fb;
+		goto err_drm_client_init;
 
-	/* release drm framebuffer and real buffer */
-	if (fb_helper->fb && fb_helper->fb->funcs) {
-		fb = fb_helper->fb;
-		if (fb)
-			drm_framebuffer_remove(fb);
-	}
-
-	drm_fb_helper_unregister_info(fb_helper);
-
-	drm_fb_helper_fini(fb_helper);
-}
+	ret = exynos_drm_fbdev_client_hotplug(&fb_helper->client);
+	if (ret)
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-void exynos_drm_fbdev_fini(struct drm_device *dev)
-{
-	struct drm_fb_helper *fb_helper = dev->fb_helper;
+	drm_client_register(&fb_helper->client);
 
-	if (!fb_helper)
-		return;
+	return;
 
-	exynos_drm_fbdev_destroy(dev, fb_helper);
-	drm_client_release(&fb_helper->client);
+err_drm_client_init:
 	drm_fb_helper_unprepare(fb_helper);
 	kfree(fb_helper);
 }
-
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.h b/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
index 3b1e98e84580..1e1dea627cd9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
@@ -12,27 +12,11 @@
 #define _EXYNOS_DRM_FBDEV_H_
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-
-int exynos_drm_fbdev_init(struct drm_device *dev);
-void exynos_drm_fbdev_fini(struct drm_device *dev);
-
+void exynos_drm_fbdev_setup(struct drm_device *dev);
 #else
-
-static inline int exynos_drm_fbdev_init(struct drm_device *dev)
-{
-	return 0;
-}
-
-static inline void exynos_drm_fbdev_fini(struct drm_device *dev)
+static inline void exynos_drm_fbdev_setup(struct drm_device *dev)
 {
 }
-
-static inline void exynos_drm_fbdev_restore_mode(struct drm_device *dev)
-{
-}
-
-#define exynos_drm_output_poll_changed (NULL)
-
 #endif
 
 #endif
-- 
2.40.0

