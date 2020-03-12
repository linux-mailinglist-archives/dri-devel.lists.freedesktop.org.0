Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F841826A2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 02:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022B66EA03;
	Thu, 12 Mar 2020 01:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418766EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 01:29:43 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e69902a0000>; Wed, 11 Mar 2020 18:28:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Mar 2020 18:29:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Mar 2020 18:29:42 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 01:29:37 +0000
Subject: Re: [PATCH hmm 2/8] mm/hmm: don't free the cached pgmap while scanning
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-3-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <b9e1d7d9-954f-c1ab-5c31-47f0db747984@nvidia.com>
Date: Wed, 11 Mar 2020 18:29:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200311183506.3997-3-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583976491; bh=vvQwvOjCh/DlYeQK6g90hZNrTaVRDvFsFH5OQm4yQEM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=TKd7C5wkPf0VcULY3c+shsY/7ftoIUWajrvx66bKbgN/D0HM2HxNPyNfz4qZR2Jrv
 cuzHFY3ATRsbAKtVMq6H0uLUIV3MU6oTt1zyeKQpoA02unkvmzjFNfF6mL8cOs1zX1
 47fRhhLEtThcvN3OahDysxVm32f44Jp8noOHHAwT+colYVNkk5ejbW2x3w1f2olsab
 W1IHpqeIhqYuNR5JQCuh5kPc+SbAbrw+l/0kgyhUeIFSfW4CzAm8PUQed2CiJ2/aX/
 FoEqE4v/GariLk9qmP8Pm3nkAy+0HaS+s6nVVkP3QuCIBJjDBWn7VMOf9ndoqe/fcg
 bCR3A8WHN8B6g==
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
> The pgmap is held in the hmm_vma_walk variable in hope of speeding up
> future get_dev_pagemap() calls by hitting the same pointer. The algorithm
> doesn't actually care about how long the pgmap is held for.
> 
> Move the put of the cached pgmap to after the walk is completed and delete
> all the other now redundant puts.
> 
> This solves a possible leak of the reference in hmm_vma_walk_pmd() if a
> hmm_vma_handle_pte() fails while looping.
> 
> Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   mm/hmm.c | 31 +++++++++----------------------
>   1 file changed, 9 insertions(+), 22 deletions(-)
> 
> We talked about just deleting this stuff, but I think it makes alot sense for
> hmm_range_fault() to trigger fault on devmap pages that are not compatible
> with the caller - so lets just fix the leak on error path for now.
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 35f85424176d14..9e8f68eb83287a 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -239,10 +239,6 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
>   		}
>   		pfns[i] = hmm_device_entry_from_pfn(range, pfn) | cpu_flags;
>   	}
> -	if (hmm_vma_walk->pgmap) {
> -		put_dev_pagemap(hmm_vma_walk->pgmap);
> -		hmm_vma_walk->pgmap = NULL;
> -	}
>   	hmm_vma_walk->last = end;
>   	return 0;
>   }
> @@ -360,10 +356,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   	return 0;
>   
>   fault:
> -	if (hmm_vma_walk->pgmap) {
> -		put_dev_pagemap(hmm_vma_walk->pgmap);
> -		hmm_vma_walk->pgmap = NULL;
> -	}
>   	pte_unmap(ptep);
>   	/* Fault any virtual address we were asked to fault */
>   	return hmm_vma_walk_hole_(addr, end, fault, write_fault, walk);
> @@ -446,16 +438,6 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
>   			return r;
>   		}
>   	}
> -	if (hmm_vma_walk->pgmap) {
> -		/*
> -		 * We do put_dev_pagemap() here and not in hmm_vma_handle_pte()
> -		 * so that we can leverage get_dev_pagemap() optimization which
> -		 * will not re-take a reference on a pgmap if we already have
> -		 * one.
> -		 */
> -		put_dev_pagemap(hmm_vma_walk->pgmap);
> -		hmm_vma_walk->pgmap = NULL;
> -	}
>   	pte_unmap(ptep - 1);
>   
>   	hmm_vma_walk->last = addr;
> @@ -529,10 +511,6 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>   			pfns[i] = hmm_device_entry_from_pfn(range, pfn) |
>   				  cpu_flags;
>   		}
> -		if (hmm_vma_walk->pgmap) {
> -			put_dev_pagemap(hmm_vma_walk->pgmap);
> -			hmm_vma_walk->pgmap = NULL;
> -		}
>   		hmm_vma_walk->last = end;
>   		goto out_unlock;
>   	}
> @@ -694,6 +672,15 @@ long hmm_range_fault(struct hmm_range *range, unsigned int flags)
>   			return -EBUSY;
>   		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
>   				      &hmm_walk_ops, &hmm_vma_walk);
> +		/*
> +		 * A pgmap is kept cached in the hmm_vma_walk to avoid expensive
> +		 * searching in the probably common case that the pgmap is the
> +		 * same for the entire requested range.
> +		 */
> +		if (hmm_vma_walk.pgmap) {
> +			put_dev_pagemap(hmm_vma_walk.pgmap);
> +			hmm_vma_walk.pgmap = NULL;
> +		}
>   	} while (ret == -EBUSY);
>   
>   	if (ret)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
