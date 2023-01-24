Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE21679E88
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 17:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD1810E6D9;
	Tue, 24 Jan 2023 16:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40A510E067;
 Tue, 24 Jan 2023 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674577409; x=1706113409;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iHKaTcwx1uGck6weSJMliiggpV+p1q/0RMfYixv6SSA=;
 b=GSvbFp4IeVH5QfiZaRC1dpb2NUFMTNjwuWC9NKdxXKRPccSftuCL5Fr6
 KpCqg69rqrvnJ6zJSKED2hnJ9si+8fcrZz8kOeoB4M6cwCCw6Js1lBIzr
 ZphUEaOF4mQdIKIh8uY3lKmZrNmyRXtAclUO0iIVvdChTEQ0n4Jsy8k7W
 WmI6UMpGJEpbQmZr+0WDgbcGsrYn/8cSqNu9y9857FAlcK7LXJu+uAgH6
 3wKgow3hA3Qep3dzZ46WtdAE+DiDMz1cPGOin3icIVXlie2Rdf0j2QoCK
 G4lCscPEg49t0mZPG0DgKtOJ/XZf4CYah29DETQAb473n0sxZV6LnsvEB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324030009"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="324030009"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 08:23:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="786138820"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="786138820"
Received: from pesir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.197])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 08:23:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 02/16] drm/i915/dp: Avoid forcing DSC BPC for MST case
In-Reply-To: <20230120043844.3761895-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
 <20230120043844.3761895-3-ankit.k.nautiyal@intel.com>
Date: Tue, 24 Jan 2023 18:23:20 +0200
Message-ID: <87357z7vgn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> For MST the bpc is hardcoded to 8, and pipe bpp to 24.
> So avoid forcing DSC bpc for MST case.

It's likely better to warn and ignore the debug flag than to bail out.

>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 11 +++++------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  8 ++++++++
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 93aebd3683a4..3d828ea0894d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1500,14 +1500,13 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
>  		return -EINVAL;
>  
> -	if (compute_pipe_bpp)
> +	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
> +		pipe_bpp = intel_dp->force_dsc_bpc * 3;
> +		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
> +	} else if (compute_pipe_bpp) {
>  		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
> -	else
> +	} else {
>  		pipe_bpp = pipe_config->pipe_bpp;
> -
> -	if (intel_dp->force_dsc_bpc) {
> -		pipe_bpp = intel_dp->force_dsc_bpc * 3;
> -		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d", pipe_bpp);
>  	}
>  
>  	/* Min Input BPC for ICL+ is 8 */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 8b0e4defa3f1..9be04c60cced 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -325,6 +325,14 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>  	/* enable compression if the mode doesn't fit available BW */
>  	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
>  	if (ret || intel_dp->force_dsc_en) {
> +		if (intel_dp->force_dsc_bpc) {
> +			/*
> +			 * FIXME: As bpc is hardcoed to 8 bpc as mentioned above,
> +			 * Avoid force BPC for now.
> +			 */
> +			drm_dbg_kms(&dev_priv->drm, "Cannot Force BPC for MST\n");
> +			return -EINVAL;
> +		}
>  		/*
>  		 * Try to get at least some timeslots and then see, if
>  		 * we can fit there with DSC.

-- 
Jani Nikula, Intel Open Source Graphics Center
