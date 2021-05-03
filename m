Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F6737189D
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5DF6E8EA;
	Mon,  3 May 2021 15:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4904E6E8E6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:04 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id i13so4493108pfu.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kRTuwDNC4ils+7NiZYLhZ8grmBdiU9nKzwhxjTQvJI=;
 b=j5nA1WEV0MW7nVoQGeNUyzdHvMuXYr4COXsiXnsrmxg/ErXLAnwHfYn5SFvmMPOLfP
 sWFUiWBLa7dfWAosYUQH0JebWX5gUyKY2/LqR9gPhzdPs0Mfg6Xo1oBF3yh/GyXA1LEn
 0rB7Z2ie+Zu7WnhIqssG9pz9K3AYR9vxOcJBeynYn+yKr+aSA51SrdBApN5rI0uO1WFf
 SBSi7/Icg8WMeA96v9NO5tOCZG0+ODSf6es8EBuPoAV8IHARZs5YuGxCsbv9h2XmLfMs
 17Bl/rfmUDHJ8j400YK9Ytsg6fQSkrgquiVQZqxx0Pi0xT+KPxgzOCrI1Ao9dJfeEwil
 GjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kRTuwDNC4ils+7NiZYLhZ8grmBdiU9nKzwhxjTQvJI=;
 b=e1l4ryFA7AqnKPAQc4p5jqXa4fChsT8Y6VDvxn/Up4yMCUoI+mZWkhFaKkFmpbhkmx
 GqHfgS1HB+3EQQwzgUURHDjeaHuWwsJXyOlnPLBYm85l+I5DI1GN1YIdhup4KS293Gs0
 s4Ya22w0bBHQCJKdyAJds2U85YlWuzx6jv7n/LMJGt8O5a6kLJDjd8BzwmirTEWAP3c3
 6G8AnpZJW2K4BTLFVcyrppDAIn43fke/p/CURStfNC4nlSEf5mte8a5v4V7qmeoViUFc
 k8TScjlFx3+W7sqRRrfQ7zvsE0VeYV043AJfKUu8MPVdIvutzKplwwDyTQOkgDOm1Ct/
 f4sQ==
X-Gm-Message-State: AOAM531IMaXlUAmREs9Fe+jrDJnbJv5eOFdbN+vS7B7DeK8jMNGNlhUg
 LzCdelDNsg5wOE18q1oEaqHchA==
X-Google-Smtp-Source: ABdhPJz31Ga6rX/kQKFnu4V2Hb4YUUxr1MNfvPM0/6o76v9yyJRCAC5RXRbQ60J3W/muCEQpFlhzSw==
X-Received: by 2002:a63:930d:: with SMTP id b13mr19039427pge.213.1620057483854; 
 Mon, 03 May 2021 08:58:03 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/27] drm/i915/gem: Return void from context_apply_all
Date: Mon,  3 May 2021 10:57:26 -0500
Message-Id: <20210503155748.1961781-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
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
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of the callbacks we use with it return an error code anymore; they
all return 0 unconditionally.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 26 +++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 2207e8ea6f065..d6f342e605254 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -718,32 +718,25 @@ __context_engines_await(const struct i915_gem_context *ctx,
 	return engines;
 }
 
-static int
+static void
 context_apply_all(struct i915_gem_context *ctx,
-		  int (*fn)(struct intel_context *ce, void *data),
+		  void (*fn)(struct intel_context *ce, void *data),
 		  void *data)
 {
 	struct i915_gem_engines_iter it;
 	struct i915_gem_engines *e;
 	struct intel_context *ce;
-	int err = 0;
 
 	e = __context_engines_await(ctx, NULL);
-	for_each_gem_engine(ce, e, it) {
-		err = fn(ce, data);
-		if (err)
-			break;
-	}
+	for_each_gem_engine(ce, e, it)
+		fn(ce, data);
 	i915_sw_fence_complete(&e->fence);
-
-	return err;
 }
 
-static int __apply_ppgtt(struct intel_context *ce, void *vm)
+static void __apply_ppgtt(struct intel_context *ce, void *vm)
 {
 	i915_vm_put(ce->vm);
 	ce->vm = i915_vm_get(vm);
-	return 0;
 }
 
 static struct i915_address_space *
@@ -783,10 +776,9 @@ static void __set_timeline(struct intel_timeline **dst,
 		intel_timeline_put(old);
 }
 
-static int __apply_timeline(struct intel_context *ce, void *timeline)
+static void __apply_timeline(struct intel_context *ce, void *timeline)
 {
 	__set_timeline(&ce->timeline, timeline);
-	return 0;
 }
 
 static void __assign_timeline(struct i915_gem_context *ctx,
@@ -1842,19 +1834,17 @@ set_persistence(struct i915_gem_context *ctx,
 	return __context_set_persistence(ctx, args->value);
 }
 
-static int __apply_priority(struct intel_context *ce, void *arg)
+static void __apply_priority(struct intel_context *ce, void *arg)
 {
 	struct i915_gem_context *ctx = arg;
 
 	if (!intel_engine_has_timeslices(ce->engine))
-		return 0;
+		return;
 
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
 		intel_context_set_use_semaphores(ce);
 	else
 		intel_context_clear_use_semaphores(ce);
-
-	return 0;
 }
 
 static int set_priority(struct i915_gem_context *ctx,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
