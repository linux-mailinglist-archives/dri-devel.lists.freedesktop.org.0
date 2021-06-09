Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2970E3A0B93
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D049B6ECDC;
	Wed,  9 Jun 2021 04:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649E76ECD3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:37:04 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so631673pjq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZ2iZfzkq4P5/UJzmS0awpyO02kxXc1owsIkRpOaYuU=;
 b=OQ3N78ltT1bWmju3q+/0m2wd3rWIaoVqewdcwea/DKFYz80aV7a5Q2JMBuesyF3Iz9
 JrC+GBmXsEpfLSm8mTWyofG3NomGXQwX+z1fTxLr76QR2lb3/1CmQ7ALqo/F8ticz8r6
 t1bz/ueTWHfwZWlJnbvdgiHoXkKOWqRuZ+pzAuoaO1991J14WvDMGgjNWaYpSvuDqRsO
 7Qallmn2LbLVmbPmi2PeDyYvLsKtHaKVANcEan7qO3chgjigV14v2XfeZLaUF0XyVnzC
 VevM6fFChWlyPQY1az271wTQ7Bau1EJt8bTSRdJXKQbePQvp+vd3WtAXSyTnXqtHHe4c
 6EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZ2iZfzkq4P5/UJzmS0awpyO02kxXc1owsIkRpOaYuU=;
 b=aI4/CVcu1Swr1/YP6mghqeSlGJdRNjRl/gZTr1cMkgsNyWT+CdxAndT3Tn1u1wpNXk
 zdWKmhD1OjupmBway0t3g5Fzf/oV4lFp575MJ+QDbrIl2Od33GMU9VyfR1RddR4qD8CE
 2gcNdmyZ6806tXmkP3q6k326SbIOE/bNCFnyytkzix8y8g9SDHhORm6wQWB1eBVrx6eP
 VMZMRnsHdEUqygJVqvy/ETLPZ+GL2xXy+nnjqi91lwJjMb+vpAEldKvIpnA4bX1aqobi
 2EPIK2WkQr+/06WHqIcaAfdCQJa55RhNST5WCPgL/HbFcsmjiD0rYAKwOVO3ZpKXk3NQ
 WpCw==
X-Gm-Message-State: AOAM531LIdaaORK0P0fL93SPp7rOnGm0ghC6TxjMdLhfQEqjDmJfK/nm
 2D4H4cIkM6N8vAyQJVK4XElWThi/13kDJg==
X-Google-Smtp-Source: ABdhPJyCYJe/JDQ0/ELtsMBePTsLMMKcD3dq4Po7krVQ01DRjlBPc9t6fSSFTC6bBWtfYumEColOGw==
X-Received: by 2002:a17:90b:fd4:: with SMTP id
 gd20mr8229547pjb.24.1623213423522; 
 Tue, 08 Jun 2021 21:37:03 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:37:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 25/31] drm/i915/gem: Don't allow changing the VM on running
 contexts (v2)
Date: Tue,  8 Jun 2021 23:36:07 -0500
Message-Id: <20210609043613.102962-26-jason@jlekstrand.net>
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

When the APIs were added to manage VMs more directly from userspace, the
questionable choice was made to allow changing out the VM on a context
at any time.  This is horribly racy and there's absolutely no reason why
any userspace would want to do this outside of testing that exact race.
By removing support for CONTEXT_PARAM_VM from ctx_setparam, we make it
impossible to change out the VM after the context has been fully
created.  This lets us delete a bunch of deferred task code as well as a
duplicated (and slightly different) copy of the code which programs the
PPGTT registers.

