Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B04504A0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFB36EB0F;
	Mon, 15 Nov 2021 12:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ADF6EAD9;
 Mon, 15 Nov 2021 12:42:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="319641625"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="319641625"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:42:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="454012020"
Received: from ldyrga-mobl1.ger.corp.intel.com (HELO [10.249.254.10])
 ([10.249.254.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:42:48 -0800
Message-ID: <f7eed120-d956-cba4-6e0d-92b58cdef692@linux.intel.com>
Date: Mon, 15 Nov 2021 13:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/6] drm/i915: Add support for asynchronous moving
 fence waiting
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211114111218.623138-1-thomas.hellstrom@linux.intel.com>
 <20211114111218.623138-3-thomas.hellstrom@linux.intel.com>
 <7a20547f-0189-1072-ec90-9fdb9e3f5e04@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <7a20547f-0189-1072-ec90-9fdb9e3f5e04@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/15/21 13:36, Matthew Auld wrote:
> On 14/11/2021 11:12, Thomas Hellström wrote:
>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> For now, we will only allow async migration when TTM is used,
>> so the paths we care about are related to TTM.
>>
>> The mmap path is handled by having the fence in ttm_bo->moving,
>> when pinning, the binding only becomes available after the moving
>> fence is signaled, and pinning a cpu map will only work after
>> the moving fence signals.
>>
>> This should close all holes where userspace can read a buffer
>> before it's fully migrated.
>>
>> v2:
>> - Fix a couple of SPARSE warnings
>> v3:
>> - Fix a NULL pointer dereference
>>
>> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    |  7 ++--
>>   drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  6 +++
>>   .../i915/gem/selftests/i915_gem_coherency.c   |  4 +-
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    | 22 ++++++-----
>>   drivers/gpu/drm/i915/i915_vma.c               | 39 ++++++++++++++++++-
>>   drivers/gpu/drm/i915/i915_vma.h               |  3 ++
>>   drivers/gpu/drm/i915/selftests/i915_vma.c     |  4 +-
>>   8 files changed, 69 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c 
>> b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index adc3a81be9f7..5902ad0c2bd8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -265,11 +265,12 @@ static int intelfb_create(struct drm_fb_helper 
>> *helper,
>>           info->fix.smem_len = vma->node.size;
>>       }
>>   -    vaddr = i915_vma_pin_iomap(vma);
>> +    vaddr = i915_vma_pin_iomap_unlocked(vma);
>>       if (IS_ERR(vaddr)) {
>> -        drm_err(&dev_priv->drm,
>> -            "Failed to remap framebuffer into virtual memory\n");
>>           ret = PTR_ERR(vaddr);
>> +        if (ret != -EINTR && ret != -ERESTARTSYS)
>> +            drm_err(&dev_priv->drm,
>> +                "Failed to remap framebuffer into virtual memory\n");
>>           goto out_unpin;
>>       }
>>       info->screen_base = vaddr;
>> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c 
>> b/drivers/gpu/drm/i915/display/intel_overlay.c
>> index 7e3f5c6ca484..21593f3f2664 100644
>> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
>> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
>> @@ -1357,7 +1357,7 @@ static int get_registers(struct intel_overlay 
>> *overlay, bool use_phys)
>>           overlay->flip_addr = sg_dma_address(obj->mm.pages->sgl);
>>       else
>>           overlay->flip_addr = i915_ggtt_offset(vma);
>> -    overlay->regs = i915_vma_pin_iomap(vma);
>> +    overlay->regs = i915_vma_pin_iomap_unlocked(vma);
>>       i915_vma_unpin(vma);
>>         if (IS_ERR(overlay->regs)) {
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index c4f684b7cc51..49c6e55c68ce 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -418,6 +418,12 @@ void *i915_gem_object_pin_map(struct 
>> drm_i915_gem_object *obj,
>>       }
>>         if (!ptr) {
>> +        err = i915_gem_object_wait_moving_fence(obj, true);
>> +        if (err) {
>> +            ptr = ERR_PTR(err);
>> +            goto err_unpin;
>> +        }
>> +
>>           if (GEM_WARN_ON(type == I915_MAP_WC &&
>>                   !static_cpu_has(X86_FEATURE_PAT)))
>>               ptr = ERR_PTR(-ENODEV);
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
>> index 13b088cc787e..067c512961ba 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
>> @@ -101,7 +101,7 @@ static int gtt_set(struct context *ctx, unsigned 
>> long offset, u32 v)
>>         intel_gt_pm_get(vma->vm->gt);
>>   -    map = i915_vma_pin_iomap(vma);
>> +    map = i915_vma_pin_iomap_unlocked(vma);
>>       i915_vma_unpin(vma);
>>       if (IS_ERR(map)) {
>>           err = PTR_ERR(map);
>> @@ -134,7 +134,7 @@ static int gtt_get(struct context *ctx, unsigned 
>> long offset, u32 *v)
>>         intel_gt_pm_get(vma->vm->gt);
>>   -    map = i915_vma_pin_iomap(vma);
>> +    map = i915_vma_pin_iomap_unlocked(vma);
>>       i915_vma_unpin(vma);
>>       if (IS_ERR(map)) {
>>           err = PTR_ERR(map);
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> index 6d30cdfa80f3..5d54181c2145 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> @@ -125,12 +125,13 @@ static int check_partial_mapping(struct 
>> drm_i915_gem_object *obj,
>>       n = page - view.partial.offset;
>>       GEM_BUG_ON(n >= view.partial.size);
>>   -    io = i915_vma_pin_iomap(vma);
>> +    io = i915_vma_pin_iomap_unlocked(vma);
>>       i915_vma_unpin(vma);
>>       if (IS_ERR(io)) {
>> -        pr_err("Failed to iomap partial view: offset=%lu; err=%d\n",
>> -               page, (int)PTR_ERR(io));
>>           err = PTR_ERR(io);
>> +        if (err != -EINTR && err != -ERESTARTSYS)
>> +            pr_err("Failed to iomap partial view: offset=%lu; 
>> err=%d\n",
>> +                   page, err);
>>           goto out;
>>       }
>>   @@ -219,12 +220,15 @@ static int check_partial_mappings(struct 
>> drm_i915_gem_object *obj,
>>           n = page - view.partial.offset;
>>           GEM_BUG_ON(n >= view.partial.size);
>>   -        io = i915_vma_pin_iomap(vma);
>> +        io = i915_vma_pin_iomap_unlocked(vma);
>>           i915_vma_unpin(vma);
>>           if (IS_ERR(io)) {
>> -            pr_err("Failed to iomap partial view: offset=%lu; 
>> err=%d\n",
>> -                   page, (int)PTR_ERR(io));
>> -            return PTR_ERR(io);
>> +            int err = PTR_ERR(io);
>> +
>> +            if (err != -EINTR && err != -ERESTARTSYS)
>> +                pr_err("Failed to iomap partial view: offset=%lu; 
>> err=%d\n",
>> +                       page, err);
>> +            return err;
>>           }
>>             iowrite32(page, io + n * PAGE_SIZE / sizeof(*io));
>> @@ -773,7 +777,7 @@ static int gtt_set(struct drm_i915_gem_object *obj)
>>           return PTR_ERR(vma);
>>         intel_gt_pm_get(vma->vm->gt);
>> -    map = i915_vma_pin_iomap(vma);
>> +    map = i915_vma_pin_iomap_unlocked(vma);
>>       i915_vma_unpin(vma);
>>       if (IS_ERR(map)) {
>>           err = PTR_ERR(map);
>> @@ -799,7 +803,7 @@ static int gtt_check(struct drm_i915_gem_object 
>> *obj)
>>           return PTR_ERR(vma);
>>         intel_gt_pm_get(vma->vm->gt);
>> -    map = i915_vma_pin_iomap(vma);
>> +    map = i915_vma_pin_iomap_unlocked(vma);
>>       i915_vma_unpin(vma);
>>       if (IS_ERR(map)) {
>>           err = PTR_ERR(map);
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index 8781c4f61952..069f22b3cd48 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -431,6 +431,13 @@ int i915_vma_bind(struct i915_vma *vma,
>>               work->pinned = i915_gem_object_get(vma->obj);
>>           }
>>       } else {
>> +        if (vma->obj) {
>> +            int ret;
>> +
>> +            ret = i915_gem_object_wait_moving_fence(vma->obj, true);
>> +            if (ret)
>> +                return ret;
>> +        }
>>           vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, 
>> bind_flags);
>>       }
>>   @@ -455,6 +462,10 @@ void __iomem *i915_vma_pin_iomap(struct 
>> i915_vma *vma)
>>         ptr = READ_ONCE(vma->iomap);
>>       if (ptr == NULL) {
>> +        err = i915_gem_object_wait_moving_fence(vma->obj, true);
>> +        if (err)
>> +            goto err;
>> +
>>           /*
>>            * TODO: consider just using i915_gem_object_pin_map() for 
>> lmem
>>            * instead, which already supports mapping non-contiguous 
>> chunks
>> @@ -496,6 +507,25 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma 
>> *vma)
>>       return IO_ERR_PTR(err);
>>   }
>>   +void __iomem *i915_vma_pin_iomap_unlocked(struct i915_vma *vma)
>> +{
>> +    struct i915_gem_ww_ctx ww;
>> +    void __iomem *map;
>> +    int err;
>> +
>> +    for_i915_gem_ww(&ww, err, true) {
>> +        err = i915_gem_object_lock(vma->obj, &ww);
>> +        if (err)
>> +            continue;
>> +
>> +        map = i915_vma_pin_iomap(vma);
>> +    }
>> +    if (err)
>> +        map = IO_ERR_PTR(err);
>> +
>> +    return map;
>> +}
>
> What is the reason for this change? Is this strictly related to this 
> series/commit?

Yes, it's because pulling out the moving fence requires the dma_resv lock.

/Thomas


