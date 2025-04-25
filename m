Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B81A9BEAF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 08:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684889C68;
	Fri, 25 Apr 2025 06:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f9HYXIXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B0F89C68
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 06:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745562786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d285x5hlvi/CsClG0dx/mghTairCHhYodtu6zCS6z7I=;
 b=f9HYXIXbFZbVLZqnjWFREF+zvDegcXlxiVWSmoJpBanY4HiAhu3d2Sh1JL08c+vtZZJ1WQ
 Sj1I9a8iS9EDkR/b1XKFKpy4zfI7MeQpV7FLeECmI8upr8ZjqN8CGXLf3snSUSDZskWpPU
 5NC/Jqnhfdt19ijy09xfUkcLcZ0xQcA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-JWhHmmIqPNyEaYPPOfHepw-1; Fri, 25 Apr 2025 02:33:04 -0400
X-MC-Unique: JWhHmmIqPNyEaYPPOfHepw-1
X-Mimecast-MFC-AGG-ID: JWhHmmIqPNyEaYPPOfHepw_1745562783
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-736d64c5e16so1585940b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 23:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745562783; x=1746167583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d285x5hlvi/CsClG0dx/mghTairCHhYodtu6zCS6z7I=;
 b=N1nsL0eeG3sBEeY8aEPp7kpzxTyUEPl11v/5Rx6Za176etCIcy3LRRyIQVfr/bWYXt
 yAzVnP7sDT5Ad6UpHhn9dcGW2ZOadX1Nmm5A8TTZyji91FTCkAFCkTh9Gmhwkf/Fk/py
 NSEKHxcidlAi7ZF9l+OAoKfUgfwtZQKkgh+cwGZlLA/sCMNql6Z0Y5DK0ZEh6Dy+hj7Y
 IQI5cEffNgoCzXzTKsdEuJXR+xr8Ukcnw4S2bk+0JImnArJakQrwGljwJEIxwHn5Ka9t
 3/KgHYeUH3g3thHSwstcGMimWmIYR3UEKO+Zfn87eecC2y+/sy8ONkx43tSMnVOqcTgF
 SHnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+orqdJNOw2dJo8XEAmUKtejkQK3c6MqXf+gl2os3Gi09WzxDswFzASDUeQNt7bJOrEz9XTNwcDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtbEIid9B4ls+DOVGrd7MftVzHvhZF8iUHrCVWE1jViy2to6xe
 WpRan7MyR/Pbw4XL5DE02X8gmEyoaiktepB7zPSuJlj2/nrs+AUScjUp9YtbfPrBL/SLJMuFqru
 dM5JSwS20XXWD/roCK3YB2bAXpLD6kkT+wP6AThEjHEvTo106f+CuzdIQcFRGszpgUw==
X-Gm-Gg: ASbGncs7SXFo8JiAR8NApVO4AhGGqWTE4F2TrKwuGdYXnRSb9pTYs6MhhIrMP+9v92m
 tZY4xK6+XDOwVoZtFOIfuywmKvkdUUbh78scT1908ExGLRA5tgwyCrM2m8J2sXWMy8a1ErePVvB
 un13HmuWoeiA6W3XtZv0X6KOiH+k+qWuHNMhHg/KaNMcMZQcgn8/K09CV0IXgdOHHGI1Urc62dR
 WEdatRrEkgiwbNrSdIiAUcfW15ildlt/91Vdj+OMUf1uODsljT1GF/JzB/9n5DbOw1zMS9Vubqf
 xz4KNvdS941O
X-Received: by 2002:a05:6a20:3d8d:b0:1f5:8de8:3b1a with SMTP id
 adf61e73a8af0-2045b6e73dfmr1500686637.13.1745562782828; 
 Thu, 24 Apr 2025 23:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF5L5iQamY7B+V8Yg2guhT+fTSVr2uNb9/ZqVN6Z1cZ1CgRQloJBDOC8O5wm3k/XZJI+f1Gw==
