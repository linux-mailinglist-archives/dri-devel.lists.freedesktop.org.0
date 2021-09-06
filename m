Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B3401ECE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 18:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E5A89BEC;
	Mon,  6 Sep 2021 16:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FDA89BD2;
 Mon,  6 Sep 2021 16:55:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219697389"
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="219697389"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 09:55:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="579695104"
Received: from mkrygin-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.45])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 09:55:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 6/6] drm/i915: Reduce the number of objects subject to
 memcpy recover
Date: Mon,  6 Sep 2021 18:55:14 +0200
Message-Id: <20210906165515.450541-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
References: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
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

We really only need memcpy restore for objects that affect the
operability of the migrate context. That is, primarily the page-table
objects of the migrate VM.

Add an object flag, I915_BO_ALLOC_PM_EARLY for objects that need early
restores using memcpy and a way to assign LMEM page-table object flags
to be used by the vms.

Restore objects without this flag with the gpu blitter and only objects
carrying the flag using TTM memcpy.

Initially mark the migrate, gt, gtt and vgpu vms to use this flag, and
defer for a later audit which vms actually need it. Most importantly, user-
allocated vms with pinned page-table objects can be restored using the
blitter.

Performance-wise memcpy restore is probably as fast as gpu restore if not
faster, but using gpu restore will help tackling future restrictions in
mappable LMEM size.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c      |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  9 ++++++---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c           |  6 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c       |  6 ++++--
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c  |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c             |  2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c             |  5 +++--
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h             |  4 +++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c             |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c               |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c              |  3 ++-
 drivers/gpu/drm/i915/gt/intel_gtt.h              |  9 +++++++--
 drivers/gpu/drm/i915/gt/intel_migrate.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c            | 13 ++++++++-----
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c     |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c             |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c    |  4 ++--
 17 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index fd169cf2f75a..3dbebced0950 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1312,7 +1312,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
 	} else if (HAS_FULL_PPGTT(i915)) {
 		struct i915_ppgtt *ppgtt;
 
-		ppgtt = i915_ppgtt_create(&i915->gt);
+		ppgtt = i915_ppgtt_create(&i915->gt, 0);
 		if (IS_ERR(ppgtt)) {
 			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
 				PTR_ERR(ppgtt));
@@ -1490,7 +1490,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags)
 		return -EINVAL;
 
-	ppgtt = i915_ppgtt_create(&i915->gt);
+	ppgtt = i915_ppgtt_create(&i915->gt, 0);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 66123ba46247..477b98b656b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -294,13 +294,16 @@ struct drm_i915_gem_object {
 #define I915_BO_ALLOC_USER        BIT(3)
 /* Object may lose its contents on suspend / resume */
 #define I915_BO_ALLOC_PM_VOLATILE BIT(4)
+/* Object needs to be restored early using memcpy during resume */
+#define I915_BO_ALLOC_PM_EARLY    BIT(5)
 #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
 			     I915_BO_ALLOC_VOLATILE | \
 			     I915_BO_ALLOC_CPU_CLEAR | \
 			     I915_BO_ALLOC_USER | \
-			     I915_BO_ALLOC_PM_VOLATILE)
-#define I915_BO_READONLY          BIT(5)
-#define I915_TILING_QUIRK_BIT     6 /* unknown swizzling; do not release! */
+			     I915_BO_ALLOC_PM_VOLATILE | \
+			     I915_BO_ALLOC_PM_EARLY)
+#define I915_BO_READONLY          BIT(6)
+#define I915_TILING_QUIRK_BIT     7 /* unknown swizzling; do not release! */
 
 	/**
 	 * @mem_flags - Mutable placement-related flags
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 9746c255ddcc..cdd344f64404 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -98,9 +98,11 @@ int i915_gem_backup_suspend(struct drm_i915_private *i915)
 	 * More objects may have become unpinned as requests were
 	 * retired. Now try to evict again. The gt may be wedged here
 	 * in which case we automatically fall back to memcpy.
+	 * We allow also backing up pinned objects that have not been
+	 * marked for early recover, and that may contain, for example,
+	 * page-tables for the migrate context.
 	 */
-
-	ret = lmem_suspend(i915, true, false);
+	ret = lmem_suspend(i915, true, true);
 	if (ret)
 		goto out_recover;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index eaceecfc3f19..bedd0bdd8302 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -58,7 +58,8 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 	if (pm_apply->allow_gpu && i915_gem_object_evictable(obj))
 		return ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
 
