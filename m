Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5EA38B2AD
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677C36F47B;
	Thu, 20 May 2021 15:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147296E1BE;
 Thu, 20 May 2021 15:10:38 +0000 (UTC)
IronPort-SDR: mbX+d8G7gik3ZjQnTm7UeDCooH+Gy2d5oYicvKUlXFJOnJOUnTUmIEz14uy+OMX5R/iOSPfxew
 /OTjv5tV6SfA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="222341180"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="222341180"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:10:00 -0700
IronPort-SDR: IOVnqwaDlb4a9XEeMYvp7bbL/kLlusFzRrnLZ7UePtd+DiS9Kd65Vs50uYbGQU8l+Ko183Z1xz
 TmRg/XvCANDQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395728149"
Received: from cbjoerns-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.247])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:09:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/5] drm/ttm: Add a generic TTM memcpy move for page-based
 iomem
Date: Thu, 20 May 2021 17:09:43 +0200
Message-Id: <20210520150947.803891-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The internal ttm_bo_util memcpy uses ioremap functionality, and while it
probably might be possible to use it for copying in- and out of
sglist represented io memory, using io_mem_reserve() / io_mem_free()
callbacks, that would cause problems with fault().
Instead, implement a method mapping page-by-page using kmap_local()
semantics. As an additional benefit we then avoid the occasional global
TLB flushes of ioremap() and consuming ioremap space, elimination of a
critical point of failure and with a slight change of semantics we could
also push the memcpy out async for testing and async driver development
purposes.

A special linear iomem iterator is introduced internally to mimic the
old ioremap behaviour for code-paths that can't immediately be ported
over. This adds to the code size and should be considered a temporary
solution.

Looking at the code we have a lot of checks for iomap tagged pointers.
Ideally we should extend the core memremap functions to also accept
uncached memory and kmap_local functionality. Then we could strip a
lot of code.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 468 ++++++++++++++++++++----------
 include/drm/ttm/ttm_bo_driver.h   |  94 ++++++
 2 files changed, 407 insertions(+), 155 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ae8b61460724..bad9b16e96ba 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -35,11 +35,13 @@
 #include <linux/dma-buf-map.h>
 #include <linux/io.h>
 #include <linux/highmem.h>
+#include <linux/io-mapping.h>
 #include <linux/wait.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/module.h>
 #include <linux/dma-resv.h>
