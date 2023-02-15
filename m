Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA769807F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC1F10EB1B;
	Wed, 15 Feb 2023 16:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5B010EB0C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D6411FFC8;
 Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ssc5fLlY3EmVchnsZuNGj2ZA+Yv3t61dFG6GMcZx73E=;
 b=XtVO+Hkrv0yj3n7wfh9cykKeEkXq6jV7CsN1zxN0+r0ALrY781bhEC9lm7xhpKl9qer9Ge
 xDZaBerFs9ecd1EIdCukQS3YELjpmnOgl4rdFP1Xm0U97k2+tCzh1Fhmkbg2PUTxS2z7la
 cOkogtmwquZ7KDGDrhM/KpsolUPFxAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ssc5fLlY3EmVchnsZuNGj2ZA+Yv3t61dFG6GMcZx73E=;
 b=gzCSXhh+WOE0d7mhZ14sYByb8BC7VkPh4SRNlH4nVEP6LAjcw6FEdaM1tAM2mOqm8eqseD
 lhX75AgzoPiwV8Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF733134BA;
 Wed, 15 Feb 2023 16:15:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yDnELx0F7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 08/17] drm/cirrus: Convert to regular atomic helpers
Date: Wed, 15 Feb 2023 17:15:08 +0100
Message-Id: <20230215161517.5113-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215161517.5113-1-tzimmermann@suse.de>
References: <20230215161517.5113-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace simple-KMS helpers with DRM's regular helpers for atomic
modesetting. Avoids the mid-layer and the additional wrappers around
GEM's shadow-plane helpers.

Most of the simple-KMS code is just wrappers around regular atomic
helpers. The conversion is therefore equivalent to pulling the
simple-KMS helpers into cirrus and removing all the intermediate
code and data structures between the driver and the atomic helpers.
As the simple-KMS helpers lump primary plan, CRTC and encoder into a
single data structure, the conversion to regular helpers allows to
split modesetting from plane updates and handle each individually.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 202 +++++++++++++++++++++++-----------
 1 file changed, 138 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 7ca6a897a2b2..af26de9ef329 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -24,6 +24,7 @@
 #include <video/vga.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
@@ -43,7 +44,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define DRIVER_NAME "cirrus"
 #define DRIVER_DESC "qemu cirrus vga"
@@ -56,10 +56,18 @@
 
 struct cirrus_device {
 	struct drm_device	       dev;
-	struct drm_simple_display_pipe pipe;
+
+	/* modesetting pipeline */
+	struct drm_plane	       primary_plane;
+	struct drm_crtc		       crtc;
+	struct drm_encoder	       encoder;
 	struct drm_connector	       connector;
+
+	/* HW scanout buffer */
 	const struct drm_format_info   *format;
 	unsigned int		       pitch;
+
+	/* HW resources */
 	void __iomem		       *vram;
 	void __iomem		       *mmio;
 };
@@ -324,18 +332,6 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	return 0;
 }
 
-static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb,
-				     const struct iosys_map *map)
-{
-	struct drm_rect fullscreen = {
-		.x1 = 0,
-		.x2 = fb->width,
-		.y1 = 0,
-		.y2 = fb->height,
-	};
-	return cirrus_fb_blit_rect(fb, map, &fullscreen);
-}
-
 static int cirrus_check_size(int width, int height,
 			     struct drm_framebuffer *fb)
 {
@@ -365,78 +361,130 @@ static const uint64_t cirrus_primary_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
-static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-						   const struct drm_display_mode *mode)
+static int cirrus_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						    struct drm_atomic_state *state)
 {
-	if (cirrus_check_size(mode->hdisplay, mode->vdisplay, NULL) < 0)
-		return MODE_BAD;
-	return MODE_OK;
-}
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+	int ret;
 
-static int cirrus_pipe_check(struct drm_simple_display_pipe *pipe,
-			     struct drm_plane_state *plane_state,
-			     struct drm_crtc_state *crtc_state)
-{
-	struct drm_framebuffer *fb = plane_state->fb;
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
 
-	if (!fb)
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
 		return 0;
+
 	return cirrus_check_size(fb->width, fb->height, fb);
 }
 
