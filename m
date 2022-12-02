Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE6640743
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 13:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0234A10E6F2;
	Fri,  2 Dec 2022 12:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E5210E6E8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 12:56:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCF6E1FD97;
 Fri,  2 Dec 2022 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669985807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oU7Z0abhKFKj2LO8lx8mJvtRy68uBtIKFUDN0DSRH3U=;
 b=ez9GBS0QFOH0MyxyP+odPlvnow5i8/8eSzLIwc+mw/G1Rl9CmteKkvcq69ZgYEllCjS4zW
 ZRV0VFIecs9RaSQrzhBbKgbx5lTGlL4GHnESpfws0AGwFfF+PVSUolYmOkh/tsCLbeRvFf
 ZCBWcNnxH4JBtPsYh/IYQqxH6YqeMYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669985807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oU7Z0abhKFKj2LO8lx8mJvtRy68uBtIKFUDN0DSRH3U=;
 b=kcXk2+MPod2PtwiEuZMlN72WhwqKO8FCFyYeqs7dhEXQAgev7IuKHdEFiA3UpZEZL3sKIi
 L8As8PtOgGo0f9Ag==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A2145133DE;
 Fri,  2 Dec 2022 12:56:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mKPAJg/2iWOhOwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Dec 2022 12:56:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH v2 7/8] drm/mipi-dbi: Use shadow-plane mappings
Date: Fri,  2 Dec 2022 13:56:43 +0100
Message-Id: <20221202125644.7917-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202125644.7917-1-tzimmermann@suse.de>
References: <20221202125644.7917-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the buffer mappings provided by shadow-plane helpers. As the
mappings are established while the commit can still fail, errors
are now reported correctly to callers.

v2:
	* use shadow-plane state directly (Noralf)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Noralf Trønnes <noralf@tronnes.org> # drm/tiny/mi0283qt
---
 drivers/gpu/drm/drm_mipi_dbi.c | 25 +++++--------------------
 drivers/gpu/drm/tiny/ili9225.c | 16 ++++------------
 drivers/gpu/drm/tiny/st7586.c  | 16 ++++------------
 3 files changed, 13 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index b808de61c5bc..0ef5e81ba5e1 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -321,12 +321,10 @@ EXPORT_SYMBOL(mipi_dbi_pipe_mode_valid);
 void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *old_state)
 {
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES] = { };
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES] = { };
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
-	int ret;
 
 	if (!pipe->crtc.state->active)
 		return;
@@ -334,14 +332,8 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
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
 
@@ -362,6 +354,7 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
 			   struct drm_crtc_state *crtc_state,
 			   struct drm_plane_state *plane_state)
 {
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_rect rect = {
 		.x1 = 0,
@@ -369,22 +362,14 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES] = { };
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES] = { };
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
index a69aec8402bc..0ba5177deca7 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -164,19 +164,15 @@ static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
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
-		ili9225_fb_dirty(&src, fb, &rect);
+		ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 }
 
 static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
@@ -184,6 +180,7 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *plane_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct device *dev = pipe->crtc.dev->dev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -193,8 +190,6 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	struct drm_gem_dma_object *dma_obj;
-	struct iosys_map src;
 	int ret, idx;
 	u8 am_id;
 
@@ -285,10 +280,7 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ili9225_command(dbi, ILI9225_DISPLAY_CONTROL_1, 0x1017);
 
-	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
-	iosys_map_set_vaddr(&src, dma_obj->vaddr);
-
-	ili9225_fb_dirty(&src, fb, &rect);
+	ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
 
 out_exit:
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 76b13cefc904..53dca9272d4d 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -153,19 +153,15 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
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
@@ -173,6 +169,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *plane_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	struct drm_rect rect = {
@@ -181,8 +178,6 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	struct drm_gem_dma_object *dma_obj;
-	struct iosys_map src;
 	int idx, ret;
 	u8 addr_mode;
 
@@ -242,10 +237,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 
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