-	if (!pm_apply->backup_pinned)
+	if (!pm_apply->backup_pinned ||
+	    (pm_apply->allow_gpu && (obj->flags & I915_BO_ALLOC_PM_EARLY)))
 		return 0;
 
 	if (obj->flags & I915_BO_ALLOC_PM_VOLATILE)
@@ -160,7 +161,8 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 	if (!obj->ttm.backup)
 		return 0;
 
-	if (!pm_apply->allow_gpu && (obj->flags & I915_BO_ALLOC_USER))
+	if (!pm_apply->allow_gpu && ((obj->flags & I915_BO_ALLOC_USER) ||
+				     !(obj->flags & I915_BO_ALLOC_PM_EARLY)))
 		return 0;
 
 	err = i915_gem_object_lock(backup, apply->ww);
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index a094f3ce1a90..149f62221a83 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1629,7 +1629,7 @@ int i915_gem_huge_page_mock_selftests(void)
 	mkwrite_device_info(dev_priv)->ppgtt_type = INTEL_PPGTT_FULL;
 	mkwrite_device_info(dev_priv)->ppgtt_size = 48;
 
-	ppgtt = i915_ppgtt_create(&dev_priv->gt);
+	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
 	if (IS_ERR(ppgtt)) {
 		err = PTR_ERR(ppgtt);
 		goto out_unlock;
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 1aee5e6b1b23..890191f286e3 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -429,7 +429,7 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
 	mutex_init(&ppgtt->flush);
 	mutex_init(&ppgtt->pin_mutex);
 
-	ppgtt_init(&ppgtt->base, gt);
+	ppgtt_init(&ppgtt->base, gt, 0);
 	ppgtt->base.vm.pd_shift = ilog2(SZ_4K * SZ_4K / sizeof(gen6_pte_t));
 	ppgtt->base.vm.top = 1;
 
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 6e0e52eeb87a..da4aa73f46a9 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -751,7 +751,8 @@ gen8_alloc_top_pd(struct i915_address_space *vm)
  * space.
  *
  */
-struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
+struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
+				     unsigned long lmem_pt_obj_flags)
 {
 	struct i915_ppgtt *ppgtt;
 	int err;
@@ -760,7 +761,7 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 	if (!ppgtt)
 		return ERR_PTR(-ENOMEM);
 
-	ppgtt_init(ppgtt, gt);
+	ppgtt_init(ppgtt, gt, lmem_pt_obj_flags);
 	ppgtt->vm.top = i915_vm_is_4lvl(&ppgtt->vm) ? 3 : 2;
 	ppgtt->vm.pd_shift = ilog2(SZ_4K * SZ_4K / sizeof(gen8_pte_t));
 
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
index b9028c2ad3c7..f541d19264b4 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
@@ -12,7 +12,9 @@ struct i915_address_space;
 struct intel_gt;
 enum i915_cache_level;
 
-struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt);
+struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
+				     unsigned long lmem_pt_obj_flags);
+
 u64 gen8_ggtt_pte_encode(dma_addr_t addr,
 			 enum i915_cache_level level,
 			 u32 flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index de3ac58fceec..6e5d2f82b1f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -644,7 +644,7 @@ static int init_aliasing_ppgtt(struct i915_ggtt *ggtt)
 	struct i915_ppgtt *ppgtt;
 	int err;
 
-	ppgtt = i915_ppgtt_create(ggtt->vm.gt);
+	ppgtt = i915_ppgtt_create(ggtt->vm.gt, I915_BO_ALLOC_PM_EARLY);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 62d40c986642..70c06d6eeec8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -481,7 +481,7 @@ static void intel_gt_fini_scratch(struct intel_gt *gt)
 static struct i915_address_space *kernel_vm(struct intel_gt *gt)
 {
 	if (INTEL_PPGTT(gt->i915) > INTEL_PPGTT_ALIASING)
-		return &i915_ppgtt_create(gt)->vm;
+		return &i915_ppgtt_create(gt, I915_BO_ALLOC_PM_EARLY)->vm;
 	else
 		return i915_vm_get(&gt->ggtt->vm);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index e137dd32b5b8..ea6ea97a7a62 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -28,7 +28,8 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
 	 * used the passed in size for the page size, which should ensure it
 	 * also has the same alignment.
 	 */
-	obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz, 0);
+	obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz,
+						    vm->lmem_pt_obj_flags);
 	/*
 	 * Ensure all paging structures for this vm share the same dma-resv
 	 * object underneath, with the idea that one object_lock() will lock
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index bc7153018ebd..8361a1e38c98 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -260,6 +260,9 @@ struct i915_address_space {
 	u8 pd_shift;
 	u8 scratch_order;
 
+	/* Flags used when creating page-table objects for this vm */
+	unsigned long lmem_pt_obj_flags;
+
 	struct drm_i915_gem_object *
 		(*alloc_pt_dma)(struct i915_address_space *vm, int sz);
 
