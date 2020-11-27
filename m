Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64C2C64EE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7ED6EC9F;
	Fri, 27 Nov 2020 12:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4E96ECA3;
 Fri, 27 Nov 2020 12:10:04 +0000 (UTC)
IronPort-SDR: wVVf/KdQiAQ6CCv5nyMKskDGflXvTtlTezNY9mgmvt+qnBn9SikoNLgr0D56s6AFmFITq3ohv/
 NE/uTKnK5dhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540755"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540755"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:04 -0800
IronPort-SDR: Kq+jI+VBK+EOLqtHxM9rSe6KWlG/ixHoaSYAQmYv/gOTYuBpcKhXijkTP7gKG2NSMjjSNpcFM4
 hnN+NuslMiTw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029202"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:02 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 085/162] drm/i915/region: support basic eviction
Date: Fri, 27 Nov 2020 12:06:01 +0000
Message-Id: <20201127120718.454037-86-matthew.auld@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support basic eviction for regions.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 59 ++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.h  |  4 +
 drivers/gpu/drm/i915/i915_gem.c               | 17 +++++
 drivers/gpu/drm/i915/intel_memory_region.c    | 24 +++++-
 .../drm/i915/selftests/intel_memory_region.c  | 76 +++++++++++++++++++
 6 files changed, 178 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index b172e8cc53ab..6d101275bc9d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -226,6 +226,7 @@ struct drm_i915_gem_object {
 		 * region->obj_lock.
 		 */
 		struct list_head region_link;
+		struct list_head tmp_link;
 
 		struct sg_table *pages;
 		void *mapping;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index e42192834c88..4d346df8fd5b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -16,6 +16,7 @@
 #include "gt/intel_gt_requests.h"
 
 #include "i915_trace.h"
+#include "gt/intel_gt_requests.h"
 
 static bool swap_available(void)
 {
@@ -271,6 +272,64 @@ unsigned long i915_gem_shrink_all(struct drm_i915_private *i915)
 	return freed;
 }
 
+int i915_gem_shrink_memory_region(struct intel_memory_region *mem,
+				  resource_size_t target)
+{
+	struct drm_i915_private *i915 = mem->i915;
+	struct drm_i915_gem_object *obj;
+	resource_size_t purged;
+	LIST_HEAD(purgeable);
+	int err = -ENOSPC;
+
+	intel_gt_retire_requests(&i915->gt);
+
+	purged = 0;
+
+	mutex_lock(&mem->objects.lock);
+
+	while ((obj = list_first_entry_or_null(&mem->objects.purgeable,
+					       typeof(*obj),
+					       mm.region_link))) {
+		list_move_tail(&obj->mm.region_link, &purgeable);
+
+		if (!i915_gem_object_has_pages(obj))
+			continue;
+
+		if (i915_gem_object_is_framebuffer(obj))
+			continue;
+
+		if (!kref_get_unless_zero(&obj->base.refcount))
+			continue;
+
+		mutex_unlock(&mem->objects.lock);
+
+		if (!i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE)) {
+			if (i915_gem_object_trylock(obj)) {
+				__i915_gem_object_put_pages(obj);
+				if (!i915_gem_object_has_pages(obj)) {
+					purged += obj->base.size;
+					if (!i915_gem_object_is_volatile(obj))
+						obj->mm.madv = __I915_MADV_PURGED;
+				}
+				i915_gem_object_unlock(obj);
+			}
+		}
+
+		i915_gem_object_put(obj);
+
+		mutex_lock(&mem->objects.lock);
+
+		if (purged >= target) {
+			err = 0;
+			break;
+		}
+	}
+
+	list_splice_tail(&purgeable, &mem->objects.purgeable);
+	mutex_unlock(&mem->objects.lock);
+	return err;
+}
+
 static unsigned long
 i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
index 8512470f6fd6..c945f3b587d6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
@@ -7,10 +7,12 @@
 #define __I915_GEM_SHRINKER_H__
 
 #include <linux/bits.h>
+#include <linux/types.h>
 
 struct drm_i915_private;
 struct i915_gem_ww_ctx;
 struct mutex;
+struct intel_memory_region;
 
 /* i915_gem_shrinker.c */
 unsigned long i915_gem_shrink(struct i915_gem_ww_ctx *ww,
@@ -29,5 +31,7 @@ void i915_gem_driver_register__shrinker(struct drm_i915_private *i915);
 void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915);
 void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
 				    struct mutex *mutex);
+int i915_gem_shrink_memory_region(struct intel_memory_region *mem,
+				  resource_size_t target);
 
 #endif /* __I915_GEM_SHRINKER_H__ */
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 2662d679db6e..ef2124c17a7f 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1104,6 +1104,23 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 	    !i915_gem_object_has_pages(obj))
 		i915_gem_object_truncate(obj);
 
