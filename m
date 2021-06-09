Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3563A1C47
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70C76EB4B;
	Wed,  9 Jun 2021 17:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9146EAD2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:45:13 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso1908989pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KOTSxWNnHvE9SnmCFyNjA8MuR8hQt/tS0DrnP6cLos=;
 b=S1cfre19fuzz5XtHyCK/xaxwcxlvo7rvQ06NBye5e48zF+lSBPRDu+Kwy/pj1bAzkP
 /dRQ1bS+Ub2UoQUNPbJi2yLoVf6NNobJxgb85B77LWhDAWmp1XDfkdS7PYVfo9PXFj7X
 dBd79aPpNhOc9dY/jwbmt2KP4Rwbsdcdee1hK8iEnzqbZ37PKcSLlhiov1OgzcT71tmG
 SYOTuY1dTrm2UqlMADDiB88NfIq17rdFGZoWqP+TjiOFSsxMe/qArBLZbZqneyrmzq1y
 vh3mXlT0DGpfHCSmj+uj8tVeIgefVJNjlCZdTyUcjbiHwF5e4rFjtuW/JFtUqPZOLooK
 05sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KOTSxWNnHvE9SnmCFyNjA8MuR8hQt/tS0DrnP6cLos=;
 b=JTckp84do/W9Po5LOkPYqcv3lxT7v91Pl3OwazNMi1NL+r3z/KuszgsVW4ndFWCb0J
 +1zuxbByKRLZHT7tTiRICj26rtDkSKQF8NoRI1uL5kZerxO1W8ha/7Jnq0n3u6PTq2HG
 8812Bc95GSnY4oJ71NYoohmidyCIbRNTETHZn3H3Ua4iOcaMn9VH9LkQ7KM20tToiKUy
 HT4Cb5V7LyTpweRkPCRMZ7JYaNrd5AKIQjIkRKfGkzn4jMrwK5s8XwyYMPjHyLqJZng8
 Ie3W1ckxKKN4q6VBhkpWRNSXgJiCOZ43aw4wPFY2qhCrDbE4AbiJBhwM67aiaqVb9BSV
 wd/Q==
X-Gm-Message-State: AOAM531kG4ZD7p4xltoHH2cubn8zSvdszk+OLlAp/8BQRGTpx6N1PUBl
 5S5HZTuQMk5cIHTcw9WG4Cj8tiBOWa5VzQ==
X-Google-Smtp-Source: ABdhPJz3WuHBcZ1PQUFESTYWiioK1D6PpmlP6xKLZL4dbz7ND9JNCTi0WlSma+ehb/oAM7vncWmy+A==
X-Received: by 2002:a17:90b:e8e:: with SMTP id
 fv14mr11668060pjb.29.1623260712649; 
 Wed, 09 Jun 2021 10:45:12 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:45:12 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 29/31] drm/i915/gem: Roll all of context creation together
Date: Wed,  9 Jun 2021 12:44:16 -0500
Message-Id: <20210609174418.249585-30-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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

