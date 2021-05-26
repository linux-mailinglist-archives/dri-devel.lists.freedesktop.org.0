Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C2391099
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 08:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071C86EBED;
	Wed, 26 May 2021 06:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222656E0BE;
 Wed, 26 May 2021 06:24:50 +0000 (UTC)
IronPort-SDR: hPHhdY3YKAU5TlkWfvcGCNArnmII4qVk5eCyE86HkPr1Nm+mrsXcBgNeqIlmSZyHTwD6YKGFkh
 DKTD2qJKNOBA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182033736"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="182033736"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:48 -0700
IronPort-SDR: wCGQhvwImU3eSsPIyFzlFGYLEnUm16Cavyh4QnZe+zc4I6SU3IojfKqyv+DYn86yK4quTMujR8
 xx4OfiS2CyAw==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="633376799"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/18] drm/i915/guc: Drop guc->interrupts.enabled
Date: Tue, 25 May 2021 23:42:25 -0700
Message-Id: <20210526064237.77853-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210526064237.77853-1-matthew.brost@intel.com>
References: <20210526064237.77853-1-matthew.brost@intel.com>
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
Cc: Michal.Wajdeczko@intel.com
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

