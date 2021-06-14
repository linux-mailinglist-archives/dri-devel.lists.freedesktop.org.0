Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03483A6BE0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 18:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DFD89EAC;
	Mon, 14 Jun 2021 16:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8179089EAC;
 Mon, 14 Jun 2021 16:33:18 +0000 (UTC)
IronPort-SDR: 0CdtxrMPwranEYSv2sqZAJDfPLaGJVbicfLsMnmcM6pqqG+Ft53Fod1P2762mGI/vt9TjAFg02
 s6+lwsBengbA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205658679"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="205658679"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 09:33:16 -0700
IronPort-SDR: 9Da+PkmoGV2fIAl68WhoXd1QtqMXgz1kV8uECUKzU8YnPzO9M5VZ0djTzi7Rns0B8jSWS7NkiR
 q37sAOCj4Ltg==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="554162881"
Received: from chanily-mobl.ger.corp.intel.com (HELO [10.252.31.39])
 ([10.252.31.39])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 09:33:15 -0700
Subject: Re: [PATCH v3 11/12] drm/i915/gem: Zap the client blt code
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
 <20210614162612.294869-12-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <d5600d3f-0a7f-26bc-7785-0768b06abbef@intel.com>
Date: Mon, 14 Jun 2021 17:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614162612.294869-12-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 14/06/2021 17:26, Thomas Hellström wrote:
> It's not used anywhere.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

We do have to keep igt_client_tiled_blits subtest, it's not related to 
the client blitting code and was added afterwards. Not completely sure 
why it's in this file.

