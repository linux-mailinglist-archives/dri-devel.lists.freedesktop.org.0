Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168259B9292
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7413710E9D2;
	Fri,  1 Nov 2024 13:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LcPIH2tV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CF910E9D2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 13:52:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03ED45CD100;
 Fri,  1 Nov 2024 11:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AF2C4CECD;
 Fri,  1 Nov 2024 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730462314;
 bh=wQJd1QeaY5fZACRK8ZUHBa2nukVJlXs5K5OJXkkqg1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LcPIH2tVnxOVyM+MqcErAO1FrH3NGliUPH2ix6SZspJbwRQ8na/OibDZ7bPQXeY2C
 wQNMZhW2B1UOQ7XXRd1N39J7f/fqMzo21s/DKvSmoYosGhseHaMde/KdQ49w40feG5
 7/vk5ynrSBMsvynwbpysOJDxGY2aiUf45fbT8t3EkllFzThkRDM+RUtqRzm/al7O2N
 7vKy6KL35pUoR0ywzEWmURuYc2qTdG1PKOAjv3daNRCEMG5e1xRPuVxsBnYpGQ0KYM
 v9MQQPtnAGcL5OBZG9Gf51VITUR0tViQ2sBW0LC0g4jv3rVcol9qgBCh+DnPHqis3B
 gVXUJlgKjHKEg==
Date: Fri, 1 Nov 2024 11:58:29 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241101115828.GB8518@willie-the-truck>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
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

On Fri, Oct 18, 2024 at 02:19:26PM -0300, Jason Gunthorpe wrote:
> Of the page table implementations (AMD v1/2, VT-D SS, ARM32, DART)
> arm_lpae is unique in how it handles partial unmap of large IOPTEs.
> 
> All other drivers will unmap the large IOPTE and return it's length.  For
> example if a 2M IOPTE is present and the first 4K is requested to be
> unmapped then unmap will remove the whole 2M and report 2M as the result.
> 
> arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
> the 4K and returns 4k. This is actually an illegal/non-hitless operation
> on at least SMMUv3 because of the BBM level 0 rules.
> 
> Long ago VFIO could trigger a path like this, today I know of no user of
> this functionality.
> 
> Given it doesn't work fully correctly on SMMUv3 and would create
> portability problems if any user depends on it, remove the unique support
> in arm_lpae and align with the expected iommu interface.
> 
> Outside the iommu users, this will potentially effect io_pgtable users of
> ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
> ARM_MALI_LPAE formats.
> 
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 72 +++-------------------------------
>  1 file changed, 6 insertions(+), 66 deletions(-)
> 
> I don't know anything in the iommu space that needs this, and this is the only
> page table implementation in iommu that does it.

I think the v7s code does it as well, so please can you apply the same
treatment to arm_v7s_split_blk_unmap()?

> @@ -678,12 +618,12 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>  
>  		return i * size;
>  	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
> -		/*
> -		 * Insert a table at the next level to map the old region,
> -		 * minus the part we want to unmap
> -		 */
> -		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
> -						lvl + 1, ptep, pgcount);
> +		/* Unmap the entire large IOPTE and return its size */
> +		size = ARM_LPAE_BLOCK_SIZE(lvl, data);

If I understand your other message correctly, we shouldn't actually get
into this situation any more, right? In which case, can we WARN_ONCE()
and return 0 instead? Over-unmapping is filthy!

Will
