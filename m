Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D29765589
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B65410E58E;
	Thu, 27 Jul 2023 14:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDDF10E58E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690466700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G2DWn0DKp8//6UIeLtFfeDcJfrBuTBNRBy0cXTadnVg=;
 b=cb340H+RNEuVBfHGsEWdRjDv9gvQNgsvkbkkkNvblM7NrL+FuEUpoyzAYiKjgc2giErDTh
 zMcFtA0QDJIOg/7M42EsfFuZl3DGvJGkfKhuU9wE8dcbdpfyKuw9TXJdLRFMs+IFSiGfuw
 3yJ9G/n6sUecLR9L7GuFa0JK0+l1I+U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-6gh3miAZN6qmlKjjpiI-nw-1; Thu, 27 Jul 2023 10:04:58 -0400
X-MC-Unique: 6gh3miAZN6qmlKjjpiI-nw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31774e023d6so566445f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690466697; x=1691071497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G2DWn0DKp8//6UIeLtFfeDcJfrBuTBNRBy0cXTadnVg=;
 b=ACHT9BkDvHfk6a8wdMxsVbiBj++IOns0k0aoD5snopuHRUsEw1eg59NWPbiSu6AHqA
 3t9E5bYAp20Wl2Gh76UQIZFstDFpAx7DOplvHS3AT97JI8/XPRIUmujfrthz11g+oD6b
 3YmFHMcpurr70BhnxayrGwUoO7WwDmUuaVUiD3wVbToorU6vFWkzOxFpHD6z49sourAO
 K0FfLeqEjLGh/M/fOb78R8Me9AHv5sFX4RH+reedgBoRnIQNnsriUNYC6vkjJ/Lr0saQ
 ZU4HlwIiD2m3Wma+KGJstHAy08EH4VtrkTJ+1rFtu+GjZKpbkL1x0xHicjnZdvLFCTSu
 Na2g==
X-Gm-Message-State: ABy/qLaOyf0A0q5ABURYlOhfwxZLRtiHEAvHrG1SQ7AvZTKHL7pzACg9
 2UgZW+wREd+KzrmTyv5ilSoUu4N9o3LUzOabbrmKqHKAoDYQvB6OytBVdPL8gq1tGe05IyMTsQq
 ZzHs98Xevp3i9/0saaFX0gwbtnOhf
X-Received: by 2002:a05:6000:10c5:b0:314:1fdc:796d with SMTP id
 b5-20020a05600010c500b003141fdc796dmr1552151wrx.70.1690466697423; 
 Thu, 27 Jul 2023 07:04:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGoKzp+/7F3wq28GuRDTjwGfJtXThaYIvpbnYch1t9SBxjGtyBSlxrgK5b73PYNGXg/Dv01sQ==
X-Received: by 2002:a05:6000:10c5:b0:314:1fdc:796d with SMTP id
 b5-20020a05600010c500b003141fdc796dmr1552138wrx.70.1690466697030; 
 Thu, 27 Jul 2023 07:04:57 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020a1c7207000000b003fbb8c7c799sm4754721wmc.30.2023.07.27.07.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:04:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Use shadow-buffer helpers when managing plane's
 state
Date: Thu, 27 Jul 2023 16:04:19 +0200
Message-ID: <20230727140453.577445-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
.atomic_check() callback") moved the buffers allocation to be done in
the primary plane's .atomic_check() callback.

But it missed that since the driver uses a shadow-buffered plane, the
__drm_gem_{reset,duplicate,destroy}_shadow_plane() helper functions
must be used in the struct drm_plane_funcs handlers.

This was missed because the mentioned commit did not remove the macro
DRM_GEM_SHADOW_PLANE_FUNCS, which leads to the custom plane's atomic
state management handlers to not be used.

Fixes: 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's .atomic_check() callback")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index d2f8dd6a6347..971c425340c1 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -142,7 +142,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
 
 struct ssd130x_plane_state {
-	struct drm_plane_state base;
+	struct drm_shadow_plane_state base;
 	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
 	u8 *buffer;
 	/* Buffer to store pixels in HW format and written to the panel */
@@ -151,7 +151,7 @@ struct ssd130x_plane_state {
 
 static inline struct ssd130x_plane_state *to_ssd130x_plane_state(struct drm_plane_state *state)
 {
-	return container_of(state, struct ssd130x_plane_state, base);
+	return container_of(state, struct ssd130x_plane_state, base.base);
 }
 
 static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
@@ -689,11 +689,12 @@ static void ssd130x_primary_plane_reset(struct drm_plane *plane)
 	if (!ssd130x_state)
 		return;
 
-	__drm_atomic_helper_plane_reset(plane, &ssd130x_state->base);
+	__drm_gem_reset_shadow_plane(plane, &ssd130x_state->base);
 }
 
 static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_plane *plane)
 {
+	struct drm_shadow_plane_state *new_shadow_plane_state;
 	struct ssd130x_plane_state *old_ssd130x_state;
 	struct ssd130x_plane_state *ssd130x_state;
 
@@ -709,9 +710,11 @@ static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_
 	ssd130x_state->buffer = NULL;
 	ssd130x_state->data_array = NULL;
 
-	__drm_atomic_helper_plane_duplicate_state(plane, &ssd130x_state->base);
+	new_shadow_plane_state = &ssd130x_state->base;
 
-	return &ssd130x_state->base;
+	 __drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+
+	return &new_shadow_plane_state->base;
 }
 
 static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
@@ -722,7 +725,7 @@ static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
 	kfree(ssd130x_state->data_array);
 	kfree(ssd130x_state->buffer);
 
-	__drm_atomic_helper_plane_destroy_state(&ssd130x_state->base);
+	__drm_gem_destroy_shadow_plane_state(&ssd130x_state->base);
 
 	kfree(ssd130x_state);
 }
@@ -741,7 +744,6 @@ static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
 	.atomic_duplicate_state = ssd130x_primary_plane_duplicate_state,
 	.atomic_destroy_state = ssd130x_primary_plane_destroy_state,
 	.destroy = drm_plane_cleanup,
-	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc,
-- 
2.41.0

