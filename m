Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADDE6297DA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3429810E3B2;
	Tue, 15 Nov 2022 11:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF32A10E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:58:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E3CC1F8BB;
 Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668513503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xc+uD1AGtjpeOWuOgjgigEqiot13vtX5YOnVzdoSVN4=;
 b=1iCr+Yl2pMFuDXYfVSQ/r2tt37wE8NRT5VbnxP+aMtHR6ZY8xq9kq3wXcdr2mxh7vzfgD+
 Ie4cegFJ5FIYBuYZUuLas97yOwOdwqSI6kfAkgK8V+WAsIiycTB6lJ84ASRnnqWdU1WQbP
 cSn39/4EjiUbhuU8GZ41wDk0ToH79oM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668513503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xc+uD1AGtjpeOWuOgjgigEqiot13vtX5YOnVzdoSVN4=;
 b=oEEK95VbsSAGpUZuT9hpQDjk0zCULX/vcKGmr41+J0tMRzVi5gg6B2qrw5Ilxr19iqVvVZ
 iqY55jaRTqLNC5Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50FBA13273;
 Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GArfEt9+c2OELgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 11:58:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Date: Tue, 15 Nov 2022 12:58:18 +0100
Message-Id: <20221115115819.23088-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115115819.23088-1-tzimmermann@suse.de>
References: <20221115115819.23088-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
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

v2:
	* keep drm_fb_helper_damage() (Daniel)
	* use fb_deferred_io_schedule_flush() (Daniel)
	* clarify comments (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c     | 10 +++++++++-
 drivers/video/fbdev/core/fb_defio.c | 16 ++++++++++++++++
 include/linux/fb.h                  |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index cdbf03e941b2b..fbb9088f7defc 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -599,9 +599,17 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
 static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
+	struct drm_device *dev = helper->dev;
+	struct fb_info *info = helper->info;
+
 	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
 
-	schedule_work(&helper->damage_work);
+	/*
+	 * The current fbdev emulation only flushes buffers if a damage
+	 * update is necessary. And we can assume that deferred I/O has
+	 * been enabled as damage updates require deferred I/O for mmap.
+	 */
+	fb_deferred_io_schedule_flush(info);
 }
 
 /*
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index c730253ab85ce..dec678f72a42f 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -332,3 +332,19 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 	mutex_destroy(&fbdefio->lock);
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
+
+void fb_deferred_io_schedule_flush(struct fb_info *info)
+{
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+
+	if (WARN_ON_ONCE(!fbdefio))
+		return; /* bug in driver logic */
+
+	/*
+	 * There's no requirement from callers to schedule the
+	 * flush immediately. Rather schedule the worker with a
+	 * delay and let a few more writes pile up.
+	 */
+	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
+}
+EXPORT_SYMBOL_GPL(fb_deferred_io_schedule_flush);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index bcb8658f5b64d..172f271520c78 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -663,6 +663,7 @@ extern void fb_deferred_io_open(struct fb_info *info,
 				struct inode *inode,
 				struct file *file);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
+extern void fb_deferred_io_schedule_flush(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
 
-- 
2.38.1

