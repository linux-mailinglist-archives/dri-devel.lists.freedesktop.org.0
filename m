Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D214D2C64F1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F0E6ECAC;
	Fri, 27 Nov 2020 12:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C526ECAC;
 Fri, 27 Nov 2020 12:10:10 +0000 (UTC)
IronPort-SDR: b4ESUb2iD8dMDG4UPqiOWOuGElVRykoE5LujW0OX1E0K3glA50prNWPY/tTpELxsyHyI7u5KL9
 gcnpcNOyuPmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540777"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540777"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:10 -0800
IronPort-SDR: AK0KaPDz9Qc5Zna0Eube34T2XQMn9LlMMcJ/yn90vyH/mv7ATP1DIjyXQ88a0ApQZUhmRgvI2Z
 oK/x3obFvTxQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029260"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:07 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 088/162] drm/i915: support basic object migration
Date: Fri, 27 Nov 2020 12:06:04 +0000
Message-Id: <20201127120718.454037-89-matthew.auld@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>,
 dri-devel@lists.freedesktop.org, CQ Tang <cq.tang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are going want to able to move objects between different regions
like system memory and local memory. In the future everything should
be just another region.

Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  13 ++
 drivers/gpu/drm/i915/gem/i915_gem_mman.h      |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 125 +++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  | 174 +++++++++++++++++-
 6 files changed, 322 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 2561a2f1e54f..4e8a05c35252 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -546,6 +546,19 @@ void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj)
 	spin_unlock(&obj->mmo.lock);
 }
 
+/**
+ * i915_gem_object_release_mmap - remove physical page mappings
+ * @obj: obj in question
+ *
+ * Preserve the reservation of the mmapping with the DRM core code, but
+ * relinquish ownership of the pages back to the system.
+ */
+void i915_gem_object_release_mmap(struct drm_i915_gem_object *obj)
+{
+	i915_gem_object_release_mmap_gtt(obj);
+	i915_gem_object_release_mmap_offset(obj);
+}
+
 static struct i915_mmap_offset *
 lookup_mmo(struct drm_i915_gem_object *obj,
 	   enum i915_mmap_type mmap_type)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index efee9e0d2508..7c5ccdf59359 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -24,6 +24,8 @@ int i915_gem_dumb_mmap_offset(struct drm_file *file_priv,
 			      struct drm_device *dev,
 			      u32 handle, u64 *offset);
 
+void i915_gem_object_release_mmap(struct drm_i915_gem_object *obj);
+
 void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 5326b4b5a9f7..7ff430503497 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -26,11 +26,14 @@
 
 #include "display/intel_frontbuffer.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_requests.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
 #include "i915_gem_mman.h"
 #include "i915_gem_object.h"
+#include "i915_gem_object_blt.h"
+#include "i915_gem_region.h"
 #include "i915_globals.h"
 #include "i915_trace.h"
 
@@ -311,6 +314,128 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 		queue_work(i915->wq, &i915->mm.free_work);
 }
 
