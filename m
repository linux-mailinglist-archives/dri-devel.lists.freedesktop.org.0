Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1DA983ED1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2593810E5FB;
	Tue, 24 Sep 2024 07:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1B/K6w9q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZNakMtIp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1B/K6w9q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZNakMtIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCD810E5AF;
 Tue, 24 Sep 2024 07:18:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 201601FCE7;
 Tue, 24 Sep 2024 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5q3UE6sDrhFi0VXBw3ZJIIknW6xSM8UpYLbIJS+DTrU=;
 b=1B/K6w9q0UBW5Klv1v4ndRhdZS7CM+BgSj5o8cIpJ2EwxdnT9jTsprbQ23+S0gFIpkzqNL
 wkBXfx2WUnVVITGxf8/i98CMYAF39LA3VfTsbxy33TWhGlRc1trlOB6VODF6dqm+JEYodo
 4ZSQ9mXISPTW4cCRt4asFp74AgPGX/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5q3UE6sDrhFi0VXBw3ZJIIknW6xSM8UpYLbIJS+DTrU=;
 b=ZNakMtIp8J/pbOohZ5F8wvaEmZSoC8H0iSub82M+KJusQMLVQfsFtclKd04QLDM9V6hnBr
 gCchZRn1CrdXsDCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="1B/K6w9q";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZNakMtIp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5q3UE6sDrhFi0VXBw3ZJIIknW6xSM8UpYLbIJS+DTrU=;
 b=1B/K6w9q0UBW5Klv1v4ndRhdZS7CM+BgSj5o8cIpJ2EwxdnT9jTsprbQ23+S0gFIpkzqNL
 wkBXfx2WUnVVITGxf8/i98CMYAF39LA3VfTsbxy33TWhGlRc1trlOB6VODF6dqm+JEYodo
 4ZSQ9mXISPTW4cCRt4asFp74AgPGX/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5q3UE6sDrhFi0VXBw3ZJIIknW6xSM8UpYLbIJS+DTrU=;
 b=ZNakMtIp8J/pbOohZ5F8wvaEmZSoC8H0iSub82M+KJusQMLVQfsFtclKd04QLDM9V6hnBr
 gCchZRn1CrdXsDCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7DE21386E;
 Tue, 24 Sep 2024 07:18:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4CucL6ln8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:18:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v5 74/80] drm/exynos-drm: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:12 +0200
Message-ID: <20240924071734.98201-75-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 201601FCE7
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_TWELVE(0.00)[12];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

v5:
- select DRM_CLIENT_SELECTION
v4:
- revert an unrelated cleanup (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/exynos/Kconfig            |  1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 99 ++---------------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h | 15 ++--
 4 files changed, 20 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 733b109a5095..0d13828e7d9e 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -4,6 +4,7 @@ config DRM_EXYNOS
 	depends on OF && DRM && COMMON_CLK
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	depends on MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
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
index a379c8ca435a..9526a25e90ac 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -23,7 +23,6 @@
 #include "exynos_drm_fbdev.h"
 
 #define MAX_CONNECTOR		4
-#define PREFERRED_BPP		32
 
 static int exynos_drm_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
@@ -87,8 +86,11 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
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
@@ -120,6 +122,7 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 		ret = PTR_ERR(helper->fb);
 		goto err_destroy_gem;
 	}
+	helper->funcs = &exynos_drm_fbdev_helper_funcs;
 
 	ret = exynos_drm_fbdev_update(helper, sizes, exynos_gem);
 	if (ret < 0)
@@ -134,93 +137,3 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
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

