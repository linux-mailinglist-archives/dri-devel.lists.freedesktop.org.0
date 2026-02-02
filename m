Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DyTGm3TgGmFBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:40:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3BCF132
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DECB10E2BB;
	Mon,  2 Feb 2026 16:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5207110E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:40:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B9F61515;
 Mon,  2 Feb 2026 08:40:01 -0800 (PST)
Received: from [10.57.6.209] (unknown [10.57.6.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BCA03F778;
 Mon,  2 Feb 2026 08:40:03 -0800 (PST)
Message-ID: <728c3f8a-3edc-45e7-98dc-1e21b2e1e5dd@arm.com>
Date: Mon, 2 Feb 2026 16:40:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/panthor: Lazily allocate pages on mmap()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
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
References: <20260202113607.1745667-1-boris.brezillon@collabora.com>
 <20260202113607.1745667-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260202113607.1745667-6-boris.brezillon@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,arm.com:mid,arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B7A3BCF132
X-Rspamd-Action: no action

On 02/02/2026 11:36, Boris Brezillon wrote:
> Defer pages allocation until their first access.
> 
> v2:
> - Don't deal with FAULT_FLAG_INTERRUPTIBLE
> - Make sure bo->backing.pages is never an ERR_PTR()
> - Drop a useless vm_fault_t local var
> - Fix comment in panthor_gem_fault()
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Looks fine to me.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 127 ++++++++++++++++----------
>  1 file changed, 77 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 1a301e5174ec..7e966fbe500f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -129,18 +129,20 @@ panthor_gem_backing_cleanup_locked(struct panthor_gem_object *bo)
>  static int
>  panthor_gem_backing_get_pages_locked(struct panthor_gem_object *bo)
>  {
> +	struct page **pages;
> +
>  	dma_resv_assert_held(bo->base.resv);
>  
>  	if (bo->backing.pages)
>  		return 0;
>  
> -	bo->backing.pages = drm_gem_get_pages(&bo->base);
> -	if (IS_ERR(bo->backing.pages)) {
> -		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
> -			    bo->backing.pages);
> -		return PTR_ERR(bo->backing.pages);
> +	pages = drm_gem_get_pages(&bo->base);
> +	if (IS_ERR(pages)) {
> +		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n", pages);
> +		return PTR_ERR(pages);
>  	}
>  
> +	bo->backing.pages = pages;
>  	return 0;
>  }
>  
> @@ -601,15 +603,6 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
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
> @@ -629,82 +622,116 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
>  	return res;
>  }
>  
> -static bool try_map_pmd(struct vm_fault *vmf, unsigned long addr, struct page *page)
> +static vm_fault_t insert_page(struct vm_fault *vmf, struct page *page)
>  {
> +	struct vm_area_struct *vma = vmf->vma;
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
>  		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
> -			return true;
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
> +	err = dma_resv_lock_interruptible(bo->base.resv, NULL);
> +	if (err)
> +		return mmap_lock_held ? VM_FAULT_NOPAGE : VM_FAULT_RETRY;
> +
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
> -	if (try_map_pmd(vmf, vmf->address, bo->backing.pages[page_offset])) {
> -		ret = VM_FAULT_NOPAGE;
> -		goto out;
> -	}
> -
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
> +	/* Offset to faulty address in the VMA. */
> +	page_offset = vmf->pgoff - vma->vm_pgoff;
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

