Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39643F57A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 05:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F426E9D0;
	Fri, 29 Oct 2021 03:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6626E9BB;
 Fri, 29 Oct 2021 03:28:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230438547"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="230438547"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 20:28:35 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="538557511"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 20:28:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 05/10] drm/i915: Prepare for multiple gts
Date: Thu, 28 Oct 2021 20:28:12 -0700
Message-Id: <20211029032817.3747750-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211029032817.3747750-1-matthew.d.roper@intel.com>
References: <20211029032817.3747750-1-matthew.d.roper@intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add some basic plumbing to support more than one dynamically allocated
struct intel_gt.  Up to four gts are supported in i915->gts[], with slot
zero shadowing the existing i915->gt to enable source compatibility with
legacy driver paths.  A for_each_gt macro is added to iterate over the
GTs and will be used by upcoming patches that convert various parts of
the driver to be multi-gt aware.

v2:
 - Rename init function to i915_init_tile_memory() and move it to
   i915_drv.c. (Lucas)
 - Squash in patch from Sandeep to release the per-gt resources during
   driver teardown.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c         | 57 +++++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gt.h         |  6 +++
 drivers/gpu/drm/i915/gt/intel_gt_types.h   |  2 +
 drivers/gpu/drm/i915/i915_drv.c            | 30 +++++++++++-
 drivers/gpu/drm/i915/i915_drv.h            |  6 +++
 drivers/gpu/drm/i915/intel_memory_region.h |  3 ++
 6 files changed, 96 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 098cd8843c38..d02a09653033 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -23,10 +23,13 @@
 #include "shmem_utils.h"
 #include "pxp/intel_pxp.h"
 
-void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
+static void
+__intel_gt_init_early(struct intel_gt *gt,
+		      struct intel_uncore *uncore,
+		      struct drm_i915_private *i915)
 {
 	gt->i915 = i915;
-	gt->uncore = &i915->uncore;
+	gt->uncore = uncore;
 
 	spin_lock_init(&gt->irq_lock);
 
@@ -49,10 +52,15 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 int intel_gt_probe_lmem(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
+	unsigned int instance = gt->info.id;
 	struct intel_memory_region *mem;
 	int id;
 	int err;
 
+	id = INTEL_REGION_LMEM + instance;
+	if (drm_WARN_ON(&i915->drm, id >= INTEL_REGION_STOLEN_SMEM))
+		return -ENODEV;
+
 	mem = intel_gt_setup_lmem(gt);
 	if (mem == ERR_PTR(-ENODEV))
 		mem = intel_gt_setup_fake_lmem(gt);
@@ -67,9 +75,8 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
 		return err;
 	}
 
-	id = INTEL_REGION_LMEM;
-
 	mem->id = id;
+	mem->instance = instance;
 
 	intel_memory_region_set_name(mem, "local%u", mem->instance);
 
@@ -80,6 +87,11 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
 	return 0;
 }
 
