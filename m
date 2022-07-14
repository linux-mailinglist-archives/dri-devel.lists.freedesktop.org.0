Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA6574CE6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1216011298E;
	Thu, 14 Jul 2022 12:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDF3112917;
 Thu, 14 Jul 2022 12:06:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC79161E98;
 Thu, 14 Jul 2022 12:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22ACC36AEC;
 Thu, 14 Jul 2022 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657800390;
 bh=WzYpG/QH8bwVkozSfvAs7xeKWEh19nsF2DzB8oRAbEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nhY8TlS0Jl1fj9ie5IEosRZiC9uYm/AUAvDcnMMdN7bKB6yZPbU1/vKW5FQjCal69
 y6LXkbWFDtVCkZQ3h7mLCvp9x/iyNI3XK5ZorK+aT79zC4yud0/QfOQTpykdjlwV43
 odnVFzYiWAHO6dprbxVfz24igbMQOl1CxKrZwjaQl1+C2nDfs5PX1p2TrT+P2LmZLT
 5VP28Xok+/bZR9Li2oEhudFHq0zF8GyPovBy/wKkijHUVmMsyltl7vcywTQ0bLwMuB
 uaoJY7gEGM/CokUGlDSVMWjZHOiHyAkJTZmu/z8767TjWJ9SG6O01Lb9YuHUOFzNhu
 bdcx8qAjLpSKQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBxbw-0059tL-5M;
 Thu, 14 Jul 2022 13:06:28 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 17/21] drm/i915: Add generic interface for tlb invalidation
 for XeHP
Date: Thu, 14 Jul 2022 13:06:22 +0100
Message-Id: <56ae0b7a5e823736a404dcd709fbf4a1e384ef4d.1657800199.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657800199.git.mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>, David Airlie <airlied@linux.ie>,
 Matt Atwood <matthew.s.atwood@intel.com>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>

Add an interface for GuC TLB actions, supporting both selective and
full TLB invalidations. After this change, when GuC is enabled,
tlb invalidations use GuC ct. Otherwise, use mmio interface.

Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  8 +++
 drivers/gpu/drm/i915/gt/intel_tlb.c     | 78 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_tlb.h     |  1 +
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 60d6eb5f245b..52508a9c23e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1054,6 +1054,14 @@
 
 #define GEN12_GAM_DONE				_MMIO(0xcf68)
 
+#define XEHP_TLB_INV_DESC0			_MMIO(0xcf7c)
+#define   XEHP_TLB_INV_DESC0_ADDR_LO		REG_GENMASK(31, 12)
+#define   XEHP_TLB_INV_DESC0_ADDR_MASK		REG_GENMASK(8, 3)
+#define   XEHP_TLB_INV_DESC0_G			REG_GENMASK(2, 1)
+#define   XEHP_TLB_INV_DESC0_VALID		REG_BIT(0)
+#define XEHP_TLB_INV_DESC1			_MMIO(0xcf80)
+#define   XEHP_TLB_INV_DESC0_ADDR_HI		REG_GENMASK(31, 0)
+
 #define GEN7_HALF_SLICE_CHICKEN1		_MMIO(0xe100) /* IVB GT1 + VLV */
 #define   GEN7_MAX_PS_THREAD_DEP		(8 << 12)
 #define   GEN7_SINGLE_SUBSCAN_DISPATCH_ENABLE	(1 << 10)
diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
index af8cae979489..15ed83226676 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.c
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
@@ -10,6 +10,7 @@
 #include "intel_gt_pm.h"
 #include "intel_gt_regs.h"
 #include "intel_tlb.h"
+#include "uc/intel_guc.h"
 
 struct reg_and_bit {
 	i915_reg_t reg;
@@ -159,11 +160,16 @@ void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
 		return;
 
 	with_intel_gt_pm_if_awake(gt, wakeref) {
+		struct intel_guc *guc = &gt->uc.guc;
+
 		mutex_lock(&gt->tlb.invalidate_lock);
 		if (tlb_seqno_passed(gt, seqno))
 			goto unlock;
 
-		mmio_invalidate_full(gt);
+		if (INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc))
+			intel_guc_invalidate_tlb_full(guc, INTEL_GUC_TLB_INVAL_MODE_HEAVY);
+		else
+			mmio_invalidate_full(gt);
 
 		write_seqcount_invalidate(&gt->tlb.seqno);
 unlock:
@@ -171,6 +177,76 @@ void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
 	}
 }
 
