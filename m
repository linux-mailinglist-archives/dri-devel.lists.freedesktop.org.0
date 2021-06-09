Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37F3A0B7E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2456ECC8;
	Wed,  9 Jun 2021 04:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7D96ECC6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:36:51 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso638749pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3q/w735/KBBeq9LJRwGQV1IBNCWRuv+fK/lYqzBjWIY=;
 b=JzCjnrOunis7G4aIiZkAWgPg9fsk/x0r65fyayZpIOFMrEGN+CjU++tFGm60VFSaLy
 s9G6s48A9JAPGV6Lvze/XBb86XUjDQN1H4KGLhfd3bghQH46vmr6UcEuzd5kuEvyHALN
 vNESTmoWTOOg5OSSVGZ164CQZ4R62iNE3kBONANPhNOvWfWlJj7xJAiP9gSUWnzpf7Uv
 8n3nw0KdscdOw1NGoZGqQRXURFBfnzCXyj6o/j65v+96CTc3ZtQdk7XxdsWww3kYGkAK
 6ONJbOizFWinmDEHxMormRJGsbL+e9PlMdissEUqOW4WMwPPoLA4DBJJdeujX7tWF3la
 dcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3q/w735/KBBeq9LJRwGQV1IBNCWRuv+fK/lYqzBjWIY=;
 b=LJz4/qEkyocBgn1/ERoner/q8xcsv3PRA8s0VE/ymnJ4dkcNL+yArnbwBA8Q9BhWZF
 USFgSuEGlUjX6xspyUswdZMxuYgL9FK4daIdwoFB5c4B8+/aaUqbrcrdvGfL7Wc5LfiB
 +krDKupGmMlmaoye2I/eq+N0C6p3kRVQxBxi4ofNclUFb9rFAL6+1x0LvIkASKURpucr
 D6xoFktlkz9xY/W/+GKSS2OhjAuLWbuwq7qrSHUCWvc2NfVIcV3cjwPeCnnaOJ8DQGDU
 HalDi6cEzkaOGn24HqNHZ2D85dbOe78Tz5h1F93jOVHJ9Eeb5UaTG7wEG0qK/wZa029q
 Glvw==
X-Gm-Message-State: AOAM532QlKCkNkFbasT8i9MBFS4xSwMAocOSzS28NpLV4RHrEkOPT1W1
 22fzXhGP/hQIgs5Mx1Ld6FJcI6rtkfnLoA==
X-Google-Smtp-Source: ABdhPJxwQFA8UCQamRQu/On4fCUmbWUkdfRteuZwBOoQ2Ft12d08sxXImqQjKLNw4FwVa6ieFz8Chw==
X-Received: by 2002:a17:90a:6a8d:: with SMTP id
 u13mr26645164pjj.55.1623213410964; 
 Tue, 08 Jun 2021 21:36:50 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:50 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/31] drm/i915/gem: Optionally set SSEU in
 intel_context_set_gem
Date: Tue,  8 Jun 2021 23:36:00 -0500
Message-Id: <20210609043613.102962-19-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609043613.102962-1-jason@jlekstrand.net>
References: <20210609043613.102962-1-jason@jlekstrand.net>
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

For now this is a no-op because everyone passes in a null SSEU but it
lets us get some of the error handling and selftest refactoring plumbed
through.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 41 +++++++++++++++----
 .../gpu/drm/i915/gem/selftests/mock_context.c |  6 ++-
 2 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 4b1a874225c0c..972d1d3f9a17e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -306,9 +306,12 @@ context_get_vm_rcu(struct i915_gem_context *ctx)
 	} while (1);
 }
 
-static void intel_context_set_gem(struct intel_context *ce,
-				  struct i915_gem_context *ctx)
+static int intel_context_set_gem(struct intel_context *ce,
+				 struct i915_gem_context *ctx,
+				 struct intel_sseu sseu)
 {
+	int ret = 0;
+
 	GEM_BUG_ON(rcu_access_pointer(ce->gem_context));
 	RCU_INIT_POINTER(ce->gem_context, ctx);
 
@@ -335,6 +338,12 @@ static void intel_context_set_gem(struct intel_context *ce,
 
 		intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
 	}
+
+	/* A valid SSEU has no zero fields */
+	if (sseu.slice_mask && !WARN_ON(ce->engine->class != RENDER_CLASS))
+		ret = intel_context_reconfigure_sseu(ce, sseu);
+
+	return ret;
 }
 
 static void __free_engines(struct i915_gem_engines *e, unsigned int count)
@@ -402,7 +411,8 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
 	return e;
 }
 
