Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996E783A2ED
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 08:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B3F10E3C9;
	Wed, 24 Jan 2024 07:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE78310E0B9;
 Wed, 24 Jan 2024 07:30:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso61044125e9.3; 
 Tue, 23 Jan 2024 23:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706081358; x=1706686158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9DRGXaVxKMFHx2hiT7iy2bNi9Kyy1UbBqRbOG7bk9EA=;
 b=HMHN+X2R7jQqpIqZARB2XiQlDLeo42Da4Flyec7hzY4+UCLhrxLQDLoGdtv27+npsH
 qRuCBbtQf4IcJjuqPnhNHGZ+P+4V5Jvd2NWTiVeY5rYUVqCB/5rrttXOYonm9ZrvCw2m
 N7CxYKk/t+1eSHGe6NzcDVsOwqGVuq2a8+Gdxqii+98HcXkN5EGrVw+OG4FrEM5Pra/m
 5Jn6EGFw2EP9KyIn+moBffgYMNFr6WMBz7rmAcfO1RVQoMEdvNQ1EHD1xh5Qx4uv1eRA
 nbxPIpSf9Cb6C9Vr63Q+Sn8V/h4XYGWfx8TIOWoBsF774NF2gMCJVboErvbXRsktiN7B
 i5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706081358; x=1706686158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9DRGXaVxKMFHx2hiT7iy2bNi9Kyy1UbBqRbOG7bk9EA=;
 b=Aq7gmfkR2HbAhz64eOMaL458zZZy2RDVYDS509aK4+Pc0fPYlL03ydmdtmErt9cCPy
 T9PRfOQXCrlSxg4PbYVpDbgKfgbmsjBVEP+VRdQmoYu2aBCBWDJgIgTHuSc4GVEa8SIs
 KZjeXp/YlXXG3TAzY7o4XQ5E2ZY2sEH35UwXRSgEeimwDvH5z84KthpLHKFCA5dZySRr
 OJBfkBj+bdldxVLYCsMvN6Wg3VyRt/p2p3/A8czuAWfE9d0UBUiCA3lJ/lVbddF3bgeq
 6dYiSlYfZrB63SysxlTx9N4HVlQPCB2q6OPfYikfv3NGjlviTjRxRnre44FwPyCQ8rEK
 8PhQ==
X-Gm-Message-State: AOJu0YyAjchOKh3dHYE7ZDlEswTjvbqXcuMtrT6/T21dQm1nH6wNARLp
 aen4YZx/ifW8VTTaZiZBU0P40/FAnyNjZux/9KKnd7pfFsa63ZfY
X-Google-Smtp-Source: AGHT+IHyzerc8ODlelT9LcIwOXuNITuEKHKrpG9psQo5pdYryIcUoR+iK8dwa6wgUjXdTp7WS5B1lg==
X-Received: by 2002:a05:600c:33a5:b0:40e:43e4:d9ca with SMTP id
 o37-20020a05600c33a500b0040e43e4d9camr560010wmp.179.1706081357705; 
 Tue, 23 Jan 2024 23:29:17 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0040e63226f6dsm303045wmq.1.2024.01.23.23.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 23:29:17 -0800 (PST)
Message-ID: <a307539f-8894-4d5f-a32d-3936e6fba65f@gmail.com>
Date: Wed, 24 Jan 2024 08:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Remove double faults once write a device pfn
Content-Language: en-US
To: "Zhou, Xianrong" <Xianrong.Zhou@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240122033210.713530-1-Xianrong.Zhou@amd.com>
 <5ed7d46b-ae26-43f2-81e0-91e3cfc0218a@amd.com>
 <MN2PR12MB4302C529B9F231F85539628EF1742@MN2PR12MB4302.namprd12.prod.outlook.com>
 <76c3658d-2256-49c6-8e4c-49555c0a350a@amd.com>
 <MN2PR12MB4302BBF634B2E3872904872BF17B2@MN2PR12MB4302.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <MN2PR12MB4302BBF634B2E3872904872BF17B2@MN2PR12MB4302.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "kherbst@redhat.com" <kherbst@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Xu, Colin" <Colin.Xu@amd.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "Yang, Philip" <Philip.Yang@amd.com>,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Li,
 Huazeng" <Huazeng.Li@amd.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "Zhang,
 GuoQing \(Sam\)" <GuoQing.Zhang@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "surenb@google.com" <surenb@google.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "nirmoy.das@intel.com" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.24 um 03:43 schrieb Zhou, Xianrong:
