Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C8A4CBA4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 20:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5817B10E4B3;
	Mon,  3 Mar 2025 19:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lD6W320v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DB410E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 19:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741028999; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KGnalSpz3ZYayPrabf1P9Jb6l0yAfeMwzj6bGF20xpPicAT/lyk7ZQzMPAhS0zezBB7bZ2ueYup5mf0+xhBLZu5vREGJ+idph/xg6+iqePsHsbwByxt7je8z90Tk6EqGI43hOnwbBb6BAZ5Yt4gAvmjqqJ1Y9Gskw2P37UXNK0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741028999;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IhKZWdHffyLt6RR9t3v4qGpXBiWsAB7Rtp5dqOKV3Nc=; 
 b=PJnOR+geg4mpB4GakJ92jetk57HrvUh7RY5gdGAfzU2N3O1A7f/icNF2OFMXnI9jFTR1NglUK94229UvJguRanNAoPDC6HTdPikjGH1xXN6FfCe1kwBMpNIRsmMmcCWK3ax4c+/1PbfcLhUF/yE481AFUFZMDBM/+2EtNfh1OeQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741028999; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IhKZWdHffyLt6RR9t3v4qGpXBiWsAB7Rtp5dqOKV3Nc=;
 b=lD6W320v71vUIFK97rSVMbU0Ocp0tJgJYYksluaBgFmi6thToXSYkzRqqTTWtPcy
 azT5HaestXNJCZsj6I+G4kBc42wziQ5+XOYU4pC3Wl+HqCAfzS0Yru3/1UNt0Re7uuR
 kgj8OTDdcJH7jBPXcKrW96F0S624CZmD2L1Bhito=
Received: by mx.zohomail.com with SMTPS id 1741028998333570.3174951800842;
 Mon, 3 Mar 2025 11:09:58 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/panthor: Avoid sleep locking in the internal BO
 size path
Date: Mon,  3 Mar 2025 19:08:46 +0000
Message-ID: <20250303190923.1639985-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250303190923.1639985-1-adrian.larumbe@collabora.com>
References: <20250303190923.1639985-1-adrian.larumbe@collabora.com>
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

Commit 434e5ca5b5d7 ("drm/panthor: Expose size of driver internal BO's over
fdinfo") locks the VMS xarray, to avoid UAF errors when the same VM is
being concurrently destroyed by another thread. However, that puts the
current thread in atomic context, which means taking the VMS' heap locks
will trigger a warning as the thread is no longer allowed to sleep.

Because in this case replacing the heap mutex with a spinlock isn't
feasible, the fdinfo handler no longer traverses the list of heaps for
every single VM associated with an open DRM file. Instead, when a new heap
chunk is allocated, its size is accumulated into a pool-wide tally, which
also makes the atomic context code path somewhat faster.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 3e2c8c718567 ("drm/panthor: Expose size of driver internal BO's over fdinfo")
---
 drivers/gpu/drm/panthor/panthor_heap.c | 62 +++++++++++++-------------
 drivers/gpu/drm/panthor/panthor_mmu.c  |  8 +---
 2 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index db0285ce5812..3bdf61c14264 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -97,6 +97,9 @@ struct panthor_heap_pool {
 
 	/** @gpu_contexts: Buffer object containing the GPU heap contexts. */
 	struct panthor_kernel_bo *gpu_contexts;
+
+	/** @size: Size of all chunks across all heaps in the pool. */
+	atomic_t size;
 };
 
 static int panthor_heap_ctx_stride(struct panthor_device *ptdev)
@@ -118,7 +121,7 @@ static void *panthor_get_heap_ctx(struct panthor_heap_pool *pool, int id)
 	       panthor_get_heap_ctx_offset(pool, id);
 }
 
-static void panthor_free_heap_chunk(struct panthor_vm *vm,
+static void panthor_free_heap_chunk(struct panthor_heap_pool *pool,
 				    struct panthor_heap *heap,
 				    struct panthor_heap_chunk *chunk)
 {
@@ -127,12 +130,13 @@ static void panthor_free_heap_chunk(struct panthor_vm *vm,
 	heap->chunk_count--;
 	mutex_unlock(&heap->lock);
 
+	atomic_sub(heap->chunk_size, &pool->size);
+
 	panthor_kernel_bo_destroy(chunk->bo);
 	kfree(chunk);
 }
 
-static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
-				    struct panthor_vm *vm,
+static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 				    struct panthor_heap *heap,
 				    bool initial_chunk)
 {
@@ -144,7 +148,7 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	if (!chunk)
 		return -ENOMEM;
 
-	chunk->bo = panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
+	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					     PANTHOR_VM_KERNEL_AUTO_VA);
@@ -180,6 +184,8 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	heap->chunk_count++;
 	mutex_unlock(&heap->lock);
 
+	atomic_add(heap->chunk_size, &pool->size);
+
 	return 0;
 
 err_destroy_bo:
@@ -191,17 +197,16 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	return ret;
 }
 
