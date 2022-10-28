Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3E611B16
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 21:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC7D10E8DA;
	Fri, 28 Oct 2022 19:45:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258B510E8CD;
 Fri, 28 Oct 2022 19:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666986320; x=1698522320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9m9BLyVLa//CHbStsyJadeIkrhdV2IQHongz84Y2YG4=;
 b=dGmtjncb1I5YT/+heKXnAmUwVwB5RV7GxAn0CoOzy+Cskr7dB9895KKn
 GVhcV+kE7dKMLZxK3Jiqr/0sEKdv/pl50dwZ93ab46687Hzn3Cg9UbabS
 M23mrTAvxrSohW7bWk+iEbU6ZHGQ6G/BPrmfzzEkZ7JUdEMvvzTBp4CkO
 qyBM6eLjmYHU1FohXQAklzvmeiTmZC/Sdbjj9O/0PTOOD1ro3cQ4v6x9u
 oynzWPcpt+5EHNV8dsqyCTijwWMy2fvJWjxiB6JoKiF9QIhyv1zKsff9/
 PqeFiDKh4N8vc+e7Jh0GJ+CQWqYWQwkFIzVcnvtsmKORq+SV45LJ5qgBS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372787687"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="372787687"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 12:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="775491790"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="775491790"
Received: from relo-linux-5.jf.intel.com ([10.165.21.195])
 by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2022 12:45:10 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/guc: Don't deadlock busyness stats vs reset
Date: Fri, 28 Oct 2022 12:46:49 -0700
Message-Id: <20221028194649.1130223-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
References: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
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

Update the worker to abort if a reset is in progress rather than
waiting for it to complete. It will still acquire the reset lock in
the case where a reset was not already in progress. So the processing
is still safe from corruption, but the deadlock can no longer occur.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c             | 15 ++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_reset.h             |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++--
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 3159df6cdd492..2f48c6e4420ea 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1407,7 +1407,7 @@ void intel_gt_handle_error(struct intel_gt *gt,
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 }
 
-int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
+static int _intel_gt_reset_trylock(struct intel_gt *gt, int *srcu, bool retry)
 {
 	might_lock(&gt->reset.backoff_srcu);
 	might_sleep();
@@ -1416,6 +1416,9 @@ int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
 	while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
 		rcu_read_unlock();
 
+		if (!retry)
+			return -EBUSY;
+
 		if (wait_event_interruptible(gt->reset.queue,
 					     !test_bit(I915_RESET_BACKOFF,
 						       &gt->reset.flags)))
@@ -1429,6 +1432,16 @@ int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
 	return 0;
 }
 
+int intel_gt_reset_trylock_noretry(struct intel_gt *gt, int *srcu)
+{
+	return _intel_gt_reset_trylock(gt, srcu, false);
+}
+
+int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
+{
+	return _intel_gt_reset_trylock(gt, srcu, true);
+}
+
 void intel_gt_reset_unlock(struct intel_gt *gt, int tag)
 __releases(&gt->reset.backoff_srcu)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
index adc734e673870..7f863726eb6a2 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
@@ -38,6 +38,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine,
 
 void __i915_request_reset(struct i915_request *rq, bool guilty);
 
+int __must_check intel_gt_reset_trylock_noretry(struct intel_gt *gt, int *srcu);
 int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int *srcu);
 void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 941613be3b9dd..1fa1bc7dde3df 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1401,9 +1401,11 @@ static void guc_timestamp_ping(struct work_struct *wrk)
 
 	/*
 	 * Synchronize with gt reset to make sure the worker does not
-	 * corrupt the engine/guc stats.
+	 * corrupt the engine/guc stats. NB: can't actually block waiting
+	 * for a reset to complete as the reset requires flushing out
+	 * any running worker thread. So waiting would deadlock.
 	 */
-	ret = intel_gt_reset_trylock(gt, &srcu);
+	ret = intel_gt_reset_trylock_noretry(gt, &srcu);
 	if (ret)
 		return;
 
-- 
2.37.3

