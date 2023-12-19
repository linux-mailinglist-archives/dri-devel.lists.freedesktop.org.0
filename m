Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488B819115
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 20:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A110610E15F;
	Tue, 19 Dec 2023 19:58:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03C010E0D7;
 Tue, 19 Dec 2023 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703015909; x=1734551909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nu3+UZLpAU5ysw4AwvoyRGtnSRE5vIQaEg6J7hUy3IM=;
 b=e2ERBkRYSFB6eu4xXBsMP33bxmpeitn/z7sfoXyHskucNY4XamPIzDyL
 FY9BtQVH+nuWZkjz+6wikuR5SMYdt6ef8zAVfszqE1BHlS2MBzKwlQOxK
 o0QF8WkVflgT/VYO9BRYYIOD98XQ0u6VjGWBYb7Bh0Spie9a2a7S4uzjA
 Ryza6eywXfuOW1siKoBJNiLqg2ahNG+mwCmdt3RqVQ0aDkXM5ywqe2NlT
 DBLLiEX3vXieDNtNAg7pVX7peKXGTTN2cpIQFXPH5k2EY26D4LdUmMyf0
 i/2KuDmbNmK/0eABjvE+oH3wDCnTcAgH5Xwlp9QdqQyz0ARWqgtiAqBeC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="392881879"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="392881879"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 11:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="805020004"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="805020004"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga008.jf.intel.com with ESMTP; 19 Dec 2023 11:58:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Avoid circular locking issue on busyness flush
Date: Tue, 19 Dec 2023 11:59:57 -0800
Message-ID: <20231219195957.212600-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Avoid the following lockdep complaint:
<4> [298.856498] ======================================================
<4> [298.856500] WARNING: possible circular locking dependency detected
<4> [298.856503] 6.7.0-rc5-CI_DRM_14017-g58ac4ffc75b6+ #1 Tainted: G
    N
<4> [298.856505] ------------------------------------------------------
<4> [298.856507] kworker/4:1H/190 is trying to acquire lock:
<4> [298.856509] ffff8881103e9978 (&gt->reset.backoff_srcu){++++}-{0:0}, at:
_intel_gt_reset_lock+0x35/0x380 [i915]
<4> [298.856661]
but task is already holding lock:
<4> [298.856663] ffffc900013f7e58
((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at:
process_scheduled_works+0x264/0x530
<4> [298.856671]
which lock already depends on the new lock.

The complaint is not actually valid. The busyness worker thread does
indeed hold the worker lock and then attempt to acquire the reset lock
(which may have happened in reverse order elsewhere). However, it does
so with a trylock that exits if the reset lock is not available
(specifically to prevent this and other similar deadlocks).
Unfortunately, lockdep does not understand the trylock semantics (the
lock is an i915 specific custom implementation for resets).

Not doing a synchronous flush of the worker thread when a reset is in
progress resolves the lockdep splat by never even attempting to grab
the lock in this particular scenario.

There are situatons where a synchronous cancel is required, however.
So, always do the synchronous cancel if not in reset. And add an extra
synchronous cancel to the end of the reset flow to account for when a
reset is occurring at driver shutdown and the cancel is no longer
synchronous but could lead to unallocated memory accesses if the
worker is not stopped.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 48 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +-
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a259f1118c5ab..0228a77d456ed 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1362,7 +1362,45 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
 
 static void guc_cancel_busyness_worker(struct intel_guc *guc)
 {
-	cancel_delayed_work_sync(&guc->timestamp.work);
+	/*
+	 * There are many different call stacks that can get here. Some of them
+	 * hold the reset mutex. The busyness worker also attempts to acquire the
+	 * reset mutex. Synchronously flushing a worker thread requires acquiring
+	 * the worker mutex. Lockdep sees this as a conflict. It thinks that the
+	 * flush can deadlock because it holds the worker mutex while waiting for
+	 * the reset mutex, but another thread is holding the reset mutex and might
+	 * attempt to use other worker functions.
+	 *
+	 * In practice, this scenario does not exist because the busyness worker
+	 * does not block waiting for the reset mutex. It does a try-lock on it and
+	 * immediately exits if the lock is already held. Unfortunately, the mutex
+	 * in question (I915_RESET_BACKOFF) is an i915 implementation which has lockdep
+	 * annotation but not to the extent of explaining the 'might lock' is also a
+	 * 'does not need to lock'. So one option would be to add more complex lockdep
+	 * annotations to ignore the issue (if at all possible). A simpler option is to
+	 * just not flush synchronously when a rest in progress. Given that the worker
+	 * will just early exit and re-schedule itself anyway, there is no advantage
+	 * to running it immediately.
+	 *
+	 * If a reset is not in progress, then the synchronous flush may be required.
+	 * As noted many call stacks lead here, some during suspend and driver unload
+	 * which do require a synchronous flush to make sure the worker is stopped
+	 * before memory is freed.
+	 *
+	 * Trying to pass a 'need_sync' or 'in_reset' flag all the way down through
+	 * every possible call stack is unfeasible. It would be too intrusive to many
+	 * areas that really don't care about the GuC backend. However, there is the
+	 * 'reset_in_progress' flag available, so just use that.
+	 *
+	 * And note that in the case of a reset occurring during driver unload
+	 * (wedge_on_fini), skipping the cancel in _prepare (when the reset flag is set
+	 * is fine because there is another cancel in _finish (when the reset flag is
+	 * not).
+	 */
+	if (guc_to_gt(guc)->uc.reset_in_progress)
+		cancel_delayed_work(&guc->timestamp.work);
+	else
+		cancel_delayed_work_sync(&guc->timestamp.work);
 }
 
 static void __reset_guc_busyness_stats(struct intel_guc *guc)
@@ -1948,8 +1986,16 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 
 void intel_guc_submission_reset_finish(struct intel_guc *guc)
 {
+	/*
+	 * Ensure the busyness worker gets cancelled even on a fatal wedge.
+	 * Note that reset_prepare is not allowed to because it confuses lockdep.
+	 */
+	if (guc_submission_initialized(guc))
+		guc_cancel_busyness_worker(guc);
+
 	/* Reset called during driver load or during wedge? */
 	if (unlikely(!guc_submission_initialized(guc) ||
+		     !intel_guc_is_fw_running(guc) ||
 		     intel_gt_is_wedged(guc_to_gt(guc)))) {
 		return;
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 3872d309ed31f..5a49305fb13be 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -640,7 +640,7 @@ void intel_uc_reset_finish(struct intel_uc *uc)
 	uc->reset_in_progress = false;
 
 	/* Firmware expected to be running when this function is called */
-	if (intel_guc_is_fw_running(guc) && intel_uc_uses_guc_submission(uc))
+	if (intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_reset_finish(guc);
 }
 
-- 
2.41.0

