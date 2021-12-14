Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7184A474053
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 11:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D85C10E3AB;
	Tue, 14 Dec 2021 10:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F9310E285;
 Tue, 14 Dec 2021 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639477300; x=1671013300;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m1DiZjwRadovied/nen/asaeZ+lK7r6EOnpvXk8lMGs=;
 b=EQ/FlEJdB9Q+aR4QitK67RF3Higud0ZGRJuwZ2uHc5mwbZbd2Prs1yef
 rMQ/OnZOxa5kDguMrigK1njHCMS+nzEeJHqJCViJYeqCUiadNeMvapqqf
 0Fx+HlOf1qbFrau7vCwnDueZMB6KNj7JDZKNf5Oauc4M52UrUwyumWCXX
 KMz/P+4y0kARDIHKmKQKmpXALqh8IoWXfg4SGK69bXZlLNqTTKJh7gPX4
 dw3iXeo8j6Y9pNZFfbsdjEyhmCso+Jwd/ahl2km+7sJSEd7tSFRFpARH3
 DGIsEz5MWGxCsYT+5Eln9caD8neQV5nvsnuAIU83DucT27mFEsVVqFW3m w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226226308"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="226226308"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 02:21:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="505308807"
Received: from vgavinx-mobl1.ger.corp.intel.com (HELO [10.252.22.20])
 ([10.252.22.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 02:21:38 -0800
Message-ID: <e38c33c3-b26a-1dbb-0abd-ff767d350c63@intel.com>
Date: Tue, 14 Dec 2021 10:21:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/16] drm/i915/lmem: Enable lmem for platforms with
 Flat CCS
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
 <20211209154533.4084-6-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211209154533.4084-6-ramalingam.c@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2021 15:45, Ramalingam C wrote:
> From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> 
> A portion of device memory is reserved for Flat CCS so usable
> device memory will be reduced by size of Flat CCS. Size of
> Flat CCS is specified in “XEHPSDV_FLAT_CCS_BASE_ADDR”.
> So to get effective device memory we need to subtract
> total device memory by Flat CCS memory size.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c          | 19 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c | 22 +++++++++++++++++++--
>   drivers/gpu/drm/i915/i915_reg.h             |  3 +++
>   4 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index f2422d48be32..510cda6a163f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -902,6 +902,25 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
>   	return intel_uncore_read_fw(gt->uncore, reg);
>   }
>   
> +u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
> +{
> +	int type;
> +	u8 sliceid, subsliceid;
> +
> +	for (type = 0; type < NUM_STEERING_TYPES; type++) {
> +		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
> +			intel_gt_get_valid_steering(gt, type, &sliceid,
> +						    &subsliceid);
> +			return intel_uncore_read_with_mcr_steering(gt->uncore,
> +								   reg,
> +								   sliceid,
> +								   subsliceid);
> +		}
> +	}
> +
> +	return intel_uncore_read(gt->uncore, reg);
> +}
> +
>   void intel_gt_info_print(const struct intel_gt_info *info,
>   			 struct drm_printer *p)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 74e771871a9b..24b78398a587 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -84,6 +84,7 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
>   }
>   
>   u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
> +u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
>   
>   void intel_gt_info_print(const struct intel_gt_info *info,
>   			 struct drm_printer *p);
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index fde2dcb59809..a358fa14372b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -205,8 +205,26 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>   	if (!IS_DGFX(i915))
>   		return ERR_PTR(-ENODEV);
>   
> -	/* Stolen starts from GSMBASE on DG1 */
> -	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
> +	if (HAS_FLAT_CCS(i915)) {
> +		u64 tile_stolen, flat_ccs_base_addr_reg, flat_ccs_base;
> +
> +		lmem_size = pci_resource_len(pdev, 2);

Should we check if lmem_size < tile_stolen somewhere? I think I have 
seen that with 256M BAR. Maybe just return -ENODEV, for now?

> +		flat_ccs_base_addr_reg = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
> +		flat_ccs_base = (flat_ccs_base_addr_reg >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
> +		tile_stolen = lmem_size - flat_ccs_base;
> +
> +		/* If the FLAT_CCS_BASE_ADDR register is not populated, flag an error */
> +		if (tile_stolen == lmem_size)
> +			DRM_ERROR("CCS_BASE_ADDR register did not have expected value\n");
> +
> +		lmem_size -= tile_stolen;
> +	} else {
> +		/* Stolen starts from GSMBASE without CCS */
> +		lmem_size = intel_uncore_read64(&i915->uncore, GEN12_GSMBASE);
> +		if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
> +			return ERR_PTR(-ENODEV);

We also have this check below. I guess just set the lmem_size here?

> +	}
> +
>   
>   	io_start = pci_resource_start(pdev, 2);
>   	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index d27ba273cc68..29f1cafb0f4b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -12620,6 +12620,9 @@ enum skl_power_gate {
>   #define   SGGI_DIS			REG_BIT(15)
>   #define   SGR_DIS			REG_BIT(13)
>   
> +#define XEHPSDV_FLAT_CCS_BASE_ADDR             _MMIO(0x4910)
> +#define   XEHPSDV_CCS_BASE_SHIFT               8
> +
>   /* gamt regs */
>   #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
>   #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
> 
