Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB62D2684B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E5510E78F;
	Thu, 15 Jan 2026 17:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FF8310E78F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:35:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 958AD1515
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:35:36 -0800 (PST)
Received: from e142607.local (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 129653F59E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:35:42 -0800 (PST)
Date: Thu, 15 Jan 2026 17:34:46 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: Re: [PATCH v1 6/9] drm/panthor: Lazily allocate pages on mmap()
Message-ID: <aWklNuhMhTh3GGH1@e142607>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-7-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109130801.1239558-7-boris.brezillon@collabora.com>
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

On Fri, Jan 09, 2026 at 02:07:58PM +0100, Boris Brezillon wrote:
> Defer pages allocation until their first access.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 119 ++++++++++++++++----------
>  1 file changed, 75 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 0e52c7a07c87..44f05bd957e7 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -600,15 +600,6 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
>  	if (is_cow_mapping(vma->vm_flags))
>  		return -EINVAL;
>  
> -	dma_resv_lock(obj->resv, NULL);
> -	ret = panthor_gem_backing_get_pages_locked(bo);
> -	if (!ret)
> -		ret = panthor_gem_prep_for_cpu_map_locked(bo);
> -	dma_resv_unlock(obj->resv);
> -
> -	if (ret)
> -		return ret;
> -
>  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	if (should_map_wc(bo))
> @@ -628,82 +619,122 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
>  	return res;
>  }
>  
> -static bool try_map_pmd(struct vm_fault *vmf, unsigned long addr, struct page *page)
> +static vm_fault_t insert_page(struct vm_fault *vmf, struct page *page)
>  {
> +	struct vm_area_struct *vma = vmf->vma;
> +	vm_fault_t ret;
> +
>  #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
>  	unsigned long pfn = page_to_pfn(page);
>  	unsigned long paddr = pfn << PAGE_SHIFT;
> -	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
> +	bool aligned = (vmf->address & ~PMD_MASK) == (paddr & ~PMD_MASK);
>  
>  	if (aligned &&
>  	    pmd_none(*vmf->pmd) &&
>  	    folio_test_pmd_mappable(page_folio(page))) {
>  		pfn &= PMD_MASK >> PAGE_SHIFT;
> -		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
> -			return true;
> +		ret = vmf_insert_pfn_pmd(vmf, pfn, false);
> +		if (ret == VM_FAULT_NOPAGE)
> +			return VM_FAULT_NOPAGE;
>  	}
>  #endif
>  
> -	return false;
> +	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
>  }
>  
> -static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t nonblocking_page_setup(struct vm_fault *vmf, pgoff_t page_offset)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
> -	struct drm_gem_object *obj = vma->vm_private_data;
>  	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> -	loff_t num_pages = obj->size >> PAGE_SHIFT;
>  	vm_fault_t ret;
> -	pgoff_t page_offset;
> -	unsigned long pfn;
>  
> -	/* Offset to faulty address in the VMA. */
> -	page_offset = vmf->pgoff - vma->vm_pgoff;

Looks like you've removed the line with the missing right shift

> +	if (!dma_resv_trylock(bo->base.resv))
> +		return VM_FAULT_RETRY;
>  
> -	dma_resv_lock(bo->base.resv, NULL);
> +	if (bo->backing.pages)
> +		ret = insert_page(vmf, bo->backing.pages[page_offset]);
> +	else
> +		ret = VM_FAULT_RETRY;
>  
> -	if (page_offset >= num_pages ||
> -	    drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages)) {
> -		ret = VM_FAULT_SIGBUS;
> -		goto out;
> +	dma_resv_unlock(bo->base.resv);
> +	return ret;
> +}
> +
> +static vm_fault_t blocking_page_setup(struct vm_fault *vmf,
> +				      struct panthor_gem_object *bo,
> +				      pgoff_t page_offset, bool mmap_lock_held)
> +{
> +	vm_fault_t ret;
> +	int err;
> +
> +	if (vmf->flags & FAULT_FLAG_INTERRUPTIBLE) {
> +		err = dma_resv_lock_interruptible(bo->base.resv, NULL);
> +		if (err)
> +			return mmap_lock_held ? VM_FAULT_NOPAGE : VM_FAULT_RETRY;
> +	} else {
> +		dma_resv_lock(bo->base.resv, NULL);
>  	}
>  
> -	if (try_map_pmd(vmf, vmf->address, bo->backing.pages[page_offset])) {
> -		ret = VM_FAULT_NOPAGE;
> -		goto out;
> +	err = panthor_gem_backing_get_pages_locked(bo);
> +	if (!err)
> +		err = panthor_gem_prep_for_cpu_map_locked(bo);
> +
> +	if (err) {
> +		ret = mmap_lock_held ? VM_FAULT_SIGBUS : VM_FAULT_RETRY;
> +	} else {
> +		struct page *page = bo->backing.pages[page_offset];
> +
> +		if (mmap_lock_held)
> +			ret = insert_page(vmf, page);
> +		else
> +			ret = VM_FAULT_RETRY;
>  	}
>  
> -	pfn = page_to_pfn(bo->backing.pages[page_offset]);
> -	ret = vmf_insert_pfn(vma, vmf->address, pfn);
> -
> - out:
>  	dma_resv_unlock(bo->base.resv);
>  
>  	return ret;
>  }
>  
> -static void panthor_gem_vm_open(struct vm_area_struct *vma)
> +static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
>  {
> +	struct vm_area_struct *vma = vmf->vma;
>  	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> +	loff_t num_pages = bo->base.size >> PAGE_SHIFT;
> +	pgoff_t page_offset;
> +	vm_fault_t ret;
>  
> -	drm_WARN_ON(bo->base.dev, drm_gem_is_imported(&bo->base));
> +	/* We don't use vmf->pgoff since that has the fake offset */
> +	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;

... and added it corrected here, so ignore my comment on the previous patch.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> +	if (page_offset >= num_pages)
> +		return VM_FAULT_SIGBUS;
>  
> -	dma_resv_lock(bo->base.resv, NULL);
> +	ret = nonblocking_page_setup(vmf, page_offset);
> +	if (ret != VM_FAULT_RETRY)
> +		return ret;
>  
> -	/* We should have already pinned the pages when the buffer was first
> -	 * mmap'd, vm_open() just grabs an additional reference for the new
> -	 * mm the vma is getting copied into (ie. on fork()).
> -	 */
> -	drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages);
> +	/* Check if we're allowed to retry. */
> +	if (fault_flag_allow_retry_first(vmf->flags)) {
> +		/* If we're allowed to retry but not wait here, return
> +		 * immediately, the wait will be done when the fault
> +		 * handler is called again, with the mmap_lock held.
> +		 */
> +		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> +			return VM_FAULT_RETRY;
>  
> -	dma_resv_unlock(bo->base.resv);
> +		/* Wait with the mmap lock released, if we're allowed to. */
> +		drm_gem_object_get(&bo->base);
> +		mmap_read_unlock(vmf->vma->vm_mm);
> +		ret = blocking_page_setup(vmf, bo, page_offset, false);
> +		drm_gem_object_put(&bo->base);
> +		return ret;
> +	}
>  
> -	drm_gem_vm_open(vma);
> +	return blocking_page_setup(vmf, bo, page_offset, true);
>  }
>  
>  const struct vm_operations_struct panthor_gem_vm_ops = {
>  	.fault = panthor_gem_fault,
> -	.open = panthor_gem_vm_open,
> +	.open = drm_gem_vm_open,
>  	.close = drm_gem_vm_close,
>  };
>  
> -- 
> 2.52.0
> 
