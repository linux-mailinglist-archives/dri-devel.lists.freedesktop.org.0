Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE52DD14412
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 18:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4E410E2A3;
	Mon, 12 Jan 2026 17:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B745110E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:10:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 405CE497;
 Mon, 12 Jan 2026 09:10:12 -0800 (PST)
Received: from [10.57.11.182] (unknown [10.57.11.182])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D7BC3F694;
 Mon, 12 Jan 2026 09:10:14 -0800 (PST)
Message-ID: <42366f2d-b1ee-4e08-9734-78deaadcd7d5@arm.com>
Date: Mon, 12 Jan 2026 17:10:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/9] drm/panthor: Track the number of mmap on a BO
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-9-boris.brezillon@collabora.com>
 <c86e341d-0dd2-4a97-b047-f62f2aa64c7e@arm.com>
 <20260112153953.61eb20dc@fedora>
 <3c1b791c-f2e6-4199-af6c-920f52f4870c@arm.com>
 <20260112175931.541cc086@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260112175931.541cc086@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/01/2026 16:59, Boris Brezillon wrote:
> On Mon, 12 Jan 2026 16:49:33 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 12/01/2026 14:39, Boris Brezillon wrote:
>>> On Mon, 12 Jan 2026 12:33:33 +0000
>>> Steven Price <steven.price@arm.com> wrote:
>>>   
>>>> On 09/01/2026 13:08, Boris Brezillon wrote:  
>>>>> This will be used to order things by reclaimability.
>>>>>
>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> ---
>>>>>  drivers/gpu/drm/panthor/panthor_gem.c | 44 +++++++++++++++++++++++++--
>>>>>  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
>>>>>  2 files changed, 45 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
>>>>> index 44f05bd957e7..458d22380e96 100644
>>>>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>>>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>>>>> @@ -484,6 +484,7 @@ static void panthor_gem_print_info(struct drm_printer *p, unsigned int indent,
>>>>>  	drm_printf_indent(p, indent, "vmap_use_count=%u\n",
>>>>>  			  refcount_read(&bo->cmap.vaddr_use_count));
>>>>>  	drm_printf_indent(p, indent, "vaddr=%p\n", bo->cmap.vaddr);
>>>>> +	drm_printf_indent(p, indent, "mmap_count=%u\n", refcount_read(&bo->cmap.mmap_count));
>>>>>  }
>>>>>  
>>>>>  static int panthor_gem_pin_locked(struct drm_gem_object *obj)
>>>>> @@ -600,6 +601,13 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
>>>>>  	if (is_cow_mapping(vma->vm_flags))
>>>>>  		return -EINVAL;
>>>>>  
>>>>> +	if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
>>>>> +		dma_resv_lock(obj->resv, NULL);
>>>>> +		if (!refcount_inc_not_zero(&bo->cmap.mmap_count))
>>>>> +			refcount_set(&bo->cmap.mmap_count, 1);
>>>>> +		dma_resv_unlock(obj->resv);
>>>>> +	}
>>>>> +
>>>>>  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>>>>>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>>>>>  	if (should_map_wc(bo))
>>>>> @@ -732,10 +740,42 @@ static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
>>>>>  	return blocking_page_setup(vmf, bo, page_offset, true);
>>>>>  }
>>>>>  
>>>>> +static void panthor_gem_vm_open(struct vm_area_struct *vma)
>>>>> +{
>>>>> +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
>>>>> +
>>>>> +	/* mmap_count must have been incremented at mmap time, so it can't be
>>>>> +	 * zero here.
>>>>> +	 */
>>>>> +	if (!drm_gem_is_imported(&bo->base))
>>>>> +		drm_WARN_ON(bo->base.dev, !refcount_inc_not_zero(&bo->cmap.mmap_count));
>>>>> +
>>>>> +	drm_gem_vm_open(vma);
>>>>> +}
>>>>> +
>>>>> +static void panthor_gem_vm_close(struct vm_area_struct *vma)
>>>>> +{
>>>>> +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
>>>>> +
>>>>> +	if (drm_gem_is_imported(&bo->base))
>>>>> +		goto out;
>>>>> +
>>>>> +	if (refcount_dec_not_one(&bo->cmap.mmap_count))
>>>>> +		goto out;
>>>>> +
>>>>> +	dma_resv_lock(bo->base.resv, NULL);
>>>>> +	if (!refcount_dec_not_one(&bo->cmap.mmap_count))
>>>>> +		refcount_set(&bo->cmap.mmap_count, 0);
>>>>> +	dma_resv_unlock(bo->base.resv);    
>>>>
>>>> I don't think this logic is safe. Holding the resv_lock doesn't protect
>>>> against another thread doing a refcount_inc_not_zero() without holding
>>>> the lock.
>>>>
>>>> I think you can just replace the if() part with a refcount_dec() call,
>>>> the lock AFAICT is needed because the following patch wants to be sure
>>>> that !!mmap_count is stable when resv_lock is held.  
>>>
>>> I wish I could, but refcount_dec() doesn't let me do the 1 -> 0 without
>>> complaining :P.  
>>
>> Yeah, I misread the refcount_dec() code the first time I looked at it.
>>
>>>>
>>>> I also feel you should invert the conditino for refcount_dec_not_one,
>>>> leading to the following which I feel is easier to read:
>>>>
>>>> static void panthor_gem_vm_close(struct vm_area_struct *vma)
>>>> {
>>>> 	[...]
>>>>
>>>> 	if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
>>>> 		dma_resv_lock(bo->base.resv, NULL);
>>>> 		refcount_dec(&bo->cmap.mmap_count);
>>>> 		dma_resv_unlock(bo->base.resv);
>>>> 	}  
>>>
>>> The best I can do is:
>>>
>>>  	if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
>>>  		dma_resv_lock(bo->base.resv, NULL);
>>>  		if (!refcount_dec_not_one(&bo->cmap.mmap_count))  
>>
>> The problem is here - if another thread does an increment from 1 to 2 at
>> this point then we lose a reference count. And since you don't have to
>> hold the lock for that we have a problem.
> 
> Okay, I see what you mean now. I was considering 0 -> 1, not 1 -> 2. So
> we really need a
> 
> 		if (refcount_dec_and_test(&bo->cmap.mmap_count))
> 			/* Do nothing */;

Yes - I was just writing a longer email to say that ;)

I'm not sure if there's a better way of writing that - it does seem like
a missing function in the refcount API. I just worry it points to
refcounts being the wrong thing to use. But other than the missing
function the refcount API does work fine here.

Thanks,
Steve

>>
>>> 			refcount_set(&bo->cmap.mmap_count, 0);
>>>  		dma_resv_unlock(bo->base.resv);
>>>  	}
>>>
>>> so we only take the lock when absolutely needed, but the 1 -> 0
>>> transition still has to be done with "if (dec_not_one) set(0)".  
>>
>> It's not the holding of the lock that's concerning me - it's the fact
>> that the increment part might not be holding the lock.
>>
>> Your suggestion of "(void)refcount_dec_and_test()" would work, but it's
>> rather abusing the API. I can't help feeling this points to the refcount
>> API being the wrong thing to be using...
>>
>> Thanks,
>> Steve
>>
>>>>
>>>> 	drm_gem_object_put(&bo->base);
>>>> }  
>>
> 

