Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D5836A96
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9236C10F5E2;
	Mon, 22 Jan 2024 16:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C484610F5DC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705941061;
 bh=qodEyNjSdOXLGDRFWmAgqk5ICuStsSDZH0ZkEbbjokc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I+E1h3xnyJ6RZPiS1DR8MqSzdOScZpU5kPbsz3zTnn7plLoHJMpNqDsVZaMduRwh4
 gDyuZpWtSs5wsS04aU1R17qHscJDVJGGsKi4RiwKV2xdci1Gn+xpru7O4RCLFT8Nsy
 UxWo+MHmVxN3YEg5gXl2YUbfSK8kWuKzNa2YaOL7XXqj2XFTDTUTR7VvRkRl23h/N5
 RjaiuNMb2o0HeZZVnNKRT+X/dg4Y1IPFVgPe6u7XlUrU4RexfDoDqxioB03WcnV811
 XFn0Dvi9mHJWqDKmiOTdkGVQIFWNxmdkHR3lXMKJyU1ne3E8UAB4jZ0MeU51drnB9+
 EtnaNV4q0wyCw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 959D33782053;
 Mon, 22 Jan 2024 16:31:00 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/14] drm/panthor: Add the heap logical block
Date: Mon, 22 Jan 2024 17:30:40 +0100
Message-ID: <20240122163047.1954733-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122163047.1954733-1-boris.brezillon@collabora.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tiler heap growing requires some kernel driver involvement: when the
tiler runs out of heap memory, it will raise an exception which is
either directly handled by the firmware if some free heap chunks are
available in the heap context, or passed back to the kernel otherwise.
The heap helpers will be used by the scheduler logic to allocate more
heap chunks to a heap context, when such a situation happens.

Heap context creation is explicitly requested by userspace (using
the TILER_HEAP_CREATE ioctl), and the returned context is attached to a
queue through some command stream instruction.

All the kernel does is keep the list of heap chunks allocated to a
context, so they can be freed when TILER_HEAP_DESTROY is called, or
extended when the FW requests a new chunk.

v4:
- Rework locking to allow concurrent calls to panthor_heap_grow()
- Add a helper to return a heap chunk if we couldn't pass it to the
  FW because the group was scheduled out

v3:
- Add a FIXME for the heap OOM deadlock
- Use the panthor_kernel_bo abstraction for the heap context and heap
  chunks
- Drop the panthor_heap_gpu_ctx struct as it is opaque to the driver
- Ensure that the heap context is aligned to the GPU cache line size
- Minor code tidy ups

Co-developed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 596 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h |  39 ++
 2 files changed, 635 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