+int i915_gem_object_prepare_move(struct drm_i915_gem_object *obj)
+{
+	int err;
+
+	assert_object_held(obj);
+
+	if (obj->mm.madv != I915_MADV_WILLNEED)
+		return -EINVAL;
+
+	if (i915_gem_object_needs_bit17_swizzle(obj))
+		return -EINVAL;
+
+	if (i915_gem_object_is_framebuffer(obj))
+		return -EBUSY;
+
+	i915_gem_object_release_mmap(obj);
+
+	GEM_BUG_ON(obj->mm.mapping);
+	GEM_BUG_ON(obj->base.filp && mapping_mapped(obj->base.filp->f_mapping));
+
+	err = i915_gem_object_wait(obj,
+				   I915_WAIT_INTERRUPTIBLE |
+				   I915_WAIT_ALL,
+				   MAX_SCHEDULE_TIMEOUT);
+	if (err)
+		return err;
+
+	return i915_gem_object_unbind(obj,
+				      I915_GEM_OBJECT_UNBIND_ACTIVE);
+}
+
+int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
+			    struct i915_gem_ww_ctx *ww,
+			    struct intel_context *ce,
+			    enum intel_region_id id)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_gem_object *donor;
+	struct intel_memory_region *mem;
+	struct sg_table *pages = NULL;
+	unsigned int page_sizes;
+	int err = 0;
+
+	assert_object_held(obj);
+	GEM_BUG_ON(id >= INTEL_REGION_UNKNOWN);
+	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
+	if (obj->mm.region->id == id)
+		return 0;
+
+	mem = i915->mm.regions[id];
+
+	donor = i915_gem_object_create_region(mem, obj->base.size, 0);
+	if (IS_ERR(donor)) {
+		err = PTR_ERR(donor);
+		return err;
+	}
+
+	err = i915_gem_object_lock(donor, ww);
+	if (err)
+		goto err_put_donor;
+
+	/* Copy backing-pages if we have to */
+	if (i915_gem_object_has_pages(obj) ||
+	    obj->base.filp) {
+		err = i915_gem_object_ww_copy_blt(obj, donor, ww, ce);
+		if (err)
+			goto unlock_donor;
+	}
+
+	err = i915_gem_object_set_to_cpu_domain(donor, false);
+	if (err)
+		goto unlock_donor;
+
+	intel_gt_retire_requests(&i915->gt);
+
+	i915_gem_object_unbind(donor, 0);
+	err = i915_gem_object_unbind(obj, 0);
+	if (err)
+		goto unlock_donor;
+
+	pages = __i915_gem_object_unset_pages(obj);
+	if (pages)
+		obj->ops->put_pages(obj, pages);
+
+	page_sizes = donor->mm.page_sizes.phys;
+	pages = __i915_gem_object_unset_pages(donor);
+
+	if (obj->ops->release)
+		obj->ops->release(obj);
+
+	/* We need still need a little special casing for shmem */
+	if (obj->base.filp)
+		fput(fetch_and_zero(&obj->base.filp));
+	else if (donor->base.filp) {
+		atomic_long_inc(&donor->base.filp->f_count);
+		obj->base.filp = donor->base.filp;
+	}
+
+	obj->base.size = donor->base.size;
+	obj->mm.region = intel_memory_region_get(mem);
+	obj->flags = donor->flags;
+	obj->ops = donor->ops;
+	obj->cache_level = donor->cache_level;
+	obj->cache_coherent = donor->cache_coherent;
+	obj->cache_dirty = donor->cache_dirty;
+
+	list_replace_init(&donor->mm.blocks, &obj->mm.blocks);
+
+	/* set pages after migrated */
+	if (pages)
+		__i915_gem_object_set_pages(obj, pages, page_sizes);
+
+	GEM_BUG_ON(i915_gem_object_has_pages(donor));
+	GEM_BUG_ON(i915_gem_object_has_pinned_pages(donor));
+unlock_donor:
+	i915_gem_ww_unlock_single(donor);
+err_put_donor:
+	i915_gem_object_put(donor);
+
+	return err;
+}
+
 static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
 	return !(obj->cache_level == I915_CACHE_NONE ||
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index c6c7ab181a65..1a1aa71a4494 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -51,8 +51,17 @@ void i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 				    struct sg_table *pages);
 
 
+enum intel_region_id;
+int i915_gem_object_prepare_move(struct drm_i915_gem_object *obj);
+int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
+			    struct i915_gem_ww_ctx *ww,
+			    struct intel_context *ce,
+			    enum intel_region_id id);
+
 void i915_gem_flush_free_objects(struct drm_i915_private *i915);
 
+void __i915_gem_object_reset_page_iter(struct drm_i915_gem_object *obj);
+
 struct sg_table *
 __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj);
 void i915_gem_object_truncate(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index eacad971b955..2cdb7cf63383 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -183,7 +183,7 @@ void i915_gem_object_writeback(struct drm_i915_gem_object *obj)
 		obj->ops->writeback(obj);
 }
 
-static void __i915_gem_object_reset_page_iter(struct drm_i915_gem_object *obj)
+void __i915_gem_object_reset_page_iter(struct drm_i915_gem_object *obj)
 {
 	struct radix_tree_iter iter;
 	void __rcu **slot;
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 84525ddba321..7acb94e0e5fe 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -14,6 +14,7 @@
 
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_lmem.h"
+#include "gem/i915_gem_object_blt.h"
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_object_blt.h"
 #include "gem/selftests/igt_gem_utils.h"
@@ -476,6 +477,71 @@ static int igt_lmem_create(void *arg)
 	return err;
 }
 
