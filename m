Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA7282307
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAA86E2D5;
	Sat,  3 Oct 2020 09:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3D26E0E9;
 Fri,  2 Oct 2020 16:11:55 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f77513e0001>; Fri, 02 Oct 2020 09:11:42 -0700
Received: from [172.27.0.47] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 16:11:36 +0000
Subject: Re: [PATCH rdma-next v4 1/4] lib/scatterlist: Add support in dynamic
 allocation of SG table from pages
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-2-leon@kernel.org>
 <20201002150227.GA1350139@nvidia.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <ba152cb1-db38-0d70-08a8-ba3c052b5b4e@nvidia.com>
Date: Fri, 2 Oct 2020 19:11:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201002150227.GA1350139@nvidia.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601655102; bh=EynyS8/xmNH/jvPIX2n0LxQ51EmsDlmuClzFEzoFwtY=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=Ew/scpFv/p/DET27LPs1qCoK9j94h5PT7f3jVd6smC1vBRQjUbszjKiqgX+qBupVv
 C6Ap0r8CN73haCwUeNcoo6Qvqo3hdNNInzqCL4n7E/HsfEsqKVgqFv3O0KMzSwupuw
 RzZ06fdxXjrxpBA/XFdREHNdHHZPXltw4NaXEKbPvWDITA43waFAQwniY0dQO4EmCC
 FSvpqv++iX7ScnqVLK+t99lV0afYVEm0kREQriRvipkBUe+wsDI1l/t8HiMxZ5Yd+L
 pObyZTgYDV2byyHXLMJjj6ttCUIsz3Y9DqLaFc50bRq/5Q9UJSg2Xv8rRMAqZ74RhA
 OBJmWwKCnxY0Q==
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-rdma@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@mellanox.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/2/2020 6:02 PM, Jason Gunthorpe wrote:
> On Sun, Sep 27, 2020 at 09:46:44AM +0300, Leon Romanovsky wrote:
>> +struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
>> +		struct page **pages, unsigned int n_pages, unsigned int offset,
>> +		unsigned long size, unsigned int max_segment,
>> +		struct scatterlist *prv, unsigned int left_pages,
>> +		gfp_t gfp_mask)
>>   {
>> -	unsigned int chunks, cur_page, seg_len, i;
>> +	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
>> +	struct scatterlist *s = prv;
>> +	unsigned int table_size;
>> +	unsigned int tmp_nents;
>>   	int ret;
>> -	struct scatterlist *s;
>>
>>   	if (WARN_ON(!max_segment || offset_in_page(max_segment)))
>> -		return -EINVAL;
>> +		return ERR_PTR(-EINVAL);
>> +	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +
>> +	tmp_nents = prv ? sgt->nents : 0;
>> +
>> +	if (prv &&
>> +	    page_to_pfn(sg_page(prv)) + (prv->length >> PAGE_SHIFT) ==
> This calculation of the end doesn't consider sg->offset

Right, should be fixed.
>
>> +	    page_to_pfn(pages[0]))
>> +		prv_len = prv->length;
>>
>>   	/* compute number of contiguous chunks */
>>   	chunks = 1;
>> @@ -410,13 +461,17 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
>>   		}
>>   	}
>>
>> -	ret = sg_alloc_table(sgt, chunks, gfp_mask);
>> -	if (unlikely(ret))
>> -		return ret;
>> +	if (!prv) {
>> +		/* Only the last allocation could be less than the maximum */
>> +		table_size = left_pages ? SG_MAX_SINGLE_ALLOC : chunks;
>> +		ret = sg_alloc_table(sgt, table_size, gfp_mask);
>> +		if (unlikely(ret))
>> +			return ERR_PTR(ret);
>> +	}
> This is basically redundant right? Now that get_next_sg() can allocate
> SGs it can just build them one by one, no need to preallocate.
>
> Actually all the changes the the allocation seem like overkill, just
> allocate a single new array directly in get_next_sg() whenever it
> needs.

