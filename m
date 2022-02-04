Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC84A9881
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 12:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA49410E8F7;
	Fri,  4 Feb 2022 11:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE11D10E4D3;
 Fri,  4 Feb 2022 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643974656; x=1675510656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZXsOUM8vikhuPm4ktR+nXG4QFLTWDtEmcpnyhhp5Khc=;
 b=dW2CfjcUyWQ2To6DR0DWPdZdhYF3ELx0QW78A3F65hYJhNgBjnWFLKcc
 sMUGL0C8UK1FXF2lyhToxsSdAT61U/tuXRmkPXmbJLVFsqsmXgmVZybFp
 z7OYDJVhX24zpgmQhP5zmirKVGfQ3QyAdGwS1vUIrGrKqbM/hQDb0ytT8
 mYIlMPWiPxExLPluO173yp4ePiuKfklBX94AzjQ+GG9A8CvCeaNELhINn
 wXzIpAMdxvrY0hIR1Rlhxw3WPitWcLbpeJi+IGP1SZZliC2rqhk/WE7Dh
 8PydBzoz0UbdK8bO/ptVdZaTBCwG4m55v1a1hXkWTRDF6XOQDcMcZgTog w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="245944492"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="245944492"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 03:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="483587703"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 04 Feb 2022 03:37:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Feb 2022 13:37:22 +0200
Date: Fri, 4 Feb 2022 13:37:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 5/8] drm/i915/dp: rewrite DP 2.0 128b/132b link
 training based on errata
Message-ID: <Yf0P8kLCFcotNVkl@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
 <bda92c2540e661c39613167b53b5e5388a57a730.1643878928.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bda92c2540e661c39613167b53b5e5388a57a730.1643878928.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 11:03:54AM +0200, Jani Nikula wrote:
> The DP 2.0 errata completely overhauls the 128b/132b link training, with
> no provisions for backward compatibility with the original DP 2.0
> specification.
> 
> The changes are too intrusive to consider reusing the same code for both
> 8b/10b and 128b/132b, mainly because the LTTPR channel equalisation is
> done concurrently instead of serialized.
> 
> NOTES:
> 
> * It's a bit unclear when to wait for DP_INTERLANE_ALIGN_DONE and
>   per-lane DP_LANE_SYMBOL_LOCKED. Figure xx4 in the SCR implies the
>   LANEx_CHANNEL_EQ_DONE sequence may end with either 0x77,0x77,0x85 *or*
>   0x33,0x33,0x84 (for four lane configuration in DPCD 0x202..0x204)
>   i.e. without the above bits set. Text elsewhere seems contradictory or
>   incomplete.
> 
> * We read entire link status (6 bytes) everywhere instead of individual
>   DPCD addresses.
> 
> * There are some subtle ambiguities or contradictions in the order of
>   some DPCD access and TPS signal enables/disables. It's also not clear
>   whether these are significant.
> 
> v2:
> - Always try one last time after timeouts to avoid races (Ville)
> - Extend timeout to cover the entire LANEx_EQ_DONE sequence (Ville)
> - Also check for eq interlane align done in LANEx_CDS_DONE Sequence (Ville)
> - Check for Intra-hop status before link training
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  .../drm/i915/display/intel_dp_link_training.c | 279 +++++++++++++++++-
>  1 file changed, 278 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 4e507aa75a03..cc2b82d9114c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1102,6 +1102,277 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
>  	return ret;
>  }
>  
> +
> +/*
> + * 128b/132b DP LANEx_EQ_DONE Sequence (DP 2.0 E11 3.5.2.16.1)
> + */
> +static bool
> +intel_dp_128b132b_lane_eq(struct intel_dp *intel_dp,
> +			  const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> +	u8 link_status[DP_LINK_STATUS_SIZE];
> +	int delay_us;
> +	int try, max_tries = 20;
> +	unsigned long deadline;
> +	bool timeout = false;
> +
> +	/*
> +	 * Reset signal levels. Start transmitting 128b/132b TPS1.
> +	 *
> +	 * Put DPRX and LTTPRs (if any) into intra-hop AUX mode by writing TPS1
> +	 * in DP_TRAINING_PATTERN_SET.
> +	 */
> +	if (!intel_dp_reset_link_train(intel_dp, crtc_state, DP_PHY_DPRX,
> +				       DP_TRAINING_PATTERN_1)) {
> +		drm_err(&i915->drm,
> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS1\n",
> +			encoder->base.base.id, encoder->base.name);
> +		return false;
> +	}
> +
> +	delay_us = drm_dp_128b132b_read_aux_rd_interval(&intel_dp->aux);
> +
> +	/* Read the initial TX FFE settings. */
> +	if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
> +		drm_err(&i915->drm,
> +			"[ENCODER:%d:%s] Failed to read TX FFE presets\n",
> +			encoder->base.base.id, encoder->base.name);
> +		return false;
> +	}
> +
> +	/* Update signal levels and training set as requested. */
> +	intel_dp_get_adjust_train(intel_dp, crtc_state, DP_PHY_DPRX, link_status);
> +	if (!intel_dp_update_link_train(intel_dp, crtc_state, DP_PHY_DPRX)) {
> +		drm_err(&i915->drm,
> +			"[ENCODER:%d:%s] Failed to set initial TX FFE settings\n",
> +			encoder->base.base.id, encoder->base.name);
> +		return false;
> +	}
> +
> +	/* Start transmitting 128b/132b TPS2. */
> +	if (!intel_dp_set_link_train(intel_dp, crtc_state, DP_PHY_DPRX,
> +				     DP_TRAINING_PATTERN_2)) {
> +		drm_err(&i915->drm,
> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS2\n",
> +			encoder->base.base.id, encoder->base.name);
> +		return false;
> +	}
> +
> +	/* Time budget for the LANEx_EQ_DONE Sequence */
> +	deadline = jiffies + msecs_to_jiffies(400);