+static int igt_smem_create_migrate(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_context *ce = i915->gt.engine[BCS0]->kernel_context;
+	struct drm_i915_gem_object *obj;
+	struct i915_gem_ww_ctx ww;
+	int err = 0;
+
+	/* Switch object backing-store on create */
+	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (err)
+			continue;
+
+		err = i915_gem_object_migrate(obj, &ww, ce, INTEL_REGION_SMEM);
+		if (err)
+			continue;
+
+		err = i915_gem_object_pin_pages(obj);
+		if (err)
+			continue;
+
+		i915_gem_object_unpin_pages(obj);
+	}
+	i915_gem_object_put(obj);
+
+	return err;
+}
+
+static int igt_lmem_create_migrate(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_context *ce = i915->gt.engine[BCS0]->kernel_context;
+	struct drm_i915_gem_object *obj;
+	struct i915_gem_ww_ctx ww;
+	int err = 0;
+
+	/* Switch object backing-store on create */
+	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (err)
+			continue;
+
+		err = i915_gem_object_migrate(obj, &ww, ce, INTEL_REGION_LMEM);
+		if (err)
+			continue;
+
+		err = i915_gem_object_pin_pages(obj);
+		if (err)
+			continue;
+
+		i915_gem_object_unpin_pages(obj);
+	}
+	i915_gem_object_put(obj);
+
+	return err;
+}
 static int igt_lmem_write_gpu(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -880,7 +946,7 @@ static int igt_mock_shrink(void *arg)
 
 		list_add(&obj->st_link, &objects);
 
-		err = i915_gem_object_pin_pages(obj);
+		err = i915_gem_object_pin_pages_unlocked(obj);
 		if (err)
 			goto err_close_objects;
 
@@ -902,7 +968,7 @@ static int igt_mock_shrink(void *arg)
 		list_add(&obj->st_link, &objects);
 
 		/* Provoke the shrinker to start violently swinging its axe! */
-		err = i915_gem_object_pin_pages(obj);
+		err = i915_gem_object_pin_pages_unlocked(obj);
 		if (err) {
 			pr_err("failed to shrink for target=%pa", &target);
 			goto err_close_objects;
@@ -923,6 +989,107 @@ static int igt_mock_shrink(void *arg)
 	return err;
 }
 
+static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
+				  struct intel_context *ce,
+				  struct drm_i915_gem_object *obj)
+{
+	int err;
+
+	err = i915_gem_object_lock(obj, ww);
+	if (err)
+		return err;
+
+	err = i915_gem_object_wait(obj,
+				   I915_WAIT_INTERRUPTIBLE |
+				   I915_WAIT_PRIORITY |
+				   I915_WAIT_ALL,
+				   MAX_SCHEDULE_TIMEOUT);
+	if (err)
+		return err;
+
+	err = i915_gem_object_prepare_move(obj);
+	if (err)
+		return err;
+
+	if (i915_gem_object_is_lmem(obj)) {
+		err = i915_gem_object_migrate(obj, ww, ce, INTEL_REGION_SMEM);
+		if (err)
+			return err;
+
+		if (i915_gem_object_is_lmem(obj)) {
+			pr_err("object still backed by lmem\n");
+			err = -EINVAL;
+		}
+
+		if (!list_empty(&obj->mm.blocks)) {
+			pr_err("object leaking memory region\n");
+			err = -EINVAL;
+		}
+
+		if (!i915_gem_object_has_struct_page(obj)) {
+			pr_err("object not backed by struct page\n");
+			err = -EINVAL;
+		}
+
+	} else {
+		err = i915_gem_object_migrate(obj, ww, ce, INTEL_REGION_LMEM);
+		if (err)
+			return err;
+
+		if (i915_gem_object_has_struct_page(obj)) {
+			pr_err("object still backed by struct page\n");
+			err = -EINVAL;
+		}
+
+		if (!i915_gem_object_is_lmem(obj)) {
+			pr_err("object not backed by lmem\n");
+			err = -EINVAL;
+		}
+	}
+
+	return err;
+}
+
+static int igt_lmem_pages_migrate(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct drm_i915_gem_object *obj;
+	struct intel_context *ce;
+	struct i915_gem_ww_ctx ww;
+	int err;
+	int i;
+
+	if (!HAS_ENGINE(&i915->gt, BCS0))
+		return 0;
+
+	ce = i915->gt.engine[BCS0]->kernel_context;
+
+	/* From LMEM to shmem and back again */
+
+	obj = i915_gem_object_create_lmem(i915, SZ_2M, 0);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	err = i915_gem_object_fill_blt(obj, ce, 0);
+	if (err)
+		goto out_put;
+
+	for (i = 1; i <= 4; ++i) {
+		for_i915_gem_ww(&ww, err, true)
+			err = lmem_pages_migrate_one(&ww, ce, obj);
+		if (err)
+			break;
+
+		err = i915_gem_object_fill_blt(obj, ce, 0xdeadbeaf);
+		if (err)
+			break;
+	}
+out_put:
+	i915_gem_object_put(obj);
+
+	return err;
+}
+
 int intel_memory_region_mock_selftests(void)
 {
 	static const struct i915_subtest tests[] = {
@@ -960,6 +1127,9 @@ int intel_memory_region_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_lmem_create),
 		SUBTEST(igt_lmem_write_cpu),
 		SUBTEST(igt_lmem_write_gpu),
+		SUBTEST(igt_smem_create_migrate),
+		SUBTEST(igt_lmem_create_migrate),
+		SUBTEST(igt_lmem_pages_migrate),
 	};
 
 	if (!HAS_LMEM(i915)) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