+#include <linux/scatterlist.h>
 
 struct ttm_transfer_obj {
 	struct ttm_buffer_object base;
@@ -72,190 +74,366 @@ void ttm_mem_io_free(struct ttm_device *bdev,
 	mem->bus.addr = NULL;
 }
 
-static int ttm_resource_ioremap(struct ttm_device *bdev,
-			       struct ttm_resource *mem,
-			       void **virtual)
+static pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
 {
-	int ret;
-	void *addr;
+	/* Cached mappings need no adjustment */
+	if (caching == ttm_cached)
+		return tmp;
 
-	*virtual = NULL;
-	ret = ttm_mem_io_reserve(bdev, mem);
-	if (ret || !mem->bus.is_iomem)
-		return ret;
+#if defined(__i386__) || defined(__x86_64__)
+	if (caching == ttm_write_combined)
+		tmp = pgprot_writecombine(tmp);
+	else if (boot_cpu_data.x86 > 3)
+		tmp = pgprot_noncached(tmp);
+#endif
+#if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
+	defined(__powerpc__) || defined(__mips__)
+	if (caching == ttm_write_combined)
+		tmp = pgprot_writecombine(tmp);
+	else
+		tmp = pgprot_noncached(tmp);
+#endif
+#if defined(__sparc__)
+	tmp = pgprot_noncached(tmp);
+#endif
+	return tmp;
+}
 
-	if (mem->bus.addr) {
-		addr = mem->bus.addr;
-	} else {
-		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
+static void ttm_kmap_iter_tt_kmap_local(struct ttm_kmap_iter *iter,
+					struct dma_buf_map *dmap,
+					pgoff_t i)
+{
+	struct ttm_kmap_iter_tt *iter_tt =
+		container_of(iter, typeof(*iter_tt), base);
 
-		if (mem->bus.caching == ttm_write_combined)
-			addr = ioremap_wc(mem->bus.offset, bus_size);
-#ifdef CONFIG_X86
-		else if (mem->bus.caching == ttm_cached)
-			addr = ioremap_cache(mem->bus.offset, bus_size);
-#endif
-		else
-			addr = ioremap(mem->bus.offset, bus_size);
-		if (!addr) {
-			ttm_mem_io_free(bdev, mem);
-			return -ENOMEM;
-		}
+	dma_buf_map_set_vaddr(dmap, kmap_local_page_prot(iter_tt->tt->pages[i],
+							 iter_tt->prot));
+}
+
+static void ttm_kmap_iter_iomap_kmap_local(struct ttm_kmap_iter *iter,
+					   struct dma_buf_map *dmap,
+					   pgoff_t i)
+{
+	struct ttm_kmap_iter_iomap *iter_io =
+		container_of(iter, typeof(*iter_io), base);
+	void __iomem *addr;
+
+retry:
+	while (i >= iter_io->cache.end) {
+		iter_io->cache.sg = iter_io->cache.sg ?
+			sg_next(iter_io->cache.sg) : iter_io->st->sgl;
+		iter_io->cache.i = iter_io->cache.end;
+		iter_io->cache.end += sg_dma_len(iter_io->cache.sg) >>
+			PAGE_SHIFT;
+		iter_io->cache.offs = sg_dma_address(iter_io->cache.sg) -
+			iter_io->start;
 	}
-	*virtual = addr;
-	return 0;
+
+	if (i < iter_io->cache.i) {
+		iter_io->cache.end = 0;
+		iter_io->cache.sg = NULL;
+		goto retry;
+	}
+
+	addr = io_mapping_map_local_wc(iter_io->iomap, iter_io->cache.offs +
+				       (((resource_size_t)i - iter_io->cache.i)
+					<< PAGE_SHIFT));
+	dma_buf_map_set_vaddr_iomem(dmap, addr);
 }
 
-static void ttm_resource_iounmap(struct ttm_device *bdev,
-				struct ttm_resource *mem,
-				void *virtual)
+static const struct ttm_kmap_iter_ops ttm_kmap_iter_tt_ops = {
+	.kmap_local = ttm_kmap_iter_tt_kmap_local,
+	.needs_unmap = true
+};
+
+static const struct ttm_kmap_iter_ops ttm_kmap_iter_io_ops = {
+	.kmap_local =  ttm_kmap_iter_iomap_kmap_local,
+	.needs_unmap = true
+};
+
+/* If needed, make unmap functionality part of ttm_kmap_iter_ops */
+static void kunmap_local_iter(struct ttm_kmap_iter *iter,
+			      struct dma_buf_map *map)
 {
-	if (virtual && mem->bus.addr == NULL)
-		iounmap(virtual);
-	ttm_mem_io_free(bdev, mem);
+	if (!iter->ops->needs_unmap)
+		return;
+
+	if (map->is_iomem)
+		io_mapping_unmap_local(map->vaddr_iomem);
+	else
+		kunmap_local(map->vaddr);
 }
 
-static int ttm_copy_io_page(void *dst, void *src, unsigned long page)
+/**
+ * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
+ * @bo: The struct ttm_buffer_object.
+ * @new_mem: The struct ttm_resource we're moving to (copy destination).
+ * @new_iter: A struct ttm_kmap_iter representing the destination resource.
+ * @old_iter: A struct ttm_kmap_iter representing the source resource.
+ *
+ * This function is intended to be able to move out async under a
+ * dma-fence if desired.
+ */
+void ttm_move_memcpy(struct ttm_buffer_object *bo,
+		     struct ttm_resource *new_mem,
+		     struct ttm_kmap_iter *new_iter,
+		     struct ttm_kmap_iter *old_iter)
 {
-	uint32_t *dstP =
-	    (uint32_t *) ((unsigned long)dst + (page << PAGE_SHIFT));
-	uint32_t *srcP =
-	    (uint32_t *) ((unsigned long)src + (page << PAGE_SHIFT));
-
-	int i;
-	for (i = 0; i < PAGE_SIZE / sizeof(uint32_t); ++i)
-		iowrite32(ioread32(srcP++), dstP++);
-	return 0;
+	struct ttm_device *bdev = bo->bdev;
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_tt *ttm = bo->ttm;
+	struct ttm_resource *old_mem = &bo->mem;
+	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, old_mem->mem_type);
+	struct dma_buf_map old_map, new_map;
+	pgoff_t i;
+
+	/* Single TTM move. NOP */
+	if (old_man->use_tt && man->use_tt)
+		return;
+
+	/* Don't move nonexistent data. Clear destination instead. */
+	if (old_man->use_tt && !man->use_tt &&
+	    (!ttm || !ttm_tt_is_populated(ttm))) {
+		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
+			return;
+
+		for (i = 0; i < new_mem->num_pages; ++i) {
+			new_iter->ops->kmap_local(new_iter, &new_map, i);
+			if (new_map.is_iomem)
+				memset_io(new_map.vaddr_iomem, 0, PAGE_SIZE);
+			else
+				memset(new_map.vaddr, 0, PAGE_SIZE);
+			kunmap_local_iter(new_iter, &new_map);
+		}
+		return;
+	}
+
+	for (i = 0; i < new_mem->num_pages; ++i) {
+		new_iter->ops->kmap_local(new_iter, &new_map, i);
+		old_iter->ops->kmap_local(old_iter, &old_map, i);
+
+		if (!old_map.is_iomem && !new_map.is_iomem) {
+			memcpy(new_map.vaddr, old_map.vaddr, PAGE_SIZE);
+		} else if (!old_map.is_iomem) {
+			dma_buf_map_memcpy_to(&new_map, old_map.vaddr,
+					      PAGE_SIZE);
+		} else if (!new_map.is_iomem) {
+			memcpy_fromio(new_map.vaddr, old_map.vaddr_iomem,
+				      PAGE_SIZE);
+		} else {
+			int j;
+			u32 __iomem *src = old_map.vaddr_iomem;
+			u32 __iomem *dst = new_map.vaddr_iomem;
+
+			for (j = 0; j < (PAGE_SIZE >> 2); ++j)
+				iowrite32(ioread32(src++), dst++);
+		}
+		kunmap_local_iter(old_iter, &old_map);
+		kunmap_local_iter(new_iter, &new_map);
+	}
 }
+EXPORT_SYMBOL(ttm_move_memcpy);
 
-static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
-				unsigned long page,
-				pgprot_t prot)
+/**
+ * ttm_kmap_iter_iomap_init - Initialize a struct ttm_kmap_iter_iomap
+ * @iter_io: The struct ttm_kmap_iter_iomap to initialize.
+ * @iomap: The struct io_mapping representing the underlying linear io_memory.
+ * @st: sg_table into @iomap, representing the memory of the struct
+ * ttm_resource.
+ * @start: Offset that needs to be subtracted from @st to make
+ * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
+ *
+ * Return: Pointer to the embedded struct ttm_kmap_iter.
+ */
+struct ttm_kmap_iter *
+ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
+			 struct io_mapping *iomap,
+			 struct sg_table *st,
+			 resource_size_t start)
 {
-	struct page *d = ttm->pages[page];
-	void *dst;
+	iter_io->base.ops = &ttm_kmap_iter_io_ops;
+	iter_io->iomap = iomap;
+	iter_io->st = st;
+	iter_io->start = start;
+	memset(&iter_io->cache, 0, sizeof(iter_io->cache));
 
-	if (!d)
-		return -ENOMEM;
+	return &iter_io->base;
+}
+EXPORT_SYMBOL(ttm_kmap_iter_iomap_init);
 
