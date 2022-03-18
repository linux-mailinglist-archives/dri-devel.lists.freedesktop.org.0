Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BC54DD871
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 11:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5077E10E932;
	Fri, 18 Mar 2022 10:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4BD10E77F;
 Fri, 18 Mar 2022 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647600616; x=1679136616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=61w6Dq1PnnQL3RqeNmZm9jhdcTj6KTvnHQQDalTd6jo=;
 b=HcXGWkVitzCeJi9/wsTmq4hQinhyoWCI+TUo1N0B4oCN+zjucb6QkKUt
 bo8yj1tv2eruLTUWqZRj+s1aoiUM6sqXsZ8/qzwP4Pt0i6lVSx7Aj56JH
 VIRaVhufBDOqpm/nf11/7C34h67Adn7uBb2JVxSyCjHmePYfR7258maMn
 i5ADhZ0iAoWX9NWyijfv+VwCp1zYBc+ccOh8atD9QXw4UhvL6DXTFyD9q
 G/fvMBIVuEjFq1EAr4vrmdVj+B928lZrZcgkV2usDdAC5GAWSrVFaI6Ls
 a9oAAXRekbOgJGc2XYUY0zErrL44uy9ib5ViphonLGptsR9BKb+Qw/Rjf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="256839263"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="256839263"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 03:50:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="517152820"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 03:50:15 -0700
Date: Fri, 18 Mar 2022 12:50:44 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Add DSC support to MST path
Message-ID: <20220318105044.GA7725@intel.com>
References: <20220317163353.4152-1-stanislav.lisovskiy@intel.com>
 <20220317163353.4152-3-stanislav.lisovskiy@intel.com>
 <YjNnTGO3AQE5lPRL@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YjNnTGO3AQE5lPRL@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Mar 17, 2022 at 06:52:28PM +0200, Ville Syrjälä wrote:
