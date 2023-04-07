Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8400A6DA944
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 09:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2439E10EDAC;
	Fri,  7 Apr 2023 07:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E68D10ED85;
 Fri,  7 Apr 2023 07:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680851484; x=1712387484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZoFfqXleI2w1qqOsWdD4Dnj4NQUFNvoiH7bECD0rs0=;
 b=KJ6h0Yu+MUKwgN4SXKRaLD62VrvuUAs+wMIUbw6do5Lwu3sHPGZH7bYg
 9m0xrHK7C7X1ipP3DYzzFixf7WzkfiU3q9pLyG9qznGSRkJ+wcSoRg5OB
 7Eb4dxaRWpcXbsuaHuZY9ONRmZ6u8SZng3Sepg8ngFVEIQmur8/rqjNoE
 /vfjyirehCoUEUFCBd5MXhBA2BPHv7YLTc/p4tQMPnZRBVcz6yxC98xLx
 OPDYtfk0lYELe9T/p0clpkItTAD4X4RSVmYzSz0Qcex7RdRI6xMhGVIFd
 rq/fwR1r6quTAxE2f6mtWXx0fyHHf6JnN+UxTO9g+qR/l7xR6Ajj5IWcf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344711195"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="344711195"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 00:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680953425"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="680953425"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 00:11:12 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915: preparation for using PAT index
Date: Fri,  7 Apr 2023 00:12:33 -0700
Message-Id: <20230407071236.1960642-6-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407071236.1960642-1-fei.yang@intel.com>
References: <20230407071236.1960642-1-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

This patch is a preparation for replacing enum i915_cache_level with PAT
index. Caching policy for buffer objects is set through the PAT index in
PTE, the old i915_cache_level is not sufficient to represent all caching
modes supported by the hardware.

Preparing the transition by adding some platform dependent data structures
and helper functions to translate the cache_level to pat_index.

cachelevel_to_pat: a platform dependent array mapping cache_level to
                   pat_index.

max_pat_index: the maximum PAT index supported by the hardware. Needed for
               validating the PAT index passed in from user space.

i915_gem_get_pat_index: function to convert cache_level to PAT index.

obj_to_i915(obj): macro moved to header file for wider usage.

I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
                      convenience of coding.

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  9 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  4 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  6 ++
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  6 ++
 drivers/gpu/drm/i915/i915_pci.c               | 75 +++++++++++++++++--
 drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  6 ++
 9 files changed, 104 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 4666bb82f312..8c70a0ec7d2f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -45,6 +45,15 @@ static struct kmem_cache *slab_objects;
 
 static const struct drm_gem_object_funcs i915_gem_object_funcs;
 
+unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
+				    enum i915_cache_level level)
+{
+	if (drm_WARN_ON(&i915->drm, level >= I915_MAX_CACHE_LEVEL))
+		return 0;
+
+	return INTEL_INFO(i915)->cachelevel_to_pat[level];
+}
+
 struct drm_i915_gem_object *i915_gem_object_alloc(void)
 {
 	struct drm_i915_gem_object *obj;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 885ccde9dc3c..4c92e17b4337 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -20,6 +20,8 @@
 
 enum intel_region_id;
 
+#define obj_to_i915(obj__) to_i915((obj__)->base.dev)
+
 static inline bool i915_gem_object_size_2big(u64 size)
 {
 	struct drm_i915_gem_object *obj;
@@ -30,6 +32,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
 	return false;
 }
 
+unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
+				    enum i915_cache_level level);
 void i915_gem_init__objects(struct drm_i915_private *i915);
 
 void i915_objects_module_exit(void);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 5dcbbef31d44..890f3ad497c5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -194,6 +194,7 @@ enum i915_cache_level {
 	 * engine.
 	 */
 	I915_CACHE_WT,
+	I915_MAX_CACHE_LEVEL,
 };
 
 enum i915_map_type {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index b1672e054b21..214763942aa2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -460,8 +460,6 @@ void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
 	fs_reclaim_release(GFP_KERNEL);
 }
 
