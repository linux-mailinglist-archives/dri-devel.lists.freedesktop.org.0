Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188BA694685
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 14:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFB710E5C0;
	Mon, 13 Feb 2023 13:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EAD10E5B9;
 Mon, 13 Feb 2023 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676293604; x=1707829604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HnlpTL+XAwn825BNpdfY5l+tRvfwDmhxQ86CVYs1BFc=;
 b=IopT2+TDx/YtN9MZvIR96Rr6vhgU7meU7V48xmaRocZ47wlESzyRmhZC
 /Sqy8Cc9Sysq63BDY0ogurDtd3D7G6gTkJ33KkA1KwQemaRWo2sYyUB0E
 ZiYk2Gn12s1/ZkA6gmbljWQkrmeTPDTDIYybAQppwdOmrxM4MmGHIXtly
 tS+OytVpGX0MtO+WAdU/F3tP9Dmko87Dbwzkh7VYiPkUDNOq6F7TazqpV
 taoYPWXktJ+HV+kZVG5oybsip9tn4yExugS4bmjgZIcaCoKdNRHeS/xq6
 wxQGJ8azfCdrxWgPWRHFq7wbzHj+Xhi/gg15Jh4+xpyucjBswwsYKTFXL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314526488"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="314526488"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 05:06:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670811526"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="670811526"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.172])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 05:06:40 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 1/1] drm/i915/active: Fix misuse of non-idle barriers as fence
 trackers
Date: Mon, 13 Feb 2023 14:05:46 +0100
Message-Id: <20230213130546.20370-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213130546.20370-1-janusz.krzysztofik@linux.intel.com>
References: <20230213130546.20370-1-janusz.krzysztofik@linux.intel.com>
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
pointed out to an issue in barrier processing code -- a race among perf
open / close replacing active barriers with perf requests on kernel
contexts and concurrent barrier preallocate / acquire operations performed
during user context first pin / last unpin.

When adding a request to a composite tracker, we try to use an existing
fence tracker already registered with that composite tracker.  The tracker
we obtain can already track another fence, can be an idle barrier, or an
active barrier.  The first two cases seem easy to handle and we seem to
do that correctly.  In the last case, we attempt to replace the active
barrier with our request.  However, when the tracker occurs a barrier
and we try to delete that barrier from a list of barrier tasks it belongs
to, we ignore return value from that operation, which informs us whether
the deletion succeeded or not, and we reuse the barrier as if it was
idle.

On the other side, barriers are now deleted from a barrier tasks list by
temporarily removing the list content, traversing that content with skip
over the node to be deleted, then adding the modified content back to the
list.  Since that complex operation is not serialized with other
concurrent uses of the list, including similar barrier deletions,
functions that depend on the list being either empty or not empty can take
wrong decisions.

A failed barrier deletion can be a side effect of the way we have it
implemented -- another thread can have temporarily emptied the list before
we manage to do that.  If we ignore such failure, that other thread can
then add our fence tracker back to the barrier tasks list.  Since the same
structure field of the tracker is used as a list node with both barrier
tasks lists and fence callback lists, list corruption occurs.  However,
list corruptions were still observed when running the user workload on top
of an experimental patch that serialized all operations on barrier tasks
lists with a spinlock.  Then, other race scenarios leading to list
corruptions likely exist.

Based on those observations, respecting the return code from barrier
deletion seems required for effectively fixing the issue.  However, we
need to handle those few above mentioned cases carefully.

Respect results of barrier deletion attempts -- mark the barrier as idle
only after successfully deleted from the list.  Then, before proceeding
with setting our fence as the one currently tracked, make sure that the
tracker we've got is not a non-idle barrier.  If that check fails, don't
use that tracker but go back and try to acquire a new, usable one.

Extensive testing shows that this patch effectively fixes barrier related
list corruptions.  However, other potentially related issues have been
observed, reported by a new subtest we have developed for this case,
with this fix applied.  Then, we may still want to get back to this soon
and refactor our intentionally racy but potentially fragile way of barrier
tasks lists handling.

Fixes: d8af05ff38ae ("drm/i915: Allow sharing the idle-barrier from other kernel requests")
References: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.4
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

