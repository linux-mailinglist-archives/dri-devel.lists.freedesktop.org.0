Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A120746F65
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 13:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA18D10E100;
	Tue,  4 Jul 2023 11:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEA110E0E8;
 Tue,  4 Jul 2023 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688468850; x=1720004850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2PrQdeNByVQH6XsxqHIVdlXGsS4egbyPYtxY+3GzdlY=;
 b=ZKt+F+qeUb0WnaxaqSrWUampFAOFqfm/P1KoRpcIP9iCseZK2pN7UvXg
 sw+MKDZWBd2vNTcKYkf/skJRR2KarELkVrEThfaHEGzIpNdKCROVmlps7
 ive3Bu0RmaeSKcsxm3bHZ8ve5iQueDqxL6kdMZgOfjmbP13sbdDbr5Sl/
 1rXBd34AGj3qdB8DfXIdlaHR6MTHfR/NKiBufu2ofOVmhdWewGTj0n6dp
 eWtUY2zYUuS/I3A78k/UMzZObuYjGfxOfIBKeh/j9LIVGp4mcYVsY6Hu2
 Q99BU6pr78RkHYycJratDVdjnCPd/iFYxC8WikBmE2Lqz4Ly8BFespoCI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393842791"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="393842791"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 04:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696126441"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696126441"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.5.5])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 04:07:05 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix premature release of request's reusable memory
Date: Tue,  4 Jul 2023 13:06:03 +0200
Message-ID: <20230704110602.16467-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Infinite waits for completion of GPU activity have been observed in CI,
mostly inside __i915_active_wait(), triggered by igt@gem_barrier_race or
igt@perf@stress-open-close.  Root cause analysis, based of ftrace dumps
generated with a lot of extra trace_printk() calls added to the code,
revealed loops of request dependencies being accidentally built,
preventing the reqests from being processed, each waiting for completion
of another one activity.

When we substitute a new request for a last active one tracked on a
timeline, we set up a dependency of our new request to wait on completion
of current activity of that previous one.  However, not all processing
paths take care of keeping the old request still in memory until we use
its attributes for setting up that await dependency.  As a result, we can
happen to use attributes of a new request that already reuses the memory
previously allocated to the old one, already released, then, set up an
await dependency on wrong request.  Combined with perf specific kernel
context remote requests added to user context timelines, unresolvable
loops of dependencies can be built, leading do infinite waits.

We obtain a pointer to the previous request to wait on while we substitute
it with a pointer to our new request in an active tracker.  In some
processing paths we protect that old request with RCU from being freed
before we use it, but in others, e.g. __i915_request_commit() ->
__i915_request_add_to_timeline() -> __i915_request_ensure_ordering(), we
don't.  Moreover, memory of released i915 requests is mostly not freed but
reused, and our RCU protection doesn't prevent that memory from being
reused.

Protect memory of released i915 requests from being reused before RCU
grace period expires.  Moreover, always protect previous active i915
requests from being released while still accessing their memory.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8211
Fixes: b1e3177bd1d8 ("drm/i915: Coordinate i915_active with its own mutex")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.5+
---
 drivers/gpu/drm/i915/i915_request.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 894068bb37b6f..7f14b6309db82 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -110,13 +110,11 @@ struct kmem_cache *i915_request_slab_cache(void)
 	return slab_requests;
 }
 
-static void i915_fence_release(struct dma_fence *fence)
+static void i915_fence_release_rcu_cb(struct rcu_head *rcu)
 {
+	struct dma_fence *fence = container_of(rcu, typeof(*fence), rcu);
 	struct i915_request *rq = to_request(fence);
 
-	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
-		   rq->guc_prio != GUC_PRIO_FINI);
-
 	i915_request_free_capture_list(fetch_and_zero(&rq->capture_list));
 	if (rq->batch_res) {
 		i915_vma_resource_put(rq->batch_res);
@@ -174,6 +172,16 @@ static void i915_fence_release(struct dma_fence *fence)
 	kmem_cache_free(slab_requests, rq);
 }
 
+static void i915_fence_release(struct dma_fence *fence)
+{
+	struct i915_request *rq = to_request(fence);
+
+	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
+		   rq->guc_prio != GUC_PRIO_FINI);
+
+	call_rcu(&fence->rcu, i915_fence_release_rcu_cb);
+}
+
 const struct dma_fence_ops i915_fence_ops = {
 	.get_driver_name = i915_fence_get_driver_name,
 	.get_timeline_name = i915_fence_get_timeline_name,
@@ -1673,6 +1681,7 @@ __i915_request_ensure_ordering(struct i915_request *rq,
 
 	GEM_BUG_ON(is_parallel_rq(rq));
 
+	rcu_read_lock();
 	prev = to_request(__i915_active_fence_set(&timeline->last_request,
 						  &rq->fence));
 
@@ -1706,6 +1715,7 @@ __i915_request_ensure_ordering(struct i915_request *rq,
 							 &rq->dep,
 							 0);
 	}
+	rcu_read_unlock();
 
 	return prev;
 }
-- 
2.41.0

