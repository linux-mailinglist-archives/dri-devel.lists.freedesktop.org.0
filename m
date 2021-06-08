Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520039F13D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C156EB44;
	Tue,  8 Jun 2021 08:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6B96EB3C;
 Tue,  8 Jun 2021 08:45:14 +0000 (UTC)
IronPort-SDR: w/4OHnyu2y0vMkVnO1RDfCkheBMTRbCqeCFQEd+2dctQp8QsD80yqyqAK5E5jjLN9vx+3u6oDu
 F1lvxdhK84Jg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202943843"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="202943843"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:45:13 -0700
IronPort-SDR: pDefVqBFfu8RQtDeywTZm0PGKY6giZSrsFTMkgmW8R8edzKN988cDt+5OVey6OAacf0sYO9syN
 4lEvqxQHYPgQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="440382092"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.170.251])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:45:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/i915/ttm: switch over to ttm_buddy_man
Date: Tue,  8 Jun 2021 09:44:27 +0100
Message-Id: <20210608084428.142676-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608084428.142676-1-matthew.auld@intel.com>
References: <20210608084428.142676-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move back to the buddy allocator for managing device local memory, and
restore the lost mock selftests. Keep around the range manager related
bits, since we likely need this for managing stolen at some point. For
stolen we also don't need to reserve anything so no need to support a
generic reserve interface.

v2(Thomas):
    - bo->page_alignment is in page units, not bytes

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  26 +--
 drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-----
 drivers/gpu/drm/i915/intel_memory_region.h    |  17 --
 drivers/gpu/drm/i915/intel_region_ttm.c       | 100 +++--------
 .../drm/i915/selftests/intel_memory_region.c  | 170 ++++++++++++------
 drivers/gpu/drm/i915/selftests/mock_region.c  |  15 +-
 6 files changed, 168 insertions(+), 215 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index c612275c36c9..5bf1d1945dd6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -181,11 +181,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
-	if (!i915_gem_object_evictable(obj))
-		return false;
-
-	/* This isn't valid with a buddy allocator */
-	return ttm_bo_eviction_valuable(bo, place);
+	return i915_gem_object_evictable(obj);
 }
 
 static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
@@ -328,11 +324,15 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, res->mem_type);
+	struct intel_memory_region *mr = obj->mm.region;
 
 	if (man->use_tt)
 		return i915_ttm_tt_get_st(bo->ttm);
 
-	return intel_region_ttm_node_to_st(obj->mm.region, res->mm_node);
+	if (mr->is_range_manager)
+		return intel_region_ttm_node_to_st(mr, res);
+	else
+		return i915_sg_from_buddy_resource(res, mr->region.start);
 }
 
 static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
@@ -657,20 +657,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	static struct lock_class_key lock_class;
 	struct drm_i915_private *i915 = mem->i915;
 	enum ttm_bo_type bo_type;
-	size_t alignment = 0;
 	int ret;
 
-	/* Adjust alignment to GPU- and CPU huge page sizes. */
-
-	if (mem->is_range_manager) {
-		if (size >= SZ_1G)
-			alignment = SZ_1G >> PAGE_SHIFT;
-		else if (size >= SZ_2M)
-			alignment = SZ_2M >> PAGE_SHIFT;
-		else if (size >= SZ_64K)
-			alignment = SZ_64K >> PAGE_SHIFT;
-	}
-
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
 	i915_gem_object_init_memory_region(obj, mem);
@@ -692,7 +680,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 */
 	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
 	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
-			  bo_type, &i915_sys_placement, alignment,
+			  bo_type, &i915_sys_placement, 1,
 			  true, NULL, NULL, i915_ttm_bo_destroy);
 
 	if (!ret)
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 12fb5423fd5e..df59f884d37c 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -5,6 +5,7 @@
 
 #include "intel_memory_region.h"
 #include "i915_drv.h"
+#include "i915_ttm_buddy_manager.h"
 
 static const struct {
 	u16 class;
@@ -28,11 +29,6 @@ static const struct {
 	},
 };
 
-struct intel_region_reserve {
-	struct list_head link;
-	struct ttm_resource *res;
-};
-
 struct intel_memory_region *
 intel_memory_region_lookup(struct drm_i915_private *i915,
 			   u16 class, u16 instance)
@@ -63,27 +59,6 @@ intel_memory_region_by_type(struct drm_i915_private *i915,
 	return NULL;
 }
 
