Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5967382EE8
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0EA6E97D;
	Mon, 17 May 2021 14:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415C76E974
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:37 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s6so7064292edu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKKcvjX+jFfdKukJI7NqNwtn+WGlVAQGNyUUME+8cuI=;
 b=oD7cp4nzC8nxYSFnZ+V5oY8WNBzuEWEkwepreUkHDND+XykvUE6tluczLSqtP7o+cq
 GeLtFaIDdfh0s7edigs7tztu24/Uh7dvP5Ka/nhkysJCv3gLVuMoiECul3K4aj4cickx
 V2nZqrlvojfg8j6bacOiX0AGKWRkX/jaeL/omtrPjWyvXyFdz1Jrl7u9Zr/QnGZN2KRI
 rfESp3hdSBqhPn2Oo+eqxBQdgpg+vHWaRkWwQGsT3Knyd0ewSsWLA+dw0Pc6xmtZKDU5
 ARd1gDJCUvcryIJn9erjyrWdk6DD5Jy1X1j0bKF3wQy229T32ZXzS61t/y+E1VmU2Eu9
 qXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKKcvjX+jFfdKukJI7NqNwtn+WGlVAQGNyUUME+8cuI=;
 b=p+Bh9R7KGB35PQVadJX5M5J4pUOKzmGQVLBMM44jTFUEn9jSCZOAqg+k2gZkwnNBV3
 VlfFWUlHXigoDgDCduUBI0alRX55HnUeOwD5lXMcEQ7fTrb6TMY7wP05r8D8+3Gh35z1
 X+V0PuithW9rXFOWxEXgpYq8+VdvoE92AVSSHK2G1mrOcbM2qRkhLbdugeR5KUFfVS3A
 nssCuH5aa9UrG9y9VUZ1/xRntN+9ZJLamOTUVhsUpid3KSdhIEeNH2cjp58j3LKa1G24
 7og+9t+g9EayIT1wIew5tH/grGoAzIHHMNJHbHuC/4eurYXrQlIeIgweldUbUJkOXISd
 i7vQ==
X-Gm-Message-State: AOAM532beExZ6c/DaYQ2m67Zl3BU3uTU4Tz4GvyxaWgLaM6cSXpA+mrp
 0o7WuOSQWKRQxMW7z3P3CRqFK3OgR28=
X-Google-Smtp-Source: ABdhPJzLn9M0MzV+qmtjbhqY6IVrTOChhTlQuPkboPuSgHqItsXy2n+XqZSY/MN4Fz+229YJWEwGRw==
X-Received: by 2002:aa7:cb90:: with SMTP id r16mr218011edt.247.1621260695913; 
 Mon, 17 May 2021 07:11:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 05/11] dma-buf: rename and cleanup dma_resv_get_list
Date: Mon, 17 May 2021 16:11:23 +0200
Message-Id: <20210517141129.2225-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

When the comment needs to state explicitly that this is doesn't get a reference
to the object then the function is named rather badly.

Rename the function and use it in even more places.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 32 +++++++++----------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  4 +--
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |  2 +-
 drivers/gpu/drm/radeon/radeon_sync.c          |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
 include/linux/dma-resv.h                      | 25 +++++++--------
 13 files changed, 39 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 81b032b43457..b1a1a31dc009 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -149,8 +149,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_get_list(obj);
