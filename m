Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506825E78CC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 12:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2676510E843;
	Fri, 23 Sep 2022 10:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5923810E843;
 Fri, 23 Sep 2022 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663930413; x=1695466413;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iOdxU9zZQlgRZ1ym5xbqu6W4ME77H4ndev7hkTVtZFI=;
 b=cHpwVg3MqDmjM+hokKFR9auXY2VnxSGp4ksm1ye4C7hD22HysmbTlXuR
 aDXO4Oi93C9uKOy3l4EIFxzSh7LjOyt4iLo+xV48gKwOpXZFTXsVvOOUM
 WvAOLM3k1eRRNGemFIm0pVKsKl5Pk+nVkj60Py/D7QUHTaC1pi4Xz/cSh
 Nt0T/l/CZ53Ih/vV4Fh2lOP7Lj3mPhjL9JJflQL8gndhr+jv9bWb/IZ0y
 vbE+IZRgnWoH/t9EyFU5awDWj4rlv8e0sSIzxd7RDs6SxQjKTciPeHydg
 Rq3A3KA0LolTZ4YL4CtRW6zDtZpK6RnY4/SK1eXBOamcGWKYFpmqJCqOT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="302013464"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="302013464"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 03:53:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="724087202"
Received: from ccislaru-mobl.ger.corp.intel.com (HELO [10.213.225.140])
 ([10.213.225.140])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 03:53:31 -0700
Message-ID: <b6d78e11-f0f7-de86-e5c3-e2a12fe55203@linux.intel.com>
Date: Fri, 23 Sep 2022 11:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/huc: only load HuC on GTs that
 have VCS engines
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2022 23:11, Daniele Ceraolo Spurio wrote:
> On MTL the primary GT doesn't have any media capabilities, so no video
> engines and no HuC. We must therefore skip the HuC fetch and load on
> that specific case. Given that other multi-GT platforms might have HuC
> on the primary GT, we can't just check for that and it is easier to
> instead check for the lack of VCS engines.
> 
> Based on code from Aravind Iddamsetty
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_drv.h        |  9 ++++++---
>   2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 3bb8838e325a..d4e2b252f16c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -42,12 +42,33 @@
>    * HuC-specific commands.
>    */
>   
> +static bool vcs_supported(struct intel_gt *gt)
> +{
> +	intel_engine_mask_t mask = gt->info.engine_mask;
> +
> +	/*
> +	 * we can reach here from i915_driver_early_probe for primary
> +	 * GT with it being not fully setup hence fall back to the device info's
> +	 * engine mask
> +	 */
> +	if (!mask && gt_is_root(gt))
> +		mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;

Is it possible for all instances to be fused off? Wondering if the 
function shouldn't just use platform_engine_mask.

Regards,

Tvrtko

> +
> +	return __ENGINE_INSTANCES_MASK(mask, VCS0, I915_MAX_VCS);
> +}
> +
>   void intel_huc_init_early(struct intel_huc *huc)
>   {
>   	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
> +	struct intel_gt *gt = huc_to_gt(huc);
>   
>   	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>   
> +	if (!vcs_supported(gt)) {
> +		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
> +		return;
> +	}
> +
>   	if (GRAPHICS_VER(i915) >= 11) {
>   		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>   		huc->status.mask = HUC_LOAD_SUCCESSFUL;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 134fc1621821..8ca575202e5d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -777,12 +777,15 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
>   #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
>   
> -#define ENGINE_INSTANCES_MASK(gt, first, count) ({		\
> +#define __ENGINE_INSTANCES_MASK(mask, first, count) ({			\
>   	unsigned int first__ = (first);					\
>   	unsigned int count__ = (count);					\
> -	((gt)->info.engine_mask &						\
> -	 GENMASK(first__ + count__ - 1, first__)) >> first__;		\
> +	((mask) & GENMASK(first__ + count__ - 1, first__)) >> first__;	\
>   })
> +
> +#define ENGINE_INSTANCES_MASK(gt, first, count) \
> +	__ENGINE_INSTANCES_MASK((gt)->info.engine_mask, first, count)
> +
>   #define RCS_MASK(gt) \
>   	ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
>   #define BCS_MASK(gt) \
