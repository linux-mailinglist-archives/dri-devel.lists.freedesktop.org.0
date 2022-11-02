Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42346616DB0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19FB10E591;
	Wed,  2 Nov 2022 19:19:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D939710E591;
 Wed,  2 Nov 2022 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667416763; x=1698952763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tvT/wjFO66CHEfp/yHZq47Hnop5iGndPcdRVLMFTt0Q=;
 b=TsOWDOdecvLL1pEr8BMDKNOyELcVPL+qO9lcyjgMFtow26pY6BwxXdrp
 r6D1aPXi2XlX84bNbgl1B5m+tQnSUV9auX2rmLn/WQxIpjC4kyiLIKv5H
 k/8uIE4FX7e5+4OAMG4/f2doGIRBGmN2dr4LmEJPyHo6256Z43nlEWqf2
 jB+RifCeQFU8uGUwsF2MjhEto1PXABBr4tvOYj3zE1+bqVVDh/iROCd8Y
 HTkGbZo1JtAeCF0QLjSH5Vz9jHsfAgQnRg4IhusNexfLogHx3ZS9G2jyM
 oCl70Q/1ZFSA/3Lhk8emxej2gNz5RvX/nb92UD1EQJwcNnRf2KLKg+rr/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289213512"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="289213512"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 12:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="777017572"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="777017572"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2022 12:19:22 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/2] drm/i915/guc: Don't deadlock busyness stats vs reset
Date: Wed,  2 Nov 2022 12:21:09 -0700
Message-Id: <20221102192109.2492625-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The engine busyness stats has a worker function to do things like
64bit extend the 32bit hardware counters. The GuC's reset prepare
function flushes out this worker function to ensure no corruption
happens during the reset. Unforunately, the worker function has an
infinite wait for active resets to finish before doing its work. Thus
a deadlock would occur if the worker function had actually started
just as the reset starts.

The function being used to lock the reset-in-progress mutex is called
intel_gt_reset_trylock(). However, as noted it does not follow
standard 'trylock' conventions and exit if already locked. So rename
the current _trylock function to intel_gt_reset_lock_interruptible(),
which is the behaviour it actually provides. In addition, add a new
implementation of _trylock and call that from the busyness stats
worker instead.

v2: Rename existing trylock to interruptible rather than trying to
preserve the existing (confusing) naming scheme (review comments from
Tvrtko).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c          | 18 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_reset.h          |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c  |  4 +++-
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index e63329bc80659..c29efdef8313a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -330,7 +330,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	if (ret)
 		goto err_rpm;
 
-	ret = intel_gt_reset_trylock(ggtt->vm.gt, &srcu);
+	ret = intel_gt_reset_lock_interruptible(ggtt->vm.gt, &srcu);
 	if (ret)
 		goto err_pages;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 3159df6cdd492..24736ebee17c2 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1407,15 +1407,19 @@ void intel_gt_handle_error(struct intel_gt *gt,
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 }
 
-int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
+static int _intel_gt_reset_lock(struct intel_gt *gt, int *srcu, bool retry)
 {
 	might_lock(&gt->reset.backoff_srcu);
-	might_sleep();
+	if (retry)
+		might_sleep();
 
 	rcu_read_lock();
 	while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
 		rcu_read_unlock();
 
+		if (!retry)
+			return -EBUSY;
+
 		if (wait_event_interruptible(gt->reset.queue,
 					     !test_bit(I915_RESET_BACKOFF,
 						       &gt->reset.flags)))
@@ -1429,6 +1433,16 @@ int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
 	return 0;
 }
 
+int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
+{
+	return _intel_gt_reset_lock(gt, srcu, false);
+}
+
+int intel_gt_reset_lock_interruptible(struct intel_gt *gt, int *srcu)
+{
+	return _intel_gt_reset_lock(gt, srcu, true);
+}
+
 void intel_gt_reset_unlock(struct intel_gt *gt, int tag)
 __releases(&gt->reset.backoff_srcu)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
index adc734e673870..25c975b6e8fc0 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
@@ -39,6 +39,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine,
 void __i915_request_reset(struct i915_request *rq, bool guilty);
 
 int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int *srcu);
+int __must_check intel_gt_reset_lock_interruptible(struct intel_gt *gt, int *srcu);
 void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
 
 void intel_gt_set_wedged(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 941613be3b9dd..92e514061d20b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1401,7 +1401,9 @@ static void guc_timestamp_ping(struct work_struct *wrk)
 
 	/*
 	 * Synchronize with gt reset to make sure the worker does not
-	 * corrupt the engine/guc stats.
+	 * corrupt the engine/guc stats. NB: can't actually block waiting
+	 * for a reset to complete as the reset requires flushing out
+	 * this worker thread if started. So waiting would deadlock.
 	 */
 	ret = intel_gt_reset_trylock(gt, &srcu);
 	if (ret)
-- 
2.37.3

