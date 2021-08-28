Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B23FA2D4
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 03:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BA06EA07;
	Sat, 28 Aug 2021 01:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4447D6E9FA;
 Sat, 28 Aug 2021 01:29:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="303630233"
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="303630233"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 18:29:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="517537137"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 18:29:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	"Huang, Sean Z" <sean.z.huang@intel.com>, Huang@freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 09/17] drm/i915/pxp: Implement PXP irq handler
Date: Fri, 27 Aug 2021 18:27:30 -0700
Message-Id: <20210828012738.317661-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
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

From: "Huang, Sean Z" <sean.z.huang@intel.com>

The HW will generate a teardown interrupt when session termination is
required, which requires i915 to submit a terminating batch. Once the HW
is done with the termination it will generate another interrupt, at
which point it is safe to re-create the session.

Since the termination and re-creation flow is something we want to
trigger from the driver as well, use a common work function that can be
called both from the irq handler and from the driver set-up flows, which
has the addded benefit of allowing us to skip any extra locks because
the work itself serializes the operations.

v2: use struct completion instead of bool (Chris)
v3: drop locks, clean up functions and improve comments (Chris),
    move to common work function.
v4: improve comments, simplify wait logic (Rodrigo)
v5: unconditionally set interrupts, rename state_attacked var (Rodrigo)

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/Makefile                |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c       |  7 ++
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 66 +++++++++++--
 drivers/gpu/drm/i915/pxp/intel_pxp.h         |  8 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     | 99 ++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h     | 32 +++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 54 ++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h |  5 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     |  8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   | 18 ++++
 11 files changed, 283 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3a12d5ff5402..728e5947d6eb 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -284,6 +284,7 @@ i915-y += i915_perf.o
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp.o \
 	pxp/intel_pxp_cmd.o \
+	pxp/intel_pxp_irq.o \
 	pxp/intel_pxp_session.o \
 	pxp/intel_pxp_tee.o
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index b2de83be4d97..699a74582d32 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -13,6 +13,7 @@
 #include "intel_lrc_reg.h"
 #include "intel_uncore.h"
 #include "intel_rps.h"
+#include "pxp/intel_pxp_irq.h"
 
 static void guc_irq_handler(struct intel_guc *guc, u16 iir)
 {
@@ -64,6 +65,9 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 	if (instance == OTHER_GTPM_INSTANCE)
 		return gen11_rps_irq_handler(&gt->rps, iir);
 
+	if (instance == OTHER_KCR_INSTANCE)
+		return intel_pxp_irq_handler(&gt->pxp, iir);
+
 	WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
 		  instance, iir);
 }
@@ -196,6 +200,9 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
 	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
 	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
+
+	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_ENABLE, 0);
+	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_MASK,  ~0);
 }
 
 void gen11_gt_irq_postinstall(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8d4cf1e203ab..1d870c059d8c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8098,6 +8098,7 @@ enum {
 /* irq instances for OTHER_CLASS */
 #define OTHER_GUC_INSTANCE	0
 #define OTHER_GTPM_INSTANCE	1
+#define OTHER_KCR_INSTANCE	4
 
 #define GEN11_INTR_IDENTITY_REG(x)	_MMIO(0x190060 + ((x) * 4))
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 26176d43a02d..b0c7edc10cc3 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -2,7 +2,9 @@
 /*
  * Copyright(c) 2020 Intel Corporation.
  */
+#include <linux/workqueue.h>
 #include "intel_pxp.h"
+#include "intel_pxp_irq.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
 #include "gt/intel_context.h"
@@ -68,6 +70,16 @@ void intel_pxp_init(struct intel_pxp *pxp)
 
 	mutex_init(&pxp->tee_mutex);
 
+	/*
+	 * we'll use the completion to check if there is a termination pending,
+	 * so we start it as completed and we reinit it when a termination
+	 * is triggered.
+	 */
+	init_completion(&pxp->termination);
+	complete_all(&pxp->termination);
+
+	INIT_WORK(&pxp->session_work, intel_pxp_session_work);
+
 	ret = create_vcs_context(pxp);
 	if (ret)
 		return;
@@ -96,19 +108,61 @@ void intel_pxp_fini(struct intel_pxp *pxp)
 	destroy_vcs_context(pxp);
 }
 
-void intel_pxp_init_hw(struct intel_pxp *pxp)
+void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp)
 {
-	int ret;
+	pxp->arb_is_valid = false;
+	reinit_completion(&pxp->termination);
+}
+
+static void intel_pxp_queue_termination(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+
+	/*
+	 * We want to get the same effect as if we received a termination
+	 * interrupt, so just pretend that we did.
+	 */
+	spin_lock_irq(&gt->irq_lock);
+	intel_pxp_mark_termination_in_progress(pxp);
+	pxp->session_events |= PXP_TERMINATION_REQUEST;
+	queue_work(system_unbound_wq, &pxp->session_work);
+	spin_unlock_irq(&gt->irq_lock);
+}
 