X-Received: by 2002:a05:6a20:3d8d:b0:1f5:8de8:3b1a with SMTP id
 adf61e73a8af0-2045b6e73dfmr1500658637.13.1745562782456; 
 Thu, 24 Apr 2025 23:33:02 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f8597f5csm2211261a12.43.2025.04.24.23.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 23:33:01 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH drm-next v2] drm/hyperv: Replace simple-KMS with regular
 atomic helpers
Date: Fri, 25 Apr 2025 15:32:32 +0900
Message-ID: <20250425063234.757344-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iaCvNIcA3GzcA5EF-oVJKdvM0Lg7AjxpMkHVFptlNIE_1745562783
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop simple-KMS in favor of regular atomic helpers to make the code more
modular. The simple-KMS helper mix up plane and CRTC state, so it is
obsolete and should go away [1]. Since it just split the simple-pipe
functions into per-plane and per-CRTC, no functional changes is
expected.

[1] https://lore.kernel.org/lkml/dae5089d-e214-4518-b927-5c4149babad8@suse.de/

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>

---
v2:
- Remove hyperv_crtc_helper_mode_valid
- Remove hyperv_format_mod_supported
- Call helper_add after {plane,crtc}_init
- Move drm_plane_enable_fb_damage_clips to a place close to plane init
- Move hyperv_conn_init() into hyperv_pipe_init
- Remove hyperv_blit_to_vram_fullscreen
- Remove format check
- Replace hyperv_crtc_helper_atomic_check to drm_crtc_helper_atomic_check

v1:
https://lore.kernel.org/all/20250420121945.573915-1-ryasuoka@redhat.com/

 drivers/gpu/drm/hyperv/hyperv_drm.h         |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 159 +++++++++++++-------
 2 files changed, 107 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
index d2d8582b36df..9e776112c03e 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm.h
+++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
@@ -11,7 +11,9 @@
 struct hyperv_drm_device {
 	/* drm */
 	struct drm_device dev;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector connector;
 
 	/* mode */
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 6c6b57298797..374f8464f5bc 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -5,6 +5,8 @@
 
 #include <linux/hyperv.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
@@ -15,7 +17,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_plane.h>
 
 #include "hyperv_drm.h"
 
@@ -38,18 +40,6 @@ static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
 	return 0;
 }
 
-static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb,
-					  const struct iosys_map *map)
-{
-	struct drm_rect fullscreen = {
-		.x1 = 0,
-		.x2 = fb->width,
-		.y1 = 0,
-		.y2 = fb->height,
-	};
-	return hyperv_blit_to_vram_rect(fb, map, &fullscreen);
-}
-
 static int hyperv_connector_get_modes(struct drm_connector *connector)
 {
 	struct hyperv_drm_device *hv = to_hv(connector->dev);
@@ -98,30 +88,71 @@ static int hyperv_check_size(struct hyperv_drm_device *hv, int w, int h,
 	return 0;
 }
 
-static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_plane_state *plane_state)
+static const uint32_t hyperv_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const uint64_t hyperv_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct hyperv_drm_device *hv = to_hv(crtc->dev);
+	struct drm_plane *plane = &hv->plane;
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_crtc_state *crtc_state = crtc->state;
 
 	hyperv_hide_hw_ptr(hv->hdev);
 	hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
 				crtc_state->mode.hdisplay,
 				crtc_state->mode.vdisplay,
 				plane_state->fb->pitches[0]);
-	hyperv_blit_to_vram_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
 }
 
