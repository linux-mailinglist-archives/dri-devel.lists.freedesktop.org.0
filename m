Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C54AB1AD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ED210E203;
	Sun,  6 Feb 2022 19:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9C10E203
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:29:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C96301F388;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644175779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q94nEM2/I6BDo2coDSagHqBI0Y75EVEsVVYAHEaTjOA=;
 b=irx0aFecVmIQXPYzGLpx0aQRxrrs523j/BnMyBI2OrEjebmk8PdSJweiRLoeMdUVm3mSwB
 uStuerFxKM0eHDQyGU93TupDMdM4rhYjxIzI1Fiq2OeJiul+LYwpXD4cry9U/piOgNEymt
 Au06be1mlwFHX7w2/sTrJw5TtleXmxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644175779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q94nEM2/I6BDo2coDSagHqBI0Y75EVEsVVYAHEaTjOA=;
 b=ShAaXn13rb0dt3Q6w3kmLQqeLp2cmL/zOyvfB9ywxvo/Xwg6/9jEZHWk141gK2umIoEvW3
 bZMQcve6jXQQXGAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 932F9139EF;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qNbWIqMhAGLlJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Feb 2022 19:29:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 3/5] drm/fb-helper: Calculate damaged area in separate helper
Date: Sun,  6 Feb 2022 20:29:33 +0100
Message-Id: <20220206192935.24645-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220206192935.24645-1-tzimmermann@suse.de>
References: <20220206192935.24645-1-tzimmermann@suse.de>
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

Add drm_fb_helper_clip_to_memory_range(), a helper function that
accepts an linear range of video memory and converts it into a
rectangle. The computed rectangle describes the damaged area in
terms of scanlines and pixels per scanline.

While at it, make the code more readable by using struct drm_rect
and related helpers.

The code was previously part of the deferred I/O helpers, but is
also useful for damage handling of regular write operations. Update
the deferred I/O code to use the new function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 87c47093c3a2..ae98990c7b66 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -680,6 +680,19 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	schedule_work(&helper->damage_work);
 }
 
+/* Convert memory region into area of scanlines and pixels per scanline */
+static void drm_fb_helper_clip_to_memory_range(struct fb_info *info, off_t off, size_t len,
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
+	drm_fb_helper_clip_to_memory_range(info, min, max - min, &damage_area);
+	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-- 
2.34.1

