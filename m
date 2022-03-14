Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E54D9083
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C68810E1D4;
	Mon, 14 Mar 2022 23:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F218D89F8B;
 Mon, 14 Mar 2022 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647301331; x=1678837331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Zp8B8+TaLEPpOa0oHQVYQD2QeWBQeiPjlEPTyJnKXc=;
 b=LzGIaEGVLDg4wACYbILULlZidbjulUyXr4Ow9gvhbLFhZ8Iw/8tnpBbo
 nZrxYIip4ZaWyv75h+h1H9Aph2zZ7KgthT6K+xxCM1QnGhFCFWob++1xf
 fLvHv84O87ILor94cK2YoxJR6NGCB2X3p1suq77O2YgK2UYrjALfXDshH
 fjLz6HoY5iJJbKE/RUB6k6f3tEWv+XyStT2BqzANyYuqRfXvZj+jVTqYU
 N9GEMSDilh/qLMg4QT+rIzIgRRKBuaQOcwut3a1iF2osER/WgYdQJYZKM
 AOlc29pNGGhMBIgt8aKknUxVkbjTqMQ0ld2/hVlbRoLX78dMTz4RoHvc8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256359975"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="256359975"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:42:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="549403064"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:42:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/guc: add steering info to GuC register
 save/restore list
Date: Mon, 14 Mar 2022 16:42:02 -0700
Message-Id: <20220314234203.799268-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314234203.799268-1-matthew.d.roper@intel.com>
References: <20220314234203.799268-1-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

GuC has its own steering mechanism and can't use the default set by i915,
so we need to provide the steering information that the FW will need to
save/restore registers while processing an engine reset. The GUC
interface allows us to do so as part of the register save/restore list
and it requires us to specify the steering for all multicast register, even
those that would be covered by the default setting for cpu access. Given
that we do not distinguish between registers that do not need steering and
registers that are guaranteed to work the default steering, we set the
steering for all entries in the guc list that do not require a special
steering (e.g. mslice) to the default settings; this will cost us a few
extra writes during engine reset but allows us to keep the steering
logic simple.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 29 +++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h          |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 54 +++++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  3 ++
 4 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 041add4019fc..a5f01a8601e1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -919,6 +919,35 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
 	return intel_uncore_read_fw(gt->uncore, reg);
 }
 
+/**
+ * intel_gt_get_valid_steering_for_reg - get a valid steering for a register
+ * @gt: GT structure
+ * @reg: register for which the steering is required
+ * @sliceid: return variable for slice steering
+ * @subsliceid: return variable for subslice steering
+ *
+ * This function returns a slice/subslice pair that is guaranteed to work for
+ * read steering of the given register. Note that a value will be returned even
+ * if the register is not replicated and therefore does not actually require
+ * steering.
+ */
+void intel_gt_get_valid_steering_for_reg(struct intel_gt *gt, i915_reg_t reg,
+					 u8 *sliceid, u8 *subsliceid)
+{
+	int type;
+
+	for (type = 0; type < NUM_STEERING_TYPES; type++) {
+		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
+			intel_gt_get_valid_steering(gt, type, sliceid,
+						    subsliceid);
+			return;
+		}
+	}
+
+	*sliceid = gt->default_steering.groupid;
+	*subsliceid = gt->default_steering.instanceid;
+}
+
 u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
 {
 	int type;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 3edece1865e4..996f8f3c17b9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -84,6 +84,9 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
 	return gt->steering_table[type];
 }
 
+void intel_gt_get_valid_steering_for_reg(struct intel_gt *gt, i915_reg_t reg,
+					 u8 *sliceid, u8 *subsliceid);
+
 u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
 u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index acc4a3766dc1..feb372fc0b48 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -276,15 +276,24 @@ __mmio_reg_add(struct temp_regset *regset, struct guc_mmio_reg *reg)
 	return slot;
 }
 
