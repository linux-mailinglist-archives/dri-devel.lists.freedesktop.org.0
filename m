Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3338A22C05
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 11:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A68510E92D;
	Thu, 30 Jan 2025 10:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/zbpFDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B7310E926;
 Thu, 30 Jan 2025 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738234492; x=1769770492;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KrkESPtW92qyB+uXCjvHAI+yKsbyhLrsGt1jcby/fq4=;
 b=W/zbpFDicGXg1Xq8KhuMDx4w8VE4BspXi+EFGA5c5iFfg+61Q1SV/cRc
 NTdnIzx76FQQcxoXlrt2vXmM3ubqgpYqG7VXdRe9qQTYJiYfhv3PTpK7U
 rfjDJNSv0ZEfgOAniUPcVr5tpvkrYO+4N7ZVZKv1xe/nYCzrmgSIJW7Nj
 NoNg26QNkq0ZSqSLzYFhLSwSNowpnIi8G2o/QLAQQmVy5/L/hyipzDZLR
 YWngI7Y1l2eABsmMTyMWKMjkTEMF7IDTOkD1tPz/wCuwNLVlhwrcobtOY
 GgQfMJTDB1TzOFTW6LKq9CSolaq52HTTq6NLbXS1hgMr+2KZUnyuTmfgc A==;
X-CSE-ConnectionGUID: qnbjp9mxTFmeKYpjOalS+w==
X-CSE-MsgGUID: OJHTi3mVQAKNbJOlWBC93Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="50156026"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="50156026"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:54:51 -0800
X-CSE-ConnectionGUID: yCTJcG1uSdGbXL1Nba6Npw==
X-CSE-MsgGUID: XvU5MxBdSlavrTjHi1ACMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140173268"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:54:49 -0800
Message-ID: <9851fe89-e2f6-4153-bbc0-7e1358155e9d@intel.com>
Date: Thu, 30 Jan 2025 10:54:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/33] drm/xe: Add drm_pagemap ops to SVM
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-24-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250129195212.745731-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 29/01/2025 19:52, Matthew Brost wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Add support for mapping device pages to Xe SVM by attaching drm_pagemap
> to a memory region, which is then linked to a GPU SVM devmem allocation.
> This enables GPU SVM to derive the device page address.
> 
> v3:
>   - Better commit message (Thomas)
>   - New drm_pagemap.h location
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>   drivers/gpu/drm/xe/xe_svm.c          | 31 ++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index da5bf145324b..eb3702db5c17 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,6 +10,7 @@
>   
>   #include <drm/drm_device.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_pagemap.h>
>   #include <drm/ttm/ttm_device.h>
>   
>   #include "xe_devcoredump_types.h"
> @@ -106,6 +107,11 @@ struct xe_mem_region {
>   	void __iomem *mapping;
>   	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>   	struct dev_pagemap pagemap;
> +	/**
> +	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> +	 * pages of this tile.
> +	 */
> +	struct drm_pagemap dpagemap;
>   	/**
>   	 * @hpa_base: base host physical address
>   	 *
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 985ac20c5b07..869a155fc9f7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -450,6 +450,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +static struct drm_pagemap_dma_addr
> +xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
> +		       struct device *dev,
> +		       struct page *page,
> +		       unsigned int order,
> +		       enum dma_data_direction dir)
> +{
> +	struct device *pgmap_dev = dpagemap->dev;
> +	enum drm_interconnect_protocol prot;
> +	dma_addr_t addr;
> +
> +	if (pgmap_dev == dev) {
> +		addr = xe_mem_region_page_to_dpa(page_to_mr(page), page);
> +		prot = XE_INTERCONNECT_VRAM;
> +	} else {
> +		addr = DMA_MAPPING_ERROR;
> +		prot = 0;
> +	}
> +
> +	return drm_pagemap_dma_addr_encode(addr, prot, order, dir);
> +}
> +
> +static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
> +	.map_dma = xe_drm_pagemap_map_dma,
> +};
> +
> +>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)

Some leftover rebase damage here?

>   /**
>    * xe_devm_add: Remap and provide memmap backing for device memory
>    * @tile: tile that the memory region belongs to
> @@ -482,6 +509,10 @@ int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
>   	mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
>   	mr->pagemap.owner = xe_svm_devm_owner(xe);
>   	addr = devm_memremap_pages(dev, &mr->pagemap);
> +
> +	mr->dpagemap.dev = dev;
> +	mr->dpagemap.ops = &xe_drm_pagemap_ops;
> +
>   	if (IS_ERR(addr)) {
>   		devm_release_mem_region(dev, res->start, resource_size(res));
>   		ret = PTR_ERR(addr);

