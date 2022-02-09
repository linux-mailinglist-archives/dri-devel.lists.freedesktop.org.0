Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490F04AF64E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4D389861;
	Wed,  9 Feb 2022 16:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3989861
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:16:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E7F342110A;
 Wed,  9 Feb 2022 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644423380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D60o586OvEDXLWvAU4FKJwmGs0lEDRiQDB4pMkPb0tk=;
 b=fmdXvz0d5wYqckJDDqAL3RCE7SXGgOlN9t3yYz1i/AB945sx9uwyCcgdgaIqsVjTFb+CTg
 aDzjhY/wrPpjuIsFTWmJlcMfV6Uq9+fzvvPj2XB6yuOPGe11YOKCeFJYAjhIIHvZIhxs9l
 lTlhfx253xSqQZ/2K+XDjqcf+LrvggE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644423380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D60o586OvEDXLWvAU4FKJwmGs0lEDRiQDB4pMkPb0tk=;
 b=41E0TIa2Xlofsxrllz6pV7P01PO+iM6gCYXwvQOp5V3Q6Zvyhef/OPBzIN21GILgbvmWg/
 gCJJZdlbp0Lx/9BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B609113D58;
 Wed,  9 Feb 2022 16:16:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UOaEK9ToA2KfJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 16:16:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH v2 3/5] drm/fb-helper: Calculate damaged area in separate
 helper
Date: Wed,  9 Feb 2022 17:16:15 +0100
Message-Id: <20220209161617.3553-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209161617.3553-1-tzimmermann@suse.de>
References: <20220209161617.3553-1-tzimmermann@suse.de>
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

Add drm_fb_helper_memory_range_to_clip(), a helper function that
accepts an linear range of video memory and converts it into a
rectangle. The computed rectangle describes the damaged area in
terms of scanlines and pixels per scanline.

While at it, make the code more readable by using struct drm_rect
and related helpers.

The code was previously part of the deferred I/O helpers, but is
also useful for damage handling of regular write operations. Update
the deferred I/O code to use the new function.

v2:
	* rename helper (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 87c47093c3a2..3d6d0b1464e7 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -680,6 +680,19 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	schedule_work(&helper->damage_work);
 }
 
+/* Convert memory region into area of scanlines and pixels per scanline */
+static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
+					       struct drm_rect *clip)
+{
+	off_t end = off + len;
+	u32 x1 = 0;
+	u32 y1 = off / info->fix.line_length;
+	u32 x2 = info->var.xres;
+	u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
+
+	drm_rect_init(clip, x1, y1, x2 - x1, y2 - y1);
+}
+
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
@@ -693,7 +706,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 {
 	unsigned long start, end, min, max;
 	struct page *page;
-	u32 y1, y2;
+	struct drm_rect damage_area;
 
 	min = ULONG_MAX;
 	max = 0;
@@ -703,12 +716,13 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 		min = min(min, start);
 		max = max(max, end);
 	}
+	if (min >= max)
+		return;
 
-	if (min < max) {
-		y1 = min / info->fix.line_length;
-		y2 = DIV_ROUND_UP(max, info->fix.line_length);
-		drm_fb_helper_damage(info, 0, y1, info->var.xres, y2 - y1);
-	}
+	drm_fb_helper_memory_range_to_clip(info, min, max - min, &damage_area);
+	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-- 
2.34.1

