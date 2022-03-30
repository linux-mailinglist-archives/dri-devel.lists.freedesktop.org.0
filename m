Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476634ED011
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC6110E30A;
	Wed, 30 Mar 2022 23:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585A610E20F;
 Wed, 30 Mar 2022 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682957; x=1680218957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ffoNTdS90mZsX3xqRXtzLDwDCcUJi5PXgG8vRBWk1DI=;
 b=RKAUNhmUSqaRCsqIUCbVHDXUBRE4dtexzK6LGDw/clphSUuA3I/fh+1m
 kWhMubVjJiqeCK5Hg4nhUm9rlGArhDQHzbMNL7G5enTy0V45ZhCPkmwgE
 KMjiqqW/HPSexLs/JfGO1faxeMlGjnKDVqG3XlWt1IV+3uXDQ8K2dKyxd
 d71J0k+x/jVdU6MP0PApZOKz0mSmyilK4SvOoS0tFG38KAtnClqNsT8tQ
 OSp8JGqeyV70WeQPfacQ6a6bAQ19kiTsu2Us8KCY1k9qGOktIRwilido1
 R84StrRnu8vRAc45D+s/fz6AfQjIoiomeLMQTEnD6aA/2uB0MJdL8YEIB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582515"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582515"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547052023"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/15] drm/i915/guc: Handle save/restore of MCR registers
 explicitly
Date: Wed, 30 Mar 2022 16:28:55 -0700
Message-Id: <20220330232858.3204283-13-matthew.d.roper@intel.com>
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

MCR registers can be placed on the GuC's save/restore list, but at the
moment they are always handled in a multicast manner (i.e., the GuC
reads one instance to save the value and then does a multicast write to
restore that single value to all instances).  In the future the GuC will
probably give us an alternate interface to do unicast per-instance
save/restore operations, so we should be very clear about which
registers on the list are MCR registers (and in the future which
save/restore behavior we want for them).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 55 +++++++++++++---------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 15f2ded6debf..389c5c0aad7a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -277,24 +277,16 @@ __mmio_reg_add(struct temp_regset *regset, struct guc_mmio_reg *reg)
 	return slot;
 }
 
-#define GUC_REGSET_STEERING(group, instance) ( \
-	FIELD_PREP(GUC_REGSET_STEERING_GROUP, (group)) | \
-	FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, (instance)) | \
-	GUC_REGSET_NEEDS_STEERING \
-)
-
 static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
 					  struct temp_regset *regset,
-					  i915_reg_t reg, u32 flags)
+					  u32 offset, u32 flags)
 {
 	u32 count = regset->storage_used - (regset->registers - regset->storage);
-	u32 offset = i915_mmio_reg_offset(reg);
 	struct guc_mmio_reg entry = {
 		.offset = offset,
 		.flags = flags,
 	};
 	struct guc_mmio_reg *slot;
-	u8 group, inst;
 
 	/*
 	 * The mmio list is built using separate lists within the driver.
@@ -306,17 +298,6 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
 		    sizeof(entry), guc_mmio_reg_cmp))
 		return 0;
 
-	/*
-	 * The GuC doesn't have a default steering, so we need to explicitly
-	 * steer all registers that need steering. However, we do not keep track
-	 * of all the steering ranges, only of those that have a chance of using
-	 * a non-default steering from the i915 pov. Instead of adding such
-	 * tracking, it is easier to just program the default steering for all
-	 * regs that don't need a non-default one.
-	 */
-	intel_gt_mcr_get_nonterminated_steering(gt, reg, &group, &inst);
-	entry.flags |= GUC_REGSET_STEERING(group, inst);
-
 	slot = __mmio_reg_add(regset, &entry);
 	if (IS_ERR(slot))
 		return PTR_ERR(slot);
@@ -334,6 +315,38 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
 
 #define GUC_MMIO_REG_ADD(gt, regset, reg, masked) \
 	guc_mmio_reg_add(gt, \
+			 regset, \
+			 i915_mmio_reg_offset(reg), \
+			 (masked) ? GUC_REGSET_MASKED : 0)
+
+#define GUC_REGSET_STEERING(group, instance) ( \
+	FIELD_PREP(GUC_REGSET_STEERING_GROUP, (group)) | \
+	FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, (instance)) | \
+	GUC_REGSET_NEEDS_STEERING \
+)
+
+static long __must_check guc_mcr_reg_add(struct intel_gt *gt,
+					 struct temp_regset *regset,
+					 i915_reg_t reg, u32 flags)
+{
+	u8 group, inst;
+
+	/*
+	 * The GuC doesn't have a default steering, so we need to explicitly
+	 * steer all registers that need steering. However, we do not keep track
+	 * of all the steering ranges, only of those that have a chance of using
+	 * a non-default steering from the i915 pov. Instead of adding such
+	 * tracking, it is easier to just program the default steering for all
+	 * regs that don't need a non-default one.
+	 */
+	intel_gt_mcr_get_nonterminated_steering(gt, reg, &group, &inst);
+	flags |= GUC_REGSET_STEERING(group, inst);
+
+	return guc_mmio_reg_add(gt, regset, i915_mmio_reg_offset(reg), flags);
+}
+
+#define GUC_MCR_REG_ADD(gt, regset, reg, masked) \
+	guc_mcr_reg_add(gt, \
 			 regset, \
 			 (reg), \
 			 (masked) ? GUC_REGSET_MASKED : 0)
@@ -374,7 +387,7 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	/* add in local MOCS registers */
 	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++)
 		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
-			ret |= GUC_MMIO_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
+			ret |= GUC_MCR_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
 		else
 			ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
 
-- 
2.34.1

