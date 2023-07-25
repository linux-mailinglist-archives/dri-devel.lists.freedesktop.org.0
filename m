Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51F761A32
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 15:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058AB10E3CB;
	Tue, 25 Jul 2023 13:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEA310E144;
 Tue, 25 Jul 2023 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690292496; x=1721828496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=akQw8KOIl7YBmvumFDSGPEBp5RxzYehE0gF4yO4t5MY=;
 b=KAI25kc5imwHSP71QtuL+4Nl5Lt0wVXmcTiE3dTn2pHUHKYOZHx89j9b
 w7SWUFl0zFiHxb5KJvkRfdO+t2aWKIrShdv4P4LEE9KKAu9Kc2r3qDrvQ
 aexme+ODtvwC/cjSm7u4lxs8cQTJeE1XUKYxmnG0sbB0w20If4skcherW
 B7it3jjIpxyyyBNuqM9vY12lVrUg7dUYC5xV9OsmquEAW0imPF38ryGJ1
 FNY/fdEwaG+N0MMObDa2S4UVpqc/j2UHRUvkAfcqdSYGB3QaGETfW8QMN
 tVzZT+BQqxdKXCc2aql2Nzz6zDS9C5WTC3zNstf0coQYaWS4xjqJec2PK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454104391"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="454104391"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761217919"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="761217919"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.22.211])
 ([10.213.22.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:41:33 -0700
Message-ID: <8b0015c1-54d8-a4ff-f5b0-cd7243131039@intel.com>
Date: Tue, 25 Jul 2023 15:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Replace i915->gt0 with to_gt(i915)
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230725103330.1041394-1-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230725103330.1041394-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.07.2023 12:33, Andi Shyti wrote:
> Quite surprised to see that around i915 there are still i915->gt0
> references. Replace them with the to_gt() helper.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c       | 2 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c               | 2 +-
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c             | 8 ++++----
>   drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 3b094d36a0b04..5b0a5cf9a98a8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -892,7 +892,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   	} else {
>   		resource_size_t lmem_range;
>   
> -		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
> +		lmem_range = intel_gt_mcr_read_any(to_gt(i915), XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
>   		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
>   		lmem_size *= SZ_1G;
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 9f64d61dd5fcd..02886c1eb0f17 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -887,7 +887,7 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
>   int intel_gt_probe_all(struct drm_i915_private *i915)
>   {
>   	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> -	struct intel_gt *gt = &i915->gt0;
> +	struct intel_gt *gt = to_gt(i915);
>   	const struct intel_gt_definition *gtdef;
>   	phys_addr_t phys_addr;
>   	unsigned int mmio_bar;
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index 2a3217e2890fc..f8512aee58a83 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -220,7 +220,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   		resource_size_t lmem_range;
>   		u64 tile_stolen, flat_ccs_base;
>   
> -		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
> +		lmem_range = intel_gt_mcr_read_any(to_gt(i915), XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
>   		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
>   		lmem_size *= SZ_1G;
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index bb2e15329f346..38ec754d0ec8e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -162,8 +162,8 @@ static struct intel_gt *find_gt_for_required_teelink(struct drm_i915_private *i9
>   	 * for HuC authentication. For now, its limited to DG2.
>   	 */
>   	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC) &&
> -	    intel_huc_is_loaded_by_gsc(&i915->gt0.uc.huc) && intel_uc_uses_huc(&i915->gt0.uc))
> -		return &i915->gt0;
> +	    intel_huc_is_loaded_by_gsc(&to_gt(i915)->uc.huc) && intel_uc_uses_huc(&to_gt(i915)->uc))
> +		return to_gt(i915);
>   
>   	return NULL;
>   }
> @@ -188,8 +188,8 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
>   	 * Else we rely on mei-pxp module but only on legacy platforms
>   	 * prior to having separate media GTs and has a valid VDBOX.
>   	 */
> -	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && !i915->media_gt && VDBOX_MASK(&i915->gt0))
> -		return &i915->gt0;
> +	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && !i915->media_gt && VDBOX_MASK(to_gt(i915)))
> +		return to_gt(i915);
>   
>   	return NULL;
>   }
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 12aa7fbb07481..da0b269606c51 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -114,7 +114,7 @@ static struct dev_pm_domain pm_domain = {
>   
>   static void mock_gt_probe(struct drm_i915_private *i915)
>   {
> -	i915->gt[0] = &i915->gt0;
> +	i915->gt[0] = to_gt(i915);
>   	i915->gt[0]->name = "Mock GT";
>   }
>   

