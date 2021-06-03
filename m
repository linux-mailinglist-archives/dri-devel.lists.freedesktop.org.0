Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC3399975
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 06:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83876F3A2;
	Thu,  3 Jun 2021 04:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE6B6F39E;
 Thu,  3 Jun 2021 04:58:41 +0000 (UTC)
IronPort-SDR: mnUUt8pe1Ql/tigypYabJI3dOTRO6lKGN4pCBQgcFnCNP55Q7w8i8d1vg/CFMmZdNS5iGxKgo8
 NdFul4KBE4uw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203956507"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203956507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:40 -0700
IronPort-SDR: B9W8sTV62D1ss0TxRy80QZ8XAw0p0R9qmPFy6TvQKMAQuQpslL76vPA3EzqLMeOkt6yO85hhxs
 24wncdvhrs7g==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480019999"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/20] drm/i915/guc: Drop guc->interrupts.enabled
Date: Wed,  2 Jun 2021 22:16:16 -0700
Message-Id: <20210603051630.2635-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210603051630.2635-1-matthew.brost@intel.com>
References: <20210603051630.2635-1-matthew.brost@intel.com>
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
Cc: daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the variable guc->interrupts.enabled as this variable is just
leading to bugs creeping into the code.

e.g. A full GPU reset disables the GuC interrupts but forgot to clear
guc->interrupts.enabled, guc->interrupts.enabled being true suppresses
interrupts from getting re-enabled and now we are broken.

It is harmless to enable interrupt while already enabled so let's just
delete this variable to avoid bugs like this going forward.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 27 +++++++++-----------------
 drivers/gpu/drm/i915/gt/uc/intel_guc.h |  1 -
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index ab2c8fe8cdfa..18da9ed15728 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -96,12 +96,9 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
 
 	spin_lock_irq(&gt->irq_lock);
-	if (!guc->interrupts.enabled) {
-		WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
-			     gt->pm_guc_events);
-		guc->interrupts.enabled = true;
-		gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
-	}
+	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
+		     gt->pm_guc_events);
+	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(&gt->irq_lock);
 }
 
@@ -112,7 +109,6 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
 
 	spin_lock_irq(&gt->irq_lock);
-	guc->interrupts.enabled = false;
 
 	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
 
@@ -134,18 +130,14 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
 static void gen11_enable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
+	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
 
 	spin_lock_irq(&gt->irq_lock);
-	if (!guc->interrupts.enabled) {
-		u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
-
-		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
-		intel_uncore_write(gt->uncore,
-				   GEN11_GUC_SG_INTR_ENABLE, events);
-		intel_uncore_write(gt->uncore,
-				   GEN11_GUC_SG_INTR_MASK, ~events);
-		guc->interrupts.enabled = true;
-	}
+	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+	intel_uncore_write(gt->uncore,
+			   GEN11_GUC_SG_INTR_ENABLE, events);
+	intel_uncore_write(gt->uncore,
+			   GEN11_GUC_SG_INTR_MASK, ~events);
 	spin_unlock_irq(&gt->irq_lock);
 }
 
@@ -154,7 +146,6 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	spin_lock_irq(&gt->irq_lock);
-	guc->interrupts.enabled = false;
 
 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index c20f3839de12..4abc59f6f3cd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -33,7 +33,6 @@ struct intel_guc {
 	unsigned int msg_enabled_mask;
 
 	struct {
-		bool enabled;
 		void (*reset)(struct intel_guc *guc);
 		void (*enable)(struct intel_guc *guc);
 		void (*disable)(struct intel_guc *guc);
-- 
2.28.0

