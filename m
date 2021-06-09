Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778463A0B98
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0B06ECE2;
	Wed,  9 Jun 2021 04:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1426ECD8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:37:07 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id p13so7887346pfw.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4P6B5yDCiRBuExW//HvseyUjwGeOe6wMXywTOUFvJNI=;
 b=g2LeXqLwJxsBqoPOrdmD0Jk/jnF2oviY3wsIo5z6RdJRA3t41UBJOpCJZFDSEi32qg
 8LUX9Axpb0dgOr+aJcOxDVyrxkR6vQYnfgQKOiov9opz9dIUc+TTOAu/uliTpImM/CsR
 vjZ+1OBEWvaKbl6si5jLrQ/6y18DSL4mpW3R1mRr+0kBbEeoYhY+aCI4ASW+FnOP5Ez5
 2b/FkAwpD1pRq6fUwM+dYyeQ9YcrF30dgPz2G7ISksJksSYT7ugxR4lljM6wcuJAETpu
 AMGcVyIxLjMgExHMa4iBQQ6fVV6LtT3l0TlvSWLH1Vcd6/Qemgm76+/y1mipYUiSSdHB
 f6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4P6B5yDCiRBuExW//HvseyUjwGeOe6wMXywTOUFvJNI=;
 b=gYJH80HZ2V+46NHvrvfBDjrRfwQxc4eA18reJi+0y8EjcANVbLxyju8FmPbWS45VVu
 BoRILSOesRz9f6K87wvFKtueo2vVbHMgtR/TVPX9MEy+KhAmk6Vh0FH0rMkOoS+x8hEi
 JtKQgBBWLA16di/pWxaY5HeOrz36l6p7RjCgkCoE0CafR4PFEnv5FlNtgSIIxwvtFYs1
 TGwN9+e1Ss4jx7C1FVkbHTJz7/t5N5XZKS6rDJe3HQ3hOes1fArqxSHRp6IQTkfrE1UZ
 vivy0uBV7AK9HcjfERNc0xuBNqASe3D1UldH422JO6ist+a3AXsjLna25T9KZeMRcWku
 Tgag==
X-Gm-Message-State: AOAM5334TzZAvW8yYlqk9adtUIT/NaS6uR6rOgxnaznTTmztuYCfOrqL
 SLrrvmUM6RT2feyioP4ZnXvEf9cvFjlDAg==
X-Google-Smtp-Source: ABdhPJw4MOAt+4xQsiWd1mCkYEHsqKImi+UCWiKOWRcVglWUTz4hVboGm2bkgi0f3HDooQ4/bHzeRA==
X-Received: by 2002:a63:36c1:: with SMTP id d184mr1842835pga.47.1623213426922; 
 Tue, 08 Jun 2021 21:37:06 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:37:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 27/31] drm/i915/selftests: Take a VM in kernel_context()
Date: Tue,  8 Jun 2021 23:36:09 -0500
Message-Id: <20210609043613.102962-28-jason@jlekstrand.net>
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

This better models where we want to go with contexts in general where
things like the VM and engine set are create parameters instead of being
set after the fact.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 .../drm/i915/gem/selftests/i915_gem_context.c |  4 ++--
 .../gpu/drm/i915/gem/selftests/mock_context.c |  9 ++++++++-
 .../gpu/drm/i915/gem/selftests/mock_context.h |  4 +++-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 20 +++++++++----------
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 92544a174cc9a..3e59746afdc82 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -680,7 +680,7 @@ static int igt_ctx_exec(void *arg)
 			struct i915_gem_context *ctx;
 			struct intel_context *ce;
 