+/*
+ * the arb session is restarted from the irq work when we receive the
+ * termination completion interrupt
+ */
+int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
+{
+	if (!intel_pxp_is_enabled(pxp))
+		return 0;
+
+	if (!wait_for_completion_timeout(&pxp->termination,
+					 msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+
+	if (!pxp->arb_is_valid)
+		return -EIO;
+
+	return 0;
+}
+
+void intel_pxp_init_hw(struct intel_pxp *pxp)
+{
 	kcr_pxp_enable(pxp_to_gt(pxp));
+	intel_pxp_irq_enable(pxp);
 
-	/* always emit a full termination to clean the state */
-	ret = intel_pxp_terminate_arb_session_and_global(pxp);
-	if (!ret)
-		intel_pxp_create_arb_session(pxp);
+	/*
+	 * the session could've been attacked while we weren't loaded, so
+	 * handle it as if it was and re-create it.
+	 */
+	intel_pxp_queue_termination(pxp);
 }
 
 void intel_pxp_fini_hw(struct intel_pxp *pxp)
 {
 	kcr_pxp_disable(pxp_to_gt(pxp));
+
+	intel_pxp_irq_disable(pxp);
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 8eeb65af78b1..8f1e86caa53f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -30,6 +30,9 @@ void intel_pxp_fini(struct intel_pxp *pxp);
 
 void intel_pxp_init_hw(struct intel_pxp *pxp);
 void intel_pxp_fini_hw(struct intel_pxp *pxp);
+
+void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
+int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_init(struct intel_pxp *pxp)
 {
@@ -38,6 +41,11 @@ static inline void intel_pxp_init(struct intel_pxp *pxp)
 static inline void intel_pxp_fini(struct intel_pxp *pxp)
 {
 }
+
+static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __INTEL_PXP_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
new file mode 100644
index 000000000000..46eca1e81b9b
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 Intel Corporation.
+ */
+#include <linux/workqueue.h>
+#include "intel_pxp.h"
+#include "intel_pxp_irq.h"
+#include "intel_pxp_session.h"
+#include "gt/intel_gt_irq.h"
+#include "i915_irq.h"
+#include "i915_reg.h"
+
+/**
+ * intel_pxp_irq_handler - Handles PXP interrupts.
+ * @pxp: pointer to pxp struct
+ * @iir: interrupt vector
+ */
+void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+
+	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
+		return;
+
+	lockdep_assert_held(&gt->irq_lock);
+
+	if (unlikely(!iir))
+		return;
+
+	if (iir & (GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT |
+		   GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT)) {
+		/* immediately mark PXP as inactive on termination */
+		intel_pxp_mark_termination_in_progress(pxp);
+		pxp->session_events |= PXP_TERMINATION_REQUEST;
+	}
+
+	if (iir & GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT)
+		pxp->session_events |= PXP_TERMINATION_COMPLETE;
+
+	if (pxp->session_events)
+		queue_work(system_unbound_wq, &pxp->session_work);
+}
+
+static inline void __pxp_set_interrupts(struct intel_gt *gt, u32 interrupts)
+{
+	struct intel_uncore *uncore = gt->uncore;
+	const u32 mask = interrupts << 16;
+
+	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_ENABLE, mask);
+	intel_uncore_write(uncore, GEN11_CRYPTO_RSVD_INTR_MASK,  ~mask);
+}
+
+static inline void pxp_irq_reset(struct intel_gt *gt)
+{
+	spin_lock_irq(&gt->irq_lock);
+	gen11_gt_reset_one_iir(gt, 0, GEN11_KCR);
+	spin_unlock_irq(&gt->irq_lock);
+}
+
+void intel_pxp_irq_enable(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+
+	spin_lock_irq(&gt->irq_lock);
+
+	if (!pxp->irq_enabled)
+		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_KCR));
+
+	__pxp_set_interrupts(gt, GEN12_PXP_INTERRUPTS);
+	pxp->irq_enabled = true;
+
+	spin_unlock_irq(&gt->irq_lock);
+}
+
+void intel_pxp_irq_disable(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+
+	/*
+	 * We always need to submit a global termination when we re-enable the
+	 * interrupts, so there is no need to make sure that the session state
+	 * makes sense at the end of this function. Just make sure this is not
+	 * called in a path were the driver consider the session as valid and
+	 * doesn't call a termination on restart.
+	 */
+	GEM_WARN_ON(intel_pxp_is_active(pxp));
+
+	spin_lock_irq(&gt->irq_lock);
+
+	pxp->irq_enabled = false;
+	__pxp_set_interrupts(gt, 0);
+
+	spin_unlock_irq(&gt->irq_lock);
+	intel_synchronize_irq(gt->i915);
+
+	pxp_irq_reset(gt);
+
+	flush_work(&pxp->session_work);
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
new file mode 100644
index 000000000000..8b5793654844
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_IRQ_H__
+#define __INTEL_PXP_IRQ_H__
+
+#include <linux/types.h>
+
+struct intel_pxp;
+
+#define GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT BIT(1)
+#define GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT BIT(2)
+#define GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT BIT(3)
+
+#define GEN12_PXP_INTERRUPTS \
+	(GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT | \
+	 GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT | \
+	 GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT)
+
+#ifdef CONFIG_DRM_I915_PXP
+void intel_pxp_irq_enable(struct intel_pxp *pxp);
+void intel_pxp_irq_disable(struct intel_pxp *pxp);
+void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir);
+#else
+static inline void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
+{
+}
+#endif
+
+#endif /* __INTEL_PXP_IRQ_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index b8e24adeb1f3..67c30e534d50 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -48,7 +48,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
 	return ret;
 }
 
