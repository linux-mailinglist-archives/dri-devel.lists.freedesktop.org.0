Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4E3718C5
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B840E6E90C;
	Mon,  3 May 2021 15:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7546E90C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:37 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id h11so4527726pfn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fj5RFunNxNQIKypx0E6ar++482I0lF//EduTNOz9Fh8=;
 b=DjE7qsju1ZgZnTM2a9fHfN76m8g2ZGqRUqrzZQa1LUjOOZJw/DfpV/XVe/PxCfUxtX
 mIBRiwKXw1dxC8khluwKxMEnh6a/pgWNBsRv+Arp6m2ieA1thBRiV7PSDmw13ttGh2Av
 2OUaCpnHE079/H1keTdspWC9uA7C1nNt6G/HqaJ0l4Eo73Zx3wld3EdbFL90BTMG/PiK
 cwcqBnAo2VaxgePWWsRhvrHSIrYb0SWG3qFB4MQkFL847789zqmRp4SyHPn+Ygm2bEJJ
 m2Etzax5cGBVzlUWn/gmx9pdY5w7UH6wh/oZgMopyYGsnhvqUk1Qj65eVdPoAgD4vJ0C
 UDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fj5RFunNxNQIKypx0E6ar++482I0lF//EduTNOz9Fh8=;
 b=e7W1qeL9eoQCV6266XonRwLN3Hyw47jIdl30VtunS3jJgsvcMm2BceMKWJdOMzh8kO
 4H69GNDpbo1bu/WZmbKCsKxbkCG1/skHsifmLke3js5M9lL+7cNUcWWq7uzrujEywqfR
 nCaKz1aU66/EhiOS8WF2l0gx+dQ60e271ux/Iuv90H731lYJoyaBXjnvKQv0dAcgcbvC
 NEN9RQg+OdD/SlI5Ij9jP39uangK0JeXqJIhsdJ9HbvrcnMUYgp+fZO6l6D/HuwofhPz
 99w+JKs4812JcQqM5Vjmcy0CcJL537LaNz6aVlpS9I/Hfws5pV0EGWIZj0SBmYR8pwUl
 yM1A==
X-Gm-Message-State: AOAM531snNyWRdS2vD1Ig+5l121hhkFWD4KeTZnu4UQtIZSHnH61ktmc
 ToBvOnw7uRZfE8M9b/a+Uk54Hw==
X-Google-Smtp-Source: ABdhPJyXixPSpymBxhZeO/u19ZsTgcfFfNBlrBCC6I/JI5epQ1ccCBRHmkOAIuPVRCXsE66NP8hiSQ==
X-Received: by 2002:a63:982:: with SMTP id 124mr16907483pgj.37.1620057516866; 
 Mon, 03 May 2021 08:58:36 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:36 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/27] drm/i915/selftests: Take a VM in kernel_context()
Date: Mon,  3 May 2021 10:57:46 -0500
Message-Id: <20210503155748.1961781-26-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This better models where we want to go with contexts in general where
things like the VM and engine set are create parameters instead of being
set after the fact.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 .../drm/i915/gem/selftests/i915_gem_context.c |  4 ++--
 .../gpu/drm/i915/gem/selftests/mock_context.c |  9 ++++++++-
 .../gpu/drm/i915/gem/selftests/mock_context.h |  4 +++-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 20 +++++++++----------
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 16ff64ab34a1b..76029d7143f6c 100644
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
index a0e75b71a3374..0989e024f7a03 100644
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
index 746985971c3a6..3676eaf6b2aee 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
