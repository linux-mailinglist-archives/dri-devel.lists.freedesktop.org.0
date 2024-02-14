Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19CB8551F1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E4B10E82F;
	Wed, 14 Feb 2024 18:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNyN2wuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFCD10E82F;
 Wed, 14 Feb 2024 18:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707934735; x=1739470735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zzz5QDvUUuiwjPTpBwpYHVvlb27jwk55O4hi7xY3/Ro=;
 b=jNyN2wuGGr7GUBInKjkFa99DfDj2B8xG6xCwpFqH3+KYnk2gccM0I9T7
 NgSU9+MFP1YIdF89pXYMPJmXCNpyDJiqaxWLsMG3PQFauQqSO1Y0cSS01
 jOI3pSd6G0QNZ50GmGhSgTmgvW6j6aMj2V9t1Vc/xLdyhBrRZsV+TznpH
 6grqwUCUKtFrzGv3UoEN+CHWhRtOUXG4oPfwWatrkADbZrv3rULEiAWmg
 Q8uZmuprnE53zQPB+q+avUZnRfPIwKMTFzBkN5sxFDwEU/Dz6rink8gh/
 ABwbCEDWB4oN6GGix0IPdC/7TylXoqzqCgI4lG6IJ1p02IXbX1cGqYcOK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5813343"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="5813343"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369696"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369696"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 10:18:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Feb 2024 20:18:50 +0200
Date: Wed, 14 Feb 2024 20:18:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 3/6] drm/i915/mst: abstract choosing the MST mode to use
Message-ID: <Zc0ECnWNsxulLjE-@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
 <7c54416835620ae497cb8e0d2c62d124eeb5efeb.1707823736.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c54416835620ae497cb8e0d2c62d124eeb5efeb.1707823736.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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

On Tue, Feb 13, 2024 at 01:30:58PM +0200, Jani Nikula wrote:
> Clarify the conditions for choosing the MST mode to use by adding a new
> function intel_dp_mst_mode_choose(). This also prepares for being able
> to extend the MST modes to single-stream sideband messaging.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 944f566525dd..007cb2a04e38 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4015,6 +4015,24 @@ static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
>  		return str_yes_no(mst_mode == DRM_DP_MST);
>  }
>  
> +static enum drm_dp_mst_mode
> +intel_dp_mst_mode_choose(struct intel_dp *intel_dp,
> +			 enum drm_dp_mst_mode sink_mst_mode)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +
> +	if (!i915->display.params.enable_dp_mst)
> +		return DRM_DP_SST;
> +
> +	if (!intel_dp_mst_source_support(intel_dp))
> +		return DRM_DP_SST;
> +
> +	if (sink_mst_mode == DRM_DP_SST_SIDEBAND_MSG)
> +		return DRM_DP_SST;
> +
> +	return sink_mst_mode;
> +}
> +
>  static bool
>  intel_dp_mst_detect(struct intel_dp *intel_dp)
>  {
> @@ -4025,12 +4043,7 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
>  
>  	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
>  
> -	if (i915->display.params.enable_dp_mst &&
> -	    intel_dp_mst_source_support(intel_dp) &&
> -	    sink_mst_mode == DRM_DP_MST)
> -		mst_detect = DRM_DP_MST;
> -	else
> -		mst_detect = DRM_DP_SST;
> +	mst_detect = intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