-int intel_pxp_create_arb_session(struct intel_pxp *pxp)
+static int pxp_create_arb_session(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = pxp_to_gt(pxp);
 	int ret;
@@ -77,12 +77,13 @@ int intel_pxp_create_arb_session(struct intel_pxp *pxp)
 	return 0;
 }
 
-int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
+static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 {
 	int ret;
 	struct intel_gt *gt = pxp_to_gt(pxp);
 
-	pxp->arb_is_valid = false;
+	/* must mark termination in progress calling this function */
+	GEM_WARN_ON(pxp->arb_is_valid);
 
 	/* terminate the hw sessions */
 	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
@@ -101,3 +102,50 @@ int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 
 	return ret;
 }
+
+static void pxp_terminate(struct intel_pxp *pxp)
+{
+	int ret;
+
+	pxp->hw_state_invalidated = true;
+
+	/*
+	 * if we fail to submit the termination there is no point in waiting for
+	 * it to complete. PXP will be marked as non-active until the next
+	 * termination is issued.
+	 */
+	ret = pxp_terminate_arb_session_and_global(pxp);
+	if (ret)
+		complete_all(&pxp->termination);
+}
+
+static void pxp_terminate_complete(struct intel_pxp *pxp)
+{
+	/* Re-create the arb session after teardown handle complete */
+	if (fetch_and_zero(&pxp->hw_state_invalidated))
+		pxp_create_arb_session(pxp);
+
+	complete_all(&pxp->termination);
+}
+
+void intel_pxp_session_work(struct work_struct *work)
+{
+	struct intel_pxp *pxp = container_of(work, typeof(*pxp), session_work);
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	u32 events = 0;
+
+	spin_lock_irq(&gt->irq_lock);
+	events = fetch_and_zero(&pxp->session_events);
+	spin_unlock_irq(&gt->irq_lock);
+
+	if (!events)
+		return;
+
+	if (events & PXP_TERMINATION_REQUEST) {
+		events &= ~PXP_TERMINATION_COMPLETE;
+		pxp_terminate(pxp);
+	}
+
+	if (events & PXP_TERMINATION_COMPLETE)
+		pxp_terminate_complete(pxp);
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
index 7354314b1cc4..ba4c9d2b94b7 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
@@ -8,9 +8,8 @@
 
 #include <linux/types.h>
 
-struct intel_pxp;
+struct work_struct;
 
-int intel_pxp_create_arb_session(struct intel_pxp *pxp);
-int intel_pxp_terminate_arb_session_and_global(struct intel_pxp *pxp);
+void intel_pxp_session_work(struct work_struct *work);
 
 #endif /* __INTEL_PXP_SESSION_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 89513a5566b4..5495d83a80c5 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -80,6 +80,7 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 {
 	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
 	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
+	int ret;
 
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = data;
@@ -88,15 +89,14 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 
 	/* the component is required to fully start the PXP HW */
 	intel_pxp_init_hw(pxp);
-
-	if (!pxp->arb_is_valid) {
+	ret = intel_pxp_wait_for_arb_start(pxp);
+	if (ret) {
 		drm_err(&i915->drm, "Failed to create arb session during bind\n");
 		intel_pxp_fini_hw(pxp);
 		pxp->pxp_component = NULL;
-		return -EIO;
 	}
 
-	return 0;
+	return ret;
 }
 
 static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index d393e46a7d98..5a170e43c959 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -6,8 +6,10 @@
 #ifndef __INTEL_PXP_TYPES_H__
 #define __INTEL_PXP_TYPES_H__
 
+#include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 struct intel_context;
 struct i915_pxp_component;
@@ -26,6 +28,22 @@ struct intel_pxp {
 	bool arb_is_valid;
 
 	struct mutex tee_mutex; /* protects the tee channel binding */
+
+	/*
+	 * If the HW perceives an attack on the integrity of the encryption it
+	 * will invalidate the keys and expect SW to re-initialize the session.
+	 * We keep track of this state to make sure we only re-start the arb
+	 * session when required.
+	 */
+	bool hw_state_invalidated;
+
+	bool irq_enabled;
+	struct completion termination;
+
+	struct work_struct session_work;
+	u32 session_events; /* protected with gt->irq_lock */
+#define PXP_TERMINATION_REQUEST  BIT(0)
+#define PXP_TERMINATION_COMPLETE BIT(1)
 };
 
 #endif /* __INTEL_PXP_TYPES_H__ */
-- 
2.25.1

