Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503A37A782
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051496EA3B;
	Tue, 11 May 2021 13:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD496EA3D;
 Tue, 11 May 2021 13:26:16 +0000 (UTC)
IronPort-SDR: V8TH/naUq8SSqd6Wfpvb/YizZiijXC+dGLPUXAGm2cgESABK+d8FHHvU25meOXa3KdITdrIscV
 3agVenfU9uyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196345411"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196345411"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:26:16 -0700
IronPort-SDR: kIC6BdFzd2UKWk4SBmWo7ZBuvyiLPWOLATdPmkj/dVATdbcQ+walh6Rg9dYq8yn0gcP7qKEoIa
 jP91SjsgjGhg==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="468905434"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.168])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:26:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/ttm,
 drm/ttm: Add a generic TTM memcpy move for page-based iomem
Date: Tue, 11 May 2021 15:25:23 +0200
Message-Id: <20210511132525.377190-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
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

The internal ttm_bo_util memcpy uses vmap functionality, and while it
probably might be possible to use it for copying in- and out of
sglist represented io memory, using io_mem_reserve() / io_mem_free()
callbacks, that would cause problems with fault().
Instead, implement a method mapping page-by-page using kmap_local()
semantics. As an additional benefit we then avoid the occasional global
TLB flushes of vmap() and consuming vmap space, elimination of a critical
point of failure and with a slight change of semantics we could also push
the memcpy out async for testing and async driver develpment purposes.
Pushing out async can be done since there is no memory allocation going on
that could violate the dma_fence lockdep rules.

Note that drivers that don't want to use struct io_mapping but relies on
memremap functionality, and that don't want to use scatterlists for
VRAM may well define specialized (hopefully reusable) iterators for their
particular environment.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.c   | 155 ++++++++++++++++++
 .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.h   | 141 ++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo.c                  |   1 +
 4 files changed, 298 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index cb8823570996..958ccc1edfed 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -155,6 +155,7 @@ gem-y += \
 	gem/i915_gem_stolen.o \
 	gem/i915_gem_throttle.o \
 	gem/i915_gem_tiling.o \
