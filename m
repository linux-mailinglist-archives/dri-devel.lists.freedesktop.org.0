Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE3476B72D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9D410E403;
	Tue,  1 Aug 2023 14:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADF910E404;
 Tue,  1 Aug 2023 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690899615; x=1722435615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/dx/fZ4zLWtVMNkOX8ksIRJFUAjrvoaZ5tsiH/nqifM=;
 b=PPBxHIumY9cT6BfVD0jPWqeftdycZFTs/kEWeBxWGJOT888BzEyD97Dl
 tCAZ3+49z6sJpjKfu5AgsRhGXl0i15fSRWLuaDegRBUB3ohViaGLLbUnb
 Bv/sAO6npx0XDyR+3bN/ukiTS6HfS/2np5Zk25Ljpwlxu9pOKtBSsukST
 XYCLdcsVq2UdyxSrhWNUQPT8wGEmq4a1WKsyUiKxMoTwQCm7npB/2rHIC
 Scx2iw7N1+h43SHEsSSlTFXttmjm7EMvJoNaYUmMFHjvemP6JM5StvJYh
 ka02bq33awbPR/nR4mykWsB6L3V1lQHcyU+kTd6zYI/OmF/CmZ+QzMhLz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372023374"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="372023374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678687230"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="678687230"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.37.77])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:13 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH 1/4] drm/i915/gt: Move TLB invalidation to its own file
Date: Tue,  1 Aug 2023 16:19:52 +0200
Message-Id: <20230801141955.383305-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801141955.383305-1-andi.shyti@linux.intel.com>
References: <20230801141955.383305-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Prepare for supporting more TLB invalidation scenarios by moving
the current MMIO invalidation to its own file.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile             |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c        | 140 +------------------
 drivers/gpu/drm/i915/gt/intel_gt.h        |  12 --
 drivers/gpu/drm/i915/gt/intel_tlb.c       | 159 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_tlb.h       |  29 ++++
 drivers/gpu/drm/i915/gt/selftest_tlb.c    |   3 +-
 drivers/gpu/drm/i915/i915_vma.c           |   1 +
 8 files changed, 197 insertions(+), 152 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c5fc91cd58e73..79f65eff6bb2a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -132,6 +132,7 @@ gt-y += \
 	gt/intel_sseu.o \
 	gt/intel_sseu_debugfs.o \
 	gt/intel_timeline.o \
+	gt/intel_tlb.o \
 	gt/intel_wopcm.o \
 	gt/intel_workarounds.o \
 	gt/shmem_utils.o \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 89fc8ea6bcfc4..83852f7da1ac5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -7,7 +7,7 @@
 #include <drm/drm_cache.h>
 
 #include "gt/intel_gt.h"
-#include "gt/intel_gt_pm.h"
+#include "gt/intel_tlb.h"
 
 #include "i915_drv.h"
 #include "i915_gem_object.h"
@@ -198,7 +198,7 @@ static void flush_tlb_invalidate(struct drm_i915_gem_object *obj)
 	if (!obj->mm.tlb)
 		return;
 
-	intel_gt_invalidate_tlb(gt, obj->mm.tlb);
+	intel_gt_invalidate_tlb_full(gt, obj->mm.tlb);
 	obj->mm.tlb = 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 02886c1eb0f17..18177a8e4aadd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -33,6 +33,7 @@
 #include "intel_rps.h"
 #include "intel_sa_media.h"
 #include "intel_gt_sysfs.h"
+#include "intel_tlb.h"
 #include "intel_uncore.h"
 #include "shmem_utils.h"
 
@@ -50,8 +51,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
 	intel_gt_init_reset(gt);
 	intel_gt_init_requests(gt);
 	intel_gt_init_timelines(gt);
-	mutex_init(&gt->tlb.invalidate_lock);
-	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
+	intel_gt_init_tlb(gt);
 	intel_gt_pm_init_early(gt);
 
 	intel_wopcm_init_early(&gt->wopcm);
@@ -846,7 +846,7 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
 		intel_gt_fini_requests(gt);
 		intel_gt_fini_reset(gt);
 		intel_gt_fini_timelines(gt);
-		mutex_destroy(&gt->tlb.invalidate_lock);
+		intel_gt_fini_tlb(gt);
 		intel_engines_free(gt);
 	}
 }
