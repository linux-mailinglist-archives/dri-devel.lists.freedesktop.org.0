Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E2959E1E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DB110EAC6;
	Wed, 21 Aug 2024 13:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XtJaVnLU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BKNsqBIc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XtJaVnLU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BKNsqBIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00B610EA00;
 Wed, 21 Aug 2024 13:04:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 280A3200A6;
 Wed, 21 Aug 2024 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmR7tei5hO7EPh+HGHUGUGUIAY7diNXlm9MUgzNTfkE=;
 b=XtJaVnLU9Jl3NDbEtPg7j/l/2/RQlMz5yiWaV/FbjPUkkoUapsSK2simadm7MdnsVUBc5k
 0tv/9kyU+hUezqeo1/sTzLZXdDadi/f9yNV3E2Dw18OU9jTbmippJBPKkYdYSbb2cprX+8
 jq7QlhQIeCxgOMaDl8lbSZ33QAjapy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmR7tei5hO7EPh+HGHUGUGUIAY7diNXlm9MUgzNTfkE=;
 b=BKNsqBIcSgdRSyPt/yUq1h/+/WlUXRWRIPvp7XCrOvvWgEVLeqKb11uDXhNqEvcleqSjgo
 R56z1a4+8xj03wAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XtJaVnLU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BKNsqBIc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmR7tei5hO7EPh+HGHUGUGUIAY7diNXlm9MUgzNTfkE=;
 b=XtJaVnLU9Jl3NDbEtPg7j/l/2/RQlMz5yiWaV/FbjPUkkoUapsSK2simadm7MdnsVUBc5k
 0tv/9kyU+hUezqeo1/sTzLZXdDadi/f9yNV3E2Dw18OU9jTbmippJBPKkYdYSbb2cprX+8
 jq7QlhQIeCxgOMaDl8lbSZ33QAjapy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmR7tei5hO7EPh+HGHUGUGUIAY7diNXlm9MUgzNTfkE=;
 b=BKNsqBIcSgdRSyPt/yUq1h/+/WlUXRWRIPvp7XCrOvvWgEVLeqKb11uDXhNqEvcleqSjgo
 R56z1a4+8xj03wAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB3D413770;
 Wed, 21 Aug 2024 13:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IDBcMNTlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH v2 75/86] drm/exynos-drm: Run DRM default client setup
Date: Wed, 21 Aug 2024 15:00:12 +0200
Message-ID: <20240821130348.73038-76-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 280A3200A6
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[13];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw),to(RLazpx1r3qpnsfr8nfakn)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

