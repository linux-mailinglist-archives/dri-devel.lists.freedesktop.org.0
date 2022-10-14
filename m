Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969645FF67C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E30C10E13C;
	Fri, 14 Oct 2022 23:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFBB10E13D;
 Fri, 14 Oct 2022 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665788584; x=1697324584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zW3e7StAu0gehtFTpQqfKu++AyXoea1TtiGzkFdY0VA=;
 b=am7mB2fJHY2sYC252XSKdvhHnfM9O3eJqG7RBkTJfLp4HYROPDyu4x26
 YMcNx/okA5n+u0Fb/oQVsQn3jC2ZY4VIiII1Wv/rtfmQ7Js1QeB6OVic0
 MZ5LZ4Evmdbu2XnxUZ3CDX9uHKnWCGL4IubphO3+l1nHSGdpTzn1cDwcG
 5xv8rDm7AnDWzbldVtLAdzmb8b12FPXaE8tM7A38EhojBLGdhA0WZn058
 3fw6nt+fhwUcuoZum9MpCSpHTPIKpwLraDdbvIQv3sE7z5FNnCwKwl2GS
 FeEro37NpdIKSXq7vZ8pTQl6BVOLO/Rv2lgGciT4d3rPGMPczoHO76zfO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285216973"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="285216973"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696471717"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696471717"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/14] drm/i915/guc: Handle save/restore of MCR registers
 explicitly
Date: Fri, 14 Oct 2022 16:02:35 -0700
Message-Id: <20221014230239.1023689-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014230239.1023689-1-matthew.d.roper@intel.com>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
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
index cc357fa0c270..de923fb82301 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -278,24 +278,16 @@ __mmio_reg_add(struct temp_regset *regset, struct guc_mmio_reg *reg)
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
@@ -307,17 +299,6 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
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
@@ -335,6 +316,38 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
 
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
@@ -375,7 +388,7 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	/* add in local MOCS registers */
 	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++)
 		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
-			ret |= GUC_MMIO_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
+			ret |= GUC_MCR_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
 		else
 			ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
 
-- 
2.37.3

