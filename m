Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9380427351
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DBB6E87E;
	Fri,  8 Oct 2021 21:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69C6E87E;
 Fri,  8 Oct 2021 21:57:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="206715329"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="206715329"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="489625458"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 05/11] drm/i915: Prepare for multiple gts
Date: Fri,  8 Oct 2021 14:56:29 -0700
Message-Id: <20211008215635.2026385-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008215635.2026385-1-matthew.d.roper@intel.com>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c         | 74 ++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt.h         |  8 ++-
 drivers/gpu/drm/i915/gt/intel_gt_types.h   |  2 +
 drivers/gpu/drm/i915/i915_drv.c            |  2 +-
 drivers/gpu/drm/i915/i915_drv.h            |  6 ++
 drivers/gpu/drm/i915/intel_memory_region.h |  3 +
 6 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 863039d56cba..736725411f51 100644
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
 
@@ -46,13 +49,18 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 	intel_rps_init_early(&gt->rps);
 }
 
-int intel_gt_probe_lmem(struct intel_gt *gt)
+static int intel_gt_probe_lmem(struct intel_gt *gt)
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
 tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
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
@@ -919,6 +951,11 @@ tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
 static void tile_cleanup(struct intel_gt *gt)
 {
 	intel_uncore_cleanup_mmio(gt->uncore);
+
+	if (gt->info.id) {
+		kfree(gt->uncore);
+		kfree(gt);
+	}
 }
 
 int intel_probe_gts(struct drm_i915_private *i915)
@@ -936,13 +973,36 @@ int intel_probe_gts(struct drm_i915_private *i915)
 	if (ret)
 		return ret;
 
+	i915->gts[0] = &i915->gt;
+
 	/* TODO: add more tiles */
 	return 0;
 }
 
+int intel_gt_tiles_init(struct drm_i915_private *i915)
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
 void intel_gts_release(struct drm_i915_private *i915)
 {
-	tile_cleanup(&i915->gt);
+	struct intel_gt *gt;
+	unsigned int id;
+
+	for_each_gt(i915, id, gt) {
+		tile_cleanup(gt);
+		i915->gts[id] = NULL;
+	}
 }
 
 void intel_gt_info_print(const struct intel_gt_info *info,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index f4f35a70cbe4..f9dc55adfc4a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -36,7 +36,6 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
 
 void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
 void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt);
-int intel_gt_probe_lmem(struct intel_gt *gt);
 int intel_gt_init_mmio(struct intel_gt *gt);
 int __must_check intel_gt_init_hw(struct intel_gt *gt);
 int intel_gt_init(struct intel_gt *gt);
@@ -86,8 +85,15 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
 u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
 
 int intel_probe_gts(struct drm_i915_private *i915);
+int intel_gt_tiles_init(struct drm_i915_private *i915);
 void intel_gts_release(struct drm_i915_private *i915);
 
+#define for_each_gt(i915__, id__, gt__) \
+	for ((id__) = 0; \
+	     (id__) < I915_MAX_TILES; \
+	     (id__)++) \
+		for_each_if (((gt__) = (i915__)->gts[(id__)]))
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
index 51234fd1349b..44ccf0078ac4 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -578,7 +578,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	intel_gt_init_hw_early(&dev_priv->gt, &dev_priv->ggtt);
 
-	ret = intel_gt_probe_lmem(&dev_priv->gt);
+	ret = intel_gt_tiles_init(dev_priv);
 	if (ret)
 		goto err_mem_regions;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 12256218634f..3a26a21ffb3a 100644
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

