Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C17F369CA3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E366ECB2;
	Fri, 23 Apr 2021 22:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78ED6ECAB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:31:46 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id m11so34975775pfc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/i3TjgiFgKtmiEefAjw6hXE7Lu1ZwY2eDE/tGEb2mto=;
 b=AA1Lx2E/T6KOo8sOgbP8i0JGCp/Dc4hJ1vQzqfWykmwaRXGRdaVy7/f/SojXXaqxPW
 QhHC0k2gk52rkASCM+o3Upmrwyq30Ogt8pXQQ9NJWsU3YWcBV9LjwfUhbfhcCRk+Cyg3
 VWC74ZvD1OaSFav5ZS7/LoeVr83Ch38BscwHO3bJk8lLGt+taWGRT5DgwI4UJiYO9VJe
 rS/oFCcTQcs9d/NdSXwxy2/2oCRdPWlKBFr+YklTNtWCK0zAs1Axie3aCUyJCNJhn5nf
 DfQoPuiox3pwuQT5S+fHlnLWLUu7NFeipmqo1u4S0NNidqcUB6kqjo+mheZ2bsKyalXk
 7L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/i3TjgiFgKtmiEefAjw6hXE7Lu1ZwY2eDE/tGEb2mto=;
 b=Bs6hkNgjATFan/OHPCJb68XPhDOL//K3LMALUq0kV4KNoEldflME01vRp1k3R6wHL0
 GzvaSy6tiVyDa9rqo0ug8yK5KA+BiN20YldeuURI9HKqSmFjrACqPwFyjze4nj+3fIoW
 NsVsHlqzMyFjTYjgPjdXe7RRfTKx5Xnpo4oefhIAy8n+0QRiXJLftSyxnGYElH48U9id
 /FWc3G6aSm+0wouyc+hti3O5KbGlX63yyDYD74cK6DCzHvbhj8UkMBpiM1rP1ZuROxGw
 ZOL6Gk4iQzQdq9c2Tc/lJkmXZyObMdauUQM94FLW0R0kC6mZaGRdYTCht90/she5rd/v
 +wcg==
X-Gm-Message-State: AOAM530CnZ8S5GbarRDelRMSAGuMo0oK2woWkVOKUgQxrNRqWG2LgECJ
 OpKrvdK8FuRYP6evWH2V7m7yZw==
X-Google-Smtp-Source: ABdhPJyDPgDJ9YEuRWicffRG+3vfUGB8ukgFUPTDHb5oN/6L3BAMwOcEEyy8AtLKm4Ten+V0BwAsdw==
X-Received: by 2002:a63:4a1a:: with SMTP id x26mr5912198pga.429.1619217106342; 
 Fri, 23 Apr 2021 15:31:46 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:31:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/21] drm/i915: Implement SINGLE_TIMELINE with a syncobj (v3)
Date: Fri, 23 Apr 2021 17:31:16 -0500
Message-Id: <20210423223131.879208-7-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423223131.879208-1-jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This API is entirely unnecessary and I'd love to get rid of it.  If
userspace wants a single timeline across multiple contexts, they can
either use implicit synchronization or a syncobj, both of which existed
at the time this feature landed.  The justification given at the time
was that it would help GL drivers which are inherently single-timeline.
However, neither of our GL drivers actually wanted the feature.  i965
was already in maintenance mode at the time and iris uses syncobj for
everything.

Unfortunately, as much as I'd love to get rid of it, it is used by the
media driver so we can't do that.  We can, however, do the next-best
thing which is to embed a syncobj in the context and do exactly what
we'd expect from userspace internally.  This isn't an entirely identical
implementation because it's no longer atomic if userspace races with
itself by calling execbuffer2 twice simultaneously from different
threads.  It won't crash in that case; it just doesn't guarantee any
ordering between those two submits.

Moving SINGLE_TIMELINE to a syncobj emulation has a couple of technical
advantages beyond mere annoyance.  One is that intel_timeline is no
longer an api-visible object and can remain entirely an implementation
detail.  This may be advantageous as we make scheduler changes going
forward.  Second is that, together with deleting the CLONE_CONTEXT API,
we should now have a 1:1 mapping between intel_context and
intel_timeline which may help us reduce locking.

v2 (Jason Ekstrand):
 - Update the comment on i915_gem_context::syncobj to mention that it's
   an emulation and the possible race if userspace calls execbuffer2
   twice on the same context concurrently.
 - Wrap the checks for eb.gem_context->syncobj in unlikely()
 - Drop the dma_fence reference
 - Improved commit message

v3 (Jason Ekstrand):
 - Move the dma_fence_put() to before the error exit

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 49 +++++--------------
 .../gpu/drm/i915/gem/i915_gem_context_types.h | 14 +++++-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 16 ++++++
 3 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 2c2fefa912805..a72c9b256723b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -67,6 +67,8 @@
 #include <linux/log2.h>
 #include <linux/nospec.h>
 