-	src = (void *)((unsigned long)src + (page << PAGE_SHIFT));
-	dst = kmap_atomic_prot(d, prot);
-	if (!dst)
-		return -ENOMEM;
+/**
+ * ttm_kmap_iter_tt_init - Initialize a struct ttm_kmap_iter_tt
+ * @iter_tt: The struct ttm_kmap_iter_tt to initialize.
+ * @tt: Struct ttm_tt holding page pointers of the struct ttm_resource.
+ *
+ * Return: Pointer to the embedded struct ttm_kmap_iter.
+ */
+struct ttm_kmap_iter *
+ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
+		      struct ttm_tt *tt)
+{
+	iter_tt->base.ops = &ttm_kmap_iter_tt_ops;
+	iter_tt->tt = tt;
+	iter_tt->prot = ttm_prot_from_caching(tt->caching, PAGE_KERNEL);
 
-	memcpy_fromio(dst, src, PAGE_SIZE);
+	return &iter_tt->base;
+}
+EXPORT_SYMBOL(ttm_kmap_iter_tt_init);
 
-	kunmap_atomic(dst);
+/**
+ * DOC: Linear io iterator
+ *
+ * This code should die in the not too near future. Best would be if we could
+ * make io-mapping use memremap for all io memory, and have memremap
+ * implement a kmap_local functionality. We could then strip a huge amount of
+ * code. These linear io iterators are implemented to mimic old functionality,
+ * and they don't use kmap_local semantics at all internally. Rather ioremap or
+ * friends, and at least on 32-bit they add global TLB flushes and points
+ * of failure.
+ */
 
