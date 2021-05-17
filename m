Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C7382EE5
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F0B6E975;
	Mon, 17 May 2021 14:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972056E975
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r11so7034771edt.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVnzq+FG4lVKbHQyai4fpjeHfi8rUlFsLnhntMGqNTg=;
 b=TVJ+Y/LLAgQRSjyvXPA06vHtOkAFz+Oora9V9SRD8F8nAVFQpuW92b1CwaZiLum9Vu
 gF1krQ4O+Ns6dcVlk98m/SMeFguZEM/wQUM+5CwHaZFO6jExs6AwF/b5gaN0q89dtagz
 iPWERTjyPxFwfiNsQIPhFP42cE51eJuVyI0nA1D9t1U4mtjp9PpHn0qE618gdsLH3n68
 6UosDIqS5Fwrk/mVdvlEHThliKM16aj7usZG6mveKP9n3LYsnzv7SrKguZOEQOoRZDe3
 3xdQK6d6bi5bE/t1Bt5sJXlvyELSL9SpaXvFsPza9LTtTK6vBESvmEshJkgiuauPU59B
 sovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVnzq+FG4lVKbHQyai4fpjeHfi8rUlFsLnhntMGqNTg=;
 b=kI3kaF63b2Ttk6OsM/tpQ47TJP8Yh5XTGPX0cyjj2hraxA2Bj6En7+GnMsOSp8ydON
 tImv1DmTlAcnnS9eQl9s3UZbJr4CdZxDYmGKsgWreL2dHQBxYdRnAU+gk5AOB/E1rAeu
 xTkfWdjRecdyHOWdnHagg4x4Cu/2GMKlh1iYApIrvJgAAia6jd/1WT0AfBxN7tW06wZo
 lWS2QPD5wRRufmjBV1tZAQ+zOKv1bkNfM/qw5j9gkLO2B8gBFox1F5Prrzb2foxjFsVJ
 WB5z8d8RVPdGmzX3n02Btuo79N/EL0xElPYsO8YjpmyqGOTPD22mThQoG0J1Ptx6dAkn
 4pOA==
X-Gm-Message-State: AOAM532NzT21LRC+wDmhJ0O24RA/U5hEH4wPlnYzy4A84yvtcQxZddeV
 mLzCGlq0lD4Sy21fgFonV0dJ7opREy0=
X-Google-Smtp-Source: ABdhPJyDCudam7RMS26MMQxWkIEqI5Hq6SHj9DhD+eXpK/JpYhqXZiOf3nPutVEWGlFEFh5Kp9GfEA==
X-Received: by 2002:aa7:d853:: with SMTP id f19mr204034eds.371.1621260699169; 
 Mon, 17 May 2021 07:11:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/11] dma-buf: add shared fence usage flags
Date: Mon, 17 May 2021 16:11:27 +0200
Message-Id: <20210517141129.2225-10-christian.koenig@amd.com>
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

Add usage flags for shared fences and improve the documentation.

This allows driver to better specify what shared fences
are doing with the resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 132 +++++++++++++-----
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   4 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   3 +-
 drivers/gpu/drm/i915/i915_vma.c               |   2 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |   3 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |   3 +-
 drivers/gpu/drm/radeon/radeon_object.c        |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |   2 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        |   3 +-
 drivers/gpu/drm/vc4/vc4_gem.c                 |   3 +-
 drivers/gpu/drm/vgem/vgem_fence.c             |   2 +-
 include/linux/dma-resv.h                      |  21 ++-
 15 files changed, 135 insertions(+), 51 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ef7e0464e08d..bf72c162fd70 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -49,17 +49,35 @@
 struct dma_resv_list {
 	struct rcu_head rcu;
 	u32 shared_count, shared_max;
-	struct dma_fence __rcu *shared[];
+	unsigned long shared[];
 };
 
 /**
  * DOC: Reservation Object Overview
  *
- * The reservation object provides a mechanism to manage shared and
- * exclusive fences associated with a buffer.  A reservation object
- * can have attached one exclusive fence (normally associated with
- * write operations) or N shared fences (read operations).  The RCU
- * mechanism is used to protect read access to fences from locked
+ * The reservation object provides a mechanism to manage shared and exclusive
+ * fences associated with a buffer. A reservation object can have attached one
+ * exclusive fence or multiple shared fences. Using the exclusive fence
+ * effectively serializes all accesses to the resource while using the shared
+ * fence slots allows for concurrent access.
+ *
+ * Because of this newly added DMA operations which want to use a resource
+ * always needs to wait for the existing exclusive fence before they start,
+ * no matter if they are added as shared or exclusive one.
+ *
+ * To aid drivers in determining if they need to wait for a shared resource
+ * usage flags should be given with each shared fence added to the resource.
+ *
+ * @DMA_RESV_USAGE_NONE is used for special cases where no waiting is desired.
+ * @DMA_RESV_USAGE_READ is used to note that the resource is read by this
+ * operation and writers should wait for it.
+ * @DMA_RESV_USAGE_WRITE is used to note that the resource is written by this
+ * operation and readers should wait for it.
+ * @DMA_RESV_USAGE_RW is used to note that the resource is both read and
+ * written.
+ *
+ * When drivers access the fences contained inside the dma_resv object the RCU
+ * mechanism can be used to protect read access to fences from locked
  * write-side updates.
  */
 
