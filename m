Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8C47AE9F9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738CE10E398;
	Tue, 26 Sep 2023 10:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33C10E396;
 Tue, 26 Sep 2023 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695722943; x=1727258943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4K+ImXtoRkOATy7yfeEpGuSg7J5Li5l6RRQHWI39/58=;
 b=ceu20qXaySblmp93kTFAUXXok6AYFsqdky63hgCmNGPak+Bd4Sx8Km8Z
 FYx129Ht/+bnGsIkVDCoBeJaFps8PY1YUTSDYKQzKNHO4LCT+SvT/PSfY
 z9e77Qo9dtbHYE4TcAuGoKwUwQ6JJzVklL9GwkUBw6uxLy4dW82qXM+LD
 cgRJSh4rHUA3XhI4+jbez/n4kblZzbqyItni5Yeimnr8aV2l7LkD6vCZL
 NYPnfE7od2TMV9MdicOBy9KHywa8VhWdP7Y/WYpuiv3txqdfA6cz0et8h
 Ad1SYdYBBZJdMz7WxJFE1ol3+OBc5emN1xwhvU+tetNj5zjSN0YW7hlxR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467816648"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="467816648"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 03:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872451038"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="872451038"
Received: from dilipban-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.201.63])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 03:09:00 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Do not disable preemption for resets
Date: Tue, 26 Sep 2023 11:08:55 +0100
Message-Id: <20230926100855.61722-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
preempt disable section over the hardware reset callback to prepare the
driver for being able to reset from atomic contexts.

In retrospect I can see that the work item at a time was about removing
the struct mutex from the reset path. Code base also briefly entertained
the idea of doing the reset under stop_machine in order to serialize
userspace mmap and temporary glitch in the fence registers (see
eb8d0f5af4ec ("drm/i915: Remove GPU reset dependence on struct_mutex"),
but that never materialized and was soon removed in 2caffbf11762
("drm/i915: Revoke mmaps and prevent access to fence registers across
reset") and replaced with a SRCU based solution.

As such, as far as I can see, today we still have a requirement that
resets must not sleep (invoked from submission tasklets), but no need to
support invoking them from a truly atomic context.

Given that the preemption section is problematic on RT kernels, since the
uncore lock becomes a sleeping lock and so is invalid in such section,
lets try and remove it. Potential downside is that our short waits on GPU
to complete the reset may get extended if CPU scheduling interferes, but
in practice that probably isn't a deal breaker.

In terms of mechanics, since the preemption disabled block is being
removed we just need to replace a few of the wait_for_atomic macros into
busy looping versions which will work (and not complain) when called from
non-atomic sections.

v2:
 * Fix timeouts which are now in us. (Andi)
 * Update one comment as a drive by. (Andi)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 98575d79c446..a21e939fdbf6 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -161,16 +161,16 @@ static int i915_do_reset(struct intel_gt *gt,
 	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 	int err;
 
-	/* Assert reset for at least 20 usec, and wait for acknowledgement. */
+	/* Assert reset for at least 50 usec, and wait for acknowledgement. */
 	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
 	udelay(50);
-	err = wait_for_atomic(i915_in_reset(pdev), 50);
+	err = _wait_for_atomic(i915_in_reset(pdev), 50000, 0);
 
 	/* Clear the reset request. */
 	pci_write_config_byte(pdev, I915_GDRST, 0);
 	udelay(50);
 	if (!err)
-		err = wait_for_atomic(!i915_in_reset(pdev), 50);
+		err = _wait_for_atomic(!i915_in_reset(pdev), 50000, 0);
 
 	return err;
 }
@@ -190,7 +190,7 @@ static int g33_do_reset(struct intel_gt *gt,
 	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 
 	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
-	return wait_for_atomic(g4x_reset_complete(pdev), 50);
+	return _wait_for_atomic(g4x_reset_complete(pdev), 50000, 0);
 }
 
 static int g4x_do_reset(struct intel_gt *gt,
@@ -207,7 +207,7 @@ static int g4x_do_reset(struct intel_gt *gt,
 
 	pci_write_config_byte(pdev, I915_GDRST,
 			      GRDOM_MEDIA | GRDOM_RESET_ENABLE);
-	ret =  wait_for_atomic(g4x_reset_complete(pdev), 50);
+	ret =  _wait_for_atomic(g4x_reset_complete(pdev), 50000, 0);
 	if (ret) {
 		GT_TRACE(gt, "Wait for media reset failed\n");
 		goto out;
@@ -215,7 +215,7 @@ static int g4x_do_reset(struct intel_gt *gt,
 
 	pci_write_config_byte(pdev, I915_GDRST,
 			      GRDOM_RENDER | GRDOM_RESET_ENABLE);
-	ret =  wait_for_atomic(g4x_reset_complete(pdev), 50);
+	ret =  _wait_for_atomic(g4x_reset_complete(pdev), 50000, 0);
 	if (ret) {
 		GT_TRACE(gt, "Wait for render reset failed\n");
 		goto out;
@@ -785,9 +785,7 @@ int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 		reset_mask = wa_14015076503_start(gt, engine_mask, !retry);
 
 		GT_TRACE(gt, "engine_mask=%x\n", reset_mask);
-		preempt_disable();
 		ret = reset(gt, reset_mask, retry);
-		preempt_enable();
 
 		wa_14015076503_end(gt, reset_mask);
 	}
-- 
2.39.2