-/**
- * intel_memory_region_unreserve - Unreserve all previously reserved
- * ranges
- * @mem: The region containing the reserved ranges.
- */
-void intel_memory_region_unreserve(struct intel_memory_region *mem)
-{
-	struct intel_region_reserve *reserve, *next;
-
-	if (!mem->priv_ops || !mem->priv_ops->free)
-		return;
-
-	mutex_lock(&mem->mm_lock);
-	list_for_each_entry_safe(reserve, next, &mem->reserved, link) {
-		list_del(&reserve->link);
-		mem->priv_ops->free(mem, reserve->res);
-		kfree(reserve);
-	}
-	mutex_unlock(&mem->mm_lock);
-}
-
 /**
  * intel_memory_region_reserve - Reserve a memory range
  * @mem: The region for which we want to reserve a range.
@@ -96,28 +71,11 @@ int intel_memory_region_reserve(struct intel_memory_region *mem,
 				resource_size_t offset,
 				resource_size_t size)
 {
-	int ret;
-	struct intel_region_reserve *reserve;
-
-	if (!mem->priv_ops || !mem->priv_ops->reserve)
-		return -EINVAL;
-
-	reserve = kzalloc(sizeof(*reserve), GFP_KERNEL);
-	if (!reserve)
-		return -ENOMEM;
+	struct ttm_resource_manager *man = mem->region_private;
 
-	reserve->res = mem->priv_ops->reserve(mem, offset, size);
-	if (IS_ERR(reserve->res)) {
-		ret = PTR_ERR(reserve->res);
-		kfree(reserve);
-		return ret;
-	}
-
-	mutex_lock(&mem->mm_lock);
-	list_add_tail(&reserve->link, &mem->reserved);
-	mutex_unlock(&mem->mm_lock);
+	GEM_BUG_ON(mem->is_range_manager);
 
-	return 0;
+	return i915_ttm_buddy_man_reserve(man, offset, size);
 }
 
 struct intel_memory_region *
@@ -149,9 +107,6 @@ intel_memory_region_create(struct drm_i915_private *i915,
 
 	mutex_init(&mem->objects.lock);
 	INIT_LIST_HEAD(&mem->objects.list);
-	INIT_LIST_HEAD(&mem->reserved);
-
-	mutex_init(&mem->mm_lock);
 
 	if (ops->init) {
 		err = ops->init(mem);
@@ -182,11 +137,9 @@ static void __intel_memory_region_destroy(struct kref *kref)
 	struct intel_memory_region *mem =
 		container_of(kref, typeof(*mem), kref);
 
-	intel_memory_region_unreserve(mem);
 	if (mem->ops->release)
 		mem->ops->release(mem);
 
-	mutex_destroy(&mem->mm_lock);
 	mutex_destroy(&mem->objects.lock);
 	kfree(mem);
 }
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index c7e635d62e1a..b04fb22726d9 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -59,19 +59,10 @@ struct intel_memory_region_ops {
 			   unsigned int flags);
 };
 
-struct intel_memory_region_private_ops {
-	struct ttm_resource *(*reserve)(struct intel_memory_region *mem,
-					resource_size_t offset,
-					resource_size_t size);
-	void (*free)(struct intel_memory_region *mem,
-		     struct ttm_resource *res);
-};
-
 struct intel_memory_region {
 	struct drm_i915_private *i915;
 
 	const struct intel_memory_region_ops *ops;
-	const struct intel_memory_region_private_ops *priv_ops;
 
 	struct io_mapping iomap;
 	struct resource region;
@@ -79,8 +70,6 @@ struct intel_memory_region {
 	/* For fake LMEM */
 	struct drm_mm_node fake_mappable;
 
-	struct mutex mm_lock;
-
 	struct kref kref;
 
 	resource_size_t io_start;