@@ -100,8 +118,12 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 	if (!list)
 		return;
 
-	for (i = 0; i < list->shared_count; ++i)
-		dma_fence_put(rcu_dereference_protected(list->shared[i], true));
+	for (i = 0; i < list->shared_count; ++i) {
+		struct dma_fence __rcu *fence;
+
+		fence = (void __rcu *)(list->shared[i] & ~DMA_RESV_USAGE_RW);
+		dma_fence_put(rcu_dereference_protected(fence, true));
+	}
 
 	kfree_rcu(list, rcu);
 }
@@ -111,15 +133,44 @@ static void dma_resv_list_free(struct dma_resv_list *list)
  * @obj: the reservation object
  * @list: list to get the fence from
  * @idx: index into the fence array
+ * @val: optional original value
  *
  * Return the fence at the specified index double checking that either the rcu
  * read side or the dma_resv object is held.
  */
-static struct dma_fence *dma_resv_list_fence(struct dma_resv *obj,
-					     struct dma_resv_list *list,
-					     unsigned int idx)
+static inline struct dma_fence *dma_resv_list_fence(struct dma_resv *obj,
+						    struct dma_resv_list *list,
+						    unsigned int idx,
+						    unsigned long *val)
 {
-	return rcu_dereference_check(list->shared[idx], dma_resv_held(obj));
+	struct dma_fence __rcu *fence;
+	unsigned long tmp = READ_ONCE(list->shared[idx]);
+
+	if (val)
+		*val = tmp;
+
+	fence = (void __rcu *)(tmp & ~DMA_RESV_USAGE_RW);
+	return rcu_dereference_check(fence, dma_resv_held(obj));
+}
+
+/**
+ * dma_resv_list_assign - assign fence and usage
+ * @list: list to assign the fence to
+ * @idx: index where to assign the fence
+ * @f: the fence to assign
+ * @usage: the usage to use
+ *
+ * Assign the fence and usage to the slot at position idx.
+ */
+static void dma_resv_list_assign(struct dma_resv_list *list,
+				 unsigned int idx,
+				 struct dma_fence *f,
+				 uint32_t usage)
+{
+	struct dma_fence __rcu *fence;
+
+	rcu_assign_pointer(fence, f);
+	WRITE_ONCE(list->shared[idx], ((unsigned long __force)fence) | usage);
 }
 
 /**
@@ -200,10 +251,17 @@ EXPORT_SYMBOL(dma_resv_first_shared);
 struct dma_fence *dma_resv_next_shared(struct dma_resv *obj,
 				       struct dma_resv_cursor *cursor)
 {
+	struct dma_fence *fence;
+	unsigned long val;
+	int idx;
+
 	if (cursor->i >= cursor->fences->shared_count)
 		return NULL;
 
-	return dma_resv_list_fence(obj, cursor->fences, cursor->i++);
+	idx = cursor->i++;
+	fence = dma_resv_list_fence(obj, cursor->fences, idx, &val);
+	cursor->usage = val & DMA_RESV_USAGE_RW;
+	return fence;
 }
 EXPORT_SYMBOL(dma_resv_next_shared);
 
@@ -246,13 +304,14 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 	 * the new.
 	 */
 	for (i = 0, j = 0, k = max; i < (old ? old->shared_count : 0); ++i) {
-		struct dma_fence *fence;
+		struct dma_fence * fence;
+		unsigned long val;
 
-		fence = dma_resv_list_fence(obj, old, i);
+		fence = dma_resv_list_fence(obj, old, i, &val);
 		if (dma_fence_is_signaled(fence))
-			RCU_INIT_POINTER(new->shared[--k], fence);
+			new->shared[--k] = val;
 		else
-			RCU_INIT_POINTER(new->shared[j++], fence);
+			new->shared[j++] = val;
 	}
 	new->shared_count = j;
 
