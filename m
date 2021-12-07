Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A24E46BB50
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F146EB055;
	Tue,  7 Dec 2021 12:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D31EB00C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j3so29232793wrp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lUTtrhIGMzqIZpPJHrf+te5EMdTelK2G0rPEamRljD0=;
 b=b+fGHdLtTp/Y54iV4xmkRCVbQIRnjdS4x7VHVmWt4rsTkYe6IfXMSIjGVKuvYAtg4E
 iIOZ3mYzSjh9gCeYJxTo3Ygm2UNO1iWXaGaWIxwnTMk/VsA26294x6y0zpto8m4kUUFx
 a2JaE6pfhNmDeCZrGrlmcLGIeDb1yZJouBc8xj7KGMIj/S8Mzv8iDOGuqhZCnAiyWImf
 ZyUjqyplDLLdyZQPyYibFa5wUbZuI1sTcNgVWbgFPAfShLu9zE5BgGiQCYaRI3cCyToJ
 OwmKDGEFrP27YQ2v1wNEumVzZnHewEMsDQeouByW0la/JJ0aqWz1Jk9UH9++7hHALdtN
 g9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUTtrhIGMzqIZpPJHrf+te5EMdTelK2G0rPEamRljD0=;
 b=4ux5Bs4avl+rogTsVswI8gu2cwnl9choFqSwwq1sG78w9+rPBNYQZ1L9RrtmvcWYue
 YdnHgBv8ZTk8w4EhfP+ig4UPmPiebfY8UAKTps2gQTLzSs/3Cy903fV848BuvQ3hVdhS
 a7oKpzu4ZYciujP9n1txHlw6V5Q9IoVFhVdUbCpdGjaK7bHOS3XPUhGLOFsvHjY63Nsg
 k0alPaB20vFSHDJ521skhYTCaJ+yWMGuBI5sCuRv7MV0gB6QghqWqYjhTBPfx3lYej7L
 NAI5ctJASFpoI5j3G66HnzIKfk0sQYuvzKQCcqqTnofB0/2TOvCAiwToEMgejZM3aDv/
 RnOg==
X-Gm-Message-State: AOAM532tJSzqZSnpcc+z2djVEVlpsI9O02ZviFvuyDw82u9JGFEhV7Fu
 7bRMdblypjl7liYkJY2sgYg=
X-Google-Smtp-Source: ABdhPJwqdz9zZxzCRTjoMxTEVhkm7jCxRa/otaq3nNFQACLt06UhnDnlkpvygCLa15Fu8n17DkCTPw==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr49919200wrl.181.1638880477537; 
 Tue, 07 Dec 2021 04:34:37 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 19/24] dma-buf: specify usage while adding fences to dma_resv
 obj v2
Date: Tue,  7 Dec 2021 13:34:06 +0100
Message-Id: <20211207123411.167006-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

Instead of distingting between shared and exclusive fences specify
the fence usage while adding fences.

Rework all drivers to use this interface instead and deprecate the old one.

v2: some kerneldoc comments suggested by Daniel

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 374 ++++++++----------
 drivers/dma-buf/st-dma-resv.c                 | 109 ++---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   5 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   4 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |  10 +-
 .../drm/i915/selftests/intel_memory_region.c  |   2 +-
 drivers/gpu/drm/lima/lima_gem.c               |   4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   9 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |   5 +-
 drivers/gpu/drm/radeon/radeon_object.c        |   6 +-
 drivers/gpu/drm/radeon/radeon_vm.c            |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |   6 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |   7 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        |  10 +-
 drivers/gpu/drm/v3d/v3d_gem.c                 |   6 +-
 drivers/gpu/drm/vc4/vc4_gem.c                 |   4 +-
 drivers/gpu/drm/vgem/vgem_fence.c             |  11 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   5 +-
 include/linux/dma-resv.h                      |  88 ++---
 31 files changed, 307 insertions(+), 426 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 33a17db89fb4..a2a0b5b6c107 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -44,12 +44,12 @@
 /**
  * DOC: Reservation Object Overview
  *
- * The reservation object provides a mechanism to manage shared and
- * exclusive fences associated with a buffer.  A reservation object
- * can have attached one exclusive fence (normally associated with
- * write operations) or N shared fences (read operations).  The RCU
- * mechanism is used to protect read access to fences from locked
- * write-side updates.
+ * The reservation object provides a mechanism to manage a container of
+ * dma_fence object associated with a resource. A reservation object
+ * can have any number of fences attaches to it. Each fence carring an usage
+ * parameter determining how the operation represented by the fence is using the
+ * resource. The RCU mechanism is used to protect read access to fences from
+ * locked write-side updates.
  *
  * See struct dma_resv for more details.
  */
@@ -57,36 +57,80 @@
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
+/* Mask for the lower fence pointer bits */
+#define DMA_RESV_LIST_MASK	0x3
+
 /**
- * struct dma_resv_list - a list of shared fences
+ * struct dma_resv_list - an array of fences
  * @rcu: for internal use
- * @shared_count: table of shared fences
- * @shared_max: for growing shared fence table
- * @shared: shared fence table
+ * @num_fences: table of fences
+ * @max_fences: for growing fence table
+ * @table: fence table
  */
 struct dma_resv_list {
 	struct rcu_head rcu;
-	u32 shared_count, shared_max;
-	struct dma_fence __rcu *shared[];
+	u32 num_fences, max_fences;
+	struct dma_fence __rcu *table[];
 };
 
+/**
+ * dma_resv_list_entry - extract fence and usage from a list entry
+ * @list: the list to extract and entry from
+ * @index: which entry we want
+ * @check: lockdep check that the access is allowed
+ * @fence: the resulting fence
+ * @usage: the resulting usage
+ *
+ * Extract the fence and usage flags from an RCU protected entry in the list.
+ */
+static void dma_resv_list_entry(struct dma_resv_list *list, unsigned int index,
+				bool check, struct dma_fence **fence,
+				enum dma_resv_usage *usage)
+{
+	long tmp;
+
+	tmp = (long)rcu_dereference_check(list->table[index], check);
+	*fence = (struct dma_fence *)(tmp & ~DMA_RESV_LIST_MASK);
+	if (usage)
+		*usage = tmp & DMA_RESV_LIST_MASK;
+}
+
+/**
+ * dma_resv_list_set - set fence and usage at a specific index
+ * @list: the list to modify
+ * @index: where to make the change
+ * @fence: the fence to set
+ * @usage: the usage to set
+ *
+ * Set the fence and usage flags at the specific index in the list.
+ */
+static void dma_resv_list_set(struct dma_resv_list *list,
+			      unsigned int index,
+			      struct dma_fence *fence,
+			      enum dma_resv_usage usage)
+{
+	long tmp = ((long)fence) | usage;
+
+	RCU_INIT_POINTER(list->table[index], (struct dma_fence *)tmp);
+}
+
 /**
  * dma_resv_list_alloc - allocate fence list
- * @shared_max: number of fences we need space for
+ * @max_fences: number of fences we need space for
  *
  * Allocate a new dma_resv_list and make sure to correctly initialize
- * shared_max.
+ * max_fences.
  */
