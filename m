Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9082F413504
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DEF89CDE;
	Tue, 21 Sep 2021 14:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C4789CDE;
 Tue, 21 Sep 2021 14:07:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="223411451"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="223411451"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:43:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="549490303"
Received: from agallagh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:43:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Michael Mason <michael.w.mason@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2] drm/i915/request: fix early tracepoints
Date: Tue, 21 Sep 2021 14:42:02 +0100
Message-Id: <20210921134202.3803151-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we blow up in trace_dma_fence_init, when calling into
get_driver_name or get_timeline_name, since both the engine and context
might be NULL(or contain some garbage address) in the case of newly
allocated slab objects via the request ctor. Note that we also use
SLAB_TYPESAFE_BY_RCU here, which allows requests to be immediately
freed, but delay freeing the underlying page by an RCU grace period.
With this scheme requests can be re-allocated, at the same time as they
are also being read by some lockless RCU lookup mechanism.

In the ctor case, which is only called for new slab objects(i.e allocate
new page and call the ctor for each object) it's safe to reset the
context/engine prior to calling into dma_fence_init, since we can be
certain that no one is doing an RCU lookup which might depend on peeking
at the engine/context, like in active_engine(), since the object can't
yet be externally visible.

In the recycled case(which might also be externally visible) the request
refcount always transitions from 0->1 after we set the context/engine
etc, which should ensure it's valid to dereference the engine for
example, when doing an RCU list-walk, so long as we can also increment
the refcount first. If the refcount is already zero, then the request is
considered complete/released.  If it's non-zero, then the request might
be in the process of being re-allocated, or potentially still in flight,
however after successfully incrementing the refcount, it's possible to
carefully inspect the request state, to determine if the request is
still what we were looking for. Note that all externally visible
requests returned to the cache must have zero refcount.

One possible fix then is to move dma_fence_init out from the request
ctor. Originally this was how it was done, but it was moved in:

commit 855e39e65cfc33a73724f1cc644ffc5754864a20
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Mon Feb 3 09:41:48 2020 +0000

    drm/i915: Initialise basic fence before acquiring seqno

where it looks like intel_timeline_get_seqno() relied on some of the
rq->fence state, but that is no longer the case since:

commit 12ca695d2c1ed26b2dcbb528b42813bd0f216cfc
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Mar 23 16:49:50 2021 +0100

    drm/i915: Do not share hwsp across contexts any more, v8.

intel_timeline_get_seqno() could also be cleaned up slightly by dropping
the request argument.

Moving dma_fence_init back out of the ctor, should ensure we have enough
of the request initialised in case of trace_dma_fence_init.
Functionally this should be the same, and is effectively what we were
already open coding before, except now we also assign the fence->lock
and fence->ops, but since these are invariant for recycled
requests(which might be externally visible), and will therefore already
hold the same value, it shouldn't matter.

An alternative fix, since we don't yet have a fully initialised request
when in the ctor, is just setting the context/engine as NULL, but this
does require adding some extra handling in get_driver_name etc.

v2(Daniel):
  - Try to make the commit message less confusing

Fixes: 855e39e65cfc ("drm/i915: Initialise basic fence before acquiring seqno")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Michael Mason <michael.w.mason@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_request.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..79da5eca60af 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -829,8 +829,6 @@ static void __i915_request_ctor(void *arg)
 	i915_sw_fence_init(&rq->submit, submit_notify);
 	i915_sw_fence_init(&rq->semaphore, semaphore_notify);
 
-	dma_fence_init(&rq->fence, &i915_fence_ops, &rq->lock, 0, 0);
-
 	rq->capture_list = NULL;
 
 	init_llist_head(&rq->execute_cb);
@@ -905,17 +903,12 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	rq->ring = ce->ring;
 	rq->execution_mask = ce->engine->mask;
 
-	kref_init(&rq->fence.refcount);
-	rq->fence.flags = 0;
-	rq->fence.error = 0;
-	INIT_LIST_HEAD(&rq->fence.cb_list);
-
 	ret = intel_timeline_get_seqno(tl, rq, &seqno);
 	if (ret)
 		goto err_free;
 
-	rq->fence.context = tl->fence_context;
-	rq->fence.seqno = seqno;
+	dma_fence_init(&rq->fence, &i915_fence_ops, &rq->lock,
+		       tl->fence_context, seqno);
 
 	RCU_INIT_POINTER(rq->timeline, tl);
 	rq->hwsp_seqno = tl->hwsp_seqno;
-- 
2.26.3

