Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B1E6B7F6B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B51D10E5E1;
	Mon, 13 Mar 2023 17:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15A210E5E0;
 Mon, 13 Mar 2023 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678728290; x=1710264290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KH4FkxVcs5A7dvfX3bheNC9WhQ0NJxXt0TWMdr4+WKQ=;
 b=imU0ueKycfeCTfGcpxoEWnA2vsAVBi3iy2uI9lPhTEAeG8s29YZQTHAO
 hjmuFKXvrp3MRVSi6oVHvn6Ds/mXiei+t78+JuPfaxWh4WFJUzBdd6utW
 sWpgx6TC2OtMmUPDy3IqM7o4eOkqoUK2xnuhvFeRWSmZeQPDzg0wHlcjI
 bZqouymZK1Tjhm2XaQ3JchsgqOBRvD5nXev9Gr3nDPZOjHu0lng+hYJ6J
 06++17FG8bqZYZnEr7B3OWiR/zkRyjn24I6h6U+KhgmT+mcXGZ2wqVB1U
 LR3XQ3nxxMWiMyAj9MfQM/2FomjmstSr9FzwYxhkcKThs/h7jFuYT4CWP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321062321"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="321062321"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924586789"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924586789"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.intranet) ([10.213.1.93])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:47 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/active: Serialize use of barriers as fence
 trackers
Date: Mon, 13 Mar 2023 18:24:14 +0100
Message-Id: <20230313172415.125932-3-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230313172415.125932-1-janusz.krzysztofik@linux.intel.com>
References: <20230313172415.125932-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When adding a request to a composite tracker, we try to use an existing
fence tracker already registered with that composite.  The tracker we
obtain can already track another fence, can be an idle barrier, or an
active barrier.

When we acquire an idle barrier, we don't claim it in any way until
__i915_active_fence_set() we call substitutes its NULL fence pointer with
that of our request's fence.  But another thread looking for an idle
barrier can race with us.  If that thread is collecting barriers for
preallocation, it may update the NULL fence pointer with ERR_PTR(-EAGAIN)
barrier mark, either before or after we manage to replace it with our
request fence.  It can also corrupt our callback list pointers when
reusing them as an engine pointer (prev) and a preallocated barriers
llist node link (next), or we can corrupt their data.

When we acquire a non-idle barrier in turn, we try to delete that barrier
from a list of barrier tasks it belongs to.  If that deletion succeedes
then we convert the barrier to an idle one by replacing its barrier mark
with NULL and decermenting active count of its hosting composite tracker.
But as soon as we do this, we expose that barrier to the above described
idle barrier race.

Claim acquired idle barrier right away by marking it immediately with
ERR_PTR(-EAGAIN) barrier mark.  Serialize that operation with other
threads trying to claim a barrier and go back for picking up another
tracker if some other thread wins the race.

Furthermore, on successful deletion of a non-idle barrier from a barrier
tasks list, don't overwrite the barrier mark with NULL -- that's not
needed at the moment since the barrier, once deleted from its list, can no
longer be acquired by any other thread as long as all threads respect
deletion results.  Also, don't decrease active counter of the hosting
composite tracker, but skip the follow up step that increases it back.

For the above to work correctly, teach __i915_active_fence_set() function
to recognize and handle non-idle barriers correctly when requested.