-
+	old = dma_resv_shared(obj);
 	if (old && old->shared_max) {
 		if ((old->shared_count + num_fences) <= old->shared_max)
 			return 0;
@@ -217,12 +216,13 @@ EXPORT_SYMBOL(dma_resv_reserve_shared);
  */
 void dma_resv_reset_shared_max(struct dma_resv *obj)
 {
-	/* Test shared fence slot reservation */
-	if (rcu_access_pointer(obj->fence)) {
-		struct dma_resv_list *fence = dma_resv_get_list(obj);
+	struct dma_resv_list *fences = dma_resv_shared(obj);
 
-		fence->shared_max = fence->shared_count;
-	}
+	dma_resv_assert_held(obj);
+
+	/* Test shared fence slot reservation */
+	if (fences)
+		fences->shared_max = fences->shared_count;
 }
 #endif
 
@@ -244,7 +244,7 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
-	fobj = dma_resv_get_list(obj);
+	fobj = dma_resv_shared(obj);
 	count = fobj->shared_count;
 
 	write_seqcount_begin(&obj->seq);
@@ -287,7 +287,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_get_list(obj);
+	old = dma_resv_shared(obj);
 	if (old)
 		i = old->shared_count;
 
@@ -326,7 +326,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 	dma_resv_assert_held(dst);
 
 	rcu_read_lock();
-	src_list = rcu_dereference(src->fence);
+	src_list = dma_resv_shared(src);
 
 retry:
 	if (src_list) {
@@ -339,7 +339,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 			return -ENOMEM;
 
 		rcu_read_lock();
-		src_list = rcu_dereference(src->fence);
+		src_list = dma_resv_shared(src);
 		if (!src_list || src_list->shared_count > shared_count) {
 			kfree(dst_list);
 			goto retry;
@@ -357,7 +357,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 			if (!dma_fence_get_rcu(fence)) {
 				dma_resv_list_free(dst_list);
-				src_list = rcu_dereference(src->fence);
+				src_list = dma_resv_shared(src);
 				goto retry;
 			}
 
@@ -376,7 +376,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 	new = dma_fence_get_rcu_safe(&src->fence_excl);
 	rcu_read_unlock();
 
-	src_list = dma_resv_get_list(dst);
+	src_list = dma_resv_shared(dst);
 	old = dma_resv_exclusive(dst);
 
 	write_seqcount_begin(&dst->seq);
@@ -429,7 +429,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 		if (fence_excl && !dma_fence_get_rcu(fence_excl))
 			goto unlock;
 
-		fobj = rcu_dereference(obj->fence);
+		fobj = dma_resv_shared(obj);
 		if (fobj)
 			sz += sizeof(*shared) * fobj->shared_max;
 
@@ -535,7 +535,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 	}
 
 	if (wait_all) {
-		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
+		struct dma_resv_list *fobj = dma_resv_shared(obj);
 
 		if (fobj)
 			shared_count = fobj->shared_count;
@@ -620,7 +620,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 	seq = read_seqcount_begin(&obj->seq);
 
 	if (test_all) {
-		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
+		struct dma_resv_list *fobj = dma_resv_shared(obj);
 		unsigned int i;
 
 		if (fobj)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7d4118c8128a..88da0e400406 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -245,7 +245,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	if (!ef)
 		return -EINVAL;
 
-	old = dma_resv_get_list(resv);
+	old = dma_resv_shared(resv);
 	if (!old)
 		return 0;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index baa980a477d9..0371947ba96b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -95,7 +95,7 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
 	unsigned int count;
 	int r;
 
-	if (!dma_resv_get_list(obj)) /* no shared fences to convert */
+	if (!dma_resv_shared(obj)) /* no shared fences to convert */
 		return 0;
 
 	r = dma_resv_get_fences_rcu(obj, NULL, &count, &fences);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index c84d5b843985..c50d9f92a0cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -213,7 +213,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 	f = dma_resv_exclusive(resv);
 	r = amdgpu_sync_fence(sync, f);
 
-	flist = dma_resv_get_list(resv);
+	flist = dma_resv_shared(resv);
 	if (!flist || r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8c7ec09eb1a4..6ab50810bd54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1407,7 +1407,7 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_get_list(bo->base.resv);
+	flist = dma_resv_shared(bo->base.resv);
 	if (flist) {
 		for (i = 0; i < flist->shared_count; ++i) {
 			f = rcu_dereference_protected(flist->shared[i],
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index d4f54dea8ac1..4d43b8630f0e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -461,7 +461,7 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = rcu_dereference(robj->fence);
+	fobj = dma_resv_shared(robj);
 	if (fobj) {
 		unsigned int i, shared_count = fobj->shared_count;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 02312a0c3a36..3f94becac541 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -116,7 +116,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	args->busy = busy_check_writer(dma_resv_exclusive(obj->base.resv));
 
 	/* Translate shared fences to READ set of engines */
-	list = rcu_dereference(obj->base.resv->fence);
+	list = dma_resv_shared(obj->base.resv);
 	if (list) {
 		unsigned int shared_count = list->shared_count, i;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 99b8cefb0072..cf3e08b6a910 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -803,7 +803,7 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_get_list(obj->resv);
+	fobj = dma_resv_shared(obj->resv);
 	if (!fobj || (fobj->shared_count == 0)) {
 		fence = dma_resv_exclusive(obj->resv);
 		/* don't need to wait on our own fences, since ring is fifo */
@@ -1011,7 +1011,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	}
 
 	rcu_read_lock();
-	fobj = rcu_dereference(robj->fence);
+	fobj = dma_resv_shared(robj);
 	if (fobj) {
 		unsigned int i, shared_count = fobj->shared_count;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index a6cb35181aee..5ce441c655ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -355,7 +355,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 			return ret;
 	}
 
-	fobj = dma_resv_get_list(resv);
+	fobj = dma_resv_shared(resv);
 	fence = dma_resv_exclusive(resv);
 
 	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 183d15e2cf58..0acc70a6d3dd 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -61,7 +61,7 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 		int rel;
 
 		rcu_read_lock();
-		fobj = rcu_dereference(bo->tbo.base.resv->fence);
+		fobj = dma_resv_shared(bo->tbo.base.resv);
 		rel = fobj ? fobj->shared_count : 0;
 		rcu_read_unlock();
 
diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index e476f90ef1c1..a9cdb88da173 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -105,7 +105,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
 	else if (f)
 		r = dma_fence_wait(f, true);
 
-	flist = dma_resv_get_list(resv);
+	flist = dma_resv_shared(resv);
 	if (shared || !flist || r)
 		return r;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 95fa73ef90fb..9d453c2ca800 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -259,7 +259,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	int i;
 
 	rcu_read_lock();
-	fobj = rcu_dereference(resv->fence);
+	fobj = dma_resv_shared(resv);
 	fence = dma_resv_exclusive(resv);
 	if (fence && !fence->ops->signaled)
 		dma_fence_enable_sw_signaling(fence);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 7549ec5eb35c..98ac66fecb71 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -78,20 +78,6 @@ struct dma_resv {
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-/**
- * dma_resv_get_list - get the reservation object's
- * shared fence list, with update-side lock held
- * @obj: the reservation object
- *
- * Returns the shared fence list.  Does NOT take references to
- * the fence.  The obj->lock must be held.
- */
-static inline struct dma_resv_list *dma_resv_get_list(struct dma_resv *obj)
-{
-	return rcu_dereference_protected(obj->fence,
-					 dma_resv_held(obj));
-}
-
 #ifdef CONFIG_DEBUG_MUTEXES
 void dma_resv_reset_shared_max(struct dma_resv *obj);
 #else
@@ -267,6 +253,17 @@ dma_resv_get_excl_rcu(struct dma_resv *obj)
 	return fence;
 }
 
+/**
+ * dma_resv_shared - get the reservation object's shared fence list
+ * @obj: the reservation object
+ *
+ * Returns the shared fence list. The obj->lock or rcu read side must be held.
+ */
+static inline struct dma_resv_list *dma_resv_shared(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
+}
+
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

