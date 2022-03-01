Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BBF4C9978
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06E897C5;
	Tue,  1 Mar 2022 23:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B754897C5;
 Tue,  1 Mar 2022 23:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646178445; x=1677714445;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jdHGOotOx5heK0Hhpe+Zafwj5XOn5L+kmPAwUJ49ls0=;
 b=KxNaL+jTez4j5+SOwpxnZHQpg0fnypeCcE0RmD+CoZZDXa3z7R9Ethgv
 SuHUVFSAeYxM4nO6APlZJPz5/0oBjUOeWkkyjgIURV5B9HAr7PqdhRAf0
 gMAudRnmh7WQThigLq9x5o9hved94E8BLtY/CAn55gxFBv4gQQCH8G5m/
 qCKNTj6an3h+Kgt7MjbKnzuLOa/zfVuxJGKBIysF2DE0PJ4WLug6y5x3H
 ZDYrkjPxo0L83i0rHuLDgSZ8Hs99t/2sjC8pNhYrRb/TkmmEPnTH2oIgh
 DbJPwcI4TCGLTGHYb4HyUBOv1AFRhuIdoELtAa6BSkPSlDuR2i6VQhdTZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253193331"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="253193331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:47:24 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="685916514"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:47:24 -0800
Date: Tue, 1 Mar 2022 15:47:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 11/13] drm/i915/xehp: handle fused off CCS engines
Message-ID: <Yh6wi/Y+lnazcIVZ@mdroper-desk1.amr.corp.intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
 <20220301231549.1817978-12-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220301231549.1817978-12-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 01, 2022 at 03:15:47PM -0800, Matt Roper wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> HW resources are divided across the active CCS engines at the compute
> slice level, with each CCS having priority on one of the cslices.
> If a compute slice has no enabled DSS, its paired compute engine is not
> usable in full parallel execution because the other ones already fully
> saturate the HW, so consider it fused off.
> 
> v2 (José):
>  - moved it to its own function
>  - fixed definition of ccs_mask
> 
> v3 (Matt):
>  - Replace fls() condition with a simple IP version test
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 25 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_sseu.c      | 17 ++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_sseu.h      |  4 +++-
>  3 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 92f4cf9833ee..809747c20bc4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -592,6 +592,29 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
>  	return false;
>  }
>  
> +static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_gt_info *info = &gt->info;
> +	int ss_per_ccs = info->sseu.max_subslices / I915_MAX_CCS;
> +	const unsigned long ccs_mask =
> +		intel_slicemask_from_dssmask(intel_sseu_get_compute_subslices(&info->sseu),
> +					     ss_per_ccs);
> +	unsigned int i;
> +
> +	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
> +		return;
> +
> +	/*
> +	 * If all DSS in a quadrant are fused off, the corresponding CCS
> +	 * engine is not available for use.
> +	 */
> +	for_each_clear_bit(i, &ccs_mask, I915_MAX_CCS) {
> +		info->engine_mask &= ~BIT(_CCS(i));
> +		drm_dbg(&i915->drm, "ccs%u fused off\n", i);
> +	}
> +}
> +
>  /*
>   * Determine which engines are fused off in our particular hardware.
>   * Note that we have a catch-22 situation where we need to be able to access
> @@ -673,6 +696,8 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>  		vebox_mask, VEBOX_MASK(gt));
>  	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
>  
> +	engine_mask_apply_compute_fuses(gt);
> +
>  	return info->engine_mask;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
> index 29118c652811..4ac0bbaf0c31 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
> @@ -32,7 +32,9 @@ intel_sseu_subslice_total(const struct sseu_dev_info *sseu)
>  	return total;
>  }
>  
> -u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
> +static u32
> +_intel_sseu_get_subslices(const struct sseu_dev_info *sseu,
> +			  const u8 *subslice_mask, u8 slice)
>  {
>  	int i, offset = slice * sseu->ss_stride;
>  	u32 mask = 0;
> @@ -40,12 +42,21 @@ u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
>  	GEM_BUG_ON(slice >= sseu->max_slices);
>  
>  	for (i = 0; i < sseu->ss_stride; i++)
> -		mask |= (u32)sseu->subslice_mask[offset + i] <<
> -			i * BITS_PER_BYTE;
> +		mask |= (u32)subslice_mask[offset + i] << i * BITS_PER_BYTE;
>  
>  	return mask;
>  }
>  
> +u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
> +{
> +	return _intel_sseu_get_subslices(sseu, sseu->subslice_mask, slice);
> +}
> +
> +u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu)
> +{
> +	return _intel_sseu_get_subslices(sseu, sseu->compute_subslice_mask, 0);
> +}
> +
>  void intel_sseu_set_subslices(struct sseu_dev_info *sseu, int slice,
>  			      u8 *subslice_mask, u32 ss_mask)
>  {
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
> index 60882a74741e..8a79cd8eaab4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.h
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
> @@ -103,7 +103,9 @@ intel_sseu_subslice_total(const struct sseu_dev_info *sseu);
>  unsigned int
>  intel_sseu_subslices_per_slice(const struct sseu_dev_info *sseu, u8 slice);
>  
> -u32  intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice);
> +u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice);
> +
> +u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu);
>  
>  void intel_sseu_set_subslices(struct sseu_dev_info *sseu, int slice,
>  			      u8 *subslice_mask, u32 ss_mask);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
