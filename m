Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6A5A5393
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB30710EAF8;
	Mon, 29 Aug 2022 17:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4048E10EADD;
 Mon, 29 Aug 2022 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661795691; x=1693331691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XbWVXHUiSlm5BDLMtLkGImGx1ny2l0pIhlcMu9jNEec=;
 b=BsAdpXZq5G7cDWmVI2htA4inoybPLWxsscp6AylmUvrtSZU5HUj0tAnC
 2wU4YWP8Pt2OHKtbuM5IAAv5Qu5QvA5mWJKoF2UMTbt3tix3Hp6iuCLkj
 4LMbmu9WQ81NFX8UBTRsIDxC/zZsKbOq94XDYEP/Z98ley314qiN4vFz1
 d7O+nkFm2m9ish46ivBmaXaKBFyhbxJYiPcdBmBSrTEB2UooU14ll+We7
 GHfqOa6jpuFoZtQlPHOngcyq+Y3TVr22Y/dbO6yHjFAvDbFoMWlZvSApc
 bOj6a8CrTO7WWrjUJQnlGNZJaQNfY4ZaNEktWerbPWUC4apWXoq46SlY7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381246659"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; d="scan'208";a="381246659"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="562297209"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915: Only hook up uncore->debug for primary uncore
Date: Mon, 29 Aug 2022 10:02:32 -0700
Message-Id: <20220829170238.969875-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829170238.969875-1-matthew.d.roper@intel.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
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
index 053a7dab5506..de9020771836 100644
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

