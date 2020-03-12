Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D81826A4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 02:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268216EA0C;
	Thu, 12 Mar 2020 01:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2A5893D5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 01:31:03 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e69907a0001>; Wed, 11 Mar 2020 18:29:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 11 Mar 2020 18:31:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 11 Mar 2020 18:31:02 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 01:31:02 +0000
Subject: Re: [PATCH hmm 3/8] mm/hmm: do not call hmm_vma_walk_hole() while
 holding a spinlock
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-4-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <15a98fb9-3cd7-1b90-62c3-63cec9fb4dfd@nvidia.com>
Date: Wed, 11 Mar 2020 18:31:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200311183506.3997-4-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583976571; bh=C7QSi5QmPglrZ6lPApKb/JmgZcferLzgKEEjycKR6XY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=lMaXCs3oS+5Krf7Az8kZ5Fb21HUoAZGlad6H7KtyHdZOaWcZlGzoT79Eu8r2O5/MC
 SRong1QCWZan1/VOeOAa3xw6ImRSyPyAnrNWMcpgBFhcA++9xPUgXTGuNJwhTusgPd
 HXJKWH6DSkwKSGF4wfh4y5mHofNvV3wTDKq5DX6MPVoCyrj6CS0s2p8vqo8bsFZP8n
 tt5+xms6hnUQ6HAR/MD5Ijqy9flVxGD8xvIrRjT/eWvJJdoCQ/Bg61WJ45V1UyN4FR
 6q4YRoOvVIqdI7gE8Y8hIqKvK9Y23BpaSCIHE8Rd5WRTdpYbRvc/cjssbmvNGm3yue
 d6tgrSd7g9uhg==
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
 amd-gfx@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/11/20 11:35 AM, Jason Gunthorpe wrote:
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

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

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
