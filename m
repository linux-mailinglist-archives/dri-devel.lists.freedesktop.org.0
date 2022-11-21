Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF67631EAC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA110E05A;
	Mon, 21 Nov 2022 10:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B732410E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:45:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 539761F8A3;
 Mon, 21 Nov 2022 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669027537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZabTJ1Q2oDh6wQrcN5gAA5xYx4o6z9tchNBCKyoKfU=;
 b=xqzxPUGgc8uXXgkyL05MX9s6+Ci7HGZugW5t4lC1E1TfP6HVZEy/WJyv+OuNwB546boEvV
 3sJIe4ahmK1NQQY+1+5vXjjSL0+sVGi/Gf2DTc7RRIGtLleeU6HS8oU1glxh0Y2b9+C1Ko
 q+3xBXSF3ZlzVKHZO1p+U5llt4rjngE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669027537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZabTJ1Q2oDh6wQrcN5gAA5xYx4o6z9tchNBCKyoKfU=;
 b=MS1dfHAFEvqP1Oy6rc9anjgVYyCsClYWpQJn7MuRpOO33Ot7PJvKTV2eGaYuBuadCevkOA
 8CMHkKu8v6epIzAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13A381376E;
 Mon, 21 Nov 2022 10:45:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gJLaA9FWe2NaGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 10:45:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH 7/8] drm/mipi-dbi: Use shadow-plane mappings
Date: Mon, 21 Nov 2022 11:45:31 +0100
Message-Id: <20221121104532.8301-8-tzimmermann@suse.de>
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

Use the buffer mappings provided by shadow-plane helpers. As the
mappings are established while the commit can still fail, errors
are now reported correctly to callers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 31 +++++++++++--------------------
 drivers/gpu/drm/tiny/ili9225.c | 28 ++++++++++------------------
 drivers/gpu/drm/tiny/st7586.c  | 22 ++++++++++------------
 3 files changed, 31 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 3030344d25b48..d45824a65c9fd 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -323,12 +323,13 @@ EXPORT_SYMBOL(mipi_dbi_pipe_mode_valid);
 void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *old_state)
 {
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct drm_plane_state *state = pipe->plane.state;
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state =
+		to_mipi_dbi_plane_state(state);
+	struct drm_shadow_plane_state *shadow_plane_state =
+		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
-	int ret;
 
 	if (!pipe->crtc.state->active)
 		return;
@@ -336,14 +337,8 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (WARN_ON(!fb))
 		return;
 
-	ret = drm_gem_fb_vmap(fb, map, data);
-	if (ret)
-		return;
-
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		mipi_dbi_fb_dirty(&data[0], fb, &rect);
-
-	drm_gem_fb_vunmap(fb, map);
+		mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_update);
 
@@ -364,6 +359,10 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
 			   struct drm_crtc_state *crtc_state,
 			   struct drm_plane_state *plane_state)
 {
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state =
+		to_mipi_dbi_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state =
+		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_rect rect = {
 		.x1 = 0,
@@ -371,22 +370,14 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
-	int idx, ret;
+	int idx;
 
 	if (!drm_dev_enter(&dbidev->drm, &idx))
 		return;
 
-	ret = drm_gem_fb_vmap(fb, map, data);
-	if (ret)
-		goto err_drm_dev_exit;
-
-	mipi_dbi_fb_dirty(&data[0], fb, &rect);
+	mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 	backlight_enable(dbidev->backlight);
 
-	drm_gem_fb_vunmap(fb, map);
-err_drm_dev_exit:
 	drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(mipi_dbi_enable_flush);
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 9e55ce28b4552..ba5681b63ffbf 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -163,24 +163,19 @@ static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_state)
 {
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct drm_plane_state *state = pipe->plane.state;
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state =
+		to_mipi_dbi_plane_state(state);
+	struct drm_shadow_plane_state *shadow_plane_state =
+		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
-	int ret;
 
 	if (!pipe->crtc.state->active)
 		return;
 
-	ret = drm_gem_fb_vmap(fb, map, data);
-	if (ret)
-		return;
-
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		ili9225_fb_dirty(&data[0], fb, &rect);
-
-	drm_gem_fb_vunmap(fb, map);
+		ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 }
 
 static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
@@ -188,6 +183,10 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *plane_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state =
+		to_mipi_dbi_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state =
+		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct device *dev = pipe->crtc.dev->dev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -197,8 +196,6 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	int ret, idx;
 	u8 am_id;
 
@@ -289,13 +286,8 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ili9225_command(dbi, ILI9225_DISPLAY_CONTROL_1, 0x1017);
 
-	ret = drm_gem_fb_vmap(fb, map, data);
-	if (ret)
-		goto out_exit;
-
-	ili9225_fb_dirty(&data[0], fb, &rect);
+	ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 
-	drm_gem_fb_vunmap(fb, map);
 out_exit:
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 76b13cefc904f..ddaa82c2e58ae 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -153,19 +153,18 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state =
+		to_mipi_dbi_plane_state(state);
+	struct drm_shadow_plane_state *shadow_plane_state =
+		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *dma_obj;
-	struct iosys_map src;
 	struct drm_rect rect;
 
 	if (!pipe->crtc.state->active)
 		return;
 
-	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
-	iosys_map_set_vaddr(&src, dma_obj->vaddr);
-
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		st7586_fb_dirty(&src, fb, &rect);
+		st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 }
 
 static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
@@ -173,6 +172,10 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *plane_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_plane_state *mipi_dbi_plane_state =
+		to_mipi_dbi_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state =
+		&mipi_dbi_plane_state->shadow_plane_state;
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	struct drm_rect rect = {
@@ -181,8 +184,6 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	struct drm_gem_dma_object *dma_obj;
-	struct iosys_map src;
 	int idx, ret;
 	u8 addr_mode;
 
@@ -242,10 +243,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	msleep(100);
 
-	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
-	iosys_map_set_vaddr(&src, dma_obj->vaddr);
-
-	st7586_fb_dirty(&src, fb, &rect);
+	st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 
 	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
 out_exit:
-- 
2.38.1