new file mode 100644
index 000000000000..fac51c24b3e9
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -0,0 +1,596 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2023 Collabora ltd. */
+
+#include <linux/iosys-map.h>
+#include <linux/rwsem.h>
+
+#include <drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_gem.h"
+#include "panthor_heap.h"
+#include "panthor_mmu.h"
+#include "panthor_regs.h"
+
+/*
+ * The GPU heap context is an opaque structure used by the GPU to track the
+ * heap allocations. The driver should only touch it to initialize it (zero all
+ * fields). Because the CPU and GPU can both access this structure it is
+ * required to be GPU cache line aligned.
+ */
+#define HEAP_CONTEXT_SIZE	32
+
+/**
+ * struct panthor_heap_chunk_header - Heap chunk header
+ */
+struct panthor_heap_chunk_header {
+	/**
+	 * @next: Next heap chunk in the list.
+	 *
+	 * This is a GPU VA.
+	 */
+	u64 next;
+
+	/** @unknown: MBZ. */
+	u32 unknown[14];
+};
+
+/**
+ * struct panthor_heap_chunk - Structure used to keep track of allocated heap chunks.
+ */
+struct panthor_heap_chunk {
+	/** @node: Used to insert the heap chunk in panthor_heap::chunks. */
+	struct list_head node;
+
+	/** @bo: Buffer object backing the heap chunk. */
+	struct panthor_kernel_bo *bo;
+};
+
+/**
+ * struct panthor_heap - Structure used to manage tiler heap contexts.
+ */
+struct panthor_heap {
+	/** @chunks: List containing all heap chunks allocated so far. */
+	struct list_head chunks;
+
+	/** @lock: Lock protecting insertion in the chunks list. */
+	struct mutex lock;
+
+	/** @chunk_size: Size of each chunk. */
+	u32 chunk_size;
+
+	/** @max_chunks: Maximum number of chunks. */
+	u32 max_chunks;
+
+	/**
+	 * @target_in_flight: Number of in-flight render passes after which
+	 * we'd let the FW wait for fragment job to finish instead of allocating new chunks.
+	 */
+	u32 target_in_flight;
+
+	/** @chunk_count: Number of heap chunks currently allocated. */
+	u32 chunk_count;
+};
+
+#define MAX_HEAPS_PER_POOL    128
+
+/**
+ * struct panthor_heap_pool - Pool of heap contexts
+ *
+ * The pool is attached to a panthor_file and can't be shared across processes.
+ */
+struct panthor_heap_pool {
+	/** @refcount: Reference count. */
+	struct kref refcount;
+
+	/** @ptdev: Device. */
+	struct panthor_device *ptdev;
+
+	/** @vm: VM this pool is bound to. */
+	struct panthor_vm *vm;
+
+	/** @lock: Lock protecting access to @xa. */
+	struct rw_semaphore lock;
+
+	/** @xa: Array storing panthor_heap objects. */
+	struct xarray xa;
+
+	/** @gpu_contexts: Buffer object containing the GPU heap contexts. */
+	struct panthor_kernel_bo *gpu_contexts;
+};
+
+static int panthor_heap_ctx_stride(struct panthor_device *ptdev)
+{
+	u32 l2_features = ptdev->gpu_info.l2_features;
+	u32 gpu_cache_line_size = GPU_L2_FEATURES_LINE_SIZE(l2_features);
+
+	return ALIGN(HEAP_CONTEXT_SIZE, gpu_cache_line_size);
+}
+
+static int panthor_get_heap_ctx_offset(struct panthor_heap_pool *pool, int id)
+{
+	return panthor_heap_ctx_stride(pool->ptdev) * id;
+}
+
+static void *panthor_get_heap_ctx(struct panthor_heap_pool *pool, int id)
+{
+	return pool->gpu_contexts->kmap +
+	       panthor_get_heap_ctx_offset(pool, id);
+}
+
+static void panthor_free_heap_chunk(struct panthor_vm *vm,
+				    struct panthor_heap *heap,
+				    struct panthor_heap_chunk *chunk)
+{
+	mutex_lock(&heap->lock);
+	list_del(&chunk->node);
+	heap->chunk_count--;
+	mutex_unlock(&heap->lock);
+
+	panthor_kernel_bo_destroy(vm, chunk->bo);
+	kfree(chunk);
+}
+
+static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
+				    struct panthor_vm *vm,
+				    struct panthor_heap *heap,
+				    bool initial_chunk)
+{
+	struct panthor_heap_chunk *chunk;
+	struct panthor_heap_chunk_header *hdr;
+	int ret;
+
+	chunk = kmalloc(sizeof(*chunk), GFP_KERNEL);
+	if (!chunk)
+		return -ENOMEM;
+
+	chunk->bo = panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
+					     DRM_PANTHOR_BO_NO_MMAP,
+					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
+					     PANTHOR_VM_KERNEL_AUTO_VA);
+	if (IS_ERR(chunk->bo)) {
+		ret = PTR_ERR(chunk->bo);
+		goto err_free_chunk;
+	}
+
+	ret = panthor_kernel_bo_vmap(chunk->bo);
+	if (ret)
+		goto err_destroy_bo;
+
+	hdr = chunk->bo->kmap;
+	memset(hdr, 0, sizeof(*hdr));
+
+	if (initial_chunk && !list_empty(&heap->chunks)) {
+		struct panthor_heap_chunk *prev_chunk;
+		u64 prev_gpuva;
+
+		prev_chunk = list_first_entry(&heap->chunks,
+					      struct panthor_heap_chunk,
+					      node);
+
+		prev_gpuva = panthor_kernel_bo_gpuva(prev_chunk->bo);
+		hdr->next = (prev_gpuva & GENMASK_ULL(63, 12)) |
+			    (heap->chunk_size >> 12);
+	}
+
+	panthor_kernel_bo_vunmap(chunk->bo);
+
+	mutex_lock(&heap->lock);
+	list_add(&chunk->node, &heap->chunks);
+	heap->chunk_count++;
+	mutex_unlock(&heap->lock);
+
+	return 0;
+
+err_destroy_bo:
+	panthor_kernel_bo_destroy(vm, chunk->bo);
+
+err_free_chunk:
+	kfree(chunk);
+
+	return ret;
+}
+
+static void panthor_free_heap_chunks(struct panthor_vm *vm,
+				     struct panthor_heap *heap)
+{
+	struct panthor_heap_chunk *chunk, *tmp;
+
+	list_for_each_entry_safe(chunk, tmp, &heap->chunks, node)
+		panthor_free_heap_chunk(vm, heap, chunk);
+}
+
+static int panthor_alloc_heap_chunks(struct panthor_device *ptdev,
+				     struct panthor_vm *vm,
+				     struct panthor_heap *heap,
+				     u32 chunk_count)
+{
+	int ret;
+	u32 i;
+
+	for (i = 0; i < chunk_count; i++) {
+		ret = panthor_alloc_heap_chunk(ptdev, vm, heap, true);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int
+panthor_heap_destroy_locked(struct panthor_heap_pool *pool, u32 handle)
+{
+	struct panthor_heap *heap;
+
+	heap = xa_erase(&pool->xa, handle);
+	if (!heap)
+		return -EINVAL;
+
+	panthor_free_heap_chunks(pool->vm, heap);
+	mutex_destroy(&heap->lock);
+	kfree(heap);
+	return 0;
+}
+
+/**
+ * panthor_heap_destroy() - Destroy a heap context
+ * @pool: Pool this context belongs to.
+ * @handle: Handle returned by panthor_heap_create().
+ */
+int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle)
+{
+	int ret;
+
+	down_write(&pool->lock);
+	ret = panthor_heap_destroy_locked(pool, handle);
+	up_write(&pool->lock);
+
+	return ret;
+}
+
+/**
+ * panthor_heap_create() - Create a heap context
+ * @pool: Pool to instantiate the heap context from.
+ * @initial_chunk_count: Number of chunk allocated at initialization time.
+ * Must be at least 1.
+ * @chunk_size: The size of each chunk. Must be a power of two between 256k
+ * and 2M.
+ * @max_chunks: Maximum number of chunks that can be allocated.
+ * @target_in_flight: Maximum number of in-flight render passes.
+ * @heap_ctx_gpu_va: Pointer holding the GPU address of the allocated heap
+ * context.
+ * @first_chunk_gpu_va: Pointer holding the GPU address of the first chunk
+ * assigned to the heap context.
+ *
+ * Return: a positive handle on success, a negative error otherwise.
+ */
+int panthor_heap_create(struct panthor_heap_pool *pool,
+			u32 initial_chunk_count,
+			u32 chunk_size,
+			u32 max_chunks,
+			u32 target_in_flight,
+			u64 *heap_ctx_gpu_va,
+			u64 *first_chunk_gpu_va)
+{
+	struct panthor_heap *heap;
+	struct panthor_heap_chunk *first_chunk;
+	struct panthor_vm *vm;
+	int ret = 0;
+	u32 id;
+
+	if (initial_chunk_count == 0)
+		return -EINVAL;
+
+	if (hweight32(chunk_size) != 1 ||
+	    chunk_size < SZ_256K || chunk_size > SZ_2M)
+		return -EINVAL;
+
+	down_read(&pool->lock);
+	vm = panthor_vm_get(pool->vm);
+	up_read(&pool->lock);
+
+	/* The pool has been destroyed, we can't create a new heap. */
+	if (!vm)
+		return -EINVAL;
+
+	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
+	if (!heap) {
+		ret = -ENOMEM;
+		goto err_put_vm;
+	}
+
+	mutex_init(&heap->lock);
+	INIT_LIST_HEAD(&heap->chunks);
+	heap->chunk_size = chunk_size;
+	heap->max_chunks = max_chunks;
+	heap->target_in_flight = target_in_flight;
+
+	ret = panthor_alloc_heap_chunks(pool->ptdev, vm, heap,
+					initial_chunk_count);
+	if (ret)
+		goto err_free_heap;
+
+	first_chunk = list_first_entry(&heap->chunks,
+				       struct panthor_heap_chunk,
+				       node);
+	*first_chunk_gpu_va = panthor_kernel_bo_gpuva(first_chunk->bo);
+
+	down_write(&pool->lock);
+	/* The pool has been destroyed, we can't create a new heap. */
+	if (!pool->vm) {
+		ret = -EINVAL;
+	} else {
+		ret = xa_alloc(&pool->xa, &id, heap, XA_LIMIT(1, MAX_HEAPS_PER_POOL), GFP_KERNEL);
+		if (!ret) {
+			void *gpu_ctx = panthor_get_heap_ctx(pool, id);
+
+			memset(gpu_ctx, 0, panthor_heap_ctx_stride(pool->ptdev));
+			*heap_ctx_gpu_va = panthor_kernel_bo_gpuva(pool->gpu_contexts) +
+					   panthor_get_heap_ctx_offset(pool, id);
+		}
+	}
+	up_write(&pool->lock);
+
+	if (ret)
+		goto err_free_heap;
+
+	panthor_vm_put(vm);
+	return id;
+
+err_free_heap:
+	panthor_free_heap_chunks(pool->vm, heap);
+	mutex_destroy(&heap->lock);
+	kfree(heap);
+
+err_put_vm:
+	panthor_vm_put(vm);
+	return ret;
+}
+
+/**
+ * panthor_heap_return_chunk() - Return an unused heap chunk
+ * @pool: The pool this heap belongs to.
+ * @heap_gpu_va: The GPU address of the heap context.
+ * @chunk_gpu_va: The chunk VA to return.
+ *
+ * This function is used when a chunk allocated with panthor_heap_grow()
+ * couldn't be linked to the heap context through the FW interface because
+ * the group requesting the allocation was scheduled out in the meantime.
+ */
+int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
+			      u64 heap_gpu_va,
+			      u64 chunk_gpu_va)
+{
+	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
+	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
+	struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
+	struct panthor_heap *heap;
+	int ret;
+
+	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
+		return -EINVAL;
+
+	down_read(&pool->lock);
+	heap = xa_load(&pool->xa, heap_id);
+	if (!heap) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	chunk_gpu_va &= GENMASK_ULL(63, 12);
+
+	mutex_lock(&heap->lock);
+	list_for_each_entry_safe(chunk, tmp, &heap->chunks, node) {
+		if (panthor_kernel_bo_gpuva(chunk->bo) == chunk_gpu_va) {
+			removed = chunk;
+			list_del(&chunk->node);
+			heap->chunk_count--;
+			break;
+		}
+	}
+	mutex_unlock(&heap->lock);
+
+	if (removed) {
+		panthor_kernel_bo_destroy(pool->vm, chunk->bo);
+		kfree(chunk);
+		ret = 0;
+	} else {
+		ret = -EINVAL;
+	}
+
+out_unlock:
+	up_read(&pool->lock);
+	return ret;
+}
+
+/**
+ * panthor_heap_grow() - Make a heap context grow.
+ * @pool: The pool this heap belongs to.
+ * @heap_gpu_va: The GPU address of the heap context.
+ * @renderpasses_in_flight: Number of render passes currently in-flight.
+ * @pending_frag_count: Number of fragment jobs waiting for execution/completion.
+ * @new_chunk_gpu_va: Pointer used to return the chunk VA.
+ */
+int panthor_heap_grow(struct panthor_heap_pool *pool,
+		      u64 heap_gpu_va,
+		      u32 renderpasses_in_flight,
+		      u32 pending_frag_count,
+		      u64 *new_chunk_gpu_va)
+{
+	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
+	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
+	struct panthor_heap_chunk *chunk;
+	struct panthor_heap *heap;
+	int ret;
+
+	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
+		return -EINVAL;
+
+	down_read(&pool->lock);
+	heap = xa_load(&pool->xa, heap_id);
+	if (!heap) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* If we reached the target in-flight render passes, or if we
+	 * reached the maximum number of chunks, let the FW figure another way to
+	 * find some memory (wait for render passes to finish, or call the exception
+	 * handler provided by the userspace driver, if any).
+	 */
+	if (renderpasses_in_flight > heap->target_in_flight ||
+	    (pending_frag_count > 0 && heap->chunk_count >= heap->max_chunks)) {
+		ret = -EBUSY;
+		goto out_unlock;
+	} else if (heap->chunk_count >= heap->max_chunks) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	/* FIXME: panthor_alloc_heap_chunk() triggers a kernel BO creation, which
+	 * relies on blocking allocations (both for the BO itself, and backing
+	 * memory), which might cause a deadlock because we're called from a context
+	 * where we hold the panthor scheduler lock, thus preventing job cleanups
+	 * that could free up some memory. The jobs themselves will timeout, but
+	 * we'll still be blocked there. The only solution here is to implement
+	 * something similar to shmem_sg_alloc_table() in i915, so we can do
+	 * non-blocking allocations, and just kill the job when we run out-of-memory
+	 * for the tiler context.
+	 */
+	ret = panthor_alloc_heap_chunk(pool->ptdev, pool->vm, heap, false);
+	if (ret)
+		goto out_unlock;
+
+	chunk = list_first_entry(&heap->chunks,
+				 struct panthor_heap_chunk,
+				 node);
+	*new_chunk_gpu_va = (panthor_kernel_bo_gpuva(chunk->bo) & GENMASK_ULL(63, 12)) |
+			    (heap->chunk_size >> 12);
+	ret = 0;
+
+out_unlock:
+	up_read(&pool->lock);
+	return ret;
+}
+
+static void panthor_heap_pool_release(struct kref *refcount)
+{
+	struct panthor_heap_pool *pool =
+		container_of(refcount, struct panthor_heap_pool, refcount);
+
+	xa_destroy(&pool->xa);
+	kfree(pool);
+}
+
+/**
+ * panthor_heap_pool_put() - Release a heap pool reference
+ * @pool: Pool to release the reference on. Can be NULL.
+ */
+void panthor_heap_pool_put(struct panthor_heap_pool *pool)
+{
+	if (pool)
+		kref_put(&pool->refcount, panthor_heap_pool_release);
+}
+
+/**
+ * panthor_heap_pool_get() - Get a heap pool reference
+ * @pool: Pool to get the reference on. Can be NULL.
+ *
+ * Return: @pool.
+ */
+struct panthor_heap_pool *
+panthor_heap_pool_get(struct panthor_heap_pool *pool)
+{
+	if (pool)
+		kref_get(&pool->refcount);
+
+	return pool;
+}
+
+/**
+ * panthor_heap_pool_create() - Create a heap pool
+ * @ptdev: Device.
+ * @vm: The VM this heap pool will be attached to.
+ *
+ * Heap pools might contain up to 128 heap contexts, and are per-VM.
+ *
+ * Return: A valid pointer on success, a negative error code otherwise.
+ */
+struct panthor_heap_pool *
+panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
+{
+	size_t bosize = ALIGN(MAX_HEAPS_PER_POOL *
+			      panthor_heap_ctx_stride(ptdev),
+			      4096);
+	struct panthor_heap_pool *pool;
+	int ret = 0;
+
+	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	/* We want a weak ref here: the heap pool belongs to the VM, so we're
+	 * sure that, as long as the heap pool exists, the VM exists too.
+	 */
+	pool->vm = vm;
+	pool->ptdev = ptdev;
+	init_rwsem(&pool->lock);
+	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC1);
+	kref_init(&pool->refcount);
+
+	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
+						      DRM_PANTHOR_BO_NO_MMAP,
+						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
+						      PANTHOR_VM_KERNEL_AUTO_VA);
+	if (IS_ERR(pool->gpu_contexts)) {
+		ret = PTR_ERR(pool->gpu_contexts);
+		goto err_destroy_pool;
+	}
+
+	ret = panthor_kernel_bo_vmap(pool->gpu_contexts);
+	if (ret)
+		goto err_destroy_pool;
+
+	return pool;
+
+err_destroy_pool:
+	panthor_heap_pool_destroy(pool);
+	return ERR_PTR(ret);
+}
+
+/**
+ * panthor_heap_pool_destroy() - Destroy a heap pool.
+ * @pool: Pool to destroy.
+ *
+ * This function destroys all heap contexts and their resources. Thus
+ * preventing any use of the heap context or the chunk attached to them
+ * after that point.
+ *
+ * If the GPU still has access to some heap contexts, a fault should be
+ * triggered, which should flag the command stream groups using these
+ * context as faulty.
+ *
+ * The heap pool object is only released when all references to this pool
+ * are released.
+ */
+void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
+{
+	struct panthor_heap *heap;
+	unsigned long i;
+
+	if (!pool)
+		return;
+
+	down_write(&pool->lock);
+	xa_for_each(&pool->xa, i, heap)
+		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
+
+	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
+		panthor_kernel_bo_destroy(pool->vm, pool->gpu_contexts);
+
+	/* Reflects the fact the pool has been destroyed. */
+	pool->vm = NULL;
+	up_write(&pool->lock);
+
+	panthor_heap_pool_put(pool);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
new file mode 100644
index 000000000000..25a5f2bba445
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_heap.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2023 Collabora ltd. */
+
+#ifndef __PANTHOR_HEAP_H__
+#define __PANTHOR_HEAP_H__
+
+#include <linux/types.h>
+
+struct panthor_device;
+struct panthor_heap_pool;
+struct panthor_vm;
+
+int panthor_heap_create(struct panthor_heap_pool *pool,
+			u32 initial_chunk_count,
+			u32 chunk_size,
+			u32 max_chunks,
+			u32 target_in_flight,
+			u64 *heap_ctx_gpu_va,
+			u64 *first_chunk_gpu_va);
+int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle);
+
+struct panthor_heap_pool *
+panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm);
+void panthor_heap_pool_destroy(struct panthor_heap_pool *pool);
+
+struct panthor_heap_pool *
+panthor_heap_pool_get(struct panthor_heap_pool *pool);
+void panthor_heap_pool_put(struct panthor_heap_pool *pool);
+
+int panthor_heap_grow(struct panthor_heap_pool *pool,
+		      u64 heap_gpu_va,
+		      u32 renderpasses_in_flight,
+		      u32 pending_frag_count,
+		      u64 *new_chunk_gpu_va);
+int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
+			      u64 heap_gpu_va,
+			      u64 chunk_gpu_va);
+
+#endif
-- 
2.43.0