-static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
-			     struct drm_plane_state *plane_state,
-			     struct drm_crtc_state *crtc_state)
+static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_state *state)
+{ }
+
+static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
+	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_enable = hyperv_crtc_helper_atomic_enable,
+	.atomic_disable = hyperv_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs hyperv_crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static int hyperv_plane_atomic_check(struct drm_plane *plane,
+				     struct drm_atomic_state *state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct hyperv_drm_device *hv = to_hv(plane->dev);
 	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
 
-	if (fb->format->format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible)
+		return 0;
 
 	if (fb->pitches[0] * fb->height > hv->fb_size) {
 		drm_err(&hv->dev, "fb size requested by %s for %dX%d (pitch %d) greater than %ld\n",
@@ -132,53 +163,77 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *old_state)
+static void hyperv_plane_atomic_update(struct drm_plane *plane,
+						      struct drm_atomic_state *old_state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
-	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(old_state, plane);
+	struct hyperv_drm_device *hv = to_hv(plane->dev);
+	struct drm_plane_state *state = plane->state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect)) {
+	if (drm_atomic_helper_damage_merged(old_pstate, state, &rect)) {
 		hyperv_blit_to_vram_rect(state->fb, &shadow_plane_state->data[0], &rect);
 		hyperv_update_dirt(hv->hdev, &rect);
 	}
 }
 
-static const struct drm_simple_display_pipe_funcs hyperv_pipe_funcs = {
-	.enable	= hyperv_pipe_enable,
-	.check = hyperv_pipe_check,
-	.update	= hyperv_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = hyperv_plane_atomic_check,
+	.atomic_update = hyperv_plane_atomic_update,
 };
 
-static const uint32_t hyperv_formats[] = {
-	DRM_FORMAT_XRGB8888,
+static const struct drm_plane_funcs hyperv_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
-static const uint64_t hyperv_modifiers[] = {
-	DRM_FORMAT_MOD_LINEAR,
-	DRM_FORMAT_MOD_INVALID
+static const struct drm_encoder_funcs hyperv_drm_simple_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static inline int hyperv_pipe_init(struct hyperv_drm_device *hv)
 {
+	struct drm_device *dev = &hv->dev;
+	struct drm_encoder *encoder = &hv->encoder;
+	struct drm_plane *plane = &hv->plane;
+	struct drm_crtc *crtc = &hv->crtc;
+	struct drm_connector *connector = &hv->connector;
 	int ret;
 
-	ret = drm_simple_display_pipe_init(&hv->dev,
-					   &hv->pipe,
-					   &hyperv_pipe_funcs,
-					   hyperv_formats,
-					   ARRAY_SIZE(hyperv_formats),
-					   hyperv_modifiers,
-					   &hv->connector);
+	ret = drm_universal_plane_init(dev, plane, 0,
+				       &hyperv_plane_funcs,
+				       hyperv_formats, ARRAY_SIZE(hyperv_formats),
+				       hyperv_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &hyperv_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, plane, NULL,
+					&hyperv_crtc_funcs, NULL);
 	if (ret)
 		return ret;
+	drm_crtc_helper_add(crtc, &hyperv_crtc_helper_funcs);
 
-	drm_plane_enable_fb_damage_clips(&hv->pipe.plane);
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder,
+			       &hyperv_drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
 
-	return 0;
+	ret = hyperv_conn_init(hv);
+	if (ret) {
+		drm_err(dev, "Failed to initialized connector.\n");
+		return ret;
+	}
+
+	return drm_connector_attach_encoder(connector, encoder);
 }
 
 static enum drm_mode_status
@@ -221,12 +276,6 @@ int hyperv_mode_config_init(struct hyperv_drm_device *hv)
 
 	dev->mode_config.funcs = &hyperv_mode_config_funcs;
 
-	ret = hyperv_conn_init(hv);
-	if (ret) {
-		drm_err(dev, "Failed to initialized connector.\n");
-		return ret;
-	}
-
 	ret = hyperv_pipe_init(hv);
 	if (ret) {
 		drm_err(dev, "Failed to initialized pipe.\n");

base-commit: b60301774a8fe6c30b14a95104ec099290a2e904
-- 
2.49.0