With that added back,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 -
>   .../gpu/drm/i915/gem/i915_gem_client_blt.c    | 355 ---------
>   .../gpu/drm/i915/gem/i915_gem_client_blt.h    |  21 -
>   .../i915/gem/selftests/i915_gem_client_blt.c  | 704 ------------------
>   .../drm/i915/selftests/i915_live_selftests.h  |   1 -
>   5 files changed, 1082 deletions(-)
>   delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c
>   delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.h
>   delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index de4cb9c52585..ca07474ec2df 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -136,7 +136,6 @@ i915-y += $(gt-y)
>   gem-y += \
>   	gem/i915_gem_busy.o \
>   	gem/i915_gem_clflush.o \
> -	gem/i915_gem_client_blt.o \
>   	gem/i915_gem_context.o \
>   	gem/i915_gem_create.o \
>   	gem/i915_gem_dmabuf.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_client_blt.c
> deleted file mode 100644
> index 44821d94544f..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gem_client_blt.c
> +++ /dev/null
> @@ -1,355 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2019 Intel Corporation
> - */
> -
> -#include "i915_drv.h"
> -#include "gt/intel_context.h"
> -#include "gt/intel_engine_pm.h"
> -#include "i915_gem_client_blt.h"
> -#include "i915_gem_object_blt.h"
> -
> -struct i915_sleeve {
> -	struct i915_vma *vma;
> -	struct drm_i915_gem_object *obj;
> -	struct sg_table *pages;
> -	struct i915_page_sizes page_sizes;
> -};
> -
> -static int vma_set_pages(struct i915_vma *vma)
> -{
> -	struct i915_sleeve *sleeve = vma->private;
> -
> -	vma->pages = sleeve->pages;
> -	vma->page_sizes = sleeve->page_sizes;
> -
> -	return 0;
> -}
> -
> -static void vma_clear_pages(struct i915_vma *vma)
> -{
> -	GEM_BUG_ON(!vma->pages);
> -	vma->pages = NULL;
> -}
> -
> -static void vma_bind(struct i915_address_space *vm,
> -		     struct i915_vm_pt_stash *stash,
> -		     struct i915_vma *vma,
> -		     enum i915_cache_level cache_level,
> -		     u32 flags)
> -{
> -	vm->vma_ops.bind_vma(vm, stash, vma, cache_level, flags);
> -}
> -
> -static void vma_unbind(struct i915_address_space *vm, struct i915_vma *vma)
> -{
> -	vm->vma_ops.unbind_vma(vm, vma);
> -}
> -
> -static const struct i915_vma_ops proxy_vma_ops = {
> -	.set_pages = vma_set_pages,
> -	.clear_pages = vma_clear_pages,
> -	.bind_vma = vma_bind,
> -	.unbind_vma = vma_unbind,
> -};
> -
> -static struct i915_sleeve *create_sleeve(struct i915_address_space *vm,
> -					 struct drm_i915_gem_object *obj,
> -					 struct sg_table *pages,
> -					 struct i915_page_sizes *page_sizes)
> -{
> -	struct i915_sleeve *sleeve;
> -	struct i915_vma *vma;
> -	int err;
> -
> -	sleeve = kzalloc(sizeof(*sleeve), GFP_KERNEL);
> -	if (!sleeve)
> -		return ERR_PTR(-ENOMEM);
> -
> -	vma = i915_vma_instance(obj, vm, NULL);
> -	if (IS_ERR(vma)) {
> -		err = PTR_ERR(vma);
> -		goto err_free;
> -	}
> -
> -	vma->private = sleeve;
> -	vma->ops = &proxy_vma_ops;
> -
> -	sleeve->vma = vma;
> -	sleeve->pages = pages;
> -	sleeve->page_sizes = *page_sizes;
> -
> -	return sleeve;
> -
> -err_free:
> -	kfree(sleeve);
> -	return ERR_PTR(err);
> -}
> -
> -static void destroy_sleeve(struct i915_sleeve *sleeve)
> -{
> -	kfree(sleeve);
> -}
> -
> -struct clear_pages_work {
> -	struct dma_fence dma;
> -	struct dma_fence_cb cb;
> -	struct i915_sw_fence wait;
> -	struct work_struct work;
> -	struct irq_work irq_work;
> -	struct i915_sleeve *sleeve;
> -	struct intel_context *ce;
> -	u32 value;
> -};
> -
> -static const char *clear_pages_work_driver_name(struct dma_fence *fence)
> -{
> -	return DRIVER_NAME;
> -}
> -
> -static const char *clear_pages_work_timeline_name(struct dma_fence *fence)
> -{
> -	return "clear";
> -}
> -
> -static void clear_pages_work_release(struct dma_fence *fence)
> -{
> -	struct clear_pages_work *w = container_of(fence, typeof(*w), dma);
> -
> -	destroy_sleeve(w->sleeve);
> -
> -	i915_sw_fence_fini(&w->wait);
> -
> -	BUILD_BUG_ON(offsetof(typeof(*w), dma));
> -	dma_fence_free(&w->dma);
> -}
> -
> -static const struct dma_fence_ops clear_pages_work_ops = {
> -	.get_driver_name = clear_pages_work_driver_name,
> -	.get_timeline_name = clear_pages_work_timeline_name,
> -	.release = clear_pages_work_release,
> -};
> -
> -static void clear_pages_signal_irq_worker(struct irq_work *work)
> -{
> -	struct clear_pages_work *w = container_of(work, typeof(*w), irq_work);
> -
> -	dma_fence_signal(&w->dma);
> -	dma_fence_put(&w->dma);
> -}
> -
> -static void clear_pages_dma_fence_cb(struct dma_fence *fence,
> -				     struct dma_fence_cb *cb)
> -{
> -	struct clear_pages_work *w = container_of(cb, typeof(*w), cb);
> -
> -	if (fence->error)
> -		dma_fence_set_error(&w->dma, fence->error);
> -
> -	/*
> -	 * Push the signalling of the fence into yet another worker to avoid
> -	 * the nightmare locking around the fence spinlock.
> -	 */
> -	irq_work_queue(&w->irq_work);
> -}
> -
> -static void clear_pages_worker(struct work_struct *work)
> -{
> -	struct clear_pages_work *w = container_of(work, typeof(*w), work);
> -	struct drm_i915_gem_object *obj = w->sleeve->vma->obj;
> -	struct i915_vma *vma = w->sleeve->vma;
> -	struct i915_gem_ww_ctx ww;
> -	struct i915_request *rq;
> -	struct i915_vma *batch;
> -	int err = w->dma.error;
> -
> -	if (unlikely(err))
> -		goto out_signal;
> -
> -	if (obj->cache_dirty) {
> -		if (i915_gem_object_has_struct_page(obj))
> -			drm_clflush_sg(w->sleeve->pages);
> -		obj->cache_dirty = false;
> -	}
> -	obj->read_domains = I915_GEM_GPU_DOMAINS;
> -	obj->write_domain = 0;
> -
> -	i915_gem_ww_ctx_init(&ww, false);
> -	intel_engine_pm_get(w->ce->engine);
> -retry:
> -	err = intel_context_pin_ww(w->ce, &ww);
> -	if (err)
> -		goto out_signal;
> -
> -	batch = intel_emit_vma_fill_blt(w->ce, vma, &ww, w->value);
> -	if (IS_ERR(batch)) {
> -		err = PTR_ERR(batch);
> -		goto out_ctx;
> -	}
> -
> -	rq = i915_request_create(w->ce);
> -	if (IS_ERR(rq)) {
> -		err = PTR_ERR(rq);
> -		goto out_batch;
> -	}
> -
> -	/* There's no way the fence has signalled */
> -	if (dma_fence_add_callback(&rq->fence, &w->cb,
> -				   clear_pages_dma_fence_cb))
> -		GEM_BUG_ON(1);
> -
> -	err = intel_emit_vma_mark_active(batch, rq);
> -	if (unlikely(err))
> -		goto out_request;
> -
> -	/*
> -	 * w->dma is already exported via (vma|obj)->resv we need only
> -	 * keep track of the GPU activity within this vma/request, and
> -	 * propagate the signal from the request to w->dma.
> -	 */
> -	err = __i915_vma_move_to_active(vma, rq);
> -	if (err)
> -		goto out_request;
> -
> -	if (rq->engine->emit_init_breadcrumb) {
> -		err = rq->engine->emit_init_breadcrumb(rq);
> -		if (unlikely(err))
> -			goto out_request;
> -	}
> -
> -	err = rq->engine->emit_bb_start(rq,
> -					batch->node.start, batch->node.size,
> -					0);
> -out_request:
> -	if (unlikely(err)) {
> -		i915_request_set_error_once(rq, err);
> -		err = 0;
> -	}
> -
> -	i915_request_add(rq);
> -out_batch:
> -	intel_emit_vma_release(w->ce, batch);
> -out_ctx:
> -	intel_context_unpin(w->ce);
> -out_signal:
> -	if (err == -EDEADLK) {
> -		err = i915_gem_ww_ctx_backoff(&ww);
> -		if (!err)
> -			goto retry;
> -	}
> -	i915_gem_ww_ctx_fini(&ww);
> -
> -	i915_vma_unpin(w->sleeve->vma);
> -	intel_engine_pm_put(w->ce->engine);
> -
> -	if (unlikely(err)) {
> -		dma_fence_set_error(&w->dma, err);
> -		dma_fence_signal(&w->dma);
> -		dma_fence_put(&w->dma);
> -	}
> -}
> -
> -static int pin_wait_clear_pages_work(struct clear_pages_work *w,
> -				     struct intel_context *ce)
> -{
> -	struct i915_vma *vma = w->sleeve->vma;
> -	struct i915_gem_ww_ctx ww;
> -	int err;
> -
> -	i915_gem_ww_ctx_init(&ww, false);
> -retry:
> -	err = i915_gem_object_lock(vma->obj, &ww);
> -	if (err)
> -		goto out;
> -
> -	err = i915_vma_pin_ww(vma, &ww, 0, 0, PIN_USER);
> -	if (unlikely(err))
> -		goto out;
> -
> -	err = i915_sw_fence_await_reservation(&w->wait,
> -					      vma->obj->base.resv, NULL,
> -					      true, 0, I915_FENCE_GFP);
> -	if (err)
> -		goto err_unpin_vma;
> -
> -	dma_resv_add_excl_fence(vma->obj->base.resv, &w->dma);
> -
> -err_unpin_vma:
> -	if (err)
> -		i915_vma_unpin(vma);
> -out:
> -	if (err == -EDEADLK) {
> -		err = i915_gem_ww_ctx_backoff(&ww);
> -		if (!err)
> -			goto retry;
> -	}
> -	i915_gem_ww_ctx_fini(&ww);
> -	return err;
> -}
> -
> -static int __i915_sw_fence_call
> -clear_pages_work_notify(struct i915_sw_fence *fence,
> -			enum i915_sw_fence_notify state)
> -{
> -	struct clear_pages_work *w = container_of(fence, typeof(*w), wait);
> -
> -	switch (state) {
> -	case FENCE_COMPLETE:
> -		schedule_work(&w->work);
> -		break;
> -
> -	case FENCE_FREE:
> -		dma_fence_put(&w->dma);
> -		break;
> -	}
> -
> -	return NOTIFY_DONE;
> -}
> -
> -static DEFINE_SPINLOCK(fence_lock);
> -
> -/* XXX: better name please */
> -int i915_gem_schedule_fill_pages_blt(struct drm_i915_gem_object *obj,
> -				     struct intel_context *ce,
> -				     struct sg_table *pages,
> -				     struct i915_page_sizes *page_sizes,
> -				     u32 value)
> -{
> -	struct clear_pages_work *work;
> -	struct i915_sleeve *sleeve;
> -	int err;
> -
> -	sleeve = create_sleeve(ce->vm, obj, pages, page_sizes);
> -	if (IS_ERR(sleeve))
> -		return PTR_ERR(sleeve);
> -
> -	work = kmalloc(sizeof(*work), GFP_KERNEL);
> -	if (!work) {
> -		destroy_sleeve(sleeve);
> -		return -ENOMEM;
> -	}
> -
> -	work->value = value;
> -	work->sleeve = sleeve;
> -	work->ce = ce;
> -
> -	INIT_WORK(&work->work, clear_pages_worker);
> -
> -	init_irq_work(&work->irq_work, clear_pages_signal_irq_worker);
> -
> -	dma_fence_init(&work->dma, &clear_pages_work_ops, &fence_lock, 0, 0);
> -	i915_sw_fence_init(&work->wait, clear_pages_work_notify);
> -
> -	err = pin_wait_clear_pages_work(work, ce);
> -	if (err < 0)
> -		dma_fence_set_error(&work->dma, err);
> -
> -	dma_fence_get(&work->dma);
> -	i915_sw_fence_commit(&work->wait);
> -
> -	return err;
> -}
> -
> -#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> -#include "selftests/i915_gem_client_blt.c"
> -#endif
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_client_blt.h b/drivers/gpu/drm/i915/gem/i915_gem_client_blt.h
> deleted file mode 100644
> index 3dbd28c22ff5..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gem_client_blt.h
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2019 Intel Corporation
> - */
> -#ifndef __I915_GEM_CLIENT_BLT_H__
> -#define __I915_GEM_CLIENT_BLT_H__
> -
> -#include <linux/types.h>
> -
> -struct drm_i915_gem_object;
> -struct i915_page_sizes;
> -struct intel_context;
> -struct sg_table;
> -
> -int i915_gem_schedule_fill_pages_blt(struct drm_i915_gem_object *obj,
> -				     struct intel_context *ce,
> -				     struct sg_table *pages,
> -				     struct i915_page_sizes *page_sizes,
> -				     u32 value);
> -
> -#endif
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> deleted file mode 100644
> index 176e6b22f87f..000000000000
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> +++ /dev/null
> @@ -1,704 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2019 Intel Corporation
> - */
> -
> -#include "i915_selftest.h"
> -
> -#include "gt/intel_engine_user.h"
> -#include "gt/intel_gt.h"
> -#include "gt/intel_gpu_commands.h"
> -#include "gem/i915_gem_lmem.h"
> -
> -#include "selftests/igt_flush_test.h"
> -#include "selftests/mock_drm.h"
> -#include "selftests/i915_random.h"
> -#include "huge_gem_object.h"
> -#include "mock_context.h"
> -
> -static int __igt_client_fill(struct intel_engine_cs *engine)
> -{
> -	struct intel_context *ce = engine->kernel_context;
> -	struct drm_i915_gem_object *obj;
> -	I915_RND_STATE(prng);
> -	IGT_TIMEOUT(end);
> -	u32 *vaddr;
> -	int err = 0;
> -
> -	intel_engine_pm_get(engine);
> -	do {
> -		const u32 max_block_size = S16_MAX * PAGE_SIZE;
> -		u32 sz = min_t(u64, ce->vm->total >> 4, prandom_u32_state(&prng));
> -		u32 phys_sz = sz % (max_block_size + 1);
> -		u32 val = prandom_u32_state(&prng);
> -		u32 i;
> -
> -		sz = round_up(sz, PAGE_SIZE);
> -		phys_sz = round_up(phys_sz, PAGE_SIZE);
> -
> -		pr_debug("%s with phys_sz= %x, sz=%x, val=%x\n", __func__,
> -			 phys_sz, sz, val);
> -
> -		obj = huge_gem_object(engine->i915, phys_sz, sz);
> -		if (IS_ERR(obj)) {
> -			err = PTR_ERR(obj);
> -			goto err_flush;
> -		}
> -
> -		vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> -		if (IS_ERR(vaddr)) {
> -			err = PTR_ERR(vaddr);
> -			goto err_put;
> -		}
> -
> -		/*
> -		 * XXX: The goal is move this to get_pages, so try to dirty the
> -		 * CPU cache first to check that we do the required clflush
> -		 * before scheduling the blt for !llc platforms. This matches
> -		 * some version of reality where at get_pages the pages
> -		 * themselves may not yet be coherent with the GPU(swap-in). If
> -		 * we are missing the flush then we should see the stale cache
> -		 * values after we do the set_to_cpu_domain and pick it up as a
> -		 * test failure.
> -		 */
> -		memset32(vaddr, val ^ 0xdeadbeaf,
> -			 huge_gem_object_phys_size(obj) / sizeof(u32));
> -
> -		if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
> -			obj->cache_dirty = true;
> -
> -		err = i915_gem_schedule_fill_pages_blt(obj, ce, obj->mm.pages,
> -						       &obj->mm.page_sizes,
> -						       val);
> -		if (err)
> -			goto err_unpin;
> -
> -		i915_gem_object_lock(obj, NULL);
> -		err = i915_gem_object_set_to_cpu_domain(obj, false);
> -		i915_gem_object_unlock(obj);
> -		if (err)
> -			goto err_unpin;
> -
> -		for (i = 0; i < huge_gem_object_phys_size(obj) / sizeof(u32); ++i) {
> -			if (vaddr[i] != val) {
> -				pr_err("vaddr[%u]=%x, expected=%x\n", i,
> -				       vaddr[i], val);
> -				err = -EINVAL;
> -				goto err_unpin;
> -			}
> -		}
> -
> -		i915_gem_object_unpin_map(obj);
> -		i915_gem_object_put(obj);
> -	} while (!time_after(jiffies, end));
> -
> -	goto err_flush;
> -
> -err_unpin:
> -	i915_gem_object_unpin_map(obj);
> -err_put:
> -	i915_gem_object_put(obj);
> -err_flush:
> -	if (err == -ENOMEM)
> -		err = 0;
> -	intel_engine_pm_put(engine);
> -
> -	return err;
> -}
> -
> -static int igt_client_fill(void *arg)
> -{
> -	int inst = 0;
> -
> -	do {
> -		struct intel_engine_cs *engine;
> -		int err;
> -
> -		engine = intel_engine_lookup_user(arg,
> -						  I915_ENGINE_CLASS_COPY,
> -						  inst++);
> -		if (!engine)
> -			return 0;
> -
> -		err = __igt_client_fill(engine);
> -		if (err == -ENOMEM)
> -			err = 0;
> -		if (err)
> -			return err;
> -	} while (1);
> -}
> -
> -#define WIDTH 512
> -#define HEIGHT 32
> -
> -struct blit_buffer {
> -	struct i915_vma *vma;
> -	u32 start_val;
> -	u32 tiling;
> -};
> -
> -struct tiled_blits {
> -	struct intel_context *ce;
> -	struct blit_buffer buffers[3];
> -	struct blit_buffer scratch;
> -	struct i915_vma *batch;
> -	u64 hole;
> -	u32 width;
> -	u32 height;
> -};
> -
> -static int prepare_blit(const struct tiled_blits *t,
> -			struct blit_buffer *dst,
> -			struct blit_buffer *src,
> -			struct drm_i915_gem_object *batch)
> -{
> -	const int ver = GRAPHICS_VER(to_i915(batch->base.dev));
> -	bool use_64b_reloc = ver >= 8;
> -	u32 src_pitch, dst_pitch;
> -	u32 cmd, *cs;
> -
> -	cs = i915_gem_object_pin_map_unlocked(batch, I915_MAP_WC);
> -	if (IS_ERR(cs))
> -		return PTR_ERR(cs);
> -
> -	*cs++ = MI_LOAD_REGISTER_IMM(1);
> -	*cs++ = i915_mmio_reg_offset(BCS_SWCTRL);
> -	cmd = (BCS_SRC_Y | BCS_DST_Y) << 16;
> -	if (src->tiling == I915_TILING_Y)
> -		cmd |= BCS_SRC_Y;
> -	if (dst->tiling == I915_TILING_Y)
> -		cmd |= BCS_DST_Y;
> -	*cs++ = cmd;
> -
> -	cmd = MI_FLUSH_DW;
> -	if (ver >= 8)
> -		cmd++;
> -	*cs++ = cmd;
> -	*cs++ = 0;
> -	*cs++ = 0;
> -	*cs++ = 0;
> -
> -	cmd = XY_SRC_COPY_BLT_CMD | BLT_WRITE_RGBA | (8 - 2);
> -	if (ver >= 8)
> -		cmd += 2;
> -
> -	src_pitch = t->width * 4;
> -	if (src->tiling) {
> -		cmd |= XY_SRC_COPY_BLT_SRC_TILED;
> -		src_pitch /= 4;
> -	}
> -
> -	dst_pitch = t->width * 4;
> -	if (dst->tiling) {
> -		cmd |= XY_SRC_COPY_BLT_DST_TILED;
> -		dst_pitch /= 4;
> -	}
> -
> -	*cs++ = cmd;
> -	*cs++ = BLT_DEPTH_32 | BLT_ROP_SRC_COPY | dst_pitch;
> -	*cs++ = 0;
> -	*cs++ = t->height << 16 | t->width;
> -	*cs++ = lower_32_bits(dst->vma->node.start);
> -	if (use_64b_reloc)
> -		*cs++ = upper_32_bits(dst->vma->node.start);
> -	*cs++ = 0;
> -	*cs++ = src_pitch;
> -	*cs++ = lower_32_bits(src->vma->node.start);
> -	if (use_64b_reloc)
> -		*cs++ = upper_32_bits(src->vma->node.start);
> -
> -	*cs++ = MI_BATCH_BUFFER_END;
> -
> -	i915_gem_object_flush_map(batch);
> -	i915_gem_object_unpin_map(batch);
> -
> -	return 0;
> -}
> -
> -static void tiled_blits_destroy_buffers(struct tiled_blits *t)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(t->buffers); i++)
> -		i915_vma_put(t->buffers[i].vma);
> -
> -	i915_vma_put(t->scratch.vma);
> -	i915_vma_put(t->batch);
> -}
> -
> -static struct i915_vma *
> -__create_vma(struct tiled_blits *t, size_t size, bool lmem)
> -{
> -	struct drm_i915_private *i915 = t->ce->vm->i915;
> -	struct drm_i915_gem_object *obj;
> -	struct i915_vma *vma;
> -
> -	if (lmem)
> -		obj = i915_gem_object_create_lmem(i915, size, 0);
> -	else
> -		obj = i915_gem_object_create_shmem(i915, size);
> -	if (IS_ERR(obj))
> -		return ERR_CAST(obj);
> -
> -	vma = i915_vma_instance(obj, t->ce->vm, NULL);
> -	if (IS_ERR(vma))
> -		i915_gem_object_put(obj);
> -
> -	return vma;
> -}
> -
> -static struct i915_vma *create_vma(struct tiled_blits *t, bool lmem)
> -{
> -	return __create_vma(t, PAGE_ALIGN(t->width * t->height * 4), lmem);
> -}
> -
> -static int tiled_blits_create_buffers(struct tiled_blits *t,
> -				      int width, int height,
> -				      struct rnd_state *prng)
> -{
> -	struct drm_i915_private *i915 = t->ce->engine->i915;
> -	int i;
> -
> -	t->width = width;
> -	t->height = height;
> -
> -	t->batch = __create_vma(t, PAGE_SIZE, false);
> -	if (IS_ERR(t->batch))
> -		return PTR_ERR(t->batch);
> -
> -	t->scratch.vma = create_vma(t, false);
> -	if (IS_ERR(t->scratch.vma)) {
> -		i915_vma_put(t->batch);
> -		return PTR_ERR(t->scratch.vma);
> -	}
> -
> -	for (i = 0; i < ARRAY_SIZE(t->buffers); i++) {
> -		struct i915_vma *vma;
> -
> -		vma = create_vma(t, HAS_LMEM(i915) && i % 2);
> -		if (IS_ERR(vma)) {
> -			tiled_blits_destroy_buffers(t);
> -			return PTR_ERR(vma);
> -		}
> -
> -		t->buffers[i].vma = vma;
> -		t->buffers[i].tiling =
> -			i915_prandom_u32_max_state(I915_TILING_Y + 1, prng);
> -	}
> -
> -	return 0;
> -}
> -
> -static void fill_scratch(struct tiled_blits *t, u32 *vaddr, u32 val)
> -{
> -	int i;
> -
> -	t->scratch.start_val = val;
> -	for (i = 0; i < t->width * t->height; i++)
> -		vaddr[i] = val++;
> -
> -	i915_gem_object_flush_map(t->scratch.vma->obj);
> -}
> -
> -static u64 swizzle_bit(unsigned int bit, u64 offset)
> -{
> -	return (offset & BIT_ULL(bit)) >> (bit - 6);
> -}
> -
> -static u64 tiled_offset(const struct intel_gt *gt,
> -			u64 v,
> -			unsigned int stride,
> -			unsigned int tiling)
> -{
> -	unsigned int swizzle;
> -	u64 x, y;
> -
> -	if (tiling == I915_TILING_NONE)
> -		return v;
> -
> -	y = div64_u64_rem(v, stride, &x);
> -
> -	if (tiling == I915_TILING_X) {
> -		v = div64_u64_rem(y, 8, &y) * stride * 8;
> -		v += y * 512;
> -		v += div64_u64_rem(x, 512, &x) << 12;
> -		v += x;
> -
> -		swizzle = gt->ggtt->bit_6_swizzle_x;
> -	} else {
> -		const unsigned int ytile_span = 16;
> -		const unsigned int ytile_height = 512;
> -
> -		v = div64_u64_rem(y, 32, &y) * stride * 32;
> -		v += y * ytile_span;
> -		v += div64_u64_rem(x, ytile_span, &x) * ytile_height;
> -		v += x;
> -
> -		swizzle = gt->ggtt->bit_6_swizzle_y;
> -	}
> -
> -	switch (swizzle) {
> -	case I915_BIT_6_SWIZZLE_9:
> -		v ^= swizzle_bit(9, v);
> -		break;
> -	case I915_BIT_6_SWIZZLE_9_10:
> -		v ^= swizzle_bit(9, v) ^ swizzle_bit(10, v);
> -		break;
> -	case I915_BIT_6_SWIZZLE_9_11:
> -		v ^= swizzle_bit(9, v) ^ swizzle_bit(11, v);
> -		break;
> -	case I915_BIT_6_SWIZZLE_9_10_11:
> -		v ^= swizzle_bit(9, v) ^ swizzle_bit(10, v) ^ swizzle_bit(11, v);
> -		break;
> -	}
> -
> -	return v;
> -}
> -
> -static const char *repr_tiling(int tiling)
> -{
> -	switch (tiling) {
> -	case I915_TILING_NONE: return "linear";
> -	case I915_TILING_X: return "X";
> -	case I915_TILING_Y: return "Y";
> -	default: return "unknown";
> -	}
> -}
> -
> -static int verify_buffer(const struct tiled_blits *t,
> -			 struct blit_buffer *buf,
> -			 struct rnd_state *prng)
> -{
> -	const u32 *vaddr;
> -	int ret = 0;
> -	int x, y, p;
> -
> -	x = i915_prandom_u32_max_state(t->width, prng);
> -	y = i915_prandom_u32_max_state(t->height, prng);
> -	p = y * t->width + x;
> -
> -	vaddr = i915_gem_object_pin_map_unlocked(buf->vma->obj, I915_MAP_WC);
> -	if (IS_ERR(vaddr))
> -		return PTR_ERR(vaddr);
> -
> -	if (vaddr[0] != buf->start_val) {
> -		ret = -EINVAL;
> -	} else {
> -		u64 v = tiled_offset(buf->vma->vm->gt,
> -				     p * 4, t->width * 4,
> -				     buf->tiling);
> -
> -		if (vaddr[v / sizeof(*vaddr)] != buf->start_val + p)
> -			ret = -EINVAL;
> -	}
> -	if (ret) {
> -		pr_err("Invalid %s tiling detected at (%d, %d), start_val %x\n",
> -		       repr_tiling(buf->tiling),
> -		       x, y, buf->start_val);
> -		igt_hexdump(vaddr, 4096);
> -	}
> -
> -	i915_gem_object_unpin_map(buf->vma->obj);
> -	return ret;
> -}
> -
> -static int move_to_active(struct i915_vma *vma,
> -			  struct i915_request *rq,
> -			  unsigned int flags)
> -{
> -	int err;
> -
> -	i915_vma_lock(vma);
> -	err = i915_request_await_object(rq, vma->obj, false);
> -	if (err == 0)
> -		err = i915_vma_move_to_active(vma, rq, flags);
> -	i915_vma_unlock(vma);
> -
> -	return err;
> -}
> -
> -static int pin_buffer(struct i915_vma *vma, u64 addr)
> -{
> -	int err;
> -
> -	if (drm_mm_node_allocated(&vma->node) && vma->node.start != addr) {
> -		err = i915_vma_unbind(vma);
> -		if (err)
> -			return err;
> -	}
> -
> -	err = i915_vma_pin(vma, 0, 0, PIN_USER | PIN_OFFSET_FIXED | addr);
> -	if (err)
> -		return err;
> -
> -	return 0;
> -}
> -
> -static int
> -tiled_blit(struct tiled_blits *t,
> -	   struct blit_buffer *dst, u64 dst_addr,
> -	   struct blit_buffer *src, u64 src_addr)
> -{
> -	struct i915_request *rq;
> -	int err;
> -
> -	err = pin_buffer(src->vma, src_addr);
> -	if (err) {
> -		pr_err("Cannot pin src @ %llx\n", src_addr);
> -		return err;
> -	}
> -
> -	err = pin_buffer(dst->vma, dst_addr);
> -	if (err) {
> -		pr_err("Cannot pin dst @ %llx\n", dst_addr);
> -		goto err_src;
> -	}
> -
> -	err = i915_vma_pin(t->batch, 0, 0, PIN_USER | PIN_HIGH);
> -	if (err) {
> -		pr_err("cannot pin batch\n");
> -		goto err_dst;
> -	}
> -
> -	err = prepare_blit(t, dst, src, t->batch->obj);
> -	if (err)
> -		goto err_bb;
> -
> -	rq = intel_context_create_request(t->ce);
> -	if (IS_ERR(rq)) {
> -		err = PTR_ERR(rq);
> -		goto err_bb;
> -	}
> -
> -	err = move_to_active(t->batch, rq, 0);
> -	if (!err)
> -		err = move_to_active(src->vma, rq, 0);
> -	if (!err)
> -		err = move_to_active(dst->vma, rq, 0);
> -	if (!err)
> -		err = rq->engine->emit_bb_start(rq,
> -						t->batch->node.start,
> -						t->batch->node.size,
> -						0);
> -	i915_request_get(rq);
> -	i915_request_add(rq);
> -	if (i915_request_wait(rq, 0, HZ / 2) < 0)
> -		err = -ETIME;
> -	i915_request_put(rq);
> -
> -	dst->start_val = src->start_val;
> -err_bb:
> -	i915_vma_unpin(t->batch);
> -err_dst:
> -	i915_vma_unpin(dst->vma);
> -err_src:
> -	i915_vma_unpin(src->vma);
> -	return err;
> -}
> -
> -static struct tiled_blits *
> -tiled_blits_create(struct intel_engine_cs *engine, struct rnd_state *prng)
> -{
> -	struct drm_mm_node hole;
> -	struct tiled_blits *t;
> -	u64 hole_size;
> -	int err;
> -
> -	t = kzalloc(sizeof(*t), GFP_KERNEL);
> -	if (!t)
> -		return ERR_PTR(-ENOMEM);
> -
> -	t->ce = intel_context_create(engine);
> -	if (IS_ERR(t->ce)) {
> -		err = PTR_ERR(t->ce);
> -		goto err_free;
> -	}
> -
> -	hole_size = 2 * PAGE_ALIGN(WIDTH * HEIGHT * 4);
> -	hole_size *= 2; /* room to maneuver */
> -	hole_size += 2 * I915_GTT_MIN_ALIGNMENT;
> -
> -	mutex_lock(&t->ce->vm->mutex);
> -	memset(&hole, 0, sizeof(hole));
> -	err = drm_mm_insert_node_in_range(&t->ce->vm->mm, &hole,
> -					  hole_size, 0, I915_COLOR_UNEVICTABLE,
> -					  0, U64_MAX,
> -					  DRM_MM_INSERT_BEST);
> -	if (!err)
> -		drm_mm_remove_node(&hole);
> -	mutex_unlock(&t->ce->vm->mutex);
> -	if (err) {
> -		err = -ENODEV;
> -		goto err_put;
> -	}
> -
> -	t->hole = hole.start + I915_GTT_MIN_ALIGNMENT;
> -	pr_info("Using hole at %llx\n", t->hole);
> -
> -	err = tiled_blits_create_buffers(t, WIDTH, HEIGHT, prng);
> -	if (err)
> -		goto err_put;
> -
> -	return t;
> -
> -err_put:
> -	intel_context_put(t->ce);
> -err_free:
> -	kfree(t);
> -	return ERR_PTR(err);
> -}
> -
> -static void tiled_blits_destroy(struct tiled_blits *t)
> -{
> -	tiled_blits_destroy_buffers(t);
> -
> -	intel_context_put(t->ce);
> -	kfree(t);
> -}
> -
> -static int tiled_blits_prepare(struct tiled_blits *t,
> -			       struct rnd_state *prng)
> -{
> -	u64 offset = PAGE_ALIGN(t->width * t->height * 4);
> -	u32 *map;
> -	int err;
> -	int i;
> -
> -	map = i915_gem_object_pin_map_unlocked(t->scratch.vma->obj, I915_MAP_WC);
> -	if (IS_ERR(map))
> -		return PTR_ERR(map);
> -
> -	/* Use scratch to fill objects */
> -	for (i = 0; i < ARRAY_SIZE(t->buffers); i++) {
> -		fill_scratch(t, map, prandom_u32_state(prng));
> -		GEM_BUG_ON(verify_buffer(t, &t->scratch, prng));
> -
> -		err = tiled_blit(t,
> -				 &t->buffers[i], t->hole + offset,
> -				 &t->scratch, t->hole);
> -		if (err == 0)
> -			err = verify_buffer(t, &t->buffers[i], prng);
> -		if (err) {
> -			pr_err("Failed to create buffer %d\n", i);
> -			break;
> -		}
> -	}
> -
> -	i915_gem_object_unpin_map(t->scratch.vma->obj);
> -	return err;
> -}
> -
> -static int tiled_blits_bounce(struct tiled_blits *t, struct rnd_state *prng)
> -{
> -	u64 offset =
> -		round_up(t->width * t->height * 4, 2 * I915_GTT_MIN_ALIGNMENT);
> -	int err;
> -
> -	/* We want to check position invariant tiling across GTT eviction */
> -
> -	err = tiled_blit(t,
> -			 &t->buffers[1], t->hole + offset / 2,
> -			 &t->buffers[0], t->hole + 2 * offset);
> -	if (err)
> -		return err;
> -
> -	/* Reposition so that we overlap the old addresses, and slightly off */
> -	err = tiled_blit(t,
> -			 &t->buffers[2], t->hole + I915_GTT_MIN_ALIGNMENT,
> -			 &t->buffers[1], t->hole + 3 * offset / 2);
> -	if (err)
> -		return err;
> -
> -	err = verify_buffer(t, &t->buffers[2], prng);
> -	if (err)
> -		return err;
> -
> -	return 0;
> -}
> -
> -static int __igt_client_tiled_blits(struct intel_engine_cs *engine,
> -				    struct rnd_state *prng)
> -{
> -	struct tiled_blits *t;
> -	int err;
> -
> -	t = tiled_blits_create(engine, prng);
> -	if (IS_ERR(t))
> -		return PTR_ERR(t);
> -
> -	err = tiled_blits_prepare(t, prng);
> -	if (err)
> -		goto out;
> -
> -	err = tiled_blits_bounce(t, prng);
> -	if (err)
> -		goto out;
> -
> -out:
> -	tiled_blits_destroy(t);
> -	return err;
> -}
> -
> -static bool has_bit17_swizzle(int sw)
> -{
> -	return (sw == I915_BIT_6_SWIZZLE_9_10_17 ||
> -		sw == I915_BIT_6_SWIZZLE_9_17);
> -}
> -
> -static bool bad_swizzling(struct drm_i915_private *i915)
> -{
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> -
> -	if (i915->quirks & QUIRK_PIN_SWIZZLED_PAGES)
> -		return true;
> -
> -	if (has_bit17_swizzle(ggtt->bit_6_swizzle_x) ||
> -	    has_bit17_swizzle(ggtt->bit_6_swizzle_y))
> -		return true;
> -
> -	return false;
> -}
> -
> -static int igt_client_tiled_blits(void *arg)
> -{
> -	struct drm_i915_private *i915 = arg;
> -	I915_RND_STATE(prng);
> -	int inst = 0;
> -
> -	/* Test requires explicit BLT tiling controls */
> -	if (GRAPHICS_VER(i915) < 4)
> -		return 0;
> -
> -	if (bad_swizzling(i915)) /* Requires sane (sub-page) swizzling */
> -		return 0;
> -
> -	do {
> -		struct intel_engine_cs *engine;
> -		int err;
> -
> -		engine = intel_engine_lookup_user(i915,
> -						  I915_ENGINE_CLASS_COPY,
> -						  inst++);
> -		if (!engine)
> -			return 0;
> -
> -		err = __igt_client_tiled_blits(engine, &prng);
> -		if (err == -ENODEV)
> -			err = 0;
> -		if (err)
> -			return err;
> -	} while (1);
> -}
> -
> -int i915_gem_client_blt_live_selftests(struct drm_i915_private *i915)
> -{
> -	static const struct i915_subtest tests[] = {
> -		SUBTEST(igt_client_fill),
> -		SUBTEST(igt_client_tiled_blits),
> -	};
> -
> -	if (intel_gt_is_wedged(&i915->gt))
> -		return 0;
> -
> -	return i915_live_subtests(tests, i915);
> -}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> index be5e0191eaea..6f5893ecd549 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -40,7 +40,6 @@ selftest(hugepages, i915_gem_huge_page_live_selftests)
>   selftest(gem_contexts, i915_gem_context_live_selftests)
>   selftest(gem_execbuf, i915_gem_execbuffer_live_selftests)
>   selftest(blt, i915_gem_object_blt_live_selftests)
> -selftest(client, i915_gem_client_blt_live_selftests)
>   selftest(reset, intel_reset_live_selftests)
>   selftest(memory_region, intel_memory_region_live_selftests)
>   selftest(hangcheck, intel_hangcheck_live_selftests)
> 
