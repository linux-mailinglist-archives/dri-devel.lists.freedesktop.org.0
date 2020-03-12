Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32261826B1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 02:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AC06EA11;
	Thu, 12 Mar 2020 01:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8CD89A5C;
 Thu, 12 Mar 2020 01:38:10 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6992540000>; Wed, 11 Mar 2020 18:37:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 11 Mar 2020 18:38:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 11 Mar 2020 18:38:09 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 01:38:07 +0000
Subject: Re: [PATCH hmm 8/8] mm/hmm: add missing call to hmm_pte_need_fault in
 HMM_PFN_SPECIAL handling
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-9-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <2feb1061-09b9-766d-3d0d-be17debedde8@nvidia.com>
Date: Wed, 11 Mar 2020 18:38:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200311183506.3997-9-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583977044; bh=TeIeAHJ8Ep5pjoo7cziGM/eX3EFeJGJdqZCXIdNjLkY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=fSpB6u5RJxL5Ws6WRwyo0MDxd1wwB/p/tYs2GJJQ86w5OykymtKp01xcWGqBxKFyB
 EcwFhSJWy/Z3CzpI5sdXwxyqBy0Nmoqju318rE7SqcjIURSHLN8w5r//rf0Ut7qf+l
 hjUs/PEeQi2X01Dg2ygewCc/6EEGpOVlHnTxKQwzQviYIEkowxD/y3DPyQCwWVZBn4
 UuACQ2qhLoRf3aDxtQgZJS3mAj+Ul4Yd4tsx4LvogUBd0LC/hvtqtVEt6abck2uSix
 CTHhQit97LsJ0KJTuKnGbKPzZZwmZZ8kSdnLCn2f1AYCSSMwYdbJFj5Vni5zJ/XHny
 NRfZ8z0fhTNvA==
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
> Currently if a special PTE is encountered hmm_range_fault() immediately
> returns EFAULT and sets the HMM_PFN_SPECIAL error output (which nothing
> uses).
> 
> EFAULT should only be returned after testing with hmm_pte_need_fault().
> 
> Also pte_devmap() and pte_special() are exclusive, and there is no need to
> check IS_ENABLED, pte_special() is stubbed out to return false on
> unsupported architectures.
> 
> Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   mm/hmm.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index f61fddf2ef6505..ca33d086bdc190 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -335,16 +335,21 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   			pte_unmap(ptep);
>   			return -EBUSY;
>   		}
> -	} else if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) && pte_special(pte)) {
> -		if (!is_zero_pfn(pte_pfn(pte))) {
> +	}
> +
> +	/*
> +	 * Since each architecture defines a struct page for the zero page, just
> +	 * fall through and treat it like a normal page.
> +	 */
> +	if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
> +		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
> +				   &write_fault);
> +		if (fault || write_fault) {
>   			pte_unmap(ptep);
> -			*pfn = range->values[HMM_PFN_SPECIAL];
>   			return -EFAULT;
>   		}
> -		/*
> -		 * Since each architecture defines a struct page for the zero
> -		 * page, just fall through and treat it like a normal page.
> -		 */
> +		*pfn = range->values[HMM_PFN_SPECIAL];
> +		return 0;
>   	}
>   
>   	*pfn = hmm_device_entry_from_pfn(range, pte_pfn(pte)) | cpu_flags;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