@@ -519,7 +522,8 @@ i915_page_dir_dma_addr(const struct i915_ppgtt *ppgtt, const unsigned int n)
 	return __px_dma(pt ? px_base(pt) : ppgtt->vm.scratch[ppgtt->vm.top]);
 }
 
-void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt);
+void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt,
+		unsigned long lmem_pt_obj_flags);
 
 int i915_ggtt_probe_hw(struct drm_i915_private *i915);
 int i915_ggtt_init_hw(struct drm_i915_private *i915);
@@ -537,7 +541,8 @@ static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
 
 int i915_ppgtt_init_hw(struct intel_gt *gt);
 
-struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt);
+struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt,
+				     unsigned long lmem_pt_obj_flags);
 
 void i915_ggtt_suspend(struct i915_ggtt *gtt);
 void i915_ggtt_resume(struct i915_ggtt *ggtt);
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 1dac21aa7e5c..afb1cce9a352 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -78,7 +78,7 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
 	 * TODO: Add support for huge LMEM PTEs
 	 */
 
-	vm = i915_ppgtt_create(gt);
+	vm = i915_ppgtt_create(gt, I915_BO_ALLOC_PM_EARLY);
 	if (IS_ERR(vm))
 		return ERR_CAST(vm);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 886060f7e6fc..4396bfd630d8 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -155,19 +155,20 @@ int i915_ppgtt_init_hw(struct intel_gt *gt)
 }
 
 static struct i915_ppgtt *
-__ppgtt_create(struct intel_gt *gt)
+__ppgtt_create(struct intel_gt *gt, unsigned long lmem_pt_obj_flags)
 {
 	if (GRAPHICS_VER(gt->i915) < 8)
 		return gen6_ppgtt_create(gt);
 	else
-		return gen8_ppgtt_create(gt);
+		return gen8_ppgtt_create(gt, lmem_pt_obj_flags);
 }
 
-struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt)
+struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt,
+				     unsigned long lmem_pt_obj_flags)
 {
 	struct i915_ppgtt *ppgtt;
 
-	ppgtt = __ppgtt_create(gt);
+	ppgtt = __ppgtt_create(gt, lmem_pt_obj_flags);
 	if (IS_ERR(ppgtt))
 		return ppgtt;
 
@@ -298,7 +299,8 @@ int ppgtt_set_pages(struct i915_vma *vma)
 	return 0;
 }
 
-void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt)
+void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt,
+		unsigned long lmem_pt_obj_flags)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
@@ -306,6 +308,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt)
 	ppgtt->vm.i915 = i915;
 	ppgtt->vm.dma = i915->drm.dev;
 	ppgtt->vm.total = BIT_ULL(INTEL_INFO(i915)->ppgtt_size);
+	ppgtt->vm.lmem_pt_obj_flags = lmem_pt_obj_flags;
 
 	dma_resv_init(&ppgtt->vm._resv);
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 2c1ed32ca5ac..b9e1e86f0e21 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -1596,7 +1596,7 @@ static int igt_reset_evict_ppgtt(void *arg)
 	if (INTEL_PPGTT(gt->i915) < INTEL_PPGTT_FULL)
 		return 0;
 
-	ppgtt = i915_ppgtt_create(gt);
+	ppgtt = i915_ppgtt_create(gt, 0);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index b56a8e37a3cd..0d18e13e3468 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1386,7 +1386,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 	enum intel_engine_id i;
 	int ret;
 
-	ppgtt = i915_ppgtt_create(&i915->gt);
+	ppgtt = i915_ppgtt_create(&i915->gt, I915_BO_ALLOC_PM_EARLY);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index f843a5040706..f0645807518e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -155,7 +155,7 @@ static int igt_ppgtt_alloc(void *arg)
 	if (!HAS_PPGTT(dev_priv))
 		return 0;
 
-	ppgtt = i915_ppgtt_create(&dev_priv->gt);
+	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
@@ -1053,7 +1053,7 @@ static int exercise_ppgtt(struct drm_i915_private *dev_priv,
 	if (IS_ERR(file))
 		return PTR_ERR(file);
 
-	ppgtt = i915_ppgtt_create(&dev_priv->gt);
+	ppgtt = i915_ppgtt_create(&dev_priv->gt, 0);
 	if (IS_ERR(ppgtt)) {
 		err = PTR_ERR(ppgtt);
 		goto out_free;
-- 
2.31.1

