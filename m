Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290F1C4AFF
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 02:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A02189DBC;
	Tue,  5 May 2020 00:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BE289DBC;
 Tue,  5 May 2020 00:21:00 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eb0b1260000>; Mon, 04 May 2020 17:19:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 17:20:59 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 May 2020 17:20:59 -0700
Received: from [10.2.56.198] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 00:20:59 +0000
Subject: Re: [PATCH hmm v2 2/5] mm/hmm: make hmm_range_fault return 0 or -1
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>, Ralph Campbell
 <rcampbell@nvidia.com>
References: <2-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <9cf9f4f0-58b7-1992-6c6e-eed226ba42c0@nvidia.com>
Date: Mon, 4 May 2020 17:20:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588637990; bh=IxP1FX28IvHHn1UJ333IIWhaZQbrlpthRJPkCq5tlOE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jlUDA7Xe/cEVYvcoOLBLT9WxsiTxB4eaIcRkJbYt7sChT+skJNIVNGkwSxeX311N9
 8Icf+Bb+N7FsISzQG4Ci4zeBXx95nSpEwUjZe7BytMfOd9TIqtDhoWdCDk3g2renix
 JJp4862GZJKQrIMSPPWchAxpo2TL3LdIgZ1nciGXyRvtuaWnU7bnlRQkU6QhCIwddA
 zZt1IUaeh+IgfHdHcJKHNaZAmd2XKaHg3iGk3SkLeBMTYoH9nYDLidjG4h/hxqZ6a6
 Hae57Q5zwNGF0Ax1wOvaZcYkMzvipoDz/QPdM+7uCWP3VezcDvR1L7Kvdm3oMQaoTe
 S2aJNC1fom1GQ==
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
Cc: amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-01 11:20, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> hmm_vma_walk->last is supposed to be updated after every write to the
> pfns, so that it can be returned by hmm_range_fault(). However, this is
> not done consistently. Fortunately nothing checks the return code of
> hmm_range_fault() for anything other than error.
> 
> More importantly last must be set before returning -EBUSY as it is used to
> prevent reading an output pfn as an input flags when the loop restarts.
> 
> For clarity and simplicity make hmm_range_fault() return 0 or -ERRNO. Only
> set last when returning -EBUSY.

Yes, this is also a nice simplification.

> ...
> @@ -590,10 +580,13 @@ long hmm_range_fault(struct hmm_range *range)
>   			return -EBUSY;
>   		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
>   				      &hmm_walk_ops, &hmm_vma_walk);
> +		/*
> +		 * When -EBUSY is returned the loop restarts with
> +		 * hmm_vma_walk.last set to an address that has not been stored
> +		 * in pfns. All entries < last in the pfn array are set to their
> +		 * output, and all >= are still at their input values.
> +		 */

I'm glad you added that comment. This is much easier to figure out with
that in place. After poking around this patch and eventually understanding the
.last handling, I wondered if you might like this slightly tweaked wording
instead:

		/*
		 * Each of the hmm_walk_ops routines returns -EBUSY if and only
		 * hmm_vma_walk.last has been set to an address that has not yet
		 * been stored in pfns. All entries < last in the pfn array are
		 * set to their output, and all >= are still at their input
		 * values.
		 */

Either way,

     Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA

>   	} while (ret == -EBUSY);
> -
> -	if (ret)
> -		return ret;
> -	return (hmm_vma_walk.last - range->start) >> PAGE_SHIFT;
> +	return ret;
>   }
>   EXPORT_SYMBOL(hmm_range_fault);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
