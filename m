Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A9C434589
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 08:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077FF89FDD;
	Wed, 20 Oct 2021 06:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6501389FDD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 06:52:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="289555461"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="289555461"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 23:52:40 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="532536274"
Received: from mmazarel-mobl1.ger.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 23:52:38 -0700
Message-ID: <aa8138c8-f6dd-fa34-e8a1-d404300b84b4@linux.intel.com>
Date: Wed, 20 Oct 2021 08:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
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


On 10/20/21 08:41, Christian König wrote:
> Am 20.10.21 um 08:34 schrieb Thomas Hellström:
>>
>> On 10/20/21 01:27, Jason Gunthorpe wrote:
>>> PUD and PMD entries do not have a special bit.
>>>
>>> get_user_pages_fast() considers any page that passed pmd_huge() as
>>> usable:
>>>
>>>     if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
>>>              pmd_devmap(pmd))) {
>>>
>>> And vmf_insert_pfn_pmd_prot() unconditionally sets
>>>
>>>     entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
>>>
>>> eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
>>>
>>> As such gup_huge_pmd() will try to deref a struct page:
>>>
>>>     head = try_grab_compound_head(pmd_page(orig), refs, flags);
>>>
>>> and thus crash.
>>>
>>> Thomas further notices that the drivers are not expecting the struct 
>>> page
>>> to be used by anything - in particular the refcount incr above will 
>>> cause
>>> them to malfunction.
>>>
>>> Thus everything about this is not able to fully work correctly 
>>> considering
>>> GUP_fast. Delete it entirely. It can return someday along with a proper
>>> PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.
>>>
>>> Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM 
>>> pagefaults")
>>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
>>>   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c            | 94 
>>> +---------------------
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 -
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 72 +----------------
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |  3 -
>>>   include/drm/ttm/ttm_bo_api.h               |  3 +-
>>>   8 files changed, 7 insertions(+), 175 deletions(-)
>>>
>>> v2:
>>>   - Remove the entire thing as per Thomas's advice
>>> v1: 
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F0-v1-69e7da97f81f%2B21c-ttm_pmd_jgg%40nvidia.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce27350925989400d009c08d99393b14a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637703084808329081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ElqvK%2FJWgGMSCzt91lEotVK2pCelchxp6WGRgHv0ojQ%3D&amp;reserved=0
>>>
>>> After this patch the only users of the vmf_insert_pfn_pud/pmd_prot() 
>>> functions
>>> are DAX and DAX always has a struct page. Eliminating this 
>>> non-working case
>>> will simplify trying to fix the refcounting on ZONE_DEVICE pages.
>>>
>>> Thanks,
>>> Jason
>>
>> I think the patch subject needs updating to reflect that we're 
>> disabling PUD/PMDs completely.
>> With that fixed,
>>
>> Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
>
> Yeah, agree. A commit message like "drop huge page faults, they don't 
> work atm" would be rather helpful.
>
> Apart from that Reviewed-by: Christian König 
> <christian.koenig@amd.com> as well.
>
> Regards,
> Christian.
>
>>
>> Follow up question: If we resurrect this in the proper way (and in 
>> that case only for x86_64) is there something we need to pay 
>> particular attention to WRT the ZONE_DEVICE refcounting fixing you 
>> mention above?
>
> Well, I think we certainly need some use case which really shows that 
> this is faster to justify the added complexity.

Fair enough, although to some extent this is about saving page-table 
memory and being nice to the rest of the system as well. I guess in a 
way similar to have TTM supporting huge page allocations in the first 
place. But yeah I agree listing the benefits and weighing that against 
the added complexity should be a prerequisite.

But for us this is not top priority ATM.

/Thomas

>
> Regards,
> Christian.
>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index d6aa032890ee8b..a1e63ba4c54a59 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -61,7 +61,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault 
>>> *vmf)
>>>           }
>>>              ret = ttm_bo_vm_fault_reserved(vmf, 
>>> vmf->vma->vm_page_prot,
>>> -                        TTM_BO_VM_NUM_PREFAULT, 1);
>>> +                        TTM_BO_VM_NUM_PREFAULT);
>>>              drm_dev_exit(idx);
>>>       } else {
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> index 8c2ecc28272322..c89d5964148fd5 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> @@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct 
>>> vm_fault *vmf)
>>>         nouveau_bo_del_io_reserve_lru(bo);
>>>       prot = vm_get_page_prot(vma->vm_flags);
>>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>>> TTM_BO_VM_NUM_PREFAULT, 1);
>>> +    ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
>>>       nouveau_bo_add_io_reserve_lru(bo);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           return ret;
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c 
>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 458f92a7088797..a36a4f2c76b097 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -61,7 +61,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault 
>>> *vmf)
>>>           goto unlock_resv;
>>>         ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>>> -                       TTM_BO_VM_NUM_PREFAULT, 1);
>>> +                       TTM_BO_VM_NUM_PREFAULT);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           goto unlock_mclk;
>>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index f56be5bc0861ec..e5af7f9e94b273 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -171,89 +171,6 @@ vm_fault_t ttm_bo_vm_reserve(struct 
>>> ttm_buffer_object *bo,
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>>   -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> -/**
>>> - * ttm_bo_vm_insert_huge - Insert a pfn for PUD or PMD faults
>>> - * @vmf: Fault data
>>> - * @bo: The buffer object
>>> - * @page_offset: Page offset from bo start
>>> - * @fault_page_size: The size of the fault in pages.
>>> - * @pgprot: The page protections.
>>> - * Does additional checking whether it's possible to insert a PUD 
>>> or PMD
>>> - * pfn and performs the insertion.
>>> - *
>>> - * Return: VM_FAULT_NOPAGE on successful insertion, 
>>> VM_FAULT_FALLBACK if
>>> - * a huge fault was not possible, or on insertion error.
>>> - */
>>> -static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
>>> -                    struct ttm_buffer_object *bo,
>>> -                    pgoff_t page_offset,
>>> -                    pgoff_t fault_page_size,
>>> -                    pgprot_t pgprot)
>>> -{
>>> -    pgoff_t i;
>>> -    vm_fault_t ret;
>>> -    unsigned long pfn;
>>> -    pfn_t pfnt;
>>> -    struct ttm_tt *ttm = bo->ttm;
>>> -    bool write = vmf->flags & FAULT_FLAG_WRITE;
>>> -
>>> -    /* Fault should not cross bo boundary. */
>>> -    page_offset &= ~(fault_page_size - 1);
>>> -    if (page_offset + fault_page_size > bo->resource->num_pages)
>>> -        goto out_fallback;
>>> -
>>> -    if (bo->resource->bus.is_iomem)
>>> -        pfn = ttm_bo_io_mem_pfn(bo, page_offset);
>>> -    else
>>> -        pfn = page_to_pfn(ttm->pages[page_offset]);
>>> -
>>> -    /* pfn must be fault_page_size aligned. */
>>> -    if ((pfn & (fault_page_size - 1)) != 0)
>>> -        goto out_fallback;
>>> -
>>> -    /* Check that memory is contiguous. */
>>> -    if (!bo->resource->bus.is_iomem) {
>>> -        for (i = 1; i < fault_page_size; ++i) {
>>> -            if (page_to_pfn(ttm->pages[page_offset + i]) != pfn + i)
>>> -                goto out_fallback;
>>> -        }
>>> -    } else if (bo->bdev->funcs->io_mem_pfn) {
>>> -        for (i = 1; i < fault_page_size; ++i) {
>>> -            if (ttm_bo_io_mem_pfn(bo, page_offset + i) != pfn + i)
>>> -                goto out_fallback;
>>> -        }
>>> -    }
>>> -
>>> -    pfnt = __pfn_to_pfn_t(pfn, PFN_DEV);
>>> -    if (fault_page_size == (HPAGE_PMD_SIZE >> PAGE_SHIFT))
>>> -        ret = vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, write);
>>> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>>> -    else if (fault_page_size == (HPAGE_PUD_SIZE >> PAGE_SHIFT))
>>> -        ret = vmf_insert_pfn_pud_prot(vmf, pfnt, pgprot, write);
>>> -#endif
>>> -    else
>>> -        WARN_ON_ONCE(ret = VM_FAULT_FALLBACK);
>>> -
>>> -    if (ret != VM_FAULT_NOPAGE)
>>> -        goto out_fallback;
>>> -
>>> -    return VM_FAULT_NOPAGE;
>>> -out_fallback:
>>> -    count_vm_event(THP_FAULT_FALLBACK);
>>> -    return VM_FAULT_FALLBACK;
>>> -}
>>> -#else
>>> -static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
>>> -                    struct ttm_buffer_object *bo,
>>> -                    pgoff_t page_offset,
>>> -                    pgoff_t fault_page_size,
>>> -                    pgprot_t pgprot)
>>> -{
>>> -    return VM_FAULT_FALLBACK;
>>> -}
>>> -#endif
>>> -
>>>   /**
>>>    * ttm_bo_vm_fault_reserved - TTM fault helper
>>>    * @vmf: The struct vm_fault given as argument to the fault callback
>>> @@ -261,7 +178,6 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>>> vm_fault *vmf,
>>>    * @num_prefault: Maximum number of prefault pages. The caller may 
>>> want to
>>>    * specify this based on madvice settings and the size of the GPU 
>>> object
>>>    * backed by the memory.
>>> - * @fault_page_size: The size of the fault in pages.
>>>    *
>>>    * This function inserts one or more page table entries pointing 
>>> to the
>>>    * memory backing the buffer object, and then returns a return code
>>> @@ -275,8 +191,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>>> vm_fault *vmf,
>>>    */
>>>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>                       pgprot_t prot,
>>> -                    pgoff_t num_prefault,
>>> -                    pgoff_t fault_page_size)
>>> +                    pgoff_t num_prefault)
>>>   {
>>>       struct vm_area_struct *vma = vmf->vma;
>>>       struct ttm_buffer_object *bo = vma->vm_private_data;
>>> @@ -327,11 +242,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>>> vm_fault *vmf,
>>>           prot = pgprot_decrypted(prot);
>>>       }
>>>   -    /* We don't prefault on huge faults. Yet. */
>>> -    if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && fault_page_size 
>>> != 1)
>>> -        return ttm_bo_vm_insert_huge(vmf, bo, page_offset,
>>> -                         fault_page_size, prot);
>>> -
>>>       /*
>>>        * Speculatively prefault a number of pages. Only error on
>>>        * first page.
>>> @@ -429,7 +339,7 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>>>         prot = vma->vm_page_prot;
>>>       if (drm_dev_enter(ddev, &idx)) {
>>> -        ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>>> TTM_BO_VM_NUM_PREFAULT, 1);
>>> +        ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>>> TTM_BO_VM_NUM_PREFAULT);
>>>           drm_dev_exit(idx);
>>>       } else {
>>>           ret = ttm_bo_vm_dummy_page(vmf, prot);
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> index a833751099b559..858aff99a3fe53 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> @@ -1550,10 +1550,6 @@ void vmw_bo_dirty_unmap(struct 
>>> vmw_buffer_object *vbo,
>>>               pgoff_t start, pgoff_t end);
>>>   vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf);
>>>   vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf);
>>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> -vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>>> -                enum page_entry_size pe_size);
>>> -#endif
>>>     /* Transparent hugepage support - vmwgfx_thp.c */
>>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> index e5a9a5cbd01a7c..922317d1acc8a0 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> @@ -477,7 +477,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>>>       else
>>>           prot = vm_get_page_prot(vma->vm_flags);
>>>   -    ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
>>> +    ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           return ret;
>>>   @@ -486,73 +486,3 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>>>         return ret;
>>>   }
>>> -
>>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> -vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>>> -                enum page_entry_size pe_size)
>>> -{
>>> -    struct vm_area_struct *vma = vmf->vma;
>>> -    struct ttm_buffer_object *bo = (struct ttm_buffer_object *)
>>> -        vma->vm_private_data;
>>> -    struct vmw_buffer_object *vbo =
>>> -        container_of(bo, struct vmw_buffer_object, base);
>>> -    pgprot_t prot;
>>> -    vm_fault_t ret;
>>> -    pgoff_t fault_page_size;
>>> -    bool write = vmf->flags & FAULT_FLAG_WRITE;
>>> -
>>> -    switch (pe_size) {
>>> -    case PE_SIZE_PMD:
>>> -        fault_page_size = HPAGE_PMD_SIZE >> PAGE_SHIFT;
>>> -        break;
>>> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>>> -    case PE_SIZE_PUD:
>>> -        fault_page_size = HPAGE_PUD_SIZE >> PAGE_SHIFT;
>>> -        break;
>>> -#endif
>>> -    default:
>>> -        WARN_ON_ONCE(1);
>>> -        return VM_FAULT_FALLBACK;
>>> -    }
>>> -
>>> -    /* Always do write dirty-tracking and COW on PTE level. */
>>> -    if (write && (READ_ONCE(vbo->dirty) || 
>>> is_cow_mapping(vma->vm_flags)))
>>> -        return VM_FAULT_FALLBACK;
>>> -
>>> -    ret = ttm_bo_vm_reserve(bo, vmf);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>> -    if (vbo->dirty) {
>>> -        pgoff_t allowed_prefault;
>>> -        unsigned long page_offset;
>>> -
>>> -        page_offset = vmf->pgoff -
>>> -            drm_vma_node_start(&bo->base.vma_node);
>>> -        if (page_offset >= bo->resource->num_pages ||
>>> -            vmw_resources_clean(vbo, page_offset,
>>> -                    page_offset + PAGE_SIZE,
>>> -                    &allowed_prefault)) {
>>> -            ret = VM_FAULT_SIGBUS;
>>> -            goto out_unlock;
>>> -        }
>>> -
>>> -        /*
>>> -         * Write protect, so we get a new fault on write, and can
>>> -         * split.
>>> -         */
>>> -        prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
>>> -    } else {
>>> -        prot = vm_get_page_prot(vma->vm_flags);
>>> -    }
>>> -
>>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
>>> -    if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>> -        return ret;
>>> -
>>> -out_unlock:
>>> -    dma_resv_unlock(bo->base.resv);
>>> -
>>> -    return ret;
>>> -}
>>> -#endif
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> index e6b1f98ec99f09..0a4c340252ec4a 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> @@ -61,9 +61,6 @@ int vmw_mmap(struct file *filp, struct 
>>> vm_area_struct *vma)
>>>           .fault = vmw_bo_vm_fault,
>>>           .open = ttm_bo_vm_open,
>>>           .close = ttm_bo_vm_close,
>>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> -        .huge_fault = vmw_bo_vm_huge_fault,
>>> -#endif
>>>       };
>>>       struct drm_file *file_priv = filp->private_data;
>>>       struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
>>> diff --git a/include/drm/ttm/ttm_bo_api.h 
>>> b/include/drm/ttm/ttm_bo_api.h
>>> index f681bbdbc6982e..36f7eb9d066395 100644
>>> --- a/include/drm/ttm/ttm_bo_api.h
>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>> @@ -594,8 +594,7 @@ vm_fault_t ttm_bo_vm_reserve(struct 
>>> ttm_buffer_object *bo,
>>>     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>                       pgprot_t prot,
>>> -                    pgoff_t num_prefault,
>>> -                    pgoff_t fault_page_size);
>>> +                    pgoff_t num_prefault);
>>>     vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
>>>
>>> base-commit: 519d81956ee277b4419c723adfb154603c2565ba
>