v2 (Jason Ekstrand):
 - Expand the commit message

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 262 ------------------
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 119 --------
 .../drm/i915/selftests/i915_mock_selftests.h  |   1 -
 4 files changed, 1 insertion(+), 383 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index f74c22dc506ec..2f3d92224d2fe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1633,120 +1633,6 @@ int i915_gem_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-struct context_barrier_task {
-	struct i915_active base;
-	void (*task)(void *data);
-	void *data;
-};
-
-static void cb_retire(struct i915_active *base)
-{
-	struct context_barrier_task *cb = container_of(base, typeof(*cb), base);
-
-	if (cb->task)
-		cb->task(cb->data);
-
-	i915_active_fini(&cb->base);
-	kfree(cb);
-}
-
-I915_SELFTEST_DECLARE(static intel_engine_mask_t context_barrier_inject_fault);
-static int context_barrier_task(struct i915_gem_context *ctx,
-				intel_engine_mask_t engines,
-				bool (*skip)(struct intel_context *ce, void *data),
-				int (*pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void *data),
-				int (*emit)(struct i915_request *rq, void *data),
-				void (*task)(void *data),
-				void *data)
-{
-	struct context_barrier_task *cb;
-	struct i915_gem_engines_iter it;
-	struct i915_gem_engines *e;
-	struct i915_gem_ww_ctx ww;
-	struct intel_context *ce;
-	int err = 0;
-
-	GEM_BUG_ON(!task);
-
-	cb = kmalloc(sizeof(*cb), GFP_KERNEL);
-	if (!cb)
-		return -ENOMEM;
-
-	i915_active_init(&cb->base, NULL, cb_retire, 0);
-	err = i915_active_acquire(&cb->base);
-	if (err) {
-		kfree(cb);
-		return err;
-	}
-
-	e = __context_engines_await(ctx, NULL);
-	if (!e) {
-		i915_active_release(&cb->base);
-		return -ENOENT;
-	}
-
-	for_each_gem_engine(ce, e, it) {
-		struct i915_request *rq;
-
-		if (I915_SELFTEST_ONLY(context_barrier_inject_fault &
-				       ce->engine->mask)) {
-			err = -ENXIO;
-			break;
-		}
-
-		if (!(ce->engine->mask & engines))
-			continue;
-
-		if (skip && skip(ce, data))
-			continue;
-
-		i915_gem_ww_ctx_init(&ww, true);
-retry:
-		err = intel_context_pin_ww(ce, &ww);
-		if (err)
-			goto err;
-
-		if (pin)
-			err = pin(ce, &ww, data);
-		if (err)
-			goto err_unpin;
-
-		rq = i915_request_create(ce);
-		if (IS_ERR(rq)) {
-			err = PTR_ERR(rq);
-			goto err_unpin;
-		}
-
-		err = 0;
-		if (emit)
-			err = emit(rq, data);
-		if (err == 0)
-			err = i915_active_add_request(&cb->base, rq);
-
-		i915_request_add(rq);
-err_unpin:
-		intel_context_unpin(ce);
-err:
-		if (err == -EDEADLK) {
-			err = i915_gem_ww_ctx_backoff(&ww);
-			if (!err)
-				goto retry;
-		}
-		i915_gem_ww_ctx_fini(&ww);
-
-		if (err)
-			break;
-	}
-	i915_sw_fence_complete(&e->fence);
-
-	cb->task = err ? NULL : task; /* caller needs to unwind instead */
-	cb->data = data;
-
-	i915_active_release(&cb->base);
-
-	return err;
-}
-
 static int get_ppgtt(struct drm_i915_file_private *file_priv,
 		     struct i915_gem_context *ctx,
 		     struct drm_i915_gem_context_param *args)
@@ -1779,150 +1665,6 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
 	return err;
 }
 