@@ -271,7 +330,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 
 	/* Drop the references to the signaled fences */
 	for (i = k; i < max; ++i)
-		dma_fence_put(dma_resv_list_fence(obj, new, i));
+		dma_fence_put(dma_resv_list_fence(obj, new, i, NULL));
 	kfree_rcu(old, rcu);
 
 	return 0;
@@ -298,14 +357,16 @@ void dma_resv_reset_shared_max(struct dma_resv *obj)
 #endif
 
 /**
- * dma_resv_add_shared_fence - Add a fence to a shared slot
+ * dma_resv_add_shared - Add a fence to a shared slot
  * @obj: the reservation object
  * @fence: the shared fence to add
+ * @usage: how the fence is using the resource
  *
  * Add a fence to a shared slot, obj->lock must be held, and
  * dma_resv_reserve_shared() has been called.
  */
-void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
+void dma_resv_add_shared(struct dma_resv *obj, struct dma_fence *fence,
+			 enum dma_resv_usage usage)
 {
 	struct dma_resv_list *fobj;
 	struct dma_fence *old;
@@ -321,8 +382,7 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 	write_seqcount_begin(&obj->seq);
 
 	for (i = 0; i < count; ++i) {
-
-		old = dma_resv_list_fence(obj, fobj, i);
+		old = dma_resv_list_fence(obj, fobj, i, NULL);
 		if (old->context == fence->context ||
 		    dma_fence_is_signaled(old))
 			goto replace;
@@ -333,20 +393,21 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 	count++;
 
 replace:
-	RCU_INIT_POINTER(fobj->shared[i], fence);
+	dma_resv_list_assign(fobj, i, fence, usage);
 	/* pointer update must be visible before we extend the shared_count */
 	smp_store_mb(fobj->shared_count, count);
 
 	write_seqcount_end(&obj->seq);
 	dma_fence_put(old);
 }
-EXPORT_SYMBOL(dma_resv_add_shared_fence);
+EXPORT_SYMBOL(dma_resv_add_shared);
 
 /**
  * dma_resv_replace_shared - replace shared fences
  * @obj: the reservation object
  * @context: the context of the fences to replace
  * @fence: the new fence to use instead
+ * @usage: how the fence is using the resource
  *
  * Replace fences with a specified context with a new fence. Only valid if the
  * operation represented by the original fences is completed or has no longer
@@ -354,7 +415,7 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
  * completes. Takes the reference to the new fence.
  */
 void dma_resv_replace_shared(struct dma_resv *obj, uint64_t context,
-			     struct dma_fence *fence)
+			     struct dma_fence *fence, enum dma_resv_usage usage)
 {
 	struct dma_resv_list *list;
 	unsigned int i;
@@ -367,12 +428,13 @@ void dma_resv_replace_shared(struct dma_resv *obj, uint64_t context,
 
 	write_seqcount_begin(&obj->seq);
 	for (i = 0; i < list->shared_count; ++i) {
-		struct dma_fence *old = dma_resv_list_fence(obj, list, i);
+		struct dma_fence *old;
 
+		old = dma_resv_list_fence(obj, list, i, NULL);
 		if (old->context != context)
 			continue;
 
-		rcu_assign_pointer(list->shared[i], dma_fence_get(fence));
+		dma_resv_list_assign(list, i, fence, usage);
 		dma_fence_put(old);
 	}
 	write_seqcount_end(&obj->seq);
@@ -411,7 +473,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	/* inplace update, no shared fences */
 	while (i--)
-		dma_fence_put(dma_resv_list_fence(obj, old, i));
+		dma_fence_put(dma_resv_list_fence(obj, old, i, NULL));
 
 	dma_fence_put(old_fence);
 }
@@ -454,10 +516,10 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 		dst_list->shared_count = 0;
 		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
 			struct dma_fence *fence;
+			unsigned long val;
 
-			fence = dma_resv_list_fence(src, src_list, i);
+			fence = dma_resv_list_fence(src, src_list, i, &val);
 			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				     &fence->flags))
 				continue;
