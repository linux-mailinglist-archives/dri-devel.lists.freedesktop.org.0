Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CB7480E0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1253B10E225;
	Wed,  5 Jul 2023 09:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980E10E225;
 Wed,  5 Jul 2023 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688549459; x=1720085459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=slzTOXhGSjSQB3jRpEdaqcHQ2Rtjgj4koB1/gFKpd8g=;
 b=TQGjTZtWF3wOWVbJ3Gy9n7UiGq4hGogfUb+CL6HHqdldedAKVJoo3bwd
 3gxOPmOxSnWNh2d9zWatpEi1AiMKkKox/BnEh1iteVNi2qvRntRIYOQkA
 xcfYIE3ky4zV/O1771OJLxplynufo0EYXD9ScbZD5DjAbjTyS0J82fGp/
 tWkHkfovMjm58sd/9DOxOwZYC1FHe0icv2jrRQ99EEgBXGGlOXPu+W8hs
 z5vJLVToz8Etp1VRrk15Uslrs6Wx8tlqtdMGIJmA12iJH3AElcH+aN44T
 qZW1rpcPS5n0DMqokbllZBDT8CbKc6Az4wTwhFysOjvMBmi5UC36XUZJQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362162384"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="362162384"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 02:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="843234735"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="843234735"
Received: from jputsman-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.200.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 02:30:33 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Do not disable preemption for resets
Date: Wed,  5 Jul 2023 10:30:25 +0100
Message-Id: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index e2152f75ba2e..6916eba3bd33 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -167,13 +167,13 @@ static int i915_do_reset(struct intel_gt *gt,
 	/* Assert reset for at least 20 usec, and wait for acknowledgement. */
 	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
 	udelay(50);
-	err = wait_for_atomic(i915_in_reset(pdev), 50);
+	err = _wait_for_atomic(i915_in_reset(pdev), 50, 0);
 
 	/* Clear the reset request. */
 	pci_write_config_byte(pdev, I915_GDRST, 0);
 	udelay(50);
 	if (!err)
-		err = wait_for_atomic(!i915_in_reset(pdev), 50);
+		err = _wait_for_atomic(!i915_in_reset(pdev), 50, 0);
 
 	return err;
 }
@@ -193,7 +193,7 @@ static int g33_do_reset(struct intel_gt *gt,
 	struct pci_dev *pdev = to_pci_dev(gt->i915->drm.dev);
 
 	pci_write_config_byte(pdev, I915_GDRST, GRDOM_RESET_ENABLE);
-	return wait_for_atomic(g4x_reset_complete(pdev), 50);
+	return _wait_for_atomic(g4x_reset_complete(pdev), 50, 0);
 }
 
 static int g4x_do_reset(struct intel_gt *gt,
@@ -210,7 +210,7 @@ static int g4x_do_reset(struct intel_gt *gt,
 
 	pci_write_config_byte(pdev, I915_GDRST,
 			      GRDOM_MEDIA | GRDOM_RESET_ENABLE);
-	ret =  wait_for_atomic(g4x_reset_complete(pdev), 50);
+	ret =  _wait_for_atomic(g4x_reset_complete(pdev), 50, 0);
 	if (ret) {
 		GT_TRACE(gt, "Wait for media reset failed\n");
 		goto out;
@@ -218,7 +218,7 @@ static int g4x_do_reset(struct intel_gt *gt,
 
 	pci_write_config_byte(pdev, I915_GDRST,
 			      GRDOM_RENDER | GRDOM_RESET_ENABLE);
-	ret =  wait_for_atomic(g4x_reset_complete(pdev), 50);
+	ret =  _wait_for_atomic(g4x_reset_complete(pdev), 50, 0);
 	if (ret) {
 		GT_TRACE(gt, "Wait for render reset failed\n");
 		goto out;
@@ -788,9 +788,7 @@ int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 		reset_mask = wa_14015076503_start(gt, engine_mask, !retry);
 
 		GT_TRACE(gt, "engine_mask=%x\n", reset_mask);
-		preempt_disable();
 		ret = reset(gt, reset_mask, retry);
-		preempt_enable();
 
 		wa_14015076503_end(gt, reset_mask);
 	}
-- 
2.39.2