-static struct dma_resv_list *dma_resv_list_alloc(unsigned int shared_max)
+static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
 {
 	struct dma_resv_list *list;
 
-	list = kmalloc(struct_size(list, shared, shared_max), GFP_KERNEL);
+	list = kmalloc(struct_size(list, table, max_fences), GFP_KERNEL);
 	if (!list)
 		return NULL;
 
-	list->shared_max = (ksize(list) - offsetof(typeof(*list), shared)) /
-		sizeof(*list->shared);
+	list->max_fences = (ksize(list) - offsetof(typeof(*list), table)) /
+		sizeof(*list->table);
 
 	return list;
 }
@@ -104,9 +148,12 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 	if (!list)
 		return;
 
-	for (i = 0; i < list->shared_count; ++i)
-		dma_fence_put(rcu_dereference_protected(list->shared[i], true));
+	for (i = 0; i < list->num_fences; ++i) {
+		struct dma_fence *fence;
 
+		dma_resv_list_entry(list, i, true, &fence, NULL);
+		dma_fence_put(fence);
+	}
 	kfree_rcu(list, rcu);
 }
 
@@ -119,8 +166,7 @@ void dma_resv_init(struct dma_resv *obj)
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
 	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
 
-	RCU_INIT_POINTER(obj->fence, NULL);
-	RCU_INIT_POINTER(obj->fence_excl, NULL);
+	RCU_INIT_POINTER(obj->fences, NULL);
 }
 EXPORT_SYMBOL(dma_resv_init);
 
@@ -130,81 +176,54 @@ EXPORT_SYMBOL(dma_resv_init);
  */
 void dma_resv_fini(struct dma_resv *obj)
 {
-	struct dma_resv_list *fobj;
-	struct dma_fence *excl;
-
 	/*
 	 * This object should be dead and all references must have
 	 * been released to it, so no need to be protected with rcu.
 	 */
-	excl = rcu_dereference_protected(obj->fence_excl, 1);
-	if (excl)
-		dma_fence_put(excl);
-
-	fobj = rcu_dereference_protected(obj->fence, 1);
-	dma_resv_list_free(fobj);
+	dma_resv_list_free(rcu_dereference_protected(obj->fences, true));
 	ww_mutex_destroy(&obj->lock);
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
 /**
- * dma_resv_excl_fence - return the object's exclusive fence
+ * dma_resv_fences_list - return the dma_resv object's fence list
  * @obj: the reservation object
  *
- * Returns the exclusive fence (if any). Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- *
- * RETURNS
- * The exclusive fence or NULL
+ * Returns the fence list. Caller must either hold the objects through
+ * dma_resv_lock() or the RCU read side lock through rcu_read_lock().
  */
-static inline struct dma_fence *
-dma_resv_excl_fence(struct dma_resv *obj)
+static inline struct dma_resv_list *dma_resv_fences_list(struct dma_resv *obj)
 {
-	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
+	return rcu_dereference_check(obj->fences, dma_resv_held(obj));
 }
 
 /**
- * dma_resv_shared_list - get the reservation object's shared fence list
- * @obj: the reservation object
- *
- * Returns the shared fence list. Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- */
-static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
-}
-
-/**
- * dma_resv_reserve_shared - Reserve space to add shared fences to
- * a dma_resv.
+ * dma_resv_reserve_fences - Reserve space to add fences to a dma_resv object.
  * @obj: reservation object
  * @num_fences: number of fences we want to add
  *
- * Should be called before dma_resv_add_shared_fence().  Must
- * be called with @obj locked through dma_resv_lock().
+ * Should be called before dma_resv_add_fence().  Must be called with @obj
+ * locked through dma_resv_lock().
  *
  * Note that the preallocated slots need to be re-reserved if @obj is unlocked
- * at any time before calling dma_resv_add_shared_fence(). This is validated
- * when CONFIG_DEBUG_MUTEXES is enabled.
+ * at any time before calling dma_resv_add_fence(). This is validated when
+ * CONFIG_DEBUG_MUTEXES is enabled.
  *
  * RETURNS
  * Zero for success, or -errno
  */