-static void panthor_free_heap_chunks(struct panthor_vm *vm,
+static void panthor_free_heap_chunks(struct panthor_heap_pool *pool,
 				     struct panthor_heap *heap)
 {
 	struct panthor_heap_chunk *chunk, *tmp;
 
 	list_for_each_entry_safe(chunk, tmp, &heap->chunks, node)
-		panthor_free_heap_chunk(vm, heap, chunk);
+		panthor_free_heap_chunk(pool, heap, chunk);
 }
 
-static int panthor_alloc_heap_chunks(struct panthor_device *ptdev,
-				     struct panthor_vm *vm,
+static int panthor_alloc_heap_chunks(struct panthor_heap_pool *pool,
 				     struct panthor_heap *heap,
 				     u32 chunk_count)
 {
@@ -209,7 +214,7 @@ static int panthor_alloc_heap_chunks(struct panthor_device *ptdev,
 	u32 i;
 
 	for (i = 0; i < chunk_count; i++) {
-		ret = panthor_alloc_heap_chunk(ptdev, vm, heap, true);
+		ret = panthor_alloc_heap_chunk(pool, heap, true);
 		if (ret)
 			return ret;
 	}
@@ -226,7 +231,7 @@ panthor_heap_destroy_locked(struct panthor_heap_pool *pool, u32 handle)
 	if (!heap)
 		return -EINVAL;
 
-	panthor_free_heap_chunks(pool->vm, heap);
+	panthor_free_heap_chunks(pool, heap);
 	mutex_destroy(&heap->lock);
 	kfree(heap);
 	return 0;
@@ -308,8 +313,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	heap->max_chunks = max_chunks;
 	heap->target_in_flight = target_in_flight;
 
-	ret = panthor_alloc_heap_chunks(pool->ptdev, vm, heap,
-					initial_chunk_count);
+	ret = panthor_alloc_heap_chunks(pool, heap, initial_chunk_count);
 	if (ret)
 		goto err_free_heap;
 
@@ -342,7 +346,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	return id;
 
 err_free_heap:
-	panthor_free_heap_chunks(pool->vm, heap);
+	panthor_free_heap_chunks(pool, heap);
 	mutex_destroy(&heap->lock);
 	kfree(heap);
 
@@ -389,6 +393,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 			removed = chunk;
 			list_del(&chunk->node);
 			heap->chunk_count--;
+			atomic_sub(heap->chunk_size, &pool->size);
 			break;
 		}
 	}
@@ -466,7 +471,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * further jobs in this queue fail immediately instead of having to
 	 * wait for the job timeout.
 	 */
-	ret = panthor_alloc_heap_chunk(pool->ptdev, pool->vm, heap, false);
+	ret = panthor_alloc_heap_chunk(pool, heap, false);
 	if (ret)
 		goto out_unlock;
 
@@ -560,6 +565,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 	if (ret)
 		goto err_destroy_pool;
 
+	atomic_add(pool->gpu_contexts->obj->size, &pool->size);
+
 	return pool;
 
 err_destroy_pool:
@@ -594,8 +601,10 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 	xa_for_each(&pool->xa, i, heap)
 		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
 
-	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
+	if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
+		atomic_sub(pool->gpu_contexts->obj->size, &pool->size);
 		panthor_kernel_bo_destroy(pool->gpu_contexts);
+	}
 
 	/* Reflects the fact the pool has been destroyed. */
 	pool->vm = NULL;
@@ -605,27 +614,16 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 }
 
 /**
- * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
- * @pool: Pool whose total chunk size to calculate.
+ * panthor_heap_pool_size() - Get a heap pool's total size
+ * @pool: Pool whose total chunks size to return
  *
- * This function adds the size of all heap chunks across all heaps in the
- * argument pool. It also adds the size of the gpu contexts kernel bo.
- * It is meant to be used by fdinfo for displaying the size of internal
- * driver BO's that aren't exposed to userspace through a GEM handle.
+ * Returns the aggregated size of all chunks for all heaps in the pool
  *
  */
 size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
 {
-	struct panthor_heap *heap;
-	unsigned long i;
-	size_t size = 0;
-
-	down_read(&pool->lock);
-	xa_for_each(&pool->xa, i, heap)
-		size += heap->chunk_size * heap->chunk_count;
-	up_read(&pool->lock);
-
-	size += pool->gpu_contexts->obj->size;
+	if (!pool)
+		return 0;
 
-	return size;
+	return atomic_read(&pool->size);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 8c6fc587ddc3..12a02e28f50f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1963,13 +1963,7 @@ void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats
 
 	xa_lock(&pfile->vms->xa);
 	xa_for_each(&pfile->vms->xa, i, vm) {
-		size_t size = 0;
-
-		mutex_lock(&vm->heaps.lock);
-		if (vm->heaps.pool)
-			size = panthor_heap_pool_size(vm->heaps.pool);
-		mutex_unlock(&vm->heaps.lock);
-
+		size_t size = panthor_heap_pool_size(vm->heaps.pool);
 		stats->resident += size;
 		if (vm->as.id >= 0)
 			stats->active += size;
-- 
2.47.1

