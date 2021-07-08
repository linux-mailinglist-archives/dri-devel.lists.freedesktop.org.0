Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CE3C1670
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D516E911;
	Thu,  8 Jul 2021 15:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A216E90A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:49:00 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j65so2161543oih.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hmuVQbZLHbBoqgPN1Xu/cmTMaqj1TPXlGDUDD9M59CU=;
 b=CsoYXj1p+zuEXPdHGQx8aZbwmLLYX/UhZeTzYWYPETLFn78cvt03/ZEWNFaDWTkxWq
 e3CFy+98EwZjubypRYydr9U6zvL8eKiurynmmXNdpFIwS0caU//wk3cGYeuxKv0XZyUd
 4s05WXJFx2fzT8kOAJjsFDWCsKgoe2qDKGuNjrCBUc24ALOiw3eENoE552wbihVzy8OP
 VIVHuTqgQN4AuPpQqB4//XTSWvFOgAnvy88AlLCeLNRE21LNkae6/VNnQ9uxqTWU4T+2
 mbI8+LLYdfGf16bKn/lJwRUBGixclgTbdPfyxFjK/bSNRobG8UnjAgr1WOHbZMLZt1wj
 bEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hmuVQbZLHbBoqgPN1Xu/cmTMaqj1TPXlGDUDD9M59CU=;
 b=D1FYSbr8/n3zNLdGhAGtLiw4jblaO00z/bekRmLYwIzXtMfdkLj+R4RPmY8yDCfBA/
 2VyxLa7KC7IOufHGTOZwrG3Aqs6ZAwZdwVY0EoRFcrQje2zMsaca4pNFqCpj8zb2yCTf
 ZYaeb7jWUiqX61kyiHHRGCuLZ5esuM1fFrLBlhyxKdVI7k5oPcq8FjfjJbfpPQK3BXB4
 FQggG4tnz0TDHll+MkS7O6dlsK0xM4w6uPKDUHT3QLzL1dcMDNgYwYAtcJf16YOuv4Yp
 w3BRhjg2/3qbsRuVjpwRqzuLeRIczFIFVYanlbsf012hrMaCkj0hGNuDxzJmvPK2homH
 V7KQ==
X-Gm-Message-State: AOAM5310qA2QpYBE5QUzjiLP8k/0+jqes65UrFXZMyNog4uG1Fts2ZFA
 YeMGqtIrB/MW5AuK+4oTEU11YOIvknF9Sw==
X-Google-Smtp-Source: ABdhPJw6M+nT+9XYd35nLdBYKujReHeBtgmd9jTy6LgXdXN1uVaDKh3qkie1u2KLjgkOycb2OGtCqw==
X-Received: by 2002:aca:4791:: with SMTP id u139mr4024021oia.89.1625759340250; 
 Thu, 08 Jul 2021 08:49:00 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/30] drm/i915/gem: Optionally set SSEU in
 intel_context_set_gem
Date: Thu,  8 Jul 2021 10:48:23 -0500
Message-Id: <20210708154835.528166-19-jason@jlekstrand.net>
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
index 5b75f98274b9e..206721dccd24e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -266,9 +266,12 @@ context_get_vm_rcu(struct i915_gem_context *ctx)
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
 
@@ -295,6 +298,12 @@ static void intel_context_set_gem(struct intel_context *ce,
 
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
@@ -362,7 +371,8 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
 	return e;
 }
 
-static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
+static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
+						struct intel_sseu rcs_sseu)
 {
 	const struct intel_gt *gt = &ctx->i915->gt;
 	struct intel_engine_cs *engine;
@@ -375,6 +385,8 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 
 	for_each_engine(engine, gt, id) {
 		struct intel_context *ce;
+		struct intel_sseu sseu = {};
+		int ret;
 
 		if (engine->legacy_idx == INVALID_ENGINE)
 			continue;
@@ -388,10 +400,18 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
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
@@ -705,6 +725,7 @@ __create_context(struct drm_i915_private *i915,
 {
 	struct i915_gem_context *ctx;
 	struct i915_gem_engines *e;
+	struct intel_sseu null_sseu = {};
 	int err;
 	int i;
 
@@ -722,7 +743,7 @@ __create_context(struct drm_i915_private *i915,
 	INIT_LIST_HEAD(&ctx->stale.engines);
 
 	mutex_init(&ctx->engines_mutex);
-	e = default_engines(ctx);
+	e = default_engines(ctx, null_sseu);
 	if (IS_ERR(e)) {
 		err = PTR_ERR(e);
 		goto err_free;
@@ -1508,6 +1529,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 	struct intel_engine_cs *stack[16];
 	struct intel_engine_cs **siblings;
 	struct intel_context *ce;
+	struct intel_sseu null_sseu = {};
 	u16 num_siblings, idx;
 	unsigned int n;
 	int err;
@@ -1580,7 +1602,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 		goto out_siblings;
 	}
 
-	intel_context_set_gem(ce, set->ctx);
+	intel_context_set_gem(ce, set->ctx, null_sseu);
 
 	if (cmpxchg(&set->engines->engines[idx], NULL, ce)) {
 		intel_context_put(ce);
@@ -1688,6 +1710,7 @@ set_engines(struct i915_gem_context *ctx,
 	struct drm_i915_private *i915 = ctx->i915;
 	struct i915_context_param_engines __user *user =
 		u64_to_user_ptr(args->value);
+	struct intel_sseu null_sseu = {};
 	struct set_engines set = { .ctx = ctx };
 	unsigned int num_engines, n;
 	u64 extensions;
@@ -1697,7 +1720,7 @@ set_engines(struct i915_gem_context *ctx,
 		if (!i915_gem_context_user_engines(ctx))
 			return 0;
 
-		set.engines = default_engines(ctx);
+		set.engines = default_engines(ctx, null_sseu);
 		if (IS_ERR(set.engines))
 			return PTR_ERR(set.engines);
 
@@ -1754,7 +1777,7 @@ set_engines(struct i915_gem_context *ctx,
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