+static bool mmio_invalidate_range(struct intel_gt *gt, u64 start, u64 length)
+{
+	u32 address_mask = (ilog2(length) - ilog2(I915_GTT_PAGE_SIZE_4K));
+	u64 vm_total = BIT_ULL(INTEL_INFO(gt->i915)->ppgtt_size);
+	intel_wakeref_t wakeref;
+	u32 dw0, dw1;
+	int err;
+
+	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE_4K));
+	GEM_BUG_ON(!IS_ALIGNED(length, I915_GTT_PAGE_SIZE_4K));
+	GEM_BUG_ON(range_overflows(start, length, vm_total));
+
+	dw0 = FIELD_PREP(XEHP_TLB_INV_DESC0_ADDR_LO, (lower_32_bits(start) >> 12)) |
+		FIELD_PREP(XEHP_TLB_INV_DESC0_ADDR_MASK, address_mask) |
+		FIELD_PREP(XEHP_TLB_INV_DESC0_G, 0x3) |
+		FIELD_PREP(XEHP_TLB_INV_DESC0_VALID, 0x1);
+	dw1 = upper_32_bits(start);
+
+	err = 0;
+	with_intel_gt_pm_if_awake(gt, wakeref) {
+		struct intel_uncore *uncore = gt->uncore;
+
+		intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
+
+		mutex_lock(&gt->tlb.invalidate_lock);
+		intel_uncore_write_fw(uncore, XEHP_TLB_INV_DESC1, dw1);
+		intel_uncore_write_fw(uncore, XEHP_TLB_INV_DESC0, dw0);
+		err = __intel_wait_for_register_fw(uncore,
+						   XEHP_TLB_INV_DESC0,
+						   XEHP_TLB_INV_DESC0_VALID,
+						   0, 100, 10, NULL);
+		mutex_unlock(&gt->tlb.invalidate_lock);
+
+		intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
+	}
+
+	if (err)
+		drm_err_ratelimited(&gt->i915->drm,
+				    "TLB invalidation response timed out\n");
+
+	return err == 0;
+}
+
+bool intel_gt_invalidate_tlb_range(struct intel_gt *gt,
+				   u64 start, u64 length)
+{
+	struct intel_guc *guc = &gt->uc.guc;
+	intel_wakeref_t wakeref;
+
+	if (intel_gt_is_wedged(gt))
+		return true;
+
+	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION_SELECTIVE(guc))
+		return false;
+
+	/*XXX: We are seeing timeouts on guc based tlb invalidations on XEHPSDV.
+	 * Until we have a fix, use mmio
+	 */
+	if (IS_XEHPSDV(gt->i915))
+		return mmio_invalidate_range(gt, start, length);
+
+	with_intel_gt_pm_if_awake(gt, wakeref) {
+		intel_guc_invalidate_tlb_page_selective(guc,
+							INTEL_GUC_TLB_INVAL_MODE_HEAVY,
+							start, length);
+	}
+
+	return true;
+}
+
 void intel_gt_init_tlb(struct intel_gt *gt)
 {
 	mutex_init(&gt->tlb.invalidate_lock);
diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.h b/drivers/gpu/drm/i915/gt/intel_tlb.h
index 46ce25bf5afe..32cc79b1d8a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.h
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.h
@@ -12,6 +12,7 @@
 #include "intel_gt_types.h"
 
 void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno);
+bool intel_gt_invalidate_tlb_range(struct intel_gt *gt, u64 start, u64 length);
 
 void intel_gt_init_tlb(struct intel_gt *gt);
 void intel_gt_fini_tlb(struct intel_gt *gt);
-- 
2.36.1

