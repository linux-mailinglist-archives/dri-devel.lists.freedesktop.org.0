Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A035ADB69
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 00:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7632410E420;
	Mon,  5 Sep 2022 22:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843B310E420
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662416887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/detDVQZknlSNWFk7loCBRlBVn0q3tjbmtTr+O34rak=;
 b=hHBnBHUg6eM7sZIRMbRyOPsQ3k1X/n5GpLTeR/lKeD8e/oHQOECPwpdWWjhVspxscTq8n/
 +80tbqGlGAZST3l/Atx6HZnlw4aNkE9v+ZxZkyMLaOF3G2bOzKyXD3I/8ymvklalBJM9kP
 BAZmXHBf5Y9aDAnCNVbTGkLxYj9rw+M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-FseWaYBnO5Sk9ZTC83L0uA-1; Mon, 05 Sep 2022 18:28:06 -0400
X-MC-Unique: FseWaYBnO5Sk9ZTC83L0uA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v3-20020a1cac03000000b003a7012c430dso7984772wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 15:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/detDVQZknlSNWFk7loCBRlBVn0q3tjbmtTr+O34rak=;
 b=NPLH2autdRZ/uDfHqu1Ch7eW0M7iGMYB8Y1wbmoA7tIW/e2kqMzk2SZUHwa2TG7Mpn
 8ScBRzsAjhC5N8mWRxUTHJoYDKXZVWS9ENBBC8kP9wHzIUf8gGBE9sE4PLlH6a7t/1iR
 4alx43m+69U39mvaFQEayUno4eQM2pSSiqTmLZlSDAICEh51fX/UFXpbKV8nKGuGDD7H
 h7hx/UTlTh5WKAa+3HEGruOiSA6G4JUT9mI+YjG7oYXZoVeOrGJhE0+ohB5mbK21RWmy
 TPvQWtZQeJPPllykNOpIjWFsKNw4UCaADtSkVYUX3gIPAx9AqRl7IPtY46CgSo9rqh+K
 bbPA==
X-Gm-Message-State: ACgBeo3gnSv5DNFnAvjmI8NU6CrvJkNnUtGrMdDyykWxq5lMsjlvaz2u
 WosFT/jJbqE1AVajyUb6UpWnqDSrV3amUSOQvgpkjLGsS4a+jgC8CeXMrg9HRBImGkp7AriDlNp
 q7Em5KfbS0KkOQQitS1xpvr5VAJS9
X-Received: by 2002:a1c:7703:0:b0:3a5:aefa:68e3 with SMTP id
 t3-20020a1c7703000000b003a5aefa68e3mr12403394wmi.158.1662416884367; 
 Mon, 05 Sep 2022 15:28:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6J8VszMfDy9FNJSXHKDx6EtgcyzMsCtvJg90tzF2fBov7d6G6Nq98S+/qeSs+V8dFiCuN4LA==
X-Received: by 2002:a1c:7703:0:b0:3a5:aefa:68e3 with SMTP id
 t3-20020a1c7703000000b003a5aefa68e3mr12403387wmi.158.1662416884077; 
 Mon, 05 Sep 2022 15:28:04 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm6476190wrp.96.2022.09.05.15.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 15:28:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/ssd130x: Replace simple display helpers with the
 atomic helpers
Date: Tue,  6 Sep 2022 00:27:59 +0200
Message-Id: <20220905222759.2597186-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The simple display pipeline is a set of helpers that can be used by DRM
drivers to avoid dealing with all the needed components and just define
a few functions to operate a simple display device with one full-screen
scanout buffer feeding a single output.

But it is arguable that this provides the correct level of abstraction
for simple drivers, and recently some have been ported from using these
simple display helpers to use the regular atomic helpers instead.

The rationale for this is that the simple display pipeline helpers don't
hide that much of the DRM complexity, while adding an indirection layer
that conflates the concepts of CRTCs and planes. This makes the helpers
less flexible and harder to be reused among different graphics drivers.

Also, for simple drivers, using the full atomic helpers doesn't require
a lot of additional code. So adding a simple display pipeline layer may
not be worth it.

For these reasons, let's follow that trend and make ssd130x a plain DRM
driver that creates its own primary plane, CRTC, enconder and connector.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

Changes in v2:
- Remove plane_state->fb check in struct drm_plane_helper_funcs .atomic_update
  callback function (Thomas Zimmermann).
- Move ssd130x_init() call to struct drm_crtc_funcs .reset callback instead of
  having in struct drm_encoder_helper_funcs .enable_atomic (Thomas Zimmermann).

 drivers/gpu/drm/solomon/ssd130x.c | 260 +++++++++++++++++++++---------
 drivers/gpu/drm/solomon/ssd130x.h |   9 +-
 2 files changed, 189 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index f87f5443e714..79e8e2017c68 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -18,6 +18,7 @@
 #include <linux/pwm.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
