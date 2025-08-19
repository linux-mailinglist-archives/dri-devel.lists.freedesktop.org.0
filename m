Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094BB2C8EB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 18:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3436010E168;
	Tue, 19 Aug 2025 16:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTjHtBZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F5110E168;
 Tue, 19 Aug 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755619214; x=1787155214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cCwDxDODmwbRU5XMbFbiZPazbKkj9/JlBgaM35ZaPaM=;
 b=CTjHtBZ3TXta1r9+6t+uLMoN3LgifTGnSJSMtw9b9d72Vfq97pQ2zmF+
 xCSPf6ghSHbiMJxR9l4vlO6wQLALDc2vrmAIQdHjpJHpdT8Xyr+Ju1pqC
 owodX0Csfkbmg9mbvsOB72HVLtvnuDTTMK90zrtxg67uD7O+8WabDh17j
 WgnO3EpcYgNk/pXvYulfzw6AcnQFSLClZ6K7yvoZLt0ucnc7dvFqhhVPz
 +pxyExo/QCR16Ysx84Fj5UyJDd2HZdST0GByunV3Tzxp16Zx8WJBbbjuj
 5DEOk5U6uXRysoGii4NZBg5jzqxOcpflM09Um9C2Dyn+ikiY6M7STK4Tn Q==;
X-CSE-ConnectionGUID: xf7aSGazSpOpOL2BOAnc6w==
X-CSE-MsgGUID: uZ6tVh9jT5CA79xZg+UT3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57724198"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57724198"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:00:13 -0700
X-CSE-ConnectionGUID: NNzwqGTJTmyD+T0+cAKYGA==
X-CSE-MsgGUID: L88yu1TvSiWbYeIwxrY3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167063639"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa006.jf.intel.com with ESMTP; 19 Aug 2025 09:00:13 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/i915/guc: Add synchronization on interrupt enable flag
Date: Tue, 19 Aug 2025 12:00:10 -0400
Message-Id: <20250819160010.3386940-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Boolean flag access from interrupt context might have synchronous issue on
multiple processor platform, flage modified by one core might be read as an
old value by another core. This issue on interrupt enable flag might causes
interrupt missing or leakage.
Fixed by change the data type as automic to add memory synchronization.

Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 8 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc.c  | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 75e802e10be2..21804eec8320 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -20,7 +20,7 @@
 
 static void guc_irq_handler(struct intel_guc *guc, u16 iir)
 {
-	if (unlikely(!guc->interrupts.enabled))
+	if (unlikely(!atomic_read(&guc->interrupts.enabled)))
 		return;
 
 	if (iir & GUC_INTR_GUC2HOST)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index f360f020d8f1..398651b1ba60 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -101,7 +101,7 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(gt->irq_lock);
 
-	guc->interrupts.enabled = true;
+	atomic_set(&guc->interrupts.enabled, true);
 }
 
 static void gen9_disable_guc_interrupts(struct intel_guc *guc)
@@ -109,7 +109,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
-	guc->interrupts.enabled = false;
+	atomic_set(&guc->interrupts.enabled, false);
 
 	spin_lock_irq(gt->irq_lock);
 
@@ -146,14 +146,14 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
 	__gen11_reset_guc_interrupts(gt);
 	spin_unlock_irq(gt->irq_lock);
 
-	guc->interrupts.enabled = true;
+	atomic_set(&guc->interrupts.enabled, true);
 }
 
 static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	guc->interrupts.enabled = false;
+	atomic_set(&guc->interrupts.enabled, false);
 	intel_synchronize_irq(gt->i915);
 
 	gen11_reset_guc_interrupts(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 053780f562c1..40242bbb166e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -93,7 +93,7 @@ struct intel_guc {
 
 	/** @interrupts: pointers to GuC interrupt-managing functions. */
 	struct {
-		bool enabled;
+		atomic_t enabled;
 		void (*reset)(struct intel_guc *guc);
 		void (*enable)(struct intel_guc *guc);
 		void (*disable)(struct intel_guc *guc);
@@ -393,7 +393,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
 /* Only call this from the interrupt handler code */
 static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
 {
-	if (guc->interrupts.enabled)
+	if (atomic_read(&guc->interrupts.enabled))
 		intel_guc_ct_event_handler(&guc->ct);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4a3493e8d433..964917387c08 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -659,7 +659,7 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
 	struct intel_guc *guc = &uc->guc;
 
 	if (!intel_guc_is_ready(guc)) {
-		guc->interrupts.enabled = false;
+		atomic_set(&guc->interrupts.enabled, false);
 		return;
 	}
 
@@ -687,7 +687,7 @@ void intel_uc_suspend(struct intel_uc *uc)
 	wake_up_all_tlb_invalidate(guc);
 
 	if (!intel_guc_is_ready(guc)) {
-		guc->interrupts.enabled = false;
+		atomic_set(&guc->interrupts.enabled, false);
 		return;
 	}
 
-- 
2.34.1

