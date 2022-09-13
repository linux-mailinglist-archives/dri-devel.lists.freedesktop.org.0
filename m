Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04565B6AC0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 11:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9D410E699;
	Tue, 13 Sep 2022 09:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0D510E698
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663061640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K9tJ9sQhd6nvPP4b0Ne81nbqJQEp2juSZk9CIj/eGcA=;
 b=JbxbUWqZIT3mTP3J0o5P6EdRtL19+uiBadHl9RGOlcQGbIXoG+T+6AQljAiMv/XexqW1oY
 Gg2SZEt6l4pNqGMI3EHaE3/nn4hRejcFYCCsxzmSuYKIe8MA80PcSYJVwbnKkGKAADzCMX
 gTpg2zk72W3GI74iA6TK2fDyEq3z25k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-6JA1KG_ENmCwutL1d2xZag-1; Tue, 13 Sep 2022 05:33:59 -0400
X-MC-Unique: 6JA1KG_ENmCwutL1d2xZag-1
Received: by mail-wm1-f71.google.com with SMTP id
 c188-20020a1c35c5000000b003b2dee5fb58so6228440wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 02:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=K9tJ9sQhd6nvPP4b0Ne81nbqJQEp2juSZk9CIj/eGcA=;
 b=6xx+wLuJAejClPPQivISYHRBbd9O+ueSaCuhlu9hg+0km+v5GpJcZ6n41eistbHZHj
 wYzlzgLDk3hhhDknu1gbjSDaJSM7lVUwhALzelE1e49rYatbPI5vh7TLCHJrTbu1JzWf
 9/dejlE/k0Xab8/G+0gIKMScmo2OBxLAChEFo19ALqLfK0LRMYH286oLimEo+OGL+LCM
 sT6dKQ2wJrj7Dy8pxN9e8EuzOQNb28XfQHfdr9gx69KWzoC6aPOfWjw5qS4DCFBxq3Fr
 3ca8AdFgU3inNZe10KVYiWvIOzwAX15Xt0c0+EhSO9B8O1iRwt9/oO1Q06MwgWpWjLsc
 /HZg==
X-Gm-Message-State: ACgBeo3Wz0tMz3t+44gUdxH6MHE3+n6hBlbCaclqYSZqqGhL3YTLcMVF
 PFkm5FX0zMCu4afTaEdeX7v2pUImor5uNnfW3+sFzEpGpou0hyK5V7veTK01Is1LgL/KLtJyTSz
 xD8VTJg40Tga1VrkiCk5UDwLq00OE
X-Received: by 2002:a5d:6d50:0:b0:225:89b2:a03a with SMTP id
 k16-20020a5d6d50000000b0022589b2a03amr18613868wri.51.1663061637201; 
 Tue, 13 Sep 2022 02:33:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4eOBQBD+/cVY3kS1nmoR6/Cp/Tyj03Enj/AhHo+tzC7Qbs4FUAC9zmUaM42HPjmCbgZdD4Uw==
X-Received: by 2002:a5d:6d50:0:b0:225:89b2:a03a with SMTP id
 k16-20020a5d6d50000000b0022589b2a03amr18613853wri.51.1663061636997; 
 Tue, 13 Sep 2022 02:33:56 -0700 (PDT)
Received: from minerva.access.network ([185.122.133.20])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b0021e4829d359sm9752455wrx.39.2022.09.13.02.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 02:33:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
Date: Tue, 13 Sep 2022 11:33:39 +0200
Message-Id: <20220913093339.106625-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provides a default plane state check handler for primary planes that are a
fullscreen scanout buffer and whose state scale and position can't change.

There are some drivers that duplicate this logic in their helpers, such as
simpledrm and ssd130x. Factor out this common code into a plane helper and
make drivers use it.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Fix `new_state` field comment (Ville Syrjälä).
- Rename `new_state` to just `state` (Ville Syrjälä).

 drivers/gpu/drm/drm_plane_helper.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c  | 18 +-----------------
 drivers/gpu/drm/tiny/simpledrm.c   | 25 +------------------------
 include/drm/drm_plane_helper.h     |  1 +
 4 files changed, 31 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index c7785967f5bf..2165390863f4 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -278,3 +278,31 @@ void drm_plane_helper_destroy(struct drm_plane *plane)
 	kfree(plane);
 }
 EXPORT_SYMBOL(drm_plane_helper_destroy);
+
+/**
+ * drm_plane_helper_atomic_check() - Helper to check primary planes states
+ * @plane: plane to check
+ * @state: atomic state object
+ *
+ * Provides a default plane state check handler for primary planes whose atomic
+ * state scale and position is not expected to change because the primary plane
+ * is always a fullscreen scanout buffer.
+ *
+ * RETURNS:
+ * Zero on success, or an errno code otherwise.
+ */
+int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+EXPORT_SYMBOL(drm_plane_helper_atomic_check);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 79e8e2017c68..28cf9c87f86d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -565,22 +565,6 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	return ret;
 }
 
-static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						     struct drm_atomic_state *new_state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
-	struct drm_crtc *new_crtc = new_plane_state->crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
-
-	if (new_crtc)
-		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
-
-	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						   DRM_PLANE_NO_SCALING,
-						   DRM_PLANE_NO_SCALING,
-						   false, false);
-}
-
 static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						       struct drm_atomic_state *old_state)
 {
@@ -623,7 +607,7 @@ static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 
 static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
+	.atomic_check = drm_plane_helper_atomic_check,
 	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
 	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
 };
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 777ccd250871..ea5b3239a659 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -469,29 +469,6 @@ static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
-static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						       struct drm_atomic_state *new_state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
-	struct drm_crtc *new_crtc = new_plane_state->crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
-	int ret;
-
-	if (new_crtc)
-		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
-
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	if (ret)
-		return ret;
-	else if (!new_plane_state->visible)
-		return 0;
-
-	return 0;
-}
-
 static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 							 struct drm_atomic_state *old_state)
 {
@@ -543,7 +520,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 
 static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = simpledrm_primary_plane_helper_atomic_check,
+	.atomic_check = drm_plane_helper_atomic_check,
 	.atomic_update = simpledrm_primary_plane_helper_atomic_update,
 	.atomic_disable = simpledrm_primary_plane_helper_atomic_disable,
 };
diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index 1781fab24dd6..7760b27b0323 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -41,5 +41,6 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
 int drm_plane_helper_disable_primary(struct drm_plane *plane,
 				     struct drm_modeset_acquire_ctx *ctx);
 void drm_plane_helper_destroy(struct drm_plane *plane);
+int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state);
 
 #endif
-- 
2.37.1

