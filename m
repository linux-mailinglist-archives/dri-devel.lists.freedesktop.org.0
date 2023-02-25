Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6316A2C04
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 23:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69AC10E2AA;
	Sat, 25 Feb 2023 22:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBB410E2AA;
 Sat, 25 Feb 2023 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677363168; x=1708899168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p0GdiuUHF6WwarF0q0kM4CQoJQfF//C0PagkBR1XGUE=;
 b=kNk1fklszntJGWzUMUZQiyDE4sa23C3MTV4ZbO09BPwFD/WdVRSJh+Rt
 ShD3fffQd/DtkobHfoLUYCbqTdduLmhQtzn7KZ5JIZuaeTA67+o95dKnL
 p1meszbcl5FQndgYp89eDQsuaoKtmznoMqTuqn54N+nY67zcx1jmHDzIr
 JKDv85TcG0H2IFvXvRPvfxDVwjBLRUtQKoM54G+/AIiw/2kHvWYBp7noi
 XoiTrGK/JaxPaf9nlfFrUu+lgm1VwvNm/RTEJh9eGBupIPYrWyD4FZFnd
 NGn5g8DfpuPEC68mHAHK78xBW4/cNEKQ5ta4XCt5eUA18vM16mG+copRF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="321906416"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; d="scan'208";a="321906416"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2023 14:12:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="797122562"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; d="scan'208";a="797122562"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.7.246])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2023 14:12:44 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v2] drm/i915/active: Fix misuse of non-idle barriers as fence
 trackers
Date: Sat, 25 Feb 2023 23:12:18 +0100
Message-Id: <20230225221218.134254-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Users reported oopses on list corruptions when using i915 perf with a
number of concurrently running graphics applications.  Root cause analysis
pointed at an issue in barrier processing code -- a race among perf open /
close replacing active barriers with perf requests on kernel context and
concurrent barrier preallocate / acquire operations performed during user
context first pin / last unpin.

When adding a request to a composite tracker, we try to reuse an existing
fence tracker, already allocated and registered with that composite.  The
tracker we obtain may already track another fence, may be an idle barrier,
or an active barrier.

If the tracker we get occurs a non-idle barrier then we try to delete that
barrier from a list of barrier tasks it belongs to.  However, while doing
that we don't respect return value from a function that performs the
barrier deletion.  Should the deletion ever failed, we would end up
reusing the tracker still registered as a barrier task.  Since the same
structure field is reused with both fence callback lists and barrier
tasks list, list corruptions would likely occur.

Barriers are now deleted from a barrier tasks list by temporarily removing
the list content, traversing that content with skip over the node to be
deleted, then populating the list back with the modified content.  Should
that intentionally racy concurrent deletion attempts be not serialized,
one or more of those may fail because of the list being temporary empty.

Related code that ignores the results of barrier deletion was initially
introduced in v5.4 by commit d8af05ff38ae ("drm/i915: Allow sharing the
idle-barrier from other kernel requests").  However, all users of the
barrier deletion routine were apparently serialized at that time, then the
issue didn't exhibit itself.  Results of git bisect with help of a newly
developed igt@gem_barrier_race@remote-request IGT test indicate that list
corruptions might start to appear after commit 311770173fac ("drm/i915/gt:
Schedule request retirement when timeline idles"), introduced in v5.5.

Respect results of barrier deletion attempts -- mark the barrier as idle
only if successfully deleted from the list.  Then, before proceeding with
setting our fence as the one currently tracked, make sure that the tracker
we've got is not a non-idle barrier.  If that check fails then don't use
that tracker but go back and try to acquire a new, usable one.

v2: no code changes,
  - blame commit 311770173fac ("drm/i915/gt: Schedule request retirement
    when timeline idles"), v5.5, not commit d8af05ff38ae ("drm/i915: Allow
    sharing the idle-barrier from other kernel requests"), v5.4,
  - reword commit description.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
Fixes: 311770173fac ("drm/i915/gt: Schedule request retirement when timeline idles")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: stable@vger.kernel.org # v5.5
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_active.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 7412abf166a8c..f9282b8c87c1c 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -422,12 +422,12 @@ replace_barrier(struct i915_active *ref, struct i915_active_fence *active)
 	 * we can use it to substitute for the pending idle-barrer
 	 * request that we want to emit on the kernel_context.
 	 */
-	__active_del_barrier(ref, node_from_active(active));
-	return true;
+	return __active_del_barrier(ref, node_from_active(active));
 }
 
 int i915_active_add_request(struct i915_active *ref, struct i915_request *rq)
 {
+	u64 idx = i915_request_timeline(rq)->fence_context;
 	struct dma_fence *fence = &rq->fence;
 	struct i915_active_fence *active;
 	int err;
@@ -437,16 +437,19 @@ int i915_active_add_request(struct i915_active *ref, struct i915_request *rq)
 	if (err)
 		return err;
 
-	active = active_instance(ref, i915_request_timeline(rq)->fence_context);
-	if (!active) {
-		err = -ENOMEM;
-		goto out;
-	}
+	do {
+		active = active_instance(ref, idx);
+		if (!active) {
+			err = -ENOMEM;
+			goto out;
+		}
+
+		if (replace_barrier(ref, active)) {
+			RCU_INIT_POINTER(active->fence, NULL);
+			atomic_dec(&ref->count);
+		}
+	} while (is_barrier(active));
 
-	if (replace_barrier(ref, active)) {
-		RCU_INIT_POINTER(active->fence, NULL);
-		atomic_dec(&ref->count);
-	}
 	if (!__i915_active_fence_set(active, fence))
 		__i915_active_acquire(ref);
 
-- 
2.25.1

