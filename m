Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B36959D82
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E854110E9C1;
	Wed, 21 Aug 2024 13:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BOGGoCZ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RAJqc1jT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BOGGoCZ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RAJqc1jT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9806A10E991;
 Wed, 21 Aug 2024 13:04:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2918F20097;
 Wed, 21 Aug 2024 13:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ulol6lYK3tFQLH3OrBptdWDI1iuE54Zm6yrzlDRxz8c=;
 b=BOGGoCZ18xPZ7WDwgSMtah9yGCAoSlDRKyVZfnzfKzIkJF2CzaPwscQox1XBH2juxLWRDb
 S59rv3lBp9nEq0uqHRmb+heDbkOx+pv2PuNU1eQvUDwIjuaR8yOgqKQeYhNIm7zqtWHWAu
 LEjVwplWzxjC4AW3wlcUBr8ClQIgAO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ulol6lYK3tFQLH3OrBptdWDI1iuE54Zm6yrzlDRxz8c=;
 b=RAJqc1jTNJQsMgmNG5ZeGvi5KXbmDR232nJm/L0KDVplBbUEdf5nh423EDMGLUfK0o9yIn
 yXst53rh3gfd3oBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BOGGoCZ1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RAJqc1jT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ulol6lYK3tFQLH3OrBptdWDI1iuE54Zm6yrzlDRxz8c=;
 b=BOGGoCZ18xPZ7WDwgSMtah9yGCAoSlDRKyVZfnzfKzIkJF2CzaPwscQox1XBH2juxLWRDb
 S59rv3lBp9nEq0uqHRmb+heDbkOx+pv2PuNU1eQvUDwIjuaR8yOgqKQeYhNIm7zqtWHWAu
 LEjVwplWzxjC4AW3wlcUBr8ClQIgAO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ulol6lYK3tFQLH3OrBptdWDI1iuE54Zm6yrzlDRxz8c=;
 b=RAJqc1jTNJQsMgmNG5ZeGvi5KXbmDR232nJm/L0KDVplBbUEdf5nh423EDMGLUfK0o9yIn
 yXst53rh3gfd3oBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBC6D13770;
 Wed, 21 Aug 2024 13:04:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0K1NNMjlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 49/86] drm/fbdev-dma: Remove obsolete setup function
Date: Wed, 21 Aug 2024 14:59:46 +0200
Message-ID: <20240821130348.73038-50-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2918F20097
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCPT_COUNT_SEVEN(0.00)[10];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw),to(RLazpx1r3qpnsfr8nfakn)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The old setup function drm_fbdev_dma_setup() is unused. Remove it and
its internal callbacks. New drivers should call drm_client_setup()
instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_dma.c | 120 +-------------------------------
 include/drm/drm_fbdev_dma.h     |   7 --
 2 files changed, 1 insertion(+), 126 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index aeccf7f7a522..f3611a1f2191 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -2,15 +2,13 @@
 
 #include <linux/fb.h>
 
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 
-#include <drm/drm_fbdev_dma.h>
-
 /*
  * struct fb_ops
  */
@@ -84,12 +82,6 @@ static const struct fb_ops drm_fbdev_dma_fb_ops = {
  * struct drm_fb_helper
  */
 
-static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
-					 struct drm_fb_helper_surface_size *sizes)
-{
-	return drm_fbdev_dma_driver_fbdev_probe(fb_helper, sizes);
-}
-
 static int drm_fbdev_dma_helper_fb_dirty(struct drm_fb_helper *helper,
 					 struct drm_clip_rect *clip)
 {
@@ -110,7 +102,6 @@ static int drm_fbdev_dma_helper_fb_dirty(struct drm_fb_helper *helper,
 }
 
 static const struct drm_fb_helper_funcs drm_fbdev_dma_helper_funcs = {
-	.fb_probe = drm_fbdev_dma_helper_fb_probe,
 	.fb_dirty = drm_fbdev_dma_helper_fb_dirty,
 };
 
@@ -201,112 +192,3 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_dma_driver_fbdev_probe);
-
-/*
- * struct drm_client_funcs
- */
-
-static void drm_fbdev_dma_client_unregister(struct drm_client_dev *client)
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
-static int drm_fbdev_dma_client_restore(struct drm_client_dev *client)
-{
-	drm_fb_helper_lastclose(client->dev);
-
-	return 0;
-}
-
-static int drm_fbdev_dma_client_hotplug(struct drm_client_dev *client)
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
-	drm_err(dev, "fbdev-dma: Failed to setup generic emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static const struct drm_client_funcs drm_fbdev_dma_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= drm_fbdev_dma_client_unregister,
-	.restore	= drm_fbdev_dma_client_restore,
-	.hotplug	= drm_fbdev_dma_client_hotplug,
-};
-
-/**
- * drm_fbdev_dma_setup() - Setup fbdev emulation for GEM DMA helpers
- * @dev: DRM device
- * @preferred_bpp: Preferred bits per pixel for the device.
- *                 32 is used if this is zero.
- *
- * This function sets up fbdev emulation for GEM DMA drivers that support
- * dumb buffers with a virtual address and that can be mmap'ed.
- * drm_fbdev_dma_setup() shall be called after the DRM driver registered
- * the new DRM device with drm_dev_register().
- *
- * Restore, hotplug events and teardown are all taken care of. Drivers that do
- * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
- * Simple drivers might use drm_mode_config_helper_suspend().
- *
- * This function is safe to call even when there are no connectors present.
- * Setup will be retried on the next hotplug event.
- *
- * The fbdev is destroyed by drm_dev_unregister().
- */
-void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
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
-	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
-
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
-	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
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
-EXPORT_SYMBOL(drm_fbdev_dma_setup);
diff --git a/include/drm/drm_fbdev_dma.h b/include/drm/drm_fbdev_dma.h
index 6ae4de46497c..fb3f2a9aa01a 100644
--- a/include/drm/drm_fbdev_dma.h
+++ b/include/drm/drm_fbdev_dma.h
@@ -3,7 +3,6 @@
 #ifndef DRM_FBDEV_DMA_H
 #define DRM_FBDEV_DMA_H
 
-struct drm_device;
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
 
@@ -13,15 +12,9 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 #define DRM_FBDEV_DMA_DRIVER_OPS \
 	.fbdev_probe = drm_fbdev_dma_driver_fbdev_probe
-
-void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp);
 #else
-static inline void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
-{ }
-
 #define DRM_FBDEV_DMA_DRIVER_OPS \
 	.fbdev_probe = NULL
-
 #endif
 
 #endif
-- 
2.46.0

