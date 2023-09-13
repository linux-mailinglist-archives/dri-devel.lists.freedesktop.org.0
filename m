Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5970E79DF64
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 07:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC3F10E24B;
	Wed, 13 Sep 2023 05:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38FA10E24B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 05:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694582987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4Vi9gfyH7HmX8XDIkP0nm2cnVk3gGqThLeUs4kUh4/Y=;
 b=Rq5DfExNl4vnbRdWTzmDnRjwo/Y77ih0ZTWK0LIEfQBetUN0lkSvQhMLbSxNPTGNzspJvs
 1TC2uLsL4SQ77X3dZ4Rohuc9mvEUM06QLTOx3XedhBEc0NJV3Mn22tsKKN60sUnH609g/b
 ZA3l+xEAFcFgjiatrOqcpMVVmtL+tx0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-mmQ4gvBmPZ-EmmwqrgOmDQ-1; Wed, 13 Sep 2023 01:29:43 -0400
X-MC-Unique: mmQ4gvBmPZ-EmmwqrgOmDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4020645b2a2so46125995e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 22:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694582982; x=1695187782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Vi9gfyH7HmX8XDIkP0nm2cnVk3gGqThLeUs4kUh4/Y=;
 b=VN0K0GJHbaAG3yY7+HG87+Pr67NkgccX6nlET2S/73bLLmOvSesvzMvMSs2fWV6g0P
 9NpS8YtdxhfUIjfPw7Ihon+6v2R9LBG7ohk7rXqv+ddjgi7X4R27TNONAyQQZwp41orW
 agt++7SyO4WKShd+O4sLuUj43HEnlPkafzxz/+l/v1Sxh+HqP5Og7pq2gyOImZHebphe
 /tRZBik4QHggNDYMUstnfbcsop5osPBlTHqZOTuSNHvXdizzN8jYv909Bb9hUenoX6Ip
 8Mxo1zwhn7HU9AVIXP2ZMLUPg4LfHkgIHvOawHBliqD0PbiInJGpltd/pLoAR8NdIs/m
 UGcQ==
X-Gm-Message-State: AOJu0YwhnLF3jCXGr6SxNAiujdId+8bRu/uG1/lJKHbew+U3EUJj4KHd
 0Cs588o4yl9I+pY7w7uogB6dWISfGaB43iq6rFGVJVHdAHpmmC8w8Cu8J2NLIn+0z/by0tgHfJt
 +YySaUv5YRuzJRx4OHV1u9HjnYXGl
X-Received: by 2002:a1c:7212:0:b0:401:c636:8f4c with SMTP id
 n18-20020a1c7212000000b00401c6368f4cmr1159650wmc.3.1694582982464; 
 Tue, 12 Sep 2023 22:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBPrqpBFWrM1upDqqQ8JTAFRsOV+DxccVfhsV98ND78rArdbUvqZBQpC+loiTKDgUL+TD16A==
X-Received: by 2002:a1c:7212:0:b0:401:c636:8f4c with SMTP id
 n18-20020a1c7212000000b00401c6368f4cmr1159636wmc.3.1694582982070; 
 Tue, 12 Sep 2023 22:29:42 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o1-20020a5d6841000000b003143b14848dsm14358033wrw.102.2023.09.12.22.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 22:29:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/ssd130x: Store the HW buffer in the driver-private
 CRTC state
Date: Wed, 13 Sep 2023 07:29:25 +0200
Message-ID: <20230913052938.1114651-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
.atomic_check() callback") moved the allocation of the intermediate and
HW buffers from the encoder's .atomic_enable callback, to the plane's
.atomic_check callback.

This was suggested by Maxime Ripard, because drivers aren't allowed to
fail after the drm_atomic_helper_swap_state() function has been called.

And the encoder's .atomic_enable happens after the new atomic state has
been swapped, so allocations (that can fail) shouldn't be done there.

But the HW buffer isn't really tied to the plane's state. It has a fixed
size that only depends on the (also fixed) display resolution defined in
the Device Tree Blob.

That buffer can be considered part of the CRTC state, and for this reason
makes more sense to do its allocation in the CRTC .atomic_check callback.

