Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D980D8551ED
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C03410E2EA;
	Wed, 14 Feb 2024 18:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvj47TOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEC810E173;
 Wed, 14 Feb 2024 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707934685; x=1739470685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Egepe8RoDA3lbKo6WSUbBnALOr+8izb5Yc6JeFeL9a8=;
 b=bvj47TOj1zCNZNsJd5mZUchmZ4mOlr7RBfKOD1zJa6NbS4agMarPmI3N
 fB6QhHpWKObC8G7uWVxRijTzul/BZBHIDsiH8GrRqDjrEe/6m5lNEyMzo
 Ueh/hnbnmJWttff1cKkVwxXhcAwPU8XcKb0vFyzR1FeeczvdIbd8Gcdz+
 Tpvo7cwrVsvgQNdRAW/nTDHKuIcgpaf45bZnSbVRF39KVkxq7e9CMzyj5
 J2EYd+bPYBOij7P9r7ZDfjAw8H5pK7nzx3zrLcYzqqMMcllqNCAWLyxGQ
 T0rObpT0tSYn0tbTruY1NBbMQcjxycJFys97J9xzkHEiyCNcrljMUiyqG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5813326"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="5813326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:18:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369693"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369693"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 10:18:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Feb 2024 20:18:00 +0200
Date: Wed, 14 Feb 2024 20:18:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 2/6] drm/i915/mst: improve debug logging of DP MST
 mode detect
Message-ID: <Zc0D2L1F5JCXC4ID@intel.com>
References: <cover.1707823736.git.jani.nikula@intel.com>
 <26cddf53e9f7697fc422d19e14bfaf215d6548a6.1707823736.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26cddf53e9f7697fc422d19e14bfaf215d6548a6.1707823736.git.jani.nikula@intel.com>
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

On Tue, Feb 13, 2024 at 01:30:57PM +0200, Jani Nikula wrote:
> Rename intel_dp_can_mst() to intel_dp_mst_detect(), and move all DP MST
> detect debug logging there. Debug log the sink's MST capability,
> including single-stream sideband messaging support, and the decision
> whether to enable MST mode or not. Do this regardless of whether we're
> actually enabling MST or not.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 45 +++++++++++++++++--------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a1c304f451bd..944f566525dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4007,31 +4007,48 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  					   intel_dp->downstream_ports) == 0;
>  }
>  
> +static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
> +{
> +	if (mst_mode == DRM_DP_SST_SIDEBAND_MSG)
> +		return "single-stream sideband messaging";
> +	else
> +		return str_yes_no(mst_mode == DRM_DP_MST);

I wonder if this should also just say "sst"/"mst"/"sst sideband" etc.
Shrug.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +}
> +
>  static bool
> -intel_dp_can_mst(struct intel_dp *intel_dp)
> +intel_dp_mst_detect(struct intel_dp *intel_dp)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	enum drm_dp_mst_mode sink_mst_mode;
> +	enum drm_dp_mst_mode mst_detect;
> +
> +	sink_mst_mode = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
> +
> +	if (i915->display.params.enable_dp_mst &&
> +	    intel_dp_mst_source_support(intel_dp) &&
> +	    sink_mst_mode == DRM_DP_MST)
> +		mst_detect = DRM_DP_MST;
> +	else
> +		mst_detect = DRM_DP_SST;
>  
> -	return i915->display.params.enable_dp_mst &&
> -		intel_dp_mst_source_support(intel_dp) &&
> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
> +	drm_dbg_kms(&i915->drm,
> +		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
> +		    encoder->base.base.id, encoder->base.name,
> +		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
> +		    intel_dp_mst_mode_str(sink_mst_mode),
> +		    str_yes_no(i915->display.params.enable_dp_mst),
> +		    intel_dp_mst_mode_str(mst_detect));
> +
> +	return mst_detect != DRM_DP_SST;
>  }
>  
>  static void
>  intel_dp_configure_mst(struct intel_dp *intel_dp)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	struct intel_encoder *encoder =
> -		&dp_to_dig_port(intel_dp)->base;
>  	bool sink_can_mst = drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) == DRM_DP_MST;
>  
> -	drm_dbg_kms(&i915->drm,
> -		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> -		    encoder->base.base.id, encoder->base.name,
> -		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
> -		    str_yes_no(sink_can_mst),
> -		    str_yes_no(i915->display.params.enable_dp_mst));
> -
>  	if (!intel_dp_mst_source_support(intel_dp))
>  		return;
>  
> @@ -5390,7 +5407,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
>  		connector_status_connected : connector_status_disconnected;
>  	}
>  
> -	if (intel_dp_can_mst(intel_dp))
> +	if (intel_dp_mst_detect(intel_dp))
>  		return connector_status_connected;
>  
>  	/* If no HPD, poke DDC gently */
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
