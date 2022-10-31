Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13B61362A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3400A10E21F;
	Mon, 31 Oct 2022 12:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4A489B30;
 Mon, 31 Oct 2022 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667219096; x=1698755096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u6dda4R3VhBkDAGn+yGZA/y8WLi9r2oKfFwMWZ8DAhs=;
 b=feoXj+NyuTJuSnA3E9pjhf5tKNJgFuozy+PfGh39i+GX9BfEoGWJdf0T
 LFyXHGfxyUHUdudKXMQtLBkeSEfRwaVhj++y1AfZozLjW3Qt6ltDeP6at
 xX5Fhmwj6KLsAERNvSc2ZmINVlYcd+HWZGNWiSeMVLZRRfNlvPvKZg3El
 o1Slijr8ldWPno/ZEVikhHAksuxjJo8CBPA5Qm/ec9wwVrPYaM+gwo8z0
 8Bf/dZ6FMlAMrPtgCAPu+VsrpuQa3C+D+pPBE6M8VbvlFC9GJ0o8NBCDI
 TLS2NLX86dHkORIqyMnR1w7gOW2LutEXb5/k8GzqXXqgiao13M6ca+Vx3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="309972415"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="309972415"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 05:24:55 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="633510366"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="633510366"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 05:24:54 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Media GT and Render GT share common GGTT
Date: Mon, 31 Oct 2022 18:01:11 +0530
Message-Id: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
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
the GGTT address space to be shared between media and render GT.

BSPEC: 63834

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 49 +++++++++++-------
 drivers/gpu/drm/i915/gt/intel_gt.c        | 15 +++++-
 drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h       |  3 ++
 drivers/gpu/drm/i915/i915_driver.c        | 19 +++++--
 drivers/gpu/drm/i915/i915_gem_evict.c     | 63 +++++++++++++++++------
 drivers/gpu/drm/i915/i915_vma.c           |  5 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
 drivers/gpu/drm/i915/selftests/mock_gtt.c |  1 +
 9 files changed, 115 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 2518cebbf931..f5c2f3c58627 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -196,10 +196,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
 
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
@@ -214,27 +217,36 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
 
 static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
 {
-	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
+	struct intel_uncore *uncore;
+	struct intel_gt *gt;
 
-	/*
-	 * Note that as an uncached mmio write, this will flush the
-	 * WCB of the writes into the GGTT before it triggers the invalidate.
-	 */
-	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
+		uncore = gt->uncore;
+		/*
+		 * Note that as an uncached mmio write, this will flush the
+		 * WCB of the writes into the GGTT before it triggers the invalidate.
+		 */
+		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
+	}
 }
 
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
@@ -986,8 +998,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 
 	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
 
-	setup_private_pat(ggtt->vm.gt);
-
 	return ggtt_probe_common(ggtt, size);
 }
 
@@ -1186,7 +1196,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
 		(u64)ggtt->mappable_end >> 20);
 	drm_dbg(&i915->drm, "DSM size = %lluM\n",
 		(u64)resource_size(&intel_graphics_stolen_res) >> 20);
-
+	INIT_LIST_HEAD(&ggtt->gt_list);
 	return 0;
 }
 
