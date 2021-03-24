Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B053477F7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8B86E9F0;
	Wed, 24 Mar 2021 12:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E546E9E8;
 Wed, 24 Mar 2021 12:13:47 +0000 (UTC)
IronPort-SDR: 4E4fiFGGo0fStJJpwzzJlOAWjwh383WDdpECW1ZtU3eSFp/PlWyv9eiEvsXPNg2TQTmSgU8uvp
 0DbBf0v3Ongg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188386147"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="188386147"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:46 -0700
IronPort-SDR: yfflhMvFTv9med5kXiuo5NzgL69g/IKnjg8gDJfp2GYgpMyW/GhPYdjm/aXS3abb6vbOx241QN
 qm9bWKpj80dQ==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391277117"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.248.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:45 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915: Extract active lookup engine to a helper
Date: Wed, 24 Mar 2021 12:13:29 +0000
Message-Id: <20210324121335.2307063-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Move active engine lookup to exported i915_request_active_engine.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 34 +---------------
 drivers/gpu/drm/i915/i915_request.c         | 44 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_request.h         |  4 ++
 3 files changed, 49 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ca37d93ef5e7..03a2f5f2a11f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -408,38 +408,6 @@ static bool __cancel_engine(struct intel_engine_cs *engine)
 	return intel_engine_pulse(engine) == 0;
 }
 
-static bool
-__active_engine(struct i915_request *rq, struct intel_engine_cs **active)
-{
-	struct intel_engine_cs *engine, *locked;
-	bool ret = false;
-
-	/*
-	 * Serialise with __i915_request_submit() so that it sees
-	 * is-banned?, or we know the request is already inflight.
-	 *
-	 * Note that rq->engine is unstable, and so we double
-	 * check that we have acquired the lock on the final engine.
-	 */
-	locked = READ_ONCE(rq->engine);
-	spin_lock_irq(&locked->sched.lock);
-	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
-		spin_unlock(&locked->sched.lock);
-		locked = engine;
-		spin_lock(&locked->sched.lock);
-	}
-
-	if (i915_request_is_active(rq)) {
-		if (!__i915_request_is_complete(rq))
-			*active = locked;
-		ret = true;
-	}
-
-	spin_unlock_irq(&locked->sched.lock);
-
-	return ret;
-}
-
 static struct intel_engine_cs *active_engine(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = NULL;
@@ -467,7 +435,7 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
 		/* Check with the backend if the request is inflight */
 		found = true;
 		if (likely(rcu_access_pointer(rq->timeline) == ce->timeline))
-			found = __active_engine(rq, &engine);
+			found = i915_request_active_engine(rq, &engine);
 
 		i915_request_put(rq);
 		if (found)
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index e7b4c4bc41a6..8416b0bc4eb3 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -244,6 +244,50 @@ static void __i915_request_fill(struct i915_request *rq, u8 val)
 	memset(vaddr + head, val, rq->postfix - head);
 }
 
+/**
+ * i915_request_active_engine
+ * @rq: request to inspect
+ * @active: pointer in which to return the active engine
+ *
+ * Fills the currently active engine to the @active pointer if the request
+ * is active and still not completed.
+ *
+ * Returns true if request was active or false otherwise.
+ */
+bool
+i915_request_active_engine(struct i915_request *rq,
+			   struct intel_engine_cs **active)
+{
+	struct intel_engine_cs *engine, *locked;
+	bool ret = false;
+
+	/*
+	 * Serialise with __i915_request_submit() so that it sees
+	 * is-banned?, or we know the request is already inflight.
+	 *
+	 * Note that rq->engine is unstable, and so we double
+	 * check that we have acquired the lock on the final engine.
+	 */
+	locked = READ_ONCE(rq->engine);
+	spin_lock_irq(&locked->sched.lock);
+	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
+		spin_unlock(&locked->sched.lock);
+		locked = engine;
+		spin_lock(&locked->sched.lock);
+	}
+
+	if (i915_request_is_active(rq)) {
+		if (!__i915_request_is_complete(rq))
+			*active = locked;
+		ret = true;
+	}
+
+	spin_unlock_irq(&locked->sched.lock);
+
+	return ret;
+}
+
+
 static void remove_from_engine(struct i915_request *rq)
 {
 	struct intel_engine_cs *engine, *locked;
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index dd10a6db3d21..f5374bab7e69 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -650,4 +650,8 @@ static inline bool i915_request_use_semaphores(const struct i915_request *rq)
 	return intel_engine_has_semaphores(rq->engine);
 }
 
+bool
+i915_request_active_engine(struct i915_request *rq,
+			   struct intel_engine_cs **active);
+
 #endif /* I915_REQUEST_H */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
