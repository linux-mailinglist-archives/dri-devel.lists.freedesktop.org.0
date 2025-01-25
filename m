Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79EA1BFE5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 01:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7920D10E195;
	Sat, 25 Jan 2025 00:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="FQ0hcKlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD0710E195;
 Sat, 25 Jan 2025 00:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=xyC8pksiBY87R70xSLbpJKqnDohfY8GEUqF2b7KXAVs=; b=FQ0hcKlJZI7QNVjo
 r8mls4ulUVyeG0PbNXDGLtNaEJZHXcdi/Uy90zLnI//dUxbJ6sTaOFK0DBY90V8f/kT0hDVBg+3IX
 xTGoR0Q6+4XInQLWg2b28vowDURq9RpipExm38i1hEsOOdpyfED2iQ+xkNgRE/0PDcAUOq1iACKzT
 gaBetvuiXhxBW3kuLL5w/aGnrFLkvwD7R6O5WsMa+Vrk5HmAkRt86drApSpnH2B9+MrURhqAStAU4
 R1kgWeF32coZEcwo62LxsjC68vSaw/nWsNJ7PqFP+DC63cfbAM1zKQEPCArfZi0K+a29mHCfzYLFa
 OVSyns52B3+N+3P4YA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tbUCE-00Bwz6-2i;
 Sat, 25 Jan 2025 00:38:46 +0000
From: linux@treblig.org
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net
Cc: airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/i915: Remove unused live_context_for_engine
Date: Sat, 25 Jan 2025 00:38:46 +0000
Message-ID: <20250125003846.228514-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of live_context_for_engine() was removed in 2021 by
commit 99919be74aa3 ("drm/i915/gem: Zap the i915_gem_object_blt code")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../gpu/drm/i915/gem/selftests/mock_context.c | 38 -------------------
 .../gpu/drm/i915/gem/selftests/mock_context.h |  3 --
 2 files changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index 2b0327cc47c2..fd8babb513e5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -107,44 +107,6 @@ live_context(struct drm_i915_private *i915, struct file *file)
 	return ERR_PTR(err);
 }
 
-struct i915_gem_context *
-live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
-{
-	struct i915_gem_engines *engines;
-	struct i915_gem_context *ctx;
-	struct intel_sseu null_sseu = {};
-	struct intel_context *ce;
-
-	engines = alloc_engines(1);
-	if (!engines)
-		return ERR_PTR(-ENOMEM);
-
-	ctx = live_context(engine->i915, file);
-	if (IS_ERR(ctx)) {
-		__free_engines(engines, 0);
-		return ctx;
-	}
-
-	ce = intel_context_create(engine);
-	if (IS_ERR(ce)) {
-		__free_engines(engines, 0);
-		return ERR_CAST(ce);
-	}
-
-	intel_context_set_gem(ce, ctx, null_sseu);
-	engines->engines[0] = ce;
-	engines->num_engines = 1;
-
-	mutex_lock(&ctx->engines_mutex);
-	i915_gem_context_set_user_engines(ctx);
-	engines = rcu_replace_pointer(ctx->engines, engines, 1);
-	mutex_unlock(&ctx->engines_mutex);
-
-	engines_idle_release(ctx, engines);
-
-	return ctx;
-}
-
 struct i915_gem_context *
 kernel_context(struct drm_i915_private *i915,
 	       struct i915_address_space *vm)
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.h b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
index 7a02fd9b5866..bc8fb37d2d24 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.h
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
@@ -23,9 +23,6 @@ void mock_context_close(struct i915_gem_context *ctx);
 struct i915_gem_context *
 live_context(struct drm_i915_private *i915, struct file *file);
 
-struct i915_gem_context *
-live_context_for_engine(struct intel_engine_cs *engine, struct file *file);
-
 struct i915_gem_context *kernel_context(struct drm_i915_private *i915,
 					struct i915_address_space *vm);
 void kernel_context_close(struct i915_gem_context *ctx);
-- 
2.48.1

