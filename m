Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E080B3C1656
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5F16E8F3;
	Thu,  8 Jul 2021 15:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AA76E8EA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:44 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so6323554otl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G+hLgeiGvYpyFrjLGrbFT9e+VhCR6ZRDXGOupSKTV44=;
 b=L562t3xkgj+3iqb55ctcImgjQeMloUXkYD9lTJkNGGVVJhNkjf+1R4GXGXBSwDO4Wu
 geMia2qtwlgy5rpoWrpB7YYti/y35Oy2GgCFpZGJYSWgBgPUQfDkgndP3R/HTl0y0802
 4DFpn4ZM3A1favrXmHu/ti45b+f3/lfPzcdixg75f2xbgO+6nsCkjhTpMksASU2wZlbA
 QuJhtIHrX2/OQ+NFBzC10PxkSZuM87s0U4P6bzIbBxLf886r9X/7Ec9J1shxWh6JKirg
 gwYXwGaI6tlxXnDI/I6T+uE7m84RuJ+7BQNARtgKFYkeScTXHM2UZwE+ebDfAyiBptrp
 uqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G+hLgeiGvYpyFrjLGrbFT9e+VhCR6ZRDXGOupSKTV44=;
 b=nmXoPHgmsXuPOXyD0JEDB1oc5/cU/yv3JI3z15UyJoh4Yvm8OaCw3H+qKoredR30Eo
 srKmpXvQ+0/NusHzYqCUqOtwWWksgz5ufp3Sw4hSJut1UbIL5fVowumMR53ywLaR5MOi
 DvZaI6OJj4bDyE+2WZaj6ETvq8x0OOIMu+JygYyAZAYZEAeLcTRW/detdhL4zTvXyj0z
 zi5DhleZf2EPP+KHUtXkEZjOBZkO4LqD0OgVkh8H9eGU23/lMjiYixSmA8lMFWQV5UTP
 8JtKTld4btCVP7zef6vp9C1Jg7CFdbssiMY0DTUMYDCiso386tcnNKdiLB2kqKnKn8WH
 cdgw==
X-Gm-Message-State: AOAM531RNu/fJkjjQyKPDzjrzF1z6vsltLAzV75IzNcZoxuJCqFlUtPb
 EEcpu1EsAEeRC7wm+yhnDyNzig==
X-Google-Smtp-Source: ABdhPJxwgz4UthtKrh4s8Lp2dE5QGL/2J1ZM+iYF+vqsL2Oe8dZHTlG7M2Xz8sl8EhnM9zonx599MQ==
X-Received: by 2002:a9d:410:: with SMTP id 16mr4559327otc.130.1625759324071;
 Thu, 08 Jul 2021 08:48:44 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/30] drm/i915/gem: Return void from context_apply_all
Date: Thu,  8 Jul 2021 10:48:10 -0500
Message-Id: <20210708154835.528166-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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

None of the callbacks we use with it return an error code anymore; they
all return 0 unconditionally.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 26 +++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 9750a1ac7023e..3503d46c88cbf 100644
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
@@ -1841,19 +1833,17 @@ set_persistence(struct i915_gem_context *ctx,
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

