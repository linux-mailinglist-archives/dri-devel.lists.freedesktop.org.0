Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA0D369CC2
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3756ECCC;
	Fri, 23 Apr 2021 22:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D716ECDF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:32:10 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id h20so25917544plr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6A9ocv+sC9inHN4gtn6yqpPfYNjeGnJ8bGzZ8tQrNFM=;
 b=J6tumLI1Ui3PG0vkNq1ooOx66GoCALy8CC8Ybd0WAK1kbfWas9imJo8BkSFpsCd6te
 M3HYOajTcL8j38lL6WAflLfcw3kisCz2NcVd+CUKg/R9H6dM9/mYP0ef7iYHRYakbEsG
 QcDfrcRbHs1sw1ytnO0ima3ufUHS+dRwszKUGFdFmNFyasXlKK2Moy36iQ5a/ksPftxI
 3DgflRcKtCK/wwEcGKflQMeBef4pBnUsuKD1MLac1I8ZiZuQsgbFgosgmm0hNS4g6lwl
 4z4yBK+YZxv9AMFqDgXNdII/hQEkn/RrGuQLhW+SCPhf1PYBUPkqUT2SX1wirfuMbSuv
 DKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6A9ocv+sC9inHN4gtn6yqpPfYNjeGnJ8bGzZ8tQrNFM=;
 b=nvqEgpVHPN+LPZKciZCos+E7UA6lTq1qufv+Ot1DSNL8qsYXbwXj2KXvJn9BW4/N+3
 hzqvNB4gRZGaFdZwZjFmTxkrpX/xDZJgNWTZKTSKml+Ux4KzexC9Ubwnj3OXE/hozcPF
 6ekYTwH/9RS9ogigBYLhGtxcasKajjK5FJHVTUX9/GYg8sxzDYmAbjXi3srs8Le/Dnj2
 8/IXRxgwCgvHVAYvuoWhSwWlbuvkiq63MRgcep6AT4f8btiIF0MhVgn6swYIikhklW59
 18TFxhBalUalWLbZ4+WJr37uA30SvfrnDozqfg/1cClvjbMUodSvdZWLIt/UlWIJyttW
 i39Q==
X-Gm-Message-State: AOAM532aEknem+ay/n0AGrWMahs1/Dw22IuYz/5nzuYpwjSkwNMLMSus
 3aRgi5E3W0xqFbdkeB1KLwlyNg==
X-Google-Smtp-Source: ABdhPJw/KHUZ4DWthF8GZ2Z33gcrZmKB5SDd9Mb0whNum5HMAHLynDC8Q9Se1sP0u5m0Lls5p3tOZw==
X-Received: by 2002:a17:90b:812:: with SMTP id
 bk18mr6991984pjb.145.1619217129648; 
 Fri, 23 Apr 2021 15:32:09 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:32:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 21/21] drm/i915/gem: Roll all of context creation together
Date: Fri, 23 Apr 2021 17:31:31 -0500
Message-Id: <20210423223131.879208-22-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423223131.879208-1-jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
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

Now that we have the whole engine set and VM at context creation time,
we can just assign those fields instead of creating first and handling
the VM and engines later.  This lets us avoid creating useless VMs and
engine sets and lets us git rid of the complex VM setting code.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 159 ++++++------------
 .../gpu/drm/i915/gem/selftests/mock_context.c |  33 ++--
 2 files changed, 64 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ef23ab4260c24..829730d402e8a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1201,56 +1201,6 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
 	return 0;
 }
 
-static struct i915_gem_context *
-__create_context(struct drm_i915_private *i915,
-		 const struct i915_gem_proto_context *pc)
-{
-	struct i915_gem_context *ctx;
-	struct i915_gem_engines *e;
-	int err;
-	int i;
-
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return ERR_PTR(-ENOMEM);
-
-	kref_init(&ctx->ref);
-	ctx->i915 = i915;
-	ctx->sched = pc->sched;
-	mutex_init(&ctx->mutex);
-	INIT_LIST_HEAD(&ctx->link);
-
-	spin_lock_init(&ctx->stale.lock);
-	INIT_LIST_HEAD(&ctx->stale.engines);
-
-	mutex_init(&ctx->engines_mutex);
-	e = default_engines(ctx);
-	if (IS_ERR(e)) {
-		err = PTR_ERR(e);
-		goto err_free;
-	}
-	RCU_INIT_POINTER(ctx->engines, e);
-
-	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
-	mutex_init(&ctx->lut_mutex);
-
-	/* NB: Mark all slices as needing a remap so that when the context first
-	 * loads it will restore whatever remap state already exists. If there
-	 * is no remap info, it will be a NOP. */
-	ctx->remap_slice = ALL_L3_SLICES(i915);
-
-	ctx->user_flags = pc->user_flags;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
-		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
-
-	return ctx;
-
-err_free:
-	kfree(ctx);
-	return ERR_PTR(err);
-}
-
 static inline struct i915_gem_engines *
 __context_engines_await(const struct i915_gem_context *ctx,
 			bool *user_engines)
@@ -1294,86 +1244,77 @@ context_apply_all(struct i915_gem_context *ctx,
 	i915_sw_fence_complete(&e->fence);
 }
 
