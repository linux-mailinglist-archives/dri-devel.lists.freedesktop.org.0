Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4F18D7D8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 19:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AFD6EB53;
	Fri, 20 Mar 2020 18:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36616EB4A;
 Fri, 20 Mar 2020 18:51:51 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7510630000>; Fri, 20 Mar 2020 11:50:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Mar 2020 11:51:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Mar 2020 11:51:51 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Mar
 2020 18:51:50 +0000
Subject: Re: [PATCH hmm 0/6] Small hmm_range_fault() cleanups
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 <Felix.Kuehling@amd.com>
References: <20200320164905.21722-1-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <030773be-3ea0-033e-051e-a3c0a13ef709@nvidia.com>
Date: Fri, 20 Mar 2020 11:51:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200320164905.21722-1-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584730212; bh=mAHlRo9I+8ZujdHfQUk9hCx9q7hSh43W1iBJqagD9Xk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FAg58DBz5loqn5y66iUh+WutDhpP9oPgedbSCv9lTmIWXG164FfMzE1ccDDSlG9bx
 ZDI9l997OQRTzzltvaGVp7CBqjov1sydGtA7dzKn5/xEaUDzp3pp4a7mL4o/QJTP7K
 AQ+Dlst+Zr+zM6ST/6QXjGp0HnpoVsivK6zpf6gHgoK2DrBC/sOBqnOf/LpWsbrR7S
 TvISRxRmEy4i5g+tLkZP+hE5BCWU9WBU7ifs9vv21PX0MecykCjBHlQIBKchlbhLQb
 fwzApm6cJxvxaIaeCznSdDH7rMXZezhQv/rE0FWAE6braynOB20zBwGx/+504WHWkw
 VIqaxAh6CJoog==
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


On 3/20/20 9:48 AM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> I've had these in my work queue for a bit, nothing profound here, just some
> small edits for clarity.

The hmm tester changes are clear enough but I'm having a bit of trouble figuring out
what this series applies cleanly to since I'm trying to apply it on top of the
other patches you and Christoph have sent out.
Is there a private git tree/branch where everything is applied?


> Ralph's hmm tester will need a small diff to work after this - which
> illustrates how setting default_flags == 0 is the same as what was called
> SNAPSHOT:
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 6ca953926dc13f..5f31f5b3e64cb9 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -300,7 +300,7 @@ static int dmirror_range_fault(struct dmirror *dmirror,
>   
>   		range->notifier_seq = mmu_interval_read_begin(range->notifier);
>   		down_read(&mm->mmap_sem);
> -		count = hmm_range_fault(range, 0);
> +		count = hmm_range_fault(range);
>   		up_read(&mm->mmap_sem);
>   		if (count <= 0) {
>   			if (count == 0 || count == -EBUSY)
> @@ -337,8 +337,7 @@ static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
>   		.flags = dmirror_hmm_flags,
>   		.values = dmirror_hmm_values,
>   		.pfn_shift = DPT_SHIFT,
> -		.pfn_flags_mask = ~(dmirror_hmm_flags[HMM_PFN_VALID] |
> -				    dmirror_hmm_flags[HMM_PFN_WRITE]),
> +		.pfn_flags_mask = 0,
>   		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
>   				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
>   		.dev_private_owner = dmirror->mdevice,
> @@ -872,7 +871,7 @@ static int dmirror_range_snapshot(struct dmirror *dmirror,
>   		range->notifier_seq = mmu_interval_read_begin(range->notifier);
>   
>   		down_read(&mm->mmap_sem);
> -		count = hmm_range_fault(range, HMM_FAULT_SNAPSHOT);
> +		count = hmm_range_fault(range);
>   		up_read(&mm->mmap_sem);
>   		if (count <= 0) {
>   			if (count == 0 || count == -EBUSY)
> @@ -916,7 +915,7 @@ static int dmirror_snapshot(struct dmirror *dmirror,
>   		.flags = dmirror_hmm_flags,
>   		.values = dmirror_hmm_values,
>   		.pfn_shift = DPT_SHIFT,
> -		.pfn_flags_mask = ~0ULL,
> +		.pfn_flags_mask = 0,
>   		.dev_private_owner = dmirror->mdevice,
>   	};
>   	int ret = 0;
> 
> Jason Gunthorpe (6):
>    mm/hmm: remove pgmap checking for devmap pages
>    mm/hmm: return the fault type from hmm_pte_need_fault()
>    mm/hmm: remove unused code and tidy comments
>    mm/hmm: remove HMM_FAULT_SNAPSHOT
>    mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE #ifdef
>    mm/hmm: use device_private_entry_to_pfn()
> 
>   Documentation/vm/hmm.rst                |  12 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |   2 +-
>   drivers/gpu/drm/nouveau/nouveau_svm.c   |   2 +-
>   include/linux/hmm.h                     |  55 +-----
>   mm/hmm.c                                | 238 +++++++++---------------
>   5 files changed, 98 insertions(+), 211 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
