Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261594E28FD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0BC10E45F;
	Mon, 21 Mar 2022 13:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0465889FF9;
 Mon, 21 Mar 2022 13:59:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d7so20816954wrb.7;
 Mon, 21 Mar 2022 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRiB/8pqrJn1mJ6lfMd6SCDu1bKUwWyYQLH5w5j700I=;
 b=Zn1wwmet4pawxLOqP/cg2JwyS2ULGs2eq9xcTkt6GgsqmW0h/D4tqnXmX5Iobrir0v
 SgwwZROkbGNFSIjRReRubAM5Vg+/MdPobbYT+GlWy4s5aih+Vh77TbYJ1G+abJB+BlKC
 6d2pdttGwss0mypXR9FbZz/GOe7H48vsclKuE7BkYMpk12Zsc+k+wOjMMXrvJaHwI3b7
 tYvC72b1Z4XfHqZBb5/Q2Xe/S1LoBOq2Zd9fc3zBXTPBdUhAeMnnQ0opZ+vq9GsgC3ZI
 r2h33shDQzHLSM1ozVgWl1KxlmBU9lhxaHFqW+0RuTi1A1sOWn+PzpqtFIUxWdHJgYhS
 cRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRiB/8pqrJn1mJ6lfMd6SCDu1bKUwWyYQLH5w5j700I=;
 b=DZdhDEe9AQMA/Lusl4wg0yeEq3G2uA3rMfNLrkOM3NjdUXwTyPPpy9lLEbarIAhu7f
 djaCYkmMhi5i7uzWFv/iPPUyGCtv1kShFzYKMjtWT4IIH0y2dR3sj71HYVqD3Fsxz2yy
 936dXisIqdc4l9aSfRm5IhsovDj9ZUUQFcITibtk6o5xFTPvUld5ZN52Ihn0icjT/8UU
 fBt6IdWDFcFqInwZ1RhGt4XvTPGQ+0e33A6EQxxU2lsp+CVm1mq2mbvhgji7TzAriZi1
 EUZGIG7+TbpWOjtNg4VLuHb95F8nZix41xbRFoKfOStQ+lZ9KIHP0RwJHCZ88aSdVmy/
 Zlvw==
X-Gm-Message-State: AOAM532+Nt9tMxu+KJF2c9crpwe4pBokhe0FTcAuwc+EUEpE6hBO9jdM
 OUr7vg+qUPYg8XQgOMWdc1dPvyF1TFI=
X-Google-Smtp-Source: ABdhPJx96sZKYxJq0GD0vKeaAgQxQuDzu2xCGdw4/kDWrDSZoy2Mezt5x/iaYON3zdfdHp9R1GC21g==
X-Received: by 2002:a5d:6d44:0:b0:1e4:9a6d:c171 with SMTP id
 k4-20020a5d6d44000000b001e49a6dc171mr18989963wri.468.1647871159523; 
 Mon, 21 Mar 2022 06:59:19 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 22/23] drm/i915: drop bo->moving dependency
Date: Mon, 21 Mar 2022 14:58:55 +0100
Message-Id: <20220321135856.1331-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

