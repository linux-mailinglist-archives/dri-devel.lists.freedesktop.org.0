Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15621826A0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 02:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924AA6EA08;
	Thu, 12 Mar 2020 01:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1026EA03;
 Thu, 12 Mar 2020 01:28:32 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6990320000>; Wed, 11 Mar 2020 18:28:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 11 Mar 2020 18:28:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 11 Mar 2020 18:28:31 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 01:28:30 +0000
Subject: Re: [PATCH hmm 1/8] mm/hmm: add missing unmaps of the ptep during
 hmm_vma_handle_pte()
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-2-jgg@ziepe.ca>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1cfdfdff-6d41-b73a-fe48-c7a10c221482@nvidia.com>
Date: Wed, 11 Mar 2020 18:28:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200311183506.3997-2-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583976498; bh=EHutxl2gy79IofDsdKbyczDfHdWQ2w9tZDEpao1aPoI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=rs6KvATAP7bVK2aijXNSVUJhskyJV8LMYyzLv/oG+mRxQGAclrCq/Mp6mugY11kJo
 wMkgLPz8J14xin3aL+5G176lScaimgFdcMyAoSKgJfemy68BU5tsR+gyIGrnc/PIA/
 xnUNjg4bgGiIEQDIuzjDmI6jNlmwIU6gV9/kTQGhaTUkEIDLJ5TKbiS3mucJmI1tNM
 LcynFXlAfFJ6sj7QHwcoi5Kc/Km0KWd6rZziAFNpj9bQ0xVONQ6yr13q3PZkZ8iw7w
 6p+YYKDXdmDODPJKSsfk9aH36pCF/Q0y9QNAEZYseed7CkFxnMReljBnJ7h72wYkr4
 FGr9kqcGnQaNg==
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/11/20 11:34 AM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> Many of the direct returns of error skipped doing the pte_unmap(). All non
> zero exit paths must unmap the pte.
> 
> The pte_unmap() is split unnaturally like this because some of the error
> exit paths trigger a sleep and must release the lock before sleeping.
> 
> Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")
> Fixes: 53f5c3f489ec ("mm/hmm: factor out pte and pmd handling to simplify hmm_vma_walk_pmd()")
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

The changes look OK to me but one issue noted below.
In any case, you can add:
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   mm/hmm.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 72e5a6d9a41756..35f85424176d14 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -325,6 +325,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   		}
>   
>   		/* Report error for everything else */
> +		pte_unmap(ptep);
>   		*pfn = range->values[HMM_PFN_ERROR];
>   		return -EFAULT;
>   	} else {
> @@ -339,10 +340,13 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   	if (pte_devmap(pte)) {
>   		hmm_vma_walk->pgmap = get_dev_pagemap(pte_pfn(pte),
>   					      hmm_vma_walk->pgmap);
> -		if (unlikely(!hmm_vma_walk->pgmap))
> +		if (unlikely(!hmm_vma_walk->pgmap)) {
> +			pte_unmap(ptep);
>   			return -EBUSY;
> +		}
>   	} else if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) && pte_special(pte)) {
>   		if (!is_zero_pfn(pte_pfn(pte))) {
> +			pte_unmap(ptep);
>   			*pfn = range->values[HMM_PFN_SPECIAL];
>   			return -EFAULT;
>   		}
> @@ -437,7 +441,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   
>   		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, &pfns[i]);
>   		if (r) {
> -			/* hmm_vma_handle_pte() did unmap pte directory */
> +			/* hmm_vma_handle_pte() did pte_unmap() */
>   			hmm_vma_walk->last = addr;
>   			return r;
>   		}
> 

I think there is a case where hmm_vma_handle_pte() is called, a fault is requested,
pte_unmap() and hmm_vma_walk_hole_() are called, the latter returns zero (the fault
was handled OK), but now the page table is unmapped for successive loop iterations
and pte_unmap(ptep - 1) is called at the loop end.
Since this isn't an issue on x86_64 but is on x86_32, I can see how it could be missed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