The issue has never been reproduced cleanly, only identified via code
analysis while working on fence callback list corruptions which occurred
to have a complex root cause, see commit e0e6b416b25e ("drm/i915/active:
Fix misuse of non-idle barriers as fence trackers") for details.  However,
it has been assumed that the issue could start to be potentially
reproducible as soon as timeline mutex locks around calls to
i915_active_fence_set() were dropped by commit df9f85d8582e ("drm/i915:
Serialise i915_active_fence_set() with itself").

Fixes: df9f85d8582e ("drm/i915: Serialise i915_active_fence_set() with itself")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: stable@vger.kernel.org # v5.6+
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_active.c | 65 ++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index b2f79f5c257a8..8eb10af7928f4 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -425,11 +425,17 @@ replace_barrier(struct i915_active *ref, struct i915_active_fence *active)
 	return __active_del_barrier(ref, node_from_active(active));
 }
 
+static inline bool is_idle_barrier(struct active_node *node, u64 idx);
+static struct dma_fence *
+____i915_active_fence_set(struct i915_active_fence *active,
+			  struct dma_fence *fence, bool barrier);
+
 int i915_active_add_request(struct i915_active *ref, struct i915_request *rq)
 {
 	u64 idx = i915_request_timeline(rq)->fence_context;
 	struct dma_fence *fence = &rq->fence;
 	struct i915_active_fence *active;
+	bool replaced;
 	int err;
 
 	/* Prevent reaping in case we malloc/wait while building the tree */
@@ -444,13 +450,18 @@ int i915_active_add_request(struct i915_active *ref, struct i915_request *rq)
 			goto out;
 		}
 
-		if (replace_barrier(ref, active)) {
-			RCU_INIT_POINTER(active->fence, NULL);
-			atomic_dec(&ref->count);
-		}
-	} while (unlikely(is_barrier(active)));
+		replaced = replace_barrier(ref, active);
+		if (replaced)
+			break;
+
+		if (!cmpxchg(__active_fence_slot(active), NULL,
+			     ERR_PTR(-EAGAIN)))
+			break;
 
-	if (!__i915_active_fence_set(active, fence))
+	} while (IS_ERR_OR_NULL(rcu_access_pointer(active->fence)));
+
+	if (!____i915_active_fence_set(active, fence, is_barrier(active)) &&
+	    !replaced)
 		__i915_active_acquire(ref);
 
 out:
@@ -1021,21 +1032,9 @@ void i915_request_add_active_barriers(struct i915_request *rq)
 	spin_unlock_irqrestore(&rq->lock, flags);
 }
 
-/*
- * __i915_active_fence_set: Update the last active fence along its timeline
- * @active: the active tracker
- * @fence: the new fence (under construction)
- *
- * Records the new @fence as the last active fence along its timeline in
- * this active tracker, moving the tracking callbacks from the previous
- * fence onto this one. Returns the previous fence (if not already completed),
- * which the caller must ensure is executed before the new fence. To ensure
- * that the order of fences within the timeline of the i915_active_fence is
- * understood, it should be locked by the caller.
- */
-struct dma_fence *
-__i915_active_fence_set(struct i915_active_fence *active,
-			struct dma_fence *fence)
+static struct dma_fence *
+____i915_active_fence_set(struct i915_active_fence *active,
+			  struct dma_fence *fence, bool barrier)
 {
 	struct dma_fence *prev;
 	unsigned long flags;
@@ -1067,6 +1066,11 @@ __i915_active_fence_set(struct i915_active_fence *active,
 	 */
 	spin_lock_irqsave(fence->lock, flags);
 	prev = xchg(__active_fence_slot(active), fence);
+	if (barrier) {
+		GEM_BUG_ON(!IS_ERR(prev));
+		prev = NULL;
+	}
+	GEM_BUG_ON(IS_ERR(prev));
 	if (prev) {
 		GEM_BUG_ON(prev == fence);
 		spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
@@ -1079,6 +1083,25 @@ __i915_active_fence_set(struct i915_active_fence *active,
 	return prev;
 }
 
+/*
+ * __i915_active_fence_set: Update the last active fence along its timeline
+ * @active: the active tracker
+ * @fence: the new fence (under construction)
+ *
+ * Records the new @fence as the last active fence along its timeline in
+ * this active tracker, moving the tracking callbacks from the previous
+ * fence onto this one. Returns the previous fence (if not already completed),
+ * which the caller must ensure is executed before the new fence. To ensure
+ * that the order of fences within the timeline of the i915_active_fence is
+ * understood, it should be locked by the caller.
+ */
+struct dma_fence *
+__i915_active_fence_set(struct i915_active_fence *active,
+			struct dma_fence *fence)
+{
+	return ____i915_active_fence_set(active, fence, false);
+}
+
 int i915_active_fence_set(struct i915_active_fence *active,
 			  struct i915_request *rq)
 {
-- 
2.25.1

