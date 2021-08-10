Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F663E5AAC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 15:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558AE89192;
	Tue, 10 Aug 2021 13:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A6589FD4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 13:05:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id u1so3010878wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RgZzYwAukThPOlbb9axftR1ZcNQVDbSiNqAdnxRQytM=;
 b=k/bwTdsKidGtQcPASL7QQxX199utP0yFOUyhkpLV/tn++dXuqciikhlJEcIG2ilYst
 3B4a0SI5DQ3l9tzRrP7/x+irU8G3sYbV+rZeS9clfMZg9uSNJZK9D1xANYtMN8E3Bryr
 6f+FVcAW1o6xkuxoskToDPtisdc1pXZ5H9MAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RgZzYwAukThPOlbb9axftR1ZcNQVDbSiNqAdnxRQytM=;
 b=kamJgPYZpre8i1pB9/o/eB0BS9xoHJq9mGGPr22SgrYwUF2ipvkBORDDNcdJaBzNOa
 98LsQl7JFD3hKlYKecNYD1GiZwgQLE9db6CdcxdYZGd4SAI5ThZgj0C5qB6SQZg4DzCM
 uaMp4FZeZu47clMh9L3fJvWXvxIZrJNJxUmaaic8IiIea6LX0z58tk9ZRctA/9meETZE
 jJoqxTafBKyrZO+1kqEHYt62vWcu15966jzxrVpPeCdDqq5A/w5LOVtXFzOpt2bmMhQo
 vjurtbF/pTob66OOon+btXIZYdnzHtEB6O6sXqDVY/9Umf6iew7neRTPTA4iaE01A02v
 n6tA==
X-Gm-Message-State: AOAM532X4I6tuURsKU5SjLjieHHRBxv06KIt0/0bS2GUoap5XhZAYioS
 0yahZ0mhRosb1YF2uEzjWdD+Sw==
X-Google-Smtp-Source: ABdhPJyI1Sp3VBaOE8C5JZiEaHi04E3Wj/h5o26OHM2T5DoNWPOmr3CwLti8tGJWk8BGhtbvLndAuw==
X-Received: by 2002:a05:600c:1546:: with SMTP id
 f6mr22251071wmg.125.1628600730034; 
 Tue, 10 Aug 2021 06:05:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k31sm5281717wms.31.2021.08.10.06.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:05:29 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/i915: Use locked access to ctx->engines in set_priority
Date: Tue, 10 Aug 2021 15:05:23 +0200
Message-Id: <20210810130523.1972031-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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

This essentially reverts

commit 89ff76bf9b3b0b86e6bbe344bd6378d8661303fc
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Thu Apr 2 13:42:18 2020 +0100

    drm/i915/gem: Utilize rcu iteration of context engines

Note that the other use of __context_engines_await have disappeard in
the following commits:

ccbc1b97948a ("drm/i915/gem: Don't allow changing the VM on running contexts (v4)")
c7a71fc8ee04 ("drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES")
4a766ae40ec8 ("drm/i915: Drop the CONTEXT_CLONE API (v2)")

None of these have any business to optimize their engine lookup with
rcu, unless extremely convincing benchmark data and a solid analysis
why we can't make that workload (whatever it is that does) faster with
a proper design fix.

Also since there's only one caller of context_apply_all left and it's
really just a loop, inline it and then inline the lopp body too. This
is how all other callers that take the engine lock loop over engines,
it's much simpler.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 72 ++++-----------------
 1 file changed, 14 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index dbaeb924a437..fd169cf2f75a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1284,49 +1284,6 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
 	return 0;
 }
 
-static inline struct i915_gem_engines *
-__context_engines_await(const struct i915_gem_context *ctx,
-			bool *user_engines)
-{
-	struct i915_gem_engines *engines;
-
-	rcu_read_lock();
-	do {
-		engines = rcu_dereference(ctx->engines);
-		GEM_BUG_ON(!engines);
-
-		if (user_engines)
-			*user_engines = i915_gem_context_user_engines(ctx);
-
-		/* successful await => strong mb */
-		if (unlikely(!i915_sw_fence_await(&engines->fence)))
-			continue;
-
-		if (likely(engines == rcu_access_pointer(ctx->engines)))
-			break;
-
-		i915_sw_fence_complete(&engines->fence);
-	} while (1);
-	rcu_read_unlock();
-
-	return engines;
-}
-
-static void
-context_apply_all(struct i915_gem_context *ctx,
-		  void (*fn)(struct intel_context *ce, void *data),
-		  void *data)
-{
-	struct i915_gem_engines_iter it;
-	struct i915_gem_engines *e;
-	struct intel_context *ce;
-
-	e = __context_engines_await(ctx, NULL);
-	for_each_gem_engine(ce, e, it)
-		fn(ce, data);
-	i915_sw_fence_complete(&e->fence);
-}
-
 static struct i915_gem_context *
 i915_gem_create_context(struct drm_i915_private *i915,
 			const struct i915_gem_proto_context *pc)
@@ -1776,23 +1733,11 @@ set_persistence(struct i915_gem_context *ctx,
 	return __context_set_persistence(ctx, args->value);
 }
 
-static void __apply_priority(struct intel_context *ce, void *arg)
-{
-	struct i915_gem_context *ctx = arg;
-
-	if (!intel_engine_has_timeslices(ce->engine))
-		return;
-
-	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
-	    intel_engine_has_semaphores(ce->engine))
-		intel_context_set_use_semaphores(ce);
-	else
-		intel_context_clear_use_semaphores(ce);
-}
-
 static int set_priority(struct i915_gem_context *ctx,
 			const struct drm_i915_gem_context_param *args)
 {
+	struct i915_gem_engines_iter it;
+	struct intel_context *ce;
 	int err;
 
 	err = validate_priority(ctx->i915, args);
@@ -1800,7 +1745,18 @@ static int set_priority(struct i915_gem_context *ctx,
 		return err;
 
 	ctx->sched.priority = args->value;
-	context_apply_all(ctx, __apply_priority, ctx);
+
+	for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it) {
+		if (!intel_engine_has_timeslices(ce->engine))
+			continue;
+
+		if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
+		    intel_engine_has_semaphores(ce->engine))
+			intel_context_set_use_semaphores(ce);
+		else
+			intel_context_clear_use_semaphores(ce);
+	}
+	i915_gem_context_unlock_engines(ctx);
 
 	return 0;
 }
-- 
2.32.0

