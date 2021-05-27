Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7EA3933C1
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BC16F43F;
	Thu, 27 May 2021 16:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296046F43C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:02 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id f8so806790pjh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TbKRwu6J4DGStQJbS7Vw6tmAcKRRj+KMlzLdxGm/VCk=;
 b=ACBoenBSzwhD7C58N07ZEdaSnu7iFpT6m2virmlHGwFH1mB2jaUFSvf3WL2LJApQ72
 nLbN/N2roYues7MFvJjlsT4iYeM4VE0S0kdvUgIlgMlD7Wv1AGWTyq1GHWw9zpQ9znH7
 8ZQu+v/LA/DMkJv1qECB+b/sBUYUjLRCoy095StcE7uN19fVqB2kWDs+v+UxcLX8B6yf
 2uPfdguW/cgl4AH9mR6lvtIw2XTqwBNmPlGD+FgJV245NYTJ06c+paimS9/bWbHnWn0A
 +B0RLcM06u+QSU1EEcwe5PGr7ftcB9Y2BjbXksrbbvQSuvsAipQCy9JO1lZdgFdfUpmn
 IPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TbKRwu6J4DGStQJbS7Vw6tmAcKRRj+KMlzLdxGm/VCk=;
 b=moxWwiNVYFVbJxVLLU+XT+EgHFZuijFIIqoDeQSFj+j8mXaV9hyUs+I3QyCrnn0J8z
 GiNAksCxMSeVDIzNsdi7VDLyHdyiHaYlZILHgkZ5OOb6eTVHcHUhHe6UDkRple0YdGwY
 gkwsOtelb2OjPn89W8AjyX8gdEpgW6N+OOemHzKbKvOmIOYVhqt8C5N0W0cdesgzxwKQ
 6RCL/GMy5eg+Goe7z7YCJgEZm+/wJELYDprP1usp2ulQnKvOtQ3wcjC0cfGQu4kBYnqD
 YcdsTsutW+x17vAU9cLHlLzpWD0iwWLW+/YbgppRDczAJ+XhPa3EVQ1rga72g3W76LQ0
 dqkQ==
X-Gm-Message-State: AOAM530Owz79Op6qIzvrAjRy02XkD9DYlVqw1rrNVLcE9WPd6VPlfDYr
 MgWrQ5+j4LrUsVayH6PHvLgpNg==
X-Google-Smtp-Source: ABdhPJyEicC2YRlPQydwqE7cXMjTxLwhFKCdRQCN9XhQQyH5b2xxJUZvmf6gUuCYVNpB/PbDWg41iw==
X-Received: by 2002:a17:90a:de0c:: with SMTP id
 m12mr4783489pjv.54.1622132821563; 
 Thu, 27 May 2021 09:27:01 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/29] drm/i915/gem: Set the watchdog timeout directly in
 intel_context_set_gem (v2)
Date: Thu, 27 May 2021 11:26:25 -0500
Message-Id: <20210527162650.1182544-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527162650.1182544-1-jason@jlekstrand.net>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of handling it like a context param, unconditionally set it when
intel_contexts are created.  For years we've had the idea of a watchdog
uAPI floating about. The aim was for media, so that they could set very
tight deadlines for their transcodes jobs, so that if you have a corrupt
bitstream (especially for decoding) you don't hang your desktop too
hard.  But it's been stuck in limbo since forever, and this simplifies
things a bit in preparation for the proto-context work.  If we decide to
actually make said uAPI a reality, we can do it through the proto-
context easily enough.

This does mean that we move from reading the request_timeout_ms param
once per engine when engines are created instead of once at context
creation.  If someone changes request_timeout_ms between creating a
context and setting engines, it will mean that they get the new timeout.
If someone races setting request_timeout_ms and context creation, they
can theoretically end up with different timeouts.  However, since both
of these are fairly harmless and require changing kernel params, we
don't care.

v2 (Tvrtko Ursulin):
 - Add a comment about races with request_timeout_ms

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 44 +++----------------
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 --
 drivers/gpu/drm/i915/gt/intel_context_param.h |  3 +-
 3 files changed, 7 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 868c18c08a0b1..9a8a96e4346e4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -232,7 +232,12 @@ static void intel_context_set_gem(struct intel_context *ce,
 	    intel_engine_has_timeslices(ce->engine))
 		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
 
-	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
+	if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
+	    ctx->i915->params.request_timeout_ms) {
+		unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
+
+		intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
+	}
 }
 
 static void __free_engines(struct i915_gem_engines *e, unsigned int count)
@@ -791,41 +796,6 @@ static void __assign_timeline(struct i915_gem_context *ctx,
 	context_apply_all(ctx, __apply_timeline, timeline);
 }
 
-static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
-{
-	return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
-}
-
-static int
-__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
-{
-	int ret;
-
-	ret = context_apply_all(ctx, __apply_watchdog,
-				(void *)(uintptr_t)timeout_us);
-	if (!ret)
-		ctx->watchdog.timeout_us = timeout_us;
-
-	return ret;
-}
-
-static void __set_default_fence_expiry(struct i915_gem_context *ctx)
-{
-	struct drm_i915_private *i915 = ctx->i915;
-	int ret;
-
-	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) ||
-	    !i915->params.request_timeout_ms)
-		return;
-
-	/* Default expiry for user fences. */
-	ret = __set_watchdog(ctx, i915->params.request_timeout_ms * 1000);
-	if (ret)
-		drm_notice(&i915->drm,
-			   "Failed to configure default fence expiry! (%d)",
-			   ret);
-}
-
 static struct i915_gem_context *
 i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 {
@@ -870,8 +840,6 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 		intel_timeline_put(timeline);
 	}
 
-	__set_default_fence_expiry(ctx);
-
 	trace_i915_context_create(ctx);
 
 	return ctx;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 5ae71ec936f7c..676592e27e7d2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -153,10 +153,6 @@ struct i915_gem_context {
 	 */
 	atomic_t active_count;
 
-	struct {
-		u64 timeout_us;
-	} watchdog;
-
 	/**
 	 * @hang_timestamp: The last time(s) this context caused a GPU hang
 	 */
diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/drm/i915/gt/intel_context_param.h
index dffedd983693d..0c69cb42d075c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_param.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
@@ -10,11 +10,10 @@
 
 #include "intel_context.h"
 
-static inline int
+static inline void
 intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
 {
 	ce->watchdog.timeout_us = timeout_us;
-	return 0;
 }
 
 #endif /* INTEL_CONTEXT_PARAM_H */
-- 
2.31.1