-#define obj_to_i915(obj__) to_i915((obj__)->base.dev)
-
 /**
  * i915_gem_object_make_unshrinkable - Hide the object from the shrinker. By
  * default all object types that support shrinking(see IS_SHRINKABLE), will also
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 11b91e0453c8..7a4b1d1afce9 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -78,6 +78,12 @@ static u64 mtl_pte_encode(dma_addr_t addr,
 	case I915_CACHE_WT:
 		pte |= GEN12_PPGTT_PTE_PAT0;
 		break;
+	default:
+		/* This should never happen. Added to deal with the compile
+		 * error due to the addition of I915_MAX_CACHE_LEVEL. Will
+		 * be removed by the pat_index patch.
+		 */
+		break;
 	}
 
 	return pte;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index ba3109338aee..91056b9a60a9 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -242,6 +242,12 @@ u64 mtl_ggtt_pte_encode(dma_addr_t addr,
 	case I915_CACHE_WT:
 		pte |= MTL_GGTT_PTE_PAT0;
 		break;
+	default:
+		/* This should never happen. Added to deal with the compile
+		 * error due to the addition of I915_MAX_CACHE_LEVEL. Will
+		 * be removed by the pat_index patch.
+		 */
+		break;
 	}
 
 	return pte;
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 025d32c0b161..8c7e7bd4db79 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -29,6 +29,7 @@
 #include "display/intel_display.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_sa_media.h"
+#include "gem/i915_gem_object_types.h"
 
 #include "i915_driver.h"
 #include "i915_drv.h"
@@ -163,6 +164,38 @@
 		.gamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING, \
 	}
 
+#define LEGACY_CACHELEVEL \
+	.cachelevel_to_pat = { \
+		[I915_CACHE_NONE]   = 0, \
+		[I915_CACHE_LLC]    = 1, \
+		[I915_CACHE_L3_LLC] = 2, \
+		[I915_CACHE_WT]     = 3, \
+	}
+
+#define TGL_CACHELEVEL \
+	.cachelevel_to_pat = { \
+		[I915_CACHE_NONE]   = 3, \
+		[I915_CACHE_LLC]    = 0, \
+		[I915_CACHE_L3_LLC] = 0, \
+		[I915_CACHE_WT]     = 2, \
+	}
+
+#define PVC_CACHELEVEL \
+	.cachelevel_to_pat = { \
+		[I915_CACHE_NONE]   = 0, \
+		[I915_CACHE_LLC]    = 3, \
+		[I915_CACHE_L3_LLC] = 3, \
+		[I915_CACHE_WT]     = 2, \
+	}
+
+#define MTL_CACHELEVEL \
+	.cachelevel_to_pat = { \
+		[I915_CACHE_NONE]   = 2, \
+		[I915_CACHE_LLC]    = 3, \
+		[I915_CACHE_L3_LLC] = 3, \
+		[I915_CACHE_WT]     = 1, \
+	}
+
 /* Keep in gen based order, and chronological order within a gen */
 
 #define GEN_DEFAULT_PAGE_SIZES \
@@ -188,11 +221,13 @@
 	.has_snoop = true, \
 	.has_coherent_ggtt = false, \
 	.dma_mask_size = 32, \
+	.max_pat_index = 3, \
 	I9XX_PIPE_OFFSETS, \
 	I9XX_CURSOR_OFFSETS, \
 	I9XX_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
-	GEN_DEFAULT_REGIONS
+	GEN_DEFAULT_REGIONS, \
+	LEGACY_CACHELEVEL
 
 #define I845_FEATURES \
 	GEN(2), \
@@ -209,11 +244,13 @@
 	.has_snoop = true, \
 	.has_coherent_ggtt = false, \
 	.dma_mask_size = 32, \
+	.max_pat_index = 3, \
 	I845_PIPE_OFFSETS, \
 	I845_CURSOR_OFFSETS, \
 	I845_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