> On Thu, Mar 17, 2022 at 06:33:53PM +0200, Stanislav Lisovskiy wrote:
> > Whenever we are not able to get enough timeslots
> > for required PBN, let's try to allocate those
> > using DSC, just same way as we do for SST.
> > 
> > Those patches are experimental yet, i.e not
> > for merging, still need to be tested with
> > proper DSC display, submitting those to check
> > ig nothing else blows up at least.
> > 
> > v2: Add DSC checks to intel_dp_mst_mode_valid_ctx, similar
> >     to ones we have in intel_dp_mode_valid(Manasi Navare)
> > 
> > v3: Removed redundant edp condition logic from MST DSC
> >     handling(Manasi Navare)
> > 
> > v4:  - Fixed forgotten force_dsc_en condition which was
> >        always enabled for testing purposes(Manasi Navare)
> >      - Properly process ret == EDEADLK, thus fixing the
> >        regression caused by WARN triggered with modeset_lock.
> > 
> > v5:  - Removed redundant check(Imre Deak)
> > 
> > Acked-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c     | 138 ++++++++++++++++--
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 146 +++++++++++++++++++-
> >  3 files changed, 285 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 9e19165fd175..b04771e495cc 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -115,7 +115,6 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
> >  }
> >  
> >  static void intel_dp_unset_edid(struct intel_dp *intel_dp);
> > -static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_max_bpc);
> >  
> >  /* Is link rate UHBR and thus 128b/132b? */
> >  bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
> > @@ -667,11 +666,12 @@ small_joiner_ram_size_bits(struct drm_i915_private *i915)
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
> > @@ -683,7 +683,7 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
> >  	 * for MST -> TimeSlotsPerMTP has to be calculated
> >  	 */
> >  	bits_per_pixel = (link_clock * lane_count * 8) /
> > -			 intel_dp_mode_to_fec_clock(mode_clock);
> > +			 (intel_dp_mode_to_fec_clock(mode_clock) * timeslots);
> >  	drm_dbg_kms(&i915->drm, "Max link bpp: %u\n", bits_per_pixel);
> >  
> >  	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
> > @@ -737,9 +737,9 @@ static u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
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
> > @@ -902,8 +902,8 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
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
> > @@ -990,7 +990,7 @@ intel_dp_mode_valid(struct drm_connector *connector,
> >  							    target_clock,
> >  							    mode->hdisplay,
> >  							    bigjoiner,
> > -							    pipe_bpp) >> 4;
> > +							    pipe_bpp, 1) >> 4;
> >  			dsc_slice_count =
> >  				intel_dp_dsc_get_slice_count(intel_dp,
> >  							     target_clock,
> > @@ -1285,7 +1285,7 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
> >  	return -EINVAL;
> >  }
> >  
> > -static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
> > +int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
> >  {
> >  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >  	int i, num_bpc;
> > @@ -1429,7 +1429,8 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> >  						    adjusted_mode->crtc_clock,
> >  						    adjusted_mode->crtc_hdisplay,
> >  						    pipe_config->bigjoiner_pipes,
> > -						    pipe_bpp);
> > +						    pipe_bpp,
> > +						    1);
> >  		dsc_dp_slice_count =
> >  			intel_dp_dsc_get_slice_count(intel_dp,
> >  						     adjusted_mode->crtc_clock,
> > @@ -1444,7 +1445,114 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> >  							       dsc_max_output_bpp >> 4,
> >  							       pipe_config->pipe_bpp);
> >  		pipe_config->dsc.slice_count = dsc_dp_slice_count;
> > +		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
> > +			    pipe_config->dsc.compressed_bpp,
> > +			    pipe_config->dsc.slice_count);
> >  	}
> > +	/*
> > +	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
> > +	 * is greater than the maximum Cdclock and if slice count is even
> > +	 * then we need to use 2 VDSC instances.
> > +	 */
> > +	if (adjusted_mode->crtc_clock > dev_priv->max_cdclk_freq) {
> > +		if (pipe_config->dsc.slice_count > 1) {
> > +			pipe_config->dsc.dsc_split = true;
> > +		} else {
> > +			drm_dbg_kms(&dev_priv->drm,
> > +				    "Cannot split stream to use 2 VDSC instances\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	ret = intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
> > +	if (ret < 0) {
> > +		drm_dbg_kms(&dev_priv->drm,
> > +			    "Cannot compute valid DSC parameters for Input Bpp = %d "
> > +			    "Compressed BPP = %d\n",
> > +			    pipe_config->pipe_bpp,
> > +			    pipe_config->dsc.compressed_bpp);
> > +		return ret;
> > +	}
> > +
> > +	pipe_config->dsc.compression_enable = true;
> > +	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp = %d "
> > +		    "Compressed Bpp = %d Slice Count = %d\n",
> > +		    pipe_config->pipe_bpp,
> > +		    pipe_config->dsc.compressed_bpp,
> > +		    pipe_config->dsc.slice_count);
> > +
> > +	return 0;
> > +}
> > +
> > +int intel_dp_mst_dsc_compute_config(struct intel_dp *intel_dp,
> > +				    struct intel_crtc_state *pipe_config,
> > +				    struct drm_connector_state *conn_state,
> > +				    struct link_config_limits *limits,
> > +				    int timeslots)
> > +{
> > +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> > +	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
> > +	const struct drm_display_mode *adjusted_mode =
> > +		&pipe_config->hw.adjusted_mode;
> > +	int pipe_bpp;
> > +	int ret;
> > +	u16 dsc_max_output_bpp;
> > +	u8 dsc_dp_slice_count;
> > +
> > +	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
> > +		intel_dp_supports_fec(intel_dp, pipe_config);
> > +
> > +	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
> > +		return -EINVAL;
> > +
> > +	pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
> > +
> > +	/* Min Input BPC for ICL+ is 8 */
> > +	if (pipe_bpp < 8 * 3) {
> > +		drm_dbg_kms(&dev_priv->drm,
> > +			    "No DSC support for less than 8bpc\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * For now enable DSC for max bpp, max link rate, max lane count.
> > +	 * Optimize this later for the minimum possible link rate/lane count
> > +	 * with DSC enabled for the requested mode.
> > +	 */
> > +	pipe_config->pipe_bpp = pipe_bpp;
> > +	pipe_config->port_clock = limits->max_rate;
> > +	pipe_config->lane_count = limits->max_lane_count;
> > +
> > +	dsc_max_output_bpp =
> > +		intel_dp_dsc_get_output_bpp(dev_priv,
> > +					    pipe_config->port_clock,
> > +					    pipe_config->lane_count,
> > +					    adjusted_mode->crtc_clock,
> > +					    adjusted_mode->crtc_hdisplay,
> > +					    pipe_config->bigjoiner_pipes,
> > +					    pipe_bpp,
> > +					    timeslots);
> > +
> > +	dsc_dp_slice_count =
> > +		intel_dp_dsc_get_slice_count(intel_dp,
> > +					     adjusted_mode->crtc_clock,
> > +					     adjusted_mode->crtc_hdisplay,
> > +					     pipe_config->bigjoiner_pipes);
> > +
> > +	if (!dsc_max_output_bpp || !dsc_dp_slice_count) {
> > +		drm_dbg_kms(&dev_priv->drm,
> > +			    "Compressed BPP/Slice Count not supported\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	pipe_config->dsc.compressed_bpp = min_t(u16,
> > +					       dsc_max_output_bpp >> 4,
> > +					       pipe_config->pipe_bpp);
> > +
> > +	pipe_config->dsc.slice_count = dsc_dp_slice_count;
> > +	drm_dbg_kms(&dev_priv->drm, "MST DSC: compressed bpp %d slice count %d\n",
> > +		    pipe_config->dsc.compressed_bpp,
> > +		    pipe_config->dsc.slice_count);
> >  
> 
> That looks like 100% copy-pasta from the existing function. 
> Please refactor if you can't just call the existing function
> directly for some reason.

Yep, the main change was mostly just to propagate new timeslots
parameter to intel_dp_dsc_get_output_bpp - currentl function has it
hardcoded as 1.
I will check what can be done to somehow formalize this better, so
that there would be only single function used for both cases.

Stan

> 
> -- 
> Ville Syrjälä
> Intel
