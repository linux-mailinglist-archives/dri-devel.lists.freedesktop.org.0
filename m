Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF169339241
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 16:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066BD6F8AE;
	Fri, 12 Mar 2021 15:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAD06F8A7;
 Fri, 12 Mar 2021 15:49:24 +0000 (UTC)
IronPort-SDR: hQBx3vYPkULlxGh3VZk7Ujm2f0Rfi5aX6YN/ER18utO69knb6jKW2aaR/0c4h94maRfBktBc/8
 mfCI5vymewMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="186473801"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="186473801"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:23 -0800
IronPort-SDR: jy9WAt88zEhOvoZGOZftaAQ3fRYLgj/WXQME8m/3WOY1aTNdnfovqPicXX2DOFV2UKJ1CFdOhm
 bOKGHBL3843Q==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="448655424"
Received: from nstrumtz-desk02.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.214.213.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:21 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [RFC 5/6] drm/i915: Fail too long user submissions by default
Date: Fri, 12 Mar 2021 15:46:21 +0000
Message-Id: <20210312154622.1767865-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
References: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A new Kconfig option CONFIG_DRM_I915_REQUEST_TIMEOUT is added, defaulting
to 10s, and this timeout is applied to _all_ contexts using the previously
added watchdog facility.

Result of this is that any user submission will simply fail after this
time, either causing a reset (for non-preemptable) or incomplete results.

This can have an effect that workloads which used to work fine will
suddenly start failing.

When the default expiry is active userspace will not be allowed to
decrease the timeout using the context param setting.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/Kconfig.profile        |  8 ++++
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 47 ++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
index 35bbe2b80596..55e157ffff73 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -1,3 +1,11 @@
+config DRM_I915_REQUEST_TIMEOUT
+	int "Default timeout for requests (ms)"
+	default 10000 # milliseconds
+	help
+	  ...
+
+	  May be 0 to disable the timeout.
+
 config DRM_I915_FENCE_TIMEOUT
 	int "Timeout for unsignaled foreign fences (ms, jiffy granularity)"
 	default 10000 # milliseconds
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 32b05af4fc8f..21c0176e27a0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -854,6 +854,25 @@ static void __assign_timeline(struct i915_gem_context *ctx,
 	context_apply_all(ctx, __apply_timeline, timeline);
 }
 
+static int
+__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us);
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
@@ -898,6 +917,8 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 		intel_timeline_put(timeline);
 	}
 
+	__set_default_fence_expiry(ctx);
+
 	trace_i915_context_create(ctx);
 
 	return ctx;
@@ -1404,23 +1425,35 @@ static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
 	return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
 }
 
-static int set_watchdog(struct i915_gem_context *ctx,
-			struct drm_i915_gem_context_param *args)
+static int
+__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
 {
 	int ret;
 
-	if (args->size)
-		return -EINVAL;
-
 	ret = context_apply_all(ctx, __apply_watchdog,
-				(void *)(uintptr_t)args->value);
+				(void *)(uintptr_t)timeout_us);
 
 	if (!ret)
-		ctx->watchdog.timeout_us = args->value;
+		ctx->watchdog.timeout_us = timeout_us;
 
 	return ret;
 }
 
+static int set_watchdog(struct i915_gem_context *ctx,
+			struct drm_i915_gem_context_param *args)
+{
+	if (args->size)
+		return -EINVAL;
+
+	/* Disallow disabling or configuring longer watchdog than default. */
+	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
+	    (!args->value ||
+	     args->value > CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000))
+		return -EPERM;
+
+	return __set_watchdog(ctx, args->value);
+}
+
 static int __get_ringsize(struct intel_context *ce, void *arg)
 {
 	long sz;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
