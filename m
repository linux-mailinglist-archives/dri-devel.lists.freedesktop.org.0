Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C535EAC6E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918D010E473;
	Mon, 26 Sep 2022 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84FB10E473;
 Mon, 26 Sep 2022 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664209576; x=1695745576;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=78D/VfzaHcAMYrvO0k7dMz+MOAx3LeBez1Umkv+Xeg0=;
 b=hEpY021drGcbkiO85GlCdxR98e4Y7OysarNFs9ALIEHoa+OrzUEFUF4u
 yJ0+6BZO1qLXo42O7oBkWY38/WAdWXgLWqbr+PoQsXMxFEJG2LHZilDav
 63QJhOq9MgxoS+vKP51MX9S1RooZl3N+Eogm2/ib7a7d9l2Y2o5ZHzxYn
 Q6kdtMijJBMUhhup+fw7FhtbYDYoXc/Tr3J9T1+l8lPm/R7YuS5rxla51
 kskiozGxK2iWQTDDaMkVkkfD3yQSAZxEl+lj4hTkp36Ra8bVIiXhYWXc2
 DAWVNypb8jiGUMgazVEcDVN6uJxNZwkZ791e12ZF4oDX9rmf4qeTAyhN3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="280800368"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="280800368"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:26:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="623389608"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="623389608"
Received: from tahirmuh-mobl1.ger.corp.intel.com (HELO [10.213.192.246])
 ([10.213.192.246])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:26:14 -0700
Message-ID: <38313280-24ed-e778-421c-cc1358e61a35@linux.intel.com>
Date: Mon, 26 Sep 2022 17:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [RFC v4 13/14] drm/i915/vm_bind: Skip vma_lookup for
 persistent vmas
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-14-niranjana.vishwanathapura@intel.com>
 <99bbab8d-42e7-2aed-d64a-5bd61dfc9fd6@linux.intel.com>
 <20220924043010.GJ28263@nvishwa1-DESK>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220924043010.GJ28263@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/09/2022 05:30, Niranjana Vishwanathapura wrote:
> On Fri, Sep 23, 2022 at 09:40:20AM +0100, Tvrtko Ursulin wrote:
>>
>> On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
>>> vma_lookup is tied to segment of the object instead of section
>>
>> Can be, but not only that. It would be more accurate to say it is 
>> based of gtt views.
> 
> Yah, but new code is also based on gtt views, the only difference
> is that now there can be multiple mappings (at different VAs)
> to the same gtt_view of the object.
> 
>>
>>> of VA space. Hence, it do not support aliasing (ie., multiple
>>> bindings to the same section of the object).
>>> Skip vma_lookup for persistent vmas as it supports aliasing.
>>
>> What's broken without this patch? If something is, should it go 
>> somewhere earlier in the series? If so should be mentioned in the 
>> commit message.
>>
>> Or is it just a performance optimisation to skip unused tracking? If 
>> so should also be mentioned in the commit message.
>>
> 
> No, it is not a performance optimization.
> The vma_lookup is based on the fact that there can be only one mapping
> for a given gtt_view of the object.
> So, it was looking for gtt_view to find the mapping.
> 
> But now, as I mentioned above, there can be multiple mappings for a
> given gtt_view of the object. Hence the vma_lookup method won't work
> here. Hence, it is being skipped for persistent vmas.

Right, so in that case isn't this patch too late in the series? Granted 
you only allow _userspace_ to use vm bind in 14/14, but the kernel 
infrastructure is there and if there was a selftest it would be able to 
fail without this patch, no?