> [AMD Official Use Only - General]
>
>>>>> The vmf_insert_pfn_prot could cause unnecessary double faults on a
>>>>> device pfn. Because currently the vmf_insert_pfn_prot does not make
>>>>> the pfn writable so the pte entry is normally read-only or dirty
>>>>> catching.
>>>> What? How do you got to this conclusion?
>>> Sorry. I did not mention that this problem only exists on arm64 platform.
>> Ok, that makes at least a little bit more sense.
>>
>>> Because on arm64 platform the PTE_RDONLY is automatically attached to
>>> the userspace pte entries even through VM_WRITE + VM_SHARE.
>>> The  PTE_RDONLY needs to be cleared in vmf_insert_pfn_prot. However
>>> vmf_insert_pfn_prot do not make the pte writable passing false
>>> @mkwrite to insert_pfn.
>> Question is why is arm64 doing this? As far as I can see they must have some
>> hardware reason for that.
>>
>> The mkwrite parameter to insert_pfn() was added by commit
>> b2770da642540 to make insert_pfn() look more like insert_pfn_pmd() so that
>> the DAX code can insert PTEs which are writable and dirty at the same time.
>>
> This is one scenario to do so. In fact on arm64 there are many scenarios could
> be to do so. So we can let vmf_insert_pfn_prot supporting @mkwrite for drivers
> at core layer and let drivers to decide whether or not to make writable and dirty
> at one time. The patch did this. Otherwise double faults on arm64 when call
> vmf_insert_pfn_prot.

Well, that doesn't answer my question why arm64 is double faulting in 
the first place,.

So as long as this isn't sorted out I'm going to reject this patch.

Regards,
Christian.

