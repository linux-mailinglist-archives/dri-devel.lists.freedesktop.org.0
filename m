Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D112B07A62
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB3110E750;
	Wed, 16 Jul 2025 15:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FF6510E293;
 Wed, 16 Jul 2025 15:53:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE59B113E;
 Wed, 16 Jul 2025 08:53:32 -0700 (PDT)
Received: from [10.57.86.212] (unknown [10.57.86.212])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B03C53F694;
 Wed, 16 Jul 2025 08:53:36 -0700 (PDT)
Message-ID: <e65b31c6-ed4a-401b-a131-181fba62a092@arm.com>
Date: Wed, 16 Jul 2025 16:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/panthor: Add support for atomic page table
 updates
To: Caterina Shablia <caterina.shablia@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <d4a6208b-a4a4-451f-9799-7b9f5fb20c37@arm.com> <2813151.QOukoFCf94@xps>
 <2150426.BFZWjSADLM@xps>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <2150426.BFZWjSADLM@xps>
Content-Type: text/plain; charset=UTF-8
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

On 15/07/2025 17:09, Caterina Shablia wrote:
> El martes, 15 de julio de 2025 17:08:09 (hora de verano de Europa central), 
> Caterina Shablia escribió:
>> El viernes, 11 de julio de 2025 15:30:21 (hora de verano de Europa central),
>> Steven Price escribió:
>>> On 07/07/2025 18:04, Caterina Shablia wrote:
>>>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>>>
>>>> Move the lock/flush_mem operations around the gpuvm_sm_map() calls so
>>>> we can implement true atomic page updates, where any access in the
>>>> locked range done by the GPU has to wait for the page table updates
>>>> to land before proceeding.
>>>>
>>>> This is needed for vkQueueBindSparse(), so we can replace the dummy
>>>> page mapped over the entire object by actual BO backed pages in an
>>>> atomic
>>>> way.
>>>>
>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
>>>> ---
>>>>
>>>>  drivers/gpu/drm/panthor/panthor_mmu.c | 65 +++++++++++++++++++++++++--
>>>>  1 file changed, 62 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
>>>> b/drivers/gpu/drm/panthor/panthor_mmu.c index b39ea6acc6a9..9caaba03c5eb
>>>> 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>>> @@ -387,6 +387,15 @@ struct panthor_vm {
>>>>
>>>>  	 * flagged as faulty as a result.
>>>>  	 */
>>>>  	
>>>>  	bool unhandled_fault;
>>>>
>>>> +
>>>> +	/** @locked_region: Information about the currently locked region
>>>> currently. */ +	struct {
>>>> +		/** @locked_region.start: Start of the locked region.
>>
>> */
>>
>>>> +		u64 start;
>>>> +
>>>> +		/** @locked_region.size: Size of the locked region. */
>>>> +		u64 size;
>>>> +	} locked_region;
>>>>
>>>>  };
>>>>  
>>>>  /**
>>>>
>>>> @@ -775,6 +784,10 @@ int panthor_vm_active(struct panthor_vm *vm)
>>>>
>>>>  	}
>>>>  	
>>>>  	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab,
>>
>> transcfg,
>>
>>>>  	vm->memattr);>
>>>>
>>>> +	if (!ret && vm->locked_region.size) {
>>>> +		lock_region(ptdev, vm->as.id, vm->locked_region.start,
>>>> vm->locked_region.size); +		ret = wait_ready(ptdev, vm-
>>>
>>> as.id);
>>>
>>>> +	}
>>>
>>> Do we need to do this? It seems odd to restore a MMU context and
>>> immediately set a lock region. Is there a good reason we can't just
>>> WARN_ON if there's a lock region set in panthor_vm_idle()?
>>
>> So IIUC, when things are otherwise idle and we do a vm_bind, the vm will be
>> inactive, in which case we're not going to poke the mmu to inform it of the
>> locked region, because it literally is not aware of this vm. Now if in the
>> meanwhile something submits a job and activates the vm, we need to inform
>> the mmu of the locked region, as vm_bind job might still be going on. I
>> don't see why panthor_vm_idle while a region is locked would be a problem?
>> That can arise e.g. when a job completes but there's a concurrent vm_bind
>> going on?
>>> I think we need to briefly take vm->op_lock to ensure synchronisation
>>> but that doesn't seem a big issue. Or perhaps there's a good reason that
>>> I'm missing?
>>
>> I think you're right, all other accesses to locked_region are guarded by
>> op_lock. GPU job submit poke vm_active concurrently with vm_bind jobs doing
>> region {,un}locks.
>>
>>>>  out_make_active:
>>>>  	if (!ret) {
>>>>
>>>> @@ -902,6 +915,9 @@ static int panthor_vm_unmap_pages(struct panthor_vm
>>>> *vm, u64 iova, u64 size)>
>>>>
>>>>  	struct io_pgtable_ops *ops = vm->pgtbl_ops;
>>>>  	u64 offset = 0;
>>>>
>>>> +	drm_WARN_ON(&ptdev->base,
>>>> +		    (iova < vm->locked_region.start) ||
>>>> +		    (iova + size > vm->locked_region.start + vm-
>>>
>>> locked_region.size));
>>>
>>>>  	drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm-
>>>
>>> as.id,
>>>
>>>>  	iova, size);
>>>>  	
>>>>  	while (offset < size) {
>>>>
>>>> @@ -915,13 +931,12 @@ static int panthor_vm_unmap_pages(struct
>>>> panthor_vm
>>>> *vm, u64 iova, u64 size)>
>>>>
>>>>  				iova + offset + unmapped_sz,
>>>>  				iova + offset + pgsize * pgcount,
>>>>  				iova, iova + size);
>>>>
>>>> -			panthor_vm_flush_range(vm, iova, offset +
>>
>> unmapped_sz);
>>
>>>>  			return  -EINVAL;
>>>>  		
>>>>  		}
>>>>  		offset += unmapped_sz;
>>>>  	
>>>>  	}
>>>>
>>>> -	return panthor_vm_flush_range(vm, iova, size);
>>>> +	return 0;
>>>>
>>>>  }
>>>>  
>>>>  static int
>>>>
>>>> @@ -938,6 +953,10 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64
>>>> iova,
>>>> int prot,>
>>>>
>>>>  	if (!size)
>>>>  	
>>>>  		return 0;
>>>>
>>>> +	drm_WARN_ON(&ptdev->base,
>>>> +		    (iova < vm->locked_region.start) ||
>>>> +		    (iova + size > vm->locked_region.start + vm-
>>>
>>> locked_region.size));
>>>
>>>> +
>>>>
>>>>  	for_each_sgtable_dma_sg(sgt, sgl, count) {
>>>>  	
>>>>  		dma_addr_t paddr = sg_dma_address(sgl);
>>>>  		size_t len = sg_dma_len(sgl);
>>>>
>>>> @@ -985,7 +1004,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64
>>>> iova,
>>>> int prot,>
>>>>
>>>>  		offset = 0;
>>>>  	
>>>>  	}
>>>>
>>>> -	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);
>>>> +	return 0;
>>>>
>>>>  }
>>>>  
>>>>  static int flags_to_prot(u32 flags)
>>>>
>>>> @@ -1654,6 +1673,38 @@ static const char *access_type_name(struct
>>>> panthor_device *ptdev,>
>>>>
>>>>  	}
>>>>  
>>>>  }
>>>>
>>>> +static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64
>>>> size) +{
>>>> +	struct panthor_device *ptdev = vm->ptdev;
>>>> +	int ret = 0;
>>>> +
>>>> +	mutex_lock(&ptdev->mmu->as.slots_lock);
>>>> +	drm_WARN_ON(&ptdev->base, vm->locked_region.start ||
>>>> vm->locked_region.size); +	vm->locked_region.start = start;
>>>> +	vm->locked_region.size = size;
>>>> +	if (vm->as.id >= 0) {
>>>> +		lock_region(ptdev, vm->as.id, start, size);
>>>> +		ret = wait_ready(ptdev, vm->as.id);
>>>> +	}
>>>> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void panthor_vm_unlock_region(struct panthor_vm *vm)
>>>> +{
>>>> +	struct panthor_device *ptdev = vm->ptdev;
>>>> +
>>>> +	mutex_lock(&ptdev->mmu->as.slots_lock);
>>>> +	if (vm->as.id >= 0) {
>>>> +		write_cmd(ptdev, vm->as.id, AS_COMMAND_FLUSH_MEM);
>>>> +		drm_WARN_ON(&ptdev->base, wait_ready(ptdev, vm-
>>>
>>> as.id));
>>>
>>>> +	}
>>>> +	vm->locked_region.start = 0;
>>>> +	vm->locked_region.size = 0;
>>>> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
>>>> +}
>>>
>>> Do we need to include a drm_dev_enter() somewhere here? I note that
>>> panthor_vm_flush_range() has one and you've effectively replaced that
>>> code with the above.
>>
>> Looks like we should.
> Actually not sure. I think I'm either misunderstanding what drm_dev_enter is, 
> or there's other things that should be doing it. Notably 
> panthor_mmu_as_{en,dis}able or their callers aren't doing drm_dev_enter, yet 
> are poking the hw, so that seems to me like that code also runs the risk of 
> poking the hw while/after it was unplugged, but I'm not confident in my 
> understanding at all. I guess an extra drm_dev_enter here or there isn't going 
> to harm anyone as it's recurrent so I'll put one around the call to 
> lock_region in panthor_vm_lock_region as well.

In theory all paths that touch GPU registers should be wrapped in a
drm_dev_enter() somewhere so that we don't poke the hardware when it's
gone. Of course in practice we don't really have hotpluggable hardware
so this isn't exactly well tested. So there might be existing bugs. As
you say it is possible to nest drm_dev_enter() so that might be easiest
in this case.

We do have the 'automotive' GPUs (not currently supported by panthor[1])
which support virtualisation where it is potentially possible to "rip
out" the GPU from a guest. So I suspect in the future we will start to
care more about this.

Thanks,
Steve

[1] I think the only public version is Mali-G78AE which is a job manager
GPU which would be panfrost anyway. I've no idea what the roadmap is for
future GPUs.

>>> Thanks,
>>> Steve
>>>
>>>> +
>>>>
>>>>  static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32
>>>>  status) {
>>>>  
>>>>  	bool has_unhandled_faults = false;
>>>>
>>>> @@ -2179,6 +2230,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct
>>>> panthor_vm_op_ctx *op,>
>>>>
>>>>  	mutex_lock(&vm->op_lock);
>>>>  	vm->op_ctx = op;
>>>>
>>>> +
>>>> +	ret = panthor_vm_lock_region(vm, op->va.addr, op->va.range);
>>>> +	if (ret)
>>>> +		goto out;
>>>> +
>>>>
>>>>  	switch (op_type) {
>>>>  	
>>>>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
>>>>  		if (vm->unusable) {
>>>>
>>>> @@ -2199,6 +2255,9 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct
>>>> panthor_vm_op_ctx *op,>
>>>>
>>>>  		break;
>>>>  	
>>>>  	}
>>>>
>>>> +	panthor_vm_unlock_region(vm);
>>>> +
>>>>
>>>> +out:
>>>>  	if (ret && flag_vm_unusable_on_failure)
>>>>  	
>>>>  		vm->unusable = true;
> 
> 
> 
> 

