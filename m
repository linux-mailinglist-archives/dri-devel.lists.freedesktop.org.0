Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED95512F8A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 11:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0B110FA2C;
	Thu, 28 Apr 2022 09:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227ED10FA15
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:40:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id a21so4858504edb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiKFX+/k90oOFC+apniz96ro0m17nRp4eCqWQSpHnjA=;
 b=eXNGf8XAmF1kIQoEOtYj6F5liNthBozvhmZ7ZiC9duzZPDlXI311UaY3L+by6OiGRW
 Tl6GaDqNRqlNdfykFmGrNRlZ2RfhNGKd8WoGK+NhJNng9E0CGwFp3MoJtyqu9ZrdQhGC
 cauev3YPtuXA39YcigQO+vzEvVI+xmhbCN8MAkiG3vuKktv5jkdvlc4akLjynkVIhPF9
 HsB4GeqUZS3jhgmd4hqLC20AElKX4hg+MCVcx+POlmpgTx0BwKxI5cRIX31hMpKqTIQ1
 rXx9UF13l1gCT727l9JO5RGWfehaBFtq0M3ymiw/eaMRTjO/yck0ur9KMpoSFez/jr26
 wpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiKFX+/k90oOFC+apniz96ro0m17nRp4eCqWQSpHnjA=;
 b=jVtUMtaLTG+bj3DRXYR8HjIJIq2UixhwZRJ30HwCCjm9iNgNqPNzxAqmRj0DECjUH8
 tNjds5+MJmYba6utZfTUmZ6DGiEaoIjKZIgfxhkTr08LkomXNvw4zmclt/0hTxGXVtJ5
 kdfNUWWUGsmQjrHR6h6oZxqvULWenpG5mHri1frKLUtJVnrQxGU7bDOc0bD0dhSImlfO
 1nKj9t+BZYrcmjfFVWTg9Tcg1woLMilCT2XST9+zdUuulvQOvYrbHVmnztukqIvpm3J3
 fTiyJ3Dm7ZqkrOpTp8XFsbelK6gjXFrOLrleEMRavRqxCYC5KRhulJng/DCGDBEhArCB
 OIEQ==
X-Gm-Message-State: AOAM5325l5UUoB9USA+o0H2MBQZRhBix/tpRIOSybBvfVqr5KFfbq5zr
 uAsW6IIwyVd2hPCTNBR86Hs9+sPICR4=
X-Google-Smtp-Source: ABdhPJy1QhFmd5faD4KJIVvYb5dHtW9Z6cQIrN8fcU1gZC9aeuT/5iZ3thx9WjQ52povDrsPpcQNnA==
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr35488555edv.94.1651138818317; 
 Thu, 28 Apr 2022 02:40:18 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a0564020f1700b0042617ba6382sm1212459eda.12.2022.04.28.02.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 02:40:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: handle kernel fences in drm_gem_plane_helper_prepare_fb
 v2
Date: Thu, 28 Apr 2022 11:40:16 +0200
Message-Id: <20220428094016.1401-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_plane_helper_prepare_fb() was using
drm_atomic_set_fence_for_plane() which ignores all implicit fences when an
explicit fence is already set. That's rather unfortunate when the fb still
has a kernel fence we need to wait for to avoid presenting garbage on the
screen.

So instead update the fence in the plane state directly. While at it also
take care of all potential GEM objects and not just the first one.

Also remove the now unused drm_atomic_set_fence_for_plane() function, new
drivers should probably use the atomic helpers directly.

v2: improve kerneldoc, use local variable and num_planes, WARN_ON_ONCE
    on missing planes.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
---
 drivers/gpu/drm/drm_atomic_uapi.c       | 47 ++--------------
 drivers/gpu/drm/drm_gem_atomic_helper.c | 73 +++++++++++++++++++------
 include/drm/drm_atomic_uapi.h           |  2 -
 include/drm/drm_plane.h                 |  4 +-
 4 files changed, 62 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c6394ba13b24..434f3d4cb8a2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -254,43 +254,6 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
 
-/**
- * drm_atomic_set_fence_for_plane - set fence for plane
- * @plane_state: atomic state object for the plane
- * @fence: dma_fence to use for the plane
- *
- * Helper to setup the plane_state fence in case it is not set yet.
- * By using this drivers doesn't need to worry if the user choose
- * implicit or explicit fencing.
- *
- * This function will not set the fence to the state if it was set
- * via explicit fencing interfaces on the atomic ioctl. In that case it will
- * drop the reference to the fence as we are not storing it anywhere.
- * Otherwise, if &drm_plane_state.fence is not set this function we just set it
- * with the received implicit fence. In both cases this function consumes a
- * reference for @fence.
- *
- * This way explicit fencing can be used to overrule implicit fencing, which is
- * important to make explicit fencing use-cases work: One example is using one
- * buffer for 2 screens with different refresh rates. Implicit fencing will
- * clamp rendering to the refresh rate of the slower screen, whereas explicit
- * fence allows 2 independent render and display loops on a single buffer. If a
- * driver allows obeys both implicit and explicit fences for plane updates, then
- * it will break all the benefits of explicit fencing.
- */
-void
-drm_atomic_set_fence_for_plane(struct drm_plane_state *plane_state,
-			       struct dma_fence *fence)
-{
-	if (plane_state->fence) {
-		dma_fence_put(fence);
-		return;
-	}
-
-	plane_state->fence = fence;
-}
-EXPORT_SYMBOL(drm_atomic_set_fence_for_plane);
-
 /**
  * drm_atomic_set_crtc_for_connector - set CRTC for connector
  * @conn_state: atomic state object for the connector
@@ -1077,10 +1040,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
  *
  * As a contrast, with implicit fencing the kernel keeps track of any
  * ongoing rendering, and automatically ensures that the atomic update waits
- * for any pending rendering to complete. For shared buffers represented with
- * a &struct dma_buf this is tracked in &struct dma_resv.
- * Implicit syncing is how Linux traditionally worked (e.g. DRI2/3 on X.org),
- * whereas explicit fencing is what Android wants.
+ * for any pending rendering to complete. This is usually tracked in &struct
+ * dma_resv which can also contain mandatory kernel fences. Implicit syncing
+ * is how Linux traditionally worked (e.g. DRI2/3 on X.org), whereas explicit
+ * fencing is what Android wants.
  *
  * "IN_FENCE_FD”:
  *	Use this property to pass a fence that DRM should wait on before
@@ -1095,7 +1058,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
  *
  *	On the driver side the fence is stored on the @fence parameter of
  *	&struct drm_plane_state. Drivers which also support implicit fencing
- *	should set the implicit fence using drm_atomic_set_fence_for_plane(),
+ *	should extract the implicit fence using drm_gem_plane_helper_prepare_fb(),
  *	to make sure there's consistent behaviour between drivers in precedence
  *	of implicit vs. explicit fencing.
  *
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index a6d89aed0bda..a5026f617739 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-chain.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
@@ -137,29 +138,67 @@
  *
  * This function is the default implementation for GEM drivers of
  * &drm_plane_helper_funcs.prepare_fb if no callback is provided.
- *
- * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
- * explicit fencing in atomic modeset updates.
  */