-int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
+int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 {
 	struct dma_resv_list *old, *new;
 	unsigned int i, j, k, max;
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_shared_list(obj);
-	if (old && old->shared_max) {
-		if ((old->shared_count + num_fences) <= old->shared_max)
+	old = dma_resv_fences_list(obj);
+	if (old && old->max_fences) {
+		if ((old->num_fences + num_fences) <= old->max_fences)
 			return 0;
-		max = max(old->shared_count + num_fences, old->shared_max * 2);
+		max = max(old->num_fences + num_fences, old->max_fences * 2);
 	} else {
 		max = max(4ul, roundup_pow_of_two(num_fences));
 	}
@@ -219,27 +238,27 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 	 * references from the old struct are carried over to
 	 * the new.
 	 */
-	for (i = 0, j = 0, k = max; i < (old ? old->shared_count : 0); ++i) {
+	for (i = 0, j = 0, k = max; i < (old ? old->num_fences : 0); ++i) {
+		enum dma_resv_usage usage;
 		struct dma_fence *fence;
 
-		fence = rcu_dereference_protected(old->shared[i],
-						  dma_resv_held(obj));
+		dma_resv_list_entry(old, i, dma_resv_held(obj), &fence, &usage);
 		if (dma_fence_is_signaled(fence))
-			RCU_INIT_POINTER(new->shared[--k], fence);
+			RCU_INIT_POINTER(new->table[--k], fence);
 		else
-			RCU_INIT_POINTER(new->shared[j++], fence);
+			dma_resv_list_set(new, j++, fence, usage);
 	}
-	new->shared_count = j;
+	new->num_fences = j;
 
 	/*
 	 * We are not changing the effective set of fences here so can
 	 * merely update the pointer to the new array; both existing
 	 * readers and new readers will see exactly the same set of
-	 * active (unsignaled) shared fences. Individual fences and the
+	 * active (unsignaled) fences. Individual fences and the
 	 * old array are protected by RCU and so will not vanish under
 	 * the gaze of the rcu_read_lock() readers.
 	 */
-	rcu_assign_pointer(obj->fence, new);
+	rcu_assign_pointer(obj->fences, new);
 
 	if (!old)
 		return 0;
@@ -248,7 +267,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 	for (i = k; i < max; ++i) {
 		struct dma_fence *fence;
 
-		fence = rcu_dereference_protected(new->shared[i],
+		fence = rcu_dereference_protected(new->table[i],
 						  dma_resv_held(obj));
 		dma_fence_put(fence);
 	}
@@ -256,41 +275,43 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 
 	return 0;
 }
-EXPORT_SYMBOL(dma_resv_reserve_shared);
+EXPORT_SYMBOL(dma_resv_reserve_fences);
 
 #ifdef CONFIG_DEBUG_MUTEXES
 /**
- * dma_resv_reset_shared_max - reset shared fences for debugging
+ * dma_resv_reset_max_fences - reset fences for debugging
  * @obj: the dma_resv object to reset
  *
- * Reset the number of pre-reserved shared slots to test that drivers do
- * correct slot allocation using dma_resv_reserve_shared(). See also
- * &dma_resv_list.shared_max.
+ * Reset the number of pre-reserved fence slots to test that drivers do
+ * correct slot allocation using dma_resv_reserve_fences(). See also
+ * &dma_resv_list.max_fences.
  */
-void dma_resv_reset_shared_max(struct dma_resv *obj)
+void dma_resv_reset_max_fences(struct dma_resv *obj)
 {
-	struct dma_resv_list *fences = dma_resv_shared_list(obj);
+	struct dma_resv_list *fences = dma_resv_fences_list(obj);
 
 	dma_resv_assert_held(obj);
 
-	/* Test shared fence slot reservation */
+	/* Test fence slot reservation */
 	if (fences)
-		fences->shared_max = fences->shared_count;
+		fences->max_fences = fences->num_fences;
 }
-EXPORT_SYMBOL(dma_resv_reset_shared_max);
+EXPORT_SYMBOL(dma_resv_reset_max_fences);
 #endif
 
 /**
- * dma_resv_add_shared_fence - Add a fence to a shared slot
+ * dma_resv_add_fence - Add a fence to the dma_resv obj
  * @obj: the reservation object
- * @fence: the shared fence to add
+ * @fence: the fence to add
+ * @usage: how the fence is used, see enum dma_resv_usage
  *
- * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(), and
- * dma_resv_reserve_shared() has been called.
+ * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
+ * dma_resv_reserve_fences() has been called.
  *
  * See also &dma_resv.fence for a discussion of the semantics.
  */
-void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
+void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
+			enum dma_resv_usage usage)
 {
 	struct dma_resv_list *fobj;
 	struct dma_fence *old;
@@ -300,39 +321,41 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
-	fobj = dma_resv_shared_list(obj);
-	count = fobj->shared_count;
+	fobj = dma_resv_fences_list(obj);
+	count = fobj->num_fences;
 
 	write_seqcount_begin(&obj->seq);
 
 	for (i = 0; i < count; ++i) {
+		enum dma_resv_usage old_usage;
 
-		old = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(obj));
-		if (old->context == fence->context ||
+		dma_resv_list_entry(fobj, i, dma_resv_held(obj),
+				    &old, &old_usage);
+		if ((old->context == fence->context && old_usage >= usage) ||
 		    dma_fence_is_signaled(old))
 			goto replace;
 	}
 
-	BUG_ON(fobj->shared_count >= fobj->shared_max);
+	BUG_ON(fobj->num_fences >= fobj->max_fences);
 	old = NULL;
 	count++;
 
 replace:
-	RCU_INIT_POINTER(fobj->shared[i], fence);
-	/* pointer update must be visible before we extend the shared_count */
-	smp_store_mb(fobj->shared_count, count);
+	dma_resv_list_set(fobj, i, fence, usage);
+	/* pointer update must be visible before we extend the num_fences */
+	smp_store_mb(fobj->num_fences, count);
 
 	write_seqcount_end(&obj->seq);
 	dma_fence_put(old);
 }
-EXPORT_SYMBOL(dma_resv_add_shared_fence);
+EXPORT_SYMBOL(dma_resv_add_fence);
 
 /**
  * dma_resv_replace_fences - replace fences in the dma_resv obj
  * @obj: the reservation object
  * @context: the context of the fences to replace
  * @replacement: the new fence to use instead
+ * @usage: how the new fence is used, see enum dma_resv_usage
  *
  * Replace fences with a specified context with a new fence. Only valid if the
  * operation represented by the original fences is completed or has no longer
@@ -340,63 +363,30 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
  * completes.
  */
 void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
-			     struct dma_fence *replacement)
+			     struct dma_fence *replacement,
+			     enum dma_resv_usage usage)
 {
 	struct dma_resv_list *list;
-	struct dma_fence *old;
 	unsigned int i;
 
 	dma_resv_assert_held(obj);
 
+	list = dma_resv_fences_list(obj);
 	write_seqcount_begin(&obj->seq);
+	for (i = 0; list && i < list->num_fences; ++i) {
+		struct dma_fence *old;
 
-	old = dma_resv_excl_fence(obj);
-	if (old->context == context) {
-		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
-		dma_fence_put(old);
-	}
-
-	list = dma_resv_shared_list(obj);
-	for (i = 0; list && i < list->shared_count; ++i) {
-		old = rcu_dereference_protected(list->shared[i],
-						dma_resv_held(obj));
+		dma_resv_list_entry(list, i, dma_resv_held(obj), &old, NULL);
 		if (old->context != context)
 			continue;
 
-		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
+		dma_resv_list_set(list, i, replacement, usage);
 		dma_fence_put(old);
 	}
-
 	write_seqcount_end(&obj->seq);
 }
 EXPORT_SYMBOL(dma_resv_replace_fences);
 
-/**
- * dma_resv_add_excl_fence - Add an exclusive fence.
- * @obj: the reservation object
- * @fence: the exclusive fence to add
- *
- * Add a fence to the exclusive slot. @obj must be locked with dma_resv_lock().
- * Note that this function replaces all fences attached to @obj, see also
- * &dma_resv.fence_excl for a discussion of the semantics.
- */
-void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
-{
-	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
-
-	dma_resv_assert_held(obj);
-
-	dma_fence_get(fence);
-
-	write_seqcount_begin(&obj->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(obj->fence_excl, fence);
-	write_seqcount_end(&obj->seq);
-
-	dma_fence_put(old_fence);
-}
-EXPORT_SYMBOL(dma_resv_add_excl_fence);
-
 /**
  * dma_resv_iter_restart_unlocked - restart the unlocked iterator
  * @cursor: The dma_resv_iter object to restart
@@ -406,15 +396,11 @@ EXPORT_SYMBOL(dma_resv_add_excl_fence);
 static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
 {
 	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
-	cursor->index = -1;
-	cursor->shared_count = 0;
-	if (cursor->usage >= DMA_RESV_USAGE_READ) {
-		cursor->fences = dma_resv_shared_list(cursor->obj);
-		if (cursor->fences)
-			cursor->shared_count = cursor->fences->shared_count;
-	} else {
-		cursor->fences = NULL;
-	}
+	cursor->index = 0;
+	cursor->num_fences = 0;
+	cursor->fences = dma_resv_fences_list(cursor->obj);
+	if (cursor->fences)
+		cursor->num_fences = cursor->fences->num_fences;
 	cursor->is_restarted = true;
 }
 
@@ -428,31 +414,29 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
  */
 static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
 {
-	struct dma_resv *obj = cursor->obj;
+	if (!cursor->fences)
+		return;
 
 	do {
 		/* Drop the reference from the previous round */
 		dma_fence_put(cursor->fence);
 
-		if (cursor->index == -1) {
-			cursor->fence = dma_resv_excl_fence(obj);
-			cursor->index++;
-			if (!cursor->fence)
-				continue;
-
-		} else if (!cursor->fences ||
-			   cursor->index >= cursor->shared_count) {
+		if (cursor->index >= cursor->num_fences) {
 			cursor->fence = NULL;
 			break;
 
-		} else {
-			struct dma_resv_list *fences = cursor->fences;
-			unsigned int idx = cursor->index++;
-
-			cursor->fence = rcu_dereference(fences->shared[idx]);
 		}
+
+		dma_resv_list_entry(cursor->fences, cursor->index++,
+				    dma_resv_held(cursor->obj),
+				    &cursor->fence,
+				    &cursor->fence_usage);
 		cursor->fence = dma_fence_get_rcu(cursor->fence);
-		if (!cursor->fence || !dma_fence_is_signaled(cursor->fence))
+		if (!cursor->fence)
+			break;
+
+		if (!dma_fence_is_signaled(cursor->fence) &&
+		    cursor->usage >= cursor->fence_usage)
 			break;
 	} while (true);
 }
@@ -515,15 +499,9 @@ struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
 	dma_resv_assert_held(cursor->obj);
 
 	cursor->index = 0;
-	if (cursor->usage >= DMA_RESV_USAGE_READ)
-		cursor->fences = dma_resv_shared_list(cursor->obj);
-	else
-		cursor->fences = NULL;
-
-	fence = dma_resv_excl_fence(cursor->obj);
-	if (!fence)
-		fence = dma_resv_iter_next(cursor);
+	cursor->fences = dma_resv_fences_list(cursor->obj);
 
+	fence = dma_resv_iter_next(cursor);
 	cursor->is_restarted = true;
 	return fence;
 }
@@ -538,17 +516,18 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_first);
  */
 struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
 {
-	unsigned int idx;
+	struct dma_fence *fence;
 
 	dma_resv_assert_held(cursor->obj);
 
 	cursor->is_restarted = false;
-	if (!cursor->fences || cursor->index >= cursor->fences->shared_count)
+	if (!cursor->fences || cursor->index >= cursor->fences->num_fences)
 		return NULL;
 
-	idx = cursor->index++;
-	return rcu_dereference_protected(cursor->fences->shared[idx],
-					 dma_resv_held(cursor->obj));
+	dma_resv_list_entry(cursor->fences, cursor->index++,
+			    dma_resv_held(cursor->obj),
+			    &fence, &cursor->fence_usage);
+	return fence;
 }
 EXPORT_SYMBOL_GPL(dma_resv_iter_next);
 
@@ -563,57 +542,43 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
 	struct dma_resv_iter cursor;
 	struct dma_resv_list *list;
-	struct dma_fence *f, *excl;
+	struct dma_fence *f;
 
 	dma_resv_assert_held(dst);
 
 	list = NULL;
-	excl = NULL;
 
 	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
 	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
 			dma_resv_list_free(list);
-			dma_fence_put(excl);
-
-			if (cursor.shared_count) {
-				list = dma_resv_list_alloc(cursor.shared_count);
-				if (!list) {
-					dma_resv_iter_end(&cursor);
-					return -ENOMEM;
-				}
-
-				list->shared_count = 0;
 
-			} else {
-				list = NULL;
+			list = dma_resv_list_alloc(cursor.num_fences);
+			if (!list) {
+				dma_resv_iter_end(&cursor);
+				return -ENOMEM;
 			}
-			excl = NULL;
+			list->num_fences = 0;
 		}
 
 		dma_fence_get(f);
-		if (dma_resv_iter_is_exclusive(&cursor))
-			excl = f;
-		else
-			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
+		dma_resv_list_set(list, list->num_fences++, f,
+				  dma_resv_iter_usage(&cursor));
 	}
 	dma_resv_iter_end(&cursor);
 
 	write_seqcount_begin(&dst->seq);