@@ -564,61 +565,52 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	return ret;
 }
 
-static int ssd130x_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-					   const struct drm_display_mode *mode)
+static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						     struct drm_atomic_state *new_state)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
 
-	if (mode->hdisplay != ssd130x->mode.hdisplay &&
-	    mode->vdisplay != ssd130x->mode.vdisplay)
-		return MODE_ONE_SIZE;
-
-	if (mode->hdisplay != ssd130x->mode.hdisplay)
-		return MODE_ONE_WIDTH;
-
-	if (mode->vdisplay != ssd130x->mode.vdisplay)
-		return MODE_ONE_HEIGHT;
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
 
-	return MODE_OK;
+	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
 }
 
-static void ssd130x_display_pipe_enable(struct drm_simple_display_pipe *pipe,
-					struct drm_crtc_state *crtc_state,
-					struct drm_plane_state *plane_state)
+static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						       struct drm_atomic_state *old_state)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_device *drm = &ssd130x->drm;
-	int idx, ret;
+	struct drm_device *drm = plane->dev;
+	struct drm_rect src_clip, dst_clip;
+	int idx;
 
-	ret = ssd130x_power_on(ssd130x);
-	if (ret)
+	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
 		return;
 
-	ret = ssd130x_init(ssd130x);
-	if (ret)
-		goto out_power_off;
+	dst_clip = plane_state->dst;
+	if (!drm_rect_intersect(&dst_clip, &src_clip))
+		return;
 
 	if (!drm_dev_enter(drm, &idx))
-		goto out_power_off;
-
-	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &plane_state->dst);
-
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
+		return;
 
-	backlight_enable(ssd130x->bl_dev);
+	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
 
 	drm_dev_exit(idx);
-
-	return;
-out_power_off:
-	ssd130x_power_off(ssd130x);
 }
 
-static void ssd130x_display_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
+							struct drm_atomic_state *old_state)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
-	struct drm_device *drm = &ssd130x->drm;
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	int idx;
 
 	if (!drm_dev_enter(drm, &idx))
@@ -626,56 +618,120 @@ static void ssd130x_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 
 	ssd130x_clear_screen(ssd130x);
 
-	backlight_disable(ssd130x->bl_dev);
+	drm_dev_exit(idx);
+}
 
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
+static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
+	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
+	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
+};
 
-	ssd130x_power_off(ssd130x);
+static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
 
-	drm_dev_exit(idx);
+static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							   const struct drm_display_mode *mode)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->dev);
+
+	if (mode->hdisplay != ssd130x->mode.hdisplay &&
+	    mode->vdisplay != ssd130x->mode.vdisplay)
+		return MODE_ONE_SIZE;
+	else if (mode->hdisplay != ssd130x->mode.hdisplay)
+		return MODE_ONE_WIDTH;
+	else if (mode->vdisplay != ssd130x->mode.vdisplay)
+		return MODE_ONE_HEIGHT;
+
+	return MODE_OK;
 }
 
-static void ssd130x_display_pipe_update(struct drm_simple_display_pipe *pipe,
-					struct drm_plane_state *old_plane_state)
+static int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_state *new_state)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
-	struct drm_plane_state *plane_state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_device *drm = &ssd130x->drm;
-	struct drm_rect src_clip, dst_clip;
-	int idx;
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
+	int ret;
 
-	if (!fb)
-		return;
+	ret = drm_atomic_helper_check_crtc_state(new_crtc_state, false);
+	if (ret)
+		return ret;
 
-	if (!pipe->crtc.state->active)
-		return;
+	return drm_atomic_add_affected_planes(new_state, crtc);
+}
 
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
-		return;
+/*
+ * The CRTC is always enabled. Screen updates are performed by
+ * the primary plane's atomic_update function. Disabling clears
+ * the screen in the primary plane's atomic_disable function.
+ */
+static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
+	.mode_valid = ssd130x_crtc_helper_mode_valid,
+	.atomic_check = ssd130x_crtc_helper_atomic_check,
+};
 
-	dst_clip = plane_state->dst;
-	if (!drm_rect_intersect(&dst_clip, &src_clip))
-		return;
+static void ssd130x_crtc_reset(struct drm_crtc *crtc)
+{
+	struct drm_device *drm = crtc->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 
-	if (!drm_dev_enter(drm, &idx))
+	ssd130x_init(ssd130x);
+
+	drm_atomic_helper_crtc_reset(crtc);
+}
+
+static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
+	.reset = ssd130x_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
+						 struct drm_atomic_state *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	int ret;
+
+	ret = ssd130x_power_on(ssd130x);
+	if (ret)
 		return;
 
