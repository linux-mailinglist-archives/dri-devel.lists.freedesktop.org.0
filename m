Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DEA9BD305
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6710E08F;
	Tue,  5 Nov 2024 16:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MQdyGYYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B3D10E08F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 16:59:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2166AA43645;
 Tue,  5 Nov 2024 16:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00F0C4CECF;
 Tue,  5 Nov 2024 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730825988;
 bh=dXzzyTpKChnv8xjtW59R25y4rKYjWCOZ+MrqN2ID5r4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MQdyGYYKJ2oarUM+0KYSzq1hEB6aeZPBgZeuW9VVMJzOR/EKO9TxKEzhv5PmyBYNR
 VgL3g9nq50B150Qs+/DPD4muL4glTnulkDkF5fRtyYGUgbCrgDzzgvwf2M1oQtWqos
 8XhS/tn0j0FSxbOZTEeukWve9yRXragWtcoKC3jdmZV/d9uPy2wg6EB1ydZz8U1Obe
 gMOuoqK2XglFhGSdX86oRvYfnjGW+S5O8/5iZWNv9T+GqT2OHi8gXnMgTxKE/qgK8d
 ffX4Y/+VFvIUiUOWk1L5Ky2G++HqpPdSXTcskbOg8BsY3SJMN2s/fZ1M3r32ugeKfU
 qqmu4OUKrRZiQ==
Date: Tue, 5 Nov 2024 16:59:43 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
Message-ID: <20241105165942.GB12923@willie-the-truck>
References: <2-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
 <cf17dc41-f72a-4d90-a78d-2d90fa0ac243@arm.com>
 <20241104200951.GE10193@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104200951.GE10193@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 04, 2024 at 04:09:51PM -0400, Jason Gunthorpe wrote:
> Runs OK now:
> 
> arm-v7s io-pgtable: self test ok
> arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 32
> 
> Jason
> 
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -819,7 +819,7 @@ static int __init arm_v7s_do_selftests(void)
>  		.quirks = IO_PGTABLE_QUIRK_ARM_NS,
>  		.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
>  	};
> -	unsigned int iova, size, iova_start;
> +	unsigned int iova, size;
>  	unsigned int i, loopnr = 0;
>  	size_t mapped;
>  
> @@ -871,25 +871,6 @@ static int __init arm_v7s_do_selftests(void)
>  		loopnr++;
>  	}
>  
> -	/* Partial unmap */
> -	i = 1;
> -	size = 1UL << __ffs(cfg.pgsize_bitmap);
> -	while (i < loopnr) {
> -		iova_start = i * SZ_16M;
> -		if (ops->unmap_pages(ops, iova_start + size, size, 1, NULL) != size)
> -			return __FAIL(ops);
> -
> -		/* Remap of partial unmap */
> -		if (ops->map_pages(ops, iova_start + size, size, size, 1,
> -				   IOMMU_READ, GFP_KERNEL, &mapped))
> -			return __FAIL(ops);
> -
> -		if (ops->iova_to_phys(ops, iova_start + size + 42)
> -		    != (size + 42))
> -			return __FAIL(ops);
> -		i++;
> -	}
> -
>  	/* Full unmap */
>  	iova = 0;
>  	for_each_set_bit(i, &cfg.pgsize_bitmap, BITS_PER_LONG) {

Yup, and you can do the same for the other selftest in io-pgtable-arm.c

Will
