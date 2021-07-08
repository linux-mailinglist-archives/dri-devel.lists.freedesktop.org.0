Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905D3C1683
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E216E92A;
	Thu,  8 Jul 2021 15:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BEB6E91E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:49:10 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 l26-20020a4ac61a0000b029024c94215d77so1462878ooq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rp5nzrB7wJB6/rKbvfWcO7dMUGBZwr8nJuS9XGRD9KM=;
 b=C861J/ZYqsHJ2Pzn/6PlMI++rCgL/7cFK9WkxF95W4MBaNPEXIaO1PJK+XY1PQoYnq
 CHimJQC6shTZbtTlh5MMLUcV17KLpjsQAKBqaT1TuCz+D4SdOiahgu0GQc4PED2nfbim
 yRwpSEUZkP2Rg/vsSQINOYYK3Xn7VusXgQAPRqvZJ+Iv1vdvEjERroTl4lF9wCORc6lH
 xSfsR1iuk8s0+B1FqmlRvXNtHeFCUkmWS/CS06mNNpXY/UrKh1JtEU1CtgWGe+/AgGTN
 8bde+j7HvWDCVi8++5fhFKEdDcTxrFJLm9KYKOulGuR9Gk2+repC5gd0QtmToZY/ma9P
 Aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rp5nzrB7wJB6/rKbvfWcO7dMUGBZwr8nJuS9XGRD9KM=;
 b=J3Z6zE7QzDHDQY45mIb/39ceeWEeD7w4a/C1amx3goV+Q4cgO/mqYT1DFnSzLul8Gs
 myLide2KRpDRsEduCZeElZIZ7YzkUTOT4zHLtDjgbIhbKuJKULZgl3oM3PZg+X+EK/UI
 meengd0d7nTHZ213bjDahjUSoxQS8Y2tGgqjdZXY+UAurFXForbko4lqTJCNzbrz34Uo
 ae1SCksLRzU8qB70AHYk2qyt1+gDAPnDy15tzXCkuh/z76JezHYtSVhEGlOc6qMsNMCY
 1Irk3EUSNFPPJAnn1NR/qenYMI7cFPHp4KPHson4m9dCPd0pFcMJZiipo7bXVJuQhDdU
 fjsA==
X-Gm-Message-State: AOAM531TwYXx2QUztmm3L9d6bbNZfw8Ccn5oFAXcnqkMqAfK6HDwoZiu
 Shx45beBxbRNO4+Ko12qz92+CA==
X-Google-Smtp-Source: ABdhPJzvMiFiFUuLtscCeczWqK7Wl7qG2iz6U7RfY8Fd3XFBIkefazq+D/lORq/xdbIclJ1YsaSRhw==
X-Received: by 2002:a4a:e8cd:: with SMTP id h13mr17450443ooe.26.1625759349062; 
 Thu, 08 Jul 2021 08:49:09 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:49:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/30] drm/i915/gem: Don't allow changing the VM on running
 contexts (v4)
Date: Thu,  8 Jul 2021 10:48:30 -0500
Message-Id: <20210708154835.528166-26-jason@jlekstrand.net>
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

v3 (Daniel Vetter):
 - Don't drop the __rcu on the vm pointer

v4 (Jason Ekstrand):
 - Make it more obvious that I915_CONTEXT_PARAM_VM returns -EINVAL

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 263 +-----------------
 .../drm/i915/gem/selftests/i915_gem_context.c | 119 --------
 .../drm/i915/selftests/i915_mock_selftests.h  |   1 -
 3 files changed, 1 insertion(+), 382 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c4f89e4b1665f..40acecfbbe5b5 100644
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
@@ -2473,6 +2211,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 	case I915_CONTEXT_PARAM_NO_ZEROMAP:
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	case I915_CONTEXT_PARAM_RINGSIZE:
+	case I915_CONTEXT_PARAM_VM:
 	default:
 		ret = -EINVAL;
 		break;
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
index 6759b56086fb4..793fb28a770d5 100644
--- a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
@@ -32,6 +32,5 @@ selftest(vma, i915_vma_mock_selftests)
 selftest(evict, i915_gem_evict_mock_selftests)
 selftest(gtt, i915_gem_gtt_mock_selftests)
 selftest(hugepages, i915_gem_huge_page_mock_selftests)
-selftest(contexts, i915_gem_context_mock_selftests)
 selftest(memory_region, intel_memory_region_mock_selftests)
 selftest(buddy, i915_buddy_mock_selftests)
-- 
2.31.1

