Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3212C655A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028666ED13;
	Fri, 27 Nov 2020 12:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303FE6ED0F;
 Fri, 27 Nov 2020 12:11:42 +0000 (UTC)
IronPort-SDR: bWVb5JXACm193dcbiP6a71on6FqRN9mV6oYkXQTpKdqIW5o+ApNOjcPKVJQmHmmJX0nyoqzrTm
 gq0v/KANzcDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092928"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092928"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:41 -0800
IronPort-SDR: bfWUcnsbeXqBMKuAcq7nqUWtilPe552brP3AyVorGm38RqgIX/S6iyWKg6h1AG/Soqv0K7Gqdh
 han/ymOpUiLw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029856"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:40 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 130/162] drm/i915/dg1: Eviction logic
Date: Fri, 27 Nov 2020 12:06:46 +0000
Message-Id: <20201127120718.454037-131-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

When an object is pinning, get_pages() is called to allocate memory
on a region, if memory pages are not availabe, the region eviction
is triggered to find other objects on the same region to be evicted,
the selected object is passed to put_pages() call to free the
memory pages, before freeing the pages, whether to swap out first
to system memory depends on if object is marked as WILLNEED.

After swapped-out, the object is treated as if it does not have any
page allocated for it.

Similarly, when an object is pinning, memory pages are allocated from
a region, then the object is checked if it had been swapped out before,
if yes, swap-in the pages contents into the allocated memory pages.

For this initial swapping code, i915_gem_object_memcpy() is used to
copy pages.

Signed-off-by: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_region.c    | 139 +++++++++++++++++-
 drivers/gpu/drm/i915/intel_memory_region.c    |   6 +
 6 files changed, 162 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 65690e3bf648..7cb5f137522f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -178,6 +178,8 @@ static void __i915_gem_free_object_rcu(struct rcu_head *head)
 		container_of(head, typeof(*obj), rcu);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
+	/* Reset shared reservation object */
+	obj->base.resv = &obj->base._resv;
 	dma_resv_fini(&obj->base._resv);
 	i915_gem_object_free(obj);
 
@@ -185,7 +187,7 @@ static void __i915_gem_free_object_rcu(struct rcu_head *head)
 	atomic_dec(&i915->mm.free_count);
 }
 
-static void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj)
+void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj)
 {
 	/* Skip serialisation and waking the device if known to be not used. */
 
@@ -287,6 +289,14 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 
 	GEM_BUG_ON(i915_gem_object_is_framebuffer(obj));
 
+	/*
+	 * If object had been swapped out, free the hidden object.
+	 */
+	if (obj->swapto) {
+		i915_gem_object_put(obj->swapto);
+		obj->swapto = NULL;
+	}
+
 	/*
 	 * Before we free the object, make sure any pure RCU-only
 	 * read-side critical sections are complete, e.g.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 175258106642..ee1914ed2070 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -366,6 +366,8 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj);
 int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj);
 
+void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj);
+
 static inline int __must_check
 i915_gem_object_pin_pages(struct drm_i915_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 517a606ade8d..e9f42d3137b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -316,6 +316,12 @@ struct drm_i915_gem_object {
 
 		void *gvt_info;
 	};
+
+	/**
+	 * object to swap-to if non-null.
+	 */
+	bool do_swapping;
+	struct drm_i915_gem_object *swapto;
 };
 
 static inline struct drm_i915_gem_object *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 2cdb7cf63383..d0f3da0925f5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -231,7 +231,6 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 	}
 
 	__i915_gem_object_reset_page_iter(obj);
-	obj->mm.page_sizes.phys = obj->mm.page_sizes.sg = 0;
 
 	return pages;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index e497ff374b13..a437538cd872 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -7,11 +7,135 @@
 #include "i915_gem_region.h"
 #include "i915_drv.h"
 #include "i915_trace.h"
