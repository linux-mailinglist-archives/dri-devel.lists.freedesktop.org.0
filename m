Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D484A7B9E4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67F610EBC2;
	Fri,  4 Apr 2025 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nkQin5b2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C39C10EB9D;
 Fri,  4 Apr 2025 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758800;
 bh=+BQ4HaAKmbN6C1yD9xgCQgW2C8+9uZXZpSkLqiRnWlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nkQin5b2g1SB15vRv7k5VpKq029b41GJdQ/uIA3zeqV4zRPp4QCDMBO7XSpz7BpUg
 a1yGgIwmq8GaWKTMWMuaGyi/xCPlWyER2bWwv8SHNQusdT7GsOY2FqNY40fsItCGCH
 UzyZCVEkQqwD0u4EuDn3ubCWk5Csv/rsKzkPaojydxB0AxAUd/oV0DQbMLn34XGHfs
 fupCjnze6jSuSFtHgCWC8+oR6Cf22hRo7Ssxq2J83zgkgd2ZxoUxxTjuy8mBqsT+eH
 61gu/o6Zr/kr5pQxUEJh9HCJ8KrrzMcHLHBZ6Q6rdYckLxnpEwhQnIz9j5iWcNCsfB
 0Gf6KjDAMvfHA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4948617E1062;
 Fri,  4 Apr 2025 11:26:40 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 7/8] drm/panthor: Make heap chunk allocation non-blocking
Date: Fri,  4 Apr 2025 11:26:33 +0200
Message-ID: <20250404092634.2968115-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404092634.2968115-1-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

Make heap chunk allocation non-blocking when we are in the growing
path. This way, we can fail the job and signal its fence instead of
blocking on memory reclaim, which will become problematic once we throw
a memory shrinker into the mix.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 222 ++++++++++++-------------
 1 file changed, 110 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3bdf61c14264..2017a1950f63 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -3,6 +3,7 @@
 
 #include <linux/iosys-map.h>
 #include <linux/rwsem.h>
+#include <linux/vmalloc.h>
 
 #include <drm/panthor_drm.h>
 
@@ -35,25 +36,14 @@ struct panthor_heap_chunk_header {
 	u32 unknown[14];
 };
 
-/**
- * struct panthor_heap_chunk - Structure used to keep track of allocated heap chunks.
- */
-struct panthor_heap_chunk {
-	/** @node: Used to insert the heap chunk in panthor_heap::chunks. */
-	struct list_head node;
-
-	/** @bo: Buffer object backing the heap chunk. */
-	struct panthor_kernel_bo *bo;
-};
-
 /**
  * struct panthor_heap - Structure used to manage tiler heap contexts.
  */
 struct panthor_heap {
-	/** @chunks: List containing all heap chunks allocated so far. */
-	struct list_head chunks;
+	/** @bo: Buffer object backing a heap. */
+	struct panthor_kernel_bo *bo;
 
-	/** @lock: Lock protecting insertion in the chunks list. */
+	/** @lock: Lock protecting chunks addition. */
 	struct mutex lock;
 
 	/** @chunk_size: Size of each chunk. */
@@ -70,6 +60,9 @@ struct panthor_heap {
 
 	/** @chunk_count: Number of heap chunks currently allocated. */
 	u32 chunk_count;
+
+	/** @free_list: List of free chunks. */
+	u64 free_list;
 };
 
 #define MAX_HEAPS_PER_POOL    128
@@ -121,100 +114,120 @@ static void *panthor_get_heap_ctx(struct panthor_heap_pool *pool, int id)
 	       panthor_get_heap_ctx_offset(pool, id);
 }
 
-static void panthor_free_heap_chunk(struct panthor_heap_pool *pool,
-				    struct panthor_heap *heap,
-				    struct panthor_heap_chunk *chunk)
-{
-	mutex_lock(&heap->lock);
-	list_del(&chunk->node);
-	heap->chunk_count--;
-	mutex_unlock(&heap->lock);
-
-	atomic_sub(heap->chunk_size, &pool->size);
-
-	panthor_kernel_bo_destroy(chunk->bo);
-	kfree(chunk);
-}
-
 static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 				    struct panthor_heap *heap,
