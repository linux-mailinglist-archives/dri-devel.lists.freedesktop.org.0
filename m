Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC9433EC3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1728D6E1E6;
	Tue, 19 Oct 2021 18:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEE76E1E6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:49:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="209396955"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="209396955"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 11:49:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="444010955"
Received: from zhangdi2-mobl.ccr.corp.intel.com (HELO [10.249.254.78])
 ([10.249.254.78])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 11:49:31 -0700
Message-ID: <616958c2-8dc2-e8f0-4421-eddc7e4f9d5e@linux.intel.com>
Date: Tue, 19 Oct 2021 20:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/ttm: Do not put non-struct page memory into PUD/PMDs
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <0-v1-69e7da97f81f+21c-ttm_pmd_jgg@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <0-v1-69e7da97f81f+21c-ttm_pmd_jgg@nvidia.com>
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

Hi,

On 10/19/21 20:21, Jason Gunthorpe wrote:
> PUD and PMD entries do not have a special bit.
>
> get_user_pages_fast() considers any page that passed pmd_huge() as
> usable:
>
> 		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> 			     pmd_devmap(pmd))) {
>
> And vmf_insert_pfn_pmd_prot() unconditionally sets
>
> 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
>
> eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
>
> As such gup_huge_pmd() will try to deref a struct page:
>
> 	head = try_grab_compound_head(pmd_page(orig), refs, flags);
>
> and thus crash.
>
> Prevent this by never using IO memory with vmf_insert_pfn_pud/pmd_prot().

Actually I think if fast gup will break even page backed memory since 
the backing drivers don't assume anybody else takes a refcount / 
pincount. Normal pages have PTE_SPECIAL and VM_PFNMAP to block that.

(Side note I was recommended to introduce a PTE_HUGESPECIAL bit for this 
and basically had  a patch ready but got scared off when trying to 
handle 64-bit PTE atomic updates on x86-32)

It might be that we (Intel) try to resurrect this code using 
PTE_HUGESPECIAL in the near future for i915, but until that, I think 
it's the safest option to disable it completely.

Thanks,

Thomas

>
> Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> AFAICT only the vmwgfx driver makes use of this, and I can't tell which path
> it is taking.
>
> This function will also try to install a PUD - does vmwgfx have a case where
> it has obtained a 1GB high order page - or is that dead code now?
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861ec..91d02c345fbba8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -203,10 +203,13 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
>   	if (page_offset + fault_page_size > bo->resource->num_pages)
>   		goto out_fallback;
>   
> +	/*
> +	 * vmf_insert_pfn_pud/pmd_prot() can only be called with struct page
> +	 * backed memory
> +	 */
>   	if (bo->resource->bus.is_iomem)
> -		pfn = ttm_bo_io_mem_pfn(bo, page_offset);
> -	else
> -		pfn = page_to_pfn(ttm->pages[page_offset]);
> +		goto out_fallback;
> +	pfn = page_to_pfn(ttm->pages[page_offset]);
>   
>   	/* pfn must be fault_page_size aligned. */
>   	if ((pfn & (fault_page_size - 1)) != 0)
>
> base-commit: 519d81956ee277b4419c723adfb154603c2565ba
