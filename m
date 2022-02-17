Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279434BA351
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD6F10ECAD;
	Thu, 17 Feb 2022 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDB610EC55;
 Thu, 17 Feb 2022 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645109033; x=1676645033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rcAi80iBFcHk84F4O8LyWkJDmfd/XlocZf9rANSQ2H4=;
 b=BL6PWGC3J0/iVLD/Ng7Amtm6oitq7VZlxvugJp4dAJjfTILycqVBGdR4
 iUa69oxtxWzcHqyiLUL6I8y/m6Zo2nGXdfXqpfNT3QqdfnYe16LZ4sstF
 lencFAV9NdslFUNYqQMO2zqvHNdYeyVAwYVieTU/nylLuiNrecopW8qj0
 Zl0z0l0V6Dm3O5OfBQlhLFGY+kWykkFLrgWnsLHYFUHq4aq9X9C3OxWSF
 XsYnxxahWXWWpi4KHx72rOC/r6nqcgyRSF2otHEbaNRQVFaQDy6xigB2z
 KWs19oSoARBfu0D1YSPhvJ0gkFRmLsbdaiDaEvYp+j+MwPsVj2oVhZOIP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250830708"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="250830708"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="704828853"
Received: from sewaggon-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.33.71])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:25 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 2/7] drm/i915: Prepare for multiple GTs
Date: Thu, 17 Feb 2022 15:41:53 +0100
Message-Id: <20220217144158.21555-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217144158.21555-1-andi.shyti@linux.intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

On a multi-tile platform, each tile has its own registers + GGTT
space, and BAR 0 is extended to cover all of them.

Up to four GTs are supported in i915->gt[], with slot zero
shadowing the existing i915->gt0 to enable source compatibility
with legacy driver paths. A for_each_gt macro is added to iterate
over the GTs and will be used by upcoming patches that convert
various parts of the driver to be multi-gt aware.

Only the primary/root tile is initialized for now; the other
tiles will be detected and plugged in by future patches once the
necessary infrastructure is in place to handle them.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            | 135 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt.h            |  16 ++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/i915_driver.c            |  29 ++--
 drivers/gpu/drm/i915/i915_drv.h               |   6 +
 drivers/gpu/drm/i915/intel_memory_region.h    |   3 +
 drivers/gpu/drm/i915/intel_uncore.c           |  12 +-
 drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   7 +-
 10 files changed, 182 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index db171e85f4df..8c64b81e9ec9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -29,7 +29,7 @@
 #include "intel_uncore.h"
 #include "shmem_utils.h"
 
-void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
+static void __intel_gt_init_early(struct intel_gt *gt)
 {
 	spin_lock_init(&gt->irq_lock);
 
@@ -51,19 +51,29 @@ void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 	intel_rps_init_early(&gt->rps);
 }
 
-void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
+/* Preliminary initialization of Tile 0 */
+void intel_root_gt_init_early(struct drm_i915_private *i915)
 {
+	struct intel_gt *gt = to_gt(i915);
+
 	gt->i915 = i915;
 	gt->uncore = &i915->uncore;
+
+	__intel_gt_init_early(gt);
 }
 
-int intel_gt_probe_lmem(struct intel_gt *gt)
+static int intel_gt_probe_lmem(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
+	unsigned int instance = gt->info.id;
 	struct intel_memory_region *mem;
 	int id;
 	int err;
 
+	id = INTEL_REGION_LMEM_0 + instance;
+	if (drm_WARN_ON(&i915->drm, id >= INTEL_REGION_STOLEN_SMEM))
+		return -ENODEV;
+
 	mem = intel_gt_setup_lmem(gt);
 	if (mem == ERR_PTR(-ENODEV))
 		mem = intel_gt_setup_fake_lmem(gt);
@@ -78,9 +88,8 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
 		return err;
 	}
 
-	id = INTEL_REGION_LMEM_0;
-
 	mem->id = id;
+	mem->instance = instance;
 
 	intel_memory_region_set_name(mem, "local%u", mem->instance);
 
@@ -795,16 +804,21 @@ void intel_gt_driver_release(struct intel_gt *gt)
 	intel_gt_fini_buffer_pool(gt);
 }
 