+	if (obj->mm.region && i915_gem_object_has_pages(obj)) {
+		mutex_lock(&obj->mm.region->objects.lock);
+
+		switch (obj->mm.madv) {
+		case I915_MADV_WILLNEED:
+			list_move(&obj->mm.region_link,
+				  &obj->mm.region->objects.list);
+			break;
+		default:
+			list_move(&obj->mm.region_link,
+				  &obj->mm.region->objects.purgeable);
+			break;
+		}
+
+		mutex_unlock(&obj->mm.region->objects.lock);
+	}
+
 	args->retained = obj->mm.madv != __I915_MADV_PURGED;
 
 	i915_gem_object_unlock(obj);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index b326993a1026..308f89b87834 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -97,7 +97,8 @@ __intel_memory_region_get_pages_buddy(struct intel_memory_region *mem,
 	do {
 		struct i915_buddy_block *block;
 		unsigned int order;
-
+		bool retry = true;
+retry:
 		order = fls(n_pages) - 1;
 		GEM_BUG_ON(order > mem->mm.max_order);
 		GEM_BUG_ON(order < min_order);
@@ -107,8 +108,25 @@ __intel_memory_region_get_pages_buddy(struct intel_memory_region *mem,
 			if (!IS_ERR(block))
 				break;
 
-			if (order-- == min_order)
-				goto err_free_blocks;
+			if (order-- == min_order) {
+				resource_size_t target;
+				int err;
+
+				if (!retry)
+					goto err_free_blocks;
+
+				target = n_pages * mem->mm.chunk_size;
+
+				mutex_unlock(&mem->mm_lock);
+				err = i915_gem_shrink_memory_region(mem,
+								    target);
+				mutex_lock(&mem->mm_lock);
+				if (err)
+					goto err_free_blocks;
+
+				retry = false;
+				goto retry;
+			}
 		} while (1);
 
 		n_pages -= BIT(order);
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 9c20b7065fc5..84525ddba321 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -848,12 +848,88 @@ static int perf_memcpy(void *arg)
 	return 0;
 }
 
+static void igt_mark_evictable(struct drm_i915_gem_object *obj)
+{
+	i915_gem_object_unpin_pages(obj);
+	obj->mm.madv = I915_MADV_DONTNEED;
+	list_move(&obj->mm.region_link, &obj->mm.region->objects.purgeable);
+}
+
+static int igt_mock_shrink(void *arg)
+{
+	struct intel_memory_region *mem = arg;
+	struct drm_i915_gem_object *obj;
+	unsigned long n_objects;
+	LIST_HEAD(objects);
+	resource_size_t target;
+	resource_size_t total;
+	int err = 0;
+
+	target = mem->mm.chunk_size;
+	total = resource_size(&mem->region);
+	n_objects = total / target;
+
+	while (n_objects--) {
+		obj = i915_gem_object_create_region(mem,
+						    target,
+						    0);
+		if (IS_ERR(obj)) {
+			err = PTR_ERR(obj);
+			goto err_close_objects;
+		}
+
+		list_add(&obj->st_link, &objects);
+
+		err = i915_gem_object_pin_pages(obj);
+		if (err)
+			goto err_close_objects;
+
+		/*
+		 * Make half of the region evictable, though do so in a
+		 * horribly fragmented fashion.
+		 */
+		if (n_objects % 2)
+			igt_mark_evictable(obj);
+	}
+
+	while (target <= total / 2) {
+		obj = i915_gem_object_create_region(mem, target, 0);
+		if (IS_ERR(obj)) {
+			err = PTR_ERR(obj);
+			goto err_close_objects;
+		}
+
+		list_add(&obj->st_link, &objects);
+
+		/* Provoke the shrinker to start violently swinging its axe! */
+		err = i915_gem_object_pin_pages(obj);
+		if (err) {
+			pr_err("failed to shrink for target=%pa", &target);
+			goto err_close_objects;
+		}
+
+		/* Again, half of the region should remain evictable */
+		igt_mark_evictable(obj);
+
+		target <<= 1;
+	}
+
+err_close_objects:
+	close_objects(mem, &objects);
+
+	if (err == -ENOMEM)
+		err = 0;
+
+	return err;
+}
+
 int intel_memory_region_mock_selftests(void)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_mock_fill),
 		SUBTEST(igt_mock_contiguous),
 		SUBTEST(igt_mock_splintered_region),
+		SUBTEST(igt_mock_shrink),
 	};
 	struct intel_memory_region *mem;
 	struct drm_i915_private *i915;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
