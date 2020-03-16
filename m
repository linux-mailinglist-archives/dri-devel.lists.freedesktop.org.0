Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CA31875C9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 23:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798856E4AD;
	Mon, 16 Mar 2020 22:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3A96E4AD;
 Mon, 16 Mar 2020 22:49:54 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7002840000>; Mon, 16 Mar 2020 15:49:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Mar 2020 15:49:53 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Mar 2020 15:49:53 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 16 Mar 2020 22:49:53 +0000
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan
 Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
Date: Mon, 16 Mar 2020 15:49:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200316193216.920734-4-hch@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584398981; bh=oG5i8KvHP2KqdDOupGJpRLxJXWPBlanwwOgf7UiJKpE=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=PlqSDbyIWCbLrywgaJA997o0baZh6temen1qXRdzzgbf4K7NCVhC7VFhz1pnxfLfc
 GxRnH8DKp2Ou1HkyQmC9jpiDiB4tBeLDO8AOboiiZeiCo73Y7QHxFxMCWgOnj253hs
 hFCvfy3W9VbyJU0yVforn/4ZtC2PW2DHsjhV83KOZr5v+MjUGtRW0qVJjFx98TV+5I
 CE9SWzJR2UuxnBUdK8sGKpfEyWGZF7wA/68BcH/rZDP/Wk6ZSvYv04F3PwmtXluyEw
 tBwk0L6Q6+3V9Z+bMXqVU9Yzy27Hjwrc6CzyUGoSwMqLp/kvQ4ZZstSyAj8cFNoRfV
 fsYton1k9l/4w==
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


On 3/16/20 12:32 PM, Christoph Hellwig wrote:
> Remove the code to fault device private pages back into system memory
> that has never been used by any driver.  Also replace the usage of the
> HMM_PFN_DEVICE_PRIVATE flag in the pfns array with a simple
> is_device_private_page check in nouveau.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
look at the struct page but what if a driver needs to fault in a page from
another device's private memory? Should it call handle_mm_fault()?


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 -
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  5 +++--
>   drivers/gpu/drm/nouveau/nouveau_svm.c   |  1 -
>   include/linux/hmm.h                     |  2 --
>   mm/hmm.c                                | 25 +++++--------------------
>   5 files changed, 8 insertions(+), 26 deletions(-)
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
> index 0e36345d395c..edfd0805fba4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -28,6 +28,7 @@
>   
>   #include <nvif/class.h>
>   #include <nvif/object.h>
> +#include <nvif/if000c.h>
>   #include <nvif/if500b.h>
>   #include <nvif/if900b.h>
>   
> @@ -692,9 +693,8 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
>   		if (page == NULL)
>   			continue;
>   
> -		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> +		if (!is_device_private_page(page))
>   			continue;
> -		}
>   
>   		if (!nouveau_dmem_page(drm, page)) {
>   			WARN(1, "Some unknown device memory !\n");
> @@ -705,5 +705,6 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
>   		addr = nouveau_dmem_page_addr(page);
>   		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
>   		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
> +		range->pfns[i] |= NVIF_VMM_PFNMAP_V0_VRAM;
>   	}
>   }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index df9bf1fd1bc0..39c731a99937 100644
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
> index 180e398170b0..cfad65f6a67b 100644
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
> @@ -260,21 +251,15 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   		swp_entry_t entry = pte_to_swp_entry(pte);
>   
>   		/*
> -		 * This is a special swap entry, ignore migration, use
> -		 * device and report anything else as error.
> +		 * Never fault in device private pages pages, but just report
> +		 * the PFN even if not present.
>   		 */
>   		if (is_device_private_entry(entry)) {
> -			cpu_flags = range->flags[HMM_PFN_VALID] |
> -				range->flags[HMM_PFN_DEVICE_PRIVATE];
> -			cpu_flags |= is_write_device_private_entry(entry) ?
> -				range->flags[HMM_PFN_WRITE] : 0;
> -			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
> -					   &fault, &write_fault);
> -			if (fault || write_fault)
> -				goto fault;
>   			*pfn = hmm_device_entry_from_pfn(range,
>   					    swp_offset(entry));
> -			*pfn |= cpu_flags;
> +			*pfn |= range->flags[HMM_PFN_VALID];
> +			if (is_write_device_private_entry(entry))
> +				*pfn |= range->flags[HMM_PFN_WRITE];
>   			return 0;
>   		}
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
