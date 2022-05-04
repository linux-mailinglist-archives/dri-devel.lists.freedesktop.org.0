Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E611C51A5FB
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104E910F7F5;
	Wed,  4 May 2022 16:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0B110F847;
 Wed,  4 May 2022 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651682913; x=1683218913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/iIm2SHkyRux2FwB7pfhqQLD0xlueygVY3+hNca95zI=;
 b=PsHQ1VYSdtzb5YQjz34x+Dh7gxm+UAujEEoTVrH1auZIByoyA+qChtPk
 IWteMuApE9j8ePDs/7HABLBFc89yWBk+0iVXRnErz/0GLJGzjAUxEXZlX
 16D/JS1Lo1eLqZi0eiQY5wUepsQHBEAlIbaa0xe++l7XPD0Vup+aVuVCy
 /8Zt8u44lsaFVqY2o63q8hT4K5gC1KnXTjz+UuC9ii1BSFE4/Hfd3tKdW
 eqNbf7ChvTfD8Hr3AShEctG2QjzZCL3a6uhXGZWTcZXWLUEbaJqhi0J+j
 wDzH9oLGQUEnSBZtqGA8TvjwHrR4x8IOP/M3NHg1gn55FvHoup2bswCCR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="247731213"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="247731213"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 09:48:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="694229993"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 09:48:33 -0700
Date: Wed, 4 May 2022 09:48:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected
 l3bank/mslice config
Message-ID: <YnKuX0F0bDBF5ahP@mdroper-desk1.amr.corp.intel.com>
References: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 01:07:14PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
> to exercise a certain code path, so in case of values coming from MMIO
> reads we cannot be sure CI will have all the possible SKUs and parts.
> 
> Use drm_warn instead and move logging to init phase while at it.

Changing to drm_warn looks good, although moving the location changes
the intent a bit; I think originally the idea was to warn if we were
trying to do a steering lookup for a type that we never initialized
(e.g., an LNCF lookup for a !HAS_MSLICES platform where we never even
read the register in the first place).  But I don't think we've ever
made a mistake that would cause us to trip the warning, so it probably
isn't terribly important to keep it there.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 53307ca0eed0..c474e5c3ea5e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -153,11 +153,14 @@ int intel_gt_init_mmio(struct intel_gt *gt)
>  	 * An mslice is unavailable only if both the meml3 for the slice is
>  	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
>  	 */
> -	if (HAS_MSLICES(i915))
> +	if (HAS_MSLICES(i915)) {
>  		gt->info.mslice_mask =
>  			slicemask(gt, GEN_DSS_PER_MSLICE) |
>  			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
>  			 GEN12_MEML3_EN_MASK);
> +		if (!gt->info.mslice_mask) /* should be impossible! */
> +			drm_warn(&i915->drm, "mslice mask all zero!\n");
> +	}
>  
>  	if (IS_DG2(i915)) {
>  		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> @@ -171,6 +174,8 @@ int intel_gt_init_mmio(struct intel_gt *gt)
>  		gt->info.l3bank_mask =
>  			~intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
>  			GEN10_L3BANK_MASK;
> +		if (!gt->info.l3bank_mask) /* should be impossible! */
> +			drm_warn(&i915->drm, "L3 bank mask is all zero!\n");
>  	} else if (HAS_MSLICES(i915)) {
>  		MISSING_CASE(INTEL_INFO(i915)->platform);
>  	}
> @@ -882,20 +887,14 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
>  {
>  	switch (type) {
>  	case L3BANK:
> -		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
> -
>  		*sliceid = 0;		/* unused */
>  		*subsliceid = __ffs(gt->info.l3bank_mask);
>  		break;
>  	case MSLICE:
> -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
> -
>  		*sliceid = __ffs(gt->info.mslice_mask);
>  		*subsliceid = 0;	/* unused */
>  		break;
>  	case LNCF:
> -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
> -
>  		/*
>  		 * An LNCF is always present if its mslice is present, so we
>  		 * can safely just steer to LNCF 0 in all cases.
> -- 
> 2.32.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
