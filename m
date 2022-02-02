Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D34A6E95
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A1E10E5B6;
	Wed,  2 Feb 2022 10:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2E910E5B6;
 Wed,  2 Feb 2022 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643797349; x=1675333349;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dWqhWoYgjNwpMqmSQaeYVKWcIqReO65IZvDVafXkwkU=;
 b=Qo0zPDZTe4mQQ529KdUsiJYDuxvViQvn7yrLhYIfNz5eNhbt10+KKdTG
 5d6smU27SKPcLuRge2FzhSV1w5WNcqIAkaKOHAPC+ZfwTCBWQqfmM0LH+
 KbET47WOsRgEDo36BZm5+X1p0V5hEwD4rIfe1S787OS/1sWpPHUwF5lte
 hZkc23kbTpV2GWNsKBA4xkvhnut05wxQv2by172LecEzbXlGw7Cy2r/Kd
 1jMwTmxxRbEI95yL1bLHtu5M0sRGBotdUWLlMzISnpQWwLaLBc1ye5O2w
 C9d7Ff719sFS1x8xNzUCKOy67h1Zy6iuVZakM98sWdAQcZV0OI/cqlokI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="231456428"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="231456428"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:22:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="497698943"
Received: from markeyp-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.6.210])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 02:22:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 5/8] drm/i915/dp: rewrite DP 2.0 128b/132b link training
 based on errata
In-Reply-To: <YfDdT0IovfclLP3W@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1643130139.git.jani.nikula@intel.com>
 <5c061c1610834b9b1b057e6d32b774e7db5500a8.1643130139.git.jani.nikula@intel.com>
 <YfDdT0IovfclLP3W@intel.com>