-	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
+	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
 
-	drm_dev_exit(idx);
+	backlight_enable(ssd130x->bl_dev);
 }
 
-static const struct drm_simple_display_pipe_funcs ssd130x_pipe_funcs = {
-	.mode_valid = ssd130x_display_pipe_mode_valid,
-	.enable = ssd130x_display_pipe_enable,
-	.disable = ssd130x_display_pipe_disable,
-	.update = ssd130x_display_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
+						  struct drm_atomic_state *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+
+	backlight_disable(ssd130x->bl_dev);
+
+	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
+
+	ssd130x_power_off(ssd130x);
+}
+
+static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs = {
+	.atomic_enable = ssd130x_encoder_helper_atomic_enable,
+	.atomic_disable = ssd130x_encoder_helper_atomic_disable,
+};
+
+static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
-static int ssd130x_connector_get_modes(struct drm_connector *connector)
+static int ssd130x_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
 	struct drm_display_mode *mode;
@@ -695,7 +751,7 @@ static int ssd130x_connector_get_modes(struct drm_connector *connector)
 }
 
 static const struct drm_connector_helper_funcs ssd130x_connector_helper_funcs = {
-	.get_modes = ssd130x_connector_get_modes,
+	.get_modes = ssd130x_connector_helper_get_modes,
 };
 
 static const struct drm_connector_funcs ssd130x_connector_funcs = {
@@ -806,8 +862,16 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 	struct device *dev = ssd130x->dev;
 	struct drm_device *drm = &ssd130x->drm;
 	unsigned long max_width, max_height;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 	int ret;
 
+	/*
+	 * Modesetting
+	 */
+
 	ret = drmm_mode_config_init(drm);
 	if (ret) {
 		dev_err(dev, "DRM mode config init failed: %d\n", ret);
@@ -833,25 +897,65 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 	drm->mode_config.preferred_depth = 32;
 	drm->mode_config.funcs = &ssd130x_mode_config_funcs;
 
-	ret = drm_connector_init(drm, &ssd130x->connector, &ssd130x_connector_funcs,
+	/* Primary plane */
+
+	primary_plane = &ssd130x->primary_plane;
+	ret = drm_universal_plane_init(drm, primary_plane, 0, &ssd130x_primary_plane_funcs,
+				       ssd130x_formats, ARRAY_SIZE(ssd130x_formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		dev_err(dev, "DRM primary plane init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_plane_helper_add(primary_plane, &ssd130x_primary_plane_helper_funcs);
+
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	/* CRTC */
+
+	crtc = &ssd130x->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					&ssd130x_crtc_funcs, NULL);
+	if (ret) {
+		dev_err(dev, "DRM crtc init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &ssd130x_crtc_helper_funcs);
+
+	/* Encoder */
+
+	encoder = &ssd130x->encoder;
+	ret = drm_encoder_init(drm, encoder, &ssd130x_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		dev_err(dev, "DRM encoder init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_encoder_helper_add(encoder, &ssd130x_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* Connector */
+
+	connector = &ssd130x->connector;
+	ret = drm_connector_init(drm, connector, &ssd130x_connector_funcs,
 				 DRM_MODE_CONNECTOR_Unknown);
 	if (ret) {
 		dev_err(dev, "DRM connector init failed: %d\n", ret);
 		return ret;
 	}
 
-	drm_connector_helper_add(&ssd130x->connector, &ssd130x_connector_helper_funcs);
+	drm_connector_helper_add(connector, &ssd130x_connector_helper_funcs);
 
-	ret = drm_simple_display_pipe_init(drm, &ssd130x->pipe, &ssd130x_pipe_funcs,
-					   ssd130x_formats, ARRAY_SIZE(ssd130x_formats),
-					   NULL, &ssd130x->connector);
+	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
-		dev_err(dev, "DRM simple display pipeline init failed: %d\n", ret);
+		dev_err(dev, "DRM attach connector to encoder failed: %d\n", ret);
 		return ret;
 	}
 
-	drm_plane_enable_fb_damage_clips(&ssd130x->pipe.plane);
-
 	drm_mode_config_reset(drm);
 
 	return 0;
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 4c4a84e962e7..03038c1b6476 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -13,8 +13,11 @@
 #ifndef __SSD1307X_H__
 #define __SSD1307X_H__
 
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_plane_helper.h>
 
 #include <linux/regmap.h>
 
@@ -42,8 +45,10 @@ struct ssd130x_deviceinfo {
 struct ssd130x_device {
 	struct drm_device drm;
 	struct device *dev;
-	struct drm_simple_display_pipe pipe;
 	struct drm_display_mode mode;
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector connector;
 	struct i2c_client *client;
 
-- 
2.37.1

