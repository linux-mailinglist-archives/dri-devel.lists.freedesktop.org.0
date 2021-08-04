Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B13E0A53
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 00:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E942289B62;
	Wed,  4 Aug 2021 22:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54BE89B62
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 22:26:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n12so3908490wrr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 15:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ll00s9hj+iL2sDPp+dnWRGZXX8AXUCwsi3s4Us7a8K0=;
 b=P7wOFvr+Cn6/yIA0GopzZJj4gfEGesbzMe8DZed2krVhMiTJhx1HKBBvqT9WfRoMIQ
 /OEnn0SXtamMtQVxSku6ZEU7hNjF3rKV9yBpV8/CPovqlp981sUW/PljnKGy7LTQFpHg
 vF6CHE0HY+14gxIHX4RSQHn2LUgFvxzsTnT+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ll00s9hj+iL2sDPp+dnWRGZXX8AXUCwsi3s4Us7a8K0=;
 b=Xm8HNcNFTjmLRt+Me+EPrwRIJQMjqGQoSAV28S1tDi2TwC55Vo7/3pa1/+BtPNzErL
 akEMW5shbzGyyyZv0YMa4BO8onpRmWaGozh5/hESvKxgBAOWr1b87qW7wgF/w0xQ4AoZ
 0piqb7ZZruPyIzl8qj0aFBpNXiSOogSnG615yEOeIuU9lxRb8HQqQ/gX5gJ7hNfPG8cX
 tfHzTfNhG4IC92AB2tvycTbZ/4eGQ3szMGEUX8/oCP9BDHHi++Eak80ogELimIwMeF7m
 kg+Sn5SC5j5ZyqYg16f5WBCNVjaaU4ZdlxUondpbTh7RNsP5MwRdDWV/qfj7og0mFNR4
 yWSw==
X-Gm-Message-State: AOAM530i1bpFJs9OSptzybiXk6FVjQdIbj97ctCv7Sm9PjF2Vrk5sGnx
 zY8fKZuYqi72zWCRVL/VyfaTLw==
X-Google-Smtp-Source: ABdhPJw5i4WTaDoCtTtftuA2X/5DnjIy9YNnrFx1bWpfOkGqR6sEL9ld+DRSqTxB1WmELaXaVds01Q==
X-Received: by 2002:a5d:518a:: with SMTP id k10mr1501167wrv.400.1628116001390; 
 Wed, 04 Aug 2021 15:26:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c10sm7691570wml.44.2021.08.04.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 15:26:40 -0700 (PDT)
Date: Thu, 5 Aug 2021 00:26:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 2/2] drm/i915: delete gpu reloc code
Message-ID: <YQsUHqd0/ik0lp6W@phenom.ffwll.local>
References: <20210803124833.3817354-1-daniel.vetter@ffwll.ch>
 <20210803124833.3817354-2-daniel.vetter@ffwll.ch>
 <CAOFGe96KzKv_3FusLXirDdUHXn9YoNcmgEQS_QNLkRBSGPBVpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe96KzKv_3FusLXirDdUHXn9YoNcmgEQS_QNLkRBSGPBVpQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Tue, Aug 03, 2021 at 10:47:10AM -0500, Jason Ekstrand wrote:
> Both are
> 
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

CI is happy, I guess you got all the igt changes indeed. Both pushed
thanks for reviewing.
-Daniel