>
>> This is a completely different use case to what you try to use it here for and
>> that looks extremely fishy to me.
>>
>> Regards,
>> Christian.
>>
>>>>> The first fault only sets up the pte entry which actually is dirty
>>>>> catching. And the second immediate fault to the pfn due to first
>>>>> dirty catching when the cpu re-execute the store instruction.
>>>> It could be that this is done to work around some hw behavior, but
>>>> not because of dirty catching.
>>>>
>>>>> Normally if the drivers call vmf_insert_pfn_prot and also supply
>>>>> 'pfn_mkwrite' callback within vm_operations_struct which requires
>>>>> the pte to be dirty catching then the vmf_insert_pfn_prot and the
>>>>> double fault are reasonable. It is not a problem.
>>>> Well, as far as I can see that behavior absolutely doesn't make sense.
>>>>
>>>> When pfn_mkwrite is requested then the driver should use PAGE_COPY,
>>>> which is exactly what VMWGFX (the only driver using dirty tracking) is
>> doing.
>>>> Everybody else uses PAGE_SHARED which should make the pte writeable
>>>> immediately.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> However the most of drivers calling vmf_insert_pfn_prot do not
>>>>> supply the 'pfn_mkwrite' callback so that the second fault is unnecessary.
>>>>>
>>>>> So just like vmf_insert_mixed and vmf_insert_mixed_mkwrite pair, we
>>>>> should also supply vmf_insert_pfn_mkwrite for drivers as well.
>>>>>
>>>>> Signed-off-by: Xianrong Zhou <Xianrong.Zhou@amd.com>
>>>>> ---
>>>>>     arch/x86/entry/vdso/vma.c                  |  3 ++-
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
>>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>>>>>     drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
>>>>>     drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>>>>>     drivers/gpu/drm/ttm/ttm_bo_vm.c            |  8 +++++---
>>>>>     drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 +++++---
>>>>>     include/drm/ttm/ttm_bo.h                   |  3 ++-
>>>>>     include/linux/mm.h                         |  2 +-
>>>>>     mm/memory.c                                | 14 +++++++++++---
>>>>>     10 files changed, 30 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
>>>>> index 7645730dc228..dd2431c2975f 100644
>>>>> --- a/arch/x86/entry/vdso/vma.c
>>>>> +++ b/arch/x86/entry/vdso/vma.c
>>>>> @@ -185,7 +185,8 @@ static vm_fault_t vvar_fault(const struct
>>>> vm_special_mapping *sm,
>>>>>               if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
>>>> {
>>>>>                       return vmf_insert_pfn_prot(vma, vmf->address,
>>>>>                                       __pa(pvti) >> PAGE_SHIFT,
>>>>> -                                   pgprot_decrypted(vma-
>>>>> vm_page_prot));
>>>>> +                                   pgprot_decrypted(vma-
>>>>> vm_page_prot),
>>>>> +                                   true);
>>>>>               }
>>>>>       } else if (sym_offset == image->sym_hvclock_page) {
>>>>>               pfn = hv_get_tsc_pfn(); diff --git
>>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> index 49a5f1c73b3e..adcb20d9e624 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> @@ -64,7 +64,7 @@ static vm_fault_t amdgpu_gem_fault(struct
>> vm_fault
>>>> *vmf)
>>>>>               }
>>>>>
>>>>>               ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>>>>> vm_page_prot,
>>>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>>>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>>>> true);
>>>>>               drm_dev_exit(idx);
>>>>>       } else {
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> index 9227f8146a58..c6f13ae6c308 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> @@ -1114,7 +1114,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault
>>>>> *vmf)
>>>>>
>>>>>       if (drm_dev_enter(dev, &idx)) {
>>>>>               ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>>>>> vm_page_prot,
>>>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>>>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>>>> true);
>>>>>               drm_dev_exit(idx);
>>>>>       } else {
>>>>>               ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
>>>>> vm_page_prot); diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> index 49c2bcbef129..7e1453762ec9 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> @@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct
>>>>> vm_fault
>>>>> *vmf)
>>>>>
>>>>>       nouveau_bo_del_io_reserve_lru(bo);
>>>>>       prot = vm_get_page_prot(vma->vm_flags);
>>>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>>>> TTM_BO_VM_NUM_PREFAULT);
>>>>> +   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>>>> TTM_BO_VM_NUM_PREFAULT,
>>>>> +true);
>>>>>       nouveau_bo_add_io_reserve_lru(bo);
>>>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags &
>>>> FAULT_FLAG_RETRY_NOWAIT))
>>>>>               return ret;
>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>> index 3fec3acdaf28..b21cf00ae162 100644
>>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>> @@ -62,7 +62,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault
>>>> *vmf)
>>>>>               goto unlock_resv;
>>>>>
>>>>>       ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>>>>> -                                  TTM_BO_VM_NUM_PREFAULT);
>>>>> +                                  TTM_BO_VM_NUM_PREFAULT, true);
>>>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags &
>>>> FAULT_FLAG_RETRY_NOWAIT))
>>>>>               goto unlock_mclk;
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c index
>>>> 4212b8c91dd4..7d14a7d267aa
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> @@ -167,6 +167,7 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>>>>      * @num_prefault: Maximum number of prefault pages. The caller
>>>>> may
>>>> want to
>>>>>      * specify this based on madvice settings and the size of the GPU object
>>>>>      * backed by the memory.
>>>>> + * @mkwrite: make the pfn or page writable
>>>>>      *
>>>>>      * This function inserts one or more page table entries pointing to the
>>>>>      * memory backing the buffer object, and then returns a return
>>>>> code @@ -180,7 +181,8 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>>>>      */
>>>>>     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>>                                   pgprot_t prot,
>>>>> -                               pgoff_t num_prefault)
>>>>> +                               pgoff_t num_prefault,
>>>>> +                               bool mkwrite)
>>>>>     {
>>>>>       struct vm_area_struct *vma = vmf->vma;
>>>>>       struct ttm_buffer_object *bo = vma->vm_private_data; @@ -263,7
>>>>> +265,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>>                * at arbitrary times while the data is mmap'ed.
>>>>>                * See vmf_insert_pfn_prot() for a discussion.
>>>>>                */
>>>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot,
>>>>> + mkwrite);
>>>>>
>>>>>               /* Never error on prefaulted PTEs */
>>>>>               if (unlikely((ret & VM_FAULT_ERROR))) { @@ -312,7
>>>>> +314,7
>>>> @@
>>>>> vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t
>> prot)
>>>>>       /* Prefault the entire VMA range right away to avoid further faults */
>>>>>       for (address = vma->vm_start; address < vma->vm_end;
>>>>>            address += PAGE_SIZE)
>>>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot,
>>>>> + true);
>>>>>
>>>>>       return ret;
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>> index 74ff2812d66a..bb8e4b641681 100644
>>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>>>> @@ -452,12 +452,14 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault
>>>> *vmf)
>>>>>        * sure the page protection is write-enabled so we don't get
>>>>>        * a lot of unnecessary write faults.
>>>>>        */
>>>>> -   if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
>>>>> +   if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
>>>> {
>>>>>               prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
>>>>> -   else
>>>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault,
>>>> false);
>>>>> +   } else {
>>>>>               prot = vm_get_page_prot(vma->vm_flags);
>>>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault,
>>>> true);
>>>>> +   }
>>>>>
>>>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
>>>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags &
>>>> FAULT_FLAG_RETRY_NOWAIT))
>>>>>               return ret;
>>>>>
>>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>>> index 0223a41a64b2..66e293db69ee 100644
>>>>> --- a/include/drm/ttm/ttm_bo.h
>>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>>> @@ -386,7 +386,8 @@ vm_fault_t ttm_bo_vm_reserve(struct
>>>> ttm_buffer_object *bo,
>>>>>                            struct vm_fault *vmf);
>>>>>     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>>                                   pgprot_t prot,
>>>>> -                               pgoff_t num_prefault);
>>>>> +                               pgoff_t num_prefault,
>>>>> +                               bool mkwrite);
>>>>>     vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
>>>>>     void ttm_bo_vm_open(struct vm_area_struct *vma);
>>>>>     void ttm_bo_vm_close(struct vm_area_struct *vma); diff --git
>>>>> a/include/linux/mm.h b/include/linux/mm.h index
>>>>> f5a97dec5169..f8868e28ea04 100644
>>>>> --- a/include/linux/mm.h
>>>>> +++ b/include/linux/mm.h
>>>>> @@ -3553,7 +3553,7 @@ int vm_map_pages_zero(struct
>> vm_area_struct
>>>> *vma, struct page **pages,
>>>>>     vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned
>>>>> long
>>>> addr,
>>>>>                       unsigned long pfn);
>>>>>     vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma,
>>>>> unsigned
>>>> long addr,
>>>>> -                   unsigned long pfn, pgprot_t pgprot);
>>>>> +                   unsigned long pfn, pgprot_t pgprot, bool
>>>>> + mkwrite);
>>>>>     vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned
>>>>> long
>>>> addr,
>>>>>                       pfn_t pfn);
>>>>>     vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
>>>>> diff --git a/mm/memory.c b/mm/memory.c index
>>>>> 7e1f4849463a..2c28f1a349ff
>>>>> 100644
>>>>> --- a/mm/memory.c
>>>>> +++ b/mm/memory.c
>>>>> @@ -2195,6 +2195,7 @@ static vm_fault_t insert_pfn(struct
>>>> vm_area_struct *vma, unsigned long addr,
>>>>>      * @addr: target user address of this page
>>>>>      * @pfn: source kernel pfn
>>>>>      * @pgprot: pgprot flags for the inserted page
>>>>> + * @mkwrite: make the pfn writable
>>>>>      *
>>>>>      * This is exactly like vmf_insert_pfn(), except that it allows drivers
>>>>>      * to override pgprot on a per-page basis.
>>>>> @@ -2223,7 +2224,7 @@ static vm_fault_t insert_pfn(struct
>>>> vm_area_struct *vma, unsigned long addr,
>>>>>      * Return: vm_fault_t value.
>>>>>      */
>>>>>     vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma,
>>>>> unsigned
>>>> long addr,
>>>>> -                   unsigned long pfn, pgprot_t pgprot)
>>>>> +                   unsigned long pfn, pgprot_t pgprot, bool
>>>>> + mkwrite)
>>>>>     {
>>>>>       /*
>>>>>        * Technically, architectures with pte_special can avoid all
>>>>> these @@ -2246,7 +2247,7 @@ vm_fault_t vmf_insert_pfn_prot(struct
>>>> vm_area_struct *vma, unsigned long addr,
>>>>>       track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
>>>>>
>>>>>       return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
>>>>> -                   false);
>>>>> +                   mkwrite);
>>>>>     }
>>>>>     EXPORT_SYMBOL(vmf_insert_pfn_prot);
>>>>>
>>>>> @@ -2273,10 +2274,17 @@ EXPORT_SYMBOL(vmf_insert_pfn_prot);
>>>>>     vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned
>>>>> long
>>>> addr,
>>>>>                       unsigned long pfn)
>>>>>     {
>>>>> -   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot);
>>>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>>>>> +false);
>>>>>     }
>>>>>     EXPORT_SYMBOL(vmf_insert_pfn);
>>>>>
>>>>> +vm_fault_t vmf_insert_pfn_mkwrite(struct vm_area_struct *vma,
>>>>> +unsigned
>>>> long addr,
>>>>> +                   unsigned long pfn) {
>>>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>>>> true);
>>>>> +} EXPORT_SYMBOL(vmf_insert_pfn_mkwrite);
>>>>> +
>>>>>     static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
>>>>>     {
>>>>>       /* these checks mirror the abort conditions in vm_normal_page
>>>>> */

