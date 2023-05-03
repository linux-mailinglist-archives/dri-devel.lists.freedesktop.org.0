Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A06F5110
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02C110E1BB;
	Wed,  3 May 2023 07:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED46310E1B5;
 Wed,  3 May 2023 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683098276; x=1714634276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OhiBpaS6d2q5twhFhB0AUUvTpsX4MPGD7rgiEPm2qdk=;
 b=ZvIZOlEATdfesVRTL5Ir52CeoYAzk9b1AB3AtKFVZGSnsJ4ItFLQIKPZ
 GqShFNEZHRPZdWYWLpV9M7oy6/Xt5wh5Cn8WgfCr4Ug/xK8XIu2b8CX7G
 fYWQV3LKOJ9aqwCiGfOFMgrXEh6K7sPe/r/arGCJSVEal2NiYG+FJDi8f
 oAoo2Mp6DzEP9IHfVMb8uAnPNU7UIb+wNUo4w2MXZUZ+3b/28WUbTjnFu
 DpiXU4QFCvYcB3T/43NDZjrautjkQXh0l70O+4sgZK3DUfIyYRWRkvkSf
 /Dab5J8BbqXSQK2w/5J2sLv2PdfRIUjOFI+Sk9pDEcVT2BvNWNbY1bs6/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348629788"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="348629788"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 00:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820664601"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="820664601"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 00:17:53 -0700
Date: Wed, 3 May 2023 10:17:45 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 02/11] drm/i915/mst: Remove broken MST DSC support
Message-ID: <ZFIKmVvB1gjcP420@intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230502143906.2401-3-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 05:38:57PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The MST DSC code has a myriad of issues:
> - Platform checks are wrong (MST+DSC is TGL+ only IIRC)
> - Return values of .mode_valid_ctx() are wrong
> - .mode_valid_ctx() assumes bigjoiner might be used, but ther rest
>   of the code doesn't agree
> - compressed bpp calculations don't make sense
> - FEC handling needs to consider the entire link as opposed to just
>   the single stream. Currently FEC would only get enabled if the
>   first enabled stream is compressed. Also I'm not seeing anything
>   that would account for the FEC overhead in any bandwidth calculations
> - PPS SDP is only handled for the first stream via the dig_port
>   hooks, other streams will not be transmittitng any PPS SDPs
> - PPS SDP readout is missing (also missing for SST!)
> - VDSC readout is missing (also missing for SST!)
> 
> The FEC issues is really the big one since we have no way currently
> to apply such link wide configuration constraints. Changing that is
> going to require a much bigger rework of the higher level modeset
> .compute_config() logic. We will also need such a rework to properly
> distribute the available bandwidth across all the streams on the
> same link (which is a must to eg. enable deep color).

Hi Ville,

I'm not going to argue even that this code has some issues or not,
sure it has. However you are currently totally removing everything
without proposing what fixes have to be done or could have been done
instead.
We had multiple DP MST hubs which started to work because of this code,
also we had a public gitlab issues which were solved. So now they will loose
that support. I mean if this goes through, then I guess its up to you to 
handle this. Why not just fix instead of remove? Just add fixing patches on
top of those which remove the wrong code.
Now we are simply removing all that works at least,
instead of proposing how to fix, leaving no support at all. 
I have 2 MST hubs on my desk which won't work after this code is removed,
so if this patch goes through I recommend taking them.
But at least from my side, I think this is kinda unconstructive.

Stan


