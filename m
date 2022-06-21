Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2949553000
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BE510E132;
	Tue, 21 Jun 2022 10:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CFB10E132
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:46:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44ED4219C0;
 Tue, 21 Jun 2022 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655808379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6FfuXEmjHU8y3K9CTtaOWpoCAU4urbqfwPztFLOi9f8=;
 b=cO0ux2YRzycKieUgSsIgrEGU3Fv6u0Eqo3ekg4lGozJUjE50dWfQiEkkmFhIiKemhK49Zt
 y9rNUfeUJ8u0LTSLYPmtA4FNHKqZ7yB/BgF4tT2WV4Y0QfCZ4vCmy79xwFP7yImJKTcBro
 xqM6jNRw3feALy3UNGSAZnVMg+ooP7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655808379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6FfuXEmjHU8y3K9CTtaOWpoCAU4urbqfwPztFLOi9f8=;
 b=wDuk9IYxk4RIhOCF07CixbP2p13rGWGizdhjsdGOQQrBkXQhQ0+zn7z6gdjOsMQzIA2H3l
 zgsYQHZMn/3KXMDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 10A3C13A88;
 Tue, 21 Jun 2022 10:46:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /fcTA3uhsWIiUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Jun 2022 10:46:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH] drm/fb-helper: Fix out-of-bounds access
Date: Tue, 21 Jun 2022 12:46:17 +0200
Message-Id: <20220621104617.8817-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunojpg@gmail.com>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clip memory range to screen-buffer size to avoid out-of-bounds access
in fbdev deferred I/O's damage handling.

Fbdev's deferred I/O can only track pages. From the range of pages, the
damage handler computes the clipping rectangle for the display update.
If the fbdev screen buffer ends near the beginning of a page, that page
could contain more scanlines. The damage handler would then track these
non-existing scanlines as dirty and provoke an out-of-bounds access
during the screen update. Hence, clip the maximum memory range to the
size of the screen buffer.

While at it, rename the variables min/max to min_off/max_off in
drm_fb_helper_deferred_io(). This avoids confusion with the macros of
the same name.

Reported-by: Nuno Gonçalves <nunojpg@gmail.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Nuno Gonçalves <nunojpg@gmail.com>
Fixes: 67b723f5b742 ("drm/fb-helper: Calculate damaged area in separate helper")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: <stable@vger.kernel.org> # v5.18+
---
 drivers/gpu/drm/drm_fb_helper.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 5ad2b6a2778c..1705e8d345ab 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -680,7 +680,11 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	schedule_work(&helper->damage_work);
 }
 
-/* Convert memory region into area of scanlines and pixels per scanline */
+/*
+ * Convert memory region into area of scanlines and pixels per
+ * scanline. The parameters off and len must not reach beyond
+ * the end of the framebuffer.
+ */
 static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
 					       struct drm_rect *clip)
 {
@@ -715,22 +719,29 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
  */
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
 {
-	unsigned long start, end, min, max;
+	unsigned long start, end, min_off, max_off;
 	struct fb_deferred_io_pageref *pageref;
 	struct drm_rect damage_area;
 
-	min = ULONG_MAX;
-	max = 0;
+	min_off = ULONG_MAX;
+	max_off = 0;
 	list_for_each_entry(pageref, pagereflist, list) {
 		start = pageref->offset;
 		end = start + PAGE_SIZE;
-		min = min(min, start);
-		max = max(max, end);
+		min_off = min(min_off, start);
+		max_off = max(max_off, end);
 	}
-	if (min >= max)
+	if (min_off >= max_off)
 		return;
 
-	drm_fb_helper_memory_range_to_clip(info, min, max - min, &damage_area);
+	/*
+	 * As we can only track pages, we might reach beyond the end
+	 * of the screen and account for non-existing scanlines. Hence,
+	 * keep the covered memory area within the screen buffer.
+	 */
+	max_off = min(max_off, info->screen_size);
+
+	drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
 	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
 			     drm_rect_width(&damage_area),
 			     drm_rect_height(&damage_area));
-- 
2.36.1

