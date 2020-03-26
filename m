Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214D194A6C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F036E35F;
	Thu, 26 Mar 2020 21:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C216E35F;
 Thu, 26 Mar 2020 21:21:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7d1cb70000>; Thu, 26 Mar 2020 14:20:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 26 Mar 2020 14:21:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 26 Mar 2020 14:21:08 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Mar
 2020 21:21:03 +0000
Subject: Re: [PATCH v2 hmm 0/9] Small hmm_range_fault() cleanups
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200324011457.2817-1-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <5e67c250-c9bb-b1e4-76b2-a39fdd662bfe@nvidia.com>
Date: Thu, 26 Mar 2020 14:21:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200324011457.2817-1-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585257655; bh=oXPHGXFX+xdQ2OpJS4iYalwad2q1pcv0CfYOiuXpQqQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=guWsfKjdNoBnYltV02M5EnVNM2knv6A2SjDk+2Jb1qdH8A4Zc9vGVgjfOuoG8hXbA
 s/pcQjd/6d6jm1i3QdlNR/Wp8vhqP7mWTNq3ytlPTc+T8pwSfk/61xP0XKsBQ7Zhkj
 xeqJqtmIjvC0ctqJZqa3RT+3Dsa1xFFabDbWIeavK1CpdP2KyVgax5WTKiflyWcYlW
 8yMpSgn4tZ/lbFO5g8vfqILB9k36Nu7e7q9XX7rTQpnD0shzzLzzmwEzlTGvYVNK5v
 o4Sv75bY3Jx7hmnhgzjLBXXd0HwaYIW/uxPZ4+p70XghE88ieRZKE53u1QjFnhIrK3
 Tafm0S76zCSVg==
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


On 3/23/20 6:14 PM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> This is v2 of the first simple series with a few additional patches of little
> adjustments.
> 
> This needs an additional patch to the hmm tester:
> 
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 033a12c7ab5b6d..da15471a2bbf9a 100644
> --- a/tools/testing/selftests/vm/hmm-tests.c
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -1274,7 +1274,7 @@ TEST_F(hmm2, snapshot)
>   	/* Check what the device saw. */
>   	m = buffer->mirror;
>   	ASSERT_EQ(m[0], HMM_DMIRROR_PROT_ERROR);
> -	ASSERT_EQ(m[1], HMM_DMIRROR_PROT_NONE);
> +	ASSERT_EQ(m[1], HMM_DMIRROR_PROT_ERROR);
>   	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
>   	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
>   	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
> 
> v2 changes:
>   - Simplify and rename the flags, rework hmm_vma_walk_test in patch 2 (CH)
>   - Adjust more comments in patch 3 (CH, Ralph)
>   - Put the ugly boolean logic into a function in patch 3 (CH)
>   - Update commit message of patch 4 (CH)
>   - Adjust formatting in patch 5 (CH)
>   Patches 6, 7, 8 are new
> 
> v1: https://lore.kernel.org/r/20200320164905.21722-1-jgg@ziepe.ca
> 
> Jason Gunthorpe (9):
>    mm/hmm: remove pgmap checking for devmap pages
>    mm/hmm: return the fault type from hmm_pte_need_fault()
>    mm/hmm: remove unused code and tidy comments
>    mm/hmm: remove HMM_FAULT_SNAPSHOT
>    mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE #ifdef
>    mm/hmm: use device_private_entry_to_pfn()
>    mm/hmm: do not unconditionally set pfns when returning EBUSY
>    mm/hmm: do not set pfns when returning an error code
>    mm/hmm: return error for non-vma snapshots
> 
>   Documentation/vm/hmm.rst                |  12 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |   2 +-
>   drivers/gpu/drm/nouveau/nouveau_svm.c   |   2 +-
>   include/linux/hmm.h                     | 109 +--------
>   mm/hmm.c                                | 312 ++++++++++--------------
>   5 files changed, 133 insertions(+), 304 deletions(-)
> 

I was able to recompile Karol Herbst's mesa tree and Jerome's SVM tests to
test this with nouveau so for the series you can add,
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