-int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
+int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
+				    struct drm_plane_state *state)
 {
-	struct drm_gem_object *obj;
-	struct dma_fence *fence;
+	struct dma_fence *fence = dma_fence_get(state->fence);
+	enum dma_resv_usage usage;
+	size_t i;
 	int ret;
 
 	if (!state->fb)
 		return 0;
 
-	obj = drm_gem_fb_get_obj(state->fb, 0);
-	ret = dma_resv_get_singleton(obj->resv, DMA_RESV_USAGE_WRITE, &fence);
-	if (ret)
-		return ret;
-
-	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
-	 * to handle more fences in general for multiple BOs per fb.
+	/*
+	 * Only add the kernel fences here if there is already a fence set via
+	 * explicit fencing interfaces on the atomic ioctl.
+	 *
+	 * This way explicit fencing can be used to overrule implicit fencing,
+	 * which is important to make explicit fencing use-cases work: One
+	 * example is using one buffer for 2 screens with different refresh
+	 * rates. Implicit fencing will clamp rendering to the refresh rate of
+	 * the slower screen, whereas explicit fence allows 2 independent
+	 * render and display loops on a single buffer. If a driver allows
+	 * obeys both implicit and explicit fences for plane updates, then it
+	 * will break all the benefits of explicit fencing.
 	 */
-	drm_atomic_set_fence_for_plane(state, fence);
+	usage = fence ? DMA_RESV_USAGE_KERNEL : DMA_RESV_USAGE_WRITE;
+
+	for (i = 0; i < state->fb->format->num_planes; ++i) {
+		struct drm_gem_object *obj = drm_gem_fb_get_obj(state->fb, i);
+		struct dma_fence *new;
+
+		if (WARN_ON_ONCE(!obj))
+			continue;
+
+		ret = dma_resv_get_singleton(obj->resv, usage, &new);
+		if (ret)
+			goto error;
+
+		if (new && fence) {
+			struct dma_fence_chain *chain = dma_fence_chain_alloc();
+
+			if (!chain) {
+				ret = -ENOMEM;
+				goto error;
+			}
+
+			dma_fence_chain_init(chain, fence, new, 1);
+			fence = &chain->base;
+
+		} else if (new) {
+			fence = new;
+		}
+	}
+
+	dma_fence_put(state->fence);
+	state->fence = fence;
 	return 0;
+
+error:
+	dma_fence_put(fence);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
 
@@ -168,13 +207,13 @@ EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
  * @pipe: Simple display pipe
  * @plane_state: Plane state
  *
- * This function uses drm_gem_plane_helper_prepare_fb() to extract the exclusive fence
- * from &drm_gem_object.resv and attaches it to plane state for the atomic
+ * This function uses drm_gem_plane_helper_prepare_fb() to extract the fences
+ * from &drm_gem_object.resv and attaches them to the plane state for the atomic
  * helper to wait on. This is necessary to correctly implement implicit
  * synchronization for any buffers shared as a struct &dma_buf. Drivers can use
  * this as their &drm_simple_display_pipe_funcs.prepare_fb callback.
  *
- * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
+ * See drm_gem_plane_helper_prepare_fb() for a discussion of implicit and
  * explicit fencing in atomic modeset updates.
  */
 int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 8cec52ad1277..4c6d39d7bdb2 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -49,8 +49,6 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 			      struct drm_crtc *crtc);
 void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_framebuffer *fb);
-void drm_atomic_set_fence_for_plane(struct drm_plane_state *plane_state,
-				    struct dma_fence *fence);
 int __must_check
 drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 				  struct drm_crtc *crtc);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 2628c7cde2da..89ea54652e87 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -74,9 +74,7 @@ struct drm_plane_state {
 	 *
 	 * Optional fence to wait for before scanning out @fb. The core atomic
 	 * code will set this when userspace is using explicit fencing. Do not
-	 * write this field directly for a driver's implicit fence, use
-	 * drm_atomic_set_fence_for_plane() to ensure that an explicit fence is
-	 * preserved.
+	 * write this field directly for a driver's implicit fence.
 	 *
 	 * Drivers should store any implicit fence in this from their
 	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_plane_helper_prepare_fb()
-- 
2.25.1

