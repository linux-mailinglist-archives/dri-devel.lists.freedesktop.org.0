Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFC5E6F6E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD4C10E4BB;
	Thu, 22 Sep 2022 22:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC2210E476;
 Thu, 22 Sep 2022 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663884632; x=1695420632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ATRCCKT+K2h9OzfUZcSHsOOJ2ehYpfopqXO5XNSmXK4=;
 b=EzDsY1XoAr7CICcAMFd+MGbznnAO29y8DPV5qhYzkyB7Hca/NHYpX1jn
 DUVVytrGWkZ6b+Sh+WMCLwOZh4JhJixUet9fr3cqDakBfcfimvUUsm1Qt
 gcvnTHBhFmh+3JCCFTToSodE90b4ym7N0NBwrwX8q3+H4nu36tPqQuS1X
 0swTrCJXAJi2ZD8p+OdghixR5HFtJ7dgKp4///wgxcmV+/LNvSCWiUu5+
 EMjIE4+K0J0nhcXRVZo54EAENJBmnX+4DytVgFfiI5pElvOdVMO9R3Il1
 jc//yvKcGn1SktP0UiRegS3qUYI8XPEdhFjZ0We3j6ZFDdO9jTky4SfFP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280815519"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280815519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682416264"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/guc: handle interrupts from media GuC
Date: Thu, 22 Sep 2022 15:11:17 -0700
Message-Id: <20220922221117.458087-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
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
index f26882fdc24c..e33ed9ae1439 100644
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
+		intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);
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
index 1cbb7226400b..792809e49680 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1519,6 +1519,7 @@
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
 #define   GEN11_GUC				(25)
+#define   GEN12_GUCM				(24)
 #define   GEN11_WDPERF				(20)
 #define   GEN11_KCR				(19)
 #define   GEN11_GTPM				(16)
@@ -1573,6 +1574,7 @@
 #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
 #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
 #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
+#define GEN12_GUC_MGUC_INTR_MASK		_MMIO(0x1900e8) /* MTL+ */
 #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
 #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
 #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index b0beab44b34c..ab0263d8e1cf 100644
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
+	u32 irq = gt->type == GT_MEDIA ? GEN12_GUCM : GEN11_GUC;
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