@@ -473,8 +535,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 				continue;
 			}
 
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
+			dst_list->shared[dst_list->shared_count++] = val;
 		}
 	} else {
 		dst_list = NULL;
@@ -566,7 +627,8 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 			shared = nshared;
 			shared_count = fobj ? fobj->shared_count : 0;
 			for (i = 0; i < shared_count; ++i) {
-				shared[i] = dma_resv_list_fence(obj, fobj, i);
+				shared[i] = dma_resv_list_fence(obj, fobj,
+								i, NULL);
 				if (!dma_fence_get_rcu(shared[i]))
 					break;
 			}
@@ -650,7 +712,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 		for (i = 0; !fence && i < shared_count; ++i) {
 			struct dma_fence *lfence;
 
-			lfence = dma_resv_list_fence(obj, fobj, i);
+			lfence = dma_resv_list_fence(obj, fobj, i, NULL);
 			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				     &lfence->flags))
 				continue;
@@ -736,7 +798,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 		for (i = 0; i < shared_count; ++i) {
 			struct dma_fence *fence;
 
-			fence = dma_resv_list_fence(obj, fobj, i);
+			fence = dma_resv_list_fence(obj, fobj, i, NULL);
 			ret = dma_resv_test_signaled_single(fence);
 			if (ret < 0)
 				goto retry;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 3e5a681a5482..50bdf9bfd030 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -245,7 +245,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	 * table update and TLB flush here directly.
 	 */
 	dma_resv_replace_shared(bo->tbo.base.resv, ef->base.context,
-				dma_fence_get_stub());
+				dma_fence_get_stub(), DMA_RESV_USAGE_NONE);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 0adffcace326..1190781cefcb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1422,7 +1422,7 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
 	struct dma_resv *resv = bo->tbo.base.resv;
 
 	if (shared)
-		dma_resv_add_shared_fence(resv, fence);
+		dma_resv_add_shared(resv, fence, DMA_RESV_USAGE_RW);
 	else
 		dma_resv_add_excl_fence(resv, fence);
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index d05c35994579..f0e69c514275 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -214,8 +214,8 @@ static void submit_attach_object_fences(struct etnaviv_gem_submit *submit)
 			dma_resv_add_excl_fence(obj->resv,
 							  submit->out_fence);
 		else
-			dma_resv_add_shared_fence(obj->resv,
-							    submit->out_fence);
+			dma_resv_add_shared(obj->resv, submit->out_fence,
+					    DMA_RESV_USAGE_READ);
 
 		submit_unlock_object(submit, i);
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 5964e67c7d36..16138bc2dbe4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2551,7 +2551,8 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
 		goto err_commit;
 
 	/* Keep the batch alive and unwritten as we parse */
-	dma_resv_add_shared_fence(pw->batch->resv, &pw->base.dma);
+	dma_resv_add_shared(pw->batch->resv, &pw->base.dma,
+			    DMA_RESV_USAGE_READ);
 
 	/* Force execution to wait for completion of the parser */
 	dma_resv_add_excl_fence(shadow->resv, &pw->base.dma);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 07490db51cdc..0d177a7687cb 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1256,7 +1256,7 @@ int i915_vma_move_to_active(struct i915_vma *vma,
 				return err;
 		}
 
-		dma_resv_add_shared_fence(vma->resv, &rq->fence);
+		dma_resv_add_shared(vma->resv, &rq->fence, DMA_RESV_USAGE_READ);
 		obj->write_domain = 0;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 9dd1c58430ab..82f98a4224f7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -820,7 +820,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
 		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
-			dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
+			dma_resv_add_shared(drm_obj->resv, submit->fence,
+					    DMA_RESV_USAGE_READ);
 
 		msm_gem_active_get(drm_obj, gpu);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ad30a6a100b9..b2c13c63f93c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1313,7 +1313,7 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence, bool excl
 	if (exclusive)
 		dma_resv_add_excl_fence(resv, &fence->base);
 	else if (fence)
