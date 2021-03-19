Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB383428C9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 23:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F436EB0A;
	Fri, 19 Mar 2021 22:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAFD6EB0A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 22:39:09 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id m7so4642986pgj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LdyMF5N6UJz9l9B3/pTkjnqnnrVns0ze+/0LiNxxf7E=;
 b=xx4ADo5FQSF0tRcHy3kvUvQ16KxpU1qnYXlm9TyeMrjyGdkwia56eCHKguRQkk7j7n
 BGKjP8RKVgjsukNDJ3abE2mseV2kmB2JQHD9CNCf4WkRcDxa0n0vOWcf9SrTi01A+nvd
 Y6uRfZyhJzoVCLnuWC++WQ/YYEG1WOnjHcuToDOSeWO9g7s75iqENdVX0JM+SSHOeNS0
 dZjRRqF687H93AG/u8LnkNJTJvKZFDZ7uRZO1mNuP76qcbzn5yptiFM4QbU/5J0yj45a
 prq9dEE552h9Yr7va4pou8tz/VskEQMXtjmNEzH93ySmhVDghacuzOBHV6hodsD31Nfe
 Spkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LdyMF5N6UJz9l9B3/pTkjnqnnrVns0ze+/0LiNxxf7E=;
 b=sOOEgVmpOQrLHm7ZKIx0RQQT790YHanMosVEuA/OqBZzXCnEx66hngbrCFAkSkAZq7
 10Twvihdj4934vJD2VLQXSzqvzbejaJ1MlCmXJfp1iXo8LQNxM+5rqGStrfizotloOIV
 G9CQgcggur9m8y11XzLrMsg4+BvLXku02wD4Qge57wO0FfzcnnnYzsqbBvMlhuwgXT1U
 NxLSF6ACmXSipHw765U1++pCilpS78EHeI+ajrsBMopwPoTocVcg2hJEXHzjhXXKjDp0
 /hDYYSGBH9lw+S+nzKhuov/gs64pDfYEEZDvtcsEY5y1cBf5yY/e3JbI5SclFZVbnO00
 tf3w==
X-Gm-Message-State: AOAM5321shNtw608aiPBCy0VB+lK0/HPWGrZWpjnMJcAKmx8HQ2+ests
 o5xVlRRE9nN3oQP8AoGb9XpaOTYHFV/Biw==
X-Google-Smtp-Source: ABdhPJyuxZ0aEjZB/sQ/q0ZnYxiS8q5X/OS01zTkSYefkuntX3FbHgOmkgJiUdwXyokPsAZK0S7fzQ==
X-Received: by 2002:a65:62d9:: with SMTP id m25mr5429983pgv.6.1616193548293;
 Fri, 19 Mar 2021 15:39:08 -0700 (PDT)
Received: from omlet.com ([134.134.137.77])
 by smtp.gmail.com with ESMTPSA id a20sm6809206pfl.97.2021.03.19.15.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 15:39:07 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Implement SINGLE_TIMELINE with a syncobj
Date: Fri, 19 Mar 2021 17:38:56 -0500
Message-Id: <20210319223856.2983244-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319223856.2983244-1-jason@jlekstrand.net>
References: <20210319223856.2983244-1-jason@jlekstrand.net>
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

I'd love to delete the SINGLE_TIMELINE API because it leaks an
implementation detail of contexts through to the API and is something
that userspace can do itself, trivially.  Unfortunately, it's used by
the media driver so we can't do that.  We can, however, do the next-best
thing which is to embed a syncobj in the context and do exactly what
we'd expect from userspace internally.

This has a couple of advantages.  One is that we're no longer leaking a
detail of the current execlist scheduler which will be problematic when
we try to add GuC scheduling.  Second is that, together with deleting
the CLONE_CONTEXT API, we should now have a 1:1 mapping between
intel_context and intel_timeline which should make some of our locking
mess a bit easier.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 47 ++++---------------
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  8 +++-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++++
 3 files changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index f88bac19333ec..e094f4a1ca4cd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -67,6 +67,8 @@
 #include <linux/log2.h>
 #include <linux/nospec.h>
 
+#include <drm/drm_syncobj.h>
+
 #include "gt/gen6_ppgtt.h"
 #include "gt/intel_context.h"
 #include "gt/intel_engine_heartbeat.h"
@@ -224,10 +226,6 @@ static void intel_context_set_gem(struct intel_context *ce,
 		ce->vm = vm;
 	}
 
-	GEM_BUG_ON(ce->timeline);
-	if (ctx->timeline)
-		ce->timeline = intel_timeline_get(ctx->timeline);
-
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
 	    intel_engine_has_timeslices(ce->engine))
 		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
@@ -344,8 +342,8 @@ void i915_gem_context_release(struct kref *ref)
 	mutex_destroy(&ctx->engines_mutex);
 	mutex_destroy(&ctx->lut_mutex);
 
-	if (ctx->timeline)
-		intel_timeline_put(ctx->timeline);
+	if (ctx->syncobj)
+		drm_syncobj_put(ctx->syncobj);
 
 	put_pid(ctx->pid);
 	mutex_destroy(&ctx->mutex);
@@ -790,33 +788,11 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
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
@@ -845,16 +821,13 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
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
index 676592e27e7d2..8a5fdd163b79d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -83,7 +83,13 @@ struct i915_gem_context {
 	struct i915_gem_engines __rcu *engines;
 	struct mutex engines_mutex; /* guards writes to engines */
 
-	struct intel_timeline *timeline;
+	/**
+	 * @syncobj: Shared timeline syncobj
+	 *
+	 * When the SHARED_TIMELINE flag is set on context creation, this
+	 * provides automatic implicit synchronization across all engines.
+	 */
+	struct drm_syncobj *syncobj;
 
 	/**
 	 * @vm: unique address space (GTT)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 96403130a373d..2c56796f6a71b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3295,6 +3295,15 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		goto err_vma;
 	}
 
+	if (eb.gem_context->syncobj) {
+		struct dma_fence *fence;
+
+		fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
+		err = i915_request_await_dma_fence(eb.request, fence);
+		if (err)
+			goto err_ext;
+	}
+
 	if (in_fence) {
 		if (args->flags & I915_EXEC_FENCE_SUBMIT)
 			err = i915_request_await_execution(eb.request,
@@ -3351,6 +3360,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 			fput(out_fence->file);
 		}
 	}
+
+	if (eb.gem_context->syncobj) {
+		drm_syncobj_replace_fence(eb.gem_context->syncobj,
+					  &eb.request->fence);
+	}
+
 	i915_request_put(eb.request);
 
 err_vma:
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
