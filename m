Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD56347802
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383CD6EB3B;
	Wed, 24 Mar 2021 12:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4176EB37;
 Wed, 24 Mar 2021 12:13:54 +0000 (UTC)
IronPort-SDR: 0f8k0h115DZszvZfTUV2HDEHee2Hm3PBsWWKDuXDjhSsuoP042tmG0Y28Nzt7qJ8xMA79ROuWF
 fF6BeaeKgoEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188386190"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="188386190"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:54 -0700
IronPort-SDR: MzFn5TD7fiM83JbWrrTdlDDMM6biduFRx7dawY5K96+yoLRMdprPfnu0B6srzNbo7qVtm+lNfD
 dAE4L3QrFdcg==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391277160"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.248.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:52 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915: Fail too long user submissions by default
Date: Wed, 24 Mar 2021 12:13:34 +0000
Message-Id: <20210324121335.2307063-7-tvrtko.ursulin@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A new Kconfig option CONFIG_DRM_I915_REQUEST_TIMEOUT is added, defaulting
to 20s, and this timeout is applied to all users contexts using the
previously added watchdog facility.

Result of this is that any user submission will simply fail after this
timeout, either causing a reset (for non-preemptable), or incomplete
results.

This can have an effect that workloads which used to work fine will
suddenly start failing. Even workloads comprised of short batches but in
long dependency chains can be terminated.

And because of lack of agreement on usefulness and safety of fence error
propagation this partial execution can be invisible to userspace even if
it is "listening" to returned fence status.

Another interaction is with hangcheck where care needs to be taken timeout
is not set lower or close to three times the heartbeat interval. Otherwise
a hang in any application can cause complete termination of all
submissions from unrelated clients. Any users modifying the per engine
heartbeat intervals therefore need to be aware of this potential denial of
service to avoid inadvertently enabling it.

Given all this I am personally not convinced the scheme is a good idea.
Intuitively it feels object importers would be better positioned to
enforce the time they are willing to wait for something to complete.

v2:
 * Improved commit message and Kconfig text.
 * Pull in some helper code from patch which got dropped.

v3:
 * Bump timeout to 20s to see if it helps Tigerlake.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.profile          | 14 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 38 +++++++++++++++++++
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 ++
 drivers/gpu/drm/i915/gt/intel_context_param.h | 11 +++++-
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
index 35bbe2b80596..39328567c200 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -1,3 +1,17 @@
+config DRM_I915_REQUEST_TIMEOUT
+	int "Default timeout for requests (ms)"
+	default 20000 # milliseconds
+	help
+	  Configures the default timeout after which any user submissions will
+	  be forcefully terminated.
+
+	  Beware setting this value lower, or close to heartbeat interval
+	  rounded to whole seconds times three, in order to avoid allowing
+	  misbehaving applications causing total rendering failure in unrelated
+	  clients.
+
+	  May be 0 to disable the timeout.
+
 config DRM_I915_FENCE_TIMEOUT
 	int "Timeout for unsignaled foreign fences (ms, jiffy granularity)"
 	default 10000 # milliseconds
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 03a2f5f2a11f..33ff1a6a7724 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -233,6 +233,8 @@ static void intel_context_set_gem(struct intel_context *ce,
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
 	    intel_engine_has_timeslices(ce->engine))
 		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
+
+	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
 }
 
 static void __free_engines(struct i915_gem_engines *e, unsigned int count)
@@ -820,6 +822,40 @@ static void __assign_timeline(struct i915_gem_context *ctx,
 	context_apply_all(ctx, __apply_timeline, timeline);
 }
 
+static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
+{
+	return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
+}
+
+static int
+__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
+{
+	int ret;
+
+	ret = context_apply_all(ctx, __apply_watchdog,
+				(void *)(uintptr_t)timeout_us);
+	if (!ret)
+		ctx->watchdog.timeout_us = timeout_us;
+
+	return ret;
+}
+
+static void __set_default_fence_expiry(struct i915_gem_context *ctx)
+{
+	struct drm_i915_private *i915 = ctx->i915;
+	int ret;
+
+	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT))
+		return;
+
+	/* Default expiry for user fences. */
+	ret = __set_watchdog(ctx, CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000);
+	if (ret)
+		drm_notice(&i915->drm,
+			   "Failed to configure default fence expiry! (%d)",
+			   ret);
+}
+
 static struct i915_gem_context *
 i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 {
@@ -864,6 +900,8 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 		intel_timeline_put(timeline);
 	}
 
+	__set_default_fence_expiry(ctx);
+
 	trace_i915_context_create(ctx);
 
 	return ctx;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index d5bc75508048..f17da7e26c43 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -150,6 +150,10 @@ struct i915_gem_context {
 	 */
 	atomic_t active_count;
 
+	struct {
+		u64 timeout_us;
+	} watchdog;
+
 	/**
 	 * @hang_timestamp: The last time(s) this context caused a GPU hang
 	 */
diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/drm/i915/gt/intel_context_param.h
index f053d8633fe2..3ecacc675f41 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_param.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
@@ -6,9 +6,18 @@
 #ifndef INTEL_CONTEXT_PARAM_H
 #define INTEL_CONTEXT_PARAM_H
 
-struct intel_context;
+#include <linux/types.h>
+
+#include "intel_context.h"
 
 int intel_context_set_ring_size(struct intel_context *ce, long sz);
 long intel_context_get_ring_size(struct intel_context *ce);
 
+static inline int
+intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
+{
+	ce->watchdog.timeout_us = timeout_us;
+	return 0;
+}
+
 #endif /* INTEL_CONTEXT_PARAM_H */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