>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |  2 +-
>>>  .../drm/i915/display/intel_plane_initial.c    |  2 +-
>>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 +-
>>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>>  .../gpu/drm/i915/gem/selftests/huge_pages.c   | 16 +++----
>>>  .../i915/gem/selftests/i915_gem_client_blt.c  |  2 +-
>>>  .../drm/i915/gem/selftests/i915_gem_context.c | 12 ++---
>>>  .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
>>>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  6 ++-
>>>  .../drm/i915/gem/selftests/igt_gem_utils.c    |  2 +-
>>>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  2 +-
>>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>>>  drivers/gpu/drm/i915/gt/intel_gt.c            |  2 +-
>>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
>>>  drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 +-
>>>  drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
>>>  drivers/gpu/drm/i915/gt/intel_ring.c          |  2 +-
>>>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  4 +-
>>>  drivers/gpu/drm/i915/gt/intel_timeline.c      |  2 +-
>>>  drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +-
>>>  drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  4 +-
>>>  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 16 +++----
>>>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  6 +--
>>>  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
>>>  .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
>>>  drivers/gpu/drm/i915/gt/selftest_rps.c        |  2 +-
>>>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  2 +-
>>>  drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>>>  drivers/gpu/drm/i915/i915_perf.c              |  2 +-
>>>  drivers/gpu/drm/i915/i915_vma.c               | 26 +++++++----
>>>  drivers/gpu/drm/i915/i915_vma.h               |  3 +-
>>>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 44 +++++++++----------
>>>  drivers/gpu/drm/i915/selftests/i915_request.c |  4 +-
>>>  drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
>>>  drivers/gpu/drm/i915/selftests/igt_spinner.c  |  2 +-
>>>  .../drm/i915/selftests/intel_memory_region.c  |  2 +-
>>>  37 files changed, 106 insertions(+), 93 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c 
>>> b/drivers/gpu/drm/i915/display/intel_fb_pin.c
>>> index c86e5d4ee016..5a718b247bb3 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
>>> @@ -47,7 +47,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
>>>          goto err;
>>>      }
>>> -    vma = i915_vma_instance(obj, vm, view);
>>> +    vma = i915_vma_instance(obj, vm, view, false);
>>
>> Hey why are you touching all the legacy paths? >:P
>>
>>>      if (IS_ERR(vma))
>>>          goto err;
>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c 
>>> b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> index 76be796df255..7667e2faa3fb 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> @@ -136,7 +136,7 @@ initial_plane_vma(struct drm_i915_private *i915,
>>>          goto err_obj;
>>>      }
>>> -    vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          goto err_obj;
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> index 363b2a788cdf..0ee43cb601b5 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> @@ -876,7 +876,7 @@ static struct i915_vma *eb_lookup_vma(struct 
>>> i915_execbuffer *eb, u32 handle)
>>>              }
>>>          }
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              i915_gem_object_put(obj);
>>>              return vma;
>>> @@ -2208,7 +2208,7 @@ shadow_batch_pin(struct i915_execbuffer *eb,
>>>      struct i915_vma *vma;
>>>      int err;
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          return vma;
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> index 3087731cc0c0..4468603af6f1 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> @@ -252,7 +252,7 @@ static struct i915_vma *vm_bind_get_vma(struct 
>>> i915_address_space *vm,
>>>      view.type = I915_GTT_VIEW_PARTIAL;
>>>      view.partial.offset = va->offset >> PAGE_SHIFT;
>>>      view.partial.size = va->length >> PAGE_SHIFT;
>>> -    vma = i915_vma_instance(obj, vm, &view);
>>> +    vma = i915_vma_instance(obj, vm, &view, true);
>>
>> This is the only caller passing "true". Leave i915_vma_instance as is, 
>> and add i915_vma_instance_persistent(), and drop 90% of the patch?
> 
> Yah, makes sense. Will fix it.
> 
>>
>>>      if (IS_ERR(vma))
>>>          return vma;
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>>> index c570cf780079..6e13a83d0e36 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>>> @@ -454,7 +454,7 @@ static int 
>>> igt_mock_exhaust_device_supported_pages(void *arg)
>>>                  goto out_put;
>>>              }
>>> -            vma = i915_vma_instance(obj, &ppgtt->vm, NULL);
>>> +            vma = i915_vma_instance(obj, &ppgtt->vm, NULL, false);
>>>              if (IS_ERR(vma)) {
>>>                  err = PTR_ERR(vma);
>>>                  goto out_put;
>>> @@ -522,7 +522,7 @@ static int igt_mock_memory_region_huge_pages(void 
>>> *arg)
>>>                  goto out_region;
>>>              }
>>> -            vma = i915_vma_instance(obj, &ppgtt->vm, NULL);
>>> +            vma = i915_vma_instance(obj, &ppgtt->vm, NULL, false);
>>>              if (IS_ERR(vma)) {
>>>                  err = PTR_ERR(vma);
>>>                  goto out_put;
>>> @@ -614,7 +614,7 @@ static int igt_mock_ppgtt_misaligned_dma(void *arg)
>>>          /* Force the page size for this object */
>>>          obj->mm.page_sizes.sg = page_size;
>>> -        vma = i915_vma_instance(obj, &ppgtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ppgtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out_unpin;
>>> @@ -746,7 +746,7 @@ static int igt_mock_ppgtt_huge_fill(void *arg)
>>>          list_add(&obj->st_link, &objects);
>>> -        vma = i915_vma_instance(obj, &ppgtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ppgtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              break;
>>> @@ -924,7 +924,7 @@ static int igt_mock_ppgtt_64K(void *arg)
>>>               */
>>>              obj->mm.page_sizes.sg &= ~I915_GTT_PAGE_SIZE_2M;
>>> -            vma = i915_vma_instance(obj, &ppgtt->vm, NULL);
>>> +            vma = i915_vma_instance(obj, &ppgtt->vm, NULL, false);
>>>              if (IS_ERR(vma)) {
>>>                  err = PTR_ERR(vma);
>>>                  goto out_object_unpin;
>>> @@ -1092,7 +1092,7 @@ static int __igt_write_huge(struct 
>>> intel_context *ce,
>>>      struct i915_vma *vma;
>>>      int err;
>>> -    vma = i915_vma_instance(obj, ce->vm, NULL);
>>> +    vma = i915_vma_instance(obj, ce->vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          return PTR_ERR(vma);
>>> @@ -1587,7 +1587,7 @@ static int igt_tmpfs_fallback(void *arg)
>>>      __i915_gem_object_flush_map(obj, 0, 64);
>>>      i915_gem_object_unpin_map(obj);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto out_put;
>>> @@ -1654,7 +1654,7 @@ static int igt_shrink_thp(void *arg)
>>>          goto out_vm;
>>>      }
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto out_put;
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>>> index 9a6a6b5b722b..e6c6c73bf80e 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>>> @@ -282,7 +282,7 @@ __create_vma(struct tiled_blits *t, size_t size, 
>>> bool lmem)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, t->ce->vm, NULL);
>>> +    vma = i915_vma_instance(obj, t->ce->vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          i915_gem_object_put(obj);
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>>> index c6ad67b90e8a..570f74df9bef 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
>>> @@ -426,7 +426,7 @@ static int gpu_fill(struct intel_context *ce,
>>>      GEM_BUG_ON(obj->base.size > ce->vm->total);
>>>      GEM_BUG_ON(!intel_engine_can_store_dword(ce->engine));
>>> -    vma = i915_vma_instance(obj, ce->vm, NULL);
>>> +    vma = i915_vma_instance(obj, ce->vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          return PTR_ERR(vma);
>>> @@ -930,7 +930,7 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
>>>      if (GRAPHICS_VER(i915) < 8)
>>>          return -EINVAL;
>>> -    vma = i915_vma_instance(obj, ce->vm, NULL);
>>> +    vma = i915_vma_instance(obj, ce->vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          return PTR_ERR(vma);
>>> @@ -938,7 +938,7 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
>>>      if (IS_ERR(rpcs))
>>>          return PTR_ERR(rpcs);
>>> -    batch = i915_vma_instance(rpcs, ce->vm, NULL);
>>> +    batch = i915_vma_instance(rpcs, ce->vm, NULL, false);
>>>      if (IS_ERR(batch)) {
>>>          err = PTR_ERR(batch);
>>>          goto err_put;
>>> @@ -1522,7 +1522,7 @@ static int write_to_scratch(struct 
>>> i915_gem_context *ctx,
>>>      intel_gt_chipset_flush(engine->gt);
>>>      vm = i915_gem_context_get_eb_vm(ctx);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto out_vm;
>>> @@ -1599,7 +1599,7 @@ static int read_from_scratch(struct 
>>> i915_gem_context *ctx,
>>>          const u32 GPR0 = engine->mmio_base + 0x600;
>>>          vm = i915_gem_context_get_eb_vm(ctx);
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out_vm;
>>> @@ -1635,7 +1635,7 @@ static int read_from_scratch(struct 
>>> i915_gem_context *ctx,
>>>          /* hsw: register access even to 3DPRIM! is protected */
>>>          vm = i915_vm_get(&engine->gt->ggtt->vm);
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out_vm;
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> index fe6c37fd7859..fc235e1e6c12 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> @@ -201,7 +201,7 @@ static int __igt_lmem_pages_migrate(struct 
>>> intel_gt *gt,
>>>          return PTR_ERR(obj);
>>>      if (vm) {
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out_put;
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> index b73c91aa5450..e07c91dc33ba 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> @@ -546,7 +546,8 @@ static int make_obj_busy(struct 
>>> drm_i915_gem_object *obj)
>>>          struct i915_gem_ww_ctx ww;
>>>          int err;
>>> -        vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &engine->gt->ggtt->vm,
>>> +                    NULL, false);
>>>          if (IS_ERR(vma))
>>>              return PTR_ERR(vma);
>>> @@ -1587,7 +1588,8 @@ static int __igt_mmap_gpu(struct 
>>> drm_i915_private *i915,
>>>          struct i915_vma *vma;
>>>          struct i915_gem_ww_ctx ww;
>>> -        vma = i915_vma_instance(obj, engine->kernel_context->vm, NULL);
>>> +        vma = i915_vma_instance(obj, engine->kernel_context->vm,
>>> +                    NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out_unmap;
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
>>> index 3c55e77b0f1b..4184e198c824 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
>>> @@ -91,7 +91,7 @@ igt_emit_store_dw(struct i915_vma *vma,
>>>      intel_gt_chipset_flush(vma->vm->gt);
>>> -    vma = i915_vma_instance(obj, vma->vm, NULL);
>>> +    vma = i915_vma_instance(obj, vma->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err;
>>> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c 
>>> b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>>> index 1bb766c79dcb..a0af2aa50533 100644
>>> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>>> @@ -395,7 +395,7 @@ gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
>>>      pd->pt.base->base.resv = i915_vm_resv_get(&ppgtt->base.vm);
>>>      pd->pt.base->shares_resv_from = &ppgtt->base.vm;
>>> -    ppgtt->vma = i915_vma_instance(pd->pt.base, &ggtt->vm, NULL);
>>> +    ppgtt->vma = i915_vma_instance(pd->pt.base, &ggtt->vm, NULL, 
>>> false);
>>>      if (IS_ERR(ppgtt->vma)) {
>>>          err = PTR_ERR(ppgtt->vma);
>>>          ppgtt->vma = NULL;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index 2ddcad497fa3..8146bf811d0f 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -1001,7 +1001,7 @@ static int init_status_page(struct 
>>> intel_engine_cs *engine)
>>>      i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
>>> -    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          ret = PTR_ERR(vma);
>>>          goto err_put;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> index b367cfff48d5..8a78c6cec7b4 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -441,7 +441,7 @@ static int intel_gt_init_scratch(struct intel_gt 
>>> *gt, unsigned int size)
>>>          return PTR_ERR(obj);
>>>      }
>>> -    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          ret = PTR_ERR(vma);
>>>          goto err_unref;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> index 401202391649..c9bc33149ad7 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> @@ -628,7 +628,7 @@ __vm_create_scratch_for_read(struct 
>>> i915_address_space *vm, unsigned long size)
>>>      i915_gem_object_set_cache_coherency(obj, I915_CACHING_CACHED);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_gem_object_put(obj);
>>>          return vma;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c 
>>> b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> index 3955292483a6..570d097a2492 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> @@ -1029,7 +1029,7 @@ __lrc_alloc_state(struct intel_context *ce, 
>>> struct intel_engine_cs *engine)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_gem_object_put(obj);
>>>          return vma;
>>> @@ -1685,7 +1685,7 @@ static int lrc_create_wa_ctx(struct 
>>> intel_engine_cs *engine)
>>>      if (IS_ERR(obj))
>>>          return PTR_ERR(obj);
>>> -    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c 
>>> b/drivers/gpu/drm/i915/gt/intel_renderstate.c
>>> index 5121e6dc2fa5..bc7a2d4421db 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
>>> @@ -157,7 +157,7 @@ int intel_renderstate_init(struct 
>>> intel_renderstate *so,
>>>          if (IS_ERR(obj))
>>>              return PTR_ERR(obj);
>>> -        so->vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>>> +        so->vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, 
>>> NULL, false);
>>>          if (IS_ERR(so->vma)) {
>>>              err = PTR_ERR(so->vma);
>>>              goto err_obj;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c 
>>> b/drivers/gpu/drm/i915/gt/intel_ring.c
>>> index 15ec64d881c4..24c8b738a394 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
>>> @@ -130,7 +130,7 @@ static struct i915_vma *create_ring_vma(struct 
>>> i915_ggtt *ggtt, int size)
>>>      if (vm->has_read_only)
>>>          i915_gem_object_set_readonly(obj);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          goto err;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c 
>>> b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>> index d5d6f1fadcae..5e93a4052140 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>>> @@ -551,7 +551,7 @@ alloc_context_vma(struct intel_engine_cs *engine)
>>>      if (IS_IVYBRIDGE(i915))
>>>          i915_gem_object_set_cache_coherency(obj, I915_CACHE_L3_LLC);
>>> -    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_obj;
>>> @@ -1291,7 +1291,7 @@ static struct i915_vma *gen7_ctx_vma(struct 
>>> intel_engine_cs *engine)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, engine->gt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, engine->gt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_gem_object_put(obj);
>>>          return ERR_CAST(vma);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c 
>>> b/drivers/gpu/drm/i915/gt/intel_timeline.c
>>> index b9640212d659..31f56996f100 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
>>> @@ -28,7 +28,7 @@ static struct i915_vma *hwsp_alloc(struct intel_gt 
>>> *gt)
>>>      i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
>>> -    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          i915_gem_object_put(obj);
>>> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c 
>>> b/drivers/gpu/drm/i915/gt/mock_engine.c
>>> index c0637bf799a3..6f3578308395 100644
>>> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
>>> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
>>> @@ -46,7 +46,7 @@ static struct i915_vma *create_ring_vma(struct 
>>> i915_ggtt *ggtt, int size)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          goto err;
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
>>> index 1b75f478d1b8..16fcaba7c980 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
>>> @@ -85,7 +85,7 @@ static struct i915_vma *create_empty_batch(struct 
>>> intel_context *ce)
>>>      i915_gem_object_flush_map(obj);
>>> -    vma = i915_vma_instance(obj, ce->vm, NULL);
>>> +    vma = i915_vma_instance(obj, ce->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_unpin;
>>> @@ -222,7 +222,7 @@ static struct i915_vma *create_nop_batch(struct 
>>> intel_context *ce)
>>>      i915_gem_object_flush_map(obj);
>>> -    vma = i915_vma_instance(obj, ce->vm, NULL);
>>> +    vma = i915_vma_instance(obj, ce->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_unpin;
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c 
>>> b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>> index 1e08b2473b99..643ffcb3964a 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>> @@ -1000,7 +1000,7 @@ static int live_timeslice_preempt(void *arg)
>>>      if (IS_ERR(obj))
>>>          return PTR_ERR(obj);
>>> -    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_obj;
>>> @@ -1307,7 +1307,7 @@ static int live_timeslice_queue(void *arg)
>>>      if (IS_ERR(obj))
>>>          return PTR_ERR(obj);
>>> -    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_obj;
>>> @@ -1562,7 +1562,7 @@ static int live_busywait_preempt(void *arg)
>>>          goto err_obj;
>>>      }
>>> -    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_map;
>>> @@ -2716,7 +2716,7 @@ static int create_gang(struct intel_engine_cs 
>>> *engine,
>>>          goto err_ce;
>>>      }
>>> -    vma = i915_vma_instance(obj, ce->vm, NULL);
>>> +    vma = i915_vma_instance(obj, ce->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_obj;
>>> @@ -3060,7 +3060,7 @@ create_gpr_user(struct intel_engine_cs *engine,
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, result->vm, NULL);
>>> +    vma = i915_vma_instance(obj, result->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_gem_object_put(obj);
>>>          return vma;
>>> @@ -3130,7 +3130,7 @@ static struct i915_vma *create_global(struct 
>>> intel_gt *gt, size_t sz)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_gem_object_put(obj);
>>>          return vma;
>>> @@ -3159,7 +3159,7 @@ create_gpr_client(struct intel_engine_cs *engine,
>>>      if (IS_ERR(ce))
>>>          return ERR_CAST(ce);
>>> -    vma = i915_vma_instance(global->obj, ce->vm, NULL);
>>> +    vma = i915_vma_instance(global->obj, ce->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto out_ce;
>>> @@ -3501,7 +3501,7 @@ static int smoke_submit(struct preempt_smoke 
>>> *smoke,
>>>          struct i915_address_space *vm;
>>>          vm = i915_gem_context_get_eb_vm(ctx);
>>> -        vma = i915_vma_instance(batch, vm, NULL);
>>> +        vma = i915_vma_instance(batch, vm, NULL, false);
>>>          i915_vm_put(vm);
>>>          if (IS_ERR(vma))
>>>              return PTR_ERR(vma);
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c 
>>> b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> index 7f3bb1d34dfb..0b021a32d0e0 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> @@ -147,13 +147,13 @@ hang_create_request(struct hang *h, struct 
>>> intel_engine_cs *engine)
>>>      h->obj = obj;
>>>      h->batch = vaddr;
>>> -    vma = i915_vma_instance(h->obj, vm, NULL);
>>> +    vma = i915_vma_instance(h->obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_vm_put(vm);
>>>          return ERR_CAST(vma);
>>>      }
>>> -    hws = i915_vma_instance(h->hws, vm, NULL);
>>> +    hws = i915_vma_instance(h->hws, vm, NULL, false);
>>>      if (IS_ERR(hws)) {
>>>          i915_vm_put(vm);
>>>          return ERR_CAST(hws);
>>> @@ -1474,7 +1474,7 @@ static int __igt_reset_evict_vma(struct 
>>> intel_gt *gt,
>>>          }
>>>      }
>>> -    arg.vma = i915_vma_instance(obj, vm, NULL);
>>> +    arg.vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(arg.vma)) {
>>>          err = PTR_ERR(arg.vma);
>>>          pr_err("[%s] VMA instance failed: %d!\n", engine->name, err);
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c 
>>> b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>> index 82d3f8058995..32867049b3bf 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>> @@ -938,7 +938,7 @@ create_user_vma(struct i915_address_space *vm, 
>>> unsigned long size)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_gem_object_put(obj);
>>>          return vma;
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c 
>>> b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
>>> index 70f9ac1ec2c7..7e9361104620 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
>>> @@ -17,7 +17,7 @@ static struct i915_vma *create_wally(struct 
>>> intel_engine_cs *engine)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, engine->gt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, engine->gt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          i915_gem_object_put(obj);
>>>          return vma;
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c 
>>> b/drivers/gpu/drm/i915/gt/selftest_rps.c
>>> index cfb4708dd62e..327558828bef 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_rps.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
>>> @@ -78,7 +78,7 @@ create_spin_counter(struct intel_engine_cs *engine,
>>>      end = obj->base.size / sizeof(u32) - 1;
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_put;
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c 
>>> b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>>> index 67a9aab801dd..d893ea763ac6 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
>>> @@ -122,7 +122,7 @@ read_nonprivs(struct intel_context *ce)
>>>      i915_gem_object_flush_map(result);
>>>      i915_gem_object_unpin_map(result);
>>> -    vma = i915_vma_instance(result, &engine->gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(result, &engine->gt->ggtt->vm, NULL, 
>>> false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_obj;
>>> @@ -389,7 +389,7 @@ static struct i915_vma *create_batch(struct 
>>> i915_address_space *vm)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_obj;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> index bac06e3d6f2c..d56b1f82250c 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> @@ -737,7 +737,7 @@ struct i915_vma *intel_guc_allocate_vma(struct 
>>> intel_guc *guc, u32 size)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma))
>>>          goto err;
>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>>> b/drivers/gpu/drm/i915/i915_gem.c
>>> index 88df9a35e0fe..bb6b1f56836f 100644
>>> --- a/drivers/gpu/drm/i915/i915_gem.c
>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>>> @@ -934,7 +934,7 @@ i915_gem_object_ggtt_pin_ww(struct 
>>> drm_i915_gem_object *obj,
>>>      }
>>>  new_vma:
>>> -    vma = i915_vma_instance(obj, &ggtt->vm, view);
>>> +    vma = i915_vma_instance(obj, &ggtt->vm, view, false);
>>>      if (IS_ERR(vma))
>>>          return vma;
>>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>>> b/drivers/gpu/drm/i915/i915_perf.c
>>> index 0defbb43ceea..d8f5ef9fd00f 100644
>>> --- a/drivers/gpu/drm/i915/i915_perf.c
>>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>>> @@ -1920,7 +1920,7 @@ alloc_oa_config_buffer(struct i915_perf_stream 
>>> *stream,
>>>      oa_bo->vma = i915_vma_instance(obj,
>>>                         &stream->engine->gt->ggtt->vm,
>>> -                       NULL);
>>> +                       NULL, false);
>>>      if (IS_ERR(oa_bo->vma)) {
>>>          err = PTR_ERR(oa_bo->vma);
>>>          goto out_ww;
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>> b/drivers/gpu/drm/i915/i915_vma.c
>>> index 24f171588f56..ef709a61fd54 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>> @@ -110,7 +110,8 @@ static void __i915_vma_retire(struct i915_active 
>>> *ref)
>>>  static struct i915_vma *
>>>  vma_create(struct drm_i915_gem_object *obj,
>>>         struct i915_address_space *vm,
>>> -       const struct i915_gtt_view *view)
>>> +       const struct i915_gtt_view *view,
>>> +       bool persistent)
>>>  {
>>>      struct i915_vma *pos = ERR_PTR(-E2BIG);
>>>      struct i915_vma *vma;
>>> @@ -197,6 +198,9 @@ vma_create(struct drm_i915_gem_object *obj,
>>>          __set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
>>>      }
>>> +    if (persistent)
>>> +        goto skip_rb_insert;
>>
>> Oh so you don't use the gtt_view's fully at all. I now have 
>> reservations whether that was the right approach. Since you are not 
>> using the existing rb tree tracking I mean..
>>
>> You know if a vma is persistent right? So you could have just added 
>> special case for persistent vmas to __i915_vma_get_pages and still 
>> call intel_partial_pages from there. Maybe union over struct 
>> i915_gtt_view in i915_vma for either the view or struct 
>> intel_partial_info for persistent ones.
>>
> 
> We are using the gtt_view fully in this patch for persistent vmas.

I guess yours and mine definition of fully are different. :)

> But as mentioned above, now we have support multiple mappings
> for the same gtt_view of the object. For this, the current
> vma_lookup() falls short. So, we are skipping it.

I get it - but then, having only now noticed how it will be used, I am 
less convinced touching the ggtt_view code was the right approach.

What about what I proposed above? That you just add code to 
__i915_vma_get_pages, which in case of a persistent VMA would call 
intel_partial_pages from there.

If that works I think it's cleaner and we'd just revert the ggtt_view to 
gtt_view rename.

Regards,

Tvrtko

> 
> Regards,
> Niranjana
> 
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>>      rb = NULL;
>>>      p = &obj->vma.tree.rb_node;
>>>      while (*p) {
>>> @@ -221,6 +225,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>>      rb_link_node(&vma->obj_node, rb, p);
>>>      rb_insert_color(&vma->obj_node, &obj->vma.tree);
>>> +skip_rb_insert:
>>>      if (i915_vma_is_ggtt(vma))
>>>          /*
>>>           * We put the GGTT vma at the start of the vma-list, followed
>>> @@ -279,6 +284,7 @@ i915_vma_lookup(struct drm_i915_gem_object *obj,
>>>   * @obj: parent &struct drm_i915_gem_object to be mapped
>>>   * @vm: address space in which the mapping is located
>>>   * @view: additional mapping requirements
>>> + * @persistent: Whether the vma is persistent
>>>   *
>>>   * i915_vma_instance() looks up an existing VMA of the @obj in the 
>>> @vm with
>>>   * the same @view characteristics. If a match is not found, one is 
>>> created.
>>> @@ -290,19 +296,22 @@ i915_vma_lookup(struct drm_i915_gem_object *obj,
>>>  struct i915_vma *
>>>  i915_vma_instance(struct drm_i915_gem_object *obj,
>>>            struct i915_address_space *vm,
>>> -          const struct i915_gtt_view *view)
>>> +          const struct i915_gtt_view *view,
>>> +          bool persistent)
>>>  {
>>> -    struct i915_vma *vma;
>>> +    struct i915_vma *vma = NULL;
>>>      GEM_BUG_ON(!kref_read(&vm->ref));
>>> -    spin_lock(&obj->vma.lock);
>>> -    vma = i915_vma_lookup(obj, vm, view);
>>> -    spin_unlock(&obj->vma.lock);
>>> +    if (!persistent) {
>>> +        spin_lock(&obj->vma.lock);
>>> +        vma = i915_vma_lookup(obj, vm, view);
>>> +        spin_unlock(&obj->vma.lock);
>>> +    }
>>>      /* vma_create() will resolve the race if another creates the vma */
>>>      if (unlikely(!vma))
>>> -        vma = vma_create(obj, vm, view);
>>> +        vma = vma_create(obj, vm, view, persistent);
>>>      GEM_BUG_ON(!IS_ERR(vma) && i915_vma_compare(vma, vm, view));
>>>      return vma;
>>> @@ -1704,7 +1713,8 @@ static void release_references(struct i915_vma 
>>> *vma, struct intel_gt *gt,
>>>      spin_lock(&obj->vma.lock);
>>>      list_del(&vma->obj_link);
>>> -    if (!RB_EMPTY_NODE(&vma->obj_node))
>>> +    if (!i915_vma_is_persistent(vma) &&
>>> +        !RB_EMPTY_NODE(&vma->obj_node))
>>>          rb_erase(&vma->obj_node, &obj->vma.tree);
>>>      spin_unlock(&obj->vma.lock);
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>> b/drivers/gpu/drm/i915/i915_vma.h
>>> index 3a47db2d85f5..b8e805c6532f 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.h
>>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>>> @@ -43,7 +43,8 @@
>>>  struct i915_vma *
>>>  i915_vma_instance(struct drm_i915_gem_object *obj,
>>>            struct i915_address_space *vm,
>>> -          const struct i915_gtt_view *view);
>>> +          const struct i915_gtt_view *view,
>>> +          bool persistent);
>>>  void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned 
>>> int flags);
>>>  #define I915_VMA_RELEASE_MAP BIT(0)
>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c 
>>> b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>>> index e050a2de5fd1..d8ffbdf91498 100644
>>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>>> @@ -390,7 +390,7 @@ static void close_object_list(struct list_head 
>>> *objects,
>>>      list_for_each_entry_safe(obj, on, objects, st_link) {
>>>          struct i915_vma *vma;
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (!IS_ERR(vma))
>>>              ignored = i915_vma_unbind_unlocked(vma);
>>> @@ -452,7 +452,7 @@ static int fill_hole(struct i915_address_space *vm,
>>>                      u64 aligned_size = round_up(obj->base.size,
>>>                                      min_alignment);
>>> -                    vma = i915_vma_instance(obj, vm, NULL);
>>> +                    vma = i915_vma_instance(obj, vm, NULL, false);
>>>                      if (IS_ERR(vma))
>>>                          continue;
>>> @@ -492,7 +492,7 @@ static int fill_hole(struct i915_address_space *vm,
>>>                      u64 aligned_size = round_up(obj->base.size,
>>>                                      min_alignment);
>>> -                    vma = i915_vma_instance(obj, vm, NULL);
>>> +                    vma = i915_vma_instance(obj, vm, NULL, false);
>>>                      if (IS_ERR(vma))
>>>                          continue;
>>> @@ -531,7 +531,7 @@ static int fill_hole(struct i915_address_space *vm,
>>>                      u64 aligned_size = round_up(obj->base.size,
>>>                                      min_alignment);
>>> -                    vma = i915_vma_instance(obj, vm, NULL);
>>> +                    vma = i915_vma_instance(obj, vm, NULL, false);
>>>                      if (IS_ERR(vma))
>>>                          continue;
>>> @@ -571,7 +571,7 @@ static int fill_hole(struct i915_address_space *vm,
>>>                      u64 aligned_size = round_up(obj->base.size,
>>>                                      min_alignment);
>>> -                    vma = i915_vma_instance(obj, vm, NULL);
>>> +                    vma = i915_vma_instance(obj, vm, NULL, false);
>>>                      if (IS_ERR(vma))
>>>                          continue;
>>> @@ -653,7 +653,7 @@ static int walk_hole(struct i915_address_space *vm,
>>>          if (IS_ERR(obj))
>>>              break;
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto err_put;
>>> @@ -728,7 +728,7 @@ static int pot_hole(struct i915_address_space *vm,
>>>      if (IS_ERR(obj))
>>>          return PTR_ERR(obj);
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_obj;
>>> @@ -837,7 +837,7 @@ static int drunk_hole(struct i915_address_space *vm,
>>>              break;
>>>          }
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto err_obj;
>>> @@ -920,7 +920,7 @@ static int __shrink_hole(struct 
>>> i915_address_space *vm,
>>>          list_add(&obj->st_link, &objects);
>>> -        vma = i915_vma_instance(obj, vm, NULL);
>>> +        vma = i915_vma_instance(obj, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              break;
>>> @@ -1018,7 +1018,7 @@ static int shrink_boom(struct 
>>> i915_address_space *vm,
>>>          if (IS_ERR(purge))
>>>              return PTR_ERR(purge);
>>> -        vma = i915_vma_instance(purge, vm, NULL);
>>> +        vma = i915_vma_instance(purge, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto err_purge;
>>> @@ -1041,7 +1041,7 @@ static int shrink_boom(struct 
>>> i915_address_space *vm,
>>>          vm->fault_attr.interval = 1;
>>>          atomic_set(&vm->fault_attr.times, -1);
>>> -        vma = i915_vma_instance(explode, vm, NULL);
>>> +        vma = i915_vma_instance(explode, vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto err_explode;
>>> @@ -1088,7 +1088,7 @@ static int misaligned_case(struct 
>>> i915_address_space *vm, struct intel_memory_re
>>>          return PTR_ERR(obj);
>>>      }
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err_put;
>>> @@ -1560,7 +1560,7 @@ static int igt_gtt_reserve(void *arg)
>>>          }
>>>          list_add(&obj->st_link, &objects);
>>> -        vma = i915_vma_instance(obj, &ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ggtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out;
>>> @@ -1606,7 +1606,7 @@ static int igt_gtt_reserve(void *arg)
>>>          list_add(&obj->st_link, &objects);
>>> -        vma = i915_vma_instance(obj, &ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ggtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out;
>>> @@ -1636,7 +1636,7 @@ static int igt_gtt_reserve(void *arg)
>>>          struct i915_vma *vma;
>>>          u64 offset;
>>> -        vma = i915_vma_instance(obj, &ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ggtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out;
>>> @@ -1783,7 +1783,7 @@ static int igt_gtt_insert(void *arg)
>>>          list_add(&obj->st_link, &objects);
>>> -        vma = i915_vma_instance(obj, &ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ggtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out;
>>> @@ -1809,7 +1809,7 @@ static int igt_gtt_insert(void *arg)
>>>      list_for_each_entry(obj, &objects, st_link) {
>>>          struct i915_vma *vma;
>>> -        vma = i915_vma_instance(obj, &ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ggtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out;
>>> @@ -1829,7 +1829,7 @@ static int igt_gtt_insert(void *arg)
>>>          struct i915_vma *vma;
>>>          u64 offset;
>>> -        vma = i915_vma_instance(obj, &ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ggtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out;
>>> @@ -1882,7 +1882,7 @@ static int igt_gtt_insert(void *arg)
>>>          list_add(&obj->st_link, &objects);
>>> -        vma = i915_vma_instance(obj, &ggtt->vm, NULL);
>>> +        vma = i915_vma_instance(obj, &ggtt->vm, NULL, false);
>>>          if (IS_ERR(vma)) {
>>>              err = PTR_ERR(vma);
>>>              goto out;
>>> @@ -2091,7 +2091,7 @@ static int igt_cs_tlb(void *arg)
>>>      }
>>>      i915_gem_object_set_cache_coherency(out, I915_CACHING_CACHED);
>>> -    vma = i915_vma_instance(out, vm, NULL);
>>> +    vma = i915_vma_instance(out, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto out_put_out;
>>> @@ -2131,7 +2131,7 @@ static int igt_cs_tlb(void *arg)
>>>              memset32(result, STACK_MAGIC, PAGE_SIZE / sizeof(u32));
>>> -            vma = i915_vma_instance(bbe, vm, NULL);
>>> +            vma = i915_vma_instance(bbe, vm, NULL, false);
>>>              if (IS_ERR(vma)) {
>>>                  err = PTR_ERR(vma);
>>>                  goto end;
>>> @@ -2203,7 +2203,7 @@ static int igt_cs_tlb(void *arg)
>>>                  goto end;
>>>              }
>>> -            vma = i915_vma_instance(act, vm, NULL);
>>> +            vma = i915_vma_instance(act, vm, NULL, false);
>>>              if (IS_ERR(vma)) {
>>>                  kfree(vma_res);
>>>                  err = PTR_ERR(vma);
>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c 
>>> b/drivers/gpu/drm/i915/selftests/i915_request.c
>>> index 818a4909c1f3..297c1d4ebf44 100644
>>> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
>>> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
>>> @@ -961,7 +961,7 @@ static struct i915_vma *empty_batch(struct 
>>> drm_i915_private *i915)
>>>      intel_gt_chipset_flush(to_gt(i915));
>>> -    vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
>>> +    vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err;
>>> @@ -1100,7 +1100,7 @@ static struct i915_vma *recursive_batch(struct 
>>> drm_i915_private *i915)
>>>      if (IS_ERR(obj))
>>>          return ERR_CAST(obj);
>>> -    vma = i915_vma_instance(obj, to_gt(i915)->vm, NULL);
>>> +    vma = i915_vma_instance(obj, to_gt(i915)->vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto err;
>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c 
>>> b/drivers/gpu/drm/i915/selftests/i915_vma.c
>>> index 71b52d5efef4..3899c2252de3 100644
>>> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
>>> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
>>> @@ -68,7 +68,7 @@ checked_vma_instance(struct drm_i915_gem_object *obj,
>>>      struct i915_vma *vma;
>>>      bool ok = true;
>>> -    vma = i915_vma_instance(obj, vm, view);
>>> +    vma = i915_vma_instance(obj, vm, view, false);
>>>      if (IS_ERR(vma))
>>>          return vma;
>>> diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.c 
>>> b/drivers/gpu/drm/i915/selftests/igt_spinner.c
>>> index 0c22594ae274..6901f94ff076 100644
>>> --- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
>>> +++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
>>> @@ -47,7 +47,7 @@ static void *igt_spinner_pin_obj(struct 
>>> intel_context *ce,
>>>      void *vaddr;
>>>      int ret;
>>> -    *vma = i915_vma_instance(obj, ce->vm, NULL);
>>> +    *vma = i915_vma_instance(obj, ce->vm, NULL, false);
>>>      if (IS_ERR(*vma))
>>>          return ERR_CAST(*vma);
>>> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c 
>>> b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>>> index 3b18e5905c86..551d0c958a3b 100644
>>> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>>> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>>> @@ -745,7 +745,7 @@ static int igt_gpu_write(struct i915_gem_context 
>>> *ctx,
>>>      if (!order)
>>>          return -ENOMEM;
>>> -    vma = i915_vma_instance(obj, vm, NULL);
>>> +    vma = i915_vma_instance(obj, vm, NULL, false);
>>>      if (IS_ERR(vma)) {
>>>          err = PTR_ERR(vma);
>>>          goto out_free;
