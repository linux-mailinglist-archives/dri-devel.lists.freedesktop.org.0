Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8786082BA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E389010E4D0;
	Sat, 22 Oct 2022 00:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5139710E352;
 Sat, 22 Oct 2022 00:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666397271; x=1697933271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E8zwaKB5sJXnDT2MxtPw9ZcyxO0jzVmZxUKYBC0OESM=;
 b=ZDLiiexTfEXUWmhRGFFNrdmoxM0oH6WnQBG3mW3r8iUVNg5fWKWmrmOm
 ifSY5IoCnvWCf+cbMbyVhKmN7ltH8yYFIcjlf5t1SMdEZu9EwGPmYgH7A
 xR8OQIgtrE+joTqf7mrqLZKDIG6k/Ltcpv/39kIlcz5yOFaA4AGZdxrOu
 spXjPdqQL04Afp1lgpiZj4txNQiy7K/rO/wshGtxdDY20GSEVdy4+2YoV
 Iaiy2Ge/fbKSvJqNNhk7XtiffAQGi6BTGZCPNFoSVPZrMBphoQqNz8r5c
 QgPMiSERqmmY0AkDH3ail+CH6Ww2OCwR8IRhNkL8e6ljazqmX7ECNX4F4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371354933"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="371354933"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693917249"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="693917249"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:50 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/i915/guc: handle interrupts from media GuC
Date: Fri, 21 Oct 2022 17:10:08 -0700
Message-Id: <20221022001008.2340224-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
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
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The render and media GuCs share the same interrupt enable register, so
we can no longer disable interrupts when we disable communication for
one of the GuCs as this would impact the other GuC. Instead, we keep the
interrupts always enabled in HW and use a variable in the GuC structure
to determine if we want to service the received interrupts or not.

v2: use MTL_ prefix for reg definition (Matt)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 21 ++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c  | 29 ++++++++++++++-----------
 drivers/gpu/drm/i915/gt/uc/intel_guc.h  |  5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c   |  8 +++++--
 5 files changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index f26882fdc24c..f6805088c0eb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -17,6 +17,9 @@
 
 static void guc_irq_handler(struct intel_guc *guc, u16 iir)
 {
+	if (unlikely(!guc->interrupts.enabled))
+		return;
+
 	if (iir & GUC_INTR_GUC2HOST)
 		intel_guc_to_host_event_handler(guc);
 }
@@ -249,6 +252,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 {
 	struct intel_uncore *uncore = gt->uncore;
 	u32 irqs = GT_RENDER_USER_INTERRUPT;
+	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
 	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
 	u32 dmask;
 	u32 smask;
@@ -299,6 +303,19 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	if (HAS_HECI_GSC(gt->i915))
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
 
+	if (guc_mask) {
+		/* the enable bit is common for both GTs but the masks are separate */
+		u32 mask = gt->type == GT_MEDIA ?
+			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
+			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
+
+		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
+				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
+
+		/* we might not be the first GT to write this reg */
+		intel_uncore_rmw(uncore, MTL_GUC_MGUC_INTR_MASK, mask, 0);
+	}
+
 	/*
 	 * RPS interrupts will get enabled/disabled on demand when RPS itself
 	 * is enabled/disabled.
@@ -307,10 +324,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	gt->pm_imr = ~gt->pm_ier;
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
-
-	/* Same thing for GuC interrupts */
-	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
-	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
 }
 
 void gen5_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 36d95b79022c..868eaf3f37da 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1548,6 +1548,7 @@
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
 #define   GEN11_GUC				(25)
+#define   MTL_MGUC				(24)
 #define   GEN11_WDPERF				(20)
 #define   GEN11_KCR				(19)
 #define   GEN11_GTPM				(16)
@@ -1602,6 +1603,7 @@
 #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
 #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
 #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
+#define MTL_GUC_MGUC_INTR_MASK			_MMIO(0x1900e8) /* MTL+ */
 #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
 #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
 #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index b3600be61a9a..09f2a673aa19 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -98,6 +98,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 		     gt->pm_guc_events);
 	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(gt->irq_lock);
+
+	guc->interrupts.enabled = true;
 }
 
 static void gen9_disable_guc_interrupts(struct intel_guc *guc)
@@ -105,6 +107,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
+	guc->interrupts.enabled = false;
 
 	spin_lock_irq(gt->irq_lock);
 
@@ -116,39 +119,39 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	gen9_reset_guc_interrupts(guc);
 }
 
+static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
+{
+	u32 irq = gt->type == GT_MEDIA ? MTL_MGUC : GEN11_GUC;
+
+	lockdep_assert_held(gt->irq_lock);
+	return gen11_gt_reset_one_iir(gt, 0, irq);
+}
+
 static void gen11_reset_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	spin_lock_irq(gt->irq_lock);
-	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
+	__gen11_reset_guc_interrupts(gt);
 	spin_unlock_irq(gt->irq_lock);
 }
 
 static void gen11_enable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
 
 	spin_lock_irq(gt->irq_lock);
-	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
-	intel_uncore_write(gt->uncore,
-			   GEN11_GUC_SG_INTR_ENABLE, events);
-	intel_uncore_write(gt->uncore,
-			   GEN11_GUC_SG_INTR_MASK, ~events);
+	__gen11_reset_guc_interrupts(gt);
 	spin_unlock_irq(gt->irq_lock);
+
+	guc->interrupts.enabled = true;
 }
 
 static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	spin_lock_irq(gt->irq_lock);
-
-	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
-	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
-
-	spin_unlock_irq(gt->irq_lock);
+	guc->interrupts.enabled = false;
 	intel_synchronize_irq(gt->i915);
 
 	gen11_reset_guc_interrupts(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 804133df1ac9..061d55de3a94 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -78,6 +78,7 @@ struct intel_guc {
 
 	/** @interrupts: pointers to GuC interrupt-managing functions. */
 	struct {
+		bool enabled;
 		void (*reset)(struct intel_guc *guc);
 		void (*enable)(struct intel_guc *guc);
 		void (*disable)(struct intel_guc *guc);
@@ -316,9 +317,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
 	return err;
 }
 
+/* Only call this from the interrupt handler code */
 static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
 {
-	intel_guc_ct_event_handler(&guc->ct);
+	if (guc->interrupts.enabled)
+		intel_guc_ct_event_handler(&guc->ct);
 }
 
 /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4cd8a787f9e5..1d28286e6f06 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -636,8 +636,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
 
-	if (!intel_guc_is_ready(guc))
+	if (!intel_guc_is_ready(guc)) {
+		guc->interrupts.enabled = false;
 		return;
+	}
 
 	/*
 	 * Wait for any outstanding CTB before tearing down communication /w the
@@ -657,8 +659,10 @@ void intel_uc_suspend(struct intel_uc *uc)
 	intel_wakeref_t wakeref;
 	int err;
 
-	if (!intel_guc_is_ready(guc))
+	if (!intel_guc_is_ready(guc)) {
+		guc->interrupts.enabled = false;
 		return;
+	}
 
 	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
 		err = intel_guc_suspend(guc);
-- 
2.37.3

