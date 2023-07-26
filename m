Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54607763453
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 12:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3769B10E458;
	Wed, 26 Jul 2023 10:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC5B10E456
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690368903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3wvUr7a8sNlMjkQjrp9y08VnHFKDhRShbNPZvWniXw=;
 b=JWsE/6iaOQZf9H5h44t4HBKry9l1LFExXrPZqycwtMNlK09EgZZe2Mr9ayaCyYPPvUMEWO
 FYUiW5rlUsne8ROXaiD0JklbNK2xoUZUUEMdcrvPOkwBukryeNSL1gqNqU9Gcaa9bs7Ose
 ZQ+FTrdw9Ul3aU4UU5PP5XiZ/TG/Qj8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-w87wMuDTPNyxW8amNH5u6g-1; Wed, 26 Jul 2023 06:55:01 -0400
X-MC-Unique: w87wMuDTPNyxW8amNH5u6g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31779e89e39so59660f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 03:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690368900; x=1690973700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3wvUr7a8sNlMjkQjrp9y08VnHFKDhRShbNPZvWniXw=;
 b=P0k3a9Zm96XtkZuQKMVqFcYj5uCqE7lpNgNfseMrdzfiAn+8CtWIlpk47w0B88ZAof
 AYrgCyZmDRwFKWZnNvxr5cPXf2kLf+OX9V6ezYqdWajhIVZwV/pNo2BtL1iy3Rt/pv6A
 hG4nsLY7Bxn9u1ihA79N2xqXCwF/8ue89D5cVJH6sUdWYXUCzCmJVCUpM7WX+PO6xllj
 Yu+PzydTeRjAZs3AXzJjtPxbOE+vv+MPbIq5a3SYmhjqSGFh1h5Np5PjAv6uGLBK1BoO
 XLTP73wxwKJzWJ6Qy1LkDun7JP92CYV6AlTNUXH7EV/9ke0eo4I2tdxKcW3/yz8wNAXb
 BR8w==
X-Gm-Message-State: ABy/qLbtOJoWarRVZ3MwKoHiByH+AQnVTcLcTjmQQB4MeXa2f+oD5xPs
 MUodXZFIiNKue2X4t2Y/KyiwgsCx6utoi4FPD43r0en4mfOT6JSoitNWe0qv5Tif3I99B+5ATT/
 R2yrN4bR+bLeApzQP+v80bcddylfF
X-Received: by 2002:a5d:6203:0:b0:317:6129:a972 with SMTP id
 y3-20020a5d6203000000b003176129a972mr1150650wru.37.1690368900328; 
 Wed, 26 Jul 2023 03:55:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0atjEk0Mga39JJuleDELysQGmbMHo5TC0mODzKjxONf0i+x+gKsidvIFbvf0aSvtsZw/00w==
X-Received: by 2002:a5d:6203:0:b0:317:6129:a972 with SMTP id
 y3-20020a5d6203000000b003176129a972mr1150644wru.37.1690368900006; 
 Wed, 26 Jul 2023 03:55:00 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020adffe07000000b003176c6e87b1sm4894703wrr.81.2023.07.26.03.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 03:54:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] drm/ssd130x: Allocate buffer in the plane's
 .atomic_check() callback
Date: Wed, 26 Jul 2023 12:54:28 +0200
Message-ID: <20230726105433.389740-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726105433.389740-1-javierm@redhat.com>
References: <20230726105433.389740-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers are not allowed to fail after drm_atomic_helper_swap_state() has
been called and the new atomic state is stored into the current sw state.

Since the struct ssd130x_device .data_array is allocated in the encoder's
.atomic_enable callback, the operation can fail and this is after the new
state has been stored. So it can break an atomic mode settings assumption.

Fix this by having custom helpers to allocate, duplicate and destroy the
plane state, that will take care of allocating and freeing these buffers.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
---