-static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
-					  u32 offset, u32 flags)
+#define GUC_REGSET_STEERING(group, instance) ( \
+	FIELD_PREP(GUC_REGSET_STEERING_GROUP, (group)) | \
+	FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, (instance)) | \
+	GUC_REGSET_NEEDS_STEERING \
+)
+
+static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
+					  struct temp_regset *regset,
+					  i915_reg_t reg, u32 flags)
 {
 	u32 count = regset->storage_used - (regset->registers - regset->storage);
-	struct guc_mmio_reg reg = {
+	u32 offset = i915_mmio_reg_offset(reg);
+	struct guc_mmio_reg entry = {
 		.offset = offset,
 		.flags = flags,
 	};
 	struct guc_mmio_reg *slot;
+	u8 group, inst;
 
 	/*
 	 * The mmio list is built using separate lists within the driver.
@@ -292,11 +301,22 @@ static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
 	 * register more than once. Do not consider this an error; silently
 	 * move on if the register is already in the list.
 	 */
-	if (bsearch(&reg, regset->registers, count,
-		    sizeof(reg), guc_mmio_reg_cmp))
+	if (bsearch(&entry, regset->registers, count,
+		    sizeof(entry), guc_mmio_reg_cmp))
 		return 0;
 
-	slot = __mmio_reg_add(regset, &reg);
+	/*
+	 * The GuC doesn't have a default steering, so we need to explicitly
+	 * steer all registers that need steering. However, we do not keep track
+	 * of all the steering ranges, only of those that have a chance of using
+	 * a non-default steering from the i915 pov. Instead of adding such
+	 * tracking, it is easier to just program the default steering for all
+	 * regs that don't need a non-default one.
+	 */
+	intel_gt_get_valid_steering_for_reg(gt, reg, &group, &inst);
+	entry.flags |= GUC_REGSET_STEERING(group, inst);
+
+	slot = __mmio_reg_add(regset, &entry);
 	if (IS_ERR(slot))
 		return PTR_ERR(slot);
 
@@ -311,14 +331,16 @@ static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
 	return 0;
 }
 
-#define GUC_MMIO_REG_ADD(regset, reg, masked) \
-	guc_mmio_reg_add(regset, \
-			 i915_mmio_reg_offset((reg)), \
+#define GUC_MMIO_REG_ADD(gt, regset, reg, masked) \
+	guc_mmio_reg_add(gt, \
+			 regset, \
+			 (reg), \
 			 (masked) ? GUC_REGSET_MASKED : 0)
 
 static int guc_mmio_regset_init(struct temp_regset *regset,
 				struct intel_engine_cs *engine)
 {
+	struct intel_gt *gt = engine->gt;
 	const u32 base = engine->mmio_base;
 	struct i915_wa_list *wal = &engine->wa_list;
 	struct i915_wa *wa;
@@ -331,26 +353,26 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	 */
 	regset->registers = regset->storage + regset->storage_used;
 
-	ret |= GUC_MMIO_REG_ADD(regset, RING_MODE_GEN7(base), true);
-	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
-	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
+	ret |= GUC_MMIO_REG_ADD(gt, regset, RING_MODE_GEN7(base), true);
+	ret |= GUC_MMIO_REG_ADD(gt, regset, RING_HWS_PGA(base), false);
+	ret |= GUC_MMIO_REG_ADD(gt, regset, RING_IMR(base), false);
 
 	if ((engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) &&
 	    CCS_MASK(engine->gt))
-		ret |= GUC_MMIO_REG_ADD(regset, GEN12_RCU_MODE, true);
+		ret |= GUC_MMIO_REG_ADD(gt, regset, GEN12_RCU_MODE, true);
 
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
-		ret |= GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
+		ret |= GUC_MMIO_REG_ADD(gt, regset, wa->reg, wa->masked_reg);
 
 	/* Be extra paranoid and include all whitelist registers. */
 	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
-		ret |= GUC_MMIO_REG_ADD(regset,
+		ret |= GUC_MMIO_REG_ADD(gt, regset,
 					RING_FORCE_TO_NONPRIV(base, i),
 					false);
 
 	/* add in local MOCS registers */
 	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
-		ret |= GUC_MMIO_REG_ADD(regset, GEN9_LNCFCMOCS(i), false);
+		ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
 
 	return ret ? -1 : 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index a4a6136b3616..78590372b85f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -287,8 +287,11 @@ struct guc_mmio_reg {
 	u32 flags;
 	u32 mask;
 #define GUC_REGSET_MASKED		BIT(0)
+#define GUC_REGSET_NEEDS_STEERING	BIT(1)
 #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
 #define GUC_REGSET_RESTORE_ONLY		BIT(3)
+#define GUC_REGSET_STEERING_GROUP	GENMASK(15, 12)
+#define GUC_REGSET_STEERING_INSTANCE	GENMASK(23, 20)
 } __packed;
 
 /* GuC register sets */
-- 
2.34.1

