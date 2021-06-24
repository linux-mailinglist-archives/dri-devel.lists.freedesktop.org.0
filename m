Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B33B27F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49C36EA68;
	Thu, 24 Jun 2021 06:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3CA6E9F8;
 Thu, 24 Jun 2021 06:47:30 +0000 (UTC)
IronPort-SDR: fuNdobdHUvZqPtDiNNU5NftieFkNrxWo2h1qAS+nzI6yaDk1ZXpdSMU3cvLUtQBIhQfuH9/caN
 Yr/+OQ13PBUA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346765"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: XKxJo6DUBcfP440MmCdVrRxR9sqet+PbTySLH0N1T7PyuzN5lXsASetYpOQC5d2/O9OhY9raAU
 mEZrLY9prQrw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390948"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/47] drm/i915: Hold reference to intel_context over life of
 i915_request
Date: Thu, 24 Jun 2021 00:04:57 -0700
Message-Id: <20210624070516.21893-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hold a reference to the intel_context over life of an i915_request.
Without this an i915_request can exist after the context has been
destroyed (e.g. request retired, context closed, but user space holds a
reference to the request from an out fence). In the case of GuC
submission + virtual engine, the engine that the request references is
also destroyed which can trigger bad pointer dref in fence ops (e.g.
i915_fence_get_driver_name). We could likely change
i915_fence_get_driver_name to avoid touching the engine but let's just
be safe and hold the intel_context reference.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 54 ++++++++++++-----------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index de9deb95b8b1..dec5a35c9aa2 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -126,39 +126,17 @@ static void i915_fence_release(struct dma_fence *fence)
 	i915_sw_fence_fini(&rq->semaphore);
 
 	/*
-	 * Keep one request on each engine for reserved use under mempressure
-	 *
-	 * We do not hold a reference to the engine here and so have to be
-	 * very careful in what rq->engine we poke. The virtual engine is
-	 * referenced via the rq->context and we released that ref during
-	 * i915_request_retire(), ergo we must not dereference a virtual
-	 * engine here. Not that we would want to, as the only consumer of
-	 * the reserved engine->request_pool is the power management parking,
-	 * which must-not-fail, and that is only run on the physical engines.
-	 *
-	 * Since the request must have been executed to be have completed,
-	 * we know that it will have been processed by the HW and will
-	 * not be unsubmitted again, so rq->engine and rq->execution_mask
-	 * at this point is stable. rq->execution_mask will be a single
-	 * bit if the last and _only_ engine it could execution on was a
-	 * physical engine, if it's multiple bits then it started on and
-	 * could still be on a virtual engine. Thus if the mask is not a
-	 * power-of-two we assume that rq->engine may still be a virtual
-	 * engine and so a dangling invalid pointer that we cannot dereference
-	 *
-	 * For example, consider the flow of a bonded request through a virtual
-	 * engine. The request is created with a wide engine mask (all engines
-	 * that we might execute on). On processing the bond, the request mask
-	 * is reduced to one or more engines. If the request is subsequently
-	 * bound to a single engine, it will then be constrained to only
-	 * execute on that engine and never returned to the virtual engine
-	 * after timeslicing away, see __unwind_incomplete_requests(). Thus we
-	 * know that if the rq->execution_mask is a single bit, rq->engine
-	 * can be a physical engine with the exact corresponding mask.
+	 * Keep one request on each engine for reserved use under mempressure,
+	 * do not use with virtual engines as this really is only needed for
+	 * kernel contexts.
 	 */
-	if (is_power_of_2(rq->execution_mask) &&
-	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
+	if (!intel_engine_is_virtual(rq->engine) &&
+	    !cmpxchg(&rq->engine->request_pool, NULL, rq)) {
+		intel_context_put(rq->context);
 		return;
+	}
+
+	intel_context_put(rq->context);
 
 	kmem_cache_free(global.slab_requests, rq);
 }
@@ -977,7 +955,18 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 		}
 	}
 
-	rq->context = ce;
+	/*
+	 * Hold a reference to the intel_context over life of an i915_request.
+	 * Without this an i915_request can exist after the context has been
+	 * destroyed (e.g. request retired, context closed, but user space holds
+	 * a reference to the request from an out fence). In the case of GuC
+	 * submission + virtual engine, the engine that the request references
+	 * is also destroyed which can trigger bad pointer dref in fence ops
+	 * (e.g. i915_fence_get_driver_name). We could likely change these
+	 * functions to avoid touching the engine but let's just be safe and
+	 * hold the intel_context reference.
+	 */
+	rq->context = intel_context_get(ce);
 	rq->engine = ce->engine;
 	rq->ring = ce->ring;
 	rq->execution_mask = ce->engine->mask;
@@ -1054,6 +1043,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	GEM_BUG_ON(!list_empty(&rq->sched.waiters_list));
 
 err_free:
+	intel_context_put(ce);
 	kmem_cache_free(global.slab_requests, rq);
 err_unreserve:
 	intel_context_unpin(ce);
-- 
2.28.0

