Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C696818A79
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 15:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97610E143;
	Tue, 19 Dec 2023 14:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77D710E0B1;
 Tue, 19 Dec 2023 14:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702997541; x=1734533541;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f0rmgooBvUjtMImHZwFhkx8XDfhqwm+kpLQ/k1AsXzE=;
 b=mWUW5wSqSHyX4SWbHcIGyPOVOYQ4nJph4WrOHEB4h24ijrcxSR4nwJnP
 PiW7gmzrjJzPCE1wepJB6AtXjua16c1t2aJz2Caovsk4E405wIKEm0jR4
 lCwS753qAyGooombKTY8LEAo2B6rCjsW2u6sfCv+U/he5+bjkI8ePa3+i
 B7FfQAsG4ZSLZK9iWwsbVNQmbg4U/LalF4C9U2/O6ywzz2i/rxs2CR3Y7
 Gvaz8Wv456wFmcRZVbv/mPJ4aR6zBEPpJoMwfRr82Vk5f2pK5FpbTazXk
 yQvwfZRqk/iJFGLUYRxJss2V7J6NPkChtcd+zFiW8sMNpaOk2OMWDG1l4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2498443"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2498443"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 06:52:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="810254916"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="810254916"
Received: from djbroder-mobl1.ger.corp.intel.com (HELO [10.213.192.239])
 ([10.213.192.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 06:52:17 -0800
Message-ID: <bc7f7844-0aa3-4802-b203-69d58e8be2fa@linux.intel.com>
Date: Tue, 19 Dec 2023 14:52:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Allow dmabuf mmap forwarding
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230925131638.32808-1-tvrtko.ursulin@linux.intel.com>
 <4da147e7-44bf-4d19-952d-fa3bab141f71@linux.intel.com>
 <26b9d5bf-f895-4237-85fe-04f53040c26c@amd.com>
 <7387ea98-5854-45cc-a6c5-70cfe0febb3a@linux.intel.com>
 <ae9bc39c-1724-4946-9227-ea74f05ea89e@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ae9bc39c-1724-4946-9227-ea74f05ea89e@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/12/2023 14:13, Christian König wrote:
> Am 13.12.23 um 12:46 schrieb Tvrtko Ursulin:
>>
>> Hi,
>>
>> On 12/12/2023 14:10, Christian König wrote:
>>> Hi Tvrtko,
>>>
>>> Thanks for pointing this mail out once more, I've totally missed it.
>>
>> That's okay, if it was really urgent I would have re-raised the thread 
>> earlier. :) As it stands so far it is only about acceptance test 
>> suites failing and no known real use cases affected.
>>
>>> Am 12.12.23 um 11:37 schrieb Tvrtko Ursulin:
>>>>
>>>> On 25/09/2023 14:16, Tvrtko Ursulin wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> Allow mmap forwarding for imported buffers in order to allow 
>>>>> minigbm mmap
>>>>> to work on aperture-less platforms such as Meteorlake.
>>>>>
>>>>> So far i915 did not allow mmap on imported buffers but from minigbm
>>>>> perspective that worked because of the DRM_IOCTL_I915_GEM_MMAP_GTT 
>>>>> fall-
>>>>> back would then be attempted, and would be successful.
>>>>>
>>>>> This stops working on Meteorlake since there is no aperture.
>>>>>
>>>>> Allow i915 to mmap imported buffers using forwarding via 
>>>>> dma_buf_mmap(),
>>>>> which allows the primary minigbm path of 
>>>>> DRM_IOCTL_I915_GEM_MMAP_OFFSET /
>>>>> I915_MMAP_OFFSET_WB to work.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>> 1)
>>>>> It is unclear to me if any real userspace depends on this, but 
>>>>> there are
>>>>> certainly compliance suites which fail.
>>>
>>> Well that is actually intentional, but see below.
>>>
>>>>>
>>>>> 2)
>>>>> It is also a bit unclear to me if dma_buf_mmap() is exactly 
>>>>> intended for
>>>>> this kind of use. It seems that it is, but I also found some old 
>>>>> mailing
>>>>> list discussions suggesting there might be some unresolved questions
>>>>> around VMA revocation.
>>>
>>> I actually solved those a few years back by introducing the 
>>> vma_set_file() function which standardized the dance necessary for 
>>> the dma_buf_mmap() function.
>>>
>>>>>
>>>>> 1 + 2 = RFC for now.
>>>>>
>>>>> Daniel and Christian were involved in 2) in the past so comments would
>>>>> be appreciated.
>>>>
>>>> Any comments on this one? I don't have all the historical knowledge 
>>>> of when this was maybe attempted before and what problems were hit, 
>>>> or something. So would there be downsides or it is fine to forward it.
>>>
>>> It works technically inside the kernel and Thomas Zimmerman suggested 
>>> a patch set which made it possible to use for all DRM drivers.
>>>
>>> But IIRC this patch set was rejected with the rational that while 
>>> doing an mmap() on an imported DMA-buf works when userspace actually 
>>> does this then there is a bug in userspace. The UMD doesn't seems to 
>>> be aware of the fact that the buffer is imported and so for example 
>>> needs to call dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().
>>>
>>> UMDs can trivially work around this by doing the mmap() on the 
>>> DMA-buf file descriptor instead (potentially after re-exporting it), 
>>> but the kernel really shouldn't help hide userspace bugs.
>>
>> Hm right, however why does drm_gem_shmem_mmap:
>>
>>     if (obj->import_attach) {
>>         ret = dma_buf_mmap(obj->dma_buf, vma, 0);
> 
> Honestly I have absolutely no idea.
> 
>> Isn't that allowing drivers which use the helper to to forward to 
>> dma_buf_mmap?
> 
> Yes, Daniel mentioned that some drivers did this before we found that 
> it's actually not a good idea. It could be that this code piece was 
> meant with that and we only allow it to avoid breaking UAPI.
> 
> Never the less I think we should add documentation for this.
> 
>> Maybe I am getting lost in the forest of callbacks in this area.. 
>> Because it is supposed to be about shmem objects, but drivers which 
>> use the helper and rely on common prime import look and also use 
>> drm_gem_shmem_prime_import_sg_table can get there.
> 
> I don't fully understand it either of hand.

Right, I will leave untangling the jungle of callbacks and helpers in my 
mind for later too. For now I think the rationale that the API does not 
allow correctnes via dma_buf_begin_cpu_access/end is I think good enough 
to pass on as will-not-implement. Thanks for the clarifications!

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>>
>>>>> Test-with: 20230925131539.32743-1-tvrtko.ursulin@linux.intel.com
>>>>>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 78 
>>>>> +++++++++++++++----
>>>>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
>>>>>   2 files changed, 65 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> index aa4d842d4c5a..78c84c0a8b08 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>>> @@ -5,6 +5,7 @@
>>>>>    */
>>>>>     #include <linux/anon_inodes.h>
>>>>> +#include <linux/dma-buf.h>
>>>>>   #include <linux/mman.h>
>>>>>   #include <linux/pfn_t.h>
>>>>>   #include <linux/sizes.h>
>>>>> @@ -664,6 +665,7 @@ insert_mmo(struct drm_i915_gem_object *obj, 
>>>>> struct i915_mmap_offset *mmo)
>>>>>   static struct i915_mmap_offset *
>>>>>   mmap_offset_attach(struct drm_i915_gem_object *obj,
>>>>>              enum i915_mmap_type mmap_type,
>>>>> +           bool forward_mmap,
>>>>>              struct drm_file *file)
>>>>>   {
>>>>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>>> @@ -682,6 +684,7 @@ mmap_offset_attach(struct drm_i915_gem_object 
>>>>> *obj,
>>>>>         mmo->obj = obj;
>>>>>       mmo->mmap_type = mmap_type;
>>>>> +    mmo->forward_mmap = forward_mmap;
>>>>>       drm_vma_node_reset(&mmo->vma_node);
>>>>>         err = drm_vma_offset_add(obj->base.dev->vma_offset_manager,
>>>>> @@ -714,12 +717,25 @@ mmap_offset_attach(struct drm_i915_gem_object 
>>>>> *obj,
>>>>>       return ERR_PTR(err);
>>>>>   }
>>>>>   +static bool
>>>>> +should_forward_mmap(struct drm_i915_gem_object *obj,
>>>>> +            enum i915_mmap_type mmap_type)
>>>>> +{
>>>>> +    if (!obj->base.import_attach)
>>>>> +        return false;
>>>>> +
>>>>> +    return mmap_type == I915_MMAP_TYPE_WB ||
>>>>> +           mmap_type == I915_MMAP_TYPE_WC ||
>>>>> +           mmap_type == I915_MMAP_TYPE_UC;
>>>>> +}
>>>>> +
>>>>>   static int
>>>>>   __assign_mmap_offset(struct drm_i915_gem_object *obj,
>>>>>                enum i915_mmap_type mmap_type,
>>>>>                u64 *offset, struct drm_file *file)
>>>>>   {
>>>>>       struct i915_mmap_offset *mmo;
>>>>> +    bool should_forward;
>>>>>         if (i915_gem_object_never_mmap(obj))
>>>>>           return -ENODEV;
>>>>> @@ -735,12 +751,15 @@ __assign_mmap_offset(struct 
>>>>> drm_i915_gem_object *obj,
>>>>>       if (mmap_type == I915_MMAP_TYPE_FIXED)
>>>>>           return -ENODEV;
>>>>>   +    should_forward = should_forward_mmap(obj, mmap_type);
>>>>> +
>>>>>       if (mmap_type != I915_MMAP_TYPE_GTT &&
>>>>>           !i915_gem_object_has_struct_page(obj) &&
>>>>> -        !i915_gem_object_has_iomem(obj))
>>>>> +        !i915_gem_object_has_iomem(obj) &&
>>>>> +        !should_forward)
>>>>>           return -ENODEV;
>>>>>   -    mmo = mmap_offset_attach(obj, mmap_type, file);
>>>>> +    mmo = mmap_offset_attach(obj, mmap_type, should_forward, file);
>>>>>       if (IS_ERR(mmo))
>>>>>           return PTR_ERR(mmo);
>>>>>   @@ -936,6 +955,32 @@ static struct file *mmap_singleton(struct 
>>>>> drm_i915_private *i915)
>>>>>       return file;
>>>>>   }
>>>>>   +static void
>>>>> +__vma_mmap_pgprot(struct vm_area_struct *vma, enum i915_mmap_type 
>>>>> mmap_type)
>>>>> +{
>>>>> +    const pgprot_t pgprot =vm_get_page_prot(vma->vm_flags);
>>>>> +
>>>>> +    switch (mmap_type) {
>>>>> +    case I915_MMAP_TYPE_WC:
>>>>> +        vma->vm_page_prot = pgprot_writecombine(pgprot);
>>>>> +        break;
>>>>> +    case I915_MMAP_TYPE_FIXED:
>>>>> +        GEM_WARN_ON(1);
>>>>> +        fallthrough;
>>>>> +    case I915_MMAP_TYPE_WB:
>>>>> +        vma->vm_page_prot = pgprot;
>>>>> +        break;
>>>>> +    case I915_MMAP_TYPE_UC:
>>>>> +        vma->vm_page_prot = pgprot_noncached(pgprot);
>>>>> +        break;
>>>>> +    case I915_MMAP_TYPE_GTT:
>>>>> +        vma->vm_page_prot = pgprot_writecombine(pgprot);
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>> +    vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>> +}
>>>>> +
>>>>>   static int
>>>>>   i915_gem_object_mmap(struct drm_i915_gem_object *obj,
>>>>>                struct i915_mmap_offset *mmo,
>>>>> @@ -953,6 +998,20 @@ i915_gem_object_mmap(struct 
>>>>> drm_i915_gem_object *obj,
>>>>>           vm_flags_clear(vma, VM_MAYWRITE);
>>>>>       }
>>>>>   +    /* dma-buf import */
>>>>> +    if (mmo && mmo->forward_mmap) {
>>>>> +        __vma_mmap_pgprot(vma, mmo->mmap_type);
>>>>> +        vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP 
>>>>> | VM_IO);
>>>>> +
>>>>> +        /*
>>>>> +         * Don't have our vm_ops to drop the reference in this 
>>>>> case so
>>>>> +         * drop it now and if object goes away userspace will fault.
>>>>> +         */
>>>>> +        i915_gem_object_put(mmo->obj);
>>>>> +
>>>>> +        return dma_buf_mmap(obj->base.dma_buf, vma, 0);
>>>>> +    }
>>>>> +
>>>>>       anon = mmap_singleton(to_i915(dev));
>>>>>       if (IS_ERR(anon)) {
>>>>>           i915_gem_object_put(obj);
>>>>> @@ -982,34 +1041,25 @@ i915_gem_object_mmap(struct 
>>>>> drm_i915_gem_object *obj,
>>>>>         vma->vm_private_data = mmo;
>>>>>   +    __vma_mmap_pgprot(vma, mmo->mmap_type);
>>>>> +
>>>>>       switch (mmo->mmap_type) {
>>>>>       case I915_MMAP_TYPE_WC:
>>>>> -        vma->vm_page_prot =
>>>>> - pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>           vma->vm_ops = &vm_ops_cpu;
>>>>>           break;
>>>>> -
>>>>>       case I915_MMAP_TYPE_FIXED:
>>>>>           GEM_WARN_ON(1);
>>>>>           fallthrough;
>>>>>       case I915_MMAP_TYPE_WB:
>>>>> -        vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>>>>>           vma->vm_ops = &vm_ops_cpu;
>>>>>           break;
>>>>> -
>>>>>       case I915_MMAP_TYPE_UC:
>>>>> -        vma->vm_page_prot =
>>>>> - pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>>>>>           vma->vm_ops = &vm_ops_cpu;
>>>>>           break;
>>>>> -
>>>>>       case I915_MMAP_TYPE_GTT:
>>>>> -        vma->vm_page_prot =
>>>>> - pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>           vma->vm_ops = &vm_ops_gtt;
>>>>>           break;
>>>>>       }
>>>>> -    vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>>         return 0;
>>>>>   }
>>>>> @@ -1084,7 +1134,7 @@ int i915_gem_fb_mmap(struct 
>>>>> drm_i915_gem_object *obj, struct vm_area_struct *vma
>>>>>       } else {
>>>>>           /* handle stolen and smem objects */
>>>>>           mmap_type = i915_ggtt_has_aperture(ggtt) ? 
>>>>> I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
>>>>> -        mmo = mmap_offset_attach(obj, mmap_type, NULL);
>>>>> +        mmo = mmap_offset_attach(obj, mmap_type, false, NULL);
>>>>>           if (IS_ERR(mmo))
>>>>>               return PTR_ERR(mmo);
>>>>>       }
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>> index 0c5cdab278b6..b4f86fa020aa 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>> @@ -225,6 +225,7 @@ struct i915_mmap_offset {
>>>>>       struct drm_vma_offset_node vma_node;
>>>>>       struct drm_i915_gem_object *obj;
>>>>>       enum i915_mmap_type mmap_type;
>>>>> +    bool forward_mmap;
>>>>>         struct rb_node offset;
>>>>>   };
>>>
> 
