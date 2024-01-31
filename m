Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F11A8443F8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BED710FB3F;
	Wed, 31 Jan 2024 16:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9E510FB3F;
 Wed, 31 Jan 2024 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706717906; x=1738253906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dpaWh/7GlWtvpwJ4rvEF4SehjmScXwyPuheBXTAelG0=;
 b=iCOyvV4ODZYNm+3dSOAId7yvcxTjs93dLlaUumfXISAOKQcVqu6ZX1b9
 WmiOk4MvJMzZB7H6p3W3zFw/uUM4UgYXhGLqZAWvlEpsoveVfcQ8dnkh6
 aEt8gaGj+m1Tz/vVw/abPURfTPLIlMETW0ODG8ddVFdZCyFPweZBo2cSh
 qUaly+hWeoAkh0YFJfz6CUDrqyw5nHB0zZ1PF6lJJ5otu0sorTq5S09/1
 nllb/bWN1TIYE/7AffsKtYrLgYnEmn/TSHlIuVGWxDS4AcgoR4CZiXeyL
 i561hIfF8sOr3RaA/tm88v7aD8kSVxFWTGf0yzgjTUpo2rgiVONY3Bf8S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2583698"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="2583698"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 08:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822613805"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="822613805"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 31 Jan 2024 08:18:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 31 Jan 2024 18:18:22 +0200
Date: Wed, 31 Jan 2024 18:18:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 18/19] drm/i915/dp: Suspend/resume DP tunnels
Message-ID: <ZbpyzoRpe1ngWJpb@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-19-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123102850.390126-19-imre.deak@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 12:28:49PM +0200, Imre Deak wrote:
> Suspend and resume DP tunnels during system suspend/resume, disabling
> the BW allocation mode during suspend, re-enabling it after resume. This
> reflects the link's BW management component (Thunderbolt CM) disabling
> BWA during suspend. Before any BW requests the driver must read the
> sink's DPRX capabilities (since the BW manager requires this
> information, so snoops for it on AUX), so ensure this read takes place.

Isn't that going to screw up the age old problem of .compute_config()
potentially failing during the resume modeset if we no longer have
the same amount of bandwidth available as we had before suspend?
So far we've been getting away with this exactly by not updating 
the dpcd stuff before the modeset during resume.

> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8ebfb039000f6..bc138a54f8d7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -36,6 +36,7 @@
>  #include <asm/byteorder.h>
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_dp_tunnel.h>
>  #include <drm/display/drm_dsc_helper.h>
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -3320,18 +3321,21 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
>  			 const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> -
> -	if (!crtc_state)
> -		return;
> +	bool dpcd_updated = false;
>  
>  	/*
>  	 * Don't clobber DPCD if it's been already read out during output
>  	 * setup (eDP) or detect.
>  	 */
> -	if (intel_dp->dpcd[DP_DPCD_REV] == 0)
> +	if (crtc_state && intel_dp->dpcd[DP_DPCD_REV] == 0) {
>  		intel_dp_get_dpcd(intel_dp);
> +		dpcd_updated = true;
> +	}
>  
> -	intel_dp_reset_max_link_params(intel_dp);
> +	intel_dp_tunnel_resume(intel_dp, dpcd_updated);
> +
> +	if (crtc_state)
> +		intel_dp_reset_max_link_params(intel_dp);
>  }
>  
>  bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
> @@ -5973,6 +5977,8 @@ void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder)
>  	struct intel_dp *intel_dp = enc_to_intel_dp(intel_encoder);
>  
>  	intel_pps_vdd_off_sync(intel_dp);
> +
> +	intel_dp_tunnel_suspend(intel_dp);
>  }
>  
>  void intel_dp_encoder_shutdown(struct intel_encoder *intel_encoder)
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
