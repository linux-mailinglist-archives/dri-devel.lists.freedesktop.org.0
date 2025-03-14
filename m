Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF9A6160C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 17:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B14C10EA14;
	Fri, 14 Mar 2025 16:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65EB010EA14
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:17:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0C4713D5;
 Fri, 14 Mar 2025 09:17:43 -0700 (PDT)
Received: from [10.1.26.16] (e122027.cambridge.arm.com [10.1.26.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09ECF3F5A1;
 Fri, 14 Mar 2025 09:17:30 -0700 (PDT)
Message-ID: <25408ea8-475a-424e-8fb4-8c6772de63bb@arm.com>
Date: Fri, 14 Mar 2025 16:17:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] drm/panfrost: Set IOMMU_CACHE flag
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-2-ariel.dalessandro@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250310195921.157511-2-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/03/2025 19:59, Ariel D'Alessandro wrote:
> Panfrost does not support uncached mappings, so flag them properly. Also
> flag the pages that are mapped as response to a page fault as cached.

As I understand it the hardware only sort-of supports uncached mappings.
The legacy page table format has two options: cached, or "implementation
defined" (ARM_MALI_LPAE_MEMATTR_IMP_DEF). When selecting IMP_DEF that
means that the internal units signal to the cache whether a particular
access should be cached or not. I believe the theory is that they can
decide whether it makes sense to store in the cache or not.

Having said all that, I have never observed any actual performance
difference and I suspect it won't make any actual difference. And of
course the AArch64 page tables need this to be set. I just thought I
should explain the background and that this wasn't wrong for the legacy
page tables.

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index b91019cd5acb1..9e6f198ef5c1b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -327,7 +327,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
>  	struct sg_table *sgt;
> -	int prot = IOMMU_READ | IOMMU_WRITE;
> +	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
>  
>  	if (WARN_ON(mapping->active))
>  		return 0;
> @@ -528,7 +528,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  		goto err_map;
>  
>  	mmu_map_sg(pfdev, bomapping->mmu, addr,
> -		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> +		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
>  
>  	bomapping->active = true;
>  	bo->heap_rss_size += SZ_2M;

