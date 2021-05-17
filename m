Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD55382EEA
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552036E97F;
	Mon, 17 May 2021 14:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0B66E975
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r11so7034711edt.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TaSNylme+JvUMjvUDZAG6e9dDKRezmdrX3RloFyGZo=;
 b=obwgDZIugCkavc2C2O7U/AHrzARiCc2C8wS2OcEF8A/Lz53YxU+rvhY8zhBwxWI1vm
 pAYPz73Lrua1BJRk+x5yt1L4Q0HKs+BRHB0un96HvyRJMYqWKNLEoSSLADSR3KNN0mw2
 qSs67cUV+TvakdfDDIDto15rcv8a/IV3G38/gJ8c2ak+uYa4IHYinajaDFBzHzDWFmfR
 I+o0eUu3Ow6LBdGeiQ1odCup1K4ozbN9MgKO00mGsaLsTvmfCkeKF5gPaA5eKYeVVMPW
 aMv4dvn0DM13TOdaXfr293ChYp32NDdk4MdAsJgwK7biV3tPpbyEz8K6lYslV5VCqKsx
 vgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TaSNylme+JvUMjvUDZAG6e9dDKRezmdrX3RloFyGZo=;
 b=BrPqTSDLu1PfJUwxEqfQqsdMc6xpLmhP7AZPNbkIcMQVh2FSffIfWz2n0Oi/sudnco
 uBsv+1F/ymdVoUr6o15lxCHxxFlI2o06Iz+8kutjfAS2PDeRYKsetQumYGDI5DcpHKli
 hG4gaQzubQLKdqn5DU9KRZyiYi67lTETD12IOBxQwisRlIrYPGdkBZ+pwxhsG2LthmGY
 iA3d9u6IvK4Al2Lb8sd94Cm0K5niaBZipsM9bYuIy5aSIdDLOatSOdfOq7gbjaCY+KtL
 WrAcgv76pSuHcWP5jWWHzf5nENleUS4vxJ/jcWYTmrrM28X+8kqRJ4495sa2yPESHW3F
 siww==
X-Gm-Message-State: AOAM533siicdeyI2wZxtbaDTzrt1C1iRXYjfbjqLxnKLPTYkoVI7C+uQ
 HpZb95bWV6PTmWj92eMSfBOfe4yEAwk=
X-Google-Smtp-Source: ABdhPJy1U+/VzB9TxG2xU0UxnnG1F60eJH6yP19zNQEDzO4wyQzMJSxcOn/WI5tChwNss6SV6balIQ==
X-Received: by 2002:aa7:c24d:: with SMTP id y13mr226169edo.155.1621260698476; 
 Mon, 17 May 2021 07:11:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/11] dma-buf: improve shared fence abstraction
Date: Mon, 17 May 2021 16:11:26 +0200
Message-Id: <20210517141129.2225-9-christian.koenig@amd.com>
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

Put access to the shared fences behind an interator.
This way we don't need to expose the internal implementation any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                   | 46 ++++++----------
 drivers/dma-buf/dma-resv.c                  | 61 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  9 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c    | 14 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 14 ++---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 15 ++---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c    | 16 ++----
 drivers/gpu/drm/nouveau/nouveau_fence.c     | 24 ++++----
 drivers/gpu/drm/qxl/qxl_debugfs.c           | 10 ++--
 drivers/gpu/drm/radeon/radeon_sync.c        | 14 ++---
 drivers/gpu/drm/ttm/ttm_bo.c                | 15 ++---
 include/linux/dma-resv.h                    | 40 ++++++--------
 12 files changed, 140 insertions(+), 138 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5abf6b8c89ac..c51c1fca4c1b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -206,12 +206,12 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
+	struct dma_fence *fence_excl, *fence_shared;
+	struct dma_resv_cursor cursor;
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv;
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence_excl;
 	__poll_t events;
-	unsigned shared_count, seq;
+	unsigned seq;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -229,22 +229,18 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	seq = read_seqcount_begin(&resv->seq);
 	rcu_read_lock();
 
-	fobj = rcu_dereference(resv->fence);
-	if (fobj)
-		shared_count = fobj->shared_count;
-	else
-		shared_count = 0;
+	fence_shared = dma_resv_first_shared(resv, &cursor);
 	fence_excl = dma_resv_exclusive(resv);
 	if (read_seqcount_retry(&resv->seq, seq)) {
 		rcu_read_unlock();
 		goto retry;
 	}
 