-	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
-	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
+	list = rcu_replace_pointer(dst->fences, list, dma_resv_held(dst));
 	write_seqcount_end(&dst->seq);
 
 	dma_resv_list_free(list);
-	dma_fence_put(excl);
-
 	return 0;
 }
 EXPORT_SYMBOL(dma_resv_copy_fences);
 
 /**
- * dma_resv_get_fences - Get an object's shared and exclusive
+ * dma_resv_get_fences - Get an object's fences
  * fences without update side lock held
  * @obj: the reservation object
  * @usage: controls which fences to include, see enum dma_resv_usage.
@@ -642,7 +607,7 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
 			while (*num_fences)
 				dma_fence_put((*fences)[--(*num_fences)]);
 
-			count = cursor.shared_count + 1;
+			count = cursor.num_fences + 1;
 
 			/* Eventually re-allocate the array */
 			*fences = krealloc_array(*fences, count,
@@ -714,8 +679,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
 EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
 
 /**
- * dma_resv_wait_timeout - Wait on reservation's objects
- * shared and/or exclusive fences.
+ * dma_resv_wait_timeout - Wait on reservation's objects fences
  * @obj: the reservation object
  * @usage: controls which fences to include, see enum dma_resv_usage.
  * @intr: if true, do interruptible wait
@@ -788,13 +752,13 @@ EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
  */
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
 {
+	static const char *usage[] = { "kernel", "write", "read", "other" };
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
 	dma_resv_for_each_fence(&cursor, obj, true, fence) {
 		seq_printf(seq, "\t%s fence:",
-			   dma_resv_iter_is_exclusive(&cursor) ?
-				"Exclusive" : "Shared");
+			   usage[dma_resv_iter_usage(&cursor)]);
 		dma_fence_describe(fence, seq);
 	}
 }
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index a52c5fbea87a..d0f7c2bfd4f0 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -58,8 +58,9 @@ static int sanitycheck(void *arg)
 	return r;
 }
 
-static int test_signaling(void *arg, enum dma_resv_usage usage)
+static int test_signaling(void *arg)
 {
+	enum dma_resv_usage usage = (unsigned long)arg;
 	struct dma_resv resv;
 	struct dma_fence *f;
 	int r;
@@ -75,17 +76,13 @@ static int test_signaling(void *arg, enum dma_resv_usage usage)
 		goto err_free;
 	}
 
-	r = dma_resv_reserve_shared(&resv, 1);
+	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
 		pr_err("Resv shared slot allocation failed\n");
 		goto err_unlock;
 	}
 
-	if (usage >= DMA_RESV_USAGE_READ)
-		dma_resv_add_shared_fence(&resv, f);
-	else
-		dma_resv_add_excl_fence(&resv, f);
-
+	dma_resv_add_fence(&resv, f, usage);
 	if (dma_resv_test_signaled(&resv, usage)) {
 		pr_err("Resv unexpectedly signaled\n");
 		r = -EINVAL;
@@ -105,18 +102,9 @@ static int test_signaling(void *arg, enum dma_resv_usage usage)
 	return r;
 }
 
-static int test_excl_signaling(void *arg)
-{
-	return test_signaling(arg, DMA_RESV_USAGE_WRITE);
-}
-
-static int test_shared_signaling(void *arg)
-{
-	return test_signaling(arg, DMA_RESV_USAGE_READ);
-}
-
-static int test_for_each(void *arg, enum dma_resv_usage usage)
+static int test_for_each(void *arg)
 {
+	enum dma_resv_usage usage = (unsigned long)arg;
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
 	struct dma_resv resv;
@@ -133,16 +121,13 @@ static int test_for_each(void *arg, enum dma_resv_usage usage)
 		goto err_free;
 	}
 
-	r = dma_resv_reserve_shared(&resv, 1);
+	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
 		pr_err("Resv shared slot allocation failed\n");
 		goto err_unlock;
 	}
 
-	if (usage >= DMA_RESV_USAGE_READ)
-		dma_resv_add_shared_fence(&resv, f);
-	else
-		dma_resv_add_excl_fence(&resv, f);
+	dma_resv_add_fence(&resv, f, usage);
 
 	r = -ENOENT;
 	dma_resv_for_each_fence(&cursor, &resv, usage, fence) {
@@ -156,8 +141,7 @@ static int test_for_each(void *arg, enum dma_resv_usage usage)
 			r = -EINVAL;
 			goto err_unlock;
 		}
