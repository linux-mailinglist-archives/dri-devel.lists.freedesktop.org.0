Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 200821826AF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 02:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0A8997E;
	Thu, 12 Mar 2020 01:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0612F6EA10;
 Thu, 12 Mar 2020 01:36:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6991d40002>; Wed, 11 Mar 2020 18:35:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Mar 2020 18:36:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Mar 2020 18:36:48 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 01:36:48 +0000
Subject: Re: [PATCH hmm 7/8] mm/hmm: return -EFAULT when setting HMM_PFN_ERROR
 on requested valid pages
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-8-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <910ae485-5400-3795-4353-ce4d47e3ae52@nvidia.com>
Date: Wed, 11 Mar 2020 18:36:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200311183506.3997-8-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583976917; bh=D5vA/gew9PQbmFP152h8WditcZShifYYEflcGJvx+RQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ZQ/C0dtfgd2DvMlbbkWQ+IYNxDMH4E2qkMZALJ8th50XsnT+w22nPEmIfXqKOSqU/
 sgmrLJ/Yn+HbPAEUu0kJ+ndrGzM6lXwshZbHHuz7Dpt0m8jY+wJfnnVp3vmo30+VqY
 ZOryP0ahkj9qtAqP2uKGGJj79I2+lNtE7Ov6g3LWZZEpMnJxIv1nszqgZ/tQSaoU59
 yIBUqbdVEPPjnk6r7SgmeD7sTWTNWXK0K0ahSMd4+xHoyDyq02Af8wA/lCo+zDB8/p
 Gj/ZA5zqK280SISy9D9ny75tP3CfqhokhHfWTHRL2PKZ2acGj00qp0OtixLDax7Had
 mRG5RTvaC43bQ==
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


On 3/11/20 11:35 AM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> hmm_range_fault() should never return 0 if the caller requested a valid
> page, but the pfns output for that page would be HMM_PFN_ERROR.
> 
> hmm_pte_need_fault() must always be called before setting HMM_PFN_ERROR to
> detect if the page is in faulting mode or not.
> 
> Fix two cases in hmm_vma_walk_pmd() and reorganize some of the duplicated
> code.
> 
> Fixes: d08faca018c4 ("mm/hmm: properly handle migration pmd")
> Fixes: da4c3c735ea4 ("mm/hmm/mirror: helper to snapshot CPU page table")
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   mm/hmm.c | 38 +++++++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index bf676cfef3e8ee..f61fddf2ef6505 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -363,8 +363,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   {
>   	struct hmm_vma_walk *hmm_vma_walk = walk->private;
>   	struct hmm_range *range = hmm_vma_walk->range;
> -	uint64_t *pfns = range->pfns;
> -	unsigned long addr = start, i;
> +	uint64_t *pfns = &range->pfns[(start - range->start) >> PAGE_SHIFT];
> +	unsigned long npages = (end - start) >> PAGE_SHIFT;
> +	unsigned long addr = start;
> +	bool fault, write_fault;
>   	pte_t *ptep;
>   	pmd_t pmd;
>   
> @@ -374,14 +376,6 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   		return hmm_vma_walk_hole(start, end, -1, walk);
>   
>   	if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
> -		bool fault, write_fault;
> -		unsigned long npages;
> -		uint64_t *pfns;
> -
> -		i = (addr - range->start) >> PAGE_SHIFT;
> -		npages = (end - addr) >> PAGE_SHIFT;
> -		pfns = &range->pfns[i];
> -
>   		hmm_range_need_fault(hmm_vma_walk, pfns, npages,
>   				     0, &fault, &write_fault);
>   		if (fault || write_fault) {
> @@ -390,8 +384,15 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   			return -EBUSY;
>   		}
>   		return hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
> -	} else if (!pmd_present(pmd))
> +	}
> +
> +	if (!pmd_present(pmd)) {
> +		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
> +				     &write_fault);
> +		if (fault || write_fault)
> +			return -EFAULT;
>   		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);

Shouldn't this fill with HMM_PFN_NONE instead of HMM_PFN_ERROR?
Otherwise, when a THP is swapped out, you will get a different
value than if a PTE is swapped out and you are prefetching/snapshotting.

> +	}
>   
>   	if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
>   		/*
> @@ -408,8 +409,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   		if (!pmd_devmap(pmd) && !pmd_trans_huge(pmd))
>   			goto again;
>   
> -		i = (addr - range->start) >> PAGE_SHIFT;
> -		return hmm_vma_handle_pmd(walk, addr, end, &pfns[i], pmd);
> +		return hmm_vma_handle_pmd(walk, addr, end, pfns, pmd);
>   	}
>   
>   	/*
> @@ -418,15 +418,19 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   	 * entry pointing to pte directory or it is a bad pmd that will not
>   	 * recover.
>   	 */
> -	if (pmd_bad(pmd))
> +	if (pmd_bad(pmd)) {
> +		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
> +				     &write_fault);
> +		if (fault || write_fault)
> +			return -EFAULT;
>   		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
> +	}
>   
>   	ptep = pte_offset_map(pmdp, addr);
> -	i = (addr - range->start) >> PAGE_SHIFT;
> -	for (; addr < end; addr += PAGE_SIZE, ptep++, i++) {
> +	for (; addr < end; addr += PAGE_SIZE, ptep++, pfns++) {
>   		int r;
>   
> -		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, &pfns[i]);
> +		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, pfns);
>   		if (r) {
>   			/* hmm_vma_handle_pte() did pte_unmap() */
>   			hmm_vma_walk->last = addr;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
