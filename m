Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 466853F5B9F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 12:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD79789CA0;
	Tue, 24 Aug 2021 10:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7796889C93;
 Tue, 24 Aug 2021 10:04:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5C0101E;
 Tue, 24 Aug 2021 03:04:33 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66B393F66F;
 Tue, 24 Aug 2021 03:04:31 -0700 (PDT)
Subject: Re: [PATCH] drm/i915: switch from 'pci_' to 'dma_' API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <dbf1018fb773785e0b3b40e601246ed6438e645e.1629666258.git.christophe.jaillet@wanadoo.fr>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0cd61d5b-ac88-31e8-99ad-143af480416f@arm.com>
Date: Tue, 24 Aug 2021 11:04:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dbf1018fb773785e0b3b40e601246ed6438e645e.1629666258.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi,

FWIW this patch itself looks fine, but it does highlight some things 
which could be further cleaned up if anyone's interested...

On 2021-08-22 22:06, Christophe JAILLET wrote:
[...]
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index a74b72f50cc9..afb35d2e5c73 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -32,7 +32,7 @@ static int init_fake_lmem_bar(struct intel_memory_region *mem)
>   	mem->remap_addr = dma_map_resource(i915->drm.dev,
>   					   mem->region.start,
>   					   mem->fake_mappable.size,
> -					   PCI_DMA_BIDIRECTIONAL,
> +					   DMA_BIDIRECTIONAL,
>   					   DMA_ATTR_FORCE_CONTIGUOUS);

DMA_ATTR_FORCE_CONTIGUOUS is nonsensical here (and below) as it is only 
meaningful for coherent buffers allocated by dma_alloc_attrs().

>   	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
>   		drm_mm_remove_node(&mem->fake_mappable);
> @@ -62,7 +62,7 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
>   	dma_unmap_resource(mem->i915->drm.dev,
>   			   mem->remap_addr,
>   			   mem->fake_mappable.size,
> -			   PCI_DMA_BIDIRECTIONAL,
> +			   DMA_BIDIRECTIONAL,
>   			   DMA_ATTR_FORCE_CONTIGUOUS);
>   }
>   
[...]
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index 36489be4896b..cd5f2348a187 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -30,7 +30,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>   	do {
>   		if (dma_map_sg_attrs(obj->base.dev->dev,
>   				     pages->sgl, pages->nents,
> -				     PCI_DMA_BIDIRECTIONAL,
> +				     DMA_BIDIRECTIONAL,
>   				     DMA_ATTR_SKIP_CPU_SYNC |
>   				     DMA_ATTR_NO_KERNEL_MAPPING |
>   				     DMA_ATTR_NO_WARN))

Similarly DMA_ATTR_NO_KERNEL_MAPPING and DMA_ATTR_NO_WARN are also for 
coherent allocations rather than streaming mappings.

I'll see if I can whip up a patch to make the API documentation clearer...

Thanks,
Robin.

> @@ -64,7 +64,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>   		usleep_range(100, 250);
>   
>   	dma_unmap_sg(i915->drm.dev, pages->sgl, pages->nents,
> -		     PCI_DMA_BIDIRECTIONAL);
> +		     DMA_BIDIRECTIONAL);
>   }
>   
>   /**
> 