@@ -1003,137 +1003,3 @@ void intel_gt_info_print(const struct intel_gt_info *info,
 
 	intel_sseu_dump(&info->sseu, p);
 }
-
-/*
- * HW architecture suggest typical invalidation time at 40us,
- * with pessimistic cases up to 100us and a recommendation to
- * cap at 1ms. We go a bit higher just in case.
- */
-#define TLB_INVAL_TIMEOUT_US 100
-#define TLB_INVAL_TIMEOUT_MS 4
-
-/*
- * On Xe_HP the TLB invalidation registers are located at the same MMIO offsets
- * but are now considered MCR registers.  Since they exist within a GAM range,
- * the primary instance of the register rolls up the status from each unit.
- */
-static int wait_for_invalidate(struct intel_engine_cs *engine)
-{
-	if (engine->tlb_inv.mcr)
-		return intel_gt_mcr_wait_for_reg(engine->gt,
-						 engine->tlb_inv.reg.mcr_reg,
-						 engine->tlb_inv.done,
-						 0,
-						 TLB_INVAL_TIMEOUT_US,
-						 TLB_INVAL_TIMEOUT_MS);
-	else
-		return __intel_wait_for_register_fw(engine->gt->uncore,
-						    engine->tlb_inv.reg.reg,
-						    engine->tlb_inv.done,
-						    0,
-						    TLB_INVAL_TIMEOUT_US,
-						    TLB_INVAL_TIMEOUT_MS,
-						    NULL);
-}
-
-static void mmio_invalidate_full(struct intel_gt *gt)
-{
-	struct drm_i915_private *i915 = gt->i915;
-	struct intel_uncore *uncore = gt->uncore;
-	struct intel_engine_cs *engine;
-	intel_engine_mask_t awake, tmp;
-	enum intel_engine_id id;
-	unsigned long flags;
-
-	if (GRAPHICS_VER(i915) < 8)
-		return;
-
-	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
-
-	intel_gt_mcr_lock(gt, &flags);
-	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
-
-	awake = 0;
-	for_each_engine(engine, gt, id) {
-		if (!intel_engine_pm_is_awake(engine))
-			continue;
-
-		if (engine->tlb_inv.mcr)
-			intel_gt_mcr_multicast_write_fw(gt,
-							engine->tlb_inv.reg.mcr_reg,
-							engine->tlb_inv.request);
-		else
-			intel_uncore_write_fw(uncore,
-					      engine->tlb_inv.reg.reg,
-					      engine->tlb_inv.request);
-
-		awake |= engine->mask;
-	}
-
-	GT_TRACE(gt, "invalidated engines %08x\n", awake);
-
-	/* Wa_2207587034:tgl,dg1,rkl,adl-s,adl-p */
-	if (awake &&
-	    (IS_TIGERLAKE(i915) ||
-	     IS_DG1(i915) ||
-	     IS_ROCKETLAKE(i915) ||
-	     IS_ALDERLAKE_S(i915) ||
-	     IS_ALDERLAKE_P(i915)))
-		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
-
-	spin_unlock(&uncore->lock);
-	intel_gt_mcr_unlock(gt, flags);
-
-	for_each_engine_masked(engine, gt, awake, tmp) {
-		if (wait_for_invalidate(engine))
-			gt_err_ratelimited(gt,
-					   "%s TLB invalidation did not complete in %ums!\n",
-					   engine->name, TLB_INVAL_TIMEOUT_MS);
-	}
-
-	/*
-	 * Use delayed put since a) we mostly expect a flurry of TLB
-	 * invalidations so it is good to avoid paying the forcewake cost and
-	 * b) it works around a bug in Icelake which cannot cope with too rapid
-	 * transitions.
-	 */
-	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
-}
-
-static bool tlb_seqno_passed(const struct intel_gt *gt, u32 seqno)
-{
-	u32 cur = intel_gt_tlb_seqno(gt);
-
-	/* Only skip if a *full* TLB invalidate barrier has passed */
-	return (s32)(cur - ALIGN(seqno, 2)) > 0;
-}
-
-void intel_gt_invalidate_tlb(struct intel_gt *gt, u32 seqno)
-{
-	intel_wakeref_t wakeref;
-
-	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
-		return;
-
-	if (intel_gt_is_wedged(gt))
-		return;
-
-	if (tlb_seqno_passed(gt, seqno))
-		return;
-
-	with_intel_gt_pm_if_awake(gt, wakeref) {
-		mutex_lock(&gt->tlb.invalidate_lock);
-		if (tlb_seqno_passed(gt, seqno))
-			goto unlock;
-
-		mmio_invalidate_full(gt);
-
-		write_seqcount_invalidate(&gt->tlb.seqno);
-unlock:
-		mutex_unlock(&gt->tlb.invalidate_lock);
-	}
-}
-
-#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-#include "selftest_tlb.c"
-#endif
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index d2f4fbde5f9f0..6549e28fa219e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -107,16 +107,4 @@ void intel_gt_info_print(const struct intel_gt_info *info,
 
 void intel_gt_watchdog_work(struct work_struct *work);
 
-static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
-{
-	return seqprop_sequence(&gt->tlb.seqno);
-}
-
-static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
-{
-	return intel_gt_tlb_seqno(gt) | 1;
-}
-
-void intel_gt_invalidate_tlb(struct intel_gt *gt, u32 seqno);
-
 #endif /* __INTEL_GT_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
new file mode 100644
index 0000000000000..139608c30d978
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "i915_drv.h"
+#include "i915_perf_oa_regs.h"
+#include "intel_engine_pm.h"
+#include "intel_gt.h"
+#include "intel_gt_mcr.h"
+#include "intel_gt_pm.h"
+#include "intel_gt_print.h"
+#include "intel_gt_regs.h"
+#include "intel_tlb.h"
+
+/*
+ * HW architecture suggest typical invalidation time at 40us,
+ * with pessimistic cases up to 100us and a recommendation to
+ * cap at 1ms. We go a bit higher just in case.
+ */
+#define TLB_INVAL_TIMEOUT_US 100
+#define TLB_INVAL_TIMEOUT_MS 4
+
+/*
+ * On Xe_HP the TLB invalidation registers are located at the same MMIO offsets
+ * but are now considered MCR registers.  Since they exist within a GAM range,
+ * the primary instance of the register rolls up the status from each unit.
+ */
+static int wait_for_invalidate(struct intel_engine_cs *engine)
+{
+	if (engine->tlb_inv.mcr)
+		return intel_gt_mcr_wait_for_reg(engine->gt,
+						 engine->tlb_inv.reg.mcr_reg,
+						 engine->tlb_inv.done,
+						 0,
+						 TLB_INVAL_TIMEOUT_US,
+						 TLB_INVAL_TIMEOUT_MS);
+	else
+		return __intel_wait_for_register_fw(engine->gt->uncore,
+						    engine->tlb_inv.reg.reg,
+						    engine->tlb_inv.done,
+						    0,
+						    TLB_INVAL_TIMEOUT_US,
+						    TLB_INVAL_TIMEOUT_MS,
+						    NULL);
+}
+
+static void mmio_invalidate_full(struct intel_gt *gt)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_uncore *uncore = gt->uncore;
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t awake, tmp;
+	enum intel_engine_id id;
+	unsigned long flags;
+
+	if (GRAPHICS_VER(i915) < 8)
+		return;
+
+	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
+
+	intel_gt_mcr_lock(gt, &flags);
+	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
+
+	awake = 0;
+	for_each_engine(engine, gt, id) {
+		if (!intel_engine_pm_is_awake(engine))
+			continue;
+
+		if (engine->tlb_inv.mcr)
+			intel_gt_mcr_multicast_write_fw(gt,
+							engine->tlb_inv.reg.mcr_reg,
+							engine->tlb_inv.request);
+		else
+			intel_uncore_write_fw(uncore,
+					      engine->tlb_inv.reg.reg,
+					      engine->tlb_inv.request);
+
+		awake |= engine->mask;
+	}
+
+	GT_TRACE(gt, "invalidated engines %08x\n", awake);
+
+	/* Wa_2207587034:tgl,dg1,rkl,adl-s,adl-p */
+	if (awake &&
+	    (IS_TIGERLAKE(i915) ||
+	     IS_DG1(i915) ||
+	     IS_ROCKETLAKE(i915) ||
+	     IS_ALDERLAKE_S(i915) ||
+	     IS_ALDERLAKE_P(i915)))
+		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
+
+	spin_unlock(&uncore->lock);
+	intel_gt_mcr_unlock(gt, flags);
+
+	for_each_engine_masked(engine, gt, awake, tmp) {
+		if (wait_for_invalidate(engine))
+			gt_err_ratelimited(gt,
+					   "%s TLB invalidation did not complete in %ums!\n",
+					   engine->name, TLB_INVAL_TIMEOUT_MS);
+	}
+
+	/*
+	 * Use delayed put since a) we mostly expect a flurry of TLB
+	 * invalidations so it is good to avoid paying the forcewake cost and
+	 * b) it works around a bug in Icelake which cannot cope with too rapid
+	 * transitions.
+	 */
+	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
+}
+
+static bool tlb_seqno_passed(const struct intel_gt *gt, u32 seqno)
+{
+	u32 cur = intel_gt_tlb_seqno(gt);
+
+	/* Only skip if a *full* TLB invalidate barrier has passed */
+	return (s32)(cur - ALIGN(seqno, 2)) > 0;
+}
+
+void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
+{
+	intel_wakeref_t wakeref;
+
+	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
+		return;
+
+	if (intel_gt_is_wedged(gt))
+		return;
+
+	if (tlb_seqno_passed(gt, seqno))
+		return;
+
+	with_intel_gt_pm_if_awake(gt, wakeref) {
+		mutex_lock(&gt->tlb.invalidate_lock);
+		if (tlb_seqno_passed(gt, seqno))
+			goto unlock;
+
+		mmio_invalidate_full(gt);
+
+		write_seqcount_invalidate(&gt->tlb.seqno);
+unlock:
+		mutex_unlock(&gt->tlb.invalidate_lock);
+	}
+}
+
+void intel_gt_init_tlb(struct intel_gt *gt)
+{
+	mutex_init(&gt->tlb.invalidate_lock);
+	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
+}
+
+void intel_gt_fini_tlb(struct intel_gt *gt)
+{
+	mutex_destroy(&gt->tlb.invalidate_lock);
+}
+
+#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
+#include "selftest_tlb.c"
+#endif
diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.h b/drivers/gpu/drm/i915/gt/intel_tlb.h
new file mode 100644
index 0000000000000..337327af92ac4
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef INTEL_TLB_H
+#define INTEL_TLB_H
+
+#include <linux/seqlock.h>
+#include <linux/types.h>
+
+#include "intel_gt_types.h"
+
+void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno);
+
+void intel_gt_init_tlb(struct intel_gt *gt);
+void intel_gt_fini_tlb(struct intel_gt *gt);
+
+static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
+{
+	return seqprop_sequence(&gt->tlb.seqno);
+}
+
+static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
+{
+	return intel_gt_tlb_seqno(gt) | 1;
+}
+
+#endif /* INTEL_TLB_H */
diff --git a/drivers/gpu/drm/i915/gt/selftest_tlb.c b/drivers/gpu/drm/i915/gt/selftest_tlb.c
index 3bd6b540257b4..7e41f69fc818f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_tlb.c
+++ b/drivers/gpu/drm/i915/gt/selftest_tlb.c
@@ -6,6 +6,7 @@
 #include "i915_selftest.h"
 
 #include "gem/i915_gem_internal.h"
+#include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 
 #include "gen8_engine_cs.h"
@@ -354,7 +355,7 @@ mem_tlbinv(struct intel_gt *gt,
 
 static void tlbinv_full(struct i915_address_space *vm, u64 addr, u64 length)
 {
-	intel_gt_invalidate_tlb(vm->gt, intel_gt_tlb_seqno(vm->gt) | 1);
+	intel_gt_invalidate_tlb_full(vm->gt, intel_gt_tlb_seqno(vm->gt) | 1);
 }
 
 static int invalidate_full(void *arg)
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 63e111266de16..1dae22bc8176a 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -34,6 +34,7 @@
 #include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
+#include "gt/intel_tlb.h"
 
 #include "i915_drv.h"
 #include "i915_gem_evict.h"
-- 
2.40.1

