Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C2B31AF4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D28F10EB13;
	Fri, 22 Aug 2025 14:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmTESZ4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D4A10EB11;
 Fri, 22 Aug 2025 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755872039; x=1787408039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WY/mNOgVzxPPl/a4QmHxVp5UcRQ++xugBReajW2kpoE=;
 b=LmTESZ4qi7crsK1msPZQseGsgSuQstA1Nc1b2Yhs58CBxEwb/bwOM0+f
 7R1+rHXaSAnR/+A1Thm3bIA6VoF1fRbEpsPak+4ZdiyyUuTXC9/PgBL9L
 O4C3jAmSfoOBHXtykb38sWZoc3BJH0R6mYhutWGJASykM+bGnzk6DRNTr
 GeyIPgvzybekYIXD3uA95oDu8JEV+a4skIAwWK+/U/5/i3EwURBP+bWk4
 3yqg/iJqoM+B0E55ASey9g1qoCBAnLxDEkZ914MXv45SwsjgZ2Rt3d8jU
 rDhwPJjsDYnBRs6CngmG1OqYyL3bXinDQm+BIIiFiYT8CQk4qDxVXVxcP w==;
X-CSE-ConnectionGUID: kp16OdSdSquO3JuXrepCaQ==
X-CSE-MsgGUID: 2UDM80fCR5itdhR7fPoAZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69280680"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="69280680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 07:13:58 -0700
X-CSE-ConnectionGUID: G9cYe5vWRsu//bPDtZLYyA==
X-CSE-MsgGUID: CeSN3gLxRJi9jTKNRNiivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169079861"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa008.fm.intel.com with ESMTP; 22 Aug 2025 07:13:58 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2] drm/i915/guc: Add synchronization on interrupt enable flag
Date: Fri, 22 Aug 2025 10:13:56 -0400
Message-Id: <20250822141356.3775250-1-zhanjun.dong@intel.com>
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
v2: Add skip on disabled case for tasklet
    Add memory barrier after flag changed
    Add Closes tag and typo fix
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 17 ++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc.h    |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  3 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  8 ++++++--
 5 files changed, 24 insertions(+), 10 deletions(-)

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
index f360f020d8f1..48148cb6cba0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -100,8 +100,9 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 			 gt->pm_guc_events);
 	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(gt->irq_lock);
-
-	guc->interrupts.enabled = true;
+	atomic_set(&guc->interrupts.enabled, true);
+	/* make sure interrupt handler will see changes */
+	smp_mb();
 }
 
 static void gen9_disable_guc_interrupts(struct intel_guc *guc)
@@ -109,7 +110,9 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
-	guc->interrupts.enabled = false;
+	atomic_set(&guc->interrupts.enabled, false);
+	/* make sure interrupt handler will see changes */
+	smp_mb();
 
 	spin_lock_irq(gt->irq_lock);
 
@@ -146,14 +149,18 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
 	__gen11_reset_guc_interrupts(gt);
 	spin_unlock_irq(gt->irq_lock);
 
-	guc->interrupts.enabled = true;
+	atomic_set(&guc->interrupts.enabled, true);
+	/* make sure interrupt handler will see changes */
+	smp_mb();
 }
 
 static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	guc->interrupts.enabled = false;
+	atomic_set(&guc->interrupts.enabled, false);
+	/* make sure interrupt handler will see changes */
+	smp_mb();
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
index 4a3493e8d433..050ea821bb60 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -659,7 +659,9 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
 	struct intel_guc *guc = &uc->guc;
 
 	if (!intel_guc_is_ready(guc)) {
-		guc->interrupts.enabled = false;
+		atomic_set(&guc->interrupts.enabled, false);
+		/* make sure interrupt handler will see changes */
+		smp_mb();
 		return;
 	}
 
@@ -687,7 +689,9 @@ void intel_uc_suspend(struct intel_uc *uc)
 	wake_up_all_tlb_invalidate(guc);
 
 	if (!intel_guc_is_ready(guc)) {
-		guc->interrupts.enabled = false;
+		atomic_set(&guc->interrupts.enabled, false);
+		/* make sure interrupt handler will see changes */
+		smp_mb();
 		return;
 	}
 
-- 
2.34.1