Changes in v5:
- Add collected tags from Maxime and Geert.
- Update commit message to not mention the kernel oops (Geert Uytterhoeven).
- Drop Reported-by and Fixes tags (Geert Uytterhoeven).
- Update comment about buffer and data_array fields (Geert Uytterhoeven).
- Remove superfluous NULL check in ssd130x_fb_blit_rect() (Geert Uytterhoeven).
- Reset .buffer to NULL if .data_array allocation fails (Geert Uytterhoeven).
- Inline buffer alloc/free helper functions (Geert Uytterhoeven).

Changes in v4:
- Move buffers allocation/free to plane .reset/.destroy helpers (Maxime Ripard).

Changes in v3:
- Move the buffers allocation to the plane helper funcs .begin_fb_access
  and the free to .end_fb_access callbacks.
- Always allocate intermediate buffer because is use in ssd130x_clear_screen().
- Don't allocate the buffers as device managed resources.

Changes in v2:
- Move the buffers allocation to .fb_create instead of preventing atomic
  updates for disable planes.
- Don't allocate the intermediate buffer when using the native R1 format.
- Allocate buffers as device managed resources.

 drivers/gpu/drm/solomon/ssd130x.c | 158 +++++++++++++++++++++++-------
 drivers/gpu/drm/solomon/ssd130x.h |   3 -
 2 files changed, 121 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 51472a184ef9..d2f8dd6a6347 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -141,6 +141,19 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
 
+struct ssd130x_plane_state {
+	struct drm_plane_state base;
+	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
+	u8 *buffer;
+	/* Buffer to store pixels in HW format and written to the panel */
+	u8 *data_array;
+};
+
+static inline struct ssd130x_plane_state *to_ssd130x_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct ssd130x_plane_state, base);
+}
+
 static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 {
 	return container_of(drm, struct ssd130x_device, drm);
@@ -434,12 +447,14 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
 }
 
-static int ssd130x_update_rect(struct ssd130x_device *ssd130x, struct drm_rect *rect)
+static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
+			       struct ssd130x_plane_state *ssd130x_state,
+			       struct drm_rect *rect)
 {
 	unsigned int x = rect->x1;
 	unsigned int y = rect->y1;
-	u8 *buf = ssd130x->buffer;
-	u8 *data_array = ssd130x->data_array;
+	u8 *buf = ssd130x_state->buffer;
+	u8 *data_array = ssd130x_state->data_array;
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
@@ -535,7 +550,8 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, struct drm_rect *
 	return ret;
 }
 
-static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
+static void ssd130x_clear_screen(struct ssd130x_device *ssd130x,
+				 struct ssd130x_plane_state *ssd130x_state)
 {
 	struct drm_rect fullscreen = {
 		.x1 = 0,
@@ -544,21 +560,21 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 		.y2 = ssd130x->height,
 	};
 
-	ssd130x_update_rect(ssd130x, &fullscreen);
+	ssd130x_update_rect(ssd130x, ssd130x_state, &fullscreen);
 }
 
-static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
+static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
+				const struct iosys_map *vmap,
 				struct drm_rect *rect)
 {
+	struct drm_framebuffer *fb = state->fb;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	unsigned int page_height = ssd130x->device_info->page_height;
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
+	u8 *buf = ssd130x_state->buffer;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
-	u8 *buf = ssd130x->buffer;
-
-	if (!buf)
-		return 0;
 
 	/* Align y to display page boundaries */
 	rect->y1 = round_down(rect->y1, page_height);
@@ -575,11 +591,49 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	ssd130x_update_rect(ssd130x, rect);
+	ssd130x_update_rect(ssd130x, ssd130x_state, rect);
 
 	return ret;
 }
 
