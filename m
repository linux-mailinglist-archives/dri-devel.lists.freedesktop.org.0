Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7352C67B0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC336EDE7;
	Fri, 27 Nov 2020 14:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2B56EDE4;
 Fri, 27 Nov 2020 14:19:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23134151-1500050 for multiple; Fri, 27 Nov 2020 14:19:13 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-138-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-138-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 137/162] drm/i915: blt copy between objs
 using pre-created vma windows
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:19:13 +0000
Message-ID: <160648675310.2925.6094361348214569444@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:53)
> +int i915_window_blt_copy(struct drm_i915_gem_object *dst,
> +                        struct drm_i915_gem_object *src)
> +{
> +       struct drm_i915_private *i915 = to_i915(src->base.dev);
> +       struct intel_context *ce = i915->gt.engine[BCS0]->blitter_context;
> +       bool src_is_lmem = i915_gem_object_is_lmem(src);
> +       bool dst_is_lmem = i915_gem_object_is_lmem(dst);
> +       struct scatterlist *last_sgl;
> +       struct i915_vma *src_vma, *dst_vma;
> +       struct i915_request *rq;
> +       u64 cur_win_sz, blt_copied, offset;
> +       long timeout;
> +       u32 size;
> +       int err;
> +
> +       src_vma = src_is_lmem ? i915->mm.lmem_window[0] :
> +                               i915->mm.smem_window[0];
> +       dst_vma = dst_is_lmem ? i915->mm.lmem_window[1] :
> +                               i915->mm.smem_window[1];
> +
> +       if (!src_vma || !dst_vma)
> +               return -ENODEV;
> +
> +       blt_copied = 0;
> +
> +       err = i915_window_blt_copy_prepare_obj(src);
> +       if (err)
> +               return err;
> +
> +       err = i915_window_blt_copy_prepare_obj(dst);
> +       if (err) {
> +               i915_gem_object_unpin_pages(src);
> +               return err;
> +       }
> +
> +       mutex_lock(&i915->mm.window_mutex);
> +       src_vma->obj = src;
> +       dst_vma->obj = dst;
> +       do {
> +               cur_win_sz = min_t(u64, BLT_WINDOW_SZ,
> +                                  (src->base.size - blt_copied));
> +               offset = blt_copied >> PAGE_SHIFT;
> +               size = ALIGN(cur_win_sz, src->mm.region->min_page_size) >>
> +                      PAGE_SHIFT;
> +               intel_partial_pages_for_sg_table(src, src_vma->pages, offset,
> +                                                size, &last_sgl);
> +
> +               /*
> +                * Insert pages into vm, expects the pages to the full
> +                * length of VMA. But we may have the pages of <= vma_size.
> +                * Hence altering the vma size to match the total size of
> +                * the pages attached.
> +                */
> +               src_vma->size = size << PAGE_SHIFT;
> +               i915_insert_vma_pages(src_vma, src_is_lmem);
> +               sg_unmark_end(last_sgl);
> +
> +               /*
> +                * Source obj size could be smaller than the dst obj size,
> +                * due to the varying min_page_size of the mem regions the
> +                * obj belongs to. But when we insert the pages into vm,
> +                * the total size of the pages supposed to be multiples of
> +                * the min page size of that mem region.
> +                */
> +               size = ALIGN(cur_win_sz, dst->mm.region->min_page_size) >>
> +                      PAGE_SHIFT;
> +               intel_partial_pages_for_sg_table(dst, dst_vma->pages, offset,
> +                                                size, &last_sgl);
> +
> +               dst_vma->size = size << PAGE_SHIFT;
> +               i915_insert_vma_pages(dst_vma, dst_is_lmem);
> +               sg_unmark_end(last_sgl);
> +
> +               rq = i915_request_create(ce);
> +               if (IS_ERR(rq)) {
> +                       err = PTR_ERR(rq);
> +                       break;
> +               }
> +               if (rq->engine->emit_init_breadcrumb) {
> +                       err = rq->engine->emit_init_breadcrumb(rq);
> +                       if (unlikely(err)) {
> +                               DRM_ERROR("init_breadcrumb failed. %d\n", err);
> +                               break;
> +                       }
> +               }
> +               err = i915_window_blt_copy_batch_prepare(rq, src_vma, dst_vma,
> +                                                        cur_win_sz);
> +               if (err) {
> +                       DRM_ERROR("Batch preparation failed. %d\n", err);
> +                       i915_request_set_error_once(rq, -EIO);
> +               }
> +
> +               i915_request_get(rq);
> +               i915_request_add(rq);
> +
> +               timeout = i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT);

Locked waits.

> +               if (timeout < 0) {
> +                       DRM_ERROR("BLT Request is not completed. %ld\n",
> +                                 timeout);
> +                       err = timeout;
> +                       i915_request_put(rq);
> +                       break;
> +               }
> +
> +               blt_copied += cur_win_sz;
> +               err = 0;
> +               i915_request_put(rq);
> +               flush_work(&i915->gt.engine[BCS0]->retire_work);

Papering (doubtful the paper is successful) over bugs by introducing a
whole load more.

This fails the basic premise that eviction must be pipelined. The PTE
are transient and can be written prior to the copy and kept within the
non-preemptible window of the blt. Thus allowing many evictions to
scheduled in parallel (by either allocating separate contexts, or more
preferably picking a user context).
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