-	GEN_DEFAULT_REGIONS
+	GEN_DEFAULT_REGIONS, \
+	LEGACY_CACHELEVEL
 
 static const struct intel_device_info i830_info = {
 	I830_FEATURES,
@@ -248,11 +285,13 @@ static const struct intel_device_info i865g_info = {
 	.has_snoop = true, \
 	.has_coherent_ggtt = true, \
 	.dma_mask_size = 32, \
+	.max_pat_index = 3, \
 	I9XX_PIPE_OFFSETS, \
 	I9XX_CURSOR_OFFSETS, \
 	I9XX_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
-	GEN_DEFAULT_REGIONS
+	GEN_DEFAULT_REGIONS, \
+	LEGACY_CACHELEVEL
 
 static const struct intel_device_info i915g_info = {
 	GEN3_FEATURES,
@@ -340,11 +379,13 @@ static const struct intel_device_info pnv_m_info = {
 	.has_snoop = true, \
 	.has_coherent_ggtt = true, \
 	.dma_mask_size = 36, \
+	.max_pat_index = 3, \
 	I9XX_PIPE_OFFSETS, \
 	I9XX_CURSOR_OFFSETS, \
 	I9XX_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
-	GEN_DEFAULT_REGIONS
+	GEN_DEFAULT_REGIONS, \
+	LEGACY_CACHELEVEL
 
 static const struct intel_device_info i965g_info = {
 	GEN4_FEATURES,
@@ -394,11 +435,13 @@ static const struct intel_device_info gm45_info = {
 	/* ilk does support rc6, but we do not implement [power] contexts */ \
 	.has_rc6 = 0, \
 	.dma_mask_size = 36, \
+	.max_pat_index = 3, \
 	I9XX_PIPE_OFFSETS, \
 	I9XX_CURSOR_OFFSETS, \
 	ILK_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
-	GEN_DEFAULT_REGIONS
+	GEN_DEFAULT_REGIONS, \
+	LEGACY_CACHELEVEL
 
 static const struct intel_device_info ilk_d_info = {
 	GEN5_FEATURES,
@@ -428,13 +471,15 @@ static const struct intel_device_info ilk_m_info = {
 	.has_rc6p = 0, \
 	.has_rps = true, \
 	.dma_mask_size = 40, \
+	.max_pat_index = 3, \
 	.__runtime.ppgtt_type = INTEL_PPGTT_ALIASING, \
 	.__runtime.ppgtt_size = 31, \
 	I9XX_PIPE_OFFSETS, \
 	I9XX_CURSOR_OFFSETS, \
 	ILK_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
-	GEN_DEFAULT_REGIONS
+	GEN_DEFAULT_REGIONS, \
+	LEGACY_CACHELEVEL
 
 #define SNB_D_PLATFORM \
 	GEN6_FEATURES, \
@@ -481,13 +526,15 @@ static const struct intel_device_info snb_m_gt2_info = {
 	.has_reset_engine = true, \
 	.has_rps = true, \
 	.dma_mask_size = 40, \
+	.max_pat_index = 3, \
 	.__runtime.ppgtt_type = INTEL_PPGTT_ALIASING, \
 	.__runtime.ppgtt_size = 31, \
 	IVB_PIPE_OFFSETS, \
 	IVB_CURSOR_OFFSETS, \
 	IVB_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
-	GEN_DEFAULT_REGIONS
+	GEN_DEFAULT_REGIONS, \
+	LEGACY_CACHELEVEL
 
 #define IVB_D_PLATFORM \
 	GEN7_FEATURES, \
@@ -541,6 +588,7 @@ static const struct intel_device_info vlv_info = {
 	.display.has_gmch = 1,
 	.display.has_hotplug = 1,
 	.dma_mask_size = 40,
+	.max_pat_index = 3,
 	.__runtime.ppgtt_type = INTEL_PPGTT_ALIASING,
 	.__runtime.ppgtt_size = 31,
 	.has_snoop = true,
@@ -552,6 +600,7 @@ static const struct intel_device_info vlv_info = {
 	I9XX_COLORS,
 	GEN_DEFAULT_PAGE_SIZES,
 	GEN_DEFAULT_REGIONS,
+	LEGACY_CACHELEVEL,
 };
 
 #define G75_FEATURES  \
@@ -639,6 +688,7 @@ static const struct intel_device_info chv_info = {
 	.has_logical_ring_contexts = 1,
 	.display.has_gmch = 1,
 	.dma_mask_size = 39,
+	.max_pat_index = 3,
 	.__runtime.ppgtt_type = INTEL_PPGTT_FULL,
 	.__runtime.ppgtt_size = 32,
 	.has_reset_engine = 1,
@@ -650,6 +700,7 @@ static const struct intel_device_info chv_info = {
 	CHV_COLORS,
 	GEN_DEFAULT_PAGE_SIZES,
 	GEN_DEFAULT_REGIONS,
+	LEGACY_CACHELEVEL,
 };
 
 #define GEN9_DEFAULT_PAGE_SIZES \
@@ -889,9 +940,11 @@ static const struct intel_device_info jsl_info = {
 		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
 	}, \
 	TGL_CURSOR_OFFSETS, \
+	TGL_CACHELEVEL, \
 	.has_global_mocs = 1, \
 	.has_pxp = 1, \
-	.display.has_dsb = 1
+	.display.has_dsb = 1, \
+	.max_pat_index = 3
 
 static const struct intel_device_info tgl_info = {
 	GEN12_FEATURES,
@@ -1013,6 +1066,7 @@ static const struct intel_device_info adl_p_info = {
 	.__runtime.graphics.ip.ver = 12, \
 	.__runtime.graphics.ip.rel = 50, \
 	XE_HP_PAGE_SIZES, \
+	TGL_CACHELEVEL, \
 	.dma_mask_size = 46, \
 	.has_3d_pipeline = 1, \
 	.has_64bit_reloc = 1, \
@@ -1031,6 +1085,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_reset_engine = 1, \
 	.has_rps = 1, \
 	.has_runtime_pm = 1, \
+	.max_pat_index = 3, \
 	.__runtime.ppgtt_size = 48, \
 	.__runtime.ppgtt_type = INTEL_PPGTT_FULL
 
@@ -1107,11 +1162,13 @@ static const struct intel_device_info pvc_info = {
 	PLATFORM(INTEL_PONTEVECCHIO),
 	NO_DISPLAY,
 	.has_flat_ccs = 0,
+	.max_pat_index = 7,
 	.__runtime.platform_engine_mask =
 		BIT(BCS0) |
 		BIT(VCS0) |
 		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
 	.require_force_probe = 1,
+	PVC_CACHELEVEL,
 };
 
 #define XE_LPDP_FEATURES	\
@@ -1149,9 +1206,11 @@ static const struct intel_device_info mtl_info = {
 	.has_llc = 0,
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
+	.max_pat_index = 4,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
 	.require_force_probe = 1,
+	MTL_CACHELEVEL,
 };
 
 #undef PLATFORM
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 080a4557899b..d737dd601a6e 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -35,6 +35,8 @@
 #include "gt/intel_context_types.h"
 #include "gt/intel_sseu.h"
 
+#include "gem/i915_gem_object_types.h"
+
 struct drm_printer;
 struct drm_i915_private;
 struct intel_gt_definition;
@@ -308,6 +310,9 @@ struct intel_device_info {
 	 * Initial runtime info. Do not access outside of i915_driver_create().
 	 */
 	const struct intel_runtime_info __runtime;
+
+	u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];
+	u32 max_pat_index;
 };
 
 struct intel_driver_caps {
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index f6a7c0bd2955..bc28f7afa54a 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -124,6 +124,7 @@ struct drm_i915_private *mock_gem_device(void)
 #endif
 	struct drm_i915_private *i915;
 	struct pci_dev *pdev;
+	unsigned int i;
 	int ret;
 
 	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
@@ -180,6 +181,11 @@ struct drm_i915_private *mock_gem_device(void)
 		I915_GTT_PAGE_SIZE_2M;
 
 	RUNTIME_INFO(i915)->memory_regions = REGION_SMEM;
+
+	/* simply use legacy cache level for mock device */
+	for (i = 0; i < I915_MAX_CACHE_LEVEL; i++)
+		mkwrite_device_info(i915)->cachelevel_to_pat[i] = i;
+
 	intel_memory_regions_hw_probe(i915);
 
 	spin_lock_init(&i915->gpu_error.lock);
-- 
2.25.1