No, only the last allocation could be less than maximum. (as written in 
the comment).
I am preferring to stick with the current implementation and fix the offset.
>
> Something like this:
>
> @@ -365,6 +372,37 @@ int sg_alloc_table(struct sg_table *table, unsigned int nents, gfp_t gfp_mask)
>   }
>   EXPORT_SYMBOL(sg_alloc_table);
>   
> +static struct scatterlist *get_next_sg(struct sg_table *table,
> +		struct scatterlist *cur, unsigned long needed_sges,
> +		gfp_t gfp_mask)
> +{
> +	struct scatterlist *new_sg;
> +	unsigned int alloc_size;
> +
> +	if (cur) {
> +		struct scatterlist *next_sg = sg_next(cur);
> +
> +		/* Check if last entry should be keeped for chainning */
> +		if (!sg_is_last(next_sg) || needed_sges == 1)
> +			return next_sg;
> +	}
> +
> +	alloc_size = min_t(unsigned long, needed_sges, SG_MAX_SINGLE_ALLOC);
> +	new_sg = sg_kmalloc(alloc_size, gfp_mask);
> +	if (!new_sg)
> +		return ERR_PTR(-ENOMEM);
> +	sg_init_table(new_sg, alloc_size);
> +	if (cur) {
> +		__sg_chain(cur, new_sg);
> +		table->orig_nents += alloc_size - 1;
> +	} else {
> +		table->sgl = new_sg;
> +		table->orig_nents = alloc_size;
> +		table->nents = 0;
> +	}
> +	return new_sg;
> +}
> +
>   /**
>    * __sg_alloc_table_from_pages - Allocate and initialize an sg table from
>    *			         an array of pages
> @@ -374,29 +412,64 @@ EXPORT_SYMBOL(sg_alloc_table);
>    * @offset:      Offset from start of the first page to the start of a buffer
>    * @size:        Number of valid bytes in the buffer (after offset)
>    * @max_segment: Maximum size of a scatterlist node in bytes (page aligned)
> + * @prv:	 Last populated sge in sgt
> + * @left_pages:  Left pages caller have to set after this call
>    * @gfp_mask:	 GFP allocation mask
>    *
> - *  Description:
> - *    Allocate and initialize an sg table from a list of pages. Contiguous
> - *    ranges of the pages are squashed into a single scatterlist node up to the
> - *    maximum size specified in @max_segment. An user may provide an offset at a
> - *    start and a size of valid data in a buffer specified by the page array.
> - *    The returned sg table is released by sg_free_table.
> + * Description:
> + *    If @prv is NULL, allocate and initialize an sg table from a list of pages,
> + *    else reuse the scatterlist passed in at @prv.
> + *    Contiguous ranges of the pages are squashed into a single scatterlist
> + *    entry up to the maximum size specified in @max_segment.  A user may
> + *    provide an offset at a start and a size of valid data in a buffer
> + *    specified by the page array.
>    *
>    * Returns:
> - *   0 on success, negative error on failure
> + *   Last SGE in sgt on success, PTR_ERR on otherwise.
> + *   The allocation in @sgt must be released by sg_free_table.
> + *
> + * Notes:
> + *   If this function returns non-0 (eg failure), the caller must call
> + *   sg_free_table() to cleanup any leftover allocations.
>    */
> -int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
> -				unsigned int n_pages, unsigned int offset,
> -				unsigned long size, unsigned int max_segment,
> -				gfp_t gfp_mask)
> +struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
> +		struct page **pages, unsigned int n_pages, unsigned int offset,
> +		unsigned long size, unsigned int max_segment,
> +		struct scatterlist *prv, unsigned int left_pages,
> +		gfp_t gfp_mask)
>   {
> -	unsigned int chunks, cur_page, seg_len, i;
> -	int ret;
> -	struct scatterlist *s;
> +	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
> +	unsigned int added_nents = 0;
> +	struct scatterlist *s = prv;
>   
>   	if (WARN_ON(!max_segment || offset_in_page(max_segment)))
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
> +	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	if (prv) {
> +		unsigned long paddr = (page_to_pfn(sg_page(prv)) * PAGE_SIZE +
> +				       prv->offset + prv->length) /
> +				      PAGE_SIZE;
> +
> +		if (WARN_ON(offset))
> +			return ERR_PTR(-EINVAL);
> +
> +		/* Merge contiguous pages into the last SG */
> +		prv_len = prv->length;
> +		while (n_pages && page_to_pfn(pages[0]) == paddr) {
> +			if (prv->length + PAGE_SIZE > max_segment)
> +				break;
> +			prv->length += PAGE_SIZE;
> +			paddr++;
> +			pages++;
> +			n_pages--;
> +		}
> +		if (!n_pages) {
> +			sg_mark_end(sg_next(prv));
> +			return prv;
> +		}
> +	}
>   
>   	/* compute number of contiguous chunks */
>   	chunks = 1;
> @@ -410,13 +483,9 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
>   		}
>   	}
>   
> -	ret = sg_alloc_table(sgt, chunks, gfp_mask);
> -	if (unlikely(ret))
> -		return ret;
> -
>   	/* merging chunks and putting them into the scatterlist */
>   	cur_page = 0;
> -	for_each_sg(sgt->sgl, s, sgt->orig_nents, i) {
> +	for (i = 0; i < chunks; i++) {
>   		unsigned int j, chunk_size;
>   
>   		/* look for the end of the current chunk */
> @@ -429,15 +498,28 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
>   				break;
>   		}
>   
> +		/* Pass how many chunks might be left */
> +		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask);
> +		if (IS_ERR(s)) {
> +			/*
> +			 * Adjust entry length to be as before function was
> +			 * called.
> +			 */
> +			if (prv)
> +				prv->length = prv_len;
> +			return s;
> +		}
>   		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
>   		sg_set_page(s, pages[cur_page],
>   			    min_t(unsigned long, size, chunk_size), offset);
> +		added_nents++;
>   		size -= chunk_size;
>   		offset = 0;
>   		cur_page = j;
>   	}
> -
> -	return 0;
> +	sgt->nents += added_nents;
> +	sg_mark_end(s);
> +	return s;
>   }
>   EXPORT_SYMBOL(__sg_alloc_table_from_pages);
>   
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
