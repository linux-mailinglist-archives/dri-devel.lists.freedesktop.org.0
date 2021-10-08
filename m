Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C27427431
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 01:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4DF6E110;
	Fri,  8 Oct 2021 23:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64566E110;
 Fri,  8 Oct 2021 23:33:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="213558176"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="213558176"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 16:33:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="713948345"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, Andi Shyti <andi.shyti@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 11/11] drm/i915/xehpsdv: Initialize multi-tiles
Date: Fri,  8 Oct 2021 16:33:10 -0700
Message-Id: <20211008233310.2034639-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008215635.2026385-12-matthew.d.roper@intel.com>
References: <20211008215635.2026385-12-matthew.d.roper@intel.com>
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

Check how many extra GT tiles are available on the system and setup
register access for all of them. We can detect how may GT tiles are
available by reading a register on the root tile. The same register
returns the tile ID on all tiles.

v2:
 - Include some additional refactor that didn't get squashed in properly
   on v1.

Bspec: 33407
Original-author: Abdiel Janulgue
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c        | 83 +++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt.h        |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 +
 drivers/gpu/drm/i915/i915_drv.h           |  7 +-
 drivers/gpu/drm/i915/i915_pci.c           | 40 +++++++++--
 drivers/gpu/drm/i915/i915_reg.h           |  4 ++
 drivers/gpu/drm/i915/intel_device_info.h  | 15 ++++
 8 files changed, 145 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2ae57e4656a3..1d9fcf9572ca 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -525,7 +525,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	u16 vdbox_mask;
 	u16 vebox_mask;
 
-	info->engine_mask = INTEL_INFO(i915)->platform_engine_mask;
+	GEM_BUG_ON(!info->engine_mask);
 
 	if (GRAPHICS_VER(i915) < 11)
 		return info->engine_mask;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 6528d21e68eb..0879e30ace7c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -912,14 +912,17 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
 	return intel_uncore_read_fw(gt->uncore, reg);
 }
 
-static int
-tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
+int intel_tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uncore *uncore;
 	struct intel_uncore_mmio_debug *mmio_debug;
 	int ret;
 
+	/* For Modern GENs size of GTTMMADR is 16MB (for each tile) */
+	if (GEM_WARN_ON(pci_resource_len(to_pci_dev(i915->drm.dev), 0) < (id + 1) * SZ_16M))
+		return -EINVAL;
+
 	if (id) {
 		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
 		if (!uncore)
@@ -943,6 +946,16 @@ tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
 	if (ret)
 		return ret;
 
+	/* Which tile am I? default to zero on single tile systems */
+	if (HAS_REMOTE_TILES(i915)) {
+		u32 instance =
+			__raw_uncore_read32(gt->uncore, XEHPSDV_MTCFG_ADDR) &
+			TILE_NUMBER;
+
+		if (GEM_WARN_ON(instance != id))
+			return -ENXIO;
+	}
+
 	gt->phys_addr = phys_addr;
 
 	return 0;
@@ -958,25 +971,87 @@ static void tile_cleanup(struct intel_gt *gt)
 	}
 }
 