+static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						     struct drm_atomic_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
+	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	const struct drm_format_info *fi;
+	unsigned int pitch;
+	int ret;
+
+	ret = drm_plane_helper_atomic_check(plane, state);
+	if (ret)
+		return ret;
+
+	fi = drm_format_info(DRM_FORMAT_R1);
+	if (!fi)
+		return -EINVAL;
+
+	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
+	if (!ssd130x_state->buffer)
+		return -ENOMEM;
+
+	ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
+	if (!ssd130x_state->data_array) {
+		kfree(ssd130x_state->buffer);
+		/* Set to prevent a double free in .atomic_destroy_state() */
+		ssd130x_state->buffer = NULL;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						       struct drm_atomic_state *state)
 {
@@ -602,7 +656,7 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
+		ssd130x_fb_blit_rect(plane_state, &shadow_plane_state->data[0], &dst_clip);
 	}
 
 	drm_dev_exit(idx);
@@ -613,19 +667,69 @@ static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane->state);
 	int idx;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	ssd130x_clear_screen(ssd130x);
+	ssd130x_clear_screen(ssd130x, ssd130x_state);
 
 	drm_dev_exit(idx);
 }
 
+/* Called during init to allocate the plane's atomic state. */
+static void ssd130x_primary_plane_reset(struct drm_plane *plane)
+{
+	struct ssd130x_plane_state *ssd130x_state;
+
+	WARN_ON(plane->state);
+
+	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
+	if (!ssd130x_state)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &ssd130x_state->base);
+}
+
+static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct ssd130x_plane_state *old_ssd130x_state;
+	struct ssd130x_plane_state *ssd130x_state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	old_ssd130x_state = to_ssd130x_plane_state(plane->state);
+	ssd130x_state = kmemdup(old_ssd130x_state, sizeof(*ssd130x_state), GFP_KERNEL);
+	if (!ssd130x_state)
+		return NULL;
+
+	/* The buffers are not duplicated and are allocated in .atomic_check */
+	ssd130x_state->buffer = NULL;
+	ssd130x_state->data_array = NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &ssd130x_state->base);
+
+	return &ssd130x_state->base;
+}
+
+static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
+						struct drm_plane_state *state)
+{
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
+
+	kfree(ssd130x_state->data_array);
+	kfree(ssd130x_state->buffer);
+
+	__drm_atomic_helper_plane_destroy_state(&ssd130x_state->base);
+
+	kfree(ssd130x_state);
+}
+
 static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = drm_plane_helper_atomic_check,
+	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
 	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
 	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
 };
@@ -633,6 +737,9 @@ static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs =
 static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
+	.reset = ssd130x_primary_plane_reset,
+	.atomic_duplicate_state = ssd130x_primary_plane_duplicate_state,
+	.atomic_destroy_state = ssd130x_primary_plane_destroy_state,
 	.destroy = drm_plane_cleanup,
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
@@ -677,10 +784,6 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 {
 	struct drm_device *drm = encoder->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
-	const struct drm_format_info *fi;
-	unsigned int pitch;
 	int ret;
 
 	ret = ssd130x_power_on(ssd130x);
@@ -691,22 +794,6 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		goto power_off;
 
-	fi = drm_format_info(DRM_FORMAT_R1);
-	if (!fi)
-		goto power_off;
-
-	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
-
-	ssd130x->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
-	if (!ssd130x->buffer)
-		goto power_off;
-
-	ssd130x->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
-	if (!ssd130x->data_array) {
-		kfree(ssd130x->buffer);
-		goto power_off;
-	}
-
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
 
 	backlight_enable(ssd130x->bl_dev);
@@ -728,9 +815,6 @@ static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
 
-	kfree(ssd130x->data_array);
-	kfree(ssd130x->buffer);
-
 	ssd130x_power_off(ssd130x);
 }
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 161588b1cc4d..87968b3e7fb8 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -89,9 +89,6 @@ struct ssd130x_device {
 	u8 col_end;
 	u8 page_start;
 	u8 page_end;
-
-	u8 *buffer;
-	u8 *data_array;
 };
 
 extern const struct ssd130x_deviceinfo ssd130x_variants[];
-- 
2.41.0