Date: Wed, 02 Feb 2022 12:22:23 +0200
Message-ID: <87fsp1tvog.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 26 Jan 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Jan 25, 2022 at 07:03:43PM +0200, Jani Nikula wrote:
>> The DP 2.0 errata completely overhauls the 128b/132b link training, with
>> no provisions for backward compatibility with the original DP 2.0
>> specification.
>>=20
>> The changes are too intrusive to consider reusing the same code for both
>> 8b/10b and 128b/132b, mainly because the LTTPR channel equalisation is
>> done concurrently instead of serialized.
>>=20
>> NOTES:
>>=20
>> * It's a bit unclear when to wait for DP_INTERLANE_ALIGN_DONE and
>>   per-lane DP_LANE_SYMBOL_LOCKED. Figure xx4 in the SCR implies the
>>   LANEx_CHANNEL_EQ_DONE sequence may end with either 0x77,0x77,0x85 *or*
>>   0x33,0x33,0x84 (for four lane configuration in DPCD 0x202..0x204)
>>   i.e. without the above bits set. Text elsewhere seems contradictory or
>>   incomplete.
>>=20
>> * We read entire link status (6 bytes) everywhere instead of individual
>>   DPCD addresses.
>>=20
>> * There are some subtle ambiguities or contradictions in the order of
>>   some DPCD access and TPS signal enables/disables. It's also not clear
>>   whether these are significant.
>>=20
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  .../drm/i915/display/intel_dp_link_training.c | 252 +++++++++++++++++-
>>  1 file changed, 251 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/dri=
vers/gpu/drm/i915/display/intel_dp_link_training.c
>> index 4e507aa75a03..8bb6a296f421 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>> @@ -1102,6 +1102,250 @@ intel_dp_link_train_all_phys(struct intel_dp *in=
tel_dp,
>>  	return ret;
>>  }
>>=20=20
>> +
>> +/*
>> + * 128b/132b DP LANEx_EQ_DONE Sequence (DP 2.0 E11 3.5.2.16.1)
>> + */
>> +static bool
>> +intel_dp_128b132b_lane_eq(struct intel_dp *intel_dp,
>> +			  const struct intel_crtc_state *crtc_state)
>> +{
>> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>> +	struct drm_i915_private *i915 =3D to_i915(encoder->base.dev);
>> +	u8 link_status[DP_LINK_STATUS_SIZE];
>> +	int delay_us;
>> +	int try, max_tries =3D 20;
>> +	unsigned long deadline;
>> +
>> +	/*
>> +	 * Reset signal levels. Start transmitting 128b/132b TPS1.
>> +	 *
>> +	 * Put DPRX and LTTPRs (if any) into intra-hop AUX mode by writing TPS1
>> +	 * in DP_TRAINING_PATTERN_SET.
>> +	 */
>> +	if (!intel_dp_reset_link_train(intel_dp, crtc_state, DP_PHY_DPRX,
>> +				       DP_TRAINING_PATTERN_1)) {
>> +		drm_err(&i915->drm,
>> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS1\n",
>> +			encoder->base.base.id, encoder->base.name);
>> +		return false;
>> +	}
>> +
>> +	delay_us =3D drm_dp_128b132b_read_aux_rd_interval(&intel_dp->aux);
>> +
>> +	/* Read the initial TX FFE settings. */
>> +	if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
>> +		drm_err(&i915->drm,
>> +			"[ENCODER:%d:%s] Failed to read TX FFE presets\n",
>> +			encoder->base.base.id, encoder->base.name);
>> +		return false;
>> +	}
>> +
>> +	/* Update signal levels and training set as requested. */
>> +	intel_dp_get_adjust_train(intel_dp, crtc_state, DP_PHY_DPRX, link_stat=
us);
>> +	if (!intel_dp_update_link_train(intel_dp, crtc_state, DP_PHY_DPRX)) {
>> +		drm_err(&i915->drm,
>> +			"[ENCODER:%d:%s] Failed to set initial TX FFE settings\n",
>> +			encoder->base.base.id, encoder->base.name);
>> +		return false;
>> +	}
>> +
>> +	/* Start transmitting 128b/132b TPS2. */
>> +	if (!intel_dp_set_link_train(intel_dp, crtc_state, DP_PHY_DPRX,
>> +				     DP_TRAINING_PATTERN_2)) {
>> +		drm_err(&i915->drm,
>> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS2\n",
>> +			encoder->base.base.id, encoder->base.name);
>> +		return false;
>> +	}
>> +
>> +	for (try =3D 0; try < max_tries; try++) {
>> +		usleep_range(delay_us, 2 * delay_us);
>> +
>> +		/*
>> +		 * The delay may get updated. The transmitter shall read the
>> +		 * delay before link status during link training.
>> +		 */
>> +		delay_us =3D drm_dp_128b132b_read_aux_rd_interval(&intel_dp->aux);
>> +
>> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Failed to read link status\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
>> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Downstream link training failure\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		if (drm_dp_128b132b_lane_channel_eq_done(link_status, crtc_state->lan=
e_count)) {
>> +			drm_dbg_kms(&i915->drm,
>> +				    "[ENCODER:%d:%s] Lane channel eq done\n",
>> +				    encoder->base.base.id, encoder->base.name);
>> +			break;
>> +		}
>> +
>> +		/* Update signal levels and training set as requested. */
>> +		intel_dp_get_adjust_train(intel_dp, crtc_state, DP_PHY_DPRX, link_sta=
tus);
>> +		if (!intel_dp_update_link_train(intel_dp, crtc_state, DP_PHY_DPRX)) {
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Failed to update TX FFE settings\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +	}
>> +
>> +	if (try =3D=3D max_tries) {
>> +		intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +		drm_err(&i915->drm,
>> +			"[ENCODER:%d:%s] Max loop count reached\n",
>> +			encoder->base.base.id, encoder->base.name);
>> +		return false;
>> +	}
>> +
>> +	/*
>> +	 * FIXME: This should probably be the total time budget for the comple=
te
>> +	 * LANEx_EQ_DONE Sequence, including the loop above and the aux rd
>> +	 * intervals.
>> +	 */
>
> That is what my spec reading skills tell me. I suspect it's just there
> to make sure some broken device can't specify an overly long aux rd
> interval and make the link training too long. 20*256ms=3D~5 seconds max.
>
> I'd either drop this for now, or try to intergrate properly inte loop.

Extended it over the entire sequence.

>
>> +	deadline =3D jiffies + msecs_to_jiffies(400);
>> +	for (;;) {
>> +		if (drm_dp_128b132b_eq_interlane_align_done(link_status)) {
>> +			drm_dbg_kms(&i915->drm,
>> +				    "[ENCODER:%d:%s] Interlane align done\n",
>> +				    encoder->base.base.id, encoder->base.name);
>> +			break;
>> +		}
>> +
>> +		if (time_after(jiffies, deadline)) {
>> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Interlane align timeout\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		usleep_range(2000, 3000);
>> +
>> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Failed to read link status\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
>> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Downstream link training failure\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +/*
>> + * 128b/132b DP LANEx_CDS_DONE Sequence (DP 2.0 E11 3.5.2.16.2)
>> + */
>> +static bool
>> +intel_dp_128b132b_lane_cds(struct intel_dp *intel_dp,
>> +			   const struct intel_crtc_state *crtc_state,
>> +			   int lttpr_count)
>> +{
>> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>> +	struct drm_i915_private *i915 =3D to_i915(encoder->base.dev);
>> +	u8 link_status[DP_LINK_STATUS_SIZE];
>> +	unsigned long deadline;
>> +
>> +	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
>> +			       DP_TRAINING_PATTERN_2_CDS) !=3D 1) {
>> +		drm_err(&i915->drm,
>> +			"[ENCODER:%d:%s] Failed to start 128b/132b TPS2 CDS\n",
>> +			encoder->base.base.id, encoder->base.name);
>> +		return false;
>> +	}
>> +
>> +	deadline =3D jiffies + msecs_to_jiffies((lttpr_count + 1) * 20);
>> +	for (;;) {
>> +		usleep_range(2000, 3000);
>> +
>> +		if (drm_dp_dpcd_read_link_status(&intel_dp->aux, link_status) < 0) {
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Failed to read link status\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		if (drm_dp_128b132b_cds_interlane_align_done(link_status) &&
>> +		    drm_dp_128b132b_lane_symbol_locked(link_status, crtc_state->lane_=
count)) {
>> +			drm_dbg_kms(&i915->drm,
>> +				    "[ENCODER:%d:%s] CDS interlane align done\n",
>> +				    encoder->base.base.id, encoder->base.name);
>> +			break;
>> +		}
>> +
>> +		if (drm_dp_128b132b_link_training_failed(link_status)) {
>> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] Downstream link training failure\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +
>> +		if (time_after(jiffies, deadline)) {
>
> This is racy. There's no telling how much time has passed since
> the last time we checked the status. Standard rule of timeouts:
> always check one last time after the timeout has expired.

Right, thanks, fixed.

>
>> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> +			drm_err(&i915->drm,
>> +				"[ENCODER:%d:%s] CDS timeout\n",
>> +				encoder->base.base.id, encoder->base.name);
>> +			return false;
>> +		}
>> +	}
>> +
>> +	/* FIXME: Should DP_TRAINING_PATTERN_DISABLE be written first? */
>
> Not sure. The other thing missing is waiting for the intra-hop AUX
> indicator to go away after we exit link training.

Hum, I guess I've missed that. I thought we should check for that before
we start. (And yes, that's missing, there's another FIXME.)

>
> It seems we should also block all other aux transfers during LT=20
> because of the intra-hop AUX mode. I can imagine things might get
> a bit confused if the LTTPRs start answering directly to AUX
> transfers that are intended to pass through to the DPRX.

Yeah, I've left that for the future. I haven't figured out a clean way
to do it yet.

>
>> +	if (intel_dp->set_idle_link_train)
>> +		intel_dp->set_idle_link_train(intel_dp, crtc_state);
>> +
>> +	return true;
>> +}
>> +
>> +/*
>> + * 128b/132b link training sequence. (DP 2.0 E11 SCR on link training.)
>> + */
>> +static bool
>> +intel_dp_128b132b_link_train(struct intel_dp *intel_dp,
>> +			     const struct intel_crtc_state *crtc_state,
>> +			     int lttpr_count)
>> +{
>> +	struct intel_connector *connector =3D intel_dp->attached_connector;
>> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>> +	bool passed =3D false;
>> +
>> +	/*
>> +	 * FIXME: Validate previous LT termination by reading Intra-Hop AUX
>> +	 * Reply Indication by reading bit 3 of SINK_STATUS at 00205h
>> +	 */
>> +
>> +	if (intel_dp_128b132b_lane_eq(intel_dp, crtc_state) &&
>> +	    intel_dp_128b132b_lane_cds(intel_dp, crtc_state, lttpr_count))
>> +		passed =3D true;
>> +
>> +	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
>> +		    "[CONNECTOR:%d:%s][ENCODER:%d:%s] 128b/132b Link Training %s at l=
ink rate =3D %d, lane count =3D %d\n",
>> +		    connector->base.base.id, connector->base.name,
>> +		    encoder->base.base.id, encoder->base.name,
>> +		    passed ? "passed" : "failed",
>> +		    crtc_state->port_clock, crtc_state->lane_count);
>> +
>> +	return passed;
>> +}
>> +
>>  /**
>>   * intel_dp_start_link_train - start link training
>>   * @intel_dp: DP struct
>> @@ -1115,6 +1359,7 @@ intel_dp_link_train_all_phys(struct intel_dp *inte=
l_dp,
>>  void intel_dp_start_link_train(struct intel_dp *intel_dp,
>>  			       const struct intel_crtc_state *crtc_state)
>>  {
>> +	static bool passed;
>>  	/*
>>  	 * TODO: Reiniting LTTPRs here won't be needed once proper connector
>>  	 * HW state readout is added.
>> @@ -1127,6 +1372,11 @@ void intel_dp_start_link_train(struct intel_dp *i=
ntel_dp,
>>=20=20
>>  	intel_dp_prepare_link_train(intel_dp, crtc_state);
>>=20=20
>> -	if (!intel_dp_link_train_all_phys(intel_dp, crtc_state, lttpr_count))
>> +	if (intel_dp_is_uhbr(crtc_state))
>> +		passed =3D intel_dp_128b132b_link_train(intel_dp, crtc_state, lttpr_c=
ount);
>> +	else
>> +		passed =3D intel_dp_link_train_all_phys(intel_dp, crtc_state, lttpr_c=
ount);
>> +
>> +	if (!passed)
>>  		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
>>  }
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
