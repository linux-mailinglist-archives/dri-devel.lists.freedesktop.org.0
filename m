Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BFF387BD3
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20026E893;
	Tue, 18 May 2021 14:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EB66E891;
 Tue, 18 May 2021 14:59:52 +0000 (UTC)
IronPort-SDR: ugnyAcVtUKV4Znse6NVaXOw5rFtwwUfv9AET9Oil6Mijp3CxOeEdMFRmG0lFXfY1gop4AGorcg
 JyRwFqt63iQw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200786561"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="200786561"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 07:59:51 -0700
IronPort-SDR: MIDOhnqyi1/th8ZaO9k+s474gzDIyogI3yqtYBUsrJWzdatTYYN/JV/G0rhdyxQ1vu2lUGTZhe
 oDZKX+5ACC9w==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439073443"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 07:59:49 -0700
Subject: Re: [Intel-gfx] [PATCH v2 13/15] drm/ttm: Add BO and offset arguments
 for vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-14-thomas.hellstrom@linux.intel.com>
 <7ce49dd3-d4f9-61c1-dcc6-a5d303dc36fc@linux.intel.com>
 <a93d3f87-1331-e264-13c7-87b29cdbc22f@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <a8c98c8a-3313-9802-31be-81e80525a111@linux.intel.com>
Date: Tue, 18 May 2021 16:59:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a93d3f87-1331-e264-13c7-87b29cdbc22f@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 1:59 PM, Christian König wrote:
> Can you send me the patch directly and not just on CC?
>
> Thanks,
> Christian.

Original patch sent. Pls remember to CC lists on reply, though.

The reason we need this is because of i915's strange mmap functionality 
which allows a bo to be mapped at multiple offsets and  the vma->private 
is not a bo...

Thanks,

Thomas