-	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
+	if (fence_excl && (!(events & EPOLLOUT) || !fence_shared)) {
 		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
 		__poll_t pevents = EPOLLIN;
 
-		if (shared_count == 0)
+		if (fence_shared)
 			pevents |= EPOLLOUT;
 
 		spin_lock_irq(&dmabuf->poll.lock);
@@ -275,9 +271,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		}
 	}
 
-	if ((events & EPOLLOUT) && shared_count > 0) {
+	if ((events & EPOLLOUT) && fence_shared) {
 		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
-		int i;
 
 		/* Only queue a new callback if no event has fired yet */
 		spin_lock_irq(&dmabuf->poll.lock);
@@ -290,13 +285,11 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		if (!(events & EPOLLOUT))
 			goto out;
 
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
-
-			if (!dma_fence_get_rcu(fence)) {
+		do {
+			if (!dma_fence_get_rcu(fence_shared)) {
 				/*
 				 * fence refcount dropped to zero, this means
-				 * that fobj has been freed
+				 * that the shared fence has been freed
 				 *
 				 * call dma_buf_poll_cb and force a recheck!
 				 */
@@ -304,17 +297,17 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 				dma_buf_poll_cb(NULL, &dcb->cb);
 				break;
 			}
-			if (!dma_fence_add_callback(fence, &dcb->cb,
+			if (!dma_fence_add_callback(fence_shared, &dcb->cb,
 						    dma_buf_poll_cb)) {
-				dma_fence_put(fence);
+				dma_fence_put(fence_shared);
 				events &= ~EPOLLOUT;
 				break;
 			}
-			dma_fence_put(fence);
-		}
+			dma_fence_put(fence_shared);
+		} while ((fence_shared = dma_resv_next_shared(resv, &cursor)));
 
 		/* No callback queued, wake up any additional waiters. */
-		if (i == shared_count)
+		if (!fence_shared)
 			dma_buf_poll_cb(NULL, &dcb->cb);
 	}
 
@@ -1353,10 +1346,9 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
 	struct dma_resv *robj;
-	struct dma_resv_list *fobj;
 	struct dma_fence *fence;
 	unsigned seq;
-	int count = 0, attach_count, shared_count, i;
+	int count = 0, attach_count;
 	size_t size = 0;
 
 	ret = mutex_lock_interruptible(&db_list.lock);
@@ -1369,6 +1361,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		   "size", "flags", "mode", "count", "ino");
 
 	list_for_each_entry(buf_obj, &db_list.head, list_node) {
+		struct dma_resv_cursor cursor;
 
 		ret = dma_resv_lock_interruptible(buf_obj->resv, NULL);
 		if (ret)
@@ -1392,10 +1385,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
 
-		fobj = rcu_dereference(robj->fence);
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+		dma_resv_for_each_shared(robj, &cursor, fence) {
 			if (!dma_fence_get_rcu(fence))
 				continue;
 			seq_printf(s, "\tShared fence: %s %s %ssignalled\n",
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5703e328b8ac..ef7e0464e08d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -39,6 +39,19 @@
 #include <linux/sched/mm.h>
 #include <linux/mmu_notifier.h>
 
+/**
+ * struct dma_resv_list - a list of shared fences
+ * @rcu: for internal use
+ * @shared_count: table of shared fences
+ * @shared_max: for growing shared fence table
+ * @shared: shared fence table
+ */
+struct dma_resv_list {
+	struct rcu_head rcu;
+	u32 shared_count, shared_max;
+	struct dma_fence __rcu *shared[];
+};
+
 /**
  * DOC: Reservation Object Overview
  *
@@ -146,6 +159,54 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
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
+/**
+ * dma_resv_first_shared - get first shared fence
+ * @obj: the reservation object
+ * @cursor: cursor to record the position
+ *
+ * Return the first shared fence of the resv object and initialize the cursor to
+ * track the position inside the list.
+ */
+struct dma_fence *dma_resv_first_shared(struct dma_resv *obj,
+					struct dma_resv_cursor *cursor)
+{
+	cursor->fences = dma_resv_shared(obj);
+	if (!cursor->fences)
+		return NULL;
+
+	cursor->i = 0;
+	return dma_resv_next_shared(obj, cursor);
+}
+EXPORT_SYMBOL(dma_resv_first_shared);
+
+/**
+ * dma_resv_next_shared - get the next shared fence from the resv object
+ * @obj: the reservation object
+ * @cursor: cursor to record the position
+ *
+ * Return the next shared fence of the resv object where cursor points to.
+ */
+struct dma_fence *dma_resv_next_shared(struct dma_resv *obj,
+				       struct dma_resv_cursor *cursor)
+{
+	if (cursor->i >= cursor->fences->shared_count)
+		return NULL;
+
+	return dma_resv_list_fence(obj, cursor->fences, cursor->i++);
+}
+EXPORT_SYMBOL(dma_resv_next_shared);
+
 /**
  * dma_resv_reserve_shared - Reserve space to add shared fences to
  * a dma_resv.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 0371947ba96b..67cef80e25c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -95,20 +95,15 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
 	unsigned int count;
 	int r;
 
-	if (!dma_resv_shared(obj)) /* no shared fences to convert */
-		return 0;
-
 	r = dma_resv_get_fences_rcu(obj, NULL, &count, &fences);
 	if (r)
 		return r;
 
-	if (count == 0) {
-		/* Now that was unexpected. */
-	} else if (count == 1) {
+	if (count == 1) {
 		dma_resv_add_excl_fence(obj, fences[0]);
 		dma_fence_put(fences[0]);
 		kfree(fences);
-	} else {
+	} else if (count > 1) {
 		struct dma_fence_array *array;
 
 		array = dma_fence_array_create(count, fences,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index c50d9f92a0cd..a4478332a79e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -201,10 +201,9 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *f;
-	unsigned i;
-	int r = 0;
+	int r;
 
 	if (resv == NULL)
 		return -EINVAL;
@@ -212,17 +211,12 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 	/* always sync to the exclusive fence */
 	f = dma_resv_exclusive(resv);
 	r = amdgpu_sync_fence(sync, f);
-
-	flist = dma_resv_shared(resv);
-	if (!flist || r)
+	if (r)
 		return r;
 
-	for (i = 0; i < flist->shared_count; ++i) {
+	dma_resv_for_each_shared(resv, &cursor, f) {
 		void *fence_owner;
 
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
-
 		fence_owner = amdgpu_sync_get_owner(f);
 
 		/* Always sync to moves, no matter what */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6ab50810bd54..ba89e35c1b84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1394,10 +1394,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->mem.num_pages;
+	struct dma_resv_cursor resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	if (bo->type == ttm_bo_type_kernel &&
 	    !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
@@ -1407,14 +1406,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_shared(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
+	dma_resv_for_each_shared(bo->base.resv, &resv_cursor, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->mem.mem_type) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 4d43b8630f0e..52e9eaa43f2e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -450,10 +450,10 @@ static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+	unsigned long off = drm_vma_node_start(&obj->vma_node);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
 			etnaviv_obj->flags, is_active(etnaviv_obj) ? 'A' : 'I',
@@ -461,15 +461,8 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
-			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
-	}
+	dma_resv_for_each_shared(robj, &cursor, fence)
+		etnaviv_gem_describe_fence(fence, "Shared", m);
 
 	fence = dma_resv_exclusive(robj);
 	if (fence)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 3f94becac541..1028df6cee67 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,7 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	unsigned int seq;
 	int err;
 
@@ -116,17 +117,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	args->busy = busy_check_writer(dma_resv_exclusive(obj->base.resv));
 
 	/* Translate shared fences to READ set of engines */
-	list = dma_resv_shared(obj->base.resv);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
-			args->busy |= busy_check_reader(fence);
-		}
-	}
+	dma_resv_for_each_shared(obj->base.resv, &cursor, fence)
+		args->busy |= busy_check_reader(fence);
 
 	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
 		goto retry;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 5ce441c655ea..9efe47932b42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -342,11 +342,11 @@ int
 nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct dma_fence *fence;
 	struct dma_resv *resv = nvbo->bo.base.resv;
-	struct dma_resv_list *fobj;
+	struct dma_fence *fence, *shared;
+	struct dma_resv_cursor cursor;
 	struct nouveau_fence *f;
-	int ret = 0, i;
+	int ret = 0;
 
 	if (!exclusive) {
 		ret = dma_resv_reserve_shared(resv, 1);
@@ -355,10 +355,10 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 			return ret;
 	}
 
-	fobj = dma_resv_shared(resv);
+	shared = dma_resv_first_shared(resv, &cursor);
 	fence = dma_resv_exclusive(resv);
 
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
+	if (fence && (!exclusive || !shared)) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
@@ -377,17 +377,15 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 		return ret;
 	}
 
-	if (!exclusive || !fobj)
+	if (!exclusive || !shared)
 		return ret;
 
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+
+	do {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
-		f = nouveau_local_fence(fence, chan->drm);
+		f = nouveau_local_fence(shared, chan->drm);
 		if (f) {
 			rcu_read_lock();
 			prev = rcu_dereference(f->channel);
@@ -397,8 +395,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 		}
 
 		if (must_wait)
-			ret = dma_fence_wait(fence, intr);
-	}
+			ret = dma_fence_wait(shared, intr);
+	} while ((shared = dma_resv_next_shared(resv, &cursor)));
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 0acc70a6d3dd..1d24e02f4652 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -57,12 +57,14 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
-		struct dma_resv_list *fobj;
-		int rel;
+		struct dma_resv_cursor cursor;
+		struct dma_fence *f;
+		int rel = 0;
 
+		/* TODO: Is this sufficient fast enough ? */
 		rcu_read_lock();
-		fobj = dma_resv_shared(bo->tbo.base.resv);
-		rel = fobj ? fobj->shared_count : 0;
+		dma_resv_for_each_shared(bo->tbo.base.resv, &cursor, f)
+			++rel;
 		rcu_read_unlock();
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index a9cdb88da173..915ac0de0633 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,11 +91,10 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_cursor cursor;
 	struct radeon_fence *fence;
-	unsigned i;
-	int r = 0;
+	struct dma_fence *f;
+	int r;
 
 	/* always sync to the exclusive fence */
 	f = dma_resv_exclusive(resv);
@@ -105,13 +104,10 @@ int radeon_sync_resv(struct radeon_device *rdev,
 	else if (f)
 		r = dma_fence_wait(f, true);
 
-	flist = dma_resv_shared(resv);
-	if (shared || !flist || r)
+	if (shared || r)
 		return r;
 
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_shared(resv, &cursor, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9d453c2ca800..16b869d9b1d6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -254,22 +254,17 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i;
 
 	rcu_read_lock();
-	fobj = dma_resv_shared(resv);
-	fence = dma_resv_exclusive(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-
+	dma_resv_for_each_shared(resv, &cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
+	fence = dma_resv_exclusive(resv);
+	if (fence && !fence->ops->signaled)
+		dma_fence_enable_sw_signaling(fence);
 	rcu_read_unlock();
 }
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 74b217b82f39..bb6911baac3d 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -45,20 +45,9 @@
 #include <linux/seqlock.h>
 #include <linux/rcupdate.h>
 
-extern struct ww_class reservation_ww_class;
+struct dma_resv_list;
 
-/**
- * struct dma_resv_list - a list of shared fences
- * @rcu: for internal use
- * @shared_count: table of shared fences
- * @shared_max: for growing shared fence table
- * @shared: shared fence table
- */
-struct dma_resv_list {
-	struct rcu_head rcu;
-	u32 shared_count, shared_max;
-	struct dma_fence __rcu *shared[];
-};
+extern struct ww_class reservation_ww_class;
 
 /**
  * struct dma_resv - a reservation object manages fences for a buffer
@@ -75,9 +64,23 @@ struct dma_resv {
 	struct dma_resv_list __rcu *fence;
 };
 
+struct dma_resv_cursor {
+	struct dma_resv_list *fences;
+	unsigned int i;
+};
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
+struct dma_fence *dma_resv_first_shared(struct dma_resv *obj,
+					struct dma_resv_cursor *cursor);
+struct dma_fence *dma_resv_next_shared(struct dma_resv *obj,
+				       struct dma_resv_cursor *cursor);
+
+#define dma_resv_for_each_shared(obj, cursor, fence)		\
+	for (fence = dma_resv_first_shared(obj, cursor); fence;	\
+	     fence = dma_resv_next_shared(obj, cursor))
+
 #ifdef CONFIG_DEBUG_MUTEXES
 void dma_resv_reset_shared_max(struct dma_resv *obj);
 #else
@@ -253,17 +256,6 @@ dma_resv_get_excl_rcu(struct dma_resv *obj)
 	return fence;
 }
 
-/**
- * dma_resv_shared - get the reservation object's shared fence list
- * @obj: the reservation object
- *
- * Returns the shared fence list. The obj->lock or rcu read side must be held.
- */
-static inline struct dma_resv_list *dma_resv_shared(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
-}
-
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