-	return 0;
+/**
+ * struct ttm_kmap_iter_linear_io - Iterator specialization for linear io
+ * @base: The base iterator
+ * @dmap: Points to the starting address of the region
+ * @needs_unmap: Whether we need to unmap on fini
+ */
+struct ttm_kmap_iter_linear_io {
+	struct ttm_kmap_iter base;
+	struct dma_buf_map dmap;
+	bool needs_unmap;
+};
+
+static void ttm_kmap_iter_linear_io_kmap_local(struct ttm_kmap_iter *iter,
+					       struct dma_buf_map *dmap,
+					       pgoff_t i)
+{
+	struct ttm_kmap_iter_linear_io *iter_io =
+		container_of(iter, typeof(*iter_io), base);
+
+	*dmap = iter_io->dmap;
+	dma_buf_map_incr(dmap, i * PAGE_SIZE);
 }
 
-static int ttm_copy_ttm_io_page(struct ttm_tt *ttm, void *dst,
-				unsigned long page,
-				pgprot_t prot)
+static const struct ttm_kmap_iter_ops ttm_kmap_iter_linear_io_ops = {
+	.kmap_local =  ttm_kmap_iter_linear_io_kmap_local
+};
+
+static struct ttm_kmap_iter *
+ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
+			     struct ttm_device *bdev,
+			     struct ttm_resource *mem)
 {
-	struct page *s = ttm->pages[page];
-	void *src;
+	int ret;
 
-	if (!s)
-		return -ENOMEM;
+	ret = ttm_mem_io_reserve(bdev, mem);
+	if (ret)
+		goto out_err;
+	if (!mem->bus.is_iomem) {
+		ret = -EINVAL;
+		goto out_io_free;
+	}
 
-	dst = (void *)((unsigned long)dst + (page << PAGE_SHIFT));
-	src = kmap_atomic_prot(s, prot);
-	if (!src)
-		return -ENOMEM;
+	if (mem->bus.addr) {
+		dma_buf_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
+		iter_io->needs_unmap = false;
+	} else {
+		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
 
-	memcpy_toio(dst, src, PAGE_SIZE);
+		iter_io->needs_unmap = true;
+		if (mem->bus.caching == ttm_write_combined)
+			dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
+						    ioremap_wc(mem->bus.offset,
+							       bus_size));
+		else if (mem->bus.caching == ttm_cached)
+			dma_buf_map_set_vaddr(&iter_io->dmap,
+					      memremap(mem->bus.offset, bus_size,
+						       MEMREMAP_WB));
+		else
+			dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
+						    ioremap(mem->bus.offset,
+							    bus_size));
+		if (dma_buf_map_is_null(&iter_io->dmap)) {
+			ret = -ENOMEM;
+			goto out_io_free;
+		}
+	}
 
-	kunmap_atomic(src);
+	iter_io->base.ops = &ttm_kmap_iter_linear_io_ops;
+	return &iter_io->base;
 
-	return 0;
+out_io_free:
+	ttm_mem_io_free(bdev, mem);
+out_err:
+	return ERR_PTR(ret);
+}
+
+static void
+ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
+			     struct ttm_device *bdev,
+			     struct ttm_resource *mem)
+{
+	if (iter_io->needs_unmap && dma_buf_map_is_set(&iter_io->dmap)) {
+		if (iter_io->dmap.is_iomem)
+			iounmap(iter_io->dmap.vaddr_iomem);
+		else
+			memunmap(iter_io->dmap.vaddr);
+	}
+
+	ttm_mem_io_free(bdev, mem);
 }
 