Didn't we have a msecs_to_jiffies_timeout() that adds an extra
jiffy to make sure we don't bail too early?

> +
> +	for (try = 0; try < max_tries; try++) {
> +		usleep_range(delay_us, 2 * delay_us);
> +
> +		/*
> +		 * The delay may get updated. The transmitter shall read the
> +		 * delay before link status during link training.
> +		 */
> +		delay_us = drm_dp_128b132b_read_aux_rd_interval(&intel_dp->aux);
> +
> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Failed to read link status\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Downstream link training failure\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (drm_dp_128b132b_lane_channel_eq_done(link_status, crtc_state->lane_count)) {
> +			drm_dbg_kms(&i915->drm,
> +				    "[ENCODER:%d:%s] Lane channel eq done\n",
> +				    encoder->base.base.id, encoder->base.name);
> +			break;
> +		}

The state diagrame has thow two steps in reverse order. I suppose it
doens't matter but probably better if we don't deviate too much without
a good reason.

> +
> +		if (timeout) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Lane channel eq timeout\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (time_after(jiffies, deadline))
> +			timeout = true; /* try one last time after deadline */

Is there a reason we can't do this just before drm_dp_dpcd_read_link_status()
so we don't have to pass the timeout status from one loop iteration to
the next?

> +
> +		/* Update signal levels and training set as requested. */
> +		intel_dp_get_adjust_train(intel_dp, crtc_state, DP_PHY_DPRX, link_status);
> +		if (!intel_dp_update_link_train(intel_dp, crtc_state, DP_PHY_DPRX)) {
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Failed to update TX FFE settings\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +	}
> +
> +	if (try == max_tries) {
> +		intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +		drm_err(&i915->drm,
> +			"[ENCODER:%d:%s] Max loop count reached\n",
> +			encoder->base.base.id, encoder->base.name);
> +		return false;
> +	}
> +
> +	for (;;) {
> +		if (drm_dp_128b132b_eq_interlane_align_done(link_status)) {
> +			drm_dbg_kms(&i915->drm,
> +				    "[ENCODER:%d:%s] Interlane align done\n",
> +				    encoder->base.base.id, encoder->base.name);
> +			break;
> +		}

Not a big fan of pasing the link_status between loops. Can't
we just read the status here at the start of the loop always?

> +
> +		if (timeout) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Interlane align timeout\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (time_after(jiffies, deadline))
> +			timeout = true; /* try one last time after deadline */
> +
> +		usleep_range(2000, 3000);
> +
> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Failed to read link status\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Downstream link training failure\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * 128b/132b DP LANEx_CDS_DONE Sequence (DP 2.0 E11 3.5.2.16.2)
> + */
> +static bool
> +intel_dp_128b132b_lane_cds(struct intel_dp *intel_dp,
> +			   const struct intel_crtc_state *crtc_state,
> +			   int lttpr_count)
> +{
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> +	u8 link_status[DP_LINK_STATUS_SIZE];
> +	unsigned long deadline;
> +	bool timeout = false;
> +
> +	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
> +			       DP_TRAINING_PATTERN_2_CDS) != 1) {
> +		drm_err(&i915->drm,
> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS2 CDS\n",
> +			encoder->base.base.id, encoder->base.name);
> +		return false;
> +	}
> +
> +	/* Time budget for the LANEx_CDS_DONE Sequence */
> +	deadline = jiffies + msecs_to_jiffies((lttpr_count + 1) * 20);
> +
> +	for (;;) {
> +		usleep_range(2000, 3000);
> +
> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Failed to read link status\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (drm_dp_128b132b_eq_interlane_align_done(link_status) &&
> +		    drm_dp_128b132b_cds_interlane_align_done(link_status) &&
> +		    drm_dp_128b132b_lane_symbol_locked(link_status, crtc_state->lane_count)) {
> +			drm_dbg_kms(&i915->drm,
> +				    "[ENCODER:%d:%s] CDS interlane align done\n",
> +				    encoder->base.base.id, encoder->base.name);
> +			break;
> +		}
> +
> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] Downstream link training failure\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (timeout) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			drm_err(&i915->drm,
> +				"[ENCODER:%d:%s] CDS timeout\n",
> +				encoder->base.base.id, encoder->base.name);
> +			return false;
> +		}
> +
> +		if (time_after(jiffies, deadline))
> +			timeout = true; /* try one last time after deadline */
> +	}
> +
> +	/* FIXME: Should DP_TRAINING_PATTERN_DISABLE be written first? */
> +	if (intel_dp->set_idle_link_train)
> +		intel_dp->set_idle_link_train(intel_dp, crtc_state);
> +
> +	return true;
> +}
> +
> +/*
> + * 128b/132b link training sequence. (DP 2.0 E11 SCR on link training.)
> + */
> +static bool
> +intel_dp_128b132b_link_train(struct intel_dp *intel_dp,
> +			     const struct intel_crtc_state *crtc_state,
> +			     int lttpr_count)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	bool passed = false;
> +	u8 sink_status;
> +
> +	/* FIXME: We should possibly do this earlier. */
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_STATUS, &sink_status) != 1) {
> +		drm_dbg_kms(&i915->drm, "Failed to read sink status\n");
> +		return false;
> +	}
> +
> +	if (sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION) {
> +		drm_dbg_kms(&i915->drm, "Previous link training in progress\n");
> +		return false;
> +	}
> +
> +	if (intel_dp_128b132b_lane_eq(intel_dp, crtc_state) &&
> +	    intel_dp_128b132b_lane_cds(intel_dp, crtc_state, lttpr_count))
> +		passed = true;