The other allocated buffer (used to store a conversion from the emulated
XR24 format to the native R1 format) is part of the plane's state, since
it will be optional once the driver supports R1 and allows user-space to
set that pixel format.

So let's keep the allocation for it in the plane's .atomic_check callback,
this can't be moved to the CRTC's .atomic_check because changing a format
does not trigger a CRTC mode set.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/dri-devel/CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v4:
- Fix a build warning reported by the robot (missing static in helper function).

Changes in v3:
- Call drm_atomic_get_crtc_state() in the plane's .atomic_check (Maxime Ripard).

Changes in v2:
- Drop RFC prefix.
- Fix typo in commit message (Thomas Zimmermann).
- Store the HW buffer in the driver's private CRTC state (Thomas Zimmermann).
- Just use kmalloc() kcalloc() when allocating buffers (Thomas Zimmermann).
- Keep the allocation of the intermediate buffer in the plane's .atomic_check

 drivers/gpu/drm/solomon/ssd130x.c | 153 +++++++++++++++++++++++-------
 1 file changed, 118 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 3b4dde09538a..8ab02724f65f 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -141,14 +141,23 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
 
+struct ssd130x_crtc_state {
+	struct drm_crtc_state base;
+	/* Buffer to store pixels in HW format and written to the panel */
+	u8 *data_array;
+};
+
 struct ssd130x_plane_state {
 	struct drm_shadow_plane_state base;
 	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
 	u8 *buffer;
-	/* Buffer to store pixels in HW format and written to the panel */
-	u8 *data_array;
 };
 
+static inline struct ssd130x_crtc_state *to_ssd130x_crtc_state(struct drm_crtc_state *state)
+{
+	return container_of(state, struct ssd130x_crtc_state, base);
+}
+
 static inline struct ssd130x_plane_state *to_ssd130x_plane_state(struct drm_plane_state *state)
 {
 	return container_of(state, struct ssd130x_plane_state, base.base);
@@ -448,13 +457,11 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 }
 
 static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
-			       struct ssd130x_plane_state *ssd130x_state,
-			       struct drm_rect *rect)
+			       struct drm_rect *rect, u8 *buf,
+			       u8 *data_array)
 {
 	unsigned int x = rect->x1;
 	unsigned int y = rect->y1;
-	u8 *buf = ssd130x_state->buffer;
-	u8 *data_array = ssd130x_state->data_array;
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
@@ -550,12 +557,10 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	return ret;
 }
 
-static void ssd130x_clear_screen(struct ssd130x_device *ssd130x,
-				 struct ssd130x_plane_state *ssd130x_state)
+static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
 	unsigned int page_height = ssd130x->device_info->page_height;
 	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
-	u8 *data_array = ssd130x_state->data_array;
 	unsigned int width = ssd130x->width;
 	int ret, i;
 
@@ -594,15 +599,13 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x,
 	}
 }
 
-static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
+static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
-				struct drm_rect *rect)
+				struct drm_rect *rect,
+				u8 *buf, u8 *data_array)
 {
-	struct drm_framebuffer *fb = state->fb;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	unsigned int page_height = ssd130x->device_info->page_height;
-	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
-	u8 *buf = ssd130x_state->buffer;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
@@ -622,7 +625,7 @@ static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	ssd130x_update_rect(ssd130x, ssd130x_state, rect);
+	ssd130x_update_rect(ssd130x, rect, buf, data_array);
 
 	return ret;
 }
@@ -634,12 +637,19 @@ static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state;
 	const struct drm_format_info *fi;
 	unsigned int pitch;
 	int ret;
 
+	if (!crtc)
+		return -EINVAL;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
 	ret = drm_plane_helper_atomic_check(plane, state);
 	if (ret)
 		return ret;
@@ -654,14 +664,6 @@ static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	if (!ssd130x_state->buffer)
 		return -ENOMEM;
 
