Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75543183D95
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 00:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49476EB5E;
	Thu, 12 Mar 2020 23:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEF46EB5D;
 Thu, 12 Mar 2020 23:50:22 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6aca900000>; Thu, 12 Mar 2020 16:49:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 12 Mar 2020 16:50:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 12 Mar 2020 16:50:22 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 23:50:21 +0000
Subject: Re: [PATCH hmm 9/8] mm/hmm: do not check pmd_protnone twice in
 hmm_vma_handle_pmd()
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200312193310.GA1190@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e02e3adf-5320-0c9a-63d4-13d0d5dca086@nvidia.com>
Date: Thu, 12 Mar 2020 16:50:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200312193310.GA1190@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584056976; bh=aQ7MGcgWWA7Gw37+lSs7CbvLiWZTO8XM95c59ZBgdKg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Yjw6gyMW0BovQBnuixd3cn86pt/2gu0Ac7NS1EnrlfxR7BcgErUjUkaNBWBnWSs0C
 9F/zA30YH9bMAPNXu2Nr8PI3K9ZpeUmb5sbe4/Dc+V54R0Wv6WLNsx84vq7EJwran4
 gcySY5TUcmBxxGCC3Dm79KkOwpO8r+SVf9oXVGcyPMffb5pUJUU8AwjqTPQ0KOmNsF
 8nccy22VR59NWO9vtEs5Uys8+6xnGlNvFd8ns+yqIJ7oor9dPe7QJG5pEmG0tR6IfW
 ioJqV0YRdsx0vDGo+QtSjwzFKi7XEnibWrNKLL48QDZFzbTcjsPzlozJ46kwdQlcN8
 hyqUxrvZOJYFw==
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
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/12/20 12:33 PM, Jason Gunthorpe wrote:
> pmd_to_hmm_pfn_flags() already checks it and makes the cpu flags 0. If no
> fault is requested then the pfns should be returned with the not valid
> flags.
> 
> It should not unconditionally fault if faulting is not requested.
> 
> Fixes: 2aee09d8c116 ("mm/hmm: change hmm_vma_fault() to allow write fault on page basis")
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Looks good to me.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   mm/hmm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Bonus patch, this one got found after I made the series..
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index ca33d086bdc190..6d9da4b0f0a9f8 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -226,7 +226,7 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
>   	hmm_range_need_fault(hmm_vma_walk, pfns, npages, cpu_flags,
>   			     &fault, &write_fault);
>   
> -	if (pmd_protnone(pmd) || fault || write_fault)
> +	if (fault || write_fault)
>   		return hmm_vma_walk_hole_(addr, end, fault, write_fault, walk);
>   
>   	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
