Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B98E4ED013
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814C610E9C5;
	Wed, 30 Mar 2022 23:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA9810E1D4;
 Wed, 30 Mar 2022 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682957; x=1680218957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eAgSs0z+RW+rfpC46Ltr/jTdbotR0DHemIw3W7NetFQ=;
 b=MN0YinQZjOqf35soxuERTLTmiu1NswK1pP0vccwOEB2eplQc8H2sfTCX
 ieZVHy66iUGRRowIBu/Kd3mTxUgXtiZs7/6FnRQId1r10FfXTurqjWfTF
 48Z0u4NJhl+r4eelJ/vCf7fF5dnZXk4Tlv+d3Gb9uW75E9k1uqFTHvtoW
 akExL9ydtId/63YDYTb2in7J7ZlGeMYoagKq88nsfkg5CJgYaheQczH1z
 3uau9KTAQ3VMaA/6+qtxnsVFNiihfp4rCJUV5K9uzVB3806daKI7OKX0z
 NV5FKiaiqaukld78cKSVO7coKBFH5DQW6BT7ItVjp8Ry9agVB4rHwGK3R w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582513"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582513"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547052017"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/15] drm/i915/gt: Cleanup interface for MCR operations
Date: Wed, 30 Mar 2022 16:28:53 -0700
Message-Id: <20220330232858.3204283-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330232858.3204283-1-matthew.d.roper@intel.com>
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
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

Let's replace the assortment of intel_gt_* and intel_uncore_* functions
that operate on MCR registers with a cleaner set of interfaces:

  * intel_gt_mcr_read -- unicast read from specific instance
  * intel_gt_mcr_read_any[_fw] -- unicast read from any non-terminated
    instance
  * intel_gt_mcr_unicast_write -- unicast write to specific instance
  * intel_gt_mcr_multicast_write[_fw] -- multicast write to all instances

We'll also replace the historic "slice" and "subslice" terminology with
"group" and "instance" to match the documentation for more recent
platforms; these days MCR steering applies to more types of replication
than just slice/subslice.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   |  33 ++-
 drivers/gpu/drm/i915/gt/intel_gt.c          |  19 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c  |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 225 ++++++++++++--------
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h      |  43 ++--
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |   2 +-
 9 files changed, 184 insertions(+), 152 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 81604af8b2c2..e63de9c06596 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -836,7 +836,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	} else {
 		resource_size_t lmem_range;
 
-		lmem_range = intel_gt_read_register(&i915->gt0, XEHPSDV_TILE0_ADDR_RANGE) & 0xFFFF;
+		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHPSDV_TILE0_ADDR_RANGE) & 0xFFFF;
 		lmem_size = lmem_range >> XEHPSDV_TILE_LMEM_RANGE_SHIFT;
 		lmem_size *= SZ_1G;
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 7e6bd8465ed6..f48e87bfceac 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1326,14 +1326,6 @@ void intel_engine_cancel_stop_cs(struct intel_engine_cs *engine)
 	ENGINE_WRITE_FW(engine, RING_MI_MODE, _MASKED_BIT_DISABLE(STOP_RING));
 }
 
-static u32
-read_subslice_reg(const struct intel_engine_cs *engine,
-		  int slice, int subslice, i915_reg_t reg)
-{
-	return intel_uncore_read_with_mcr_steering(engine->uncore, reg,
-						   slice, subslice);
-}
-
 /* NB: please notice the memset */
 void intel_engine_get_instdone(const struct intel_engine_cs *engine,
 			       struct intel_instdone *instdone)
@@ -1367,28 +1359,33 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
 		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
 			for_each_instdone_gslice_dss_xehp(i915, sseu, iter, slice, subslice) {
 				instdone->sampler[slice][subslice] =
-					read_subslice_reg(engine, slice, subslice,
-							  GEN8_SAMPLER_INSTDONE);
+					intel_gt_mcr_read(engine->gt,
+							  GEN8_SAMPLER_INSTDONE,
+							  slice, subslice);
 				instdone->row[slice][subslice] =
-					read_subslice_reg(engine, slice, subslice,
-							  GEN8_ROW_INSTDONE);
+					intel_gt_mcr_read(engine->gt,
+							  GEN8_ROW_INSTDONE,
+							  slice, subslice);
 			}
 		} else {
 			for_each_instdone_slice_subslice(i915, sseu, slice, subslice) {
 				instdone->sampler[slice][subslice] =
-					read_subslice_reg(engine, slice, subslice,
-							  GEN8_SAMPLER_INSTDONE);
+					intel_gt_mcr_read(engine->gt,
+							  GEN8_SAMPLER_INSTDONE,
+							  slice, subslice);
 				instdone->row[slice][subslice] =
-					read_subslice_reg(engine, slice, subslice,
-							  GEN8_ROW_INSTDONE);
+					intel_gt_mcr_read(engine->gt,
+							  GEN8_ROW_INSTDONE,
+							  slice, subslice);
 			}
 		}
 
 		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
 			for_each_instdone_gslice_dss_xehp(i915, sseu, iter, slice, subslice)
 				instdone->geom_svg[slice][subslice] =
