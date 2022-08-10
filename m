Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F6D58E97E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 11:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC884F3B95;
	Wed, 10 Aug 2022 09:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA195F3B76;
 Wed, 10 Aug 2022 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660123358; x=1691659358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p+wS9UTyAPJhQieXyjjvg9IsSWTnPYY+WTTY/W+cuQM=;
 b=ETOsG3+EOaDv/yI7l5P57S3bt0TQA5T18wgAYQhlX1/kJCbPQbxcVNj7
 QNWFxHGhvIcQk7m4Uf9VFLDMWu4YhY/GmThinTlJChcZPfPtO+0WRRgQw
 PGKzv+t3/bmIJVR/JxtCbab52FUNJPwaOcyup6cRWf/jo7LZCHBkSf2CR
 kah6ogLJqHWvzgA2upz9RB5In/PclaljwoN504Izz91A+fZjddJkqI10r
 Sp1JZ4FKFRVUIPMyS6ERxjhiFCUnh4ACEIwTRv5KvQlf+OVhIcq5k16z+
 3vebQ7V6wWDUtsje2YtnB51AtLlSASE4Wg3mOPADzSylX8A07MPl31YT2 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="316986254"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="316986254"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 02:22:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="747368639"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 02:22:35 -0700
Date: Wed, 10 Aug 2022 12:23:10 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Add DSC support to MST path
Message-ID: <YvN4/gcVDL9lssPE@intel.com>
References: <20220411162518.9352-1-stanislav.lisovskiy@intel.com>
 <20220411162518.9352-3-stanislav.lisovskiy@intel.com>
 <313ee0933a911ba14381ef55f7776a424a849191.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <313ee0933a911ba14381ef55f7776a424a849191.camel@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 11:25:13AM +0300, Govindapillai, Vinod wrote:
> Hi Stan,
> 
> Please find my comments inline
> 
> 
> On Mon, 2022-04-11 at 19:25 +0300, Stanislav Lisovskiy wrote:
> > Whenever we are not able to get enough timeslots
> > for required PBN, let's try to allocate those
> > using DSC, just same way as we do for SST.
> > 
> > v2: Removed intel_dp_mst_dsc_compute_config and refactored
> >     intel_dp_dsc_compute_config to support timeslots as a
> >     parameter(Ville Syrjälä)
> > 
> > Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c     |  75 +++++-----
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 143 ++++++++++++++++++++
> >  3 files changed, 191 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 972c9ed46829..f5477f1bf622 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -114,7 +114,6 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
> >  }
> >  
> >  static void intel_dp_unset_edid(struct intel_dp *intel_dp);
> > -static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
> >  
> >  /* Is link rate UHBR and thus 128b/132b? */
> >  bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
> > @@ -640,11 +639,12 @@ small_joiner_ram_size_bits(struct drm_i915_private *i915)
> >  		return 6144 * 8;
> >  }
> >  
> > -static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
> > -				       u32 link_clock, u32 lane_count,
> > -				       u32 mode_clock, u32 mode_hdisplay,
> > -				       bool bigjoiner,
> > -				       u32 pipe_bpp)
> > +u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
> > +				u32 link_clock, u32 lane_count,
> > +				u32 mode_clock, u32 mode_hdisplay,
> > +				bool bigjoiner,
> > +				u32 pipe_bpp,
> > +				u32 timeslots)
> >  {
> >  	u32 bits_per_pixel, max_bpp_small_joiner_ram;
> >  	int i;
> > @@ -656,7 +656,7 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
> >  	 * for MST -> TimeSlotsPerMTP has to be calculated
> >  	 */
> >  	bits_per_pixel = (link_clock * lane_count * 8) /
> > -			 intel_dp_mode_to_fec_clock(mode_clock);
> > +			 (intel_dp_mode_to_fec_clock(mode_clock) * timeslots);
> >  	drm_dbg_kms(&i915->drm, "Max link bpp: %u\n", bits_per_pixel);
> >  
> >  	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
> > @@ -710,9 +710,9 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
> >  	return bits_per_pixel << 4;
> >  }
> >  
> > -static u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
> > -				       int mode_clock, int mode_hdisplay,
> > -				       bool bigjoiner)
> > +u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
> > +				int mode_clock, int mode_hdisplay,
> > +				bool bigjoiner)
> >  {
> >  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >  	u8 min_slice_count, i;
> > @@ -919,8 +919,8 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
> >  	return MODE_OK;
> >  }
> >  
> > -static bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
> > -				    int hdisplay, int clock)
> > +bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
> > +			     int hdisplay, int clock)
> >  {
> >  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >  
> > @@ -1007,7 +1007,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
> >  							    target_clock,
> >  							    mode->hdisplay,
> >  							    bigjoiner,
> > -							    pipe_bpp) >> 4;
> > +							    pipe_bpp, 1) >> 4;
> >  			dsc_slice_count =
> >  				intel_dp_dsc_get_slice_count(intel_dp,
> >  							     target_clock,
> > @@ -1311,7 +1311,7 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
> >  	return -EINVAL;
> >  }
> >  
> > -static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
> > +int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
> >  {
> >  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >  	int i, num_bpc;
> > @@ -1401,10 +1401,11 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
> >  	return drm_dsc_compute_rc_parameters(vdsc_cfg);
> >  }
> >  
> > -static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> > -				       struct intel_crtc_state *pipe_config,
> > -				       struct drm_connector_state *conn_state,
> > -				       struct link_config_limits *limits)
> > +int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> > +				struct intel_crtc_state *pipe_config,
> > +				struct drm_connector_state *conn_state,
> > +				struct link_config_limits *limits,
> > +				int timeslots)
> >  {
> >  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> >  	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
> > @@ -1455,7 +1456,8 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> >  						    adjusted_mode->crtc_clock,
> >  						    adjusted_mode->crtc_hdisplay,
> >  						    pipe_config->bigjoiner_pipes,
> > -						    pipe_bpp);
> > +						    pipe_bpp,
> > +						    timeslots);
> >  		dsc_dp_slice_count =
> >  			intel_dp_dsc_get_slice_count(intel_dp,
> >  						     adjusted_mode->crtc_clock,
> > @@ -1467,41 +1469,26 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> >  			return -EINVAL;
> >  		}
> >  		pipe_config->dsc.compressed_bpp = min_t(u16,
> > -							       dsc_max_output_bpp >> 4,
> > -							       pipe_config->pipe_bpp);
> > +							dsc_max_output_bpp >> 4,
> > +							pipe_config->pipe_bpp);
> >  		pipe_config->dsc.slice_count = dsc_dp_slice_count;
> > +		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
> > +			    pipe_config->dsc.compressed_bpp,
> > +			    pipe_config->dsc.slice_count);
> >  	}
> > -
> > -	/* As of today we support DSC for only RGB */
> > -	if (intel_dp->force_dsc_bpp) {
> > -		if (intel_dp->force_dsc_bpp >= 8 &&
> > -		    intel_dp->force_dsc_bpp < pipe_bpp) {
> > -			drm_dbg_kms(&dev_priv->drm,
> > -				    "DSC BPP forced to %d",
> > -				    intel_dp->force_dsc_bpp);
> > -			pipe_config->dsc.compressed_bpp =
> > -						intel_dp->force_dsc_bpp;
> > -		} else {
> > -			drm_dbg_kms(&dev_priv->drm,
> > -				    "Invalid DSC BPP %d",
> > -				    intel_dp->force_dsc_bpp);
> > -		}
> > -	}
> > -
> >  	/*
> >  	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
> >  	 * is greater than the maximum Cdclock and if slice count is even
> >  	 * then we need to use 2 VDSC instances.
> >  	 */
> > -	if (adjusted_mode->crtc_clock > dev_priv->max_cdclk_freq ||
> > -	    pipe_config->bigjoiner_pipes) {
> > -		if (pipe_config->dsc.slice_count < 2) {
> > +	if (adjusted_mode->crtc_clock > dev_priv->max_cdclk_freq) {
> > +		if (pipe_config->dsc.slice_count > 1) {
> > +			pipe_config->dsc.dsc_split = true;
> > +		} else {
> >  			drm_dbg_kms(&dev_priv->drm,
> >  				    "Cannot split stream to use 2 VDSC instances\n");
> >  			return -EINVAL;
> >  		}
> > -
> > -		pipe_config->dsc.dsc_split = true;
> >  	}
> >  
> >  	ret = intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
> > @@ -1590,7 +1577,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
> >  			    str_yes_no(ret), str_yes_no(joiner_needs_dsc),
> >  			    str_yes_no(intel_dp->force_dsc_en));
> >  		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
> > -						  conn_state, &limits);
> > +						  conn_state, &limits, 1);
> >  		if (ret < 0)
> >  			return ret;
> >  	}
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> > index d457e17bdc57..4c0ad3158ee7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -55,6 +55,11 @@ void intel_dp_encoder_flush_work(struct drm_encoder *encoder);
> >  int intel_dp_compute_config(struct intel_encoder *encoder,
> >  			    struct intel_crtc_state *pipe_config,
> >  			    struct drm_connector_state *conn_state);
> > +int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> > +				struct intel_crtc_state *pipe_config,
> > +				struct drm_connector_state *conn_state,
> > +				struct link_config_limits *limits,
> > +				int timeslots);
> >  bool intel_dp_is_edp(struct intel_dp *intel_dp);
> >  bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
> >  bool intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port port);
> > @@ -94,6 +99,18 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
> >  		       struct intel_crtc_state *crtc_state,
> >  		       unsigned int type);
> >  bool intel_digital_port_connected(struct intel_encoder *encoder);
> > +int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
> > +u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
> > +				u32 link_clock, u32 lane_count,
> > +				u32 mode_clock, u32 mode_hdisplay,
> > +				bool bigjoiner,
> > +				u32 pipe_bpp,
> > +				u32 timeslots);
> > +u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
> > +				int mode_clock, int mode_hdisplay,
> > +				bool bigjoiner);
> > +bool intel_dp_need_bigjoiner(struct intel_dp *intel_dp,
> > +			     int hdisplay, int clock);
> >  
> >  static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
> >  {
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 061b277e5ce7..550fcd380487 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -99,6 +99,82 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> >  	return 0;
> >  }
> >  
> > +static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
> > +						struct intel_crtc_state *crtc_state,
> > +						struct drm_connector_state *conn_state,
> > +						struct link_config_limits *limits)
> > +{
> > +	struct drm_atomic_state *state = crtc_state->uapi.state;
> > +	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> > +	struct intel_dp *intel_dp = &intel_mst->primary->dp;
> > +	struct intel_connector *connector =
> > +		to_intel_connector(conn_state->connector);
> > +	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> > +	const struct drm_display_mode *adjusted_mode =
> > +		&crtc_state->hw.adjusted_mode;
> > +	bool constant_n = drm_dp_has_quirk(&intel_dp->desc,
> > +					   DP_DPCD_QUIRK_CONSTANT_N);
> > +	int bpp, slots = -EINVAL;
> > +	int i, num_bpc;
> > +	u8 dsc_bpc[3] = {0};
> > +	int min_bpp, max_bpp;
> > +	u8 dsc_max_bpc;
> > +
> > +	crtc_state->lane_count = limits->max_lane_count;
> > +	crtc_state->port_clock = limits->max_rate;
> > +
> > +	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> > +	if (DISPLAY_VER(i915) >= 12)
> > +		dsc_max_bpc = min_t(u8, 12, conn_state->max_requested_bpc);
> > +	else
> > +		dsc_max_bpc = min_t(u8, 10, conn_state->max_requested_bpc);
> > +
> > +	max_bpp = min_t(u8, dsc_max_bpc * 3, limits->max_bpp);
> > +	min_bpp = limits->min_bpp;
> > +
> > +	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
> > +						       dsc_bpc);
> > +	for (i = 0; i < num_bpc; i++) {
> > +		if (max_bpp >= dsc_bpc[i] * 3)
> > +			if (min_bpp > dsc_bpc[i] * 3)
> > +				min_bpp = dsc_bpc[i] * 3;
> > +	}
> > +	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
> > +		    min_bpp, max_bpp);
> > +	for (bpp = max_bpp; bpp >= min_bpp; bpp -= 2 * 3) {
> > +		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
> > +						       bpp << 4,
> > +						       true);
> > +
> > +		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
> > +						      connector->port,
> > +						      crtc_state->pbn, 0);
> > +
> > +		drm_dbg_kms(&i915->drm, "Trying bpp %d got %d pbn %d slots\n",
> > +			    bpp, crtc_state->pbn, slots);
> > +
> > +		if (slots == -EDEADLK)
> > +			return slots;
> > +		if (slots >= 0)
> > +			break;
> > +	}
> > +
> > +	if (slots < 0) {
> > +		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
> > +			    slots);
> > +		return slots;
> > +	}
> > +
> > +	intel_link_compute_m_n(crtc_state->pipe_bpp,
> > +			       crtc_state->lane_count,
> > +			       adjusted_mode->crtc_clock,
> > +			       crtc_state->port_clock,
> > +			       &crtc_state->dp_m_n,
> > +			       constant_n, crtc_state->fec_enable);
> > +	crtc_state->dp_m_n.tu = slots;
> > +
> > +	return 0;
> > +}
> >  static int intel_dp_mst_update_slots(struct intel_encoder *encoder,
> >  				     struct intel_crtc_state *crtc_state,
> >  				     struct drm_connector_state *conn_state)
> > @@ -175,6 +251,27 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
> >  
> >  	ret = intel_dp_mst_compute_link_config(encoder, pipe_config,
> >  					       conn_state, &limits);
> 
> At this point it looks like it doesnt check any available bandwidth limitation!
> intel_dp_mst_compute_link_config() calls drm_dp_atomic_find_vcpi_slots() which is the basis of the
> below logic to decide whether to use DSC. But drm_dp_atomic_find_vcpi_slots() doesn't check any bw
> limits. The description of this function says "Allocations set by this function are not checked
> against the bandwidth restraints of @mgr until the driver calls drm_dp_mst_atomic_check()."
> 
> The VCPI slot check only happens in drm_dp_mst_atomic_check() which is called
> from intel_atomic_check() 
> 
> So looks like we might need to update this logic to find a proper place for this DSC enable/disable
> decision!