+static unsigned int tile_count(struct drm_i915_private *i915)
+{
+	u32 mtcfg;
+
+	/*
+	 * We use raw MMIO reads at this point since the
+	 * MMIO vfuncs are not setup yet
+	 */
+	mtcfg = __raw_uncore_read32(&i915->uncore, XEHPSDV_MTCFG_ADDR);
+	return REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+}
+
 int intel_probe_gts(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	const struct intel_gt_definition *gtdef;
+	struct intel_gt *gt;
 	phys_addr_t phys_addr;
 	unsigned int mmio_bar;
+	unsigned int i, tiles;
 	int ret;
 
 	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
 	phys_addr = pci_resource_start(pdev, mmio_bar);
 
 	/* We always have at least one primary GT on any device */
-	ret = tile_setup(&i915->gt, 0, phys_addr);
+	gt = &i915->gt;
+	gt->name = "Primary GT";
+	gt->info.engine_mask = INTEL_INFO(i915)->platform_engine_mask;
+
+	drm_dbg(&i915->drm, "Setting up %s %u\n", gt->name, gt->info.id);
+	ret = intel_tile_setup(gt, 0, phys_addr);
 	if (ret)
 		return ret;
 
 	i915->gts[0] = &i915->gt;
 
-	/* TODO: add more tiles */
+	tiles = tile_count(i915);
+	drm_dbg(&i915->drm, "Tile count: %u\n", tiles);
+
+	for (gtdef = INTEL_INFO(i915)->extra_gts, i = 1;
+	     gtdef && i < tiles;
+	     gtdef++, i++) {
+		if (GEM_WARN_ON(i >= I915_MAX_GTS)) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		gt = kzalloc(sizeof(*gt), GFP_KERNEL);
+		if (!gt) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		gt->i915 = i915;
+		gt->name = gtdef->name;
+		gt->type = gtdef->type;
+		gt->info.engine_mask = gtdef->engine_mask;
+		gt->info.id = i;
+
+		drm_dbg(&i915->drm, "Setting up %s %u\n", gt->name, gt->info.id);
+		ret = intel_tile_setup(gt, i, phys_addr + gtdef->mapping_base);
+		if (ret)
+			goto err;
+
+		i915->gts[i] = gt;
+	}
+
+	i915->remote_tiles = tiles - 1;
+
 	return 0;
+
+err:
+	drm_err(&i915->drm, "Failed to initialize %s %u! (%d)\n", gtdef->name, i, ret);
+
+	for_each_gt(i915, i, gt) {
+		tile_cleanup(gt);
+		i915->gts[i] = NULL;
+	}
+
+	return ret;
 }
 
 int intel_gt_tiles_init(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index f9dc55adfc4a..00d483db8eb1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -49,6 +49,8 @@ void intel_gt_driver_late_release(struct intel_gt *gt);
 
 int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
 
+int intel_tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr);
+
 void intel_gt_check_and_clear_faults(struct intel_gt *gt);
 void intel_gt_clear_error_registers(struct intel_gt *gt,
 				    intel_engine_mask_t engine_mask);
