Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554CB408AA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB1110E1E3;
	Tue,  2 Sep 2025 15:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VevwAiwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565DB10E793;
 Tue,  2 Sep 2025 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756826062; x=1788362062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kmn/EYOXL3fOQoAgg2oSPK75walN01UOPO+cV7rnUSA=;
 b=VevwAiwyoQWyoF3KviR3RcHvuNKhpEMV5JCGOwS4AKL4MmPLxSrLUlPQ
 BY0gNwW9VscSgH9bUppVcx88A72h7FCBySoU4/2NODQx72GPYsMpzTL7f
 tZehong3khlcWsyCH9wxcOGWMJoPVmSmJVkYgkE6yiPxaHklZhdSJdq7S
 +OSurnO9v7IVWrIYL6XOEJc4yQX+lYntEavsJpdSg4nl23Q6GjIzUrqJ1
 UBFN0Ah0TyvuC1nQ3MBtsE/EAKYfrs6CNjEKwn76plTU9N8FjFzkSwKpc
 1WsCz4U+vjkc+NrTShfrWAWD2ktwMpr2UtBhU6RedaAkoinEtAhl5vxpB Q==;
X-CSE-ConnectionGUID: UERHjQArQHab+YL2N2/uaQ==
X-CSE-MsgGUID: Gh2lcTzCQguJcdP0Z0Ephw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59054721"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59054721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 08:14:22 -0700
X-CSE-ConnectionGUID: VWFpbNYGQRWqY+UX76UTww==
X-CSE-MsgGUID: LjvaMp8ASruLeX9MLqx/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="202224717"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 02 Sep 2025 08:14:22 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4] drm/i915/guc: Add synchronization on interrupt enable flag
Date: Tue,  2 Sep 2025 11:14:19 -0400
Message-Id: <20250902151419.231828-1-zhanjun.dong@intel.com>
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

Boolean flag access from interrupt context might have synchronous issueis
on multiple processor platform, flags modified by one core might be read
as an old value by another core. This issue on interrupt enable flag might
causes interrupt misses or leakage.
Change the interrupts.enable type to atomic to ensure memory
synchronization.

Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

---
Change history:
v4: Add back skip on disabled case for tasklet
v3: Drop skip on disabled case for tasklet
    Drop memory barrier
v2: Add skip on disabled case for tasklet
    Add memory barrier after flag changed
    Add Closes tag and typo fix
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 11 +++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc.h    |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  3 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  5 +++--
 5 files changed, 16 insertions(+), 9 deletions(-)

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
index f360f020d8f1..1b8d3bbfa16d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -100,8 +100,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 			 gt->pm_guc_events);
 	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(gt->irq_lock);
+	atomic_set(&guc->interrupts.enabled, true);
 
-	guc->interrupts.enabled = true;
 }
 
 static void gen9_disable_guc_interrupts(struct intel_guc *guc)
@@ -109,7 +109,8 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
-	guc->interrupts.enabled = false;
+	atomic_set(&guc->interrupts.enabled, false);
+
 
 	spin_lock_irq(gt->irq_lock);
 
@@ -146,14 +147,16 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
 	__gen11_reset_guc_interrupts(gt);
 	spin_unlock_irq(gt->irq_lock);
 
-	guc->interrupts.enabled = true;
+	atomic_set(&guc->interrupts.enabled, true);
+
 }
 
 static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	guc->interrupts.enabled = false;
+	atomic_set(&guc->interrupts.enabled, false);
+
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
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 380a11c92d63..f0ee3f1235d4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1326,6 +1326,9 @@ static void ct_try_receive_message(struct intel_guc_ct *ct)
 {
 	int ret;
 
+	if (!atomic_read(&ct_to_guc(ct)->interrupts.enabled))
+		return;
+
 	if (GEM_WARN_ON(!ct->enabled))
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4a3493e8d433..9d01c3c3d504 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -659,7 +659,8 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
 	struct intel_guc *guc = &uc->guc;
 
 	if (!intel_guc_is_ready(guc)) {
-		guc->interrupts.enabled = false;
+		atomic_set(&guc->interrupts.enabled, false);
+
 		return;
 	}
 
@@ -687,7 +688,7 @@ void intel_uc_suspend(struct intel_uc *uc)
 	wake_up_all_tlb_invalidate(guc);
 
 	if (!intel_guc_is_ready(guc)) {
-		guc->interrupts.enabled = false;
+		atomic_set(&guc->interrupts.enabled, false);
 		return;
 	}
 
-- 
2.34.1

