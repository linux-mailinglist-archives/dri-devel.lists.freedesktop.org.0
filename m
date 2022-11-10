Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC26243B2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E4E10E7CB;
	Thu, 10 Nov 2022 13:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D924A10E7CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:55:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E5621FCD6;
 Thu, 10 Nov 2022 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668088522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WHnyWTBEvWeDqGjzK5N/5CNzzjTdf5KrYFwZJbjJp4=;
 b=NHv2KU4B2ddu4sXgcb5xs9Hi2IfY0vE3eVKu94KmkjSrSg2DLXy0JsKJSUosGQFiY5tJGZ
 72SS5ZnWs/NPzM+ZMJYFVKu6wLGnVlWmaHB1UC1Kp0A5cKjhlbHPo0CToIpPiuUlcGVDIt
 SV7nbgxnxGISB7zISA1GMi7XKQjIUgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668088522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WHnyWTBEvWeDqGjzK5N/5CNzzjTdf5KrYFwZJbjJp4=;
 b=mHdSnf+o7C9+djHi9xRTWWTctGo5lzOxJAMpUxtXMLpbb5KuKXo6OvhhJlUd0bfmKU7hm1
 InZLeVXriS7hFjDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE11313B60;
 Thu, 10 Nov 2022 13:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OKZlOckCbWP/DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Nov 2022 13:55:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 4/5] drm/fb-helper: Schedule deferred-I/O worker after writing
 to framebuffer
Date: Thu, 10 Nov 2022 14:55:18 +0100
Message-Id: <20221110135519.30029-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221110135519.30029-1-tzimmermann@suse.de>
References: <20221110135519.30029-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Schedule the deferred-I/O worker instead of the damage worker after
writing to the fbdev framebuffer. The deferred-I/O worker then performs
the dirty-fb update. The fbdev emulation will initialize deferred I/O
for all drivers that require damage updates. It is therefore a valid
assumption that the deferred-I/O worker is present.

It would be possible to perform the damage handling directly from within
the write operation. But doing this could increase the overhead of the
write or interfere with a concurrently scheduled deferred-I/O worker.
Instead, scheduling the deferred-I/O worker with its regular delay of
50 ms removes load off the write operation and allows the deferred-I/O
worker to handle multiple write operations that arrived during the delay
time window.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c     | 81 ++++++++++++++++++++---------
 drivers/video/fbdev/core/fb_defio.c | 16 ++++++
 include/linux/fb.h                  |  1 +
 3 files changed, 72 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index ebc44ed1bf4a2..8cb644e4ecf90 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -596,14 +596,6 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 }
 
-static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
-				 u32 width, u32 height)
-{
-	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
-
-	schedule_work(&helper->damage_work);
-}
-
 /*
  * Convert memory region into area of scanlines and pixels per
  * scanline. The parameters off and len must not reach beyond
@@ -683,6 +675,23 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
+static void drm_fb_helper_flush(struct drm_fb_helper *helper)
+{
+	struct drm_device *dev = helper->dev;
+	struct fb_info *info = helper->info;
+
+	/*
+	 * For now, we assume that deferred I/O has been enabled as damage
+	 * updates require deferred I/O for a working mmap. The current
+	 * fbdev emulation does not flush buffers if no damage update is
+	 * necessary. So it's safe to assume fbdefio to be set.
+	 */
+	if (drm_WARN_ON_ONCE(dev, !info->fbdefio))
+		return;
+
+	fb_deferred_io_flush(info);
+}
+
 typedef ssize_t (*drm_fb_helper_read_screen)(struct fb_info *info, char __user *buf,
 					     size_t count, loff_t pos);
 
@@ -824,9 +833,10 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 
 	if (helper->funcs->fb_dirty) {
 		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
-				     drm_rect_width(&damage_area),
-				     drm_rect_height(&damage_area));
+		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
+					      drm_rect_width(&damage_area),
+					      drm_rect_height(&damage_area));
+		drm_fb_helper_flush(helper);
 	}
 
 	return ret;
@@ -847,8 +857,11 @@ void drm_fb_helper_sys_fillrect(struct fb_info *info,
 
 	sys_fillrect(info, rect);
 
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_add_damage_clip(helper, rect->dx, rect->dy,
+					      rect->width, rect->height);
+		drm_fb_helper_flush(helper);
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 
@@ -866,8 +879,11 @@ void drm_fb_helper_sys_copyarea(struct fb_info *info,
 
 	sys_copyarea(info, area);
 
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_add_damage_clip(helper, area->dx, area->dy,
+					      area->width, area->height);
+		drm_fb_helper_flush(helper);
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 
@@ -885,8 +901,11 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
 
 	sys_imageblit(info, image);
 
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_add_damage_clip(helper, image->dx, image->dy,
+					      image->width, image->height);
+		drm_fb_helper_flush(helper);
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
 
@@ -997,9 +1016,10 @@ ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
 
 	if (helper->funcs->fb_dirty) {
 		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
-				     drm_rect_width(&damage_area),
-				     drm_rect_height(&damage_area));
+		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
+					      drm_rect_width(&damage_area),
+					      drm_rect_height(&damage_area));
+		drm_fb_helper_flush(helper);
 	}
 
 	return ret;
@@ -1020,8 +1040,11 @@ void drm_fb_helper_cfb_fillrect(struct fb_info *info,
 
 	cfb_fillrect(info, rect);
 
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_add_damage_clip(helper, rect->dx, rect->dy,
+					      rect->width, rect->height);
+		drm_fb_helper_flush(helper);
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
 
@@ -1039,8 +1062,11 @@ void drm_fb_helper_cfb_copyarea(struct fb_info *info,
 
 	cfb_copyarea(info, area);
 
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_add_damage_clip(helper, area->dx, area->dy,
+					      area->width, area->height);
+		drm_fb_helper_flush(helper);
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
 
@@ -1058,8 +1084,11 @@ void drm_fb_helper_cfb_imageblit(struct fb_info *info,
 
 	cfb_imageblit(info, image);
 
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
+	if (helper->funcs->fb_dirty) {
+		drm_fb_helper_add_damage_clip(helper, image->dx, image->dy,
+					      image->width, image->height);
+		drm_fb_helper_flush(helper);
+	}
 }
 EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
 
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index c730253ab85ce..325d12c3a4d61 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -332,3 +332,19 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 	mutex_destroy(&fbdefio->lock);
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
+
+void fb_deferred_io_flush(struct fb_info *info)
+{
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+
+	if (WARN_ON_ONCE(!fbdefio))
+		return; /* bug in driver logic */
+
+	/*
+	 * There's no requirement to perform the flush immediately. So
+	 * schedule the worker with a delay and let a few more writes
+	 * pile up.
+	 */
+	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
+}
+EXPORT_SYMBOL_GPL(fb_deferred_io_flush);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index bcb8658f5b64d..54b3b3e13522f 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -663,6 +663,7 @@ extern void fb_deferred_io_open(struct fb_info *info,
 				struct inode *inode,
 				struct file *file);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
+extern void fb_deferred_io_flush(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
 
-- 
2.38.0

