Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AC4F56F2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D4310F3A3;
	Wed,  6 Apr 2022 07:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DF210F3A3;
 Wed,  6 Apr 2022 07:51:57 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id f18so1601659edc.5;
 Wed, 06 Apr 2022 00:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=8IUNqlEB/tRirjBlmf3DCVptBJ3+kBQH40nEBk4GLOk=;
 b=X9P3tJvW3HKJc3sug915qTd9C3H2V7j4nI4YQgvhFeHZUcz+j20z4Z+m3I8VXMudRl
 TVIG3ymi3nJVgk1R3SJJt7WreydonZZBkAU1M7E0GXcqYSs9nt1i5gUmZwfhUlzsOPMz
 ij+QL3XcYVBS6wW86e5N1MI10NiedCQ9B8H0xe9WVIvnP98VKf8VpynVgBkci7JFmMAB
 CPfjmO+uvZ2RTPzgznniXBbwcT4uuRZKWSBmLf0oIAQfBZ60GZ+vnJ4vJ5FZW/32O5g+
 efcefDbbF50Pve2z3lrIA2XdwWEnlwgH6IlfeNuQf8KQFZDvXJqRFwZePykQn6cOvKWY
 V0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=8IUNqlEB/tRirjBlmf3DCVptBJ3+kBQH40nEBk4GLOk=;
 b=1s7yOpwvd6Q3eHsWHlwy/wM4wjVHIWskhvsswLSN0KGSawHmkJxb/Ob3b/Az+48GCy
 7iK6pGxJ4xfQehc8IoTLdP4x16m6FIUuZNsytEOP1AIdUbzG6NaslnI6f0sGcx5ktEUW
 7B44Bk4ma3p9wzvNRgFxwICgzmgVLvKT6yfOtdnJmt0EMiYGcUyjJBsTVzuWLkc/y8zy
 b8utkTxvQWtJfxP3OGBHKlX5S4XW6ZF0CICgfPoAh1ugcQgksNNUJ1Sdr9VpBiT+OGfh
 oVAKJpCHGP3j4Lwc1iBK4vcTm3avQcUFPZK6RyI0aF0L8Q7KfFjmNV4IdQ4aUYNNxf5R
 CNAw==
X-Gm-Message-State: AOAM530TkWzgsQI6896M0fET+fk5o7cm1b87znjjmQOM/BXnp9eaDdeH
 5eazsHpA6gczv0uWWXlCVeteHGpPsUAAMw==
X-Google-Smtp-Source: ABdhPJy0+JErg9p2oMRm1PXnpJQjuqlnvkXBrUzjX02vEcwu1iH2UJrnnplvZ/NlEZ9THbQKc8XraQ==
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr7297644edz.414.1649231515756; 
 Wed, 06 Apr 2022 00:51:55 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/16] drm/i915: drop bo->moving dependency
Date: Wed,  6 Apr 2022 09:51:30 +0200
Message-Id: <20220406075132.3263-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
References: <20220406075132.3263-1-christian.koenig@amd.com>
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
Reply-To: DMA-resv@freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That should now be handled by the common dma_resv framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++---------------
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
 drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
 6 files changed, 21 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 372bc220faeb..ffde7bc0a95d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
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
-}
-
-void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
-				      struct dma_fence *fence)
-{
-	struct dma_fence **moving = &i915_gem_to_ttm(obj)->moving;
-
-	if (*moving == fence)
-		return;
-
-	dma_fence_put(*moving);
-	*moving = dma_fence_get(fence);
+	return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
+				      fence);
 }
 
 /**
@@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
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
index 02c37fe4a535..e11d82a9f7c3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 	i915_gem_object_unpin_pages(obj);
 }
 
-struct dma_fence *
-i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
-
-void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
-				      struct dma_fence *fence);
-
+int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
+				     struct dma_fence **fence);
 int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 438b8a95b3d1..a10716f4e717 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
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
@@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		struct i915_deps deps;
 
 		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
-		ret = prev_deps(bo, ctx, &deps);
+		ret = i915_deps_add_resv(&deps, bo->base.resv, ctx);
 		if (ret) {
 			i915_refct_sgt_put(dst_rsgt);
 			return ret;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 4997ed18b6e4..0ad443a90c8b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt *gt,
 			err = dma_resv_reserve_fences(obj->base.resv, 1);
 			if (!err)
 				dma_resv_add_fence(obj->base.resv, &rq->fence,
-						   DMA_RESV_USAGE_WRITE);
-			i915_gem_object_set_moving_fence(obj, &rq->fence);
+						   DMA_RESV_USAGE_KERNEL);
 			i915_request_put(rq);
 		}
 		if (err)
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 3a6e3f6d239f..dfc34cc2ef8c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
 	i915_gem_object_unpin_pages(obj);
 	if (rq) {
 		dma_resv_add_fence(obj->base.resv, &rq->fence,
-				   DMA_RESV_USAGE_WRITE);
-		i915_gem_object_set_moving_fence(obj, &rq->fence);
+				   DMA_RESV_USAGE_KERNEL);
 		i915_request_put(rq);
 	}
 	i915_gem_object_unlock(obj);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 524477d8939e..d077f7b9eaad 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
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

