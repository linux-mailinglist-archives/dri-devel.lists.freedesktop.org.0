Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5DD6B7F68
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA24310E5D8;
	Mon, 13 Mar 2023 17:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C37010E5D2;
 Mon, 13 Mar 2023 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678728287; x=1710264287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6V0/M4vadLAvip27rgTp2+hqO4K00k0Y4Cuz1UYkBPU=;
 b=US4b7NsudbkK6YfaRBvl0KNKy8jJCrr9nS1bnfWLOEB/LCnR5mWNu/yt
 +j6JbfysLmu0TmOnYtEqM7wUn+xdLp5+MjfEodw0Tey1wtKqbFxxICMbQ
 8HkRzvB6vdejWtHbZAxspnSdxsmqp8TXXO9bXKstdRpj8E6r8e/wJ/iMu
 t29yWPhLaz0nQulILjpvVtzH6Q3YWq3QFqadGknht5ozoV6O867Xdqigv
 NtENknbJML4I+3K8H5StvDHHfEmsUhQVFJxxVxwIieWdc278prGikyohN
 uebMtaPjljnxF2BHe1eHVu0wbKeVehPIHcCSR5DqVayxhv5KhDQkaHZn2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321062301"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="321062301"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924586765"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924586765"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.intranet) ([10.213.1.93])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:44 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/active: Serialize preallocation of idle barriers
Date: Mon, 13 Mar 2023 18:24:13 +0100
Message-Id: <20230313172415.125932-2-janusz.krzysztofik@linux.intel.com>
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

When we collect barriers for preallocating them, we reuse either idle or
non-idle ones, whichever we find.  In case of non-idle barriers, we
depend on their successful deletion from their barrier tasks lists as an
indication of them not being claimed by another thread.  However, in case
of idle barriers, we neither perform any similar checks nor take any
preventive countermeasures against unexpected races with other threads.
We may then end up adding the same barrier to two independent preallocated
lists, and then adding it twice back to the same engine's barrier tasks
list, thus effectively creating a loop of llist nodes.  As a result,
searches through that barrier tasks llist may start spinning indefinitely.

Occurrences of that issue were never observed on CI nor reported by users.
However, deep code analysis revealed a silent, most probably not intended
workaround that actively breaks those loops by rebuilding barrier tasks
llists in reverse order inside our local implementation of llist node
deletion.  A simple patch that replaces that reverse order rebuild with
just an update of next pointer of a node preceding the one to be deleted
helps to reproduce the race, though still not easily.  As soon as we have
the race fixed, we may want to consider such update for the code to be
more clear and more predictable.

To fix the issue, whenever an idle barrier is selected for preallocation,
mark it immediately as non-idle with our ERR_PTR(-EAGAIN) barrier mark, so
other threads are no longer able to claim it, neither as idle nor as
non-idle since not a member of respective barrier tasks list.  Serialize
that claim operation against other potential concurrent updates of active
fence pointer, and skip the node in favor of allocating a new one if it
occurs claimed meanwhile by another competing thread.  Once claimed,
increase active count of its composite tracker host immediately, as long
as we still know that was an idle barrier.

While being at it, fortify now still marginally racy check for
preallocated_barriers llist being still empty when we populate it with
collected proto-barriers (assuming we need that check).

Fixes: 9ff33bbcda25 ("drm/i915: Reduce locking around i915_active_acquire_preallocate_barrier()")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_active.c | 50 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index a9fea115f2d26..b2f79f5c257a8 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -788,8 +788,13 @@ static struct active_node *reuse_idle_barrier(struct i915_active *ref, u64 idx)
 	 * node kept alive (as we reuse before parking). We prefer to reuse
 	 * completely idle barriers (less hassle in manipulating the llists),
 	 * but otherwise any will do.
+	 *
+	 * We reuse the request field to mark this as being our proto-node.
 	 */
-	if (ref->cache && is_idle_barrier(ref->cache, idx)) {
+	if (ref->cache && is_idle_barrier(ref->cache, idx) &&
+	    !cmpxchg(__active_fence_slot(&ref->cache->base), NULL,
+		     ERR_PTR(-EAGAIN))) {
+		__i915_active_acquire(ref);
 		p = &ref->cache->node;
 		goto match;
 	}
@@ -800,8 +805,12 @@ static struct active_node *reuse_idle_barrier(struct i915_active *ref, u64 idx)
 		struct active_node *node =
 			rb_entry(p, struct active_node, node);
 
-		if (is_idle_barrier(node, idx))
+		if (is_idle_barrier(node, idx) &&
+		    !cmpxchg(__active_fence_slot(&node->base), NULL,
+			     ERR_PTR(-EAGAIN))) {
+			__i915_active_acquire(ref);
 			goto match;
+		}
 
 		prev = p;
 		if (node->timeline < idx)
@@ -827,8 +836,12 @@ static struct active_node *reuse_idle_barrier(struct i915_active *ref, u64 idx)
 		if (node->timeline < idx)
 			continue;
 
-		if (is_idle_barrier(node, idx))
+		if (is_idle_barrier(node, idx) &&
+		    !cmpxchg(__active_fence_slot(&node->base), NULL,
+			     ERR_PTR(-EAGAIN))) {
+			__i915_active_acquire(ref);
 			goto match;
+		}
 
 		/*
 		 * The list of pending barriers is protected by the
@@ -889,29 +902,24 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 			if (!node)
 				goto unwind;
 
-			RCU_INIT_POINTER(node->base.fence, NULL);
+			/* Mark this as being our unconnected proto-node */
+			RCU_INIT_POINTER(node->base.fence, ERR_PTR(-EAGAIN));
 			node->base.cb.func = node_retire;
 			node->timeline = idx;
 			node->ref = ref;
-		}
-
-		if (!i915_active_fence_isset(&node->base)) {
-			/*
-			 * Mark this as being *our* unconnected proto-node.
-			 *
-			 * Since this node is not in any list, and we have
-			 * decoupled it from the rbtree, we can reuse the
-			 * request to indicate this is an idle-barrier node
-			 * and then we can use the rb_node and list pointers
-			 * for our tracking of the pending barrier.
-			 */
-			RCU_INIT_POINTER(node->base.fence, ERR_PTR(-EAGAIN));
-			node->base.cb.node.prev = (void *)engine;
 			__i915_active_acquire(ref);
+		} else {
+			GEM_BUG_ON(rcu_access_pointer(node->base.fence) !=
+				   ERR_PTR(-EAGAIN));
 		}
-		GEM_BUG_ON(rcu_access_pointer(node->base.fence) != ERR_PTR(-EAGAIN));
 
-		GEM_BUG_ON(barrier_to_engine(node) != engine);
+		/*
+		 * Since this node is not in any list, we have decoupled it
+		 * from the rbtree, and we reuse the request to indicate
+		 * this is a barrier node, then we can use list pointers
+		 * for our tracking of the pending barrier.
+		 */
+		node->base.cb.node.prev = (void *)engine;
 		first = barrier_to_ll(node);
 		first->next = prev;
 		if (!last)
@@ -920,7 +928,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 	}
 
 	GEM_BUG_ON(!llist_empty(&ref->preallocated_barriers));
-	llist_add_batch(first, last, &ref->preallocated_barriers);
+	GEM_BUG_ON(!llist_add_batch(first, last, &ref->preallocated_barriers));
 
 	return 0;
 
-- 
2.25.1

