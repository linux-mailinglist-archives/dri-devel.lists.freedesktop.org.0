Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C84965BC8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96F10E97D;
	Fri, 30 Aug 2024 08:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7D710E947;
 Fri, 30 Aug 2024 08:45:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 499931FD1A;
 Fri, 30 Aug 2024 08:45:25 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB55E13A3D;
 Fri, 30 Aug 2024 08:45:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wJhKNKSG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v3 75/81] drm/exynos-drm: Run DRM default client setup
Date: Fri, 30 Aug 2024 10:40:59 +0200
Message-ID: <20240830084456.77630-76-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 499931FD1A
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

The exynos-drm driver specifies a preferred color mode of 32. As this
is the default if no format has been given, leave it out entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 101 ++--------------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  15 ++--
 3 files changed, 19 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 7c59e1164a48..2a466d8179f4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
@@ -111,6 +112,7 @@ static const struct drm_driver exynos_drm_driver = {
 	.dumb_create		= exynos_drm_gem_dumb_create,
 	.gem_prime_import	= exynos_drm_gem_prime_import,
 	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
+	EXYNOS_DRM_FBDEV_DRIVER_OPS,
 	.ioctls			= exynos_ioctls,
 	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
 	.fops			= &exynos_drm_driver_fops,
@@ -288,7 +290,7 @@ static int exynos_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto err_cleanup_poll;
 
-	exynos_drm_fbdev_setup(drm);
+	drm_client_setup(drm, NULL);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index a379c8ca435a..73fa7b77d8d0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -22,9 +22,6 @@
 #include "exynos_drm_fb.h"
 #include "exynos_drm_fbdev.h"
 
-#define MAX_CONNECTOR		4
-#define PREFERRED_BPP		32
-
 static int exynos_drm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *helper = info->par;
@@ -87,8 +84,11 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 	return 0;
 }
 
-static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
-				    struct drm_fb_helper_surface_size *sizes)
+static const struct drm_fb_helper_funcs exynos_drm_fbdev_helper_funcs = {
+};
+
+int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+					struct drm_fb_helper_surface_size *sizes)
 {
 	struct exynos_drm_gem *exynos_gem;
 	struct drm_device *dev = helper->dev;
@@ -120,6 +120,7 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 		ret = PTR_ERR(helper->fb);
 		goto err_destroy_gem;
 	}
+	helper->funcs = &exynos_drm_fbdev_helper_funcs;
 
 	ret = exynos_drm_fbdev_update(helper, sizes, exynos_gem);
 	if (ret < 0)
@@ -134,93 +135,3 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 	exynos_drm_gem_destroy(exynos_gem);
 	return ret;
 }
-
-static const struct drm_fb_helper_funcs exynos_drm_fb_helper_funcs = {
-	.fb_probe =	exynos_drm_fbdev_create,
-};
-
-/*
- * struct drm_client
- */
-
-static void exynos_drm_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-
-	if (fb_helper->info) {
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_client_release(&fb_helper->client);
-		drm_fb_helper_unprepare(fb_helper);
-		kfree(fb_helper);
-	}
-}
-
-static int exynos_drm_fbdev_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int exynos_drm_fbdev_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
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
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs exynos_drm_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= exynos_drm_fbdev_client_unregister,
-	.restore	= exynos_drm_fbdev_client_restore,
-	.hotplug	= exynos_drm_fbdev_client_hotplug,
-};
-
-void exynos_drm_fbdev_setup(struct drm_device *dev)
-{
-	struct drm_fb_helper *fb_helper;
-	int ret;
-
-	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
-	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
-
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(dev, fb_helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
-
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &exynos_drm_fbdev_client_funcs);
-	if (ret)
-		goto err_drm_client_init;
-
-	drm_client_register(&fb_helper->client);
-
-	return;
-
-err_drm_client_init:
-	drm_fb_helper_unprepare(fb_helper);
-	kfree(fb_helper);
-}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.h b/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
index 1e1dea627cd9..02a9201abea3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
@@ -11,12 +11,17 @@
 #ifndef _EXYNOS_DRM_FBDEV_H_
 #define _EXYNOS_DRM_FBDEV_H_
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-void exynos_drm_fbdev_setup(struct drm_device *dev);
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
+
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
+					struct drm_fb_helper_surface_size *sizes);
+#define EXYNOS_DRM_FBDEV_DRIVER_OPS \
+	.fbdev_probe = exynos_drm_fbdev_driver_fbdev_probe
 #else
-static inline void exynos_drm_fbdev_setup(struct drm_device *dev)
-{
-}
+#define EXYNOS_DRM_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 #endif
 
 #endif
-- 
2.46.0

