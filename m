Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C17350A8CC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 21:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0AF10E997;
	Thu, 21 Apr 2022 19:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2931510E997
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 19:10:06 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p18so2559713edr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQFRCeuW4AtcWa0UuIrEQXjri/i0wyqOxY2mDDf4zIs=;
 b=aLCsS1hcbxrn607cBCIagtssXV1bcHCMC5r/4mh6D6Vz9O+LI4gpld0jIXC8olKXDT
 mGfzHfj+DXE77+nl6cA+XJ77vQhZBZ4gk+LbJRvY8t1xIEawlYAlB1dHyLgkV5+Huker
 y/9/LmrEQz9KIDCCDDnDyvf/1Tz+pH9TPiJ65v0Hf4JR70sjeY505PqD6gt68EmIXlMn
 dI4SZadyb2T5nsMJvOchtjGoseRXHXuiupiUEhbDN8EyWFpTjn13a9bNXQVZDTd0HYYZ
 HCROffVb8Ae32806gJYyLtpcqcGiwnpmvnhVccaLh41/ErZBwKyZLQbmIzRflnZHNAfV
 lWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQFRCeuW4AtcWa0UuIrEQXjri/i0wyqOxY2mDDf4zIs=;
 b=pgpbdz9eXtN4bJYG5tCPnhO/o/pyr2F0uYZ3edwymLCM9gVvQwzxzg5Bm1Z0S77BoI
 iIjf3n6zHWB9ta4o3PgA4v5A2OAcFqQvLoZTGghv4wGkP7va6OC36oxwf9IoCh8UUP+7
 W0tXSSeRHWfIna/SvW/Zt+KovEyDrxO9PWAjyGBDSCApzt+fjdkI/jgueKV83yQ7bbqR
 pMtSlfEGchwl+YYyfQPFDxLS2RNMgGijwMJKayzuZgIYW/0FSXI9MqaxXAU77oNb3pxL
 L+nPZU4+GCMQN/JVOY5OiMXYhtEIId+FjB419YKnlMUFP1nSJkwIm+MNpUz6Ql6XmWOy
 LHnw==
X-Gm-Message-State: AOAM531bnSV4fQFpbAyxsNwdCr0Nz50/byQZ2cym6JBjqoTm/sNxZXXq
 zOhajgmAhUIG88hJvMgniXIHT8rlhz4=
X-Google-Smtp-Source: ABdhPJxiOj2SO9drJMVICdFQ42WwHKWdIXTGDQCsW7MTnqlICUwTU6I/cumLNuu2Tn7N4d5cUOodSg==
X-Received: by 2002:a50:baa1:0:b0:418:849a:c66a with SMTP id
 x30-20020a50baa1000000b00418849ac66amr1118811ede.234.1650568204580; 
 Thu, 21 Apr 2022 12:10:04 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a170906849300b006e89efedf50sm8139732ejx.171.2022.04.21.12.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 12:10:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: handle kernel fences in drm_gem_plane_helper_prepare_fb
Date: Thu, 21 Apr 2022 21:10:02 +0200
Message-Id: <20220421191002.2251-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c       | 37 ---------------
 drivers/gpu/drm/drm_gem_atomic_helper.c | 63 +++++++++++++++++++++----
 include/drm/drm_atomic_uapi.h           |  2 -
 include/drm/drm_plane.h                 |  4 +-
 4 files changed, 54 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c6394ba13b24..0f461261b3f3 100644
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
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index a6d89aed0bda..8fc0b42acdff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-chain.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
@@ -141,25 +142,67 @@
  * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
  * explicit fencing in atomic modeset updates.
  */
-int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
+int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
+				    struct drm_plane_state *state)
 {
+	struct dma_fence *fence = dma_fence_get(state->fence);
 	struct drm_gem_object *obj;
-	struct dma_fence *fence;
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
+	for (i = 0; i < ARRAY_SIZE(state->fb->obj); ++i) {
+		struct dma_fence *new;
+
+		obj = drm_gem_fb_get_obj(state->fb, i);
+		if (!obj)
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

