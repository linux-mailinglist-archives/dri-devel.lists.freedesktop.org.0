Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF030182B98
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387136E0B6;
	Thu, 12 Mar 2020 08:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B92ED6E09A;
 Thu, 12 Mar 2020 08:54:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46FC11FB;
 Thu, 12 Mar 2020 01:54:46 -0700 (PDT)
Received: from [10.57.15.252] (unknown [10.57.15.252])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 140973F67D;
 Thu, 12 Mar 2020 01:54:43 -0700 (PDT)
Subject: Re: [PATCH hmm 3/8] mm/hmm: do not call hmm_vma_walk_hole() while
 holding a spinlock
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-4-jgg@ziepe.ca>
From: Steven Price <steven.price@arm.com>
Message-ID: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
Date: Thu, 12 Mar 2020 08:54:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311183506.3997-4-jgg@ziepe.ca>
Content-Language: en-GB
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/03/2020 18:35, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> This eventually calls into handle_mm_fault() which is a sleeping function.
> Release the lock first.
> 
> hmm_vma_walk_hole() does not touch the contents of the PUD, so it does not
> need the lock.
> 
> Fixes: 3afc423632a1 ("mm: pagewalk: add p4d_entry() and pgd_entry()")
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Sorry about that, thanks for fixing.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   mm/hmm.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 9e8f68eb83287a..32dcbfd3908315 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -473,8 +473,8 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>   
>   	pud = READ_ONCE(*pudp);
>   	if (pud_none(pud)) {
> -		ret = hmm_vma_walk_hole(start, end, -1, walk);
> -		goto out_unlock;
> +		spin_unlock(ptl);
> +		return hmm_vma_walk_hole(start, end, -1, walk);
>   	}
>   
>   	if (pud_huge(pud) && pud_devmap(pud)) {
> @@ -483,8 +483,8 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>   		bool fault, write_fault;
>   
>   		if (!pud_present(pud)) {
> -			ret = hmm_vma_walk_hole(start, end, -1, walk);
> -			goto out_unlock;
> +			spin_unlock(ptl);
> +			return hmm_vma_walk_hole(start, end, -1, walk);
>   		}
>   
>   		i = (addr - range->start) >> PAGE_SHIFT;
> @@ -495,9 +495,9 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>   		hmm_range_need_fault(hmm_vma_walk, pfns, npages,
>   				     cpu_flags, &fault, &write_fault);
>   		if (fault || write_fault) {
> -			ret = hmm_vma_walk_hole_(addr, end, fault,
> -						 write_fault, walk);
> -			goto out_unlock;
> +			spin_unlock(ptl);
> +			return hmm_vma_walk_hole_(addr, end, fault, write_fault,
> +						  walk);
>   		}
>   
>   		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
