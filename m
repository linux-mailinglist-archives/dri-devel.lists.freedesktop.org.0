Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0451631EAD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE32910E1E2;
	Mon, 21 Nov 2022 10:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA14D10E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:45:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96939220CF;
 Mon, 21 Nov 2022 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669027537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+xNnWpu/QjKEJioNZNGUFPIfSUbNb/7qtAoSxRpXkw=;
 b=UUj39sFfF2323/74ZZaLnAOn/MDwUBy0hvVr6f3E7TBfg2Y3f76D5r+LMgvSDTLEvKXz4F
 vyFj51gSpZ02gVGA0gun46k+5jQH/1btnuvUIvC8AmJuI5zUKQkzZ72XZXN+JuxXBHdGDG
 aD58sQoApP8zrKC2uHkgUcCe67RYKhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669027537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+xNnWpu/QjKEJioNZNGUFPIfSUbNb/7qtAoSxRpXkw=;
 b=toALTKXqd97w9nQBoeDXy2eZeB7BA/A8a/ZmV4OpOG7RS1tuzWY80lbPYCwxYR47moPgsO
 HGUmoLxhA4z4eyBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57C8513B03;
 Mon, 21 Nov 2022 10:45:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oK+RFNFWe2NaGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 10:45:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH 8/8] drm/mipi-dbi: Move drm_dev_{enter,
 exit}() out from fb_dirty functions
Date: Mon, 21 Nov 2022 11:45:32 +0100
Message-Id: <20221121104532.8301-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121104532.8301-1-tzimmermann@suse.de>
References: <20221121104532.8301-1-tzimmermann@suse.de>
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

Call drm_dev_enter() and drm_dev_exit() in the outer-most callbacks
of the modesetting pipeline. If drm_dev_enter() fails, the driver can
thus avoid unnecessary work.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 13 +++++++------
 drivers/gpu/drm/tiny/ili9225.c | 13 +++++++------
 drivers/gpu/drm/tiny/st7586.c  | 13 +++++++------
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index d45824a65c9fd..fc1c8c536370a 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -261,13 +261,10 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 	unsigned int width = rect->x2 - rect->x1;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	bool swap = dbi->swap_bytes;
-	int idx, ret = 0;
+	int ret = 0;
 	bool full;
 	void *tr;
 
-	if (!drm_dev_enter(fb->dev, &idx))
-		return;
-
 	full = width == fb->width && height == fb->height;
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
@@ -290,8 +287,6 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 err_msg:
 	if (ret)
 		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
-
-	drm_dev_exit(idx);
 }
 
 /**
@@ -330,6 +325,7 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
+	int idx;
 
 	if (!pipe->crtc.state->active)
 		return;
@@ -337,8 +333,13 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (WARN_ON(!fb))
 		return;
 
+	if (!drm_dev_enter(fb->dev, &idx))
+		return;
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+
+	drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_update);
 
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index ba5681b63ffbf..7ecbb8b141757 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -87,13 +87,10 @@ static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 	bool swap = dbi->swap_bytes;
 	u16 x_start, y_start;
 	u16 x1, x2, y1, y2;
-	int idx, ret = 0;
+	int ret = 0;
 	bool full;
 	void *tr;
 
-	if (!drm_dev_enter(fb->dev, &idx))
-		return;
-
 	full = width == fb->width && height == fb->height;
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
@@ -156,8 +153,6 @@ static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 err_msg:
 	if (ret)
 		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
-
-	drm_dev_exit(idx);
 }
 
 static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -170,12 +165,18 @@ static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
 		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
+	int idx;
 
 	if (!pipe->crtc.state->active)
 		return;
 
+	if (!drm_dev_enter(fb->dev, &idx))
+		return;
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+
+	drm_dev_exit(idx);
 }
 
 static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index ddaa82c2e58ae..0f5e532fe5d1d 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -113,10 +113,7 @@ static void st7586_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
-	int start, end, idx, ret = 0;
-
-	if (!drm_dev_enter(fb->dev, &idx))
-		return;
+	int start, end, ret = 0;
 
 	/* 3 pixels per byte, so grow clip to nearest multiple of 3 */
 	rect->x1 = rounddown(rect->x1, 3);
@@ -145,8 +142,6 @@ static void st7586_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 err_msg:
 	if (ret)
 		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
-
-	drm_dev_exit(idx);
 }
 
 static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -159,12 +154,18 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
+	int idx;
 
 	if (!pipe->crtc.state->active)
 		return;
 
+	if (!drm_dev_enter(fb->dev, &idx))
+		return;
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+
+	drm_dev_exit(idx);
 }
 
 static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
-- 
2.38.1

