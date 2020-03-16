Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118BA187290
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 19:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D0989F6D;
	Mon, 16 Mar 2020 18:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A110389FD4;
 Mon, 16 Mar 2020 18:42:43 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6fc8950001>; Mon, 16 Mar 2020 11:42:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Mar 2020 11:42:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Mar 2020 11:42:42 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 16 Mar 2020 18:42:42 +0000
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan
 Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
Date: Mon, 16 Mar 2020 11:42:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200316175259.908713-3-hch@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584384149; bh=B94TV8X7ko7Pix5Sd8galzczCBn2KhQ2ZY6X5Asx6X8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=j4e7ucJv25vdvLHdnyJRo/nbNWu7R7E5t+GpT69/n/YRNYsFKNv6jPGbT9PDij1Yv
 32sPUxUPadDensRW6JTdPjtHyc0ZDNBTc/urNzfCIJD5uiF+nB39iIN6DJlyPSLK9k
 BOAEBXVIx4Iuru7wnTT6qRjULqd2skJbh73AZjcQHiSv/eQO5aIlw9YbO8lKWY7eos
 YUrv1eL/Ji/8ZfuUop+bKlpuwfRU7Mwt/qb3f45XaPKxdxmOYePs7XugFLt1ovcxeC
 ZiY1XBR43/FSV3x/gGWSjIYVhU9YePPg5rFbTmgk7Bo1prHtDtCIRf/a/KYaZMt2jH
 VyO1pKjAVdq2w==
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
Cc: kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/16/20 10:52 AM, Christoph Hellwig wrote:
> No driver has actually used properly wire up and support this feature.
> There is various code related to it in nouveau, but as far as I can tell
> it never actually got turned on, and the only changes since the initial
> commit are global cleanups.

This is not actually true. OpenCL 2.x does support SVM with nouveau and
device private memory via clEnqueueSVMMigrateMem().
Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
migrated and this change would conflict with that.


> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 -
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  | 37 -------------------------
>   drivers/gpu/drm/nouveau/nouveau_dmem.h  |  2 --
>   drivers/gpu/drm/nouveau/nouveau_svm.c   |  3 --
>   include/linux/hmm.h                     |  2 --
>   mm/hmm.c                                | 28 -------------------
>   6 files changed, 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index dee446278417..90821ce5e6ca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -776,7 +776,6 @@ struct amdgpu_ttm_tt {
>   static const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] = {
>   	(1 << 0), /* HMM_PFN_VALID */
>   	(1 << 1), /* HMM_PFN_WRITE */
> -	0 /* HMM_PFN_DEVICE_PRIVATE */
>   };
>   
>   static const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] = {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 7605c4c48985..42808efceaf2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -671,40 +671,3 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>   out:
>   	return ret;
>   }
> -
> -static inline bool
> -nouveau_dmem_page(struct nouveau_drm *drm, struct page *page)
> -{
> -	return is_device_private_page(page) && drm->dmem == page_to_dmem(page);
> -}
> -
> -void
> -nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
> -			 struct hmm_range *range)
> -{
> -	unsigned long i, npages;
> -
> -	npages = (range->end - range->start) >> PAGE_SHIFT;
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page;
> -		uint64_t addr;
> -
> -		page = hmm_device_entry_to_page(range, range->pfns[i]);
> -		if (page == NULL)
> -			continue;
> -
> -		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> -			continue;
> -		}
> -
> -		if (!nouveau_dmem_page(drm, page)) {
> -			WARN(1, "Some unknown device memory !\n");
> -			range->pfns[i] = 0;
> -			continue;
> -		}
> -
> -		addr = nouveau_dmem_page_addr(page);
> -		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
> -		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
> -	}
> -}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
> index 92394be5d649..1ac620b3d4fb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
> @@ -38,8 +38,6 @@ int nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>   			     unsigned long start,
>   			     unsigned long end);
>   
> -void nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
> -			      struct hmm_range *range);
>   #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
>   static inline void nouveau_dmem_init(struct nouveau_drm *drm) {}
>   static inline void nouveau_dmem_fini(struct nouveau_drm *drm) {}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index df9bf1fd1bc0..7e0376dca137 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -367,7 +367,6 @@ static const u64
>   nouveau_svm_pfn_flags[HMM_PFN_FLAG_MAX] = {
>   	[HMM_PFN_VALID         ] = NVIF_VMM_PFNMAP_V0_V,
>   	[HMM_PFN_WRITE         ] = NVIF_VMM_PFNMAP_V0_W,
> -	[HMM_PFN_DEVICE_PRIVATE] = NVIF_VMM_PFNMAP_V0_VRAM,
>   };
>   
>   static const u64
> @@ -558,8 +557,6 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>   		break;
>   	}
>   
> -	nouveau_dmem_convert_pfn(drm, &range);
> -
>   	svmm->vmm->vmm.object.client->super = true;
>   	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
>   	svmm->vmm->vmm.object.client->super = false;
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 4bf8d6997b12..5e6034f105c3 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -74,7 +74,6 @@
>    * Flags:
>    * HMM_PFN_VALID: pfn is valid. It has, at least, read permission.
>    * HMM_PFN_WRITE: CPU page table has write permission set
> - * HMM_PFN_DEVICE_PRIVATE: private device memory (ZONE_DEVICE)
>    *
>    * The driver provides a flags array for mapping page protections to device
>    * PTE bits. If the driver valid bit for an entry is bit 3,
> @@ -86,7 +85,6 @@
>   enum hmm_pfn_flag_e {
>   	HMM_PFN_VALID = 0,
>   	HMM_PFN_WRITE,
> -	HMM_PFN_DEVICE_PRIVATE,
>   	HMM_PFN_FLAG_MAX
>   };
>   
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 180e398170b0..3d10485bf323 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -118,15 +118,6 @@ static inline void hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
>   	/* We aren't ask to do anything ... */
>   	if (!(pfns & range->flags[HMM_PFN_VALID]))
>   		return;
> -	/* If this is device memory then only fault if explicitly requested */
> -	if ((cpu_flags & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> -		/* Do we fault on device memory ? */
> -		if (pfns & range->flags[HMM_PFN_DEVICE_PRIVATE]) {
> -			*write_fault = pfns & range->flags[HMM_PFN_WRITE];
> -			*fault = true;
> -		}
> -		return;
> -	}
>   
>   	/* If CPU page table is not valid then we need to fault */
>   	*fault = !(cpu_flags & range->flags[HMM_PFN_VALID]);
> @@ -259,25 +250,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   	if (!pte_present(pte)) {
>   		swp_entry_t entry = pte_to_swp_entry(pte);
>   
> -		/*
> -		 * This is a special swap entry, ignore migration, use
> -		 * device and report anything else as error.
> -		 */
> -		if (is_device_private_entry(entry)) {
> -			cpu_flags = range->flags[HMM_PFN_VALID] |
> -				range->flags[HMM_PFN_DEVICE_PRIVATE];
> -			cpu_flags |= is_write_device_private_entry(entry) ?
> -				range->flags[HMM_PFN_WRITE] : 0;
> -			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
> -					   &fault, &write_fault);
> -			if (fault || write_fault)
> -				goto fault;
> -			*pfn = hmm_device_entry_from_pfn(range,
> -					    swp_offset(entry));
> -			*pfn |= cpu_flags;
> -			return 0;
> -		}
> -
>   		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
>   				   &write_fault);
>   		if (!fault && !write_fault)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