-		if (dma_resv_iter_is_exclusive(&cursor) !=
-		    (usage >= DMA_RESV_USAGE_READ)) {
+		if (dma_resv_iter_usage(&cursor) != usage) {
 			pr_err("Unexpected fence usage\n");
 			r = -EINVAL;
 			goto err_unlock;
@@ -177,18 +161,9 @@ static int test_for_each(void *arg, enum dma_resv_usage usage)
 	return r;
 }
 
-static int test_excl_for_each(void *arg)
-{
-	return test_for_each(arg, DMA_RESV_USAGE_WRITE);
-}
-
-static int test_shared_for_each(void *arg)
-{
-	return test_for_each(arg, DMA_RESV_USAGE_READ);
-}
-
-static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
+static int test_for_each_unlocked(void *arg)
 {
+	enum dma_resv_usage usage = (unsigned long)arg;
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
 	struct dma_resv resv;
@@ -205,17 +180,14 @@ static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
 		goto err_free;
 	}
 
-	r = dma_resv_reserve_shared(&resv, 1);
+	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
 		pr_err("Resv shared slot allocation failed\n");
 		dma_resv_unlock(&resv);
 		goto err_free;
 	}
 
-	if (usage >= DMA_RESV_USAGE_READ)
-		dma_resv_add_shared_fence(&resv, f);
-	else
-		dma_resv_add_excl_fence(&resv, f);
+	dma_resv_add_fence(&resv, f, usage);
 	dma_resv_unlock(&resv);
 
 	r = -ENOENT;
@@ -235,8 +207,7 @@ static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
 			r = -EINVAL;
 			goto err_iter_end;
 		}
-		if (dma_resv_iter_is_exclusive(&cursor) !=
-		    (usage >= DMA_RESV_USAGE_READ)) {
+		if (dma_resv_iter_usage(&cursor) != usage) {
 			pr_err("Unexpected fence usage\n");
 			r = -EINVAL;
 			goto err_iter_end;
@@ -262,18 +233,9 @@ static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
 	return r;
 }
 
-static int test_excl_for_each_unlocked(void *arg)
-{
-	return test_for_each_unlocked(arg, DMA_RESV_USAGE_WRITE);
-}
-
-static int test_shared_for_each_unlocked(void *arg)
-{
-	return test_for_each_unlocked(arg, DMA_RESV_USAGE_READ);
-}
-
-static int test_get_fences(void *arg, enum dma_resv_usage usage)
+static int test_get_fences(void *arg)
 {
+	enum dma_resv_usage usage = (unsigned long)arg;
 	struct dma_fence *f, **fences = NULL;
 	struct dma_resv resv;
 	int r, i;
@@ -289,17 +251,14 @@ static int test_get_fences(void *arg, enum dma_resv_usage usage)
 		goto err_resv;
 	}
 
-	r = dma_resv_reserve_shared(&resv, 1);
+	r = dma_resv_reserve_fences(&resv, 1);
 	if (r) {
 		pr_err("Resv shared slot allocation failed\n");
 		dma_resv_unlock(&resv);
 		goto err_resv;
 	}
 
-	if (usage >= DMA_RESV_USAGE_READ)
-		dma_resv_add_shared_fence(&resv, f);
-	else
-		dma_resv_add_excl_fence(&resv, f);
+	dma_resv_add_fence(&resv, f, usage);
 	dma_resv_unlock(&resv);
 
 	r = dma_resv_get_fences(&resv, usage, &i, &fences);
@@ -324,30 +283,24 @@ static int test_get_fences(void *arg, enum dma_resv_usage usage)
 	return r;
 }
 
-static int test_excl_get_fences(void *arg)
-{
-	return test_get_fences(arg, DMA_RESV_USAGE_WRITE);
-}
-
-static int test_shared_get_fences(void *arg)
-{
-	return test_get_fences(arg, DMA_RESV_USAGE_READ);
-}
-
 int dma_resv(void)
 {
 	static const struct subtest tests[] = {
 		SUBTEST(sanitycheck),
-		SUBTEST(test_excl_signaling),
-		SUBTEST(test_shared_signaling),
-		SUBTEST(test_excl_for_each),
-		SUBTEST(test_shared_for_each),
-		SUBTEST(test_excl_for_each_unlocked),
-		SUBTEST(test_shared_for_each_unlocked),
-		SUBTEST(test_excl_get_fences),
-		SUBTEST(test_shared_get_fences),
+		SUBTEST(test_signaling),
+		SUBTEST(test_for_each),
+		SUBTEST(test_for_each_unlocked),
+		SUBTEST(test_get_fences),
 	};
+	enum dma_resv_usage usage;
+	int r;
 
 	spin_lock_init(&fence_lock);
-	return subtests(tests, NULL);
+	for (usage = DMA_RESV_USAGE_WRITE; usage <= DMA_RESV_USAGE_READ;
+	     ++usage) {
+		r = subtests(tests, (void *)(unsigned long)usage);
+		if (r)
+			return r;
+	}
+	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index b558ef0f8c4a..4a469831afe3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -246,7 +246,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	 */
 	replacement = dma_fence_get_stub();
 	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
-				replacement);
+				replacement, DMA_RESV_USAGE_READ);
 	dma_fence_put(replacement);
 	return 0;
 }
@@ -1207,7 +1207,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 				  AMDGPU_FENCE_OWNER_KFD, false);
 	if (ret)
 		goto wait_pd_fail;
