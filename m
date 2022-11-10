Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F56243AE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A9910E7CF;
	Thu, 10 Nov 2022 13:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC7810E7CB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:55:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EAD5D22AA4;
 Thu, 10 Nov 2022 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668088521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiGBU8Iw2c+74FQin++OWEXwxST0lQeVqXIo0F4T6Gk=;
 b=IErZL59Qj1ECPIKIP77L6jwDxtxpWq2tWrx8CNQsA49ABN1gEfu9bEfrIS0bBJCn9qV+FE
 +7IKxpTb+VA1utZCDgIbFUTdhGqhLKM6xjznWmB2bsVbsHrC7/3h/JpqXIVHBk/J1SSkIz
 +0A+P0EPM49wZyCTtXCCalZxUjp9xSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668088521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiGBU8Iw2c+74FQin++OWEXwxST0lQeVqXIo0F4T6Gk=;
 b=qISkHRP8xXBY6/wHoTN6SZ6JZTVFq7LVohbExXRT3R77te9RjfVk5W1h6UWIbNFQck8Vjp
 2jZl1dvDlAOxkUDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C73111332F;
 Thu, 10 Nov 2022 13:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kMl2L8kCbWP/DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Nov 2022 13:55:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/5] drm/fb-helper: Perform damage handling in deferred-I/O
 helper
Date: Thu, 10 Nov 2022 14:55:17 +0100
Message-Id: <20221110135519.30029-4-tzimmermann@suse.de>
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

Call fb_dirty directly from drm_fb_helper_deferred_io() to avoid the
latency of running the damage worker.

The deferred-I/O helper drm_fb_helper_deferred_io() runs in a worker
thread at regular intervals as part of writing to mmaped framebuffer
memory. It used to schedule the fbdev damage worker to flush the
framebuffer. Changing this to flushing the framebuffer directly avoids
the latency introduced by the damage worker.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index be8ecb5e50b56..ebc44ed1bf4a2 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -644,10 +644,14 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
 	struct drm_fb_helper *helper = info->par;
+	struct drm_device *dev = helper->dev;
 	unsigned long start, end, min_off, max_off;
 	struct fb_deferred_io_pageref *pageref;
 	struct drm_rect damage_area;
 
+	if (drm_WARN_ON(dev, !helper->funcs->fb_dirty))
+		return;
+
 	min_off = ULONG_MAX;
 	max_off = 0;
 	list_for_each_entry(pageref, pagereflist, list) {
@@ -656,22 +660,26 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 		min_off = min(min_off, start);
 		max_off = max(max_off, end);
 	}
-	if (min_off >= max_off)
-		return;
 
-	if (helper->funcs->fb_dirty) {
-		/*
-		 * As we can only track pages, we might reach beyond the end
-		 * of the screen and account for non-existing scanlines. Hence,
-		 * keep the covered memory area within the screen buffer.
-		 */
-		max_off = min(max_off, info->screen_size);
+	/*
+	 * As we can only track pages, we might reach beyond the end
+	 * of the screen and account for non-existing scanlines. Hence,
+	 * keep the covered memory area within the screen buffer.
+	 */
+	max_off = min(max_off, info->screen_size);
 
+	if (min_off < max_off) {
 		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
-		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
-				     drm_rect_width(&damage_area),
-				     drm_rect_height(&damage_area));
+		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
+					      drm_rect_width(&damage_area),
+					      drm_rect_height(&damage_area));
 	}
+
+	/*
+	 * Flushes all dirty pages from mmap's pageref list and the
+	 * areas that have been written by struct fb_ops callbacks.
+	 */
+	drm_fb_helper_fb_dirty(helper);
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-- 
2.38.0