+void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
+{
+	__intel_gt_init_early(gt, &i915->uncore, i915);
+}
+
 void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt)
 {
 	gt->ggtt = ggtt;
@@ -903,9 +915,29 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
 static int
 intel_gt_tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
 {
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_uncore *uncore;
+	struct intel_uncore_mmio_debug *mmio_debug;
 	int ret;
 
-	intel_uncore_init_early(gt->uncore, gt);
+	if (id) {
+		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
+		if (!uncore)
+			return -ENOMEM;
+
+		mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
+		if (!mmio_debug) {
+			kfree(uncore);
+			return -ENOMEM;
+		}
+
+		__intel_gt_init_early(gt, uncore, i915);
+	} else {
+		uncore = &i915->uncore;
+		mmio_debug = &i915->mmio_debug;
+	}
+
+	intel_uncore_init_early(uncore, gt);
 
 	ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
 	if (ret)
@@ -920,6 +952,11 @@ static void
 intel_gt_tile_cleanup(struct intel_gt *gt)
 {
 	intel_uncore_cleanup_mmio(gt->uncore);
+
+	if (gt->info.id) {
+		kfree(gt->uncore);
+		kfree(gt);
+	}
 }
 
 int intel_gt_probe_all(struct drm_i915_private *i915)
@@ -937,13 +974,21 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	if (ret)
 		return ret;
 
+	i915->gts[0] = &i915->gt;
+
 	/* TODO: add more tiles */
 	return 0;
 }
 
 void intel_gt_release_all(struct drm_i915_private *i915)
 {
-	intel_gt_tile_cleanup(&i915->gt);
+	struct intel_gt *gt;
+	unsigned int id;
+
+	for_each_gt(i915, id, gt) {
+		intel_gt_tile_cleanup(gt);
+		i915->gts[id] = NULL;
+	}
 }
 
 void intel_gt_info_print(const struct intel_gt_info *info,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 68cdf042ad88..a59521a8c96c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -88,6 +88,12 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
 int intel_gt_probe_all(struct drm_i915_private *i915);
 void intel_gt_release_all(struct drm_i915_private *i915);
 
+#define for_each_gt(i915__, id__, gt__) \
+	for ((id__) = 0; \
+	     (id__) < I915_MAX_TILES; \
+	     (id__)++) \
+		for_each_if(((gt__) = (i915__)->gts[(id__)]))
+
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 66143316d92e..7311e485faae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -186,6 +186,8 @@ struct intel_gt {
 	phys_addr_t phys_addr;
 
 	struct intel_gt_info {
+		unsigned int id;
+
 		intel_engine_mask_t engine_mask;
 
 		u32 l3bank_mask;
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 000b1b070155..fde148d6777e 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -382,10 +382,14 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
  */
 static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 {
+	struct intel_gt *gt;
+	unsigned int id;
+
 	intel_irq_fini(dev_priv);
 	intel_power_domains_cleanup(dev_priv);
 	i915_gem_cleanup_early(dev_priv);
-	intel_gt_driver_late_release(&dev_priv->gt);
+	for_each_gt(dev_priv, id, gt)
+		intel_gt_driver_late_release(gt);
 	intel_region_ttm_device_fini(dev_priv);
 	vlv_suspend_cleanup(dev_priv);
 	i915_workqueues_cleanup(dev_priv);
@@ -512,6 +516,28 @@ static int i915_set_dma_info(struct drm_i915_private *i915)
 	return ret;
 }
 
+/**
+ * i915_init_tile_memory - initialize per-tile memory
+ * @i915: valid i915 instance
+ *
+ * Current multi-tile platforms include a GT and a memory region within each
+ * tile.  We need to initialize each.
+ */
+static int i915_init_tile_memory(struct drm_i915_private *i915)
+{
+	struct intel_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(i915, id, gt) {
+		ret = intel_gt_probe_lmem(gt);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * i915_driver_hw_probe - setup state requiring device access
  * @dev_priv: device private
@@ -579,7 +605,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	intel_gt_init_hw_early(&dev_priv->gt, &dev_priv->ggtt);
 
-	ret = intel_gt_probe_lmem(&dev_priv->gt);
+	ret = i915_init_tile_memory(dev_priv);
 	if (ret)
 		goto err_mem_regions;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 19e6700a4315..10a4817e397d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1193,6 +1193,12 @@ struct drm_i915_private {
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt;
 
+	/*
+	 * i915->gts[0] == &i915->gt
+	 */
+#define I915_MAX_TILES 4
+	struct intel_gt *gts[I915_MAX_TILES];
+
 	struct {
 		struct i915_gem_contexts {
 			spinlock_t lock; /* locks list */
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 3feae3353d33..d255e4bffb23 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -31,6 +31,9 @@ enum intel_memory_type {
 enum intel_region_id {
 	INTEL_REGION_SMEM = 0,
 	INTEL_REGION_LMEM,
+	INTEL_REGION_LMEM1,
+	INTEL_REGION_LMEM2,
+	INTEL_REGION_LMEM3,
 	INTEL_REGION_STOLEN_SMEM,
 	INTEL_REGION_STOLEN_LMEM,
 	INTEL_REGION_UNKNOWN, /* Should be last */
-- 
2.33.0