+	gem/i915_gem_ttm_bo_util.o \
 	gem/i915_gem_userptr.o \
 	gem/i915_gem_wait.o \
 	gem/i915_gemfs.o
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c
new file mode 100644
index 000000000000..1116d7df1461
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+/**
+ * DOC: Usage and intentions.
+ *
+ * This file contains functionality that we might want to move into
+ * ttm_bo_util.c if there is a common interest.
+ * Currently a kmap_local only memcpy with support for page-based iomem regions,
+ * and fast memcpy from write-combined memory.
+ */
+
+#include <linux/dma-buf-map.h>
+#include <linux/highmem.h>
+#include <linux/io-mapping.h>
+#include <linux/scatterlist.h>
+
+#include "i915_memcpy.h"
+
+#include "gem/i915_gem_ttm_bo_util.h"
+
+static void i915_ttm_kmap_iter_tt_kmap_local(struct i915_ttm_kmap_iter *iter,
+					     struct dma_buf_map *dmap,
+					     pgoff_t i)
+{
+	struct i915_ttm_kmap_iter_tt *iter_tt =
+		container_of(iter, typeof(*iter_tt), base);
+
+	dma_buf_map_set_vaddr(dmap, kmap_local_page(iter_tt->tt->pages[i]));
+}
+
+static void i915_ttm_kmap_iter_iomap_kmap_local(struct i915_ttm_kmap_iter *iter,
+						struct dma_buf_map *dmap,
+						pgoff_t i)
+{
+	struct i915_ttm_kmap_iter_iomap *iter_io =
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
+	}
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
+}
+
+struct i915_ttm_kmap_iter_ops i915_ttm_kmap_iter_tt_ops = {
+	.kmap_local = i915_ttm_kmap_iter_tt_kmap_local
+};
+
+struct i915_ttm_kmap_iter_ops i915_ttm_kmap_iter_io_ops = {
+	.kmap_local =  i915_ttm_kmap_iter_iomap_kmap_local
+};
+
+static void kunmap_local_dma_buf_map(struct dma_buf_map *map)
+{
+	if (map->is_iomem)
+		io_mapping_unmap_local(map->vaddr_iomem);
+	else
+		kunmap_local(map->vaddr);
+}
+
+/**
+ * i915_ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
+ * @bo: The struct ttm_buffer_object.
+ * @new_mem: The struct ttm_resource we're moving to (copy destination).
+ * @new_kmap: A struct i915_ttm_kmap_iter representing the destination resource.
+ * @old_kmap: A struct i915_ttm_kmap_iter representing the source resource.
+ */
+void i915_ttm_move_memcpy(struct ttm_buffer_object *bo,
+			  struct ttm_resource *new_mem,
+			  struct i915_ttm_kmap_iter *new_kmap,
+			  struct i915_ttm_kmap_iter *old_kmap)
+{
+	struct ttm_device *bdev = bo->bdev;
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	struct ttm_tt *ttm = bo->ttm;
+	struct ttm_resource *old_mem = &bo->mem;
+	struct ttm_resource old_copy = *old_mem;
+	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, old_mem->mem_type);
+	struct dma_buf_map old_map, new_map;
+	pgoff_t i;
+
+	/* For the page-based allocator we need sgtable iterators as well.*/
+
+	/* Single TTM move. NOP */
+	if (old_man->use_tt && man->use_tt)
+		goto done;
+
+	/* Don't move nonexistent data. Clear destination instead. */
+	if (old_man->use_tt && !man->use_tt &&
+	    (ttm == NULL || !ttm_tt_is_populated(ttm))) {
+		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
+			goto done;
+
+		for (i = 0; i < new_mem->num_pages; ++i) {
+			new_kmap->ops->kmap_local(new_kmap, &new_map, i);
+			memset_io(new_map.vaddr_iomem, 0, PAGE_SIZE);
+			kunmap_local_dma_buf_map(&new_map);
+		}
+		goto done;
+	}
+
+	for (i = 0; i < new_mem->num_pages; ++i) {
+		new_kmap->ops->kmap_local(new_kmap, &new_map, i);
+		old_kmap->ops->kmap_local(old_kmap, &old_map, i);
+		if (!old_map.is_iomem ||
+		    !i915_memcpy_from_wc(new_map.vaddr, old_map.vaddr, PAGE_SIZE)) {
+			if (!old_map.is_iomem) {
+				dma_buf_map_memcpy_to(&new_map, old_map.vaddr,
+						      PAGE_SIZE);
+			} else if (!new_map.is_iomem) {
+				memcpy_fromio(new_map.vaddr, old_map.vaddr_iomem,
+					      PAGE_SIZE);
+			} else {
+				pgoff_t j;
+				u32 __iomem *src = old_map.vaddr_iomem;
+				u32 __iomem *dst = new_map.vaddr_iomem;
+
+				for (j = 0; j < (PAGE_SIZE >> 2); ++j)
+					iowrite32(ioread32(src++), dst++);
+			}
+		}
+		kunmap_local_dma_buf_map(&old_map);
+		kunmap_local_dma_buf_map(&new_map);
+	}
+
+done:
+	old_copy = *old_mem;
+
+	ttm_bo_assign_mem(bo, new_mem);
+
+	if (!man->use_tt)
+		ttm_bo_tt_destroy(bo);
+
+	ttm_resource_free(bo, &old_copy);
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h
new file mode 100644
index 000000000000..82c92176718d
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+/*
+ * This files contains functionality that we might want to move into
+ * ttm_bo_util.c if there is a common interest.
+ */
+#ifndef _I915_GEM_TTM_BO_UTIL_H_
+#define _I915_GEM_TTM_BO_UTIL_H_
+
+#include <drm/ttm/ttm_bo_driver.h>
+struct dma_buf_map;
+struct io_mapping;
+struct sg_table;
+struct scatterlist;
+
+struct ttm_tt;
+struct i915_ttm_kmap_iter;
+
+/**
+ * struct i915_ttm_kmap_iter_ops - Ops structure for a struct
+ * i915_ttm_kmap_iter.
+ */
+struct i915_ttm_kmap_iter_ops {
+	/**
+	 * kmap_local - Map a PAGE_SIZE part of the resource using
+	 * kmap_local semantics.
+	 * @res_kmap: Pointer to the struct i915_ttm_kmap_iter representing
+	 * the resource.
+	 * @dmap: The struct dma_buf_map holding the virtual address after
+	 * the operation.
+	 * @i: The location within the resource to map. PAGE_SIZE granularity.
+	 */
+	void (*kmap_local)(struct i915_ttm_kmap_iter *res_kmap,
+			   struct dma_buf_map *dmap, pgoff_t i);
+};
+
+/**
+ * struct i915_ttm_kmap_iter - Iterator for kmap_local type operations on a
+ * resource.
+ * @ops: Pointer to the operations struct.
+ *
+ * This struct is intended to be embedded in a resource-specific specialization
+ * implementing operations for the resource.
+ *
+ * Nothing stops us from extending the operations to vmap, vmap_pfn etc,
+ * replacing some or parts of the ttm_bo_util. cpu-map functionality.
+ */
+struct i915_ttm_kmap_iter {
+	const struct i915_ttm_kmap_iter_ops *ops;
+};
+
+/**
+ * struct i915_ttm_kmap_iter_tt - Specialization for a tt (page) backed struct
+ * ttm_resource.
+ * @base: Embedded struct i915_ttm_kmap_iter providing the usage interface
+ * @tt: Cached struct ttm_tt.
+ */
+struct i915_ttm_kmap_iter_tt {
+	struct i915_ttm_kmap_iter base;
+	struct ttm_tt *tt;
+};
+
+/**
+ * struct i915_ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
+ * struct sg_table backed struct ttm_resource.
+ * @base: Embedded struct i915_ttm_kmap_iter providing the usage interface.
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
+struct i915_ttm_kmap_iter_iomap {
+	struct i915_ttm_kmap_iter base;
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
+extern struct i915_ttm_kmap_iter_ops i915_ttm_kmap_iter_tt_ops;
+extern struct i915_ttm_kmap_iter_ops i915_ttm_kmap_iter_io_ops;
+
+/**
+ * i915_ttm_kmap_iter_iomap_init - Initialize a struct i915_ttm_kmap_iter_iomap
+ * @iter_io: The struct i915_ttm_kmap_iter_iomap to initialize.
+ * @iomap: The struct io_mapping representing the underlying linear io_memory.
+ * @st: sg_table into @iomap, representing the memory of the struct
+ * ttm_resource.
+ * @start: Offset that needs to be subtracted from @st to make
+ * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
+ *
+ * Return: Pointer to the embedded struct i915_ttm_kmap_iter.
+ */
+static inline struct i915_ttm_kmap_iter *
+i915_ttm_kmap_iter_iomap_init(struct i915_ttm_kmap_iter_iomap *iter_io,
+			      struct io_mapping *iomap,
+			      struct sg_table *st,
+			      resource_size_t start)
+{
+	iter_io->base.ops = &i915_ttm_kmap_iter_io_ops;
+	iter_io->iomap = iomap;
+	iter_io->st = st;
+	iter_io->start = start;
+	memset(&iter_io->cache, 0, sizeof(iter_io->cache));
+	return &iter_io->base;
+}
+
+/**
+ * ttm_kmap_iter_tt_init - Initialize a struct i915_ttm_kmap_iter_tt
+ * @iter_tt: The struct i915_ttm_kmap_iter_tt to initialize.
+ * @tt: Struct ttm_tt holding page pointers of the struct ttm_resource.
+ *
+ * Return: Pointer to the embedded struct i915_ttm_kmap_iter.
+ */
+static inline struct i915_ttm_kmap_iter *
+i915_ttm_kmap_iter_tt_init(struct i915_ttm_kmap_iter_tt *iter_tt,
+			   struct ttm_tt *tt)
+{
+	iter_tt->base.ops = &i915_ttm_kmap_iter_tt_ops;
+	iter_tt->tt = tt;
+	return &iter_tt->base;
+}
+
+void i915_ttm_move_memcpy(struct ttm_buffer_object *bo,
+			  struct ttm_resource *new_mem,
+			  struct i915_ttm_kmap_iter *new_iter,
+			  struct i915_ttm_kmap_iter *old_iter);
+#endif
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ca1b098b6a56..4479c55aaa1d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1221,3 +1221,4 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
+EXPORT_SYMBOL(ttm_bo_tt_destroy);
-- 
2.30.2

