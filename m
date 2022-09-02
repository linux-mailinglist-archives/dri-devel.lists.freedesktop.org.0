Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBD5ABB2E
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135D810E943;
	Fri,  2 Sep 2022 23:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DAD10E93C;
 Fri,  2 Sep 2022 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161593; x=1693697593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RmkDJYawMc/a1pglnZTCX5PQIkN9i4/ssq5IZQk2YXw=;
 b=S2xz/ctGiWrDts94jApBMtA7mRxWSZ8yzjKIP1LZsCvWlx6J7xys8ir2
 ZZrFJDfKz6SLIiebK0boYBJvG/cwzCTWYofGd+MgtYOH55FA/EHBy6tlM
 Sn7dbWHQ9ymw/Adcuf5d5DVoovTuPmDNolnJBUEI33u2OZzJfyF1BRTvv
 joZrJDyM/I0tbGRvY9XygA70KvebIugKMRk3XsPnt84LTRD9/ipEbw9kx
 nn41pyf6XZnKuNRrDBWqeHuEhCyprBi7+s+xiubGOM0vtfToKkZ+KBwuj
 RLvzNLAhYsEzzUp+XmBoH7jrONwkTS3tJyi4lbrSiMQko4/Ugm2chD4V4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360064660"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="360064660"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464187"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/12] drm/i915: Only hook up uncore->debug for primary
 uncore
Date: Fri,  2 Sep 2022 16:32:47 -0700
Message-Id: <20220902233257.3088492-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902233257.3088492-1-matthew.d.roper@intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The original intent of intel_uncore_mmio_debug as described in commit
0a9b26306d6a ("drm/i915: split out uncore_mmio_debug") was to be a
singleton structure that could be shared between multiple GTs' uncore
objects in a multi-tile system.  Somehow we went off track and
started allocating separate instances of this structure for each GT,
which defeats that original goal.

But in reality, there isn't even a need to share the mmio_debug between
multiple GTs; on all modern platforms (i.e., everything after gen7)
unclaimed register accesses are something that can only be detected for
display registers.  There's no point in grabbing the debug spinlock and
checking for unclaimed accesses on an uncore used by an xehpsdv or pvc
remote tile GT, or the uncore used by a mtl standalone media GT since
all of the display accesses go through the primary intel_uncore.

The simplest solution is to simply leave uncore->debug NULL on all
intel_uncore instances except for the primary one.  This will allow us
to avoid the pointless debug spinlock acquisition we've been doing on
MMIO accesses coming in through these intel_uncores.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c  |  9 ---------
 drivers/gpu/drm/i915/i915_driver.c  |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c | 23 ++++++++++++++++++-----
 drivers/gpu/drm/i915/intel_uncore.h |  3 +--
 4 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e4bac2431e41..a82b5e2e0d83 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -781,21 +781,13 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
 	int ret;
 
 	if (!gt_is_root(gt)) {
-		struct intel_uncore_mmio_debug *mmio_debug;
 		struct intel_uncore *uncore;
 
 		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
 		if (!uncore)
 			return -ENOMEM;
 
-		mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
-		if (!mmio_debug) {
-			kfree(uncore);
-			return -ENOMEM;
-		}
-
 		gt->uncore = uncore;
-		gt->uncore->debug = mmio_debug;
 
 		__intel_gt_init_early(gt);
 	}
@@ -817,7 +809,6 @@ intel_gt_tile_cleanup(struct intel_gt *gt)
 	intel_uncore_cleanup_mmio(gt->uncore);
 
 	if (!gt_is_root(gt)) {
-		kfree(gt->uncore->debug);
 		kfree(gt->uncore);
 		kfree(gt);
 	}
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 56a2bcddb2af..18acba1bc3b0 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -326,7 +326,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	intel_device_info_subplatform_init(dev_priv);
 	intel_step_init(dev_priv);
 
-	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
+	intel_uncore_mmio_debug_init_early(dev_priv);
 
 	spin_lock_init(&dev_priv->irq_lock);
 	spin_lock_init(&dev_priv->gpu_error.lock);
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e717ea55484a..6841f76533f9 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -44,14 +44,19 @@ fw_domains_get(struct intel_uncore *uncore, enum forcewake_domains fw_domains)
 }
 
 void
-intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_debug)
+intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915)
 {
-	spin_lock_init(&mmio_debug->lock);
-	mmio_debug->unclaimed_mmio_check = 1;
+	spin_lock_init(&i915->mmio_debug.lock);
+	i915->mmio_debug.unclaimed_mmio_check = 1;
+
+	i915->uncore.debug = &i915->mmio_debug;
 }
 
 static void mmio_debug_suspend(struct intel_uncore *uncore)
 {
+	if (!uncore->debug)
+		return;
+
 	spin_lock(&uncore->debug->lock);
 
 	/* Save and disable mmio debugging for the user bypass */
@@ -67,6 +72,9 @@ static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
 
 static void mmio_debug_resume(struct intel_uncore *uncore)
 {
+	if (!uncore->debug)
+		return;
+
 	spin_lock(&uncore->debug->lock);
 
 	if (!--uncore->debug->suspend_count)
@@ -1705,7 +1713,7 @@ unclaimed_reg_debug(struct intel_uncore *uncore,
 		    const bool read,
 		    const bool before)
 {
-	if (likely(!uncore->i915->params.mmio_debug))
+	if (likely(!uncore->i915->params.mmio_debug) || !uncore->debug)
 		return;
 
 	/* interrupts are disabled and re-enabled around uncore->lock usage */
@@ -2267,7 +2275,6 @@ void intel_uncore_init_early(struct intel_uncore *uncore,
 	uncore->i915 = gt->i915;
 	uncore->gt = gt;
 	uncore->rpm = &gt->i915->runtime_pm;
-	uncore->debug = &gt->i915->mmio_debug;
 }
 
 static void uncore_raw_init(struct intel_uncore *uncore)
@@ -2578,6 +2585,9 @@ bool intel_uncore_unclaimed_mmio(struct intel_uncore *uncore)
 {
 	bool ret;
 
+	if (!uncore->debug)
+		return false;
+
 	spin_lock_irq(&uncore->debug->lock);
 	ret = check_for_unclaimed_mmio(uncore);
 	spin_unlock_irq(&uncore->debug->lock);
@@ -2590,6 +2600,9 @@ intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
 {
 	bool ret = false;
 
+	if (drm_WARN_ON(&uncore->i915->drm, !uncore->debug))
+		return false;
+
 	spin_lock_irq(&uncore->debug->lock);
 
 	if (unlikely(uncore->debug->unclaimed_mmio_check <= 0))
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index b1fa912a65e7..6100d0f4498a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -210,8 +210,7 @@ intel_uncore_has_fifo(const struct intel_uncore *uncore)
 	return uncore->flags & UNCORE_HAS_FIFO;
 }
 
-void
-intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_debug);
+void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
 void intel_uncore_init_early(struct intel_uncore *uncore,
 			     struct intel_gt *gt);
 int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr);
-- 
2.37.2