>
> Am 18.05.21 um 10:59 schrieb Thomas Hellström:
>> + Christian König
>>
>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> This allows other drivers that may not setup the vma in the same way
>>> to use the ttm bo helpers.
>>>
>>> Also clarify the documentation a bit, especially related to 
>>> VM_FAULT_RETRY.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> Lgtm. Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +-
>>>   drivers/gpu/drm/nouveau/nouveau_ttm.c      |  4 +-
>>>   drivers/gpu/drm/radeon/radeon_ttm.c        |  4 +-
>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c            | 84 
>>> +++++++++++++---------
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 ++-
>>>   include/drm/ttm/ttm_bo_api.h               |  9 ++-
>>>   6 files changed, 75 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index d5a9d7a88315..89dafe14f828 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -1919,7 +1919,9 @@ static vm_fault_t amdgpu_ttm_fault(struct 
>>> vm_fault *vmf)
>>>       if (ret)
>>>           goto unlock;
>>>   -    ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>>> + drm_vma_node_start(&bo->base.vma_node),
>>> +                       vmf->vma->vm_page_prot,
>>>                          TTM_BO_VM_NUM_PREFAULT, 1);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           return ret;
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>> index b81ae90b8449..555fb6d8be8b 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>> @@ -144,7 +144,9 @@ static vm_fault_t nouveau_ttm_fault(struct 
>>> vm_fault *vmf)
>>>         nouveau_bo_del_io_reserve_lru(bo);
>>>       prot = vm_get_page_prot(vma->vm_flags);
>>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>>> TTM_BO_VM_NUM_PREFAULT, 1);
>>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>>> + drm_vma_node_start(&bo->base.vma_node),
>>> +                       prot, TTM_BO_VM_NUM_PREFAULT, 1);
>>>       nouveau_bo_add_io_reserve_lru(bo);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           return ret;
>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c 
>>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> index 3361d11769a2..ba48a2acdef0 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> @@ -816,7 +816,9 @@ static vm_fault_t radeon_ttm_fault(struct 
>>> vm_fault *vmf)
>>>       if (ret)
>>>           goto unlock_resv;
>>>   -    ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>>> + drm_vma_node_start(&bo->base.vma_node),
>>> +                       vmf->vma->vm_page_prot,
>>>                          TTM_BO_VM_NUM_PREFAULT, 1);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           goto unlock_mclk;
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index b31b18058965..ed00ccf1376e 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -42,7 +42,7 @@
>>>   #include <linux/mem_encrypt.h>
>>>     static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object 
>>> *bo,
>>> -                struct vm_fault *vmf)
>>> +                       struct vm_fault *vmf)
>>>   {
>>>       vm_fault_t ret = 0;
>>>       int err = 0;
>>> @@ -122,7 +122,8 @@ static unsigned long ttm_bo_io_mem_pfn(struct 
>>> ttm_buffer_object *bo,
>>>    * Return:
>>>    *    0 on success and the bo was reserved.
>>>    *    VM_FAULT_RETRY if blocking wait.
>>> - *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed.
>>> + *    VM_FAULT_NOPAGE if blocking wait and retrying was not 
>>> allowed, or wait interrupted.
>>> + *    VM_FAULT_SIGBUS if wait on bo->moving failed for reason other 
>>> than a signal.
>>>    */
>>>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>                    struct vm_fault *vmf)
>>> @@ -254,7 +255,9 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>>> vm_fault *vmf,
>>>     /**
>>>    * ttm_bo_vm_fault_reserved - TTM fault helper
>>> + * @bo: The buffer object
>>>    * @vmf: The struct vm_fault given as argument to the fault callback
>>> + * @mmap_base: The base of the mmap, to which the @vmf fault is 
>>> relative to.
>>>    * @prot: The page protection to be used for this memory area.
>>>    * @num_prefault: Maximum number of prefault pages. The caller may 
>>> want to
>>>    * specify this based on madvice settings and the size of the GPU 
>>> object
>>> @@ -265,19 +268,28 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>>> vm_fault *vmf,
>>>    * memory backing the buffer object, and then returns a return code
>>>    * instructing the caller to retry the page access.
>>>    *
>>> + * This function ensures any pipelined wait is finished.
>>> + *
>>> + * WARNING:
>>> + * On VM_FAULT_RETRY, the bo will be unlocked by this function when
>>> + * #FAULT_FLAG_RETRY_NOWAIT is not set inside @vmf->flags. In this
>>> + * case, the caller should not unlock the @bo.
>>> + *
>>>    * Return:
>>> - *   VM_FAULT_NOPAGE on success or pending signal
>>> + *   0 on success.
>>> + *   VM_FAULT_NOPAGE on pending signal
>>>    *   VM_FAULT_SIGBUS on unspecified error
>>>    *   VM_FAULT_OOM on out-of-memory
>>> - *   VM_FAULT_RETRY if retryable wait
>>> + *   VM_FAULT_RETRY if retryable wait, see WARNING above.
>>>    */
>>> -vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>> +vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
>>> +                    struct vm_fault *vmf,
>>> +                    unsigned long mmap_base,
>>>                       pgprot_t prot,
>>>                       pgoff_t num_prefault,
>>>                       pgoff_t fault_page_size)
>>>   {
>>>       struct vm_area_struct *vma = vmf->vma;
>>> -    struct ttm_buffer_object *bo = vma->vm_private_data;
>>>       struct ttm_device *bdev = bo->bdev;
>>>       unsigned long page_offset;
>>>       unsigned long page_last;
>>> @@ -286,15 +298,11 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>>> vm_fault *vmf,
>>>       struct page *page;
>>>       int err;
>>>       pgoff_t i;
>>> -    vm_fault_t ret = VM_FAULT_NOPAGE;
>>> +    vm_fault_t ret;
>>>       unsigned long address = vmf->address;
>>>   -    /*
>>> -     * Wait for buffer data in transit, due to a pipelined
>>> -     * move.
>>> -     */
>>>       ret = ttm_bo_vm_fault_idle(bo, vmf);
>>> -    if (unlikely(ret != 0))
>>> +    if (ret)
>>>           return ret;
>>>         err = ttm_mem_io_reserve(bdev, &bo->mem);
>>> @@ -302,9 +310,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>>> vm_fault *vmf,
>>>           return VM_FAULT_SIGBUS;
>>>         page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
>>> -        vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
>>> -    page_last = vma_pages(vma) + vma->vm_pgoff -
>>> -        drm_vma_node_start(&bo->base.vma_node);
>>> +        vma->vm_pgoff - mmap_base;
>>> +    page_last = vma_pages(vma) + vma->vm_pgoff - mmap_base;
>>>         if (unlikely(page_offset >= bo->mem.num_pages))
>>>           return VM_FAULT_SIGBUS;
>>> @@ -344,8 +351,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>>> vm_fault *vmf,
>>>               } else if (unlikely(!page)) {
>>>                   break;
>>>               }
>>> -            page->index = drm_vma_node_start(&bo->base.vma_node) +
>>> -                page_offset;
>>> +            page->index = mmap_base + page_offset;
>>>               pfn = page_to_pfn(page);
>>>           }
>>>   @@ -392,7 +398,10 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>>>           return ret;
>>>         prot = vma->vm_page_prot;
>>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>>> TTM_BO_VM_NUM_PREFAULT, 1);
>>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>>> + drm_vma_node_start(&bo->base.vma_node),
>>> +                       prot, TTM_BO_VM_NUM_PREFAULT, 1);
>>> +
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           return ret;
>>>   @@ -460,22 +469,16 @@ static int ttm_bo_vm_access_kmap(struct 
>>> ttm_buffer_object *bo,
>>>       return len;
>>>   }
>>>   -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>> -             void *buf, int len, int write)
>>> +int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
>>> +                  struct vm_area_struct *vma,
>>> +                  unsigned long offset,
>>> +                  void *buf, int len, int write)
>>>   {
>>> -    struct ttm_buffer_object *bo = vma->vm_private_data;
>>> -    unsigned long offset = (addr) - vma->vm_start +
>>> -        ((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>> -         << PAGE_SHIFT);
>>>       int ret;
>>>         if (len < 1 || (offset + len) >> PAGE_SHIFT > 
>>> bo->mem.num_pages)
>>>           return -EIO;
>>>   -    ret = ttm_bo_reserve(bo, true, false, NULL);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>>       switch (bo->mem.mem_type) {
>>>       case TTM_PL_SYSTEM:
>>>           if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>>> @@ -485,16 +488,33 @@ int ttm_bo_vm_access(struct vm_area_struct 
>>> *vma, unsigned long addr,
>>>           }
>>>           fallthrough;
>>>       case TTM_PL_TT:
>>> -        ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>>> -        break;
>>> +        return ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>>>       default:
>>>           if (bo->bdev->funcs->access_memory)
>>> -            ret = bo->bdev->funcs->access_memory(
>>> +            return bo->bdev->funcs->access_memory(
>>>                   bo, offset, buf, len, write);
>>>           else
>>> -            ret = -EIO;
>>> +            return -EIO;
>>>       }
>>>   +    return ret;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_vm_access_reserved);
>>> +
>>> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>> +             void *buf, int len, int write)
>>> +{
>>> +    struct ttm_buffer_object *bo = vma->vm_private_data;
>>> +    unsigned long offset = (addr) - vma->vm_start +
>>> +        ((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>> +         << PAGE_SHIFT);
>>> +    int ret;
>>> +
>>> +    ret = ttm_bo_reserve(bo, true, false, NULL);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = ttm_bo_vm_access_reserved(bo, vma, offset, buf, len, write);
>>>       ttm_bo_unreserve(bo);
>>>         return ret;
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> index 45c9c6a7f1d6..56ecace0cf5c 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> @@ -477,7 +477,9 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>>>       else
>>>           prot = vm_get_page_prot(vma->vm_flags);
>>>   -    ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
>>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>>> + drm_vma_node_start(&bo->base.vma_node),
>>> +                       prot, num_prefault, 1);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           return ret;
>>>   @@ -546,7 +548,9 @@ vm_fault_t vmw_bo_vm_huge_fault(struct 
>>> vm_fault *vmf,
>>>           prot = vm_get_page_prot(vma->vm_flags);
>>>       }
>>>   -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
>>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>>> + drm_vma_node_start(&bo->base.vma_node),
>>> +                       prot, 1, fault_page_size);
>>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>>> FAULT_FLAG_RETRY_NOWAIT))
>>>           return ret;
>>>   diff --git a/include/drm/ttm/ttm_bo_api.h 
>>> b/include/drm/ttm/ttm_bo_api.h
>>> index 639521880c29..434f91f1fdbf 100644
>>> --- a/include/drm/ttm/ttm_bo_api.h
>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>> @@ -605,7 +605,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>                    struct vm_fault *vmf);
>>>   -vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>> +vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
>>> +                    struct vm_fault *vmf,
>>> +                    unsigned long mmap_base,
>>>                       pgprot_t prot,
>>>                       pgoff_t num_prefault,
>>>                       pgoff_t fault_page_size);
>>> @@ -616,6 +618,11 @@ void ttm_bo_vm_open(struct vm_area_struct *vma);
>>>     void ttm_bo_vm_close(struct vm_area_struct *vma);
>>>   +int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
>>> +                  struct vm_area_struct *vma,
>>> +                  unsigned long offset,
>>> +                  void *buf, int len, int write);
>>> +
>>>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>                void *buf, int len, int write);
>>>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>
