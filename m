Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44656E857B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3182B10EB38;
	Wed, 19 Apr 2023 22:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C31210E218;
 Wed, 19 Apr 2023 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681945186; x=1713481186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=is7aksJufQEKSAzaUhOkreksToGuJ2iQZb14z1RyDgc=;
 b=fJ31YZdOwwHB50HBkSuKN2RCzReR+vfdPEw0qg2aJdX9GRU+ejG7/nO6
 6SAYpPSrjSJR0azUsbQ3OyXm0MmRyrri4jfO5psPW76o0Ez/rId/kR67y
 FdU1veJbYn/TJh3SbFCg8wg2d+aEgBJn/1MraJbhMIGo96PbuZIEkUMuG
 8dH+iYIKR16aSKJfMDwyUEmBlf+BPRw+IJD4VzTfC3rUrKzzTC+84ecFv
 aQIo8jCBsvyz0mbCQ0oPzfdqW0o3+2zSeJXT3JXMfPuSeueNyKQ4Eo4OR
 VvSyVYG2Uof/g29m8+5H34sf3RBU59eCy6tb4MGAOEO2fVFokwKAMgmOw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431858534"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="431858534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815787124"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="815787124"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:59:46 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables for MTL
Date: Wed, 19 Apr 2023 16:00:52 -0700
Message-Id: <20230419230058.2659455-3-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419230058.2659455-1-fei.yang@intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>

On MTL, GT can no longer allocate on LLC - only the CPU can.
This, along with addition of support for L4 cache calls for
a MOCS/PAT table update.
Also the PAT index registers are multicasted for primary GT,
and there is an address jump from index 7 to 8. This patch
makes sure that these registers are programmed in the proper
way.

BSpec: 44509, 45101, 44235

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 ++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h     | 20 ++++++-
 drivers/gpu/drm/i915/gt/intel_mocs.c    | 76 +++++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/selftest_mocs.c |  2 +-
 5 files changed, 143 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index fd1f9cd35e9d..e8c3b762a92a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -356,7 +356,11 @@
 #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
 
 #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
-#define XEHP_PAT_INDEX(index)			MCR_REG(0x4800 + (index) * 4)
+#define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
+								   0x4800, 0x4804, \
+								   0x4848, 0x484c)
+#define XEHP_PAT_INDEX(index)			MCR_REG(_PAT_INDEX(index))
+#define XELPMP_PAT_INDEX(index)			_MMIO(_PAT_INDEX(index))
 
 #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
 #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 4f436ba7a3c8..2f6a9be0ffe6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -468,6 +468,44 @@ void gtt_write_workarounds(struct intel_gt *gt)
 	}
 }
 
