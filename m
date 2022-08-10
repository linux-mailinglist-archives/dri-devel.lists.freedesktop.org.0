Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D1B58EABD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 12:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6489B8CB;
	Wed, 10 Aug 2022 10:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E4818A08D;
 Wed, 10 Aug 2022 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660128818; x=1691664818;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EOlBuHKl2YVfCjyVuV3sjiofxwyaraH9ccnPLFSUMt8=;
 b=b4DsYCILYBG4O5T6pPvTUucO2dLbC77N/83VW+xUrQ5OpPtgJAU5I6EY
 2XLXRqDy+kFAAB32i5Fw4pFo9ilRvlw+iRKBpLeLa2Bk9eXFzNbXyssgG
 LRmzjOi358LSQeRGweH/mkQY4pNO5Kfh0BKJmRP6FS/dAYiOGNcqIqtNL
 Ys8AM3HMQoNcgGUgj5+1ko2B065TDivQ7YMz0nZgaP2XaejwmMPRNZIu7
 WG3KgCBRkI93tPuYfLI350QY7JXdJUJ7aNAgwpq7zccxUuIk3Q+qdw70u
 nxYn7pVHqB3nWGdJuqzHvDnhSRTF4IC12v9gJ8epSAITTVlMCV8XmeYuH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="277993739"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="277993739"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 03:53:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="581190564"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.4.221])
 ([10.213.4.221])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 03:53:34 -0700
Message-ID: <429ca486-6b75-5565-e18a-45a7afa3dd8d@intel.com>
Date: Wed, 10 Aug 2022 12:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: Use of BARs names instead of
 numbers
Content-Language: en-US
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220805155959.1983584-1-piotr.piorkowski@intel.com>
 <20220805155959.1983584-2-piotr.piorkowski@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220805155959.1983584-2-piotr.piorkowski@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.08.2022 17:59, Piorkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> At the moment, when we refer to some PCI BAR we use the number of
