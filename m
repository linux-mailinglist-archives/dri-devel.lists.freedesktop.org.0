Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE13477FF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A81A6EB34;
	Wed, 24 Mar 2021 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA706EB34;
 Wed, 24 Mar 2021 12:13:56 +0000 (UTC)
IronPort-SDR: A2aQwcztrCWqTPRaQG8L4WLXUAnMp8DdpLQafuXoslQ9n3wyrT/GKB35bR85lmyLHuYhv8y/Q0
 EXZuc5knkpRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188386196"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="188386196"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:55 -0700
IronPort-SDR: sRDVGbfS7mnMR9PAKopnDVtgl9OO/g/AP5h/AdF2OjpYujDWWiU502JewGnEe7AqienTZr43Gi
 AofWIHDKNqvg==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391277170"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.248.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:54 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915: Allow configuring default request expiry via
 modparam
Date: Wed, 24 Mar 2021 12:13:35 +0000
Message-Id: <20210324121335.2307063-8-tvrtko.ursulin@linux.intel.com>
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
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 +++--
 drivers/gpu/drm/i915/i915_params.c          | 5 +++++
 drivers/gpu/drm/i915/i915_params.h          | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 33ff1a6a7724..0e8f0476e01f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -845,11 +845,12 @@ static void __set_default_fence_expiry(struct i915_gem_context *ctx)
 	struct drm_i915_private *i915 = ctx->i915;
 	int ret;
 
-	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT))
+	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) ||
+	    !i915->params.request_timeout_ms)
 		return;
 
 	/* Default expiry for user fences. */
-	ret = __set_watchdog(ctx, CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000);
+	ret = __set_watchdog(ctx, i915->params.request_timeout_ms * 1000);
 	if (ret)
 		drm_notice(&i915->drm,
 			   "Failed to configure default fence expiry! (%d)",
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
