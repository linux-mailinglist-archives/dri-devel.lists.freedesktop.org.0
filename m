Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D933873FC
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18E988E88;
	Tue, 18 May 2021 08:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76926EAD4;
 Tue, 18 May 2021 08:28:09 +0000 (UTC)
IronPort-SDR: PM6RYaRGd+3kLHoiHp0JkvfNmgx+nvmu379fZrUlVcPqgQaww2V4vKzGDX/+HzetSY1yyRmut+
 8e5y995zpSqw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197572795"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="197572795"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:28:09 -0700
IronPort-SDR: JZs1a3gubOHpXLxj42Avuk/K8216PGldhhjXsr0DNbcaJrG55LLQy4/e09Any8GnnWwmCV7+Wp
 9T0wr3p2FvYw==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="611892412"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/15] drm/i915/ttm: Add io sgt caching to
 i915_ttm_io_mem_pfn
Date: Tue, 18 May 2021 10:27:01 +0200
Message-Id: <20210518082701.997251-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Instead of walking the sg table manually, use our caching helpers
to do the sgt caching. To prevent lifetime issues of ttm_bo vs
i915_gem_object, we will use a separate member, instead of re-using
the dma page member.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  6 +--
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 46 ++++++++++---------
 4 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index a3ad8cf4eefd..ff59e6c640e6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -342,14 +342,14 @@ struct scatterlist *
 __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
-			 unsigned int *offset, bool allow_alloc);
+			 unsigned int *offset, bool allow_alloc, bool dma);
 
 static inline struct scatterlist *
 i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 		       unsigned int n,
 		       unsigned int *offset, bool allow_alloc)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc, false);
 }
 
 static inline struct scatterlist *
@@ -357,7 +357,7 @@ i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
 			   unsigned int n,
 			   unsigned int *offset, bool allow_alloc)
 {
-	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc);
+	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc, true);
 }
 
 struct page *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 31d828e91cf4..828310802b9f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -324,6 +324,7 @@ struct drm_i915_gem_object {
 
 	struct {
 		struct sg_table *cached_io_st;
+		struct i915_gem_object_page_iter get_io_page;
 	} ttm;
 
 	/** Record of address bit 17 of each page at last unbind. */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 62ee2185a41b..577352b4f2f6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -465,9 +465,8 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
 			 struct i915_gem_object_page_iter *iter,
 			 unsigned int n,
 			 unsigned int *offset,
-			 bool allow_alloc)
+			 bool allow_alloc, bool dma)
 {
-	const bool dma = iter == &obj->mm.get_dma_page;
 	struct scatterlist *sg;
 	unsigned int idx, count;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index fe9ac50b2470..1eaefb89e859 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -167,11 +167,20 @@ static int i915_ttm_move_notify(struct ttm_buffer_object *bo)
 
 static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
 {
-	if (obj->ttm.cached_io_st) {
-		sg_free_table(obj->ttm.cached_io_st);
-		kfree(obj->ttm.cached_io_st);
-		obj->ttm.cached_io_st = NULL;
-	}
+	struct radix_tree_iter iter;
+	void __rcu **slot;
+
+	if (!obj->ttm.cached_io_st)
+		return;
+
+	rcu_read_lock();
+	radix_tree_for_each_slot(slot, &obj->ttm.get_io_page.radix, &iter, 0)
+		radix_tree_delete(&obj->ttm.get_io_page.radix, iter.index);
+	rcu_read_unlock();
+
+	sg_free_table(obj->ttm.cached_io_st);
+	kfree(obj->ttm.cached_io_st);
+	obj->ttm.cached_io_st = NULL;
 }
 
 static void i915_ttm_purge(struct drm_i915_gem_object *obj)
@@ -340,8 +349,11 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	i915_ttm_move_memcpy(bo, new_mem, new_iter, old_iter);
 	i915_ttm_free_cached_io_st(obj);
 
-	if (!new_man->use_tt)
+	if (!new_man->use_tt) {
 		obj->ttm.cached_io_st = new_st;
+		obj->ttm.get_io_page.sg_pos = new_st->sgl;
+		obj->ttm.get_io_page.sg_idx = 0;
+	}
 
 	return 0;
 }
@@ -362,26 +374,15 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 					 unsigned long page_offset)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
-	struct sg_table *sgt = obj->ttm.cached_io_st;
+	unsigned long base = obj->mm.region->iomap.base - obj->mm.region->region.start;
 	struct scatterlist *sg;
-	unsigned int i;
+	unsigned int ofs;
 
 	GEM_WARN_ON(bo->ttm);
 
-	for_each_sgtable_dma_sg(sgt, sg, i) {
-		unsigned long sg_max = sg->length >> PAGE_SHIFT;
+	sg = __i915_gem_object_get_sg(obj, &obj->ttm.get_io_page, page_offset, &ofs, true, true);
 
-		if (page_offset < sg_max) {
-			unsigned long base =
-				obj->mm.region->iomap.base - obj->mm.region->region.start;
-
-			return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + page_offset;
-		}
-
-		page_offset -= sg_max;
-	}
-	GEM_BUG_ON(1);
-	return 0;
+	return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
 }
 
 struct ttm_device_funcs i915_ttm_bo_driver = {
@@ -613,6 +614,9 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
 	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
 
+	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
+	mutex_init(&obj->ttm.get_io_page.lock);
+
 	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
 			  ttm_bo_type_kernel, &i915_sys_placement, alignment,
 			  true, NULL, NULL, i915_ttm_bo_destroy);
-- 
2.31.1