-			ctx = kernel_context(i915);
+			ctx = kernel_context(i915, NULL);
 			if (IS_ERR(ctx)) {
 				err = PTR_ERR(ctx);
 				goto out_file;
@@ -813,7 +813,7 @@ static int igt_shared_ctx_exec(void *arg)
 			struct i915_gem_context *ctx;
 			struct intel_context *ce;
 
-			ctx = kernel_context(i915);
+			ctx = kernel_context(i915, NULL);
 			if (IS_ERR(ctx)) {
 				err = PTR_ERR(ctx);
 				goto out_test;
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index 61aaac4a334cf..500ef27ba4771 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -150,7 +150,8 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
 }
 
 struct i915_gem_context *
-kernel_context(struct drm_i915_private *i915)
+kernel_context(struct drm_i915_private *i915,
+	       struct i915_address_space *vm)
 {
 	struct i915_gem_context *ctx;
 	struct i915_gem_proto_context *pc;
@@ -159,6 +160,12 @@ kernel_context(struct drm_i915_private *i915)
 	if (IS_ERR(pc))
 		return ERR_CAST(pc);
 
+	if (vm) {
+		if (pc->vm)
+			i915_vm_put(pc->vm);
+		pc->vm = i915_vm_get(vm);
+	}
+
 	ctx = i915_gem_create_context(i915, pc);
 	proto_context_close(pc);
 	if (IS_ERR(ctx))
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.h b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
index 2a6121d33352d..7a02fd9b5866a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.h
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
@@ -10,6 +10,7 @@
 struct file;
 struct drm_i915_private;
 struct intel_engine_cs;
+struct i915_address_space;
 
 void mock_init_contexts(struct drm_i915_private *i915);
 
@@ -25,7 +26,8 @@ live_context(struct drm_i915_private *i915, struct file *file);
 struct i915_gem_context *
 live_context_for_engine(struct intel_engine_cs *engine, struct file *file);
 
-struct i915_gem_context *kernel_context(struct drm_i915_private *i915);
+struct i915_gem_context *kernel_context(struct drm_i915_private *i915,
+					struct i915_address_space *vm);
 void kernel_context_close(struct i915_gem_context *ctx);
 
 #endif /* !__MOCK_CONTEXT_H */
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 780939005554f..5eedb9b2e08f3 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -1522,12 +1522,12 @@ static int live_busywait_preempt(void *arg)
 	 * preempt the busywaits used to synchronise between rings.
 	 */
 
-	ctx_hi = kernel_context(gt->i915);
+	ctx_hi = kernel_context(gt->i915, NULL);
 	if (!ctx_hi)
 		return -ENOMEM;
 	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
 
-	ctx_lo = kernel_context(gt->i915);
+	ctx_lo = kernel_context(gt->i915, NULL);
 	if (!ctx_lo)
 		goto err_ctx_hi;
 	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
@@ -1724,12 +1724,12 @@ static int live_preempt(void *arg)
 	if (igt_spinner_init(&spin_lo, gt))
 		goto err_spin_hi;
 
-	ctx_hi = kernel_context(gt->i915);
+	ctx_hi = kernel_context(gt->i915, NULL);
 	if (!ctx_hi)
 		goto err_spin_lo;
 	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
 
-	ctx_lo = kernel_context(gt->i915);
+	ctx_lo = kernel_context(gt->i915, NULL);
 	if (!ctx_lo)
 		goto err_ctx_hi;
 	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
@@ -1816,11 +1816,11 @@ static int live_late_preempt(void *arg)
 	if (igt_spinner_init(&spin_lo, gt))
 		goto err_spin_hi;
 
-	ctx_hi = kernel_context(gt->i915);
+	ctx_hi = kernel_context(gt->i915, NULL);
 	if (!ctx_hi)
 		goto err_spin_lo;
 
-	ctx_lo = kernel_context(gt->i915);
+	ctx_lo = kernel_context(gt->i915, NULL);
 	if (!ctx_lo)
 		goto err_ctx_hi;
 
@@ -1910,7 +1910,7 @@ struct preempt_client {
 
 static int preempt_client_init(struct intel_gt *gt, struct preempt_client *c)
 {
-	c->ctx = kernel_context(gt->i915);
+	c->ctx = kernel_context(gt->i915, NULL);
 	if (!c->ctx)
 		return -ENOMEM;
 
@@ -3367,12 +3367,12 @@ static int live_preempt_timeout(void *arg)
 	if (igt_spinner_init(&spin_lo, gt))
 		return -ENOMEM;
 
-	ctx_hi = kernel_context(gt->i915);
+	ctx_hi = kernel_context(gt->i915, NULL);
 	if (!ctx_hi)
 		goto err_spin_lo;
 	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
 
-	ctx_lo = kernel_context(gt->i915);
+	ctx_lo = kernel_context(gt->i915, NULL);
 	if (!ctx_lo)
 		goto err_ctx_hi;
 	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
@@ -3659,7 +3659,7 @@ static int live_preempt_smoke(void *arg)
 	}
 
 	for (n = 0; n < smoke.ncontext; n++) {
-		smoke.contexts[n] = kernel_context(smoke.gt->i915);
+		smoke.contexts[n] = kernel_context(smoke.gt->i915, NULL);
 		if (!smoke.contexts[n])
 			goto err_ctx;
 	}
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 853246fad05f6..7ec2cf22fe56c 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -42,7 +42,7 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
 	memset(h, 0, sizeof(*h));
 	h->gt = gt;
 
-	h->ctx = kernel_context(gt->i915);
+	h->ctx = kernel_context(gt->i915, NULL);
 	if (IS_ERR(h->ctx))
 		return PTR_ERR(h->ctx);
 
-- 
2.31.1

