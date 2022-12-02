Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E8640749
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 13:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8157910E6F8;
	Fri,  2 Dec 2022 12:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC0510E6EC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 12:56:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 245651FDA1;
 Fri,  2 Dec 2022 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669985808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xf9usDUnqnzApL5OnmvkLaCNIRoJvOlqyg855iwOD7s=;
 b=R+CTvf0moepwb9BThoFcK0Nwo+GOd+aDMoXYT2QGEsbRiUtNmUHpEhNKtaYGmdwvAFQHQc
 HJmaytbN1yFJmvk1MBWhzyGvoBjtdUBIQkB9902Yzk/bs9yrVwknpikiJVA9Eg9bwZoWjh
 bsk5/rzgKjFc52zdPFQxNZHvX+d91Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669985808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xf9usDUnqnzApL5OnmvkLaCNIRoJvOlqyg855iwOD7s=;
 b=UhbTul3mhlXCpOzoMIkIod4RTuEnsTkzK9ej8m5+DRgE1+PX0I0/mvKz9wiYvN1Qhcze/i
 PCkgNEj7BybvXlDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E03A213649;
 Fri,  2 Dec 2022 12:56:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id QDrwNQ/2iWOhOwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Dec 2022 12:56:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH v2 8/8] drm/mipi-dbi: Move drm_dev_{enter,
 exit}() out from fb_dirty functions
Date: Fri,  2 Dec 2022 13:56:44 +0100
Message-Id: <20221202125644.7917-9-tzimmermann@suse.de>
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

Call drm_dev_enter() and drm_dev_exit() in the outer-most callbacks
of the modesetting pipeline. If drm_dev_enter() fails, the driver can
thus avoid unnecessary work.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Noralf Trønnes <noralf@tronnes.org> # drm/tiny/mi0283qt
---
 drivers/gpu/drm/drm_mipi_dbi.c | 13 +++++++------
 drivers/gpu/drm/tiny/ili9225.c | 13 +++++++------
 drivers/gpu/drm/tiny/st7586.c  | 13 +++++++------
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 0ef5e81ba5e1..eb27d000bcfb 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -259,13 +259,10 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
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
@@ -288,8 +285,6 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 err_msg:
 	if (ret)
 		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
-
-	drm_dev_exit(idx);
 }
 
 /**
@@ -325,6 +320,7 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
+	int idx;
 
 	if (!pipe->crtc.state->active)
 		return;
@@ -332,8 +328,13 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
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
index 0ba5177deca7..077c6ff5a2e1 100644
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
@@ -167,12 +162,18 @@ static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
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
index 53dca9272d4d..3cf4eec16a81 100644
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
@@ -156,12 +151,18 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
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