+static void xelpmp_setup_private_ppat(struct intel_uncore *uncore)
+{
+	intel_uncore_write(uncore, XELPMP_PAT_INDEX(0),
+			   MTL_PPAT_L4_0_WB);
+	intel_uncore_write(uncore, XELPMP_PAT_INDEX(1),
+			   MTL_PPAT_L4_1_WT);
+	intel_uncore_write(uncore, XELPMP_PAT_INDEX(2),
+			   MTL_PPAT_L4_3_UC);
+	intel_uncore_write(uncore, XELPMP_PAT_INDEX(3),
+			   MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
+	intel_uncore_write(uncore, XELPMP_PAT_INDEX(4),
+			   MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
+
+	/*
+	 * Remaining PAT entries are left at the hardware-default
+	 * fully-cached setting
+	 */
+}
+
+static void xelpg_setup_private_ppat(struct intel_gt *gt)
+{
+	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0),
+				     MTL_PPAT_L4_0_WB);
+	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1),
+				     MTL_PPAT_L4_1_WT);
+	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2),
+				     MTL_PPAT_L4_3_UC);
+	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3),
+				     MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
+	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4),
+				     MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
+
+	/*
+	 * Remaining PAT entries are left at the hardware-default
+	 * fully-cached setting
+	 */
+}
+
 static void tgl_setup_private_ppat(struct intel_uncore *uncore)
 {
 	/* TGL doesn't support LLC or AGE settings */
@@ -603,7 +641,14 @@ void setup_private_pat(struct intel_gt *gt)
 
 	GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+	if (gt->type == GT_MEDIA) {
+		xelpmp_setup_private_ppat(gt->uncore);
+		return;
+	}
+
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		xelpg_setup_private_ppat(gt);
+	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
 		xehp_setup_private_ppat(gt);
 	else if (GRAPHICS_VER(i915) >= 12)
 		tgl_setup_private_ppat(uncore);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 69ce55f517f5..854ec09fd588 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
 #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
 #define BYT_PTE_WRITEABLE		REG_BIT(1)
 
+#define MTL_PPGTT_PTE_PAT3	BIT_ULL(62)
 #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
+#define GEN12_PPGTT_PTE_PAT2	BIT_ULL(7)
+#define GEN12_PPGTT_PTE_NC	BIT_ULL(5)
+#define GEN12_PPGTT_PTE_PAT1	BIT_ULL(4)
+#define GEN12_PPGTT_PTE_PAT0	BIT_ULL(3)
 
-#define GEN12_GGTT_PTE_LM	BIT_ULL(1)
+#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
+#define MTL_GGTT_PTE_PAT0		BIT_ULL(52)
+#define MTL_GGTT_PTE_PAT1		BIT_ULL(53)
+#define GEN12_GGTT_PTE_ADDR_MASK	GENMASK_ULL(45, 12)
+#define MTL_GGTT_PTE_PAT_MASK		GENMASK_ULL(53, 52)
 
 #define GEN12_PDE_64K BIT(6)
 #define GEN12_PTE_PS64 BIT(8)
@@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;
 #define GEN8_PDE_IPS_64K BIT(11)
 #define GEN8_PDE_PS_2M   BIT(7)
 
+#define MTL_PPAT_L4_CACHE_POLICY_MASK	REG_GENMASK(3, 2)
+#define MTL_PAT_INDEX_COH_MODE_MASK	REG_GENMASK(1, 0)
+#define MTL_PPAT_L4_3_UC	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
+#define MTL_PPAT_L4_1_WT	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
+#define MTL_PPAT_L4_0_WB	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
+#define MTL_3_COH_2W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
+#define MTL_2_COH_1W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
+#define MTL_0_COH_NON	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
+
 enum i915_cache_level;
 
 struct drm_i915_gem_object;
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 69b489e8dfed..89570f137b2c 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
 #define LE_COS(value)		((value) << 15)
 #define LE_SSE(value)		((value) << 17)
 
+/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
+#define _L4_CACHEABILITY(value)	((value) << 2)
+#define IG_PAT(value)		((value) << 8)
+
 /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
 #define L3_ESC(value)		((value) << 0)
 #define L3_SCC(value)		((value) << 1)
@@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
 /* Helper defines */
 #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
 #define PVC_NUM_MOCS_ENTRIES	3
+#define MTL_NUM_MOCS_ENTRIES	16
 
 /* (e)LLC caching options */
 /*
@@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
 #define L3_2_RESERVED		_L3_CACHEABILITY(2)
 #define L3_3_WB			_L3_CACHEABILITY(3)
 
+/* L4 caching options */
+#define L4_0_WB			_L4_CACHEABILITY(0)
+#define L4_1_WT			_L4_CACHEABILITY(1)
+#define L4_2_RESERVED		_L4_CACHEABILITY(2)
+#define L4_3_UC			_L4_CACHEABILITY(3)
+
 #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
 	[__idx] = { \
 		.control_value = __control_value, \
@@ -416,6 +427,57 @@ static const struct drm_i915_mocs_entry pvc_mocs_table[] = {
 	MOCS_ENTRY(2, 0, L3_3_WB),
 };
 
+static const struct drm_i915_mocs_entry mtl_mocs_table[] = {
+	/* Error - Reserved for Non-Use */
+	MOCS_ENTRY(0,
+		   IG_PAT(0),
+		   L3_LKUP(1) | L3_3_WB),
+	/* Cached - L3 + L4 */
+	MOCS_ENTRY(1,
+		   IG_PAT(1),
+		   L3_LKUP(1) | L3_3_WB),
+	/* L4 - GO:L3 */
+	MOCS_ENTRY(2,
+		   IG_PAT(1),
+		   L3_LKUP(1) | L3_1_UC),
+	/* Uncached - GO:L3 */
+	MOCS_ENTRY(3,
+		   IG_PAT(1) | L4_3_UC,
+		   L3_LKUP(1) | L3_1_UC),
+	/* L4 - GO:Mem */
+	MOCS_ENTRY(4,
+		   IG_PAT(1),
+		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
+	/* Uncached - GO:Mem */
+	MOCS_ENTRY(5,
+		   IG_PAT(1) | L4_3_UC,
+		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
+	/* L4 - L3:NoLKUP; GO:L3 */
+	MOCS_ENTRY(6,
+		   IG_PAT(1),
+		   L3_1_UC),
+	/* Uncached - L3:NoLKUP; GO:L3 */
+	MOCS_ENTRY(7,
+		   IG_PAT(1) | L4_3_UC,
+		   L3_1_UC),
+	/* L4 - L3:NoLKUP; GO:Mem */
+	MOCS_ENTRY(8,
+		   IG_PAT(1),
+		   L3_GLBGO(1) | L3_1_UC),
+	/* Uncached - L3:NoLKUP; GO:Mem */
+	MOCS_ENTRY(9,
+		   IG_PAT(1) | L4_3_UC,
+		   L3_GLBGO(1) | L3_1_UC),
+	/* Display - L3; L4:WT */
+	MOCS_ENTRY(14,
+		   IG_PAT(1) | L4_1_WT,
+		   L3_LKUP(1) | L3_3_WB),
+	/* CCS - Non-Displayable */
+	MOCS_ENTRY(15,
+		   IG_PAT(1),
+		   L3_GLBGO(1) | L3_1_UC),
+};
+
 enum {
 	HAS_GLOBAL_MOCS = BIT(0),
 	HAS_ENGINE_MOCS = BIT(1),
@@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
 	memset(table, 0, sizeof(struct drm_i915_mocs_table));
 
 	table->unused_entries_index = I915_MOCS_PTE;
-	if (IS_PONTEVECCHIO(i915)) {
+	if (IS_METEORLAKE(i915)) {
+		table->size = ARRAY_SIZE(mtl_mocs_table);
+		table->table = mtl_mocs_table;
+		table->n_entries = MTL_NUM_MOCS_ENTRIES;
+		table->uc_index = 9;
+		table->unused_entries_index = 1;
+	} else if (IS_PONTEVECCHIO(i915)) {
 		table->size = ARRAY_SIZE(pvc_mocs_table);
 		table->table = pvc_mocs_table;
 		table->n_entries = PVC_NUM_MOCS_ENTRIES;
@@ -646,9 +714,9 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
 		init_l3cc_table(engine->gt, &table);
 }
 
-static u32 global_mocs_offset(void)
+static u32 global_mocs_offset(struct intel_gt *gt)
 {
-	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
+	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) + gt->uncore->gsi_offset;
 }
 
 void intel_set_mocs_index(struct intel_gt *gt)
@@ -671,7 +739,7 @@ void intel_mocs_init(struct intel_gt *gt)
 	 */
 	flags = get_mocs_settings(gt->i915, &table);
 	if (flags & HAS_GLOBAL_MOCS)
-		__init_mocs_table(gt->uncore, &table, global_mocs_offset());
+		__init_mocs_table(gt->uncore, &table, global_mocs_offset(gt));
 
 	/*
 	 * Initialize the L3CC table as part of mocs initalization to make
diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index ca009a6a13bd..730796346514 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
 		return 0;
 
 	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
-		addr = global_mocs_offset();
+		addr = global_mocs_offset(rq->engine->gt);
 	else
 		addr = mocs_offset(rq->engine);
 
-- 
2.25.1

