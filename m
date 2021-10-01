Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D941F0F2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FD16EE23;
	Fri,  1 Oct 2021 15:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F3766EE23
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:13:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81639101E;
 Fri,  1 Oct 2021 08:13:46 -0700 (PDT)
Received: from [10.1.27.18] (e122027.cambridge.arm.com [10.1.27.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B7C83F766;
 Fri,  1 Oct 2021 08:13:44 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] drm/panfrost: Add a PANFROST_BO_GPUONLY flag
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
 <20211001143427.1564786-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <02cb188d-e77d-3dd6-ad62-fe56d42724ae@arm.com>
Date: Fri, 1 Oct 2021 16:13:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001143427.1564786-5-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 01/10/2021 15:34, Boris Brezillon wrote:
> This lets the driver reduce shareability domain of the MMU mapping,
> which can in turn reduce access time and save power on cache-coherent
> systems.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

This seems reasonable to me - it matches the kbase
BASE_MEM_COHERENT_SYSTEM (only backwards obviously) and it worked
reasonably well for the blob.

But I'm wondering if we need to do anything special to deal with the
fact we will now have some non-coherent mappings on an otherwise
coherent device.

There are certainly some oddities around how these buffers will be
mapped into user space if requested, e.g. panfrost_gem_create_object()
sets 'map_wc' based on pfdev->coherent which is arguably wrong for
GPUONLY. So there are two things we could consider:

a) Actually prevent user space mapping GPUONLY flagged buffers. Which
matches the intention of the name.

b) Attempt to provide user space with the tools to safely interact with
the buffers (this is the kbase approach). This does have the benefit of
allowing *mostly* GPU access. An example here is the tiler heap where
the CPU could zero out as necessary but mostly the GPU has ownership and
the CPU never reads the contents. GPUONLY/DEVONLY might not be the best
name in that case.

Any thoughts?

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 3 ++-
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 1 +
>  drivers/gpu/drm/panfrost/panfrost_gem.h | 1 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 3 +++
>  include/uapi/drm/panfrost_drm.h         | 1 +
>  5 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index b29ac942ae2d..b176921b9392 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -77,7 +77,8 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>  
>  #define PANFROST_BO_FLAGS \
>  	(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP | \
> -	 PANFROST_BO_NOREAD | PANFROST_BO_NOWRITE)
> +	 PANFROST_BO_NOREAD | PANFROST_BO_NOWRITE | \
> +	 PANFROST_BO_GPUONLY)
>  
>  static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  		struct drm_file *file)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index d6c1bb1445f2..4b1f85c0b98f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -254,6 +254,7 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
>  	bo->noread = !!(flags & PANFROST_BO_NOREAD);
>  	bo->nowrite = !!(flags & PANFROST_BO_NOWRITE);
>  	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
> +	bo->gpuonly = !!(flags & PANFROST_BO_GPUONLY);
>  
>  	/*
>  	 * Allocate an id of idr table where the obj is registered
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 6246b5fef446..e332d5a4c24f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -40,6 +40,7 @@ struct panfrost_gem_object {
>  	bool noread		:1;
>  	bool nowrite		:1;
>  	bool is_heap		:1;
> +	bool gpuonly		:1;
>  };
>  
>  struct panfrost_gem_mapping {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 6a5c9d94d6f2..89eee8e80aa5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -321,6 +321,9 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	if (!bo->noread)
>  		prot |= IOMMU_READ;
>  
> +	if (bo->gpuonly)
> +		prot |= IOMMU_DEVONLY;
> +
>  	sgt = drm_gem_shmem_get_pages_sgt(obj);
>  	if (WARN_ON(IS_ERR(sgt)))
>  		return PTR_ERR(sgt);
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index a2de81225125..538b58b2d095 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -88,6 +88,7 @@ struct drm_panfrost_wait_bo {
>  #define PANFROST_BO_HEAP	2
>  #define PANFROST_BO_NOREAD	4
>  #define PANFROST_BO_NOWRITE	8
> +#define PANFROST_BO_GPUONLY	0x10
>  
>  /**
>   * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
> 