-		dma_resv_add_shared_fence(resv, &fence->base);
+		dma_resv_add_shared(resv, &fence->base, DMA_RESV_USAGE_RW);
 }
 
 static void
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index b19f2f00b215..b725e3fbbb49 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -429,7 +429,8 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 	list_for_each_entry(entry, &release->bos, head) {
 		bo = entry->bo;
 
-		dma_resv_add_shared_fence(bo->base.resv, &release->base);
+		dma_resv_add_shared(bo->base.resv, &release->base,
+				    DMA_RESV_USAGE_READ);
 		ttm_bo_move_to_lru_tail_unlocked(bo);
 		dma_resv_unlock(bo->base.resv);
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index cee11c55fd15..b744cd766bb1 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -815,7 +815,7 @@ void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
 	struct dma_resv *resv = bo->tbo.base.resv;
 
 	if (shared)
-		dma_resv_add_shared_fence(resv, &fence->base);
+		dma_resv_add_shared(resv, &fence->base, DMA_RESV_USAGE_READ);
 	else
 		dma_resv_add_excl_fence(resv, &fence->base);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 16b869d9b1d6..c9bbc4630afc 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -700,7 +700,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	dma_resv_add_shared_fence(bo->base.resv, fence);
+	dma_resv_add_shared(bo->base.resv, fence, DMA_RESV_USAGE_RW);
 
 	ret = dma_resv_reserve_shared(bo->base.resv, 1);
 	if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 071c48d672c6..8ed1d89cfeeb 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -156,7 +156,8 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
 		struct ttm_buffer_object *bo = entry->bo;
 
 		if (entry->num_shared)
-			dma_resv_add_shared_fence(bo->base.resv, fence);
+			dma_resv_add_shared(bo->base.resv, fence,
+					    DMA_RESV_USAGE_RW);
 		else
 			dma_resv_add_excl_fence(bo->base.resv, fence);
 		ttm_bo_move_to_lru_tail_unlocked(bo);
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 445d3bab89e0..2ab59abcea1a 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -543,7 +543,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->bo[i]->base);
 		bo->seqno = seqno;
 
-		dma_resv_add_shared_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_shared(bo->base.base.resv, exec->fence,
+				    DMA_RESV_USAGE_READ);
 	}
 
 	list_for_each_entry(bo, &exec->unref_list, unref_head) {
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 2902dc6e64fa..cb5e731d07af 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -163,7 +163,7 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 	if (arg->flags & VGEM_FENCE_WRITE)
 		dma_resv_add_excl_fence(resv, fence);
 	else if ((ret = dma_resv_reserve_shared(resv, 1)) == 0)
-		dma_resv_add_shared_fence(resv, fence);
+		dma_resv_add_shared(resv, fence, DMA_RESV_USAGE_READ);
 	dma_resv_unlock(resv);
 
 	/* Record the fence in our idr for later signaling */
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index bb6911baac3d..e5afffaec579 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -49,6 +49,20 @@ struct dma_resv_list;
 
 extern struct ww_class reservation_ww_class;
 
+/**
+ * enum dma_resv_usage - how a DMA resource is used for implicit sync
+ * @DMA_RESV_USAGE_NONE: Only for memory management
+ * @DMA_RESV_USAGE_READ: Read only access
+ * @DMA_RESV_USAGE_WRITE: Write only access
+ * @DMA_RESV_USAGE_RW: Both read and write access
+ */
+enum dma_resv_usage {
+	DMA_RESV_USAGE_NONE	= 0,
+	DMA_RESV_USAGE_READ	= 1 << 0,
+	DMA_RESV_USAGE_WRITE	= 1 << 1,
+	DMA_RESV_USAGE_RW	= (DMA_RESV_USAGE_READ | DMA_RESV_USAGE_WRITE)
+};
+
 /**
  * struct dma_resv - a reservation object manages fences for a buffer
  * @lock: update side lock
@@ -66,6 +80,7 @@ struct dma_resv {
 
 struct dma_resv_cursor {
 	struct dma_resv_list *fences;
+	enum dma_resv_usage usage;
 	unsigned int i;
 };
 
@@ -259,9 +274,11 @@ dma_resv_get_excl_rcu(struct dma_resv *obj)
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_add_shared(struct dma_resv *obj, struct dma_fence *fence,
+			 enum dma_resv_usage usage);
 void dma_resv_replace_shared(struct dma_resv *obj, uint64_t context,
-			     struct dma_fence *fence);
+			     struct dma_fence *fence,
+			     enum dma_resv_usage usage);
 
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 
-- 
2.25.1