-static void set_ppgtt_barrier(void *data)
-{
-	struct i915_address_space *old = data;
-
-	if (GRAPHICS_VER(old->i915) < 8)
-		gen6_ppgtt_unpin_all(i915_vm_to_ppgtt(old));
-
-	i915_vm_close(old);
-}
-
-static int pin_ppgtt_update(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void *data)
-{
-	struct i915_address_space *vm = ce->vm;
-
-	if (!HAS_LOGICAL_RING_CONTEXTS(vm->i915))
-		/* ppGTT is not part of the legacy context image */
-		return gen6_ppgtt_pin(i915_vm_to_ppgtt(vm), ww);
-
-	return 0;
-}
-
-static int emit_ppgtt_update(struct i915_request *rq, void *data)
-{
-	struct i915_address_space *vm = rq->context->vm;
-	struct intel_engine_cs *engine = rq->engine;
-	u32 base = engine->mmio_base;
-	u32 *cs;
-	int i;
-
-	if (i915_vm_is_4lvl(vm)) {
-		struct i915_ppgtt *ppgtt = i915_vm_to_ppgtt(vm);
-		const dma_addr_t pd_daddr = px_dma(ppgtt->pd);
-
-		cs = intel_ring_begin(rq, 6);
-		if (IS_ERR(cs))
-			return PTR_ERR(cs);
-
-		*cs++ = MI_LOAD_REGISTER_IMM(2);
-
-		*cs++ = i915_mmio_reg_offset(GEN8_RING_PDP_UDW(base, 0));
-		*cs++ = upper_32_bits(pd_daddr);
-		*cs++ = i915_mmio_reg_offset(GEN8_RING_PDP_LDW(base, 0));
-		*cs++ = lower_32_bits(pd_daddr);
-
-		*cs++ = MI_NOOP;
-		intel_ring_advance(rq, cs);
-	} else if (HAS_LOGICAL_RING_CONTEXTS(engine->i915)) {
-		struct i915_ppgtt *ppgtt = i915_vm_to_ppgtt(vm);
-		int err;
-
-		/* Magic required to prevent forcewake errors! */
-		err = engine->emit_flush(rq, EMIT_INVALIDATE);
-		if (err)
-			return err;
-
-		cs = intel_ring_begin(rq, 4 * GEN8_3LVL_PDPES + 2);
-		if (IS_ERR(cs))
-			return PTR_ERR(cs);
-
-		*cs++ = MI_LOAD_REGISTER_IMM(2 * GEN8_3LVL_PDPES) | MI_LRI_FORCE_POSTED;
-		for (i = GEN8_3LVL_PDPES; i--; ) {
-			const dma_addr_t pd_daddr = i915_page_dir_dma_addr(ppgtt, i);
-
-			*cs++ = i915_mmio_reg_offset(GEN8_RING_PDP_UDW(base, i));
-			*cs++ = upper_32_bits(pd_daddr);
-			*cs++ = i915_mmio_reg_offset(GEN8_RING_PDP_LDW(base, i));
-			*cs++ = lower_32_bits(pd_daddr);
-		}
-		*cs++ = MI_NOOP;
-		intel_ring_advance(rq, cs);
-	}
-
-	return 0;
-}
-
-static bool skip_ppgtt_update(struct intel_context *ce, void *data)
-{
-	if (HAS_LOGICAL_RING_CONTEXTS(ce->engine->i915))
-		return !ce->state;
-	else
-		return !atomic_read(&ce->pin_count);
-}
-
-static int set_ppgtt(struct drm_i915_file_private *file_priv,
-		     struct i915_gem_context *ctx,
-		     struct drm_i915_gem_context_param *args)
-{
-	struct i915_address_space *vm, *old;
-	int err;
-
-	if (args->size)
-		return -EINVAL;
-
-	if (!rcu_access_pointer(ctx->vm))
-		return -ENODEV;
-
-	if (upper_32_bits(args->value))
-		return -ENOENT;
-
-	vm = i915_gem_vm_lookup(file_priv, args->value);
-	if (!vm)
-		return -ENOENT;
-
-	err = mutex_lock_interruptible(&ctx->mutex);
-	if (err)
-		goto out;
-
-	if (i915_gem_context_is_closed(ctx)) {
-		err = -ENOENT;
-		goto unlock;
-	}
-
-	if (vm == rcu_access_pointer(ctx->vm))
-		goto unlock;
-
-	old = __set_ppgtt(ctx, vm);
-
-	/* Teardown the existing obj:vma cache, it will have to be rebuilt. */
-	lut_close(ctx);
-
-	/*
-	 * We need to flush any requests using the current ppgtt before
-	 * we release it as the requests do not hold a reference themselves,
-	 * only indirectly through the context.
-	 */
-	err = context_barrier_task(ctx, ALL_ENGINES,
-				   skip_ppgtt_update,
-				   pin_ppgtt_update,
-				   emit_ppgtt_update,
-				   set_ppgtt_barrier,
-				   old);
-	if (err) {
-		i915_vm_close(__set_ppgtt(ctx, old));
-		i915_vm_close(old);
-		lut_close(ctx); /* force a rebuild of the old obj:vma cache */
-	}
-
-unlock:
-	mutex_unlock(&ctx->mutex);
-out:
-	i915_vm_put(vm);
-	return err;
-}
-
 int
 i915_gem_user_to_context_sseu(struct intel_gt *gt,
 			      const struct drm_i915_gem_context_param_sseu *user,
@@ -2458,10 +2200,6 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 		ret = set_sseu(ctx, args);
 		break;
 
-	case I915_CONTEXT_PARAM_VM:
-		ret = set_ppgtt(fpriv, ctx, args);
-		break;
-
 	case I915_CONTEXT_PARAM_ENGINES:
 		ret = set_engines(ctx, args);
 		break;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 94c03a97cb77c..540ad16204a97 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -262,7 +262,7 @@ struct i915_gem_context {
 	 * In other modes, this is a NULL pointer with the expectation that
 	 * the caller uses the shared global GTT.
 	 */
-	struct i915_address_space __rcu *vm;
+	struct i915_address_space *vm;
 
 	/**
 	 * @pid: process id of creator
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index dbcfa28a9d91b..92544a174cc9a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1875,125 +1875,6 @@ static int igt_vm_isolation(void *arg)
 	return err;
 }
 
-static bool skip_unused_engines(struct intel_context *ce, void *data)
-{
-	return !ce->state;
-}
-
-static void mock_barrier_task(void *data)
-{
-	unsigned int *counter = data;
-
-	++*counter;
-}
-
-static int mock_context_barrier(void *arg)
-{
-#undef pr_fmt
-#define pr_fmt(x) "context_barrier_task():" # x
-	struct drm_i915_private *i915 = arg;
-	struct i915_gem_context *ctx;
-	struct i915_request *rq;
-	unsigned int counter;
-	int err;
-
-	/*
-	 * The context barrier provides us with a callback after it emits
-	 * a request; useful for retiring old state after loading new.
-	 */
-
-	ctx = mock_context(i915, "mock");
-	if (!ctx)
-		return -ENOMEM;
-
-	counter = 0;
-	err = context_barrier_task(ctx, 0, NULL, NULL, NULL,
-				   mock_barrier_task, &counter);
-	if (err) {
-		pr_err("Failed at line %d, err=%d\n", __LINE__, err);
-		goto out;
-	}
-	if (counter == 0) {
-		pr_err("Did not retire immediately with 0 engines\n");
-		err = -EINVAL;
-		goto out;
-	}
-
-	counter = 0;
-	err = context_barrier_task(ctx, ALL_ENGINES, skip_unused_engines,
-				   NULL, NULL, mock_barrier_task, &counter);
-	if (err) {
-		pr_err("Failed at line %d, err=%d\n", __LINE__, err);
-		goto out;
-	}
-	if (counter == 0) {
-		pr_err("Did not retire immediately for all unused engines\n");
-		err = -EINVAL;
-		goto out;
-	}
-
-	rq = igt_request_alloc(ctx, i915->gt.engine[RCS0]);
-	if (IS_ERR(rq)) {
-		pr_err("Request allocation failed!\n");
-		goto out;
-	}
-	i915_request_add(rq);
-
-	counter = 0;
-	context_barrier_inject_fault = BIT(RCS0);
-	err = context_barrier_task(ctx, ALL_ENGINES, NULL, NULL, NULL,
-				   mock_barrier_task, &counter);
-	context_barrier_inject_fault = 0;
-	if (err == -ENXIO)
-		err = 0;
-	else
-		pr_err("Did not hit fault injection!\n");
-	if (counter != 0) {
-		pr_err("Invoked callback on error!\n");
-		err = -EIO;
-	}
-	if (err)
-		goto out;
-
-	counter = 0;
-	err = context_barrier_task(ctx, ALL_ENGINES, skip_unused_engines,
-				   NULL, NULL, mock_barrier_task, &counter);
-	if (err) {
-		pr_err("Failed at line %d, err=%d\n", __LINE__, err);
-		goto out;
-	}
-	mock_device_flush(i915);
-	if (counter == 0) {
-		pr_err("Did not retire on each active engines\n");
-		err = -EINVAL;
-		goto out;
-	}
-
-out:
-	mock_context_close(ctx);
-	return err;
-#undef pr_fmt
-#define pr_fmt(x) x
-}
-
-int i915_gem_context_mock_selftests(void)
-{
-	static const struct i915_subtest tests[] = {
-		SUBTEST(mock_context_barrier),
-	};
-	struct drm_i915_private *i915;
-	int err;
-
-	i915 = mock_gem_device();
-	if (!i915)
-		return -ENOMEM;
-
-	err = i915_subtests(tests, i915);
-
-	mock_destroy_device(i915);
-	return err;
-}
-
 int i915_gem_context_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
diff --git a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
index 34e5caf380933..0c22e0fc9059c 100644
--- a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
@@ -32,5 +32,4 @@ selftest(vma, i915_vma_mock_selftests)
 selftest(evict, i915_gem_evict_mock_selftests)
 selftest(gtt, i915_gem_gtt_mock_selftests)
 selftest(hugepages, i915_gem_huge_page_mock_selftests)
-selftest(contexts, i915_gem_context_mock_selftests)
 selftest(memory_region, intel_memory_region_mock_selftests)
-- 
2.31.1

