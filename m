Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432A633574
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 07:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBB010E04E;
	Tue, 22 Nov 2022 06:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B114910E04E;
 Tue, 22 Nov 2022 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669099618; x=1700635618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FlR+yRB9oQWM7yQW5tv21Rt8v+9OzbRHDBnFfSxArOQ=;
 b=O6kWtg3BP5CFCamg2oB7OXIXHHiNaT3TudstfVkOqIDEDFD8ik7EgP5w
 3XV6BZdfuBOlTHc6L2/wQFoSzGx4JVZqlzZ/8/2cNr9iYenjzjSN1f/r0
 xA02btpDDFV3yVeOosSvP2oQN/J4ZajIY4lyZAPT2nPGjffgFKPbqnwma
 c9PGATOoy0WRKwkifMbJo9o2BIbH22DXBHkMhUCYX1tYx8gA2X8OtithK
 j6zzf7wfoKoru6M2X+HrUvW8k+PANvtr/u8u0xUERq87xc0Ahn9goF/mu
 vXZq4FrE/KMe6kh/IrFImMsjQf07iRq81yyP/wu/ZMhkpO+RcxDRkF9Z8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="294137121"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="294137121"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 22:46:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="643610906"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="643610906"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 22:46:56 -0800
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4] drm/i915/mtl: Media GT and Render GT share common GGTT
Date: Tue, 22 Nov 2022 12:31:26 +0530
Message-Id: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On XE_LPM+ platforms the media engines are carved out into a separate
GT but have a common GGTMMADR address range which essentially makes
the GGTT address space to be shared between media and render GT. As a
result any updates in GGTT shall invalidate TLB of GTs sharing it and
similarly any operation on GGTT requiring an action on a GT will have to
involve all GTs sharing it. setup_private_pat was being done on a per
GGTT based as that doesn't touch any GGTT structures moved it to per GT
based.

BSPEC: 63834

v2:
1. Add details to commit msg
2. includes fix for failure to add item to ggtt->gt_list, as suggested
by Lucas
3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
it.
4. setup_private_pat moved out of intel_gt_tiles_init

v3:
1. Move out for_each_gt from i915_driver.c (Jani Nikula)

v4: drop using RCU primitives on ggtt->gt_list as it is not an RCU list
(Matt Roper)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
 drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
 drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
 drivers/gpu/drm/i915/i915_gem.c           |  2 +
 drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
 drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
 drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
 9 files changed, 111 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 8145851ad23d..7644738b9cdb 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <linux/stop_machine.h>
 
+#include <drm/drm_managed.h>
 #include <drm/i915_drm.h>
 #include <drm/intel-gtt.h>
 
@@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
 
 void i915_ggtt_suspend(struct i915_ggtt *ggtt)
 {
+	struct intel_gt *gt;
+
 	i915_ggtt_suspend_vm(&ggtt->vm);
 	ggtt->invalidate(ggtt);
 
-	intel_gt_check_and_clear_faults(ggtt->vm.gt);
+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+		intel_gt_check_and_clear_faults(gt);
 }
 
 void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