@@ -90,7 +92,7 @@ void intel_gts_release(struct drm_i915_private *i915);
 
 #define for_each_gt(i915__, id__, gt__) \
 	for ((id__) = 0; \
-	     (id__) < I915_MAX_TILES; \
+	     (id__) < I915_MAX_GTS; \
 	     (id__)++) \
 		for_each_if (((gt__) = (i915__)->gts[(id__)]))
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 7311e485faae..345090e2bafd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -68,6 +68,9 @@ enum intel_submission_method {
 
 struct intel_gt {
 	struct drm_i915_private *i915;
+	const char *name;
+	enum intel_gt_type type;
+
 	struct intel_uncore *uncore;
 	struct i915_ggtt *ggtt;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3a26a21ffb3a..97920340b5e0 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -865,6 +865,8 @@ struct drm_i915_private {
 	 */
 	resource_size_t stolen_usable_size;	/* Total size minus reserved ranges */
 
+	unsigned int remote_tiles;
+
 	struct intel_uncore uncore;
 	struct intel_uncore_mmio_debug mmio_debug;
 
@@ -1196,8 +1198,8 @@ struct drm_i915_private {
 	/*
 	 * i915->gts[0] == &i915->gt
 	 */
-#define I915_MAX_TILES 4
-	struct intel_gt *gts[I915_MAX_TILES];
+#define I915_MAX_GTS 4
+	struct intel_gt *gts[I915_MAX_GTS];
 
 	struct {
 		struct i915_gem_contexts {
@@ -1724,6 +1726,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
 #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
+#define HAS_REMOTE_TILES(dev_priv)   (INTEL_INFO(dev_priv)->has_remote_tiles)
 
 #define HAS_GT_UC(dev_priv)	(INTEL_INFO(dev_priv)->has_gt_uc)
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 169837de395d..2fd45321318a 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -29,6 +29,7 @@
 
 #include "i915_drv.h"
 #include "i915_pci.h"
+#include "gt/intel_gt.h"
 
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
@@ -1008,6 +1009,37 @@ static const struct intel_device_info adl_p_info = {
 	.media_ver = 12, \
 	.media_rel = 50
 
+#define XE_HP_SDV_ENGINES \
+	BIT(BCS0) | \
+	BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) | \
+	BIT(VCS0) | BIT(VCS1) | BIT(VCS2) | BIT(VCS3) | \
+	BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7)
+
+static const struct intel_gt_definition xehp_sdv_gts[] = {
+	{
+		.type = GT_TILE,
+		.name = "Remote Tile GT",
+		.mapping_base = SZ_16M,
+		.engine_mask = XE_HP_SDV_ENGINES,
+
+	},
+	{
+		.type = GT_TILE,
+		.name = "Remote Tile GT",
+		.mapping_base = SZ_16M * 2,
+		.engine_mask = XE_HP_SDV_ENGINES,
+
+	},
+	{
+		.type = GT_TILE,
+		.name = "Remote Tile GT",
+		.mapping_base = SZ_16M * 3,
+		.engine_mask = XE_HP_SDV_ENGINES,
+
+	},
+	{}
+};
+
 __maybe_unused
 static const struct intel_device_info xehpsdv_info = {
 	XE_HP_FEATURES,
@@ -1015,12 +1047,10 @@ static const struct intel_device_info xehpsdv_info = {
 	DGFX_FEATURES,
 	PLATFORM(INTEL_XEHPSDV),
 	.display = { },
+	.extra_gts = xehp_sdv_gts,
+	.has_remote_tiles = 1,
 	.pipe_mask = 0,
-	.platform_engine_mask =
-		BIT(RCS0) | BIT(BCS0) |
-		BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) |
-		BIT(VCS0) | BIT(VCS1) | BIT(VCS2) | BIT(VCS3) |
-		BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7),
+	.platform_engine_mask = XE_HP_SDV_ENGINES,
 	.require_force_probe = 1,
 };
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index a897f4abea0c..5d13c19e14aa 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12477,6 +12477,10 @@ enum skl_power_gate {
 
 #define GEN12_GLOBAL_MOCS(i)	_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
 
+#define XEHPSDV_MTCFG_ADDR			_MMIO(0x101800)
+#define   TILE_COUNT			REG_GENMASK(15, 8)
+#define   TILE_NUMBER			REG_GENMASK(7, 0)
+
 #define GEN12_GSMBASE			_MMIO(0x108100)
 #define GEN12_DSMBASE			_MMIO(0x1080C0)
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 8e6f48d1eb7b..e0b8758b4085 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -136,6 +136,7 @@ enum intel_ppgtt_type {
 	func(has_pxp); \
 	func(has_rc6); \
 	func(has_rc6p); \
+	func(has_remote_tiles); \
 	func(has_rps); \
 	func(has_runtime_pm); \
 	func(has_snoop); \
@@ -166,6 +167,18 @@ enum intel_ppgtt_type {
 	func(overlay_needs_physical); \
 	func(supports_tv);
 
+enum intel_gt_type {
+	GT_PRIMARY,
+	GT_TILE,
+};
+
+struct intel_gt_definition {
+	enum intel_gt_type type;
+	char *name;
+	u32 mapping_base;
+	intel_engine_mask_t engine_mask;
+};
+
 struct intel_device_info {
 	u8 graphics_ver;
 	u8 graphics_rel;
@@ -185,6 +198,8 @@ struct intel_device_info {
 
 	u32 memory_regions; /* regions supported by the HW */
 
+	const struct intel_gt_definition *extra_gts;
+
 	u32 display_mmio_offset;
 
 	u8 gt; /* GT number, 0 if undefined */
-- 
2.33.0