I think we are supposed to wait for the intra-hop AUX bit to go low
here.

> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[CONNECTOR:%d:%s][ENCODER:%d:%s] 128b/132b Link Training %s at link rate = %d, lane count = %d\n",
> +		    connector->base.base.id, connector->base.name,
> +		    encoder->base.base.id, encoder->base.name,
> +		    passed ? "passed" : "failed",
> +		    crtc_state->port_clock, crtc_state->lane_count);
> +
> +	return passed;
> +}
> +
>  /**
>   * intel_dp_start_link_train - start link training
>   * @intel_dp: DP struct
> @@ -1115,6 +1386,7 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
>  void intel_dp_start_link_train(struct intel_dp *intel_dp,
>  			       const struct intel_crtc_state *crtc_state)
>  {
> +	static bool passed;
>  	/*
>  	 * TODO: Reiniting LTTPRs here won't be needed once proper connector
>  	 * HW state readout is added.
> @@ -1127,6 +1399,11 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
>  
>  	intel_dp_prepare_link_train(intel_dp, crtc_state);
>  
> -	if (!intel_dp_link_train_all_phys(intel_dp, crtc_state, lttpr_count))
> +	if (intel_dp_is_uhbr(crtc_state))
> +		passed = intel_dp_128b132b_link_train(intel_dp, crtc_state, lttpr_count);
> +	else
> +		passed = intel_dp_link_train_all_phys(intel_dp, crtc_state, lttpr_count);
> +
> +	if (!passed)
>  		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
>  }
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