> this BAR in the code. The meaning of BARs between different platforms
> may be different. Therefore, in order to organize the code,
> let's start using defined names instead of numbers.
> 
> v2: Add lost header in cfg_space.c
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_lpe_audio.c |  5 +++--
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c     |  7 ++++---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c           |  9 +++++----
>   drivers/gpu/drm/i915/gt/intel_gt.c             |  3 ++-
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c    | 13 ++++++-------
>   drivers/gpu/drm/i915/gvt/cfg_space.c           |  5 +++--
>   drivers/gpu/drm/i915/intel_pci_config.h        |  7 +++++++
>   7 files changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> index 4970bf146c4a..1e18696aaecf 100644
> --- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> @@ -73,6 +73,7 @@
>   #include "i915_drv.h"
>   #include "intel_de.h"
>   #include "intel_lpe_audio.h"
> +#include "intel_pci_config.h"
>   
>   #define HAS_LPE_AUDIO(dev_priv) ((dev_priv)->audio.lpe.platdev != NULL)
>   
> @@ -100,9 +101,9 @@ lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
>   	rsc[0].flags    = IORESOURCE_IRQ;
>   	rsc[0].name     = "hdmi-lpe-audio-irq";
>   
> -	rsc[1].start    = pci_resource_start(pdev, 0) +
> +	rsc[1].start    = pci_resource_start(pdev, GTTMMADR_BAR) +
>   		I915_HDMI_LPE_AUDIO_BASE;
> -	rsc[1].end      = pci_resource_start(pdev, 0) +
> +	rsc[1].end      = pci_resource_start(pdev, GTTMMADR_BAR) +
>   		I915_HDMI_LPE_AUDIO_BASE + I915_HDMI_LPE_AUDIO_SIZE - 1;
>   	rsc[1].flags    = IORESOURCE_MEM;
>   	rsc[1].name     = "hdmi-lpe-audio-mmio";
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 166d0a4b9e8c..c369cfd185bc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -22,6 +22,7 @@
>   #include "i915_utils.h"
>   #include "i915_vgpu.h"
>   #include "intel_mchbar_regs.h"
> +#include "intel_pci_config.h"
>   
>   /*
>    * The BIOS typically reserves some of the system's memory for the exclusive
> @@ -830,7 +831,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   	/* Use DSM base address instead for stolen memory */
>   	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>   	if (IS_DG1(uncore->i915)) {
> -		lmem_size = pci_resource_len(pdev, 2);
> +		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>   		if (WARN_ON(lmem_size < dsm_base))
>   			return ERR_PTR(-ENODEV);
>   	} else {
> @@ -842,11 +843,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   	}
>   
>   	dsm_size = lmem_size - dsm_base;
> -	if (pci_resource_len(pdev, 2) < lmem_size) {
> +	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
>   		io_start = 0;
>   		io_size = 0;
>   	} else {
> -		io_start = pci_resource_start(pdev, 2) + dsm_base;
> +		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
>   		io_size = dsm_size;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 15a915bb4088..8214e07a0f5b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -16,6 +16,7 @@
>   #include "intel_ggtt_gmch.h"
>   #include "intel_gt.h"
>   #include "intel_gt_regs.h"
> +#include "intel_pci_config.h"
>   #include "i915_drv.h"
>   #include "i915_scatterlist.h"
>   #include "i915_utils.h"
> @@ -869,8 +870,8 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
>   	u32 pte_flags;
>   	int ret;
>   
> -	GEM_WARN_ON(pci_resource_len(pdev, 0) != gen6_gttmmadr_size(i915));
> -	phys_addr = pci_resource_start(pdev, 0) + gen6_gttadr_offset(i915);
> +	GEM_WARN_ON(pci_resource_len(pdev, GTTMMADR_BAR) != gen6_gttmmadr_size(i915));
> +	phys_addr = pci_resource_start(pdev, GTTMMADR_BAR) + gen6_gttadr_offset(i915);
>   
>   	/*
>   	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
> @@ -930,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>   	u16 snb_gmch_ctl;
>   
>   	if (!HAS_LMEM(i915)) {
> -		ggtt->gmadr = pci_resource(pdev, 2);
> +		ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
>   		ggtt->mappable_end = resource_size(&ggtt->gmadr);
>   	}
>   
> @@ -1084,7 +1085,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
>   	unsigned int size;
>   	u16 snb_gmch_ctl;
>   
> -	ggtt->gmadr = pci_resource(pdev, 2);
> +	ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
>   	ggtt->mappable_end = resource_size(&ggtt->gmadr);
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index f435e06125aa..e4bac2431e41 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -26,6 +26,7 @@
>   #include "intel_gt_requests.h"
>   #include "intel_migrate.h"
>   #include "intel_mocs.h"
> +#include "intel_pci_config.h"
>   #include "intel_pm.h"
>   #include "intel_rc6.h"
>   #include "intel_renderstate.h"
> @@ -830,7 +831,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>   	unsigned int mmio_bar;
>   	int ret;
>   
> -	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
> +	mmio_bar = GRAPHICS_VER(i915) == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
>   	phys_addr = pci_resource_start(pdev, mmio_bar);
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index aa6aed837194..1e79d3c8b126 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -6,6 +6,7 @@
>   #include "i915_drv.h"
>   #include "i915_reg.h"
>   #include "intel_memory_region.h"
> +#include "intel_pci_config.h"
>   #include "intel_region_lmem.h"
>   #include "intel_region_ttm.h"
>   #include "gem/i915_gem_lmem.h"
> @@ -45,7 +46,6 @@ _resize_bar(struct drm_i915_private *i915, int resno, resource_size_t size)
>   	drm_info(&i915->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
>   }
>   
> -#define LMEM_BAR_NUM 2
>   static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t lmem_size)
>   {
>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> @@ -56,15 +56,14 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
>   	u32 pci_cmd;
>   	int i;
>   
> -	current_size = roundup_pow_of_two(pci_resource_len(pdev, LMEM_BAR_NUM));
> +	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
>   
>   	if (i915->params.lmem_bar_size) {
>   		u32 bar_sizes;
>   
>   		rebar_size = i915->params.lmem_bar_size *
>   			(resource_size_t)SZ_1M;
> -		bar_sizes = pci_rebar_get_possible_sizes(pdev,
> -							 LMEM_BAR_NUM);
> +		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>   
>   		if (rebar_size == current_size)
>   			return;
> @@ -107,7 +106,7 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
>   	pci_write_config_dword(pdev, PCI_COMMAND,
>   			       pci_cmd & ~PCI_COMMAND_MEMORY);
>   
> -	_resize_bar(i915, LMEM_BAR_NUM, rebar_size);
> +	_resize_bar(i915, GEN12_LMEM_BAR, rebar_size);
>   
>   	pci_assign_unassigned_bus_resources(pdev->bus);
>   	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> @@ -236,8 +235,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   				  mul_u32_u32(i915->params.lmem_size, SZ_1M));
>   	}
>   
> -	io_start = pci_resource_start(pdev, 2);
> -	io_size = min(pci_resource_len(pdev, 2), lmem_size);
> +	io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> +	io_size = min(pci_resource_len(pdev, GEN12_LMEM_BAR), lmem_size);
>   	if (!io_size)
>   		return ERR_PTR(-EIO);
>   
> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
> index dad3a6054335..eef3bba8a41b 100644
> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
> @@ -33,6 +33,7 @@
>   
>   #include "i915_drv.h"
>   #include "gvt.h"
> +#include "intel_pci_config.h"
>   
>   enum {
>   	INTEL_GVT_PCI_BAR_GTTMMIO = 0,
> @@ -353,9 +354,9 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
>   	memset(vgpu_cfg_space(vgpu) + INTEL_GVT_PCI_OPREGION, 0, 4);
>   
>   	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].size =
> -		pci_resource_len(pdev, 0);
> +		pci_resource_len(pdev, GTTMMADR_BAR);
>   	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].size =
> -		pci_resource_len(pdev, 2);
> +		pci_resource_len(pdev, GTT_APERTURE_BAR);
>   
>   	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
>   
> diff --git a/drivers/gpu/drm/i915/intel_pci_config.h b/drivers/gpu/drm/i915/intel_pci_config.h
> index 12cd9d4f23de..4977a524ce6f 100644
> --- a/drivers/gpu/drm/i915/intel_pci_config.h
> +++ b/drivers/gpu/drm/i915/intel_pci_config.h
> @@ -6,6 +6,13 @@
>   #ifndef __INTEL_PCI_CONFIG_H__
>   #define __INTEL_PCI_CONFIG_H__
>   
> +/* PCI BARs */
> +#define GTTMMADR_BAR				0
> +#define GEN2_GTTMMADR_BAR			1
> +#define GFXMEM_BAR				2
> +#define GTT_APERTURE_BAR			GFXMEM_BAR
> +#define GEN12_LMEM_BAR				GFXMEM_BAR

In INTEL_GVT_PCI_BAR_GTTMMIO we have BAR in prefix, here in suffix.
I am not sure which onel is better, just pointing out slight incosistency.

Anyway:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +
>   /* BSM in include/drm/i915_drm.h */
>   
>   #define MCHBAR_I915				0x44