-					read_subslice_reg(engine, slice, subslice,
-							  XEHPG_INSTDONE_GEOM_SVG);
+					intel_gt_mcr_read(engine->gt,
+							  XEHPG_INSTDONE_GEOM_SVG,
+							  slice, subslice);
 		}
 	} else if (GRAPHICS_VER(i915) >= 7) {
 		instdone->instdone =
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 59c1ab591b86..b7c9cbdf3fc8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -288,30 +288,27 @@ static void gen6_check_faults(struct intel_gt *gt)
 
 static void xehp_check_faults(struct intel_gt *gt)
 {
-	struct intel_uncore *uncore = gt->uncore;
 	u32 fault;
 	int mslice;
 
 	/* Check each mslice's fault register */
 	for (mslice = 0; mslice < 4; mslice++) {
-		fault = intel_uncore_read_with_mcr_steering(uncore,
-							    XEHP_RING_FAULT_REG,
-							    mslice, 0);
+		fault = intel_gt_mcr_read(gt, XEHP_RING_FAULT_REG, mslice, 0);
 		if (fault & RING_FAULT_VALID) {
 			u32 fault_data0, fault_data1;
 			u64 fault_addr;
 
-			fault_data0 = intel_uncore_read_with_mcr_steering(uncore,
-									  XEHP_FAULT_TLB_DATA0,
-									  mslice, 0);
-			fault_data1 = intel_uncore_read_with_mcr_steering(uncore,
-									  XEHP_FAULT_TLB_DATA1,
-									  mslice, 0);
+			fault_data0 =
+				intel_gt_mcr_read(gt, XEHP_FAULT_TLB_DATA0,
+						  mslice, 0);
+			fault_data1 =
+				intel_gt_mcr_read(gt, XEHP_FAULT_TLB_DATA1,
+						  mslice, 0);
 
 			fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
 				     ((u64)fault_data0 << 12);
 
-			drm_dbg(&uncore->i915->drm, "Unexpected fault\n"
+			drm_dbg(&gt->i915->drm, "Unexpected fault\n"
 				"\tAddr: 0x%08x_%08x\n"
 				"\tAddress space: %s\n"
 				"\tEngine ID: %d\n"
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index ea07f2bb846f..dd53641f3637 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -65,7 +65,7 @@ static int steering_show(struct seq_file *m, void *data)
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct intel_gt *gt = m->private;
 
-	intel_gt_report_steering(&p, gt, true);
+	intel_gt_mcr_report_steering(&p, gt, true);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 21edee03ce0f..c8e52d625f18 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -103,23 +103,22 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 	}
 }
 
-/**
- * uncore_rw_with_mcr_steering_fw - Access a register after programming
- *				    the MCR selector register.
+/*
+ * rw_with_mcr_steering_fw - Access a register with specific MCR steering
  * @uncore: pointer to struct intel_uncore
  * @reg: register being accessed
  * @rw_flag: FW_REG_READ for read access or FW_REG_WRITE for write access
- * @slice: slice number (ignored for multi-cast write)
- * @subslice: sub-slice number (ignored for multi-cast write)
+ * @group: group number
+ * @instance: instance number
  * @value: register value to be written (ignored for read)
  *
  * Return: 0 for write access. register value for read access.
  *
  * Caller needs to make sure the relevant forcewake wells are up.
  */
-static u32 uncore_rw_with_mcr_steering_fw(struct intel_uncore *uncore,
-					  i915_reg_t reg, u8 rw_flag,
-					  int slice, int subslice, u32 value)
+static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
+				   i915_reg_t reg, u8 rw_flag,
+				   int group, int instance, u32 value)
 {
 	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
 
@@ -127,7 +126,7 @@ static u32 uncore_rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 
 	if (GRAPHICS_VER(uncore->i915) >= 11) {
 		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
-		mcr_ss = GEN11_MCR_SLICE(slice) | GEN11_MCR_SUBSLICE(subslice);
+		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
 
 		/*
 		 * Wa_22013088509
@@ -145,7 +144,7 @@ static u32 uncore_rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 			mcr_mask |= GEN11_MCR_MULTICAST;
 	} else {
 		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
-		mcr_ss = GEN8_MCR_SLICE(slice) | GEN8_MCR_SUBSLICE(subslice);
+		mcr_ss = GEN8_MCR_SLICE(group) | GEN8_MCR_SUBSLICE(instance);
 	}
 
 	old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
@@ -167,10 +166,10 @@ static u32 uncore_rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 	return val;
 }
 
-static u32 uncore_rw_with_mcr_steering(struct intel_uncore *uncore,
-				       i915_reg_t reg, u8 rw_flag,
-				       int slice, int subslice,
-				       u32 value)
+static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
+				i915_reg_t reg, u8 rw_flag,
+				int group, int instance,
+				u32 value)
 {
 	enum forcewake_domains fw_domains;
 	u32 val;
@@ -184,8 +183,8 @@ static u32 uncore_rw_with_mcr_steering(struct intel_uncore *uncore,
 	spin_lock_irq(&uncore->lock);
 	intel_uncore_forcewake_get__locked(uncore, fw_domains);
 
-	val = uncore_rw_with_mcr_steering_fw(uncore, reg, rw_flag,
-					     slice, subslice, value);
+	val = rw_with_mcr_steering_fw(uncore, reg, rw_flag,
+				      group, instance, value);
 
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
 	spin_unlock_irq(&uncore->lock);
@@ -193,31 +192,74 @@ static u32 uncore_rw_with_mcr_steering(struct intel_uncore *uncore,
 	return val;
 }
 
-u32 intel_uncore_read_with_mcr_steering_fw(struct intel_uncore *uncore,
-					   i915_reg_t reg, int slice, int subslice)
+/**
+ * intel_gt_mcr_read - read a specific instance of an MCR register
+ * @gt: GT structure
+ * @reg: the MCR register to read
+ * @group: the MCR group
+ * @instance: the MCR instance
+ *
+ * Returns the value read from an MCR register after steering toward a specific
+ * group/instance.
+ */
+u32 intel_gt_mcr_read(struct intel_gt *gt,
+		      i915_reg_t reg,
+		      int group, int instance)
 {
-	return uncore_rw_with_mcr_steering_fw(uncore, reg, FW_REG_READ,
-					      slice, subslice, 0);
+	return rw_with_mcr_steering(gt->uncore, reg, FW_REG_READ,
+				    group, instance, 0);
 }
 
-u32 intel_uncore_read_with_mcr_steering(struct intel_uncore *uncore,
-					i915_reg_t reg, int slice, int subslice)
+/**
+ * intel_gt_mcr_unicast_write - write a specific instance of an MCR register
+ * @gt: GT structure
+ * @reg: the MCR register to read
+ * @value: value to write
+ * @group: the MCR group
+ * @instance: the MCR instance
+ *
+ * Write an MCR register in unicast mode after steering toward a specific
+ * group/instance.
+ */
+void intel_gt_mcr_unicast_write(struct intel_gt *gt,
+				i915_reg_t reg, u32 value,
+				int group, int instance)
 {
-	return uncore_rw_with_mcr_steering(uncore, reg, FW_REG_READ,
-					   slice, subslice, 0);
+	rw_with_mcr_steering(gt->uncore, reg, FW_REG_WRITE,
+			     group, instance, value);
 }
 
-void intel_uncore_write_with_mcr_steering(struct intel_uncore *uncore,
-					  i915_reg_t reg, u32 value,
-					  int slice, int subslice)
+/**
+ * intel_gt_mcr_multicast_write - write a value to all instances of an MCR register
+ * @gt: GT structure
+ * @reg: the MCR register to read
+ * @value: value to write
+ *
+ * Write an MCR register in multicast mode to update all instances.
+ */
+void intel_gt_mcr_multicast_write(struct intel_gt *gt,
+				i915_reg_t reg, u32 value)
 {
-	uncore_rw_with_mcr_steering(uncore, reg, FW_REG_WRITE,
-				    slice, subslice, value);
+	intel_uncore_write(gt->uncore, reg, value);
 }
 
-
 /**
- * intel_gt_reg_needs_read_steering - determine whether a register read
+ * intel_gt_mcr_multicast_write_fw - write a value to all instances of an MCR register
+ * @gt: GT structure
+ * @reg: the MCR register to read
+ * @value: value to write
+ *
+ * Write an MCR register in multicast mode to update all instances.  The caller
+ * must already be holding any required forcewake.
+ */
+void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
+				i915_reg_t reg, u32 value)
+{
+	intel_uncore_write_fw(gt->uncore, reg, value);
+}
+
+/*
+ * reg_needs_read_steering - determine whether a register read
  *     requires explicit steering
  * @gt: GT structure
  * @reg: the register to check steering requirements for
@@ -230,14 +272,14 @@ void intel_uncore_write_with_mcr_steering(struct intel_uncore *uncore,
  * steering type, or if the default (subslice-based) steering IDs are suitable
  * for @type steering too.
  */
-static bool intel_gt_reg_needs_read_steering(struct intel_gt *gt,
-					     i915_reg_t reg,
-					     enum intel_steering_type type)
+static bool reg_needs_read_steering(struct intel_gt *gt,
+				    i915_reg_t reg,
+				    enum intel_steering_type type)
 {
 	const u32 offset = i915_mmio_reg_offset(reg);
 	const struct intel_mmio_range *entry;
 
-	if (likely(!intel_gt_needs_read_steering(gt, type)))
+	if (likely(!gt->steering_table[type]))
 		return false;
 
 	for (entry = gt->steering_table[type]; entry->end; entry++) {
@@ -248,32 +290,32 @@ static bool intel_gt_reg_needs_read_steering(struct intel_gt *gt,
 	return false;
 }
 
-/**
- * intel_gt_get_valid_steering - determines valid IDs for a class of MCR steering
+/*
+ * get_valid_steering - determines non-terminated steering for a class of MCR
  * @gt: GT structure
  * @type: multicast register type
- * @sliceid: Slice ID returned
- * @subsliceid: Subslice ID returned
+ * @group: Group ID returned
+ * @instance: Instance ID returned
  *
- * Determines sliceid and subsliceid values that will steer reads
- * of a specific multicast register class to a valid value.
+ * Determines group and instance values that will steer reads of the specified
+ * MCR class to a non-terminated instance.
  */
-static void intel_gt_get_valid_steering(struct intel_gt *gt,
-					enum intel_steering_type type,
-					u8 *sliceid, u8 *subsliceid)
+static void get_valid_steering(struct intel_gt *gt,
+			       enum intel_steering_type type,
+			       u8 *group, u8 *instance)
 {
 	switch (type) {
 	case L3BANK:
 		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
 
-		*sliceid = 0;		/* unused */
-		*subsliceid = __ffs(gt->info.l3bank_mask);
+		*group = 0;		/* unused */
+		*instance = __ffs(gt->info.l3bank_mask);
 		break;
 	case MSLICE:
 		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
 
-		*sliceid = __ffs(gt->info.mslice_mask);
-		*subsliceid = 0;	/* unused */
+		*group = __ffs(gt->info.mslice_mask);
+		*instance = 0;	/* unused */
 		break;
 	case LNCF:
 		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
@@ -282,88 +324,87 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
 		 * An LNCF is always present if its mslice is present, so we
 		 * can safely just steer to LNCF 0 in all cases.
 		 */
-		*sliceid = __ffs(gt->info.mslice_mask) << 1;
-		*subsliceid = 0;	/* unused */
+		*group = __ffs(gt->info.mslice_mask) << 1;
+		*instance = 0;	/* unused */
 		break;
 	default:
 		MISSING_CASE(type);
-		*sliceid = 0;
-		*subsliceid = 0;
+		*group = 0;
+		*instance = 0;
 	}
 }
 
-/**
- * intel_gt_get_valid_steering_for_reg - get a valid steering for a register
+/*
+ * intel_gt_mcr_get_nonterminated_steering - find group/instance values that
+ *    will steer a register to a non-terminated instance
  * @gt: GT structure
  * @reg: register for which the steering is required
- * @sliceid: return variable for slice steering
- * @subsliceid: return variable for subslice steering
+ * @group: return variable for group steering
+ * @instance: return variable for instance steering
  *
- * This function returns a slice/subslice pair that is guaranteed to work for
+ * This function returns a group/instance pair that is guaranteed to work for
  * read steering of the given register. Note that a value will be returned even
  * if the register is not replicated and therefore does not actually require
  * steering.
  */
-void intel_gt_get_valid_steering_for_reg(struct intel_gt *gt, i915_reg_t reg,
-					 u8 *sliceid, u8 *subsliceid)
+void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
+					     i915_reg_t reg,
+					     u8 *group, u8 *instance)
 {
 	int type;
 
 	for (type = 0; type < NUM_STEERING_TYPES; type++) {
-		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
-			intel_gt_get_valid_steering(gt, type, sliceid,
-						    subsliceid);
+		if (reg_needs_read_steering(gt, reg, type)) {
+			get_valid_steering(gt, type, group, instance);
 			return;
 		}
 	}
 
-	*sliceid = gt->default_steering.groupid;
-	*subsliceid = gt->default_steering.instanceid;
+	*group = gt->default_steering.groupid;
+	*instance = gt->default_steering.instanceid;
 }
 
 /**
- * intel_gt_read_register_fw - reads a GT register with support for multicast
+ * intel_gt_mcr_read_any_fw - reads a GT register with support for multicast
  * @gt: GT structure
  * @reg: register to read
  *
  * This function will read a GT register.  If the register is a multicast
- * register, the read will be steered to a valid instance (i.e., one that
- * isn't fused off or powered down by power gating).
+ * register, the read will be steered to a non-terminated instance (i.e., one
+ * that isn't fused off or powered down by power gating).
+ *
+ * The caller should ensure any necessary forcewake is held.
  *
  * Returns the value from a valid instance of @reg.
  */
-u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
+u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
 {
 	int type;
-	u8 sliceid, subsliceid;
+	u8 group, instance;
 
 	for (type = 0; type < NUM_STEERING_TYPES; type++) {
-		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
-			intel_gt_get_valid_steering(gt, type, &sliceid,
-						    &subsliceid);
-			return intel_uncore_read_with_mcr_steering_fw(gt->uncore,
-								      reg,
-								      sliceid,
-								      subsliceid);
+		if (reg_needs_read_steering(gt, reg, type)) {
+			get_valid_steering(gt, type, &group, &instance);
+			return rw_with_mcr_steering_fw(gt->uncore, reg,
+						       FW_REG_READ,
+						       group, instance, 0);
 		}
 	}
 
 	return intel_uncore_read_fw(gt->uncore, reg);
 }
 
-u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
+u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg)
 {
 	int type;
-	u8 sliceid, subsliceid;
+	u8 group, instance;
 
 	for (type = 0; type < NUM_STEERING_TYPES; type++) {
-		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
-			intel_gt_get_valid_steering(gt, type, &sliceid,
-						    &subsliceid);
-			return intel_uncore_read_with_mcr_steering(gt->uncore,
-								   reg,
-								   sliceid,
-								   subsliceid);
+		if (reg_needs_read_steering(gt, reg, type)) {
+			get_valid_steering(gt, type, &group, &instance);
+			return rw_with_mcr_steering(gt->uncore, reg,
+						    FW_REG_READ,
+						    group, instance, 0);
 		}
 	}
 
@@ -376,7 +417,7 @@ static void report_steering_type(struct drm_printer *p,
 				 bool dump_table)
 {
 	const struct intel_mmio_range *entry;
-	u8 slice, subslice;
+	u8 group, instance;
 
 	BUILD_BUG_ON(ARRAY_SIZE(intel_steering_types) != NUM_STEERING_TYPES);
 
@@ -386,9 +427,9 @@ static void report_steering_type(struct drm_printer *p,
 		return;
 	}
 
-	intel_gt_get_valid_steering(gt, type, &slice, &subslice);
-	drm_printf(p, "%s steering: sliceid=0x%x, subsliceid=0x%x\n",
-		   intel_steering_types[type], slice, subslice);
+	get_valid_steering(gt, type, &group, &instance);
+	drm_printf(p, "%s steering: group=0x%x, instance=0x%x\n",
+		   intel_steering_types[type], group, instance);
 
 	if (!dump_table)
 		return;
@@ -397,10 +438,10 @@ static void report_steering_type(struct drm_printer *p,
 		drm_printf(p, "\t0x%06x - 0x%06x\n", entry->start, entry->end);
 }
 
-void intel_gt_report_steering(struct drm_printer *p, struct intel_gt *gt,
-			      bool dump_table)
+void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
+				  bool dump_table)
 {
-	drm_printf(p, "Default steering: sliceid=0x%x, subsliceid=0x%x\n",
+	drm_printf(p, "Default steering: group=0x%x, instance=0x%x\n",
 		   gt->default_steering.groupid,
 		   gt->default_steering.instanceid);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index b570c1571243..506b0cbc8db3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -10,28 +10,25 @@
 
 void intel_gt_mcr_init(struct intel_gt *gt);
 
-u32 intel_uncore_read_with_mcr_steering_fw(struct intel_uncore *uncore,
-					   i915_reg_t reg,
-					   int slice, int subslice);
-u32 intel_uncore_read_with_mcr_steering(struct intel_uncore *uncore,
-					i915_reg_t reg,	int slice, int subslice);
-void intel_uncore_write_with_mcr_steering(struct intel_uncore *uncore,
-					  i915_reg_t reg, u32 value,
-					  int slice, int subslice);
-
-u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
-u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
-
-static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
-						enum intel_steering_type type)
-{
-	return gt->steering_table[type];
-}
-
-void intel_gt_get_valid_steering_for_reg(struct intel_gt *gt, i915_reg_t reg,
-					 u8 *sliceid, u8 *subsliceid);
-
-void intel_gt_report_steering(struct drm_printer *p, struct intel_gt *gt,
-			      bool dump_table);
+u32 intel_gt_mcr_read(struct intel_gt *gt,
+		      i915_reg_t reg,
+		      int group, int instance);
+u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg);
+u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg);
+
+void intel_gt_mcr_unicast_write(struct intel_gt *gt,
+				i915_reg_t reg, u32 value,
+				int group, int instance);
+void intel_gt_mcr_multicast_write(struct intel_gt *gt,
+				  i915_reg_t reg, u32 value);
+void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
+				     i915_reg_t reg, u32 value);
+
+void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
+					     i915_reg_t reg,
+					     u8 *group, u8 *instance);
+
+void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
+				  bool dump_table);
 
 #endif /* __INTEL_GT_MCR__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 6e788a5fc85a..6952312ddbe4 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -105,7 +105,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 		u64 tile_stolen, flat_ccs_base;
 
 		lmem_size = pci_resource_len(pdev, 2);
-		flat_ccs_base = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
+		flat_ccs_base = intel_gt_mcr_read_any(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
 		flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
 
 		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index e9bf0d9f50d8..1864e1fe1e87 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1081,7 +1081,7 @@ static void __add_mcr_wa(struct intel_gt *gt, struct i915_wa_list *wal,
 	gt->default_steering.instanceid = subslice;
 
 	if (drm_debug_enabled(DRM_UT_DRIVER))
-		intel_gt_report_steering(&p, gt, false);
+		intel_gt_mcr_report_steering(&p, gt, false);
 }
 
 static void
@@ -1597,13 +1597,13 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
 		u32 val, old = 0;
 
 		/* open-coded rmw due to steering */
-		old = wa->clr ? intel_gt_read_register_fw(gt, wa->reg) : 0;
+		old = wa->clr ? intel_gt_mcr_read_any_fw(gt, wa->reg) : 0;
 		val = (old & ~wa->clr) | wa->set;
 		if (val != old || !wa->clr)
 			intel_uncore_write_fw(uncore, wa->reg, val);
 
 		if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
-			wa_verify(wa, intel_gt_read_register_fw(gt, wa->reg),
+			wa_verify(wa, intel_gt_mcr_read_any_fw(gt, wa->reg),
 				  wal->name, "application");
 	}
 
@@ -1634,7 +1634,7 @@ static bool wa_list_verify(struct intel_gt *gt,
 
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
 		ok &= wa_verify(wa,
-				intel_gt_read_register_fw(gt, wa->reg),
+				intel_gt_mcr_read_any_fw(gt, wa->reg),
 				wal->name, from);
 
 	intel_uncore_forcewake_put__locked(uncore, fw);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index c63a6bf9e853..15f2ded6debf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -314,7 +314,7 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
 	 * tracking, it is easier to just program the default steering for all
 	 * regs that don't need a non-default one.
 	 */
-	intel_gt_get_valid_steering_for_reg(gt, reg, &group, &inst);
+	intel_gt_mcr_get_nonterminated_steering(gt, reg, &group, &inst);
 	entry.flags |= GUC_REGSET_STEERING(group, inst);
 
 	slot = __mmio_reg_add(regset, &entry);
-- 
2.34.1