Here, we are following same logic as we do for DSC in SST mode(see intel_dp_compute_config and
intel_dp_compute_link_config). We compute the requirements then try to allocate those and fallback
to DSC mode if we fail to go on uncompressed. 

At this stage we are now _computing_ the required configuration, i.e we are not supposed yet to check
anything. We do check VCPI slots though because using or not using DSC is our configuration decision,
not a constraint. Same goes for example with Display bandwidth and so on.
We first compute a configuration, then all the atomic checks are being run, which will tell is this
configuration is possible at all.

That is why you will spot all those atomic checks mostly in the very end, after everything else is calculated
i.e drm_dp_mst_atomic_check, intel_atomic_check_planes, intel_bw_atomic_check, intel_cdclk_atomic_check and
etc..

Those checks in fact sometimes also calculate the state as
well(which I think isn't actually very correct) but the main point is that atomic check is supposed first
to initiate all the configurational state computations, also checking if those are possible at all.
If config isn't applicable the commit will be rejected.

Yes, there is sometimes a bit of chicken and egg problem because we had cases like, we need to decide
to enable DSC or not based on CDCLK, while CDCLK was supposed to be calculated in the very end based on
everything else. That simply requires architectural level decision, what comes after what.

So here as I understand we first calculate the minimal amount of VCPI slots we need to for this mode,
if not possible uncompressed we fallback to DSC and compute that minimum with that.
Same we do for SST with only difference that we check the link rate required, not the VCPI slots.

And then yet final check arrives which checks if overall that config is possible at all.

Even without DSC, it would go like this: intel_dp_mst_compute_link_config allocates amount of slots
needed(if those are available), note it doesn't do any other checks, then drm_dp_mst_atomic_check arrives
and approves/rejects that configuration.

If not possible - we finally reject it, possibly leading to userspace trying with lower resolution, bpp
and so on.

Stan

> 
> > +
> > +	if (ret == -EDEADLK)
> > +		return ret;
> > +
> > +	/* enable compression if the mode doesn't fit available BW */
> > +	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
> > +	if (ret || intel_dp->force_dsc_en) {
> > +		/*
> > +		 * Try to get at least some timeslots and then see, if
> > +		 * we can fit there with DSC.
> > +		 */
> > +		ret = intel_dp_dsc_mst_compute_link_config(encoder, pipe_config,
> > +							   conn_state, &limits);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
> > +						  conn_state, &limits,
> > +						  pipe_config->dp_m_n.tu);
> > +	}
> > +
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -713,6 +810,10 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
> >  	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
> >  	int max_rate, mode_rate, max_lanes, max_link_clock;
> >  	int ret;
> > +	bool dsc = false, bigjoiner = false;
> > +	u16 dsc_max_output_bpp = 0;
> > +	u8 dsc_slice_count = 0;
> > +	int target_clock = mode->clock;
> >  
> >  	if (drm_connector_is_unregistered(connector)) {
> >  		*status = MODE_ERROR;
> > @@ -750,6 +851,48 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
> >  		return 0;
> >  	}
> >  
> > +	if (intel_dp_need_bigjoiner(intel_dp, mode->hdisplay, target_clock)) {
> > +		bigjoiner = true;
> > +		max_dotclk *= 2;
> > +	}
> > +
> > +	if (DISPLAY_VER(dev_priv) >= 10 &&
> > +	    drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)) {
> > +		/*
> > +		 * TBD pass the connector BPC,
> > +		 * for now U8_MAX so that max BPC on that platform would be picked
> > +		 */
> > +		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
> > +
> > +		if (drm_dp_sink_supports_fec(intel_dp->fec_capable)) {
> > +			dsc_max_output_bpp =
> > +				intel_dp_dsc_get_output_bpp(dev_priv,
> > +							    max_link_clock,
> > +							    max_lanes,
> > +							    target_clock,
> > +							    mode->hdisplay,
> > +							    bigjoiner,
> > +							    pipe_bpp, 1) >> 4;
> > +			dsc_slice_count =
> > +				intel_dp_dsc_get_slice_count(intel_dp,
> > +							     target_clock,
> > +							     mode->hdisplay,
> > +							     bigjoiner);
> > +		}
> > +
> > +		dsc = dsc_max_output_bpp && dsc_slice_count;
> > +	}
> > +
> > +	/*
> > +	 * Big joiner configuration needs DSC for TGL which is not true for
> > +	 * XE_LPD where uncompressed joiner is supported.
> > +	 */
> > +	if (DISPLAY_VER(dev_priv) < 13 && bigjoiner && !dsc)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (mode_rate > max_rate && !dsc)
> > +		return MODE_CLOCK_HIGH;
> > +
> >  	*status = intel_mode_valid_max_plane_size(dev_priv, mode, false);
> >  	return 0;
> >  }