Now that we have the whole engine set and VM at context creation time,
we can just assign those fields instead of creating first and handling
the VM and engines later.  This lets us avoid creating useless VMs and
engine sets and lets us get rid of the complex VM setting code.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 176 ++++++------------
 .../gpu/drm/i915/gem/selftests/mock_context.c |  33 ++--
 2 files changed, 73 insertions(+), 136 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5f5375b15c530..c67e305f5bc74 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1279,56 +1279,6 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
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
-	e = default_engines(ctx, pc->legacy_rcs_sseu);
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
@@ -1372,54 +1322,31 @@ context_apply_all(struct i915_gem_context *ctx,
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
+	struct i915_address_space *vm = NULL;
+	struct i915_gem_engines *e;
+	int err;
+	int i;
 
-	ctx = __create_context(i915, pc);
-	if (IS_ERR(ctx))
-		return ctx;
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&ctx->ref);
+	ctx->i915 = i915;
+	ctx->sched = pc->sched;
+	mutex_init(&ctx->mutex);
+	INIT_LIST_HEAD(&ctx->link);
+
+	spin_lock_init(&ctx->stale.lock);
+	INIT_LIST_HEAD(&ctx->stale.engines);
 
 	if (pc->vm) {
-		/* __assign_ppgtt() requires this mutex to be held */
-		mutex_lock(&ctx->mutex);
-		__assign_ppgtt(ctx, pc->vm);
-		mutex_unlock(&ctx->mutex);
+		vm = i915_vm_get(pc->vm);
 	} else if (HAS_FULL_PPGTT(i915)) {
 		struct i915_ppgtt *ppgtt;
 
@@ -1427,50 +1354,65 @@ i915_gem_create_context(struct drm_i915_private *i915,
 		if (IS_ERR(ppgtt)) {
 			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
 				PTR_ERR(ppgtt));
-			context_close(ctx);
-			return ERR_CAST(ppgtt);
+			err = PTR_ERR(ppgtt);
+			goto err_ctx;
 		}
+		vm = &ppgtt->vm;
+	}
+	if (vm) {
+		RCU_INIT_POINTER(ctx->vm, i915_vm_open(vm));
 
-		/* __assign_ppgtt() requires this mutex to be held */
-		mutex_lock(&ctx->mutex);
-		__assign_ppgtt(ctx, &ppgtt->vm);
-		mutex_unlock(&ctx->mutex);
-
-		/* __assign_ppgtt() takes another reference for us */
-		i915_vm_put(&ppgtt->vm);
+		/* i915_vm_open() takes a reference */
+		i915_vm_put(vm);
 	}
 
+	mutex_init(&ctx->engines_mutex);
 	if (pc->num_user_engines >= 0) {
-		struct i915_gem_engines *engines;
+		i915_gem_context_set_user_engines(ctx);
+		e = user_engines(ctx, pc->num_user_engines, pc->user_engines);
+	} else {
+		i915_gem_context_clear_user_engines(ctx);
+		e = default_engines(ctx, pc->legacy_rcs_sseu);
+	}
+	if (IS_ERR(e)) {
+		err = PTR_ERR(e);
+		goto err_vm;
+	}
+	RCU_INIT_POINTER(ctx->engines, e);
 
-		engines = user_engines(ctx, pc->num_user_engines,
-				       pc->user_engines);
-		if (IS_ERR(engines)) {
-			context_close(ctx);
-			return ERR_CAST(engines);
-		}
+	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
+	mutex_init(&ctx->lut_mutex);
 
-		mutex_lock(&ctx->engines_mutex);
-		i915_gem_context_set_user_engines(ctx);
-		engines = rcu_replace_pointer(ctx->engines, engines, 1);
-		mutex_unlock(&ctx->engines_mutex);
+	/* NB: Mark all slices as needing a remap so that when the context first
+	 * loads it will restore whatever remap state already exists. If there
+	 * is no remap info, it will be a NOP. */
+	ctx->remap_slice = ALL_L3_SLICES(i915);
 
-		free_engines(engines);
-	}
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
+err_ctx:
+	kfree(ctx);
+	return ERR_PTR(err);
 }
 
 static void init_contexts(struct i915_gem_contexts *gc)
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index 500ef27ba4771..fee070df1c97b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -31,15 +31,6 @@ mock_context(struct drm_i915_private *i915,
 
 	i915_gem_context_set_persistence(ctx);
 
-	mutex_init(&ctx->engines_mutex);
-	e = default_engines(ctx, null_sseu);
-	if (IS_ERR(e))
-		goto err_free;
-	RCU_INIT_POINTER(ctx->engines, e);
-
-	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
-	mutex_init(&ctx->lut_mutex);
-
 	if (name) {
 		struct i915_ppgtt *ppgtt;
 
@@ -47,25 +38,29 @@ mock_context(struct drm_i915_private *i915,
 
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
+	e = default_engines(ctx, null_sseu);
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