-	ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
-	if (!ssd130x_state->data_array) {
-		kfree(ssd130x_state->buffer);
-		/* Set to prevent a double free in .atomic_destroy_state() */
-		ssd130x_state->buffer = NULL;
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
@@ -671,6 +673,10 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	struct ssd130x_crtc_state *ssd130x_crtc_state =  to_ssd130x_crtc_state(crtc_state);
+	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_device *drm = plane->dev;
 	struct drm_rect dst_clip;
@@ -687,7 +693,9 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		ssd130x_fb_blit_rect(plane_state, &shadow_plane_state->data[0], &dst_clip);
+		ssd130x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
+				     ssd130x_plane_state->buffer,
+				     ssd130x_crtc_state->data_array);
 	}
 
 	drm_dev_exit(idx);
@@ -698,13 +706,21 @@ static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
-	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane->state);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+	struct ssd130x_crtc_state *ssd130x_crtc_state;
 	int idx;
 
+	if (!plane_state->crtc)
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	ssd130x_crtc_state = to_ssd130x_crtc_state(crtc_state);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	ssd130x_clear_screen(ssd130x, ssd130x_state);
+	ssd130x_clear_screen(ssd130x, ssd130x_crtc_state->data_array);
 
 	drm_dev_exit(idx);
 }
@@ -737,9 +753,8 @@ static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_
 	if (!ssd130x_state)
 		return NULL;
 
-	/* The buffers are not duplicated and are allocated in .atomic_check */
+	/* The buffer is not duplicated and is allocated in .atomic_check */
 	ssd130x_state->buffer = NULL;
-	ssd130x_state->data_array = NULL;
 
 	new_shadow_plane_state = &ssd130x_state->base;
 
@@ -753,7 +768,6 @@ static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
 {
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
 
-	kfree(ssd130x_state->data_array);
 	kfree(ssd130x_state->buffer);
 
 	__drm_gem_destroy_shadow_plane_state(&ssd130x_state->base);
@@ -793,6 +807,75 @@ static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc
 	return MODE_OK;
 }
 
+static int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
+	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	int ret;
+
+	ret = drm_crtc_helper_atomic_check(crtc, state);
+	if (ret)
+		return ret;
+
+	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	if (!ssd130x_state->data_array)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/* Called during init to allocate the CRTC's atomic state. */
+static void ssd130x_crtc_reset(struct drm_crtc *crtc)
+{
+	struct ssd130x_crtc_state *ssd130x_state;
+
+	WARN_ON(crtc->state);
+
+	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
+	if (!ssd130x_state)
+		return;
+
+	__drm_atomic_helper_crtc_reset(crtc, &ssd130x_state->base);
+}
+
+static struct drm_crtc_state *ssd130x_crtc_duplicate_state(struct drm_crtc *crtc)
+{
+	struct ssd130x_crtc_state *old_ssd130x_state;
+	struct ssd130x_crtc_state *ssd130x_state;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	old_ssd130x_state = to_ssd130x_crtc_state(crtc->state);
+	ssd130x_state = kmemdup(old_ssd130x_state, sizeof(*ssd130x_state), GFP_KERNEL);
+	if (!ssd130x_state)
+		return NULL;
+
+	/* The buffer is not duplicated and is allocated in .atomic_check */
+	ssd130x_state->data_array = NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &ssd130x_state->base);
+
+	return &ssd130x_state->base;
+}
+
+static void ssd130x_crtc_destroy_state(struct drm_crtc *crtc,
+				       struct drm_crtc_state *state)
+{
+	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(state);
+
+	kfree(ssd130x_state->data_array);
+
+	__drm_atomic_helper_crtc_destroy_state(state);
+
+	kfree(ssd130x_state);
+}
+
 /*
  * The CRTC is always enabled. Screen updates are performed by
  * the primary plane's atomic_update function. Disabling clears
@@ -800,16 +883,16 @@ static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc
  */
 static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
 	.mode_valid = ssd130x_crtc_helper_mode_valid,
-	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_check = ssd130x_crtc_helper_atomic_check,
 };
 
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.reset = ssd130x_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.atomic_duplicate_state = ssd130x_crtc_duplicate_state,
+	.atomic_destroy_state = ssd130x_crtc_destroy_state,
 };
 
 static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
-- 
2.41.0