@@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
 
 static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
 {
-	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
 	struct drm_i915_private *i915 = ggtt->vm.i915;
 
 	gen8_ggtt_invalidate(ggtt);
 
-	if (GRAPHICS_VER(i915) >= 12)
-		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
-				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
-	else
-		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
+	if (GRAPHICS_VER(i915) >= 12) {
+		struct intel_gt *gt;
+
+		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+			intel_uncore_write_fw(gt->uncore,
+					      GEN12_GUC_TLB_INV_CR,
+					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
+	} else {
+		intel_uncore_write_fw(ggtt->vm.gt->uncore,
+				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
+	}
 }
 
 u64 gen8_ggtt_pte_encode(dma_addr_t addr,
@@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 
 	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
 
-	setup_private_pat(ggtt->vm.gt);
-
 	return ggtt_probe_common(ggtt, size);
 }
 
@@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
  */
 int i915_ggtt_probe_hw(struct drm_i915_private *i915)
 {
-	int ret;
+	struct intel_gt *gt;
+	int ret, i;
+
+	for_each_gt(gt, i915, i) {
+		ret = intel_gt_assign_ggtt(gt);
+		if (ret)
+			return ret;
+	}
 
 	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
 	if (ret)
@@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
 	return 0;
 }
 
+struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
+{
+	struct i915_ggtt *ggtt;
+
+	ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (!ggtt)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ggtt->gt_list);
+
+	return ggtt;
+}
+
 int i915_ggtt_enable_hw(struct drm_i915_private *i915)
 {
 	if (GRAPHICS_VER(i915) < 6)
@@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 
 void i915_ggtt_resume(struct i915_ggtt *ggtt)
 {
+	struct intel_gt *gt;
 	bool flush;
 
-	intel_gt_check_and_clear_faults(ggtt->vm.gt);
+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+		intel_gt_check_and_clear_faults(gt);
 
 	flush = i915_ggtt_resume_vm(&ggtt->vm);
 
@@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
 	if (flush)
 		wbinvd_on_all_cpus();
 
-	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
-		setup_private_pat(ggtt->vm.gt);
-
 	intel_ggtt_restore_fences(ggtt);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index b5ad9caa5537..b03788d7674e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
 
 int intel_gt_assign_ggtt(struct intel_gt *gt)
 {
-	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
+	/* Media GT shares primary GT's GGTT */
+	if (gt->type == GT_MEDIA) {
+		gt->ggtt = to_gt(gt->i915)->ggtt;
+	} else {
+		gt->ggtt = i915_ggtt_create(gt->i915);
+		if (IS_ERR(gt->ggtt))
+			return PTR_ERR(gt->ggtt);
+	}
 
-	return gt->ggtt ? 0 : -ENOMEM;
+	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
+
+	return 0;
 }
 
 int intel_gt_init_mmio(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index c1d9cd255e06..8d915640914b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -277,6 +277,9 @@ struct intel_gt {
 	struct kobject *sysfs_defaults;
 
 	struct i915_perf_gt perf;
+
+	/** link: &ggtt.gt_list */
+	struct list_head ggtt_link;
 };
 
 struct intel_gt_definition {
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 4d75ba4bb41d..d1900fec6cd1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -390,6 +390,9 @@ struct i915_ggtt {
 	struct mutex error_mutex;
 	struct drm_mm_node error_capture;
 	struct drm_mm_node uc_fw;
+
+	/** List of GTs mapping this GGTT */
+	struct list_head gt_list;
 };
 
 struct i915_ppgtt {
@@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
 int i915_init_ggtt(struct drm_i915_private *i915);
 void i915_ggtt_driver_release(struct drm_i915_private *i915);
 void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
+struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
 
 static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
 {
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 69103ae37779..4e1bb3c23c63 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	i915_perf_init(dev_priv);
 
-	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
-	if (ret)
-		goto err_perf;
-
 	ret = i915_ggtt_probe_hw(dev_priv);
 	if (ret)
 		goto err_perf;
@@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
 static int i915_drm_resume(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	int ret;
+	struct intel_gt *gt;
+	int ret, i;
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
@@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device *dev)
 		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
 
 	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
+
+	for_each_gt(gt, dev_priv, i)
+		if (GRAPHICS_VER(gt->i915) >= 8)
+			setup_private_pat(gt);
+
 	/* Must be called after GGTT is resumed. */
 	intel_dpt_resume(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 8468ca9885fd..086c4702e1bf 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	for_each_gt(gt, dev_priv, i) {
 		intel_uc_fetch_firmwares(&gt->uc);
 		intel_wopcm_init(&gt->wopcm);
+		if (GRAPHICS_VER(dev_priv) >= 8)
+			setup_private_pat(gt);
 	}
 
 	ret = i915_init_ggtt(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index f025ee4fa526..4cfe36b0366b 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
 	return !kref_read(&vma->obj->base.refcount);
 }
 
-static int ggtt_flush(struct intel_gt *gt)
+static int ggtt_flush(struct i915_address_space *vm)
 {
-	/*
-	 * Not everything in the GGTT is tracked via vma (otherwise we
-	 * could evict as required with minimal stalling) so we are forced
-	 * to idle the GPU and explicitly retire outstanding requests in
-	 * the hopes that we can then remove contexts and the like only
-	 * bound by their active reference.
-	 */
-	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
+	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
+	struct intel_gt *gt;
+	int ret = 0;
+
+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
+		/*
+		 * Not everything in the GGTT is tracked via vma (otherwise we
+		 * could evict as required with minimal stalling) so we are forced
+		 * to idle the GPU and explicitly retire outstanding requests in
+		 * the hopes that we can then remove contexts and the like only
+		 * bound by their active reference.
+		 */
+		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
+		if (ret)
+			return ret;
+	}
+	return ret;
 }
 
 static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
@@ -149,6 +158,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	struct drm_mm_node *node;
 	enum drm_mm_insert_mode mode;
 	struct i915_vma *active;
+	struct intel_gt *gt;
 	int ret;
 
 	lockdep_assert_held(&vm->mutex);
@@ -174,7 +184,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
 				    min_size, alignment, color,
 				    start, end, mode);
 
-	intel_gt_retire_requests(vm->gt);
+	if (i915_is_ggtt(vm)) {
+		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
+
+		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+			intel_gt_retire_requests(gt);
+	} else {
+		intel_gt_retire_requests(vm->gt);
+	}
 
 search_again:
 	active = NULL;
@@ -246,7 +263,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
 		return -EBUSY;
 
-	ret = ggtt_flush(vm->gt);
+	ret = ggtt_flush(vm);
 	if (ret)
 		return ret;
 
@@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 	 * a stray pin (preventing eviction) that can only be resolved by
 	 * retiring.
 	 */
-	intel_gt_retire_requests(vm->gt);
+	if (i915_is_ggtt(vm)) {
+		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
+		struct intel_gt *gt;
+
+		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+			intel_gt_retire_requests(gt);
+	} else {
+		intel_gt_retire_requests(vm->gt);
+	}
 
 	if (i915_vm_has_cache_coloring(vm)) {
 		/* Expand search to cover neighbouring guard pages (or lack!) */
@@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 	 * switch otherwise is ineffective.
 	 */
 	if (i915_is_ggtt(vm)) {
-		ret = ggtt_flush(vm->gt);
+		ret = ggtt_flush(vm);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 703fee6b5f75..726705b10637 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 			   u32 align, unsigned int flags)
 {
 	struct i915_address_space *vm = vma->vm;
+	struct intel_gt *gt;
+	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
 	int err;
 
 	do {
@@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		}
 
 		/* Unlike i915_vma_pin, we don't take no for an answer! */
-		flush_idle_contexts(vm->gt);
+		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+			flush_idle_contexts(gt);
 		if (mutex_lock_interruptible(&vm->mutex) == 0) {
 			/*
 			 * We pass NULL ww here, as we don't want to unbind
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index e5dd82e7e480..2535b9684bd1 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
 	 */
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		i915_ggtt_resume(to_gt(i915)->ggtt);
+		if (GRAPHICS_VER(i915) >= 8)
+			setup_private_pat(to_gt(i915));
 		i915_gem_resume(i915);
 	}
 }
-- 
2.25.1