> 
> On Tue, Aug 3, 2021 at 7:49 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > It's already removed, this just garbage collects it all.
> >
> > v2: Rebase over s/GEN/GRAPHICS_VER/
> >
> > v3: Also ditch eb.reloc_pool and eb.reloc_context (Maarten)
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 360 +-----------------
> >  .../drm/i915/selftests/i915_live_selftests.h  |   1 -
> >  2 files changed, 1 insertion(+), 360 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index e4dc4c3b4df3..98e25efffb59 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -277,16 +277,8 @@ struct i915_execbuffer {
> >                 bool has_llc : 1;
> >                 bool has_fence : 1;
> >                 bool needs_unfenced : 1;
> > -
> > -               struct i915_request *rq;
> > -               u32 *rq_cmd;
> > -               unsigned int rq_size;
> > -               struct intel_gt_buffer_pool_node *pool;
> >         } reloc_cache;
> >
> > -       struct intel_gt_buffer_pool_node *reloc_pool; /** relocation pool for -EDEADLK handling */
> > -       struct intel_context *reloc_context;
> > -
> >         u64 invalid_flags; /** Set of execobj.flags that are invalid */
> >
> >         u64 batch_len; /** Length of batch within object */
> > @@ -1035,8 +1027,6 @@ static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
> >
> >  static void eb_destroy(const struct i915_execbuffer *eb)
> >  {
> > -       GEM_BUG_ON(eb->reloc_cache.rq);
> > -
> >         if (eb->lut_size > 0)
> >                 kfree(eb->buckets);
> >  }
> > @@ -1048,14 +1038,6 @@ relocation_target(const struct drm_i915_gem_relocation_entry *reloc,
> >         return gen8_canonical_addr((int)reloc->delta + target->node.start);
> >  }
> >
> > -static void reloc_cache_clear(struct reloc_cache *cache)
> > -{
> > -       cache->rq = NULL;
> > -       cache->rq_cmd = NULL;
> > -       cache->pool = NULL;
> > -       cache->rq_size = 0;
> > -}
> > -
> >  static void reloc_cache_init(struct reloc_cache *cache,
> >                              struct drm_i915_private *i915)
> >  {
> > @@ -1068,7 +1050,6 @@ static void reloc_cache_init(struct reloc_cache *cache,
> >         cache->has_fence = cache->graphics_ver < 4;
> >         cache->needs_unfenced = INTEL_INFO(i915)->unfenced_needs_alignment;
> >         cache->node.flags = 0;
> > -       reloc_cache_clear(cache);
> >  }
> >
> >  static inline void *unmask_page(unsigned long p)
> > @@ -1090,48 +1071,10 @@ static inline struct i915_ggtt *cache_to_ggtt(struct reloc_cache *cache)
> >         return &i915->ggtt;
> >  }
> >
> > -static void reloc_cache_put_pool(struct i915_execbuffer *eb, struct reloc_cache *cache)
> > -{
> > -       if (!cache->pool)
> > -               return;
> > -
> > -       /*
> > -        * This is a bit nasty, normally we keep objects locked until the end
> > -        * of execbuffer, but we already submit this, and have to unlock before
> > -        * dropping the reference. Fortunately we can only hold 1 pool node at
> > -        * a time, so this should be harmless.
> > -        */
> > -       i915_gem_ww_unlock_single(cache->pool->obj);
> > -       intel_gt_buffer_pool_put(cache->pool);
> > -       cache->pool = NULL;
> > -}
> > -
> > -static void reloc_gpu_flush(struct i915_execbuffer *eb, struct reloc_cache *cache)
> > -{
> > -       struct drm_i915_gem_object *obj = cache->rq->batch->obj;
> > -
> > -       GEM_BUG_ON(cache->rq_size >= obj->base.size / sizeof(u32));
> > -       cache->rq_cmd[cache->rq_size] = MI_BATCH_BUFFER_END;
> > -
> > -       i915_gem_object_flush_map(obj);
> > -       i915_gem_object_unpin_map(obj);
> > -
> > -       intel_gt_chipset_flush(cache->rq->engine->gt);
> > -
> > -       i915_request_add(cache->rq);
> > -       reloc_cache_put_pool(eb, cache);
> > -       reloc_cache_clear(cache);
> > -
> > -       eb->reloc_pool = NULL;
> > -}
> > -
> >  static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer *eb)
> >  {
> >         void *vaddr;
> >
> > -       if (cache->rq)
> > -               reloc_gpu_flush(eb, cache);
> > -
> >         if (!cache->vaddr)
> >                 return;
> >
> > @@ -1313,295 +1256,6 @@ static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
> >                 *addr = value;
> >  }
> >
> > -static int reloc_move_to_gpu(struct i915_request *rq, struct i915_vma *vma)
> > -{
> > -       struct drm_i915_gem_object *obj = vma->obj;
> > -       int err;
> > -
> > -       assert_vma_held(vma);
> > -
> > -       if (obj->cache_dirty & ~obj->cache_coherent)
> > -               i915_gem_clflush_object(obj, 0);
> > -       obj->write_domain = 0;
> > -
> > -       err = i915_request_await_object(rq, vma->obj, true);
> > -       if (err == 0)
> > -               err = i915_vma_move_to_active(vma, rq, EXEC_OBJECT_WRITE);
> > -
> > -       return err;
> > -}
> > -
> > -static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
> > -                            struct intel_engine_cs *engine,
> > -                            struct i915_vma *vma,
> > -                            unsigned int len)
> > -{
> > -       struct reloc_cache *cache = &eb->reloc_cache;
> > -       struct intel_gt_buffer_pool_node *pool = eb->reloc_pool;
> > -       struct i915_request *rq;
> > -       struct i915_vma *batch;
> > -       u32 *cmd;
> > -       int err;
> > -
> > -       if (!pool) {
> > -               pool = intel_gt_get_buffer_pool(engine->gt, PAGE_SIZE,
> > -                                               cache->has_llc ?
> > -                                               I915_MAP_WB :
> > -                                               I915_MAP_WC);
> > -               if (IS_ERR(pool))
> > -                       return PTR_ERR(pool);
> > -       }
> > -       eb->reloc_pool = NULL;
> > -
> > -       err = i915_gem_object_lock(pool->obj, &eb->ww);
> > -       if (err)
> > -               goto err_pool;
> > -
> > -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
> > -       if (IS_ERR(cmd)) {
> > -               err = PTR_ERR(cmd);
> > -               goto err_pool;
> > -       }
> > -       intel_gt_buffer_pool_mark_used(pool);
> > -
> > -       memset32(cmd, 0, pool->obj->base.size / sizeof(u32));
> > -
> > -       batch = i915_vma_instance(pool->obj, vma->vm, NULL);
> > -       if (IS_ERR(batch)) {
> > -               err = PTR_ERR(batch);
> > -               goto err_unmap;
> > -       }
> > -
> > -       err = i915_vma_pin_ww(batch, &eb->ww, 0, 0, PIN_USER | PIN_NONBLOCK);
> > -       if (err)
> > -               goto err_unmap;
> > -
> > -       if (engine == eb->context->engine) {
> > -               rq = i915_request_create(eb->context);
> > -       } else {
> > -               struct intel_context *ce = eb->reloc_context;
> > -
> > -               if (!ce) {
> > -                       ce = intel_context_create(engine);
> > -                       if (IS_ERR(ce)) {
> > -                               err = PTR_ERR(ce);
> > -                               goto err_unpin;
> > -                       }
> > -
> > -                       i915_vm_put(ce->vm);
> > -                       ce->vm = i915_vm_get(eb->context->vm);
> > -                       eb->reloc_context = ce;
> > -               }
> > -
> > -               err = intel_context_pin_ww(ce, &eb->ww);
> > -               if (err)
> > -                       goto err_unpin;
> > -
> > -               rq = i915_request_create(ce);
> > -               intel_context_unpin(ce);
> > -       }
> > -       if (IS_ERR(rq)) {
> > -               err = PTR_ERR(rq);
> > -               goto err_unpin;
> > -       }
> > -
> > -       err = intel_gt_buffer_pool_mark_active(pool, rq);
> > -       if (err)
> > -               goto err_request;
> > -
> > -       err = reloc_move_to_gpu(rq, vma);
> > -       if (err)
> > -               goto err_request;
> > -
> > -       err = eb->engine->emit_bb_start(rq,
> > -                                       batch->node.start, PAGE_SIZE,
> > -                                       cache->graphics_ver > 5 ? 0 : I915_DISPATCH_SECURE);
> > -       if (err)
> > -               goto skip_request;
> > -
> > -       assert_vma_held(batch);
> > -       err = i915_request_await_object(rq, batch->obj, false);
> > -       if (err == 0)
> > -               err = i915_vma_move_to_active(batch, rq, 0);
> > -       if (err)
> > -               goto skip_request;
> > -
> > -       rq->batch = batch;
> > -       i915_vma_unpin(batch);
> > -
> > -       cache->rq = rq;
> > -       cache->rq_cmd = cmd;
> > -       cache->rq_size = 0;
> > -       cache->pool = pool;
> > -
> > -       /* Return with batch mapping (cmd) still pinned */
> > -       return 0;
> > -
> > -skip_request:
> > -       i915_request_set_error_once(rq, err);
> > -err_request:
> > -       i915_request_add(rq);
> > -err_unpin:
> > -       i915_vma_unpin(batch);
> > -err_unmap:
> > -       i915_gem_object_unpin_map(pool->obj);
> > -err_pool:
> > -       eb->reloc_pool = pool;
> > -       return err;
> > -}
> > -
> > -static bool reloc_can_use_engine(const struct intel_engine_cs *engine)
> > -{
> > -       return engine->class != VIDEO_DECODE_CLASS || GRAPHICS_VER(engine->i915) != 6;
> > -}
> > -
> > -static u32 *reloc_gpu(struct i915_execbuffer *eb,
> > -                     struct i915_vma *vma,
> > -                     unsigned int len)
> > -{
> > -       struct reloc_cache *cache = &eb->reloc_cache;
> > -       u32 *cmd;
> > -
> > -       if (cache->rq_size > PAGE_SIZE/sizeof(u32) - (len + 1))
> > -               reloc_gpu_flush(eb, cache);
> > -
> > -       if (unlikely(!cache->rq)) {
> > -               int err;
> > -               struct intel_engine_cs *engine = eb->engine;
> > -
> > -               /* If we need to copy for the cmdparser, we will stall anyway */
> > -               if (eb_use_cmdparser(eb))
> > -                       return ERR_PTR(-EWOULDBLOCK);
> > -
> > -               if (!reloc_can_use_engine(engine)) {
> > -                       engine = engine->gt->engine_class[COPY_ENGINE_CLASS][0];
> > -                       if (!engine)
> > -                               return ERR_PTR(-ENODEV);
> > -               }
> > -
> > -               err = __reloc_gpu_alloc(eb, engine, vma, len);
> > -               if (unlikely(err))
> > -                       return ERR_PTR(err);
> > -       }
> > -
> > -       cmd = cache->rq_cmd + cache->rq_size;
> > -       cache->rq_size += len;
> > -
> > -       return cmd;
> > -}
> > -
> > -static inline bool use_reloc_gpu(struct i915_vma *vma)
> > -{
> > -       if (DBG_FORCE_RELOC == FORCE_GPU_RELOC)
> > -               return true;
> > -
> > -       if (DBG_FORCE_RELOC)
> > -               return false;
> > -
> > -       return !dma_resv_test_signaled(vma->resv, true);
> > -}
> > -
> > -static unsigned long vma_phys_addr(struct i915_vma *vma, u32 offset)
> > -{
> > -       struct page *page;
> > -       unsigned long addr;
> > -
> > -       GEM_BUG_ON(vma->pages != vma->obj->mm.pages);
> > -
> > -       page = i915_gem_object_get_page(vma->obj, offset >> PAGE_SHIFT);
> > -       addr = PFN_PHYS(page_to_pfn(page));
> > -       GEM_BUG_ON(overflows_type(addr, u32)); /* expected dma32 */
> > -
> > -       return addr + offset_in_page(offset);
> > -}
> > -
> > -static int __reloc_entry_gpu(struct i915_execbuffer *eb,
> > -                             struct i915_vma *vma,
> > -                             u64 offset,
> > -                             u64 target_addr)
> > -{
> > -       const unsigned int ver = eb->reloc_cache.graphics_ver;
> > -       unsigned int len;
> > -       u32 *batch;
> > -       u64 addr;
> > -
> > -       if (ver >= 8)
> > -               len = offset & 7 ? 8 : 5;
> > -       else if (ver >= 4)
> > -               len = 4;
> > -       else
> > -               len = 3;
> > -
> > -       batch = reloc_gpu(eb, vma, len);
> > -       if (batch == ERR_PTR(-EDEADLK))
> > -               return -EDEADLK;
> > -       else if (IS_ERR(batch))
> > -               return false;
> > -
> > -       addr = gen8_canonical_addr(vma->node.start + offset);
> > -       if (ver >= 8) {
> > -               if (offset & 7) {
> > -                       *batch++ = MI_STORE_DWORD_IMM_GEN4;
> > -                       *batch++ = lower_32_bits(addr);
> > -                       *batch++ = upper_32_bits(addr);
> > -                       *batch++ = lower_32_bits(target_addr);
> > -
> > -                       addr = gen8_canonical_addr(addr + 4);
> > -
> > -                       *batch++ = MI_STORE_DWORD_IMM_GEN4;
> > -                       *batch++ = lower_32_bits(addr);
> > -                       *batch++ = upper_32_bits(addr);
> > -                       *batch++ = upper_32_bits(target_addr);
> > -               } else {
> > -                       *batch++ = (MI_STORE_DWORD_IMM_GEN4 | (1 << 21)) + 1;
> > -                       *batch++ = lower_32_bits(addr);
> > -                       *batch++ = upper_32_bits(addr);
> > -                       *batch++ = lower_32_bits(target_addr);
> > -                       *batch++ = upper_32_bits(target_addr);
> > -               }
> > -       } else if (ver >= 6) {
> > -               *batch++ = MI_STORE_DWORD_IMM_GEN4;
> > -               *batch++ = 0;
> > -               *batch++ = addr;
> > -               *batch++ = target_addr;
> > -       } else if (IS_I965G(eb->i915)) {
> > -               *batch++ = MI_STORE_DWORD_IMM_GEN4;
> > -               *batch++ = 0;
> > -               *batch++ = vma_phys_addr(vma, offset);
> > -               *batch++ = target_addr;
> > -       } else if (ver >= 4) {
> > -               *batch++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;
> > -               *batch++ = 0;
> > -               *batch++ = addr;
> > -               *batch++ = target_addr;
> > -       } else if (ver >= 3 &&
> > -                  !(IS_I915G(eb->i915) || IS_I915GM(eb->i915))) {
> > -               *batch++ = MI_STORE_DWORD_IMM | MI_MEM_VIRTUAL;
> > -               *batch++ = addr;
> > -               *batch++ = target_addr;
> > -       } else {
> > -               *batch++ = MI_STORE_DWORD_IMM;
> > -               *batch++ = vma_phys_addr(vma, offset);
> > -               *batch++ = target_addr;
> > -       }
> > -
> > -       return true;
> > -}
> > -
> > -static int __maybe_unused reloc_entry_gpu(struct i915_execbuffer *eb,
> > -                           struct i915_vma *vma,
> > -                           u64 offset,
> > -                           u64 target_addr)
> > -{
> > -       if (eb->reloc_cache.vaddr)
> > -               return false;
> > -
> > -       if (!use_reloc_gpu(vma))
> > -               return false;
> > -
> > -       return __reloc_entry_gpu(eb, vma, offset, target_addr);
> > -}
> > -
> >  static u64
> >  relocate_entry(struct i915_vma *vma,
> >                const struct drm_i915_gem_relocation_entry *reloc,
> > @@ -3166,8 +2820,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >         eb.exec = exec;
> >         eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
> >         eb.vma[0].vma = NULL;
> > -       eb.reloc_pool = eb.batch_pool = NULL;
> > -       eb.reloc_context = NULL;
> > +       eb.batch_pool = NULL;
> >
> >         eb.invalid_flags = __EXEC_OBJECT_UNKNOWN_FLAGS;
> >         reloc_cache_init(&eb.reloc_cache, eb.i915);
> > @@ -3265,9 +2918,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >
> >         batch = eb.batch->vma;
> >
> > -       /* All GPU relocation batches must be submitted prior to the user rq */
> > -       GEM_BUG_ON(eb.reloc_cache.rq);
> > -
> >         /* Allocate a request for this batch buffer nice and early. */
> >         eb.request = i915_request_create(eb.context);
> >         if (IS_ERR(eb.request)) {
> > @@ -3358,10 +3008,6 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >
> >         if (eb.batch_pool)
> >                 intel_gt_buffer_pool_put(eb.batch_pool);
> > -       if (eb.reloc_pool)
> > -               intel_gt_buffer_pool_put(eb.reloc_pool);
> > -       if (eb.reloc_context)
> > -               intel_context_put(eb.reloc_context);
> >  err_engine:
> >         eb_put_engine(&eb);
> >  err_context:
> > @@ -3475,7 +3121,3 @@ end:;
> >         kvfree(exec2_list);
> >         return err;
> >  }
> > -
> > -#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > -#include "selftests/i915_gem_execbuffer.c"
> > -#endif
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> > index e2fd1b61af71..c0386fb4e286 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> > +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> > @@ -38,7 +38,6 @@ selftest(gem, i915_gem_live_selftests)
> >  selftest(evict, i915_gem_evict_live_selftests)
> >  selftest(hugepages, i915_gem_huge_page_live_selftests)
> >  selftest(gem_contexts, i915_gem_context_live_selftests)
> > -selftest(gem_execbuf, i915_gem_execbuffer_live_selftests)
> >  selftest(client, i915_gem_client_blt_live_selftests)
> >  selftest(gem_migrate, i915_gem_migrate_live_selftests)
> >  selftest(reset, intel_reset_live_selftests)
> > --
> > 2.32.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
