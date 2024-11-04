Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6BC9BBD61
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 19:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A89010E4B1;
	Mon,  4 Nov 2024 18:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5910710E4B1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 18:42:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3DC515A1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 10:43:06 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF2D73F528
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 10:42:36 -0800 (PST)
Date: Mon, 4 Nov 2024 18:42:28 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 3/3] iommu: Add a kdoc to iommu_unmap()
Message-ID: <ZykVlIae4uXDX07s@e110455-lin.cambridge.arm.com>
References: <0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
 <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
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

On Mon, Nov 04, 2024 at 01:41:31PM -0400, Jason Gunthorpe wrote:
> Describe the most conservative version of the driver implementations.
> All drivers should support this.
> 
> Many drivers support extending the range if a large page is hit, but
> let's not make that officially approved API. The main point is to
> document explicitly that split is not supported.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 83c8e617a2c588..d3cf7cc69c797c 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2586,6 +2586,20 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
>  	return unmapped;
>  }
>  
> +/**
> + * iommu_unmap() - Remove mappings from a range of IOVA
> + * @domain: Domain to manipulate
> + * @iova: IO virtual address to start
> + * @len: Length of the range starting from @iova
> + *
> + * iommu_unmap() will remove a translation created by iommu_map(). It cannot
> + * subdivide a mapping created by iommu_map(), so it should be called with IOVA
> + * ranges that match what was passed to iommu_map(). The range can aggregate
> + * contiguous iommu_map() calls so long as no individual range is split.
> + *
> + * Returns: Number of bytes of IOVA unmapped. iova + res will be the point
> + * unmapping stopped.

I guess 'res' is the return value here. Not my default name for the variable,
worth replacing it with "return value" ?

Regardless of the acceptance of this nit:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> + */
>  size_t iommu_unmap(struct iommu_domain *domain,
>  		   unsigned long iova, size_t size)
>  {
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