-				    bool initial_chunk)
+				    bool initial_chunk,
+				    u64 *chunk_gpu_va)
 {
-	struct panthor_heap_chunk *chunk;
 	struct panthor_heap_chunk_header *hdr;
+	unsigned int npages = heap->chunk_size >> PAGE_SHIFT;
+	pgoff_t pgoffs = heap->chunk_count * npages;
+	struct panthor_kernel_bo *kbo = heap->bo;
+	struct panthor_gem_object *bo = to_panthor_bo(kbo->obj);
+	struct address_space *mapping = bo->base.base.filp->f_mapping;
+	pgprot_t prot = PAGE_KERNEL;
+	gfp_t page_gfp, other_gfp;
+	bool from_free_list = false;
+	struct page *page;
 	int ret;
 
-	chunk = kmalloc(sizeof(*chunk), GFP_KERNEL);
-	if (!chunk)
-		return -ENOMEM;
-
-	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
-					     DRM_PANTHOR_BO_NO_MMAP,
-					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
-					     PANTHOR_VM_KERNEL_AUTO_VA);
-	if (IS_ERR(chunk->bo)) {
-		ret = PTR_ERR(chunk->bo);
-		goto err_free_chunk;
+	if (initial_chunk) {
+		page_gfp = mapping_gfp_mask(mapping);
+		other_gfp = GFP_KERNEL;
+	} else {
+		page_gfp = mapping_gfp_constraint(mapping, ~__GFP_RECLAIM) |
+			   __GFP_NORETRY | __GFP_NOWARN;
+		other_gfp = __GFP_NORETRY | __GFP_NOWARN;
 	}
 
-	ret = panthor_kernel_bo_vmap(chunk->bo);
-	if (ret)
-		goto err_destroy_bo;
+	if (!heap->free_list) {
+		u64 new_chunk_va = panthor_kernel_bo_gpuva(kbo) +
+				   ((u64)heap->chunk_size * heap->chunk_count);
+
+		ret = panthor_vm_pre_fault_range(pool->vm, new_chunk_va,
+						 heap->chunk_size,
+						 page_gfp, other_gfp);
+		if (ret)
+			return ret;
+
+		page = xa_load(&bo->sparse.pages, pgoffs);
+		if (!page)
+			return -ENOMEM;
+
+		*chunk_gpu_va = new_chunk_va;
+	} else {
+		u64 offset = heap->free_list - panthor_kernel_bo_gpuva(kbo);
+
+		page = xa_load(&bo->sparse.pages, offset >> PAGE_SHIFT);
+		*chunk_gpu_va = heap->free_list;
+		from_free_list = true;
+	}
+
+	if (bo->base.map_wc)
+		prot = pgprot_writecombine(prot);
+
+	hdr = vmap(&page, 1, VM_MAP, prot);
+	if (!hdr)
+		return -ENOMEM;
+
+	if (from_free_list)
+		heap->free_list = hdr->next & GENMASK_ULL(63, 12);
 
-	hdr = chunk->bo->kmap;
 	memset(hdr, 0, sizeof(*hdr));
 
-	if (initial_chunk && !list_empty(&heap->chunks)) {
-		struct panthor_heap_chunk *prev_chunk;
-		u64 prev_gpuva;
+	if (initial_chunk && heap->chunk_count) {
+		u64 prev_gpuva = panthor_kernel_bo_gpuva(kbo) +
+				 ((u64)heap->chunk_size * (heap->chunk_count - 1));
 
-		prev_chunk = list_first_entry(&heap->chunks,
-					      struct panthor_heap_chunk,
-					      node);
-
-		prev_gpuva = panthor_kernel_bo_gpuva(prev_chunk->bo);
 		hdr->next = (prev_gpuva & GENMASK_ULL(63, 12)) |
 			    (heap->chunk_size >> 12);
 	}
 
-	panthor_kernel_bo_vunmap(chunk->bo);
+	vunmap(hdr);
 
-	mutex_lock(&heap->lock);
-	list_add(&chunk->node, &heap->chunks);
-	heap->chunk_count++;
-	mutex_unlock(&heap->lock);
+	if (!from_free_list)
+		heap->chunk_count++;
 
 	atomic_add(heap->chunk_size, &pool->size);
 
 	return 0;
-
-err_destroy_bo:
-	panthor_kernel_bo_destroy(chunk->bo);
-
-err_free_chunk:
-	kfree(chunk);
-
-	return ret;
 }
 
-static void panthor_free_heap_chunks(struct panthor_heap_pool *pool,
-				     struct panthor_heap *heap)
+static void panthor_free_heap_chunk(struct panthor_heap *heap,
+				    u64 chunk_gpu_va)
 {
-	struct panthor_heap_chunk *chunk, *tmp;
+	struct panthor_kernel_bo *kbo = heap->bo;
+	struct panthor_gem_object *bo = to_panthor_bo(kbo->obj);
+	u64 offset = chunk_gpu_va - panthor_kernel_bo_gpuva(kbo);
+	pgoff_t pgoffs = offset >> PAGE_SHIFT;
+	struct panthor_heap_chunk_header *hdr;
+	pgprot_t prot = bo->base.map_wc ? pgprot_writecombine(PAGE_KERNEL) :
+					  PAGE_KERNEL;
+	struct page *page;
 
-	list_for_each_entry_safe(chunk, tmp, &heap->chunks, node)
-		panthor_free_heap_chunk(pool, heap, chunk);
+	page = xa_load(&bo->sparse.pages, pgoffs);
+	if (!page)
+		return;
+
+	hdr = vmap(&page, 1, VM_MAP, prot);
+	if (!hdr)
+		return;
+
+	hdr->next = heap->free_list;
+	heap->free_list = chunk_gpu_va;
+	vunmap(hdr);
 }
 
 static int panthor_alloc_heap_chunks(struct panthor_heap_pool *pool,
 				     struct panthor_heap *heap,
-				     u32 chunk_count)
+				     u32 chunk_count,
+				     u64 *first_chunk_gpu_va)
 {
 	int ret;
 	u32 i;
 
 	for (i = 0; i < chunk_count; i++) {
-		ret = panthor_alloc_heap_chunk(pool, heap, true);
+		ret = panthor_alloc_heap_chunk(pool, heap, true, first_chunk_gpu_va);
 		if (ret)
 			return ret;
 	}
@@ -231,7 +244,7 @@ panthor_heap_destroy_locked(struct panthor_heap_pool *pool, u32 handle)
 	if (!heap)
 		return -EINVAL;
 
-	panthor_free_heap_chunks(pool, heap);
+	panthor_kernel_bo_destroy(heap->bo);
 	mutex_destroy(&heap->lock);
 	kfree(heap);
 	return 0;
@@ -278,7 +291,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 			u64 *first_chunk_gpu_va)
 {
 	struct panthor_heap *heap;
-	struct panthor_heap_chunk *first_chunk;
+	struct panthor_kernel_bo *bo;
 	struct panthor_vm *vm;
 	int ret = 0;
 	u32 id;
@@ -308,20 +321,27 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	}
 
 	mutex_init(&heap->lock);
