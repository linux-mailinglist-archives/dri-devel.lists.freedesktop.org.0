Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBAB339242
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 16:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6A86F8AF;
	Fri, 12 Mar 2021 15:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220B76F8A9;
 Fri, 12 Mar 2021 15:49:26 +0000 (UTC)
IronPort-SDR: QNj3v1ewgRY6k5W6JGZPAks3dSfqDO/6AvaO6hfka01kXQDadhXfdQJGJTnd/0WguSjLueoZtq
 MmYaEmM+niHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="186473804"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="186473804"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:25 -0800
IronPort-SDR: KZ+Z5l76G0T5X5us7YuBSXovQtGLxe3YUpNVJri99zDMG4Gl8B1T4Zszsp7CUedkx98utR3X/m
 Hgal7bxAGMXA==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="448655430"
Received: from nstrumtz-desk02.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.214.213.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:23 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [RFC 6/6] drm/i915: Allow configuring default request expiry via
 modparam
Date: Fri, 12 Mar 2021 15:46:22 +0000
Message-Id: <20210312154622.1767865-7-tvrtko.ursulin@linux.intel.com>
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

Module parameter is added (request_timeout_ms) to allow configuring the
default request/fence expiry.

Default value is inherited from CONFIG_DRM_I915_REQUEST_TIMEOUT.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 8 +++++---
 drivers/gpu/drm/i915/i915_params.c          | 5 +++++
 drivers/gpu/drm/i915/i915_params.h          | 1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 21c0176e27a0..1dae5e2514a9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -866,7 +866,7 @@ static void __set_default_fence_expiry(struct i915_gem_context *ctx)
 		return;
 
 	/* Default expiry for user fences. */
-	ret = __set_watchdog(ctx, CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000);
+	ret = __set_watchdog(ctx, i915->params.request_timeout_ms * 1000);
 	if (ret)
 		drm_notice(&i915->drm,
 			   "Failed to configure default fence expiry! (%d)",
@@ -1442,13 +1442,15 @@ __set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
 static int set_watchdog(struct i915_gem_context *ctx,
 			struct drm_i915_gem_context_param *args)
 {
+	struct drm_i915_private *i915 = ctx->i915;
+
 	if (args->size)
 		return -EINVAL;
 
 	/* Disallow disabling or configuring longer watchdog than default. */
-	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
+	if (i915->params.request_timeout_ms &&
 	    (!args->value ||
-	     args->value > CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000))
+	     args->value > i915->params.request_timeout_ms * 1000))
 		return -EPERM;
 
 	return __set_watchdog(ctx, args->value);
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 6939634e56ed..0320878d96b0 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -197,6 +197,11 @@ i915_param_named_unsafe(fake_lmem_start, ulong, 0400,
 	"Fake LMEM start offset (default: 0)");
 #endif
 
+#if CONFIG_DRM_I915_REQUEST_TIMEOUT
+i915_param_named_unsafe(request_timeout_ms, uint, 0600,
+			"Default request/fence/batch buffer expiration timeout.");
+#endif
+
 static __always_inline void _print_param(struct drm_printer *p,
 					 const char *name,
 					 const char *type,
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 48f47e44e848..34ebb0662547 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -72,6 +72,7 @@ struct drm_printer;
 	param(int, enable_dpcd_backlight, -1, 0600) \
 	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
 	param(unsigned long, fake_lmem_start, 0, 0400) \
+	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, 0600) \
 	/* leave bools at the end to not create holes */ \
 	param(bool, enable_hangcheck, true, 0600) \
 	param(bool, load_detect_test, false, 0600) \
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