-void intel_gt_driver_late_release(struct intel_gt *gt)
+void intel_gt_driver_late_release(struct drm_i915_private *i915)
 {
+	struct intel_gt *gt;
+	unsigned int id;
+
 	/* We need to wait for inflight RCU frees to release their grip */
 	rcu_barrier();
 
-	intel_uc_driver_late_release(&gt->uc);
-	intel_gt_fini_requests(gt);
-	intel_gt_fini_reset(gt);
-	intel_gt_fini_timelines(gt);
-	intel_engines_free(gt);
+	for_each_gt(gt, i915, id) {
+		intel_uc_driver_late_release(&gt->uc);
+		intel_gt_fini_requests(gt);
+		intel_gt_fini_reset(gt);
+		intel_gt_fini_timelines(gt);
+		intel_engines_free(gt);
+	}
 }
 
 /**
@@ -913,6 +927,105 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
 	return intel_uncore_read_fw(gt->uncore, reg);
 }
 
+static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
+{
+	unsigned int id = gt->info.id;
+	int ret;
+
+	if (id) {
+		struct intel_uncore_mmio_debug *mmio_debug;
+		struct intel_uncore *uncore;
+
+		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
+		if (!gt->uncore)
+			return -ENOMEM;
+
+		mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
+		if (!mmio_debug) {
+			kfree(uncore);
+			return -ENOMEM;
+		}
+
+		gt->uncore = uncore;
+		gt->uncore->debug = mmio_debug;
+
+		__intel_gt_init_early(gt);
+	}
+
+	intel_uncore_init_early(gt->uncore, gt);
+
+	ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
+	if (ret)
+		return ret;
+
+	gt->phys_addr = phys_addr;
+
+	return 0;
+}
+
+static void
+intel_gt_tile_cleanup(struct intel_gt *gt)
+{
+	intel_uncore_cleanup_mmio(gt->uncore);
+
+	if (gt->info.id) {
+		kfree(gt->uncore);
+		kfree(gt);
+	}
+}
+
+int intel_gt_probe_all(struct drm_i915_private *i915)
+{
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	struct intel_gt *gt = &i915->gt0;
+	phys_addr_t phys_addr;
+	unsigned int mmio_bar;
+	int ret;
+
+	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
+	phys_addr = pci_resource_start(pdev, mmio_bar);
+
+	/*
+	 * We always have at least one primary GT on any device
+	 * and it has been already initialized early during probe
+	 * in i915_driver_probe()
+	 */
+	ret = intel_gt_tile_setup(gt, phys_addr);
+	if (ret)
+		return ret;
+
+	i915->gt[0] = gt;
+
+	/* TODO: add more tiles */
+	return 0;
+}
+
+int intel_gt_tiles_init(struct drm_i915_private *i915)
+{
+	struct intel_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, i915, id) {
+		ret = intel_gt_probe_lmem(gt);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+void intel_gt_release_all(struct drm_i915_private *i915)
+{
+	struct intel_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, i915, id) {
+		intel_gt_tile_cleanup(gt);
+		i915->gt[id] = NULL;
+	}
+}
+
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 2dad46c3eff2..915d6192079b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -34,10 +34,8 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
 	return container_of(huc, struct intel_gt, uc.huc);
 }
 
-void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
-void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
+void intel_root_gt_init_early(struct drm_i915_private *i915);
 int intel_gt_assign_ggtt(struct intel_gt *gt);
-int intel_gt_probe_lmem(struct intel_gt *gt);
 int intel_gt_init_mmio(struct intel_gt *gt);
 int __must_check intel_gt_init_hw(struct intel_gt *gt);
 int intel_gt_init(struct intel_gt *gt);
@@ -47,7 +45,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt);
 void intel_gt_driver_remove(struct intel_gt *gt);
 void intel_gt_driver_release(struct intel_gt *gt);
 
-void intel_gt_driver_late_release(struct intel_gt *gt);
+void intel_gt_driver_late_release(struct drm_i915_private *i915);
 
 int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
 
@@ -86,6 +84,16 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
 
 u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
 