+static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
+				 bool dst_use_tt);
+
 int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		       struct ttm_operation_ctx *ctx,
 		       struct ttm_resource *new_mem)
 {
 	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_resource_manager *new_man =
+		ttm_manager_type(bo->bdev, new_mem->mem_type);
 	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_resource *old_mem = &bo->mem;
 	struct ttm_resource old_copy = *old_mem;
-	void *old_iomap;
-	void *new_iomap;
+	union {
+		struct ttm_kmap_iter_tt tt;
+		struct ttm_kmap_iter_linear_io io;
+	} _new_iter, _old_iter;
+	struct ttm_kmap_iter *new_iter, *old_iter;
 	int ret;
-	unsigned long i;
-
-	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (ret)
-		return ret;
-
-	ret = ttm_resource_ioremap(bdev, old_mem, &old_iomap);
-	if (ret)
-		return ret;
-	ret = ttm_resource_ioremap(bdev, new_mem, &new_iomap);
-	if (ret)
-		goto out;
-
-	/*
-	 * Single TTM move. NOP.
-	 */
-	if (old_iomap == NULL && new_iomap == NULL)
-		goto out2;
 
-	/*
-	 * Don't move nonexistent data. Clear destination instead.
-	 */
-	if (old_iomap == NULL &&
-	    (ttm == NULL || (!ttm_tt_is_populated(ttm) &&
-			     !(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))) {
-		memset_io(new_iomap, 0, new_mem->num_pages*PAGE_SIZE);
-		goto out2;
-	}
-
-	/*
-	 * TTM might be null for moves within the same region.
-	 */
 	if (ttm) {
 		ret = ttm_tt_populate(bdev, ttm, ctx);
 		if (ret)
-			goto out1;
+			return ret;
 	}
 
-	for (i = 0; i < new_mem->num_pages; ++i) {
-		if (old_iomap == NULL) {
-			pgprot_t prot = ttm_io_prot(bo, old_mem, PAGE_KERNEL);
-			ret = ttm_copy_ttm_io_page(ttm, new_iomap, i,
-						   prot);
-		} else if (new_iomap == NULL) {
-			pgprot_t prot = ttm_io_prot(bo, new_mem, PAGE_KERNEL);
-			ret = ttm_copy_io_ttm_page(ttm, old_iomap, i,
-						   prot);
-		} else {
-			ret = ttm_copy_io_page(new_iomap, old_iomap, i);
-		}
-		if (ret)
-			goto out1;
+	new_iter = new_man->use_tt ?
+		ttm_kmap_iter_tt_init(&_new_iter.tt, bo->ttm) :
+		ttm_kmap_iter_linear_io_init(&_new_iter.io, bdev, new_mem);
+	if (IS_ERR(new_iter))
+		return PTR_ERR(new_iter);
+
+	old_iter = man->use_tt ?
+		ttm_kmap_iter_tt_init(&_old_iter.tt, bo->ttm) :
+		ttm_kmap_iter_linear_io_init(&_old_iter.io, bdev, old_mem);
+	if (IS_ERR(old_iter)) {
+		ret = PTR_ERR(old_iter);
+		goto out_old_iter;
 	}
-	mb();
-out2:
-	old_copy = *old_mem;
 
-	ttm_bo_assign_mem(bo, new_mem);
+	ttm_move_memcpy(bo, new_mem, new_iter, old_iter);
+	old_copy = *old_mem;
+	ret = ttm_bo_wait_free_node(bo, new_man->use_tt);
 
 	if (!man->use_tt)
-		ttm_bo_tt_destroy(bo);
+		ttm_kmap_iter_linear_io_fini(&_old_iter.io, bdev, &old_copy);
+out_old_iter:
+	if (!new_man->use_tt)
+		ttm_kmap_iter_linear_io_fini(&_new_iter.io, bdev, new_mem);
 
-out1:
-	ttm_resource_iounmap(bdev, old_mem, new_iomap);
-out:
-	ttm_resource_iounmap(bdev, &old_copy, old_iomap);
-
-	/*
-	 * On error, keep the mm node!
-	 */
-	if (!ret)
-		ttm_resource_free(bo, &old_copy);
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_move_memcpy);
@@ -336,27 +514,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 	man = ttm_manager_type(bo->bdev, res->mem_type);
 	caching = man->use_tt ? bo->ttm->caching : res->bus.caching;
 
-	/* Cached mappings need no adjustment */
-	if (caching == ttm_cached)
-		return tmp;
-
-#if defined(__i386__) || defined(__x86_64__)
-	if (caching == ttm_write_combined)
-		tmp = pgprot_writecombine(tmp);
-	else if (boot_cpu_data.x86 > 3)
-		tmp = pgprot_noncached(tmp);
-#endif
-#if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
-    defined(__powerpc__) || defined(__mips__)
-	if (caching == ttm_write_combined)
-		tmp = pgprot_writecombine(tmp);
-	else
-		tmp = pgprot_noncached(tmp);
-#endif
-#if defined(__sparc__)
-	tmp = pgprot_noncached(tmp);
-#endif
-	return tmp;
+	return ttm_prot_from_caching(caching, tmp);
 }
 EXPORT_SYMBOL(ttm_io_prot);
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index dbccac957f8f..30f1dce987b2 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -332,4 +332,98 @@ int ttm_range_man_init(struct ttm_device *bdev,
 int ttm_range_man_fini(struct ttm_device *bdev,
 		       unsigned type);
 
+struct dma_buf_map;
+struct io_mapping;
+struct sg_table;
+struct scatterlist;
+struct ttm_kmap_iter;
+
+/**
+ * struct ttm_kmap_iter_ops - Ops structure for a struct
+ * ttm_kmap_iter.
+ * @needs_unmap - Whether a kunmap_local is needed to balance @kmap_local.
+ */
+struct ttm_kmap_iter_ops {
+	/**
+	 * kmap_local - Map a PAGE_SIZE part of the resource using
+	 * kmap_local semantics.
+	 * @res_kmap: Pointer to the struct ttm_kmap_iter representing
+	 * the resource.
+	 * @dmap: The struct dma_buf_map holding the virtual address after
+	 * the operation.
+	 * @i: The location within the resource to map. PAGE_SIZE granularity.
+	 */
+	void (*kmap_local)(struct ttm_kmap_iter *res_kmap,
+			   struct dma_buf_map *dmap, pgoff_t i);
+	bool needs_unmap;
+};
+
+/**
+ * struct ttm_kmap_iter - Iterator for kmap_local type operations on a
+ * resource.
+ * @ops: Pointer to the operations struct.
+ *
+ * This struct is intended to be embedded in a resource-specific specialization
+ * implementing operations for the resource.
+ *
+ * Nothing stops us from extending the operations to vmap, vmap_pfn etc,
+ * replacing some or parts of the ttm_bo_util. cpu-map functionality.
+ */
+struct ttm_kmap_iter {
+	const struct ttm_kmap_iter_ops *ops;
+};
+
+/**
+ * struct ttm_kmap_iter_tt - Specialization for a tt (page) backed struct
+ * ttm_resource.
+ * @base: Embedded struct ttm_kmap_iter providing the usage interface
+ * @tt: Cached struct ttm_tt.
+ */
+struct ttm_kmap_iter_tt {
+	struct ttm_kmap_iter base;
+	struct ttm_tt *tt;
+	pgprot_t prot;
+};
+
+/**
+ * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
+ * struct sg_table backed struct ttm_resource.
+ * @base: Embedded struct ttm_kmap_iter providing the usage interface.
+ * @iomap: struct io_mapping representing the underlying linear io_memory.
+ * @st: sg_table into @iomap, representing the memory of the struct ttm_resource.
+ * @start: Offset that needs to be subtracted from @st to make
+ * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
+ * @cache: Scatterlist traversal cache for fast lookups.
+ * @cache.sg: Pointer to the currently cached scatterlist segment.
+ * @cache.i: First index of @sg. PAGE_SIZE granularity.
+ * @cache.end: Last index + 1 of @sg. PAGE_SIZE granularity.
+ * @cache.offs: First offset into @iomap of @sg. PAGE_SIZE granularity.
+ */
+struct ttm_kmap_iter_iomap {
+	struct ttm_kmap_iter base;
+	struct io_mapping *iomap;
+	struct sg_table *st;
+	resource_size_t start;
+	struct {
+		struct scatterlist *sg;
+		pgoff_t i;
+		pgoff_t end;
+		pgoff_t offs;
+	} cache;
+};
+
+void ttm_move_memcpy(struct ttm_buffer_object *bo,
+		     struct ttm_resource *new_mem,
+		     struct ttm_kmap_iter *new_iter,
+		     struct ttm_kmap_iter *old_iter);
+
+struct ttm_kmap_iter *
+ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
+		      struct ttm_tt *tt);
+
+struct ttm_kmap_iter *
+ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
+			 struct io_mapping *iomap,
+			 struct sg_table *st,
+			 resource_size_t start);
 #endif
-- 
2.31.1

