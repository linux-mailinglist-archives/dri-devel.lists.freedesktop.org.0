Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC7965BF9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1873F10EA20;
	Fri, 30 Aug 2024 08:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1AA10E92B;
 Fri, 30 Aug 2024 08:45:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 447B01FD14;
 Fri, 30 Aug 2024 08:45:21 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 006C713A66;
 Fri, 30 Aug 2024 08:45:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6B1qOqCG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 64/81] drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
Date: Fri, 30 Aug 2024 10:40:48 +0200
Message-ID: <20240830084456.77630-65-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 447B01FD14
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
and reimplement the old fb_probe callback on top of it. Provide an
initializer macro for struct drm_driver that sets the callback
according to the kernel configuration.

This change allows the common fbdev client to run on top of TTM-
based DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_ttm.c | 142 +++++++++++++++++---------------
 include/drm/drm_fbdev_ttm.h     |  13 +++
 2 files changed, 90 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index 119ffb28aaf9..d799cbe944cd 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -71,71 +71,7 @@ static const struct fb_ops drm_fbdev_ttm_fb_ops = {
 static int drm_fbdev_ttm_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					     struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_client_dev *client = &fb_helper->client;
-	struct drm_device *dev = fb_helper->dev;
-	struct drm_client_buffer *buffer;
-	struct fb_info *info;
-	size_t screen_size;
-	void *screen_buffer;
-	u32 format;
-	int ret;
-
-	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
-		    sizes->surface_width, sizes->surface_height,
-		    sizes->surface_bpp);
-
-	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
-					     sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
-					       sizes->surface_height, format);
-	if (IS_ERR(buffer))
-		return PTR_ERR(buffer);
-
-	fb_helper->buffer = buffer;
-	fb_helper->fb = buffer->fb;
-
-	screen_size = buffer->gem->size;
-	screen_buffer = vzalloc(screen_size);
-	if (!screen_buffer) {
-		ret = -ENOMEM;
-		goto err_drm_client_framebuffer_delete;
-	}
-
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto err_vfree;
-	}
-
-	drm_fb_helper_fill_info(info, fb_helper, sizes);
-
-	info->fbops = &drm_fbdev_ttm_fb_ops;
-
-	/* screen */
-	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
-	info->screen_buffer = screen_buffer;
-	info->fix.smem_len = screen_size;
-
-	/* deferred I/O */
-	fb_helper->fbdefio.delay = HZ / 20;
-	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
-
-	info->fbdefio = &fb_helper->fbdefio;
-	ret = fb_deferred_io_init(info);
-	if (ret)
-		goto err_drm_fb_helper_release_info;
-
-	return 0;
-
-err_drm_fb_helper_release_info:
-	drm_fb_helper_release_info(fb_helper);
-err_vfree:
-	vfree(screen_buffer);
-err_drm_client_framebuffer_delete:
-	fb_helper->fb = NULL;
-	fb_helper->buffer = NULL;
-	drm_client_framebuffer_delete(buffer);
-	return ret;
+	return drm_fbdev_ttm_driver_fbdev_probe(fb_helper, sizes);
 }
 
 static void drm_fbdev_ttm_damage_blit_real(struct drm_fb_helper *fb_helper,
@@ -240,6 +176,82 @@ static const struct drm_fb_helper_funcs drm_fbdev_ttm_helper_funcs = {
 	.fb_dirty = drm_fbdev_ttm_helper_fb_dirty,
 };
 
+/*
+ * struct drm_driver
+ */
+
+int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				     struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_client_buffer *buffer;
+	struct fb_info *info;
+	size_t screen_size;
+	void *screen_buffer;
+	u32 format;
+	int ret;
+
+	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
+		    sizes->surface_width, sizes->surface_height,
+		    sizes->surface_bpp);
+
+	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
+					     sizes->surface_depth);
+	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+					       sizes->surface_height, format);
+	if (IS_ERR(buffer))
+		return PTR_ERR(buffer);
+
+	fb_helper->funcs = &drm_fbdev_ttm_helper_funcs;
+	fb_helper->buffer = buffer;
+	fb_helper->fb = buffer->fb;
+
+	screen_size = buffer->gem->size;
+	screen_buffer = vzalloc(screen_size);
+	if (!screen_buffer) {
+		ret = -ENOMEM;
+		goto err_drm_client_framebuffer_delete;
+	}
+
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info)) {
+		ret = PTR_ERR(info);
+		goto err_vfree;
+	}
+
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
+
+	info->fbops = &drm_fbdev_ttm_fb_ops;
+
+	/* screen */
+	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
+	info->screen_buffer = screen_buffer;
+	info->fix.smem_len = screen_size;
+
+	/* deferred I/O */
+	fb_helper->fbdefio.delay = HZ / 20;
+	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+	info->fbdefio = &fb_helper->fbdefio;
+	ret = fb_deferred_io_init(info);
+	if (ret)
+		goto err_drm_fb_helper_release_info;
+
+	return 0;
+
+err_drm_fb_helper_release_info:
+	drm_fb_helper_release_info(fb_helper);
+err_vfree:
+	vfree(screen_buffer);
+err_drm_client_framebuffer_delete:
+	fb_helper->fb = NULL;
+	fb_helper->buffer = NULL;
+	drm_client_framebuffer_delete(buffer);
+	return ret;
+}
+EXPORT_SYMBOL(drm_fbdev_ttm_driver_fbdev_probe);
+
 static void drm_fbdev_ttm_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
index 9e6c3bdf3537..243685d02eb1 100644
--- a/include/drm/drm_fbdev_ttm.h
+++ b/include/drm/drm_fbdev_ttm.h
@@ -3,11 +3,24 @@
 #ifndef DRM_FBDEV_TTM_H
 #define DRM_FBDEV_TTM_H
 
+#include <linux/stddef.h>
+
 struct drm_device;
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
+int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				     struct drm_fb_helper_surface_size *sizes);
+
+#define DRM_FBDEV_TTM_DRIVER_OPS \
+	.fbdev_probe = drm_fbdev_ttm_driver_fbdev_probe
+
 void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp);
 #else
+#define DRM_FBDEV_TTM_DRIVER_OPS \
+	.fbdev_probe = NULL
+
 static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
 { }
 #endif
-- 
2.46.0

