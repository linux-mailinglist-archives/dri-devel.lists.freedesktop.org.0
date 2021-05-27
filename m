Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F93933D9
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579196F45C;
	Thu, 27 May 2021 16:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7E16F447
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:21 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id z4so216059plg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ig4tTf4HLDsUWjsCzZJ0pfFPK3kv7lRTTBbZwJxTYT0=;
 b=dTYRKWZyvUt0K5UpqgVCJJ5b3oPd/LKNVpnHkPq+o27u9BsEpZ7uDBS3r1H7VN3GQY
 vtDEjoxM0MPOGe3SAfwcgoOdtVGjLMKr2ap2MeiP3yxkI9nJNpLtvBeZx+d8lQKferSR
 HwiWMr83gAXrhC7m5dIAJKwj1UHVrfXDO4fb9JAfp9a8EGtaFsrsPOBR/lSDCEj50A82
 ZBwe9GvyJJZhb7fc7TY6PL7MnjTQ9hXkYoG/jogRSKJZVmhKVWT2aqd3Dsi6QsBvVbuG
 amUJbWWQsKNxtyGjLV2ModTsYZIdEduMT7JdxAaGji9yl8uiwwZnaNiG8y/xppTyR3Qs
 aMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ig4tTf4HLDsUWjsCzZJ0pfFPK3kv7lRTTBbZwJxTYT0=;
 b=MO0unUESTRCtyytFZZsUeEOYYiGioxSa7nRhUT6G6vKQtuFIfXusHN4KRKKYyQYIDX
 jp1SSWe9fJ/KDxzLua/1kXQtMJnjwJLIx7VCQj0RsMqJ7rcOkQmVTO9Jjr5M6HMpslhG
 Bta+5p5i5t5v0Nbd+YlsrD2ow/Nqeid2XuI4Ad/Syyj6TIDjGC4+nCpGje7EPCKk3IAW
 fKKHSzAF1G44gIb1gycYt/lEOSp4i6lJUZo5BcC0K7h6av3jN8SU1XgzJtD6rSs1Zdg5
 RnGnLpIVAf2RbMcsA9FG3I0uHQTW4F4BPO98xxEU63CCaphaaAEByuZ4hebunveaHDE+
 YKBw==
X-Gm-Message-State: AOAM532lE2QS0gryNFtY8uECLgQnlqN/81B95gGZv8XpHG+BE8QARQRl
 eH9L+yGEjDm0m+GRX5QJOWynQuaDUKbo3A==
X-Google-Smtp-Source: ABdhPJyggqMQsCFRKCs+ia4Rb5Z3f7hzLr7RsbEf+KE5fk/r3u62i5lo+QkDram1PmY068Evr35vDQ==
X-Received: by 2002:a17:90b:8c5:: with SMTP id
 ds5mr4714570pjb.127.1622132840714; 
 Thu, 27 May 2021 09:27:20 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/29] drm/i915/gem: Optionally set SSEU in
 intel_context_set_gem
Date: Thu, 27 May 2021 11:26:39 -0500
Message-Id: <20210527162650.1182544-19-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For now this is a no-op because everyone passes in a null SSEU but it
lets us get some of the error handling and selftest refactoring plumbed
through.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 41 +++++++++++++++----
 .../gpu/drm/i915/gem/selftests/mock_context.c |  6 ++-
 2 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index f8f3f514b4265..d247fb223aac7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -320,9 +320,12 @@ context_get_vm_rcu(struct i915_gem_context *ctx)
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
 
@@ -349,6 +352,12 @@ static void intel_context_set_gem(struct intel_context *ce,
 
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
@@ -416,7 +425,8 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
 	return e;
 }
 
-static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
+static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
+						struct intel_sseu rcs_sseu)
 {
 	const struct intel_gt *gt = &ctx->i915->gt;
 	struct intel_engine_cs *engine;
@@ -429,6 +439,8 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 
 	for_each_engine(engine, gt, id) {
 		struct intel_context *ce;
+		struct intel_sseu sseu = {};
+		int ret;
 
 		if (engine->legacy_idx == INVALID_ENGINE)
 			continue;
@@ -442,10 +454,18 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
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
@@ -759,6 +779,7 @@ __create_context(struct drm_i915_private *i915,
 {
 	struct i915_gem_context *ctx;
 	struct i915_gem_engines *e;
+	struct intel_sseu null_sseu = {};
 	int err;
 	int i;
 
@@ -776,7 +797,7 @@ __create_context(struct drm_i915_private *i915,
 	INIT_LIST_HEAD(&ctx->stale.engines);
 
 	mutex_init(&ctx->engines_mutex);
-	e = default_engines(ctx);
+	e = default_engines(ctx, null_sseu);
 	if (IS_ERR(e)) {
 		err = PTR_ERR(e);
 		goto err_free;
@@ -1543,6 +1564,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 	struct intel_engine_cs *stack[16];
 	struct intel_engine_cs **siblings;
 	struct intel_context *ce;
+	struct intel_sseu null_sseu = {};
 	u16 num_siblings, idx;
 	unsigned int n;
 	int err;
@@ -1615,7 +1637,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 		goto out_siblings;
 	}
 
-	intel_context_set_gem(ce, set->ctx);
+	intel_context_set_gem(ce, set->ctx, null_sseu);
 
 	if (cmpxchg(&set->engines->engines[idx], NULL, ce)) {
 		intel_context_put(ce);
@@ -1723,6 +1745,7 @@ set_engines(struct i915_gem_context *ctx,
 	struct drm_i915_private *i915 = ctx->i915;
 	struct i915_context_param_engines __user *user =
 		u64_to_user_ptr(args->value);
+	struct intel_sseu null_sseu = {};
 	struct set_engines set = { .ctx = ctx };
 	unsigned int num_engines, n;
 	u64 extensions;
@@ -1732,7 +1755,7 @@ set_engines(struct i915_gem_context *ctx,
 		if (!i915_gem_context_user_engines(ctx))
 			return 0;
 
-		set.engines = default_engines(ctx);
+		set.engines = default_engines(ctx, null_sseu);
 		if (IS_ERR(set.engines))
 			return PTR_ERR(set.engines);
 
@@ -1789,7 +1812,7 @@ set_engines(struct i915_gem_context *ctx,
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