@@ -1296,9 +1306,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 
 void i915_ggtt_resume(struct i915_ggtt *ggtt)
 {
+	struct intel_gt *gt;
 	bool flush;
 
-	intel_gt_check_and_clear_faults(ggtt->vm.gt);
+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
+		intel_gt_check_and_clear_faults(gt);
 
 	flush = i915_ggtt_resume_vm(&ggtt->vm);
 
@@ -1307,9 +1319,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
 	if (flush)
 		wbinvd_on_all_cpus();
 
-	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
-		setup_private_pat(ggtt->vm.gt);
-
 	intel_ggtt_restore_fences(ggtt);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 2e796ffad911..d72efb74563a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -110,9 +110,17 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
 
 int intel_gt_assign_ggtt(struct intel_gt *gt)
 {
-	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
+	/* Media GT shares primary GT's GGTT */
+	if (gt->type == GT_MEDIA) {
+		gt->ggtt = to_gt(gt->i915)->ggtt;
+	} else {
+		gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
+		if (!gt->ggtt)
+			return -ENOMEM;
+	}
 
-	return gt->ggtt ? 0 : -ENOMEM;
+	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
+	return 0;
 }
 
 int intel_gt_init_mmio(struct intel_gt *gt)
@@ -965,6 +973,9 @@ int intel_gt_tiles_init(struct drm_i915_private *i915)
 	int ret;
 
 	for_each_gt(gt, i915, id) {
+		if (GRAPHICS_VER(i915) >= 8)
+			setup_private_pat(gt);
+
 		ret = intel_gt_probe_lmem(gt);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 6f686a4244f0..aee37e9e79b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -292,6 +292,9 @@ struct intel_gt {
 	struct kobject *sysfs_defaults;
 
 	struct i915_perf_gt perf;
+
+	/** link: &ggtt.gt_list */
+	struct list_head ggtt_link;
 };
 
 struct intel_gt_definition {
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 4d75ba4bb41d..cb1272702a1a 100644
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
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c3d43f9b1e45..6b973182ddcc 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -577,7 +577,8 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 {
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct pci_dev *root_pdev;
-	int ret;
+	struct intel_gt *gt;
+	int ret, i;
 
 	if (i915_inject_probe_failure(dev_priv))
 		return -ENODEV;
@@ -614,9 +615,11 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	i915_perf_init(dev_priv);
 
-	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
-	if (ret)
-		goto err_perf;
+	for_each_gt(gt, dev_priv, i) {
+		ret = intel_gt_assign_ggtt(gt);
+		if (ret)
+			goto err_perf;
+	}
 
 	ret = i915_ggtt_probe_hw(dev_priv);
 	if (ret)
@@ -1318,7 +1321,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
 static int i915_drm_resume(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	int ret;
+	struct intel_gt *gt;
+	int ret, i;
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
@@ -1333,6 +1337,11 @@ static int i915_drm_resume(struct drm_device *dev)
 		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
 
 	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
+
+	for_each_gt(gt, dev_priv, i)
+		if (GRAPHICS_VER(gt->i915) >= 8)
+			setup_private_pat(gt);
+
 	/* Must be called after GGTT is resumed. */
 	intel_dpt_resume(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index f025ee4fa526..e9d4352ebfb8 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -43,16 +43,30 @@ static bool dying_vma(struct i915_vma *vma)
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
+	int ret = 0;
+
+	if (i915_is_ggtt(vm)) {
+		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
+		struct intel_gt *gt;
+
+		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
+			/*
+			 * Not everything in the GGTT is tracked via vma (otherwise we
+			 * could evict as required with minimal stalling) so we are forced
+			 * to idle the GPU and explicitly retire outstanding requests in
+			 * the hopes that we can then remove contexts and the like only
+			 * bound by their active reference.
+			 */
+			ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = intel_gt_wait_for_idle(vm->gt, MAX_SCHEDULE_TIMEOUT);
+	}
+	return ret;
 }
 
 static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
@@ -149,6 +163,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	struct drm_mm_node *node;
 	enum drm_mm_insert_mode mode;
 	struct i915_vma *active;
+	struct intel_gt *gt;
 	int ret;
 
 	lockdep_assert_held(&vm->mutex);
@@ -174,7 +189,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
 				    min_size, alignment, color,
 				    start, end, mode);
 
-	intel_gt_retire_requests(vm->gt);
+	if (i915_is_ggtt(vm)) {
+		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
+
+		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
+			intel_gt_retire_requests(gt);
+	} else {
+		intel_gt_retire_requests(vm->gt);
+	}
 
 search_again:
 	active = NULL;
@@ -246,7 +268,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
 		return -EBUSY;
 
-	ret = ggtt_flush(vm->gt);
+	ret = ggtt_flush(vm);
 	if (ret)
 		return ret;
 
@@ -332,7 +354,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
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
@@ -437,11 +467,10 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 	 * pin themselves inside the global GTT and performing the
 	 * switch otherwise is ineffective.
 	 */
-	if (i915_is_ggtt(vm)) {
-		ret = ggtt_flush(vm->gt);
-		if (ret)
-			return ret;
-	}
+
+	ret = ggtt_flush(vm);
+	if (ret)
+		return ret;
 
 	do {
 		struct i915_vma *vma, *vn;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index c39488eb9eeb..24cbee3c1ce5 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1542,6 +1542,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 			   u32 align, unsigned int flags)
 {
 	struct i915_address_space *vm = vma->vm;
+	struct intel_gt *gt;
+	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
 	int err;
 
 	do {
@@ -1557,7 +1559,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		}
 
 		/* Unlike i915_vma_pin, we don't take no for an answer! */
-		flush_idle_contexts(vm->gt);
+		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
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
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index 568840e7ca66..b519d271f4fe 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -127,6 +127,7 @@ void mock_init_ggtt(struct intel_gt *gt)
 	ggtt->vm.vma_ops.bind_vma    = mock_bind_ggtt;
 	ggtt->vm.vma_ops.unbind_vma  = mock_unbind_ggtt;
 
+	INIT_LIST_HEAD(&ggtt->gt_list);
 	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
 }
 
-- 
2.25.1