> 
> Cc: stable@vger.kernel.org
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Fixes: d51f25eb479a ("drm/i915: Add DSC support to MST path")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 176 +-------------------
>  1 file changed, 5 insertions(+), 171 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 44c15d6faac4..d762f37fafb5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -72,8 +72,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  						int min_bpp,
>  						struct link_config_limits *limits,
>  						struct drm_connector_state *conn_state,
> -						int step,
> -						bool dsc)
> +						int step)
>  {
>  	struct drm_atomic_state *state = crtc_state->uapi.state;
>  	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> @@ -104,7 +103,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
>  		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
>  
> -		ret = intel_dp_mst_check_constraints(i915, bpp, adjusted_mode, crtc_state, dsc);
> +		ret = intel_dp_mst_check_constraints(i915, bpp, adjusted_mode, crtc_state, false);
>  		if (ret)
>  			continue;
>  
> @@ -136,11 +135,8 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
>  			    slots);
>  	} else {
> -		if (!dsc)
> -			crtc_state->pipe_bpp = bpp;
> -		else
> -			crtc_state->dsc.compressed_bpp = bpp;
> -		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc %d\n", slots, bpp, dsc);
> +		crtc_state->pipe_bpp = bpp;
> +		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d\n", slots, bpp);
>  	}
>  
>  	return slots;
> @@ -157,7 +153,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
>  
>  	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, limits->max_bpp,
>  						     limits->min_bpp, limits,
> -						     conn_state, 2 * 3, false);
> +						     conn_state, 2 * 3);
>  
>  	if (slots < 0)
>  		return slots;
> @@ -173,99 +169,6 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
>  	return 0;
>  }
>  
> -static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
> -						struct intel_crtc_state *crtc_state,
> -						struct drm_connector_state *conn_state,
> -						struct link_config_limits *limits)
> -{
> -	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> -	struct intel_dp *intel_dp = &intel_mst->primary->dp;
> -	struct intel_connector *connector =
> -		to_intel_connector(conn_state->connector);
> -	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> -	const struct drm_display_mode *adjusted_mode =
> -		&crtc_state->hw.adjusted_mode;
> -	int slots = -EINVAL;
> -	int i, num_bpc;
> -	u8 dsc_bpc[3] = {0};
> -	int min_bpp, max_bpp, sink_min_bpp, sink_max_bpp;
> -	u8 dsc_max_bpc;
> -	bool need_timeslot_recalc = false;
> -	u32 last_compressed_bpp;
> -
> -	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> -	if (DISPLAY_VER(i915) >= 12)
> -		dsc_max_bpc = min_t(u8, 12, conn_state->max_requested_bpc);
> -	else
> -		dsc_max_bpc = min_t(u8, 10, conn_state->max_requested_bpc);
> -
> -	max_bpp = min_t(u8, dsc_max_bpc * 3, limits->max_bpp);
> -	min_bpp = limits->min_bpp;
> -
> -	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
> -						       dsc_bpc);
> -
> -	drm_dbg_kms(&i915->drm, "DSC Source supported min bpp %d max bpp %d\n",
> -		    min_bpp, max_bpp);
> -
> -	sink_max_bpp = dsc_bpc[0] * 3;
> -	sink_min_bpp = sink_max_bpp;
> -
> -	for (i = 1; i < num_bpc; i++) {
> -		if (sink_min_bpp > dsc_bpc[i] * 3)
> -			sink_min_bpp = dsc_bpc[i] * 3;
> -		if (sink_max_bpp < dsc_bpc[i] * 3)
> -			sink_max_bpp = dsc_bpc[i] * 3;
> -	}
> -
> -	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
> -		    sink_min_bpp, sink_max_bpp);
> -
> -	if (min_bpp < sink_min_bpp)
> -		min_bpp = sink_min_bpp;
> -
> -	if (max_bpp > sink_max_bpp)
> -		max_bpp = sink_max_bpp;
> -
> -	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_bpp,
> -						     min_bpp, limits,
> -						     conn_state, 2 * 3, true);
> -
> -	if (slots < 0)
> -		return slots;
> -
> -	last_compressed_bpp = crtc_state->dsc.compressed_bpp;
> -
> -	crtc_state->dsc.compressed_bpp = intel_dp_dsc_nearest_valid_bpp(i915,
> -									last_compressed_bpp,
> -									crtc_state->pipe_bpp);
> -
> -	if (crtc_state->dsc.compressed_bpp != last_compressed_bpp)
> -		need_timeslot_recalc = true;
> -
> -	/*
> -	 * Apparently some MST hubs dislike if vcpi slots are not matching precisely
> -	 * the actual compressed bpp we use.
> -	 */
> -	if (need_timeslot_recalc) {
> -		slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
> -							     crtc_state->dsc.compressed_bpp,
> -							     crtc_state->dsc.compressed_bpp,
> -							     limits, conn_state, 2 * 3, true);
> -		if (slots < 0)
> -			return slots;
> -	}
> -
> -	intel_link_compute_m_n(crtc_state->dsc.compressed_bpp,
> -			       crtc_state->lane_count,
> -			       adjusted_mode->crtc_clock,
> -			       crtc_state->port_clock,
> -			       &crtc_state->dp_m_n,
> -			       crtc_state->fec_enable);
> -	crtc_state->dp_m_n.tu = slots;
> -
> -	return 0;
> -}
>  static int intel_dp_mst_update_slots(struct intel_encoder *encoder,
>  				     struct intel_crtc_state *crtc_state,
>  				     struct drm_connector_state *conn_state)
> @@ -349,29 +252,6 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>  
>  	ret = intel_dp_mst_compute_link_config(encoder, pipe_config,
>  					       conn_state, &limits);
> -
> -	if (ret == -EDEADLK)
> -		return ret;
> -
> -	/* enable compression if the mode doesn't fit available BW */
> -	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
> -	if (ret || intel_dp->force_dsc_en) {
> -		/*
> -		 * Try to get at least some timeslots and then see, if
> -		 * we can fit there with DSC.
> -		 */
> -		drm_dbg_kms(&dev_priv->drm, "Trying to find VCPI slots in DSC mode\n");
> -
> -		ret = intel_dp_dsc_mst_compute_link_config(encoder, pipe_config,
> -							   conn_state, &limits);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
> -						  conn_state, &limits,
> -						  pipe_config->dp_m_n.tu, false);
> -	}
> -
>  	if (ret)
>  		return ret;
>  
> @@ -909,10 +789,6 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
>  	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
>  	int max_rate, mode_rate, max_lanes, max_link_clock;
>  	int ret;
> -	bool dsc = false, bigjoiner = false;
> -	u16 dsc_max_output_bpp = 0;
> -	u8 dsc_slice_count = 0;
> -	int target_clock = mode->clock;
>  
>  	if (drm_connector_is_unregistered(connector)) {
>  		*status = MODE_ERROR;
> @@ -950,48 +826,6 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
>  		return 0;
>  	}
>  
> -	if (intel_dp_need_bigjoiner(intel_dp, mode->hdisplay, target_clock)) {
> -		bigjoiner = true;
> -		max_dotclk *= 2;
> -	}
> -
> -	if (DISPLAY_VER(dev_priv) >= 10 &&
> -	    drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)) {
> -		/*
> -		 * TBD pass the connector BPC,
> -		 * for now U8_MAX so that max BPC on that platform would be picked
> -		 */
> -		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
> -
> -		if (drm_dp_sink_supports_fec(intel_dp->fec_capable)) {
> -			dsc_max_output_bpp =
> -				intel_dp_dsc_get_output_bpp(dev_priv,
> -							    max_link_clock,
> -							    max_lanes,
> -							    target_clock,
> -							    mode->hdisplay,
> -							    bigjoiner,
> -							    pipe_bpp, 64) >> 4;
> -			dsc_slice_count =
> -				intel_dp_dsc_get_slice_count(intel_dp,
> -							     target_clock,
> -							     mode->hdisplay,
> -							     bigjoiner);
> -		}
> -
> -		dsc = dsc_max_output_bpp && dsc_slice_count;
> -	}
> -
> -	/*
> -	 * Big joiner configuration needs DSC for TGL which is not true for
> -	 * XE_LPD where uncompressed joiner is supported.
> -	 */
> -	if (DISPLAY_VER(dev_priv) < 13 && bigjoiner && !dsc)
> -		return MODE_CLOCK_HIGH;
> -
> -	if (mode_rate > max_rate && !dsc)
> -		return MODE_CLOCK_HIGH;
> -
>  	*status = intel_mode_valid_max_plane_size(dev_priv, mode, false);
>  	return 0;
>  }
> -- 
> 2.39.2
> 