-static void __apply_ppgtt(struct intel_context *ce, void *vm)
-{
-	i915_vm_put(ce->vm);
-	ce->vm = i915_vm_get(vm);
-}
-
-static struct i915_address_space *
-__set_ppgtt(struct i915_gem_context *ctx, struct i915_address_space *vm)
-{
-	struct i915_address_space *old;
-
-	old = rcu_replace_pointer(ctx->vm,
-				  i915_vm_open(vm),
-				  lockdep_is_held(&ctx->mutex));
-	GEM_BUG_ON(old && i915_vm_is_4lvl(vm) != i915_vm_is_4lvl(old));
-
-	context_apply_all(ctx, __apply_ppgtt, vm);
-
-	return old;
-}
-
-static void __assign_ppgtt(struct i915_gem_context *ctx,
-			   struct i915_address_space *vm)
-{
-	if (vm == rcu_access_pointer(ctx->vm))
-		return;
-
-	vm = __set_ppgtt(ctx, vm);
-	if (vm)
-		i915_vm_close(vm);
-}
-
 static struct i915_gem_context *
 i915_gem_create_context(struct drm_i915_private *i915,
 			const struct i915_gem_proto_context *pc)
 {
 	struct i915_gem_context *ctx;
-	int ret;
+	struct i915_gem_engines *e;
+	int err;
+	int i;
 
-	ctx = __create_context(i915, pc);
-	if (IS_ERR(ctx))
-		return ctx;
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
 
-	if (pc->vm) {
-		mutex_lock(&ctx->mutex);
-		__assign_ppgtt(ctx, pc->vm);
-		mutex_unlock(&ctx->mutex);
-	}
+	kref_init(&ctx->ref);
+	ctx->i915 = i915;
+	ctx->sched = pc->sched;
+	mutex_init(&ctx->mutex);
+	INIT_LIST_HEAD(&ctx->link);
 
-	if (pc->num_user_engines >= 0) {
-		struct i915_gem_engines *engines;
+	spin_lock_init(&ctx->stale.lock);
+	INIT_LIST_HEAD(&ctx->stale.engines);
 
-		engines = user_engines(ctx, pc->num_user_engines,
-				       pc->user_engines);
-		if (IS_ERR(engines)) {
-			context_close(ctx);
-			return ERR_CAST(engines);
-		}
+	if (pc->vm)
+		RCU_INIT_POINTER(ctx->vm, i915_vm_open(pc->vm));
 
-		mutex_lock(&ctx->engines_mutex);
+	mutex_init(&ctx->engines_mutex);
+	if (pc->num_user_engines >= 0) {
 		i915_gem_context_set_user_engines(ctx);
-		engines = rcu_replace_pointer(ctx->engines, engines, 1);
-		mutex_unlock(&ctx->engines_mutex);
-
-		free_engines(engines);
+		e = user_engines(ctx, pc->num_user_engines, pc->user_engines);
+	} else {
+		i915_gem_context_clear_user_engines(ctx);
+		e = default_engines(ctx);
+	}
+	if (IS_ERR(e)) {
+		err = PTR_ERR(e);
+		goto err_vm;
 	}
+	RCU_INIT_POINTER(ctx->engines, e);
+
+	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
+	mutex_init(&ctx->lut_mutex);
+
+	/* NB: Mark all slices as needing a remap so that when the context first
+	 * loads it will restore whatever remap state already exists. If there
+	 * is no remap info, it will be a NOP. */
+	ctx->remap_slice = ALL_L3_SLICES(i915);
+
+	ctx->user_flags = pc->user_flags;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
+		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
 
 	if (pc->single_timeline) {
-		ret = drm_syncobj_create(&ctx->syncobj,
+		err = drm_syncobj_create(&ctx->syncobj,
 					 DRM_SYNCOBJ_CREATE_SIGNALED,
 					 NULL);
-		if (ret) {
-			context_close(ctx);
-			return ERR_PTR(ret);
-		}
+		if (err)
+			goto err_engines;
 	}
 
 	trace_i915_context_create(ctx);
 
 	return ctx;
+
+err_engines:
+	free_engines(e);
+err_vm:
+	if (ctx->vm)
+		i915_vm_close(ctx->vm);
+	kfree(ctx);
+	return ERR_PTR(err);
 }
 
 static void init_contexts(struct i915_gem_contexts *gc)
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index e4aced7eabb72..5ee7e9bb6175d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -30,15 +30,6 @@ mock_context(struct drm_i915_private *i915,
 
 	i915_gem_context_set_persistence(ctx);
 
-	mutex_init(&ctx->engines_mutex);
-	e = default_engines(ctx);
-	if (IS_ERR(e))
-		goto err_free;
-	RCU_INIT_POINTER(ctx->engines, e);
-
-	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
-	mutex_init(&ctx->lut_mutex);
-
 	if (name) {
 		struct i915_ppgtt *ppgtt;
 
@@ -46,25 +37,29 @@ mock_context(struct drm_i915_private *i915,
 
 		ppgtt = mock_ppgtt(i915, name);
 		if (!ppgtt)
-			goto err_put;
-
-		mutex_lock(&ctx->mutex);
-		__set_ppgtt(ctx, &ppgtt->vm);
-		mutex_unlock(&ctx->mutex);
+			goto err_free;
 
+		ctx->vm = i915_vm_open(&ppgtt->vm);
 		i915_vm_put(&ppgtt->vm);
 	}
 
+	mutex_init(&ctx->engines_mutex);
+	e = default_engines(ctx);
+	if (IS_ERR(e))
+		goto err_vm;
+	RCU_INIT_POINTER(ctx->engines, e);
+
+	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
+	mutex_init(&ctx->lut_mutex);
+
 	return ctx;
 
+err_vm:
+	if (ctx->vm)
+		i915_vm_close(ctx->vm);
 err_free:
 	kfree(ctx);
 	return NULL;
-
-err_put:
-	i915_gem_context_set_closed(ctx);
-	i915_gem_context_put(ctx);
-	return NULL;
 }
 
 void mock_context_close(struct i915_gem_context *ctx)
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
