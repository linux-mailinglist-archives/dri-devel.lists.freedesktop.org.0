Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7290E637ED8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 19:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538CB10E0BA;
	Thu, 24 Nov 2022 18:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0BE010E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 18:12:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45D7623A;
 Thu, 24 Nov 2022 10:12:26 -0800 (PST)
Received: from [10.57.71.118] (unknown [10.57.71.118])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DEAB3F587;
 Thu, 24 Nov 2022 10:12:18 -0800 (PST)
Message-ID: <c8c0b700-7972-0454-81fe-bff66c626e97@arm.com>
Date: Thu, 24 Nov 2022 18:12:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/dma-helpers: Don't change vma flags
Content-Language: en-GB
To: Daniel Vetter <daniel@ffwll.ch>
References: <20221123172802.1049424-1-daniel.vetter@ffwll.ch>
 <49605c31-be89-d0f9-b4e1-577aaaaf259a@arm.com>
 <Y3+o5GCM+9GeKx64@phenom.ffwll.local>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Y3+o5GCM+9GeKx64@phenom.ffwll.local>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-11-24 17:24, Daniel Vetter wrote:
> On Thu, Nov 24, 2022 at 11:11:21AM +0000, Robin Murphy wrote:
>> On 2022-11-23 17:28, Daniel Vetter wrote:
>>> This code was added in b65e64f7ccd4 ("drm/cma: Use
>>> dma_mmap_writecombine() to mmap buffer"), but does not explain why
>>> it's needed.
>>>
>>> It should be entirely unnecessary, because remap_pfn_range(), which is
>>> what the various dma_mmap functiosn are built on top of, does already
>>> unconditionally adjust the vma flags:
>>
>> Not all dma_mmap_*() implementations use remap_pfn_range() though. For
>> instance on ARM where one set of DMA ops uses vm_map_pages(), but AFAICS not
>> all the relevant drivers would set VM_MIXEDMAP to prevent reaching the
>> BUG_ON(vma->vm_flags & VM_PFNMAP) in there.
> 
> Uh a dma_mmap which does not use VM_PFNMAP has pretty good chances of
> being busted, since that allows get_user_pages on these memory
> allocations. And I'm really not sure that's a bright idea ...
> 
> Can you please point me at these dma-ops so that I can try and understand
> what they're trying to do?

See arm_iommu_mmap_attrs(), but also one of the paths in 
iommu_dma_mmap() for both arm64 and x86. These aren't using 
remap_pfn_range() because they're mapping a potentially-disjoint set of 
arbitrary pages, not a single physically-contiguous range. And for the 
avoidance of doubt, yes, in those cases they will always be real kernel 
pages. dma_mmap_attrs() can be relied upon to do the right thing for 
whatever dma_alloc_attrs() did; what isn't reliable is trying to 
second-guess from outside exactly what that might be.

I forgot to mention also that removing the VM_DONTEXPAND line will 
seemingly just reintroduce the annoying warning spam for which we added 
it in the first place (and 59f39bfa6553 does document this same reasoning).

Thanks,
Robin.

> -Daniel
> 
>>
>> Robin.
>>
>>> https://elixir.bootlin.com/linux/v6.1-rc6/source/mm/memory.c#L2518
>>>
>>> More importantly, it does uncondtionally set VM_PFNMAP, so clearing
>>> that does not make much sense.
>>>
>>> Patch motived by discussions around enforcing VM_PFNMAP semantics for
>>> all dma-buf users, where Thomas asked why dma helpers will work with
>>> that dma_buf_mmap() contract.
>>>
>>> References: https://lore.kernel.org/dri-devel/5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de/
>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian Kï¿½nig" <christian.koenig@amd.com>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_gem_dma_helper.c | 7 ++-----
>>>    1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
>>> index 1e658c448366..637a5cc62457 100644
>>> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
>>> @@ -525,13 +525,10 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
>>>    	int ret;
>>>    	/*
>>> -	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
>>> -	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
>>> -	 * the whole buffer.
>>> +	 * Set the vm_pgoff (used as a fake buffer offset by DRM) to 0 as we
>>> +	 * want to map the whole buffer.
>>>    	 */
>>>    	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>>> -	vma->vm_flags &= ~VM_PFNMAP;
>>> -	vma->vm_flags |= VM_DONTEXPAND;
>>>    	if (dma_obj->map_noncoherent) {
>>>    		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> 