-static void cirrus_pipe_enable(struct drm_simple_display_pipe *pipe,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_plane_state *plane_state)
+static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						      struct drm_atomic_state *state)
 {
-	struct cirrus_device *cirrus = to_cirrus(pipe->crtc.dev);
+	struct cirrus_device *cirrus = to_cirrus(plane->dev);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_rect rect;
 	int idx;
 
+	if (!fb)
+		return;
+
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		return;
 
-	cirrus_mode_set(cirrus, &crtc_state->mode);
-	cirrus_format_set(cirrus, plane_state->fb);
-	cirrus_pitch_set(cirrus, plane_state->fb);
-	cirrus_fb_blit_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
+	if (cirrus->format != cirrus_format(fb))
+		cirrus_format_set(cirrus, fb);
+	if (cirrus->pitch != cirrus_pitch(fb))
+		cirrus_pitch_set(cirrus, fb);
 
-	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
-	outb(0x20, 0x3c0);
+	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
+		cirrus_fb_blit_rect(fb, &shadow_plane_state->data[0], &rect);
 
 	drm_dev_exit(idx);
 }
 
-static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *old_state)
+static const struct drm_plane_helper_funcs cirrus_primary_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = cirrus_primary_plane_helper_atomic_check,
+	.atomic_update = cirrus_primary_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs cirrus_primary_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static enum drm_mode_status cirrus_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							  const struct drm_display_mode *mode)
 {
-	struct cirrus_device *cirrus = to_cirrus(pipe->crtc.dev);
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
-	struct drm_rect rect;
+	if (cirrus_check_size(mode->hdisplay, mode->vdisplay, NULL) < 0)
+		return MODE_BAD;
+
+	return MODE_OK;
+}
+
+static int cirrus_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (!crtc_state->enable)
+		return 0;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void cirrus_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
+{
+	struct cirrus_device *cirrus = to_cirrus(crtc->dev);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	int idx;
 
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		return;
 
-	if (state->fb) {
-		if (cirrus->format != cirrus_format(state->fb))
-			cirrus_format_set(cirrus, state->fb);
-		if (cirrus->pitch != cirrus_pitch(state->fb))
-			cirrus_pitch_set(cirrus, state->fb);
-	}
+	cirrus_mode_set(cirrus, &crtc_state->mode);
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		cirrus_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
+	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
+	outb(0x20, 0x3c0);
 
 	drm_dev_exit(idx);
 }
 
-static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
-	.mode_valid = cirrus_pipe_mode_valid,
-	.check	    = cirrus_pipe_check,
-	.enable	    = cirrus_pipe_enable,
-	.update	    = cirrus_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_crtc_helper_funcs cirrus_crtc_helper_funcs = {
+	.mode_valid = cirrus_crtc_helper_mode_valid,
+	.atomic_check = cirrus_crtc_helper_atomic_check,
+	.atomic_enable = cirrus_crtc_helper_atomic_enable,
+};
+
+static const struct drm_crtc_funcs cirrus_crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs cirrus_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int cirrus_connector_helper_get_modes(struct drm_connector *connector)
@@ -465,23 +513,49 @@ static const struct drm_connector_funcs cirrus_connector_funcs = {
 static int cirrus_pipe_init(struct cirrus_device *cirrus)
 {
 	struct drm_device *dev = &cirrus->dev;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	int ret;
 
+	primary_plane = &cirrus->primary_plane;
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &cirrus_primary_plane_funcs,
+				       cirrus_primary_plane_formats,
+				       ARRAY_SIZE(cirrus_primary_plane_formats),
+				       cirrus_primary_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(primary_plane, &cirrus_primary_plane_helper_funcs);
+
+	crtc = &cirrus->crtc;
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&cirrus_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &cirrus_crtc_helper_funcs);
+
+	encoder = &cirrus->encoder;
+	ret = drm_encoder_init(dev, encoder, &cirrus_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
 	connector = &cirrus->connector;
-	ret = drm_connector_init(&cirrus->dev, connector, &cirrus_connector_funcs,
+	ret = drm_connector_init(dev, connector, &cirrus_connector_funcs,
 				 DRM_MODE_CONNECTOR_VGA);
 	if (ret)
 		return ret;
 	drm_connector_helper_add(connector, &cirrus_connector_helper_funcs);
 
-	return drm_simple_display_pipe_init(dev,
-					    &cirrus->pipe,
-					    &cirrus_pipe_funcs,
-					    cirrus_primary_plane_formats,
-					    ARRAY_SIZE(cirrus_primary_plane_formats),
-					    cirrus_primary_plane_format_modifiers,
-					    connector);
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 /* ------------------------------------------------------------------ */
-- 
2.39.1