-static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
+static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
+						struct intel_sseu rcs_sseu)
 {
 	const struct intel_gt *gt = &ctx->i915->gt;
 	struct intel_engine_cs *engine;
@@ -415,6 +425,8 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 
 	for_each_engine(engine, gt, id) {
 		struct intel_context *ce;
+		struct intel_sseu sseu = {};
+		int ret;
 
 		if (engine->legacy_idx == INVALID_ENGINE)
 			continue;
@@ -428,10 +440,18 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 			goto free_engines;
 		}
 
-		intel_context_set_gem(ce, ctx);
-
 		e->engines[engine->legacy_idx] = ce;
 		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
+
+		if (engine->class == RENDER_CLASS)
+			sseu = rcs_sseu;
+
+		ret = intel_context_set_gem(ce, ctx, sseu);
+		if (ret) {
+			err = ERR_PTR(ret);
+			goto free_engines;
+		}
+
 	}
 
 	return e;
@@ -745,6 +765,7 @@ __create_context(struct drm_i915_private *i915,
 {
 	struct i915_gem_context *ctx;
 	struct i915_gem_engines *e;
+	struct intel_sseu null_sseu = {};
 	int err;
 	int i;
 
@@ -762,7 +783,7 @@ __create_context(struct drm_i915_private *i915,
 	INIT_LIST_HEAD(&ctx->stale.engines);
 
 	mutex_init(&ctx->engines_mutex);
-	e = default_engines(ctx);
+	e = default_engines(ctx, null_sseu);
 	if (IS_ERR(e)) {
 		err = PTR_ERR(e);
 		goto err_free;
@@ -1548,6 +1569,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 	struct intel_engine_cs *stack[16];
 	struct intel_engine_cs **siblings;
 	struct intel_context *ce;
+	struct intel_sseu null_sseu = {};
 	u16 num_siblings, idx;
 	unsigned int n;
 	int err;
@@ -1620,7 +1642,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 		goto out_siblings;
 	}
 
-	intel_context_set_gem(ce, set->ctx);
+	intel_context_set_gem(ce, set->ctx, null_sseu);
 
 	if (cmpxchg(&set->engines->engines[idx], NULL, ce)) {
 		intel_context_put(ce);
@@ -1728,6 +1750,7 @@ set_engines(struct i915_gem_context *ctx,
 	struct drm_i915_private *i915 = ctx->i915;
 	struct i915_context_param_engines __user *user =
 		u64_to_user_ptr(args->value);
+	struct intel_sseu null_sseu = {};
 	struct set_engines set = { .ctx = ctx };
 	unsigned int num_engines, n;
 	u64 extensions;
@@ -1737,7 +1760,7 @@ set_engines(struct i915_gem_context *ctx,
 		if (!i915_gem_context_user_engines(ctx))
 			return 0;
 
-		set.engines = default_engines(ctx);
+		set.engines = default_engines(ctx, null_sseu);
 		if (IS_ERR(set.engines))
 			return PTR_ERR(set.engines);
 
@@ -1794,7 +1817,7 @@ set_engines(struct i915_gem_context *ctx,
 			return PTR_ERR(ce);
 		}
 
-		intel_context_set_gem(ce, ctx);
+		intel_context_set_gem(ce, ctx, null_sseu);
 
 		set.engines->engines[n] = ce;
 	}
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index e0f512ef7f3c6..cbeefd060e97b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -14,6 +14,7 @@ mock_context(struct drm_i915_private *i915,
 {
 	struct i915_gem_context *ctx;
 	struct i915_gem_engines *e;
+	struct intel_sseu null_sseu = {};
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -31,7 +32,7 @@ mock_context(struct drm_i915_private *i915,
 	i915_gem_context_set_persistence(ctx);
 
 	mutex_init(&ctx->engines_mutex);
-	e = default_engines(ctx);
+	e = default_engines(ctx, null_sseu);
 	if (IS_ERR(e))
 		goto err_free;
 	RCU_INIT_POINTER(ctx->engines, e);
@@ -112,6 +113,7 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
 {
 	struct i915_gem_engines *engines;
 	struct i915_gem_context *ctx;
+	struct intel_sseu null_sseu = {};
 	struct intel_context *ce;
 
 	engines = alloc_engines(1);
@@ -130,7 +132,7 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
 		return ERR_CAST(ce);
 	}
 
-	intel_context_set_gem(ce, ctx);
+	intel_context_set_gem(ce, ctx, null_sseu);
 	engines->engines[0] = ce;
 	engines->num_engines = 1;
 
-- 
2.31.1

