Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0A4B264F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7801A10EBD0;
	Fri, 11 Feb 2022 12:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8083310EBD0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id d10so22674775eje.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IRiB/8pqrJn1mJ6lfMd6SCDu1bKUwWyYQLH5w5j700I=;
 b=YCl1qwGT5ZSmgfqy0Wj123oHpkud72q0UjHch6hxNix+ZONoxRdZGpT8eW4rVXyJp+
 RzCH38aO/1nV6MKzBQ5ulYSVG9O58eluY7+79BfaVbYnKEK5P90/op0QPjkxH+nBT9Wc
 oWNI6ZMytGynViKXhYHnJ6tOLTsuT2qPG6p3DSUtFQvXlCG0d5xCWW9879SjTLE3kaKT
 Xo9jh4dEgP5FNHpAkOTqUh9QBb1gomrU8YyFGzJbN/yYiSfx88z5LTy510Urj3VBFKrH
 IQdxMOdpAs0giB2Jnl5BJ6kOb0M1eqUXuMg0G/hq3DZf0Dx/e43Jvn719PmV9gfwwKe3
 YlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRiB/8pqrJn1mJ6lfMd6SCDu1bKUwWyYQLH5w5j700I=;
 b=XK8g5/2QVJE1DRJdEKitaeTTc4tY+tg785XLGKbQt62rD42xGgMKMAxAppCMRrJFHb
 hCgI1LrATABMpoZ5e1mZZinz+9EMpj9Hgv4rY99GcoziWQvtHqdsTwx4TOE3Sk73Z3tc
 oE242p08kdsPpb5Je4Iv0P3HWgVtWzSKWvF11zIyCgDxm5k8d0fw3LuZ12FMN13m3hoS
 hudmG2CnWTqdJj13N15jjT+K21tP9eYeNvmgfo9t9yQoS6TbKFGWYZA0C2/o+nbyKfDM
 yXL+91ybFHf6dq4bEZZtU7xxliTDDrGRlMMtILD5ydvJwgA+MbRa+/Q2id3rHRr8/9D3
 c/Og==
X-Gm-Message-State: AOAM530Y+All3V8HUCkzpeW8LNivuPAAP66xWvtctZe1FGE6Xy1S5qFC
 ZsZcfaq86owdTjFJIvwY6ckwSOFMYPw=
X-Google-Smtp-Source: ABdhPJxgf3iD7MXq2iZ0ltXxb27rHA2j/XonjF4I9Lv5iMM7l8xHkvRHBhKHphMM5zDhRzcEMm26hQ==
X-Received: by 2002:a17:907:720e:: with SMTP id
 dr14mr1309848ejc.196.1644583825507; 
 Fri, 11 Feb 2022 04:50:25 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 22/23] drm/i915: drop bo->moving dependency
Date: Fri, 11 Feb 2022 13:50:02 +0100
Message-Id: <20220211125003.918447-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That should now be handled by the common dma_resv framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c   | 29 ++++++--------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  5 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 15 +---------
 drivers/gpu/drm/i915/i915_vma.c              |  9 +++++-
 4 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index d87b508b59b1..fd240435ffef 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -742,18 +742,19 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
 /**
  * i915_gem_object_get_moving_fence - Get the object's moving fence if any
  * @obj: The object whose moving fence to get.
+ * @fence: The resulting fence
  *
  * A non-signaled moving fence means that there is an async operation
  * pending on the object that needs to be waited on before setting up
  * any GPU- or CPU PTEs to the object's pages.
  *
- * Return: A refcounted pointer to the object's moving fence if any,
- * NULL otherwise.
+ * Return: Negative error code or 0 for success.
  */
-struct dma_fence *
-i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
+int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
+				     struct dma_fence **fence)
 {
-	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
+	return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
+				      fence);
 }
 
 /**
@@ -771,23 +772,9 @@ i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
 int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr)
 {
-	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
-	int ret;
-
 	assert_object_held(obj);
-	if (!fence)
-		return 0;
-
-	ret = dma_fence_wait(fence, intr);
-	if (ret)
-		return ret;
-
-	if (fence->error)
-		return fence->error;
-
-	i915_gem_to_ttm(obj)->moving = NULL;
-	dma_fence_put(fence);
-	return 0;
+	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
+				     intr, MAX_SCHEDULE_TIMEOUT);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index f66d46882ea7..be57af8bfb31 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -521,9 +521,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 	i915_gem_object_unpin_pages(obj);
 }
 
-struct dma_fence *
-i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
-
+int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
+				     struct dma_fence **fence);
 int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index e4a232e22f9d..4d5d0cd64f23 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -452,19 +452,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
 	return fence;
 }
 
-static int
-prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-	  struct i915_deps *deps)
-{
-	int ret;
-
-	ret = i915_deps_add_dependency(deps, bo->moving, ctx);
-	if (!ret)
-		ret = i915_deps_add_resv(deps, bo->base.resv, ctx);
-
-	return ret;
-}
-
 /**
  * i915_ttm_move - The TTM move callback used by i915.
  * @bo: The buffer object.
@@ -519,7 +506,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		struct i915_deps deps;
 
 		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
-		ret = prev_deps(bo, ctx, &deps);
+		ret = i915_deps_add_resv(&deps, bo->base.resv, ctx);
 		if (ret) {
 			i915_refct_sgt_put(dst_rsgt);
 			return ret;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 52fd6705a518..8737159f4706 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1247,10 +1247,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (err)
 		return err;
 
+	if (vma->obj) {
+		err = i915_gem_object_get_moving_fence(vma->obj, &moving);
+		if (err)
+			return err;
+	} else {
+		moving = NULL;
+	}
+
 	if (flags & PIN_GLOBAL)
 		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
 
-	moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
 	if (flags & vma->vm->bind_async_flags || moving) {
 		/* lock VM */
 		err = i915_vm_lock_objects(vma->vm, ww);
-- 
2.25.1