+#include "i915_gem_mman.h"
+
+static int
+i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
+			      struct sg_table *pages, unsigned int sizes)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_gem_object *dst, *src;
+	int err;
+
+	GEM_BUG_ON(obj->swapto);
+	GEM_BUG_ON(i915_gem_object_has_pages(obj));
+	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
+	GEM_BUG_ON(obj->mm.region->type != INTEL_MEMORY_LOCAL);
+
+	assert_object_held(obj);
+
+	/* create a shadow object on smem region */
+	dst = i915_gem_object_create_shmem(i915, obj->base.size);
+	if (IS_ERR(dst))
+		return PTR_ERR(dst);
+
+	/* Share the dma-resv between the shadow- and the parent object */
+	dst->base.resv = obj->base.resv;
+	assert_object_held(dst);
+
+	/*
+	 * create working object on the same region as 'obj',
+	 * if 'obj' is used directly, it is set pages and is pinned
+	 * again, other thread may wrongly use 'obj' pages.
+	 */
+	src = i915_gem_object_create_region(obj->mm.region,
+					    obj->base.size, 0);
+	if (IS_ERR(src)) {
+		i915_gem_object_put(dst);
+		return PTR_ERR(src);
+	}
+
+	/* set and pin working object pages */
+	i915_gem_object_lock_isolated(src);
+	__i915_gem_object_set_pages(src, pages, sizes);
+	__i915_gem_object_pin_pages(src);
+
+	/* copying the pages */
+	err = i915_gem_object_memcpy(dst, src);
+
+	__i915_gem_object_unpin_pages(src);
+	__i915_gem_object_unset_pages(src);
+	i915_gem_object_unlock(src);
+	i915_gem_object_put(src);
+
+	if (!err)
+		obj->swapto = dst;
+	else
+		i915_gem_object_put(dst);
+
+	return err;
+}
+
+static int
+i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
+			     struct sg_table *pages, unsigned int sizes)
+{
+	struct drm_i915_gem_object *dst, *src;
+	int err;
+
+	GEM_BUG_ON(!obj->swapto);
+	GEM_BUG_ON(i915_gem_object_has_pages(obj));
+	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
+	GEM_BUG_ON(obj->mm.region->type != INTEL_MEMORY_LOCAL);
+
+	assert_object_held(obj);
+
+	src = obj->swapto;
+
+	/*
+	 * create working object on the same region as 'obj',
+	 * if 'obj' is used directly, it is set pages and is pinned
+	 * again, other thread may wrongly use 'obj' pages.
+	 */
+	dst = i915_gem_object_create_region(obj->mm.region,
+					    obj->base.size, 0);
+	if (IS_ERR(dst)) {
+		err = PTR_ERR(dst);
+		return err;
+	}
+
+	/* @scr is sharing @obj's reservation object */
+	assert_object_held(src);
+
+	/* set and pin working object pages */
+	i915_gem_object_lock_isolated(dst);
+	__i915_gem_object_set_pages(dst, pages, sizes);
+	__i915_gem_object_pin_pages(dst);
+
+	/* copying the pages */
+	err = i915_gem_object_memcpy(dst, src);
+
+	__i915_gem_object_unpin_pages(dst);
+	__i915_gem_object_unset_pages(dst);
+	i915_gem_object_unlock(dst);
+	i915_gem_object_put(dst);
+
+	if (!err) {
+		obj->swapto = NULL;
+		i915_gem_object_put(src);
+	}
+
+	return err;
+}
 
 void
 i915_gem_object_put_pages_buddy(struct drm_i915_gem_object *obj,
 				struct sg_table *pages)
 {
+	/* if need to save the page contents, swap them out */
+	if (obj->do_swapping) {
+		unsigned int sizes = obj->mm.page_sizes.phys;
+
+		GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
+		GEM_BUG_ON(i915_gem_object_is_volatile(obj));
+
+		if (i915_gem_object_swapout_pages(obj, pages, sizes)) {
+			/* swapout failed, keep the pages */
+			__i915_gem_object_set_pages(obj, pages, sizes);
+			return;
+		}
+	}
+
 	__intel_memory_region_put_pages_buddy(obj->mm.region, &obj->mm.blocks);
 
 	obj->mm.dirty = false;
@@ -95,8 +219,19 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 	sg_mark_end(sg);
 	i915_sg_trim(st);
 
-	/* Intended for kernel internal use only */
-	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
+	/* if we saved the page contents, swap them in */
+	if (obj->swapto) {
+		GEM_BUG_ON(i915_gem_object_is_volatile(obj));
+
+		ret = i915_gem_object_swapin_pages(obj, st,
+						   sg_page_sizes);
+		if (ret) {
+			/* swapin failed, free the pages */
+			__intel_memory_region_put_pages_buddy(mem, blocks);
+			ret = -ENXIO;
+			goto err_free_sg;
+		}
+	} else if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
 		struct scatterlist *sg;
 		unsigned long i;
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 185eab497803..afcd6fe6eaff 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -147,6 +147,11 @@ static int intel_memory_region_evict(struct intel_memory_region *mem,
 
 		mutex_unlock(&mem->objects.lock);
 
+		/* tell callee to do swapping */
+		if (i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM)
+		    && pass == 1)
+			obj->do_swapping = true;
+
 		if (!i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE)) {
 			if (i915_gem_object_trylock(obj)) {
 				__i915_gem_object_put_pages(obj);
@@ -160,6 +165,7 @@ static int intel_memory_region_evict(struct intel_memory_region *mem,
 			}
 		}
 
+		obj->do_swapping = false;
 		i915_gem_object_put(obj);
 		mutex_lock(&mem->objects.lock);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