@@ -94,8 +83,6 @@ struct intel_memory_region {
 	char name[16];
 	bool private; /* not for userspace */
 
-	struct list_head reserved;
-
 	dma_addr_t remap_addr;
 
 	struct {
@@ -103,8 +90,6 @@ struct intel_memory_region {
 		struct list_head list;
 	} objects;
 
-	size_t chunk_size;
-	unsigned int max_order;
 	bool is_range_manager;
 
 	void *region_private;
@@ -138,8 +123,6 @@ __printf(2, 3) void
 intel_memory_region_set_name(struct intel_memory_region *mem,
 			     const char *fmt, ...);
 
-void intel_memory_region_unreserve(struct intel_memory_region *mem);
-
 int intel_memory_region_reserve(struct intel_memory_region *mem,
 				resource_size_t offset,
 				resource_size_t size);
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 5a664f6cc93f..23a1336d2335 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -8,6 +8,7 @@
 
 #include "i915_drv.h"
 #include "i915_scatterlist.h"
+#include "i915_ttm_buddy_manager.h"
 
 #include "intel_region_ttm.h"
 
@@ -67,72 +68,17 @@ int intel_region_to_ttm_type(const struct intel_memory_region *mem)
 	return type;
 }
 
-static struct ttm_resource *
-intel_region_ttm_node_reserve(struct intel_memory_region *mem,
-			      resource_size_t offset,
-			      resource_size_t size)
-{
-	struct ttm_resource_manager *man = mem->region_private;
-	struct ttm_place place = {};
-	struct ttm_buffer_object mock_bo = {};
-	struct ttm_resource *res;
-	int ret;
-
-	/*
-	 * Having to use a mock_bo is unfortunate but stems from some
-	 * drivers having private managers that insist to know what the
-	 * allocate memory is intended for, using it to send private
-	 * data to the manager. Also recently the bo has been used to send
-	 * alignment info to the manager. Assume that apart from the latter,
-	 * none of the managers we use will ever access the buffer object
-	 * members, hoping we can pass the alignment info in the
-	 * struct ttm_place in the future.
-	 */
-
-	place.fpfn = offset >> PAGE_SHIFT;
-	place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
-	mock_bo.base.size = size;
-	ret = man->func->alloc(man, &mock_bo, &place, &res);
-	if (ret == -ENOSPC)
-		ret = -ENXIO;
-
-	return ret ? ERR_PTR(ret) : res;
-}
-
-/**
- * intel_region_ttm_node_free - Free a node allocated from a resource manager
- * @mem: The region the node was allocated from.
- * @node: The opaque node representing an allocation.
- */
-void intel_region_ttm_node_free(struct intel_memory_region *mem,
-				struct ttm_resource *res)
-{
-	struct ttm_resource_manager *man = mem->region_private;
-
-	man->func->free(man, res);
-}
-
-static const struct intel_memory_region_private_ops priv_ops = {
-	.reserve = intel_region_ttm_node_reserve,
-	.free = intel_region_ttm_node_free,
-};
-
 int intel_region_ttm_init(struct intel_memory_region *mem)
 {
 	struct ttm_device *bdev = &mem->i915->bdev;
 	int mem_type = intel_region_to_ttm_type(mem);
 	int ret;
 
-	ret = ttm_range_man_init(bdev, mem_type, false,
-				 resource_size(&mem->region) >> PAGE_SHIFT);
+	ret = i915_ttm_buddy_man_init(bdev, mem_type, false,
+				      resource_size(&mem->region), PAGE_SIZE);
 	if (ret)
 		return ret;
 
-	mem->chunk_size = PAGE_SIZE;
-	mem->max_order =
-		get_order(rounddown_pow_of_two(resource_size(&mem->region)));
-	mem->is_range_manager = true;
-	mem->priv_ops = &priv_ops;
 	mem->region_private = ttm_manager_type(bdev, mem_type);
 
 	return 0;
@@ -150,8 +96,8 @@ void intel_region_ttm_fini(struct intel_memory_region *mem)
 {
 	int ret;
 
-	ret = ttm_range_man_fini(&mem->i915->bdev,
-				 intel_region_to_ttm_type(mem));
+	ret = i915_ttm_buddy_man_fini(&mem->i915->bdev,
+				      intel_region_to_ttm_type(mem));
 	GEM_WARN_ON(ret);
 	mem->region_private = NULL;
 }
@@ -206,25 +152,33 @@ intel_region_ttm_node_alloc(struct intel_memory_region *mem,
 	struct ttm_resource *res;
 	int ret;
 
-	/*
-	 * We ignore the flags for now since we're using the range
-	 * manager and contigous and min page size would be fulfilled
-	 * by default if size is min page size aligned.
-	 */
 	mock_bo.base.size = size;
-
-	if (mem->is_range_manager) {
-		if (size >= SZ_1G)
-			mock_bo.page_alignment = SZ_1G >> PAGE_SHIFT;
-		else if (size >= SZ_2M)
-			mock_bo.page_alignment = SZ_2M >> PAGE_SHIFT;
-		else if (size >= SZ_64K)
-			mock_bo.page_alignment = SZ_64K >> PAGE_SHIFT;
-	}
+	mock_bo.page_alignment = 1;
+	place.flags = flags;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
 	if (ret == -ENOSPC)
 		ret = -ENXIO;
 	return ret ? ERR_PTR(ret) : res;
 }
+
 #endif
+
+/**
+ * intel_region_ttm_init - Initialize a memory region for TTM.
+ * @mem: The region to initialize.
+ *
+ * This function initializes a suitable TTM resource manager for the
+ * region, and if it's a LMEM region type, attaches it to the TTM
+ * device. MOCK regions are NOT attached to the TTM device, since we don't
+ * have one for the mock selftests.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+void intel_region_ttm_node_free(struct intel_memory_region *mem,
+				struct ttm_resource *res)
+{
+	struct ttm_resource_manager *man = mem->region_private;
+
+	man->func->free(man, res);
+}
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index c85d516b85cd..dc23d699ecb5 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -20,7 +20,9 @@
 #include "gem/selftests/mock_context.h"
 #include "gt/intel_engine_user.h"
 #include "gt/intel_gt.h"
+#include "i915_buddy.h"
 #include "i915_memcpy.h"
+#include "i915_ttm_buddy_manager.h"
 #include "selftests/igt_flush_test.h"
 #include "selftests/i915_random.h"
 
@@ -57,10 +59,9 @@ static int igt_mock_fill(void *arg)
 	LIST_HEAD(objects);
 	int err = 0;
 
-	page_size = mem->chunk_size;
+	page_size = PAGE_SIZE;
+	max_pages = div64_u64(total, page_size);
 	rem = total;
-retry:
-	max_pages = div64_u64(rem, page_size);
 
 	for_each_prime_number_from(page_num, 1, max_pages) {
 		resource_size_t size = page_num * page_size;
@@ -86,11 +87,6 @@ static int igt_mock_fill(void *arg)
 		err = 0;
 	if (err == -ENXIO) {
 		if (page_num * page_size <= rem) {
-			if (mem->is_range_manager && max_pages > 1) {
-				max_pages >>= 1;
-				goto retry;
-			}
-
 			pr_err("%s failed, space still left in region\n",
 			       __func__);
 			err = -EINVAL;
@@ -157,6 +153,7 @@ static bool is_contiguous(struct drm_i915_gem_object *obj)
 static int igt_mock_reserve(void *arg)
 {
 	struct intel_memory_region *mem = arg;
+	struct drm_i915_private *i915 = mem->i915;
 	resource_size_t avail = resource_size(&mem->region);
 	struct drm_i915_gem_object *obj;
 	const u32 chunk_size = SZ_32M;
@@ -166,16 +163,18 @@ static int igt_mock_reserve(void *arg)
 	LIST_HEAD(objects);
 	int err = 0;
 
-	if (!list_empty(&mem->reserved)) {
-		pr_err("%s region reserved list is not empty\n", __func__);
-		return -EINVAL;
-	}
-
 	count = avail / chunk_size;
 	order = i915_random_order(count, &prng);
 	if (!order)
 		return 0;
 
+	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0);
+	if (IS_ERR(mem)) {
+		pr_err("failed to create memory region\n");
+		err = PTR_ERR(mem);
+		goto out_close;
+	}
+
 	/* Reserve a bunch of ranges within the region */
 	for (i = 0; i < count; ++i) {
 		u64 start = order[i] * chunk_size;
@@ -205,18 +204,12 @@ static int igt_mock_reserve(void *arg)
 	do {
 		u32 size = i915_prandom_u32_max_state(cur_avail, &prng);
 
-retry:
 		size = max_t(u32, round_up(size, PAGE_SIZE), PAGE_SIZE);
 		obj = igt_object_create(mem, &objects, size, 0);
 		if (IS_ERR(obj)) {
-			if (PTR_ERR(obj) == -ENXIO) {
-				if (mem->is_range_manager &&
-				    size > mem->chunk_size) {
-					size >>= 1;
-					goto retry;
-				}
+			if (PTR_ERR(obj) == -ENXIO)
 				break;
-			}
+
 			err = PTR_ERR(obj);
 			goto out_close;
 		}
@@ -232,7 +225,7 @@ static int igt_mock_reserve(void *arg)
 out_close:
 	kfree(order);
 	close_objects(mem, &objects);
-	intel_memory_region_unreserve(mem);
+	intel_memory_region_put(mem);
 	return err;
 }
 
@@ -252,7 +245,7 @@ static int igt_mock_contiguous(void *arg)
 	total = resource_size(&mem->region);
 
 	/* Min size */
-	obj = igt_object_create(mem, &objects, mem->chunk_size,
+	obj = igt_object_create(mem, &objects, PAGE_SIZE,
 				I915_BO_ALLOC_CONTIGUOUS);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
@@ -333,17 +326,15 @@ static int igt_mock_contiguous(void *arg)
 	min = target;
 	target = total >> 1;
 
-	if (!mem->is_range_manager) {
-		/* Make sure we can still allocate all the fragmented space */
-		obj = igt_object_create(mem, &objects, target, 0);
-		if (IS_ERR(obj)) {
-			err = PTR_ERR(obj);
-			goto err_close_objects;
-		}
-
-		igt_object_release(obj);
+	/* Make sure we can still allocate all the fragmented space */
+	obj = igt_object_create(mem, &objects, target, 0);
+	if (IS_ERR(obj)) {
+		err = PTR_ERR(obj);
+		goto err_close_objects;
 	}
 
+	igt_object_release(obj);
+
 	/*
 	 * Even though we have enough free space, we don't have a big enough
 	 * contiguous block. Make sure that holds true.
@@ -362,7 +353,7 @@ static int igt_mock_contiguous(void *arg)
 		}
 
 		target >>= 1;
-	} while (target >= mem->chunk_size);
+	} while (target >= PAGE_SIZE);
 
 err_close_objects:
 	list_splice_tail(&holes, &objects);
@@ -374,7 +365,9 @@ static int igt_mock_splintered_region(void *arg)
 {
 	struct intel_memory_region *mem = arg;
 	struct drm_i915_private *i915 = mem->i915;
+	struct i915_ttm_buddy_resource *res;
 	struct drm_i915_gem_object *obj;
+	struct i915_buddy_mm *mm;
 	unsigned int expected_order;
 	LIST_HEAD(objects);
 	u64 size;
@@ -382,7 +375,7 @@ static int igt_mock_splintered_region(void *arg)
 
 	/*
 	 * Sanity check we can still allocate everything even if the
-	 * max_order != mm.size. i.e our starting address space size is not a
+	 * mm.max_order != mm.size. i.e our starting address space size is not a
 	 * power-of-two.
 	 */
 
@@ -391,20 +384,29 @@ static int igt_mock_splintered_region(void *arg)
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);
 
-	expected_order = get_order(rounddown_pow_of_two(size));
-	if (mem->max_order != expected_order) {
-		pr_err("%s order mismatch(%u != %u)\n",
-		       __func__, mem->max_order, expected_order);
-		err = -EINVAL;
-		goto out_put;
-	}
-
 	obj = igt_object_create(mem, &objects, size, 0);
 	if (IS_ERR(obj)) {
 		err = PTR_ERR(obj);
 		goto out_close;
 	}
 
+	res = to_ttm_buddy_resource(obj->mm.st_mm_node);
+	mm = res->mm;
+	if (mm->size != size) {
+		pr_err("%s size mismatch(%llu != %llu)\n",
+		       __func__, mm->size, size);
+		err = -EINVAL;
+		goto out_put;
+	}
+
+	expected_order = get_order(rounddown_pow_of_two(size));
+	if (mm->max_order != expected_order) {
+		pr_err("%s order mismatch(%u != %u)\n",
+		       __func__, mm->max_order, expected_order);
+		err = -EINVAL;
+		goto out_put;
+	}
+
 	close_objects(mem, &objects);
 
 	/*
@@ -415,15 +417,12 @@ static int igt_mock_splintered_region(void *arg)
 	 * sure that does indeed hold true.
 	 */
 
-	if (!mem->is_range_manager) {
-		obj = igt_object_create(mem, &objects, size,
-					I915_BO_ALLOC_CONTIGUOUS);
-		if (!IS_ERR(obj)) {
-			pr_err("%s too large contiguous allocation was not rejected\n",
-			       __func__);
-			err = -EINVAL;
-			goto out_close;
-		}
+	obj = igt_object_create(mem, &objects, size, I915_BO_ALLOC_CONTIGUOUS);
+	if (!IS_ERR(obj)) {
+		pr_err("%s too large contiguous allocation was not rejected\n",
+		       __func__);
+		err = -EINVAL;
+		goto out_close;
 	}
 
 	obj = igt_object_create(mem, &objects, rounddown_pow_of_two(size),
@@ -442,6 +441,74 @@ static int igt_mock_splintered_region(void *arg)
 	return err;
 }
 
+#ifndef SZ_8G
+#define SZ_8G BIT_ULL(33)
+#endif
+
+static int igt_mock_max_segment(void *arg)
+{
+	const unsigned int max_segment = i915_sg_segment_size();
+	struct intel_memory_region *mem = arg;
+	struct drm_i915_private *i915 = mem->i915;
+	struct i915_ttm_buddy_resource *res;
+	struct drm_i915_gem_object *obj;
+	struct i915_buddy_block *block;
+	struct i915_buddy_mm *mm;
+	struct list_head *blocks;
+	struct scatterlist *sg;
+	LIST_HEAD(objects);
+	u64 size;
+	int err = 0;
+
+	/*
+	 * While we may create very large contiguous blocks, we may need
+	 * to break those down for consumption elsewhere. In particular,
+	 * dma-mapping with scatterlist elements have an implicit limit of
+	 * UINT_MAX on each element.
+	 */
+
+	size = SZ_8G;
+	mem = mock_region_create(i915, 0, size, PAGE_SIZE, 0);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	obj = igt_object_create(mem, &objects, size, 0);
+	if (IS_ERR(obj)) {
+		err = PTR_ERR(obj);
+		goto out_put;
+	}
+
+	res = to_ttm_buddy_resource(obj->mm.st_mm_node);
+	blocks = &res->blocks;
+	mm = res->mm;
+	size = 0;
+	list_for_each_entry(block, blocks, link) {
+		if (i915_buddy_block_size(mm, block) > size)
+			size = i915_buddy_block_size(mm, block);
+	}
+	if (size < max_segment) {
+		pr_err("%s: Failed to create a huge contiguous block [> %u], largest block %lld\n",
+		       __func__, max_segment, size);
+		err = -EINVAL;
+		goto out_close;
+	}
+
+	for (sg = obj->mm.pages->sgl; sg; sg = sg_next(sg)) {
+		if (sg->length > max_segment) {
+			pr_err("%s: Created an oversized scatterlist entry, %u > %u\n",
+			       __func__, sg->length, max_segment);
+			err = -EINVAL;
+			goto out_close;
+		}
+	}
+
+out_close:
+	close_objects(mem, &objects);
+out_put:
+	intel_memory_region_put(mem);
+	return err;
+}
+
 static int igt_gpu_write_dw(struct intel_context *ce,
 			    struct i915_vma *vma,
 			    u32 dword,
@@ -1046,6 +1113,7 @@ int intel_memory_region_mock_selftests(void)
 		SUBTEST(igt_mock_fill),
 		SUBTEST(igt_mock_contiguous),
 		SUBTEST(igt_mock_splintered_region),
+		SUBTEST(igt_mock_max_segment),
 	};
 	struct intel_memory_region *mem;
 	struct drm_i915_private *i915;
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index eafc5a04975c..d3e4e6573cb9 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -3,6 +3,7 @@
  * Copyright © 2019-2021 Intel Corporation
  */
 
+#include <drm/ttm/ttm_placement.h>
 #include <linux/scatterlist.h>
 
 #include <drm/ttm/ttm_placement.h>
@@ -25,10 +26,11 @@ static int mock_region_get_pages(struct drm_i915_gem_object *obj)
 {
 	unsigned int flags;
 	struct sg_table *pages;
+	int err;
 
 	flags = I915_ALLOC_MIN_PAGE_SIZE;
 	if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
-		flags |= I915_ALLOC_CONTIGUOUS;
+		flags |= TTM_PL_FLAG_CONTIGUOUS;
 
 	obj->mm.st_mm_node = intel_region_ttm_node_alloc(obj->mm.region,
 							 obj->base.size,
@@ -36,15 +38,20 @@ static int mock_region_get_pages(struct drm_i915_gem_object *obj)
 	if (IS_ERR(obj->mm.st_mm_node))
 		return PTR_ERR(obj->mm.st_mm_node);
 
-	pages = intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_mm_node);
+	pages = i915_sg_from_buddy_resource(obj->mm.st_mm_node,
+					    obj->mm.region->region.start);
 	if (IS_ERR(pages)) {
-		intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
-		return PTR_ERR(pages);
+		err = PTR_ERR(pages);
+		goto err_free_mm_node;
 	}
 
 	__i915_gem_object_set_pages(obj, pages, i915_sg_dma_sizes(pages->sgl));
 
 	return 0;
+
+err_free_mm_node:
+	intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
+	return err;
 }
 
 static const struct drm_i915_gem_object_ops mock_region_obj_ops = {
-- 
2.26.3