-	ret = dma_resv_reserve_shared(vm->root.bo->tbo.base.resv, 1);
+	ret = dma_resv_reserve_fences(vm->root.bo->tbo.base.resv, 1);
 	if (ret)
 		goto reserve_shared_fail;
 	amdgpu_bo_fence(vm->root.bo,
@@ -2454,7 +2454,7 @@ int amdgpu_amdkfd_add_gws_to_process(void *info, void *gws, struct kgd_mem **mem
 	 * Add process eviction fence to bo so they can
 	 * evict each other.
 	 */
-	ret = dma_resv_reserve_shared(gws_bo->tbo.base.resv, 1);
+	ret = dma_resv_reserve_fences(gws_bo->tbo.base.resv, 1);
 	if (ret)
 		goto reserve_shared_fail;
 	amdgpu_bo_fence(gws_bo, &process_info->eviction_fence->base, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index af0a61ce2ec7..92091e800022 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -54,8 +54,8 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
 	bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
 	p->uf_entry.priority = 0;
 	p->uf_entry.tv.bo = &bo->tbo;
-	/* One for TTM and one for the CS job */
-	p->uf_entry.tv.num_shared = 2;
+	/* One for TTM and two for the CS job */
+	p->uf_entry.tv.num_shared = 3;
 
 	drm_gem_object_put(gobj);
 
@@ -1285,7 +1285,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 			break;
 		}
 		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
-		rcu_assign_pointer(resv->fence_excl, &chain->base);
+		dma_resv_add_fence(resv, &chain->base, DMA_RESV_USAGE_WRITE);
 		e->chain = NULL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 7715390aff7a..eaa19154551c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1369,17 +1369,15 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
 	struct dma_resv *resv = bo->tbo.base.resv;
 	int r;
 
-	r = dma_resv_reserve_shared(resv, 1);
+	r = dma_resv_reserve_fences(resv, 1);
 	if (r) {
 		/* As last resort on OOM we block for the fence */
 		dma_fence_wait(fence, false);
 		return;
 	}
 
-	if (shared)
-		dma_resv_add_shared_fence(resv, fence);
-	else
-		dma_resv_add_excl_fence(resv, fence);
+	dma_resv_add_fence(resv, fence, shared ? DMA_RESV_USAGE_READ :
+			   DMA_RESV_USAGE_WRITE);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index e82997dbc0a4..9eac1e783bbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2969,7 +2969,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	if (r)
 		goto error_free_root;
 
-	r = dma_resv_reserve_shared(root_bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
 	if (r)
 		goto error_unreserve;
 
@@ -3412,7 +3412,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 		value = 0;
 	}
 
-	r = dma_resv_reserve_shared(root->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(root->tbo.base.resv, 1);
 	if (r) {
 		pr_debug("failed %d to reserve fence slot\n", r);
 		goto error_unlock;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 16137c4247bb..a30aa9bf41a4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -524,7 +524,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 		goto reserve_bo_failed;
 	}
 
-	r = dma_resv_reserve_shared(bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
 	if (r) {
 		pr_debug("failed %d to reserve bo\n", r);
 		amdgpu_bo_unreserve(bo);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3b8d49319d8c..2d77e469ef3c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -180,7 +180,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		struct dma_resv *robj = bo->obj->base.resv;
 		enum dma_resv_usage usage;
 
-		ret = dma_resv_reserve_shared(robj, 1);
+		ret = dma_resv_reserve_fences(robj, 1);
 		if (ret)
 			return ret;
 
@@ -203,14 +203,10 @@ static void submit_attach_object_fences(struct etnaviv_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
+		bool write = submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE;
 
-		if (submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE)
-			dma_resv_add_excl_fence(obj->resv,
-							  submit->out_fence);
-		else
-			dma_resv_add_shared_fence(obj->resv,
-							    submit->out_fence);
-
+		dma_resv_add_fence(obj->resv, submit->out_fence, write ?
+				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
 		submit_unlock_object(submit, i);
 	}
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 14a1c0ad8c3c..e7ae94ee1b44 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -148,12 +148,13 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 		if (dma_resv_iter_is_restarted(&cursor))
 			args->busy = 0;
 
-		if (dma_resv_iter_is_exclusive(&cursor))
-			/* Translate the exclusive fence to the READ *and* WRITE engine */
-			args->busy |= busy_check_writer(fence);
-		else
-			/* Translate shared fences to READ set of engines */
-			args->busy |= busy_check_reader(fence);
+		/* Translate read fences to READ set of engines */
+		args->busy |= busy_check_reader(fence);
+	}
+	dma_resv_iter_begin(&cursor, obj->base.resv, DMA_RESV_USAGE_WRITE);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		/* Translate the write fences to the READ *and* WRITE engine */
+		args->busy |= busy_check_writer(fence);
 	}
 	dma_resv_iter_end(&cursor);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index fc57ab914b60..e70fb65bb54f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -101,14 +101,15 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 
 	clflush = NULL;
 	if (!(flags & I915_CLFLUSH_SYNC) &&
-	    dma_resv_reserve_shared(obj->base.resv, 1) == 0)
+	    dma_resv_reserve_fences(obj->base.resv, 1) == 0)
 		clflush = clflush_work_create(obj);
 	if (clflush) {
 		i915_sw_fence_await_reservation(&clflush->base.chain,
 						obj->base.resv, NULL, true,
 						i915_fence_timeout(to_i915(obj->base.dev)),
 						I915_FENCE_GFP);
-		dma_resv_add_excl_fence(obj->base.resv, &clflush->base.dma);
+		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
+				   DMA_RESV_USAGE_WRITE);
 		dma_fence_work_commit(&clflush->base);
 	} else if (obj->mm.pages) {
 		__do_clflush(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index fc0e1625847c..3eb3716a35f1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -989,7 +989,7 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 			}
 		}
 
-		err = dma_resv_reserve_shared(vma->resv, 1);
+		err = dma_resv_reserve_fences(vma->resv, 1);
 		if (err)
 			return err;
 
@@ -2162,7 +2162,7 @@ static int eb_parse(struct i915_execbuffer *eb)
 		goto err_trampoline;
 	}
 
-	err = dma_resv_reserve_shared(shadow->resv, 1);
+	err = dma_resv_reserve_fences(shadow->resv, 1);
 	if (err)
 		goto err_trampoline;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 2bf491fd5cdf..2b4cde8250b6 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -179,7 +179,7 @@ static int igt_lmem_pages_migrate(void *arg)
 					  i915_gem_object_is_lmem(obj),
 					  0xdeadbeaf, &rq);
 		if (rq) {
-			err = dma_resv_reserve_shared(obj->base.resv, 1);
+			err = dma_resv_reserve_fences(obj->base.resv, 1);
 			if (!err)
 				dma_resv_add_excl_fence(obj->base.resv,
 							&rq->fence);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 5ec87de63963..23d92b233b3b 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1256,25 +1256,27 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 		}
 
 		if (!(flags & __EXEC_OBJECT_NO_RESERVE)) {
-			err = dma_resv_reserve_shared(vma->resv, 1);
+			err = dma_resv_reserve_fences(vma->resv, 1);
 			if (unlikely(err))
 				return err;
 		}
 
 		if (fence) {
-			dma_resv_add_excl_fence(vma->resv, fence);
+			dma_resv_add_fence(vma->resv, fence,
+					   DMA_RESV_USAGE_WRITE);
 			obj->write_domain = I915_GEM_DOMAIN_RENDER;
 			obj->read_domains = 0;
 		}
 	} else {
 		if (!(flags & __EXEC_OBJECT_NO_RESERVE)) {
-			err = dma_resv_reserve_shared(vma->resv, 1);
+			err = dma_resv_reserve_fences(vma->resv, 1);
 			if (unlikely(err))
 				return err;
 		}
 
 		if (fence) {
-			dma_resv_add_shared_fence(vma->resv, fence);
+			dma_resv_add_fence(vma->resv, fence,
+					   DMA_RESV_USAGE_READ);
 			obj->write_domain = 0;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index b85af1672a7e..3e0edee1b238 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -895,7 +895,7 @@ static int igt_lmem_write_cpu(void *arg)
 
 	i915_gem_object_lock(obj, NULL);
 
-	err = dma_resv_reserve_shared(obj->base.resv, 1);
+	err = dma_resv_reserve_fences(obj->base.resv, 1);
 	if (err) {
 		i915_gem_object_unlock(obj);
 		goto out_put;
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index b4846007463f..cc076bd87323 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -257,7 +257,7 @@ static int lima_gem_sync_bo(struct lima_sched_task *task, struct lima_bo *bo,
 {
 	int err;
 
-	err = dma_resv_reserve_shared(lima_bo_resv(bo), 1);
+	err = dma_resv_reserve_fences(lima_bo_resv(bo), 1);
 	if (err)
 		return err;
 
@@ -365,7 +365,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
 			dma_resv_add_excl_fence(lima_bo_resv(bos[i]), fence);
 		else
-			dma_resv_add_shared_fence(lima_bo_resv(bos[i]), fence);
+			dma_resv_add_fence(lima_bo_resv(bos[i]), fence);
 	}
 
 	drm_gem_unlock_reservations((struct drm_gem_object **)bos,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e874d09b74ef..dcaaa7e2a342 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -325,7 +325,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		 * strange place to call it.  OTOH this is a
 		 * convenient can-fail point to hook it in.
 		 */
-		ret = dma_resv_reserve_shared(obj->resv, 1);
+		ret = dma_resv_reserve_fences(obj->resv, 1);
 		if (ret)
 			return ret;
 
@@ -397,7 +397,7 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_excl_fence(obj->resv, submit->user_fence);
 		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
-			dma_resv_add_shared_fence(obj->resv, submit->user_fence);
+			dma_resv_add_fence(obj->resv, submit->user_fence);
 	}
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c6bb4dbcd735..05076e530e7d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1308,10 +1308,11 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence, bool excl
 {
 	struct dma_resv *resv = nvbo->bo.base.resv;
 
-	if (exclusive)
-		dma_resv_add_excl_fence(resv, &fence->base);
-	else if (fence)
-		dma_resv_add_shared_fence(resv, &fence->base);
+	if (!fence)
+		return;
+
+	dma_resv_add_fence(resv, &fence->base, exclusive ?
+			   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 26725e23c075..02a7b86b74a7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -349,7 +349,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
 	struct nouveau_fence *f;
 	int ret;
 
-	ret = dma_resv_reserve_shared(resv, 1);
+	ret = dma_resv_reserve_fences(resv, 1);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 89c3fe389476..cca50cbb7f0b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -247,7 +247,7 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
-		ret = dma_resv_reserve_shared(bos[i]->resv, 1);
+		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 469979cd0341..368d26da0d6a 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -200,7 +200,7 @@ static int qxl_release_validate_bo(struct qxl_bo *bo)
 			return ret;
 	}
 
-	ret = dma_resv_reserve_shared(bo->tbo.base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
 	if (ret)
 		return ret;
 
@@ -429,7 +429,8 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 	list_for_each_entry(entry, &release->bos, head) {
 		bo = entry->bo;
 
-		dma_resv_add_shared_fence(bo->base.resv, &release->base);
+		dma_resv_add_fence(bo->base.resv, &release->base,
+				   DMA_RESV_USAGE_READ);
 		ttm_bo_move_to_lru_tail_unlocked(bo);
 		dma_resv_unlock(bo->base.resv);
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 56ede9d63b12..915194345e20 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -809,8 +809,6 @@ void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
 {
 	struct dma_resv *resv = bo->tbo.base.resv;
 
-	if (shared)
-		dma_resv_add_shared_fence(resv, &fence->base);
-	else
-		dma_resv_add_excl_fence(resv, &fence->base);
+	dma_resv_add_fence(resv, &fence->base, shared ?
+			   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
 }
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index bb53016f3138..987cabbf1318 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -831,7 +831,7 @@ static int radeon_vm_update_ptes(struct radeon_device *rdev,
 		int r;
 
 		radeon_sync_resv(rdev, &ib->sync, pt->tbo.base.resv, true);
-		r = dma_resv_reserve_shared(pt->tbo.base.resv, 1);
+		r = dma_resv_reserve_fences(pt->tbo.base.resv, 1);
 		if (r)
 			return r;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9d9a0039359c..f52b451e26dc 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -762,9 +762,9 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	dma_resv_add_shared_fence(bo->base.resv, fence);
+	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
 
-	ret = dma_resv_reserve_shared(bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret)) {
 		dma_fence_put(fence);
 		return ret;
@@ -823,7 +823,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	bool type_found = false;
 	int i, ret;
 
-	ret = dma_resv_reserve_shared(bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret))
 		return ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ea9eabcc0a0c..e56e16a7f886 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -243,7 +243,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	ret = dma_resv_trylock(&fbo->base.base._resv);
 	WARN_ON(!ret);
 
-	ret = dma_resv_reserve_shared(&fbo->base.base._resv, 1);
+	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
 	if (ret) {
 		kfree(fbo);
 		return ret;
@@ -503,7 +503,8 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;
 
-	dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
+	dma_resv_add_fence(&ghost_obj->base._resv, fence,
+			   DMA_RESV_USAGE_WRITE);
 
 	/**
 	 * If we're not moving to fixed memory, the TTM object
@@ -558,7 +559,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	int ret = 0;
 
-	dma_resv_add_excl_fence(bo->base.resv, fence);
+	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
 	if (!evict)
 		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
 	else if (!from->use_tt && pipeline)
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 5da922639d54..0eb995d25df1 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -103,7 +103,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 
 		num_fences = min(entry->num_shared, 1u);
 		if (!ret) {
-			ret = dma_resv_reserve_shared(bo->base.resv,
+			ret = dma_resv_reserve_fences(bo->base.resv,
 						      num_fences);
 			if (!ret)
 				continue;
@@ -120,7 +120,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 		}
 
 		if (!ret)
-			ret = dma_resv_reserve_shared(bo->base.resv,
+			ret = dma_resv_reserve_fences(bo->base.resv,
 						      num_fences);
 
 		if (unlikely(ret != 0)) {
@@ -154,10 +154,8 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
 	list_for_each_entry(entry, list, head) {
 		struct ttm_buffer_object *bo = entry->bo;
 
-		if (entry->num_shared)
-			dma_resv_add_shared_fence(bo->base.resv, fence);
-		else
-			dma_resv_add_excl_fence(bo->base.resv, fence);
+		dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
+				   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
 		ttm_bo_move_to_lru_tail_unlocked(bo);
 		dma_resv_unlock(bo->base.resv);
 	}
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 1bea90e40ce1..e3a09e33822f 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -259,7 +259,7 @@ v3d_lock_bo_reservations(struct v3d_job *job,
 		return ret;
 
 	for (i = 0; i < job->bo_count; i++) {
-		ret = dma_resv_reserve_shared(job->bo[i]->resv, 1);
+		ret = dma_resv_reserve_fences(job->bo[i]->resv, 1);
 		if (ret)
 			goto fail;
 
@@ -550,8 +550,8 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
 
 	for (i = 0; i < job->bo_count; i++) {
 		/* XXX: Use shared fences for read-only objects. */
-		dma_resv_add_excl_fence(job->bo[i]->resv,
-					job->done_fence);
+		dma_resv_add_fence(job->bo[i]->resv, job->done_fence,
+				   DMA_RESV_USAGE_WRITE);
 	}
 
 	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 445d3bab89e0..e925e65fcd9d 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -543,7 +543,7 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->bo[i]->base);
 		bo->seqno = seqno;
 
-		dma_resv_add_shared_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_fence(bo->base.base.resv, exec->fence);
 	}
 
 	list_for_each_entry(bo, &exec->unref_list, unref_head) {
@@ -641,7 +641,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 	for (i = 0; i < exec->bo_count; i++) {
 		bo = &exec->bo[i]->base;
 
-		ret = dma_resv_reserve_shared(bo->resv, 1);
+		ret = dma_resv_reserve_fences(bo->resv, 1);
 		if (ret) {
 			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
 			return ret;
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 74ebadf4e592..c2a879734d40 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -160,13 +160,10 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 
 	/* Expose the fence via the dma-buf */
 	dma_resv_lock(resv, NULL);
-	ret = dma_resv_reserve_shared(resv, 1);
-	if (!ret) {
-		if (arg->flags & VGEM_FENCE_WRITE)
-			dma_resv_add_excl_fence(resv, fence);
-		else
-			dma_resv_add_shared_fence(resv, fence);
-	}
+	ret = dma_resv_reserve_fences(resv, 1);
+	if (!ret)
+		dma_resv_add_fence(resv, fence, arg->flags & VGEM_FENCE_WRITE ?
+				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
 	dma_resv_unlock(resv);
 
 	/* Record the fence in our idr for later signaling */
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index aec105cdd64c..a24ab63063e5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -227,7 +227,7 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
 		return ret;
 
 	for (i = 0; i < objs->nents; ++i) {
-		ret = dma_resv_reserve_shared(objs->objs[i]->resv, 1);
+		ret = dma_resv_reserve_fences(objs->objs[i]->resv, 1);
 		if (ret)
 			return ret;
 	}
@@ -250,7 +250,8 @@ void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
 	int i;
 
 	for (i = 0; i < objs->nents; i++)
-		dma_resv_add_excl_fence(objs->objs[i]->resv, fence);
+		dma_resv_add_fence(objs->objs[i]->resv, fence,
+				   DMA_RESV_USAGE_WRITE);
 }
 
 void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 5d5a438b1e23..a77921a44a72 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -1062,9 +1062,10 @@ void vmw_bo_fence_single(struct ttm_buffer_object *bo,
 	else
 		dma_fence_get(&fence->base);
 
-	ret = dma_resv_reserve_shared(bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (!ret)
-		dma_resv_add_excl_fence(bo->base.resv, &fence->base);
+		dma_resv_add_fence(bo->base.resv, &fence->base,
+				   DMA_RESV_USAGE_WRITE);
 	else
 		/* Last resort fallback when we are OOM */
 		dma_fence_wait(&fence->base, false);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index d96d8ca9af56..4f3a6abf43c4 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -95,8 +95,8 @@ static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
 /**
  * struct dma_resv - a reservation object manages fences for a buffer
  *
- * There are multiple uses for this, with sometimes slightly different rules in
- * how the fence slots are used.
+ * This is a container for dma_fence objects which needs to handle multiple use
+ * cases.
  *
  * One use is to synchronize cross-driver access to a struct dma_buf, either for
  * dynamic buffer management or just to handle implicit synchronization between
@@ -126,59 +126,22 @@ struct dma_resv {
 	 * @seq:
 	 *
 	 * Sequence count for managing RCU read-side synchronization, allows
-	 * read-only access to @fence_excl and @fence while ensuring we take a
-	 * consistent snapshot.
+	 * read-only access to @fences while ensuring we take a consistent
+	 * snapshot.
 	 */
 	seqcount_ww_mutex_t seq;
 
 	/**
-	 * @fence_excl:
+	 * @fences:
 	 *
-	 * The exclusive fence, if there is one currently.
+	 * Array of fences which where added to the dma_resv object
 	 *
-	 * There are two ways to update this fence:
-	 *
-	 * - First by calling dma_resv_add_excl_fence(), which replaces all
-	 *   fences attached to the reservation object. To guarantee that no
-	 *   fences are lost, this new fence must signal only after all previous
-	 *   fences, both shared and exclusive, have signalled. In some cases it
-	 *   is convenient to achieve that by attaching a struct dma_fence_array
-	 *   with all the new and old fences.
-	 *
-	 * - Alternatively the fence can be set directly, which leaves the
-	 *   shared fences unchanged. To guarantee that no fences are lost, this
-	 *   new fence must signal only after the previous exclusive fence has
-	 *   signalled. Since the shared fences are staying intact, it is not
-	 *   necessary to maintain any ordering against those. If semantically
-	 *   only a new access is added without actually treating the previous
-	 *   one as a dependency the exclusive fences can be strung together
-	 *   using struct dma_fence_chain.
-	 *
-	 * Note that actual semantics of what an exclusive or shared fence mean
-	 * is defined by the user, for reservation objects shared across drivers
-	 * see &dma_buf.resv.
-	 */
-	struct dma_fence __rcu *fence_excl;
-
-	/**
-	 * @fence:
-	 *
-	 * List of current shared fences.
-	 *
-	 * There are no ordering constraints of shared fences against the
-	 * exclusive fence slot. If a waiter needs to wait for all access, it
-	 * has to wait for both sets of fences to signal.
-	 *
-	 * A new fence is added by calling dma_resv_add_shared_fence(). Since
-	 * this often needs to be done past the point of no return in command
+	 * A new fence is added by calling dma_resv_add_fence(). Since this
+	 * often needs to be done past the point of no return in command
 	 * submission it cannot fail, and therefore sufficient slots need to be
-	 * reserved by calling dma_resv_reserve_shared().
-	 *
-	 * Note that actual semantics of what an exclusive or shared fence mean
-	 * is defined by the user, for reservation objects shared across drivers
-	 * see &dma_buf.resv.
+	 * reserved by calling dma_resv_reserve_fences().
 	 */
-	struct dma_resv_list __rcu *fence;
+	struct dma_resv_list __rcu *fences;
 };
 
 /**
@@ -196,6 +159,9 @@ struct dma_resv_iter {
 	/** @fence: the currently handled fence */
 	struct dma_fence *fence;
 
+	/** @fence_usage: the usage of the current fence */
+	enum dma_resv_usage fence_usage;
+
 	/** @seq: sequence number to check for modifications */
 	unsigned int seq;
 
@@ -205,8 +171,8 @@ struct dma_resv_iter {
 	/** @fences: the shared fences; private, *MUST* not dereference  */
 	struct dma_resv_list *fences;
 
-	/** @shared_count: number of shared fences */
-	unsigned int shared_count;
+	/** @num_fences: number of fences */
+	unsigned int num_fences;
 
 	/** @is_restarted: true if this is the first returned fence */
 	bool is_restarted;
@@ -245,14 +211,15 @@ static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
 }
 
 /**
- * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
+ * dma_resv_iter_usage - Return the usage of the current fence
  * @cursor: the cursor of the current position
  *
- * Returns true if the currently returned fence is the exclusive one.
+ * Returns the usage of the currently processed fence.
  */
-static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
+static inline enum dma_resv_usage
+dma_resv_iter_usage(struct dma_resv_iter *cursor)
 {
-	return cursor->index == 0;
+	return cursor->fence_usage;
 }
 
 /**
@@ -303,9 +270,9 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
 #ifdef CONFIG_DEBUG_MUTEXES
-void dma_resv_reset_shared_max(struct dma_resv *obj);
+void dma_resv_reset_max_fences(struct dma_resv *obj);
 #else
-static inline void dma_resv_reset_shared_max(struct dma_resv *obj) {}
+static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
 #endif
 
 /**
@@ -451,17 +418,18 @@ static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_resv *obj)
  */
 static inline void dma_resv_unlock(struct dma_resv *obj)
 {
-	dma_resv_reset_shared_max(obj);
+	dma_resv_reset_max_fences(obj);
 	ww_mutex_unlock(&obj->lock);
 }
 
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
-int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
+int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences);
+void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
+			enum dma_resv_usage usage);
 void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
-			     struct dma_fence *fence);
-void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+			     struct dma_fence *fence,
+			     enum dma_resv_usage usage);
 int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
 			unsigned int *num_fences, struct dma_fence ***fences);
 int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
-- 
2.25.1

