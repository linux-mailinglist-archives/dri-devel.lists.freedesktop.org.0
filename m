Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D636EC4E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357AD6EEA5;
	Thu, 29 Apr 2021 14:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792536EEA5;
 Thu, 29 Apr 2021 14:23:21 +0000 (UTC)
IronPort-SDR: wED4FXYOTNmqptvYYltCR+7arkQoaS8KB3GClro37n0iFHynZxxZs0paeUu9DvEp3WiCQJjNSp
 CmtQzLylGtCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="197114746"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="197114746"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 07:23:20 -0700
IronPort-SDR: sIwW9qBKGoVHoGP+bAtajFVDk4Hu+fYTYUpc4Eil797O7uuTxaCXI3LErIKv8AwWNkJ8WgH7Xe
 JMjGsQfPrAwA==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="430870994"
Received: from baumgarp-mobl.ger.corp.intel.com (HELO [10.252.52.18])
 ([10.252.52.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 07:23:18 -0700
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Pass ww ctx to pin_map, v2.
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210429101036.1086461-1-maarten.lankhorst@linux.intel.com>
 <20210429101036.1086461-4-maarten.lankhorst@linux.intel.com>
 <CAM0jSHMdx8fn0a2K4xsE__NSboOqJK-pqbpXWSK82sBnWe4xDw@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <9cf411cb-6709-8a2d-9cf4-db6408105c2d@linux.intel.com>
Date: Thu, 29 Apr 2021 16:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHMdx8fn0a2K4xsE__NSboOqJK-pqbpXWSK82sBnWe4xDw@mail.gmail.com>
Content-Language: en-US
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 29-04-2021 om 15:28 schreef Matthew Auld:
> On Thu, 29 Apr 2021 at 11:10, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> This will allow us to explicitly pass the ww to pin_pages,
>> when it starts taking it.
>>
>> This allows us to finally kill off the explicit passing of ww
>> by retrieving it from the obj.
> This seems to contradict the first sentence?

Correct, this was based on a version of eviction where ww was implicitly passed.

I meant 'implicit' here; the whole line can be removed.

>
>
>> Changes since v1:
>> - Rename 'ret' to ptr, fix error handling of return ptr.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  7 +++---
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 +
>>  .../gpu/drm/i915/gem/i915_gem_object_blt.c    |  4 ++--
>>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 24 +++++++++++++++----
>>  .../drm/i915/gem/selftests/i915_gem_context.c |  8 ++++---
>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
>>  drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 ++--
>>  drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_ring.c          |  2 +-
>>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_timeline.c      |  7 +++---
>>  drivers/gpu/drm/i915/gt/intel_timeline.h      |  3 ++-
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
>>  drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +-
>>  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
>>  drivers/gpu/drm/i915/gt/selftest_rps.c        | 10 ++++----
>>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  6 ++---
>>  drivers/gpu/drm/i915/gvt/cmd_parser.c         |  4 ++--
>>  drivers/gpu/drm/i915/i915_perf.c              |  4 ++--
>>  drivers/gpu/drm/i915/selftests/igt_spinner.c  |  2 +-
>>  25 files changed, 63 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 17a87d176a67..66d24dfbd805 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -1345,7 +1345,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
>>         if (err)
>>                 goto err_pool;
>>
>> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
>> +       cmd = i915_gem_object_pin_map(pool->obj, &eb->ww, pool->type);
>>         if (IS_ERR(cmd)) {
>>                 err = PTR_ERR(cmd);
>>                 goto err_pool;
>> @@ -2494,7 +2494,8 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
>>                         goto err_shadow;
>>         }
>>
>> -       pw->shadow_map = i915_gem_object_pin_map(shadow->obj, I915_MAP_WB);
>> +       pw->shadow_map = i915_gem_object_pin_map(shadow->obj, &eb->ww,
>> +                                                I915_MAP_WB);
>>         if (IS_ERR(pw->shadow_map)) {
>>                 err = PTR_ERR(pw->shadow_map);
>>                 goto err_trampoline;
>> @@ -2505,7 +2506,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
>>
>>         pw->batch_map = ERR_PTR(-ENODEV);
>>         if (needs_clflush && i915_has_memcpy_from_wc())
>> -               pw->batch_map = i915_gem_object_pin_map(batch, I915_MAP_WC);
>> +               pw->batch_map = i915_gem_object_pin_map(batch, &eb->ww, I915_MAP_WC);
>>
>>         if (IS_ERR(pw->batch_map)) {
>>                 err = i915_gem_object_pin_pages(batch);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 8598a1c78a4c..ae2d71d76889 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -439,7 +439,7 @@ vm_access(struct vm_area_struct *area, unsigned long addr,
>>                 goto out;
>>
>>         /* As this is primarily for debugging, let's focus on simplicity */
>> -       vaddr = i915_gem_object_pin_map(obj, I915_MAP_FORCE_WC);
>> +       vaddr = i915_gem_object_pin_map(obj, &ww, I915_MAP_FORCE_WC);
>>         if (IS_ERR(vaddr)) {
>>                 err = PTR_ERR(vaddr);
>>                 goto out;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index f7a0cf1a8f24..ed6c7421af4f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -450,6 +450,7 @@ void i915_gem_object_writeback(struct drm_i915_gem_object *obj);
>>   * ERR_PTR() on error.
>>   */
>>  void *__must_check i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>> +                                          struct i915_gem_ww_ctx *ww,
>>                                            enum i915_map_type type);
>>
>>  void *__must_check i915_gem_object_pin_map_unlocked(struct drm_i915_gem_object *obj,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
>> index df8e8c18c6c9..fae18622d2da 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
>> @@ -58,7 +58,7 @@ struct i915_vma *intel_emit_vma_fill_blt(struct intel_context *ce,
>>         /* we pinned the pool, mark it as such */
>>         intel_gt_buffer_pool_mark_used(pool);
>>
>> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
>> +       cmd = i915_gem_object_pin_map(pool->obj, ww, pool->type);
>>         if (IS_ERR(cmd)) {
>>                 err = PTR_ERR(cmd);
>>                 goto out_unpin;
>> @@ -283,7 +283,7 @@ struct i915_vma *intel_emit_vma_copy_blt(struct intel_context *ce,
>>         /* we pinned the pool, mark it as such */
>>         intel_gt_buffer_pool_mark_used(pool);
>>
>> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
>> +       cmd = i915_gem_object_pin_map(pool->obj, ww, pool->type);
>>         if (IS_ERR(cmd)) {
>>                 err = PTR_ERR(cmd);
>>                 goto out_unpin;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 58e222030e10..42e867134481 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -341,6 +341,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
>>
>>  /* get, pin, and map the pages of the object into kernel space */
>>  void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>> +                             struct i915_gem_ww_ctx *ww,
>>                               enum i915_map_type type)
>>  {
>>         enum i915_map_type has_type;
>> @@ -408,13 +409,26 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>>  void *i915_gem_object_pin_map_unlocked(struct drm_i915_gem_object *obj,
>>                                        enum i915_map_type type)
>>  {
>> -       void *ret;
>> +       struct i915_gem_ww_ctx ww;
>> +       void *ptr;
>> +       int err;
>>
>> -       i915_gem_object_lock(obj, NULL);
>> -       ret = i915_gem_object_pin_map(obj, type);
>> -       i915_gem_object_unlock(obj);
>> +       i915_gem_ww_ctx_init(&ww, true);
>> +retry:
>> +       err = i915_gem_object_lock(obj, &ww);
>> +       if (!err) {
>> +               ptr = i915_gem_object_pin_map(obj, &ww, type);
>> +               if (IS_ERR(ptr))
>> +                       err = PTR_ERR(ptr);
>> +       }
>> +       if (err == -EDEADLK) {
>> +               err = i915_gem_ww_ctx_backoff(&ww);
>> +               if (!err)
>> +                       goto retry;
>> +       }
>> +       i915_gem_ww_ctx_fini(&ww);
>>
>> -       return ret;
>> +       return err ? ERR_PTR(err) : ptr;
>>  }
>>
>>  void __i915_gem_object_flush_map(struct drm_i915_gem_object *obj,
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> index fa1ae414348b..86b3489aba33 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>> @@ -893,13 +893,15 @@ static int igt_shared_ctx_exec(void *arg)
>>         return err;
>>  }
>>
>> -static int rpcs_query_batch(struct drm_i915_gem_object *rpcs, struct i915_vma *vma)
>> +static int rpcs_query_batch(struct drm_i915_gem_object *rpcs,
>> +                           struct i915_gem_ww_ctx *ww,
>> +                           struct i915_vma *vma)
>>  {
>>         u32 *cmd;
>>
>>         GEM_BUG_ON(INTEL_GEN(vma->vm->i915) < 8);
>>
>> -       cmd = i915_gem_object_pin_map(rpcs, I915_MAP_WB);
>> +       cmd = i915_gem_object_pin_map(rpcs, ww, I915_MAP_WB);
>>         if (IS_ERR(cmd))
>>                 return PTR_ERR(cmd);
>>
>> @@ -965,7 +967,7 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
>>         if (err)
>>                 goto err_vma;
>>
>> -       err = rpcs_query_batch(rpcs, vma);
>> +       err = rpcs_query_batch(rpcs, &ww, vma);
>>         if (err)
>>                 goto err_batch;
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> index dd74bc09ec88..3edf5a1cc0c0 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> @@ -120,7 +120,7 @@ static int igt_dmabuf_import(void *arg)
>>         }
>>
>>         if (0) { /* Can not yet map dmabuf */
>> -               obj_map = i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +               obj_map = i915_gem_object_pin_map(obj, NULL, I915_MAP_WB);
>>                 if (IS_ERR(obj_map)) {
>>                         err = PTR_ERR(obj_map);
>>                         pr_err("i915_gem_object_pin_map failed with err=%d\n", err);
>> diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
>> index de575fdb033f..c0b0044cb52a 100644
>> --- a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
>> +++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
>> @@ -436,7 +436,7 @@ int gen7_setup_clear_gpr_bb(struct intel_engine_cs * const engine,
>>
>>         GEM_BUG_ON(vma->obj->base.size < bv.size);
>>
>> -       batch = i915_gem_object_pin_map(vma->obj, I915_MAP_WC);
>> +       batch = i915_gem_object_pin_map(vma->obj, NULL, I915_MAP_WC);
>>         if (IS_ERR(batch))
>>                 return PTR_ERR(batch);
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 6dbdbde00f14..5a4afbbf91b2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -664,7 +664,7 @@ static int init_status_page(struct intel_engine_cs *engine)
>>         if (ret)
>>                 goto err;
>>
>> -       vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +       vaddr = i915_gem_object_pin_map(obj, &ww, I915_MAP_WB);
>>         if (IS_ERR(vaddr)) {
>>                 ret = PTR_ERR(vaddr);
>>                 goto err_unpin;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> index 47f4397095e5..49add43bd4e1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> @@ -29,7 +29,7 @@ static void dbg_poison_ce(struct intel_context *ce)
>>                 if (!i915_gem_object_trylock(obj))
>>                         return;
>>
>> -               map = i915_gem_object_pin_map(obj, type);
>> +               map = i915_gem_object_pin_map(obj, NULL, type);
>>                 if (!IS_ERR(map)) {
>>                         memset(map, CONTEXT_REDZONE, obj->base.size);
>>                         i915_gem_object_flush_map(obj);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index 9b98f9d9faa3..9c2d0a01c11f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -65,7 +65,7 @@ int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object
>>         void *vaddr;
>>
>>         type = i915_coherent_map_type(vm->i915, obj, true);
>> -       vaddr = i915_gem_object_pin_map(obj, type);
>> +       vaddr = i915_gem_object_pin_map(obj, NULL, type);
>>         if (IS_ERR(vaddr))
>>                 return PTR_ERR(vaddr);
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> index aafe2a4df496..aa0e2c40e53a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> @@ -902,7 +902,7 @@ lrc_pre_pin(struct intel_context *ce,
>>         GEM_BUG_ON(!ce->state);
>>         GEM_BUG_ON(!i915_vma_is_pinned(ce->state));
>>
>> -       *vaddr = i915_gem_object_pin_map(ce->state->obj,
>> +       *vaddr = i915_gem_object_pin_map(ce->state->obj, ww,
>>                                          i915_coherent_map_type(ce->engine->i915,
>>                                                                 ce->state->obj,
>>                                                                 false) |
>> @@ -1514,7 +1514,7 @@ void lrc_init_wa_ctx(struct intel_engine_cs *engine)
>>         if (err)
>>                 goto err;
>>
>> -       batch = i915_gem_object_pin_map(wa_ctx->vma->obj, I915_MAP_WB);
>> +       batch = i915_gem_object_pin_map(wa_ctx->vma->obj, &ww, I915_MAP_WB);
>>         if (IS_ERR(batch)) {
>>                 err = PTR_ERR(batch);
>>                 goto err_unpin;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
>> index b03e197b1d99..69d4856a2b11 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
>> @@ -53,7 +53,7 @@ static int render_state_setup(struct intel_renderstate *so,
>>         int ret = -EINVAL;
>>         u32 *d;
>>
>> -       d = i915_gem_object_pin_map(so->vma->obj, I915_MAP_WB);
>> +       d = i915_gem_object_pin_map(so->vma->obj, &so->ww, I915_MAP_WB);
>>         if (IS_ERR(d))
>>                 return PTR_ERR(d);
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
>> index 7c4d5158e03b..619f6d54e06d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
>> @@ -56,7 +56,7 @@ int intel_ring_pin(struct intel_ring *ring, struct i915_gem_ww_ctx *ww)
>>         } else {
>>                 int type = i915_coherent_map_type(vma->vm->i915, vma->obj, false);
>>
>> -               addr = i915_gem_object_pin_map(vma->obj, type);
>> +               addr = i915_gem_object_pin_map(vma->obj, ww, type);
>>         }
>>
>>         if (IS_ERR(addr)) {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> index 9585546556ee..e3903cae2d7d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> @@ -452,7 +452,7 @@ static int ring_context_init_default_state(struct intel_context *ce,
>>         struct drm_i915_gem_object *obj = ce->state->obj;
>>         void *vaddr;
>>
>> -       vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +       vaddr = i915_gem_object_pin_map(obj, ww, I915_MAP_WB);
>>         if (IS_ERR(vaddr))
>>                 return PTR_ERR(vaddr);
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
>> index f19cf6d2fa85..a9a1960f7f36 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
>> @@ -53,13 +53,14 @@ static int __timeline_active(struct i915_active *active)
>>  }
>>
>>  I915_SELFTEST_EXPORT int
>> -intel_timeline_pin_map(struct intel_timeline *timeline)
>> +intel_timeline_pin_map(struct intel_timeline *timeline,
>> +                      struct i915_gem_ww_ctx *ww)
>>  {
>>         struct drm_i915_gem_object *obj = timeline->hwsp_ggtt->obj;
>>         u32 ofs = offset_in_page(timeline->hwsp_offset);
>>         void *vaddr;
>>
>> -       vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +       vaddr = i915_gem_object_pin_map(obj, ww, I915_MAP_WB);
>>         if (IS_ERR(vaddr))
>>                 return PTR_ERR(vaddr);
>>
>> @@ -184,7 +185,7 @@ int intel_timeline_pin(struct intel_timeline *tl, struct i915_gem_ww_ctx *ww)
>>                 return 0;
>>
>>         if (!tl->hwsp_map) {
>> -               err = intel_timeline_pin_map(tl);
>> +               err = intel_timeline_pin_map(tl, ww);
>>                 if (err)
>>                         return err;
>>         }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.h b/drivers/gpu/drm/i915/gt/intel_timeline.h
>> index 57308c4d664a..dad5a60e556b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_timeline.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.h
>> @@ -98,6 +98,7 @@ intel_timeline_is_last(const struct intel_timeline *tl,
>>         return list_is_last_rcu(&rq->link, &tl->requests);
>>  }
>>
>> -I915_SELFTEST_DECLARE(int intel_timeline_pin_map(struct intel_timeline *tl));
>> +I915_SELFTEST_DECLARE(int intel_timeline_pin_map(struct intel_timeline *tl,
>> +                                                struct i915_gem_ww_ctx *ww));
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index 5a03a76bb9e2..df342b18f5ae 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -2233,7 +2233,7 @@ static int engine_wa_list_verify(struct intel_context *ce,
>>                 goto err_rq;
>>         }
>>
>> -       results = i915_gem_object_pin_map(vma->obj, I915_MAP_WB);
>> +       results = i915_gem_object_pin_map(vma->obj, NULL, I915_MAP_WB);
>>         if (IS_ERR(results)) {
>>                 err = PTR_ERR(results);
>>                 goto err_rq;
>> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
>> index e1ba03b93ffa..b5f48e8bb38f 100644
>> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
>> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
>> @@ -20,7 +20,7 @@ static int mock_timeline_pin(struct intel_timeline *tl)
>>         if (WARN_ON(!i915_gem_object_trylock(tl->hwsp_ggtt->obj)))
>>                 return -EBUSY;
>>
>> -       err = intel_timeline_pin_map(tl);
>> +       err = intel_timeline_pin_map(tl, NULL);
>>         i915_gem_object_unlock(tl->hwsp_ggtt->obj);
>>         if (err)
>>                 return err;
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>> index d8f6623524e8..84378dd775b5 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>> @@ -425,7 +425,7 @@ static int __live_lrc_state(struct intel_engine_cs *engine,
>>                 goto err_rq;
>>         }
>>
>> -       cs = i915_gem_object_pin_map(scratch->obj, I915_MAP_WB);
>> +       cs = i915_gem_object_pin_map(scratch->obj, NULL, I915_MAP_WB);
>>         if (IS_ERR(cs)) {
>>                 err = PTR_ERR(cs);
>>                 goto err_rq;
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
>> index adf7fdbc00f7..687b94028de5 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
>> @@ -83,17 +83,17 @@ create_spin_counter(struct intel_engine_cs *engine,
>>
>>         err = i915_vma_pin(vma, 0, 0, PIN_USER);
>>         if (err)
>> -               goto err_unlock;
>> -
>> -       i915_vma_lock(vma);
>> +               goto err_put;
>>
>> -       base = i915_gem_object_pin_map(obj, I915_MAP_WC);
>> +       base = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>>         if (IS_ERR(base)) {
>>                 err = PTR_ERR(base);
>>                 goto err_unpin;
>>         }
>>         cs = base;
>>
>> +       i915_vma_lock(vma);
>> +
>>         *cs++ = MI_LOAD_REGISTER_IMM(__NGPR__ * 2);
>>         for (i = 0; i < __NGPR__; i++) {
>>                 *cs++ = i915_mmio_reg_offset(CS_GPR(i));
>> @@ -137,8 +137,6 @@ create_spin_counter(struct intel_engine_cs *engine,
>>
>>  err_unpin:
>>         i915_vma_unpin(vma);
>> -err_unlock:
>> -       i915_vma_unlock(vma);
>>  err_put:
>>         i915_gem_object_put(obj);
>>         return ERR_PTR(err);
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>> index 64937ec3f2dc..1bf8e2826d7b 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>> @@ -223,7 +223,7 @@ static int check_whitelist(struct intel_context *ce)
>>         if (err)
>>                 goto out_put;
>>
>> -       vaddr = i915_gem_object_pin_map(results, I915_MAP_WB);
>> +       vaddr = i915_gem_object_pin_map(results, NULL, I915_MAP_WB);
>>         if (IS_ERR(vaddr)) {
>>                 err = PTR_ERR(vaddr);
>>                 goto out_put;
>> @@ -529,13 +529,13 @@ static int check_dirty_whitelist(struct intel_context *ce)
>>                 if (err)
>>                         goto out;
>>
>> -               cs = i915_gem_object_pin_map(batch->obj, I915_MAP_WC);
>> +               cs = i915_gem_object_pin_map(batch->obj, &ww, I915_MAP_WC);
>>                 if (IS_ERR(cs)) {
>>                         err = PTR_ERR(cs);
>>                         goto out_ctx;
>>                 }
>>
>> -               results = i915_gem_object_pin_map(scratch->obj, I915_MAP_WB);
>> +               results = i915_gem_object_pin_map(scratch->obj, &ww, I915_MAP_WB);
>>                 if (IS_ERR(results)) {
>>                         err = PTR_ERR(results);
>>                         goto out_unmap_batch;
>> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> index ca9c9e27a43d..eb804e4267d2 100644
>> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
>> @@ -1935,7 +1935,7 @@ static int perform_bb_shadow(struct parser_exec_state *s)
>>                 goto err_free_bb;
>>         }
>>
>> -       bb->va = i915_gem_object_pin_map(bb->obj, I915_MAP_WB);
>> +       bb->va = i915_gem_object_pin_map_unlocked(bb->obj, I915_MAP_WB);
>>         if (IS_ERR(bb->va)) {
>>                 ret = PTR_ERR(bb->va);
>>                 goto err_free_obj;
>> @@ -3008,7 +3008,7 @@ static int shadow_indirect_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>>                 return PTR_ERR(obj);
>>
>>         /* get the va of the shadow batch buffer */
>> -       map = i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +       map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
>>         if (IS_ERR(map)) {
>>                 gvt_vgpu_err("failed to vmap shadow indirect ctx\n");
>>                 ret = PTR_ERR(map);
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
>> index 85ad62dbabfa..62259c46d302 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -1662,7 +1662,7 @@ static int alloc_noa_wait(struct i915_perf_stream *stream)
>>                 goto out_ww;
>>         }
>>
>> -       batch = cs = i915_gem_object_pin_map(bo, I915_MAP_WB);
>> +       batch = cs = i915_gem_object_pin_map(bo, &ww, I915_MAP_WB);
>>         if (IS_ERR(batch)) {
>>                 ret = PTR_ERR(batch);
>>                 goto err_unpin;
>> @@ -1875,7 +1875,7 @@ alloc_oa_config_buffer(struct i915_perf_stream *stream,
>>         if (err)
>>                 goto out_ww;
>>
>> -       cs = i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +       cs = i915_gem_object_pin_map(obj, &ww, I915_MAP_WB);
>>         if (IS_ERR(cs)) {
>>                 err = PTR_ERR(cs);
>>                 goto out_ww;
>> diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.c b/drivers/gpu/drm/i915/selftests/igt_spinner.c
>> index 5fe397b7d1d9..b80d0089923a 100644
>> --- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
>> +++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
>> @@ -54,7 +54,7 @@ static void *igt_spinner_pin_obj(struct intel_context *ce,
>>         if (ret)
>>                 return ERR_PTR(ret);
>>
>> -       vaddr = i915_gem_object_pin_map(obj, mode);
>> +       vaddr = i915_gem_object_pin_map(obj, ww, mode);
>>
>>         if (!ww)
>>                 i915_gem_object_unlock(obj);
>> --
>> 2.31.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