+int intel_gt_probe_all(struct drm_i915_private *i915);
+int intel_gt_tiles_init(struct drm_i915_private *i915);
+void intel_gt_release_all(struct drm_i915_private *i915);
+
+#define for_each_gt(gt__, i915__, id__) \
+	for ((id__) = 0; \
+	     (id__) < I915_MAX_GT; \
+	     (id__)++) \
+		for_each_if(((gt__) = (i915__)->gt[(id__)]))
+
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index c0fa41e4c803..e66479d33bc3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -128,7 +128,14 @@ static const struct intel_wakeref_ops wf_ops = {
 
 void intel_gt_pm_init_early(struct intel_gt *gt)
 {
-	intel_wakeref_init(&gt->wakeref, gt->uncore->rpm, &wf_ops);
+	/*
+	 * We access the runtime_pm structure via gt->i915 here rather than
+	 * gt->uncore as we do elsewhere in the file because gt->uncore is not
+	 * yet initialized for all tiles at this point in the driver startup.
+	 * runtime_pm is per-device rather than per-tile, so this is still the
+	 * correct structure.
+	 */
+	intel_wakeref_init(&gt->wakeref, &gt->i915->runtime_pm, &wf_ops);
 	seqcount_mutex_init(&gt->stats.lock, &gt->wakeref.mutex);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f20687796490..89fad770b2d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -182,7 +182,14 @@ struct intel_gt {
 
 	const struct intel_mmio_range *steering_table[NUM_STEERING_TYPES];
 
+	/*
+	 * Base of per-tile GTTMMADR where we can derive the MMIO and the GGTT.
+	 */
+	phys_addr_t phys_addr;
+
 	struct intel_gt_info {
+		unsigned int id;
+
 		intel_engine_mask_t engine_mask;
 
 		u32 l3bank_mask;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 1c67ff735f18..144f989e4fef 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -320,9 +320,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	intel_device_info_subplatform_init(dev_priv);
 	intel_step_init(dev_priv);
 
-	intel_gt_init_early(to_gt(dev_priv), dev_priv);
+	/* All tiles share a single mmio_debug */
 	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
-	intel_uncore_init_early(&dev_priv->uncore, to_gt(dev_priv));
 
 	spin_lock_init(&dev_priv->irq_lock);
 	spin_lock_init(&dev_priv->gpu_error.lock);
@@ -353,7 +352,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_wopcm_init_early(&dev_priv->wopcm);
 
-	__intel_gt_init_early(to_gt(dev_priv), dev_priv);
+	intel_root_gt_init_early(dev_priv);
 
 	i915_gem_init_early(dev_priv);
 
@@ -374,7 +373,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 err_gem:
 	i915_gem_cleanup_early(dev_priv);
-	intel_gt_driver_late_release(to_gt(dev_priv));
+	intel_gt_driver_late_release(dev_priv);
 	intel_region_ttm_device_fini(dev_priv);
 err_ttm:
 	vlv_suspend_cleanup(dev_priv);
@@ -393,7 +392,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	intel_irq_fini(dev_priv);
 	intel_power_domains_cleanup(dev_priv);
 	i915_gem_cleanup_early(dev_priv);
-	intel_gt_driver_late_release(to_gt(dev_priv));
+	intel_gt_driver_late_release(dev_priv);
 	intel_region_ttm_device_fini(dev_priv);
 	vlv_suspend_cleanup(dev_priv);
 	i915_workqueues_cleanup(dev_priv);
@@ -424,13 +423,9 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 	if (ret < 0)
 		return ret;
 
-	ret = intel_uncore_setup_mmio(&dev_priv->uncore);
-	if (ret < 0)
-		goto err_bridge;
-
 	ret = intel_uncore_init_mmio(&dev_priv->uncore);
 	if (ret)
-		goto err_mmio;
+		return ret;
 
 	/* Try to make sure MCHBAR is enabled before poking at it */
 	intel_setup_mchbar(dev_priv);
@@ -448,9 +443,6 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 err_uncore:
 	intel_teardown_mchbar(dev_priv);
 	intel_uncore_fini_mmio(&dev_priv->uncore);
-err_mmio:
-	intel_uncore_cleanup_mmio(&dev_priv->uncore);
-err_bridge:
 	pci_dev_put(dev_priv->bridge_dev);
 
 	return ret;
@@ -464,7 +456,6 @@ static void i915_driver_mmio_release(struct drm_i915_private *dev_priv)
 {
 	intel_teardown_mchbar(dev_priv);
 	intel_uncore_fini_mmio(&dev_priv->uncore);
-	intel_uncore_cleanup_mmio(&dev_priv->uncore);
 	pci_dev_put(dev_priv->bridge_dev);
 }
 
@@ -597,7 +588,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_ggtt;
 
-	ret = intel_gt_probe_lmem(to_gt(dev_priv));
+	ret = intel_gt_tiles_init(dev_priv);
 	if (ret)
 		goto err_mem_regions;
 
@@ -862,10 +853,14 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	intel_vgpu_detect(i915);
 
-	ret = i915_driver_mmio_probe(i915);
+	ret = intel_gt_probe_all(i915);
 	if (ret < 0)
 		goto out_runtime_pm_put;
 
+	ret = i915_driver_mmio_probe(i915);
+	if (ret < 0)
+		goto out_tiles_cleanup;
+
 	ret = i915_driver_hw_probe(i915);
 	if (ret < 0)
 		goto out_cleanup_mmio;
@@ -922,6 +917,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i915_ggtt_driver_late_release(i915);
 out_cleanup_mmio:
 	i915_driver_mmio_release(i915);
+out_tiles_cleanup:
+	intel_gt_release_all(i915);
 out_runtime_pm_put:
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 	i915_driver_late_release(i915);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 418091484e02..88a83cd81ddd 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -805,6 +805,12 @@ struct drm_i915_private {
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt0;
 
+	/*
+	 * i915->gt[0] == &i915->gt0
+	 */
+#define I915_MAX_GT 4
+	struct intel_gt *gt[I915_MAX_GT];
+
 	struct {
 		struct i915_gem_contexts {
 			spinlock_t lock; /* locks list */
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 95db0a8029e2..9548335344be 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -30,6 +30,9 @@ enum intel_memory_type {
 enum intel_region_id {
 	INTEL_REGION_SMEM = 0,
 	INTEL_REGION_LMEM_0,
+	INTEL_REGION_LMEM_1,
+	INTEL_REGION_LMEM_2,
+	INTEL_REGION_LMEM_3,
 	INTEL_REGION_STOLEN_SMEM,
 	INTEL_REGION_STOLEN_LMEM,
 	INTEL_REGION_UNKNOWN, /* Should be last */
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index dd8fdd5863de..75d9fa21923e 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2039,14 +2039,11 @@ static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-int intel_uncore_setup_mmio(struct intel_uncore *uncore)
+int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
 {
 	struct drm_i915_private *i915 = uncore->i915;
-	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
-	int mmio_bar;
 	int mmio_size;
 
-	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
 	/*
 	 * Before gen4, the registers and the GTT are behind different BARs.
 	 * However, from gen4 onwards, the registers and the GTT are shared
@@ -2063,7 +2060,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore)
 	else
 		mmio_size = 2 * 1024 * 1024;
 
-	uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
+	uncore->regs = ioremap(phys_addr, mmio_size);
 	if (uncore->regs == NULL) {
 		drm_err(&i915->drm, "failed to map registers\n");
 		return -EIO;
@@ -2074,9 +2071,8 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore)
 
 void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
 {
-	struct pci_dev *pdev = to_pci_dev(uncore->i915->drm.dev);
-
-	pci_iounmap(pdev, uncore->regs);
+	if (uncore->regs)
+		iounmap(uncore->regs);
 }
 
 void intel_uncore_init_early(struct intel_uncore *uncore,
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 6ff56d673e2b..de53c961fadb 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -29,6 +29,7 @@
 #include <linux/notifier.h>
 #include <linux/hrtimer.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/types.h>
 
 #include "i915_reg_defs.h"
 
@@ -219,7 +220,7 @@ void
 intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_debug);
 void intel_uncore_init_early(struct intel_uncore *uncore,
 			     struct intel_gt *gt);
-int intel_uncore_setup_mmio(struct intel_uncore *uncore);
+int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr);
 int intel_uncore_init_mmio(struct intel_uncore *uncore);
 void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 					  struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 573d9b2e1a4a..f72436c5d596 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -73,7 +73,7 @@ static void mock_device_release(struct drm_device *dev)
 	destroy_workqueue(i915->wq);
 
 	intel_region_ttm_device_fini(i915);
-	intel_gt_driver_late_release(to_gt(i915));
+	intel_gt_driver_late_release(i915);
 	intel_memory_regions_driver_release(i915);
 
 	drm_mode_config_cleanup(&i915->drm);
@@ -180,8 +180,7 @@ struct drm_i915_private *mock_gem_device(void)
 	spin_lock_init(&i915->gpu_error.lock);
 
 	i915_gem_init__mm(i915);
-	intel_gt_init_early(to_gt(i915), i915);
-	__intel_gt_init_early(to_gt(i915), i915);
+	intel_root_gt_init_early(i915);
 	mock_uncore_init(&i915->uncore, i915);
 	atomic_inc(&to_gt(i915)->wakeref.count); /* disable; no hw support */
 	to_gt(i915)->awake = -ENODEV;
@@ -229,7 +228,7 @@ struct drm_i915_private *mock_gem_device(void)
 err_drv:
 	intel_region_ttm_device_fini(i915);
 err_ttm:
-	intel_gt_driver_late_release(to_gt(i915));
+	intel_gt_driver_late_release(i915);
 	intel_memory_regions_driver_release(i915);
 	drm_mode_config_cleanup(&i915->drm);
 	mock_destroy_device(i915);
-- 
2.27.0