-	INIT_LIST_HEAD(&heap->chunks);
 	heap->chunk_size = chunk_size;
 	heap->max_chunks = max_chunks;
 	heap->target_in_flight = target_in_flight;
 
-	ret = panthor_alloc_heap_chunks(pool, heap, initial_chunk_count);
+	bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, max_chunks * chunk_size,
+				      DRM_PANTHOR_BO_NO_MMAP | DRM_PANTHOR_BO_ALLOC_ON_FAULT,
+				      chunk_size >> PAGE_SHIFT,
+				      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
+				      PANTHOR_VM_KERNEL_AUTO_VA);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto err_free_heap;
+	}
+
+	heap->bo = bo;
+
+	ret = panthor_alloc_heap_chunks(pool, heap, initial_chunk_count,
+					first_chunk_gpu_va);
 	if (ret)
 		goto err_free_heap;
 
-	first_chunk = list_first_entry(&heap->chunks,
-				       struct panthor_heap_chunk,
-				       node);
-	*first_chunk_gpu_va = panthor_kernel_bo_gpuva(first_chunk->bo);
-
 	down_write(&pool->lock);
 	/* The pool has been destroyed, we can't create a new heap. */
 	if (!pool->vm) {
@@ -346,7 +366,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	return id;
 
 err_free_heap:
-	panthor_free_heap_chunks(pool, heap);
+	panthor_kernel_bo_destroy(heap->bo);
 	mutex_destroy(&heap->lock);
 	kfree(heap);
 
@@ -371,7 +391,6 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 {
 	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
 	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
-	struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
 	struct panthor_heap *heap;
 	int ret;
 
@@ -385,28 +404,10 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 		goto out_unlock;
 	}
 
-	chunk_gpu_va &= GENMASK_ULL(63, 12);
-
 	mutex_lock(&heap->lock);
-	list_for_each_entry_safe(chunk, tmp, &heap->chunks, node) {
-		if (panthor_kernel_bo_gpuva(chunk->bo) == chunk_gpu_va) {
-			removed = chunk;
-			list_del(&chunk->node);
-			heap->chunk_count--;
-			atomic_sub(heap->chunk_size, &pool->size);
-			break;
-		}
-	}
+	panthor_free_heap_chunk(heap, chunk_gpu_va & GENMASK_ULL(63, 12));
 	mutex_unlock(&heap->lock);
 
-	if (removed) {
-		panthor_kernel_bo_destroy(chunk->bo);
-		kfree(chunk);
-		ret = 0;
-	} else {
-		ret = -EINVAL;
-	}
-
 out_unlock:
 	up_read(&pool->lock);
 	return ret;
@@ -435,7 +436,6 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 {
 	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
 	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
-	struct panthor_heap_chunk *chunk;
 	struct panthor_heap *heap;
 	int ret;
 
@@ -471,15 +471,13 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * further jobs in this queue fail immediately instead of having to
 	 * wait for the job timeout.
 	 */
-	ret = panthor_alloc_heap_chunk(pool, heap, false);
+	mutex_lock(&heap->lock);
+	ret = panthor_alloc_heap_chunk(pool, heap, false, new_chunk_gpu_va);
+	mutex_unlock(&heap->lock);
 	if (ret)
 		goto out_unlock;
 
-	chunk = list_first_entry(&heap->chunks,
-				 struct panthor_heap_chunk,
-				 node);
-	*new_chunk_gpu_va = (panthor_kernel_bo_gpuva(chunk->bo) & GENMASK_ULL(63, 12)) |
-			    (heap->chunk_size >> 12);
+	*new_chunk_gpu_va |= (heap->chunk_size >> 12);
 	ret = 0;
 
 out_unlock:
@@ -553,7 +551,7 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 	kref_init(&pool->refcount);
 
 	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
-						      DRM_PANTHOR_BO_NO_MMAP,
+						      DRM_PANTHOR_BO_NO_MMAP, 0,
 						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 						      PANTHOR_VM_KERNEL_AUTO_VA);
 	if (IS_ERR(pool->gpu_contexts)) {
-- 
2.49.0

