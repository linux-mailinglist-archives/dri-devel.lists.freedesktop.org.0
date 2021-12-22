Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C5F47CDC2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 08:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EF411241F;
	Wed, 22 Dec 2021 07:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D7511241C;
 Wed, 22 Dec 2021 07:59:36 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id m15so1421186pgu.11;
 Tue, 21 Dec 2021 23:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Ep/zKHGWSlzXqkTceOgtZaVXJ4nuNbPBUMHXh8/O+vQ=;
 b=JGP/UeithGjLSStBwiVZ0fRumVJF13RQK7WvN++JsItsaqoQ8mWgq9UK1dQZf6VjCg
 Y6jH8X3RMvc2gy+QXzt1kkOTDIjTeXLwAPHgTDCI9f2eLBNxUVUQABWj046dvLX54w8B
 vyyU+rP0ory9wBtHq+iTsLpsDUh7ndgSIKDlGRp7YY6AIG/Nm4foT+WeerH6sQraXKty
 RWqnYaXzFcfMvlsYzWY3GSz8cmy4j4+oXO/wa/BUVNkj3nJhzDDocuvx7e3zyRwoN9v8
 cth8CGFSqe2LHXjv1ICvXvvMct+yHGrU63JB8nKYszw3wKK2NgqqIa49nYJ2FM3Osbl5
 XjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ep/zKHGWSlzXqkTceOgtZaVXJ4nuNbPBUMHXh8/O+vQ=;
 b=lm1i+ZB8hFRHiBtrs34K/zVc7hwGVMtEaml5Kvpk2sDqjQpcwkJSjf8crBq0mIFS/9
 2JOsFyCgmPyXXDb9YVpYNsmKx/uXCt3IeWFUDRpdX8wROg7FT6gZjVbddio/k+KSQ6M+
 ErfEACc7hLiPpJxI8CmxyLQClYwPlSzI/VQAMH+4jzAivvAA9dUjFDsqi9g1M0SiC1wp
 /nD2DnTHGTTc0I1L8M530x2xQNOMxRvYiaI90Dg2ZUoRPmFnx2uiSo1+tPXqMeDxMmcj
 m4/QI2kZbJ//3H79qbd+O0vvFBD+VikWjbd44YaJLNW9MTSAvvPq+TOUvqkM4eqCt0Vv
 +ztw==
X-Gm-Message-State: AOAM533o0kZnhx66ZIejfk+PwhviH0jKFuP0PXV7LhBCJdcfQKyEAAGw
 Jh2sFH42r6ek4MZpoTYb+AU=
X-Google-Smtp-Source: ABdhPJzpZFfq6pTnM8d0LAXCEwKKK1z/2Q7hS648SfgIyEPqOmaz6VbHogAP/uLgw50nhX2nZF+jMg==
X-Received: by 2002:aa7:8891:0:b0:4ba:ee8a:8cdd with SMTP id
 z17-20020aa78891000000b004baee8a8cddmr2073012pfe.79.1640159976549; 
 Tue, 21 Dec 2021 23:59:36 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id j8sm1265395pgf.21.2021.12.21.23.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 23:59:36 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/i915/selftests: Fix NULL vs IS_ERR checking for
 kernel_context
Date: Wed, 22 Dec 2021 07:58:29 +0000
Message-Id: <20211222075832.1732-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Matthew Brost <matthew.brost@intel.com>, linmq006@gmail.com,
 Andi Shyti <andi.shyti@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since i915_gem_create_context() function return error pointers,
the kernel_context() function does not return null, It returns error
pointers too. Using IS_ERR() to check the return value to fix this.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c | 41 ++++++++++++++------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index b367ecfa42de..eacfe920afed 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -1540,13 +1540,16 @@ static int live_busywait_preempt(void *arg)
 	 */
 
 	ctx_hi = kernel_context(gt->i915, NULL);
-	if (!ctx_hi)
-		return -ENOMEM;
+	if (IS_ERR(ctx_hi))
+		return IS_ERR(ctx_hi);
+
 	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
 
 	ctx_lo = kernel_context(gt->i915, NULL);
-	if (!ctx_lo)
+	if (IS_ERR(ctx_lo)) {
+		err = PTR_ERR(ctx_lo);
 		goto err_ctx_hi;
+	}
 	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
 
 	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
@@ -1742,13 +1745,17 @@ static int live_preempt(void *arg)
 		goto err_spin_hi;
 
 	ctx_hi = kernel_context(gt->i915, NULL);
-	if (!ctx_hi)
+	if (IS_ERR(ctx_hi)) {
+		err = PTR_ERR(ctx_hi);
 		goto err_spin_lo;
+	}
 	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
 
 	ctx_lo = kernel_context(gt->i915, NULL);
-	if (!ctx_lo)
+	if (IS_ERR(ctx_lo)) {
+		err = PTR_ERR(ctx_lo);
 		goto err_ctx_hi;
+	}
 	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
 
 	for_each_engine(engine, gt, id) {
@@ -1834,12 +1841,16 @@ static int live_late_preempt(void *arg)
 		goto err_spin_hi;
 
 	ctx_hi = kernel_context(gt->i915, NULL);
-	if (!ctx_hi)
+	if (IS_ERR(ctx_hi)) {
+		err = PTR_ERR(ctx_hi);
 		goto err_spin_lo;
+	}
 
 	ctx_lo = kernel_context(gt->i915, NULL);
-	if (!ctx_lo)
+	if (IS_ERR(ctx_lo)) {
+		err = PTR_ERR(ctx_lo);
 		goto err_ctx_hi;
+	}
 
 	/* Make sure ctx_lo stays before ctx_hi until we trigger preemption. */
 	ctx_lo->sched.priority = 1;
@@ -1928,8 +1939,8 @@ struct preempt_client {
 static int preempt_client_init(struct intel_gt *gt, struct preempt_client *c)
 {
 	c->ctx = kernel_context(gt->i915, NULL);
-	if (!c->ctx)
-		return -ENOMEM;
+	if (IS_ERR(c->ctx))
+		return PTR_ERR(c->ctx);
 
 	if (igt_spinner_init(&c->spin, gt))
 		goto err_ctx;
@@ -3385,13 +3396,17 @@ static int live_preempt_timeout(void *arg)
 		return -ENOMEM;
 
 	ctx_hi = kernel_context(gt->i915, NULL);
-	if (!ctx_hi)
+	if (IS_ERR(ctx_hi)) {
+		err = PTR_ERR(ctx_hi);
 		goto err_spin_lo;
+	}
 	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
 
 	ctx_lo = kernel_context(gt->i915, NULL);
-	if (!ctx_lo)
+	if (IS_ERR(ctx_lo)) {
+		err = PTR_ERR(ctx_lo);
 		goto err_ctx_hi;
+	}
 	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
 
 	for_each_engine(engine, gt, id) {
@@ -3683,8 +3698,10 @@ static int live_preempt_smoke(void *arg)
 
 	for (n = 0; n < smoke.ncontext; n++) {
 		smoke.contexts[n] = kernel_context(smoke.gt->i915, NULL);
-		if (!smoke.contexts[n])
+		if (IS_ERR(smoke.contexts[n])) {
+			err = PTR_ERR(smoke.contexts[n]);
 			goto err_ctx;
+		}
 	}
 
 	for (n = 0; n < ARRAY_SIZE(phase); n++) {
-- 
2.17.1