+#include <drm/drm_syncobj.h>
+
 #include "gt/gen6_ppgtt.h"
 #include "gt/intel_context.h"
 #include "gt/intel_context_param.h"
@@ -225,10 +227,6 @@ static void intel_context_set_gem(struct intel_context *ce,
 		ce->vm = vm;
 	}
 
-	GEM_BUG_ON(ce->timeline);
-	if (ctx->timeline)
-		ce->timeline = intel_timeline_get(ctx->timeline);
-
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
 	    intel_engine_has_timeslices(ce->engine))
 		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
@@ -351,9 +349,6 @@ void i915_gem_context_release(struct kref *ref)
 	mutex_destroy(&ctx->engines_mutex);
 	mutex_destroy(&ctx->lut_mutex);
 
-	if (ctx->timeline)
-		intel_timeline_put(ctx->timeline);
-
 	put_pid(ctx->pid);
 	mutex_destroy(&ctx->mutex);
 
@@ -570,6 +565,9 @@ static void context_close(struct i915_gem_context *ctx)
 	if (vm)
 		i915_vm_close(vm);
 
+	if (ctx->syncobj)
+		drm_syncobj_put(ctx->syncobj);
+
 	ctx->file_priv = ERR_PTR(-EBADF);
 
 	/*
@@ -765,33 +763,11 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
 		i915_vm_close(vm);
 }
 
-static void __set_timeline(struct intel_timeline **dst,
-			   struct intel_timeline *src)
-{
-	struct intel_timeline *old = *dst;
-
-	*dst = src ? intel_timeline_get(src) : NULL;
-
-	if (old)
-		intel_timeline_put(old);
-}
-
-static void __apply_timeline(struct intel_context *ce, void *timeline)
-{
-	__set_timeline(&ce->timeline, timeline);
-}
-
-static void __assign_timeline(struct i915_gem_context *ctx,
-			      struct intel_timeline *timeline)
-{
-	__set_timeline(&ctx->timeline, timeline);
-	context_apply_all(ctx, __apply_timeline, timeline);
-}
-
 static struct i915_gem_context *
 i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 {
 	struct i915_gem_context *ctx;
+	int ret;
 
 	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
 	    !HAS_EXECLISTS(i915))
@@ -820,16 +796,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 	}
 
 	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
-		struct intel_timeline *timeline;
-
-		timeline = intel_timeline_create(&i915->gt);
-		if (IS_ERR(timeline)) {
+		ret = drm_syncobj_create(&ctx->syncobj,
+					 DRM_SYNCOBJ_CREATE_SIGNALED,
+					 NULL);
+		if (ret) {
 			context_close(ctx);
-			return ERR_CAST(timeline);
+			return ERR_PTR(ret);
 		}
-
-		__assign_timeline(ctx, timeline);
-		intel_timeline_put(timeline);
 	}
 
 	trace_i915_context_create(ctx);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 676592e27e7d2..df76767f0c41b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -83,7 +83,19 @@ struct i915_gem_context {
 	struct i915_gem_engines __rcu *engines;
 	struct mutex engines_mutex; /* guards writes to engines */
 
-	struct intel_timeline *timeline;
+	/**
+	 * @syncobj: Shared timeline syncobj
+	 *
+	 * When the SHARED_TIMELINE flag is set on context creation, we
+	 * emulate a single timeline across all engines using this syncobj.
+	 * For every execbuffer2 call, this syncobj is used as both an in-
+	 * and out-fence.  Unlike the real intel_timeline, this doesn't
+	 * provide perfect atomic in-order guarantees if the client races
+	 * with itself by calling execbuffer2 twice concurrently.  However,
+	 * if userspace races with itself, that's not likely to yield well-
+	 * defined results anyway so we choose to not care.
+	 */
+	struct drm_syncobj *syncobj;
 
 	/**
 	 * @vm: unique address space (GTT)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index b812f313422a9..d640bba6ad9ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3460,6 +3460,16 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		goto err_vma;
 	}
 
+	if (unlikely(eb.gem_context->syncobj)) {
+		struct dma_fence *fence;
+
+		fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
+		err = i915_request_await_dma_fence(eb.request, fence);
+		dma_fence_put(fence);
+		if (err)
+			goto err_ext;
+	}
+
 	if (in_fence) {
 		if (args->flags & I915_EXEC_FENCE_SUBMIT)
 			err = i915_request_await_execution(eb.request,
@@ -3517,6 +3527,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 			fput(out_fence->file);
 		}
 	}
+
+	if (unlikely(eb.gem_context->syncobj)) {
+		drm_syncobj_replace_fence(eb.gem_context->syncobj,
+					  &eb.request->fence);
+	}
+
 	i915_request_put(eb.request);
 
 err_vma:
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
