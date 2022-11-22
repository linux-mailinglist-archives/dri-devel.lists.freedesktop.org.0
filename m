Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A163487E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A09F10E1D6;
	Tue, 22 Nov 2022 20:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E9210E1D6;
 Tue, 22 Nov 2022 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669149624; x=1700685624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jYdOcU6u2PqKHt4xoIGrPm4nN7KDQHz2+v1q3VFy6h4=;
 b=DoOP6Y8/RKoJQW5dzKfjX2qdq5LGOPXwWqO7OjV4ZRKkI0UFzO0njayG
 SJ35J3kOY9EEJF28M43CcXfbbcR2oQmV9h0ydkjBn/A8IeJRqF8qk3+rm
 b4y6B4fLtZjmtVP2surcUnvOdGJQQW8oprrKNOmOX0ZZQRMl37gD62DQG
 7gFfvxO7LJCKOzK53Cc0k3f7sCleOD0NRoyucJ3L2mB9+J7+cAZvS4ZHk
 QUNeCVw/fdk6EY9SkzdRmE6hpWVIHJn6qobdzcxGn/FEIppwHQATglBdA
 fRqs+/t+qHkinT1MmdlknGzj4TVzSm8gwT2STKP/bLvY5gVnF8LsjFWBp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="312610827"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="312610827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:40:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="705103263"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="705103263"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 22 Nov 2022 12:40:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13; Tue, 22 Nov 2022 12:40:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 12:40:22 -0800
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2375.031;
 Tue, 22 Nov 2022 12:40:22 -0800
From: "Navare, Manasi D" <manasi.d.navare@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: RE: [PATCH 6/6] drm/i915: Bpp/timeslot calculation fixes for DP MST
 DSC
Thread-Topic: [PATCH 6/6] drm/i915: Bpp/timeslot calculation fixes for DP MST
 DSC
Thread-Index: AQHY/l7CNXpN51TcyEuEkWZZnTYHMK5LaGGQ
Date: Tue, 22 Nov 2022 20:40:22 +0000
Message-ID: <07d18550300f4e08bf7c41dcf81c17a6@intel.com>
References: <20221101094222.22091-7-stanislav.lisovskiy@intel.com>
 <20221103132300.12805-1-stanislav.lisovskiy@intel.com>
 <Y215+cst5k5dCoBf@mdnavare-mobl9> <Y3ym8Ve4leqxKw3U@intel.com>
In-Reply-To: <Y3ym8Ve4leqxKw3U@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Saarinen,
 Jani" <jani.saarinen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Stan for the explanation,
With that

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi


-----Original Message-----
From: Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com>=20
Sent: Tuesday, November 22, 2022 2:40 AM
To: Navare, Manasi D <manasi.d.navare@intel.com>
Cc: intel-gfx@lists.freedesktop.org; Saarinen, Jani <jani.saarinen@intel.co=
m>; Nikula, Jani <jani.nikula@intel.com>; dri-devel@lists.freedesktop.org; =
Govindapillai, Vinod <vinod.govindapillai@intel.com>
Subject: Re: [PATCH 6/6] drm/i915: Bpp/timeslot calculation fixes for DP MS=
T DSC

On Thu, Nov 10, 2022 at 02:23:53PM -0800, Navare, Manasi wrote:
> On Thu, Nov 03, 2022 at 03:23:00PM +0200, Stanislav Lisovskiy wrote:
> > Fix intel_dp_dsc_compute_config, previously timeslots parameter was=20
> > used in fact not as a timeslots, but more like a ratio timeslots/64,=20
> > which of course didn't have any effect for SST DSC, but causes now=20
> > issues for MST DSC.
> > Secondly we need to calculate pipe_bpp using=20
> > intel_dp_dsc_compute_bpp only for SST DSC case, while for MST case=20
> > it has been calculated earlier already with intel_dp_dsc_mst_compute_li=
nk_config.
> > Third we also were wrongly determining sink min bpp/max bpp, those=20
> > limites should be intersected with our limits to find common=20
> > acceptable bpp's, plus on top of that we should align those with=20
> > VESA bpps and only then calculate required timeslots amount.
> > Some MST hubs started to work only after third change was made.
> >=20
> > v2: Make kernel test robot happy(claimed there was unitialzed use,
> >     while there is none)
> >=20
> > Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c     | 69 ++++++++++++++-------
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  3 +-
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 69=20
> > +++++++++++++++++----
> >  3 files changed, 106 insertions(+), 35 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c=20
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 8288a30dbd51..82752b696498 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -716,9 +716,14 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_pr=
ivate *i915,
> >  	 * for SST -> TimeSlotsPerMTP is 1,
> >  	 * for MST -> TimeSlotsPerMTP has to be calculated
> >  	 */
> > -	bits_per_pixel =3D (link_clock * lane_count * 8) * timeslots /
> > -			 intel_dp_mode_to_fec_clock(mode_clock);
> > -	drm_dbg_kms(&i915->drm, "Max link bpp: %u\n", bits_per_pixel);
> > +	bits_per_pixel =3D DIV_ROUND_UP((link_clock * lane_count) * timeslots=
,
> > +				      intel_dp_mode_to_fec_clock(mode_clock) * 8);
>=20
> Why did we remove the *8 in the numerator for the total bandwidth=20
> link_clock * lane_count * 8 ?
>=20
> Other than this clarification, all changes look good
>=20
> Manasi

Hi Manasi,

Because previously this function was actually confusing the ratio timeslots=
/64, with the timeslots number.

It was actually expecting a ratio timeslots/64, rather than the timeslots n=
umber.

For SST it didn't matter as timeslots were always 1, but for MST case if we=
 multiply that by number number of timeslots, this formula will return some=
 big bogus bits_per_pixel number(checked that).=20
Of course we can pass a ratio timeslots/64 here, but it isn't very convenie=
nt and intuitive to manipulate.
So I made it to use a "timeslots" parameter as timeslots number, so that th=
e ratio is calculated as part of the formula i.e:

((link_clock * lane_count * 8) * (timeslots / 64)) /  intel_dp_mode_to_fec_=
clock(mode_clock);

which can be simplified as

((link_clock * lane_count * timeslots) / 8) / intel_dp_mode_to_fec_clock(mo=
de_clock);

the whole formula comes from that
pipe_bpp * crtc_clock should be equal to link_total_bw * (timeslots / 64), =
i.e
timeslots/64 ratio defines, how much of the link_total_bw(link_clock * lane=
_count * 8) we have for those pipe_bpp * crtc_clock, which we want to accom=
odate there.

Obviously if we just multiplied link_total_bw by timeslots, we would get a =
situation that the more timeslots we allocate, the more total bw we get, wh=
ich is wrong and will result in some bogus huge pipe_bpp numbers.

Stan

>=20
> > +
> > +	drm_dbg_kms(&i915->drm, "Max link bpp is %u for %u timeslots "
> > +				"total bw %u pixel clock %u\n",
> > +				bits_per_pixel, timeslots,
> > +				(link_clock * lane_count * 8),
> > +				intel_dp_mode_to_fec_clock(mode_clock));
> > =20
> >  	/* Small Joiner Check: output bpp <=3D joiner RAM (bits) / Horiz. wid=
th */
> >  	max_bpp_small_joiner_ram =3D small_joiner_ram_size_bits(i915) / @@=20
> > -1047,7 +1052,7 @@ intel_dp_mode_valid(struct drm_connector *_connector=
,
> >  							    target_clock,
> >  							    mode->hdisplay,
> >  							    bigjoiner,
> > -							    pipe_bpp, 1) >> 4;
> > +							    pipe_bpp, 64) >> 4;
> >  			dsc_slice_count =3D
> >  				intel_dp_dsc_get_slice_count(intel_dp,
> >  							     target_clock,
> > @@ -1481,7 +1486,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *=
intel_dp,
> >  				struct intel_crtc_state *pipe_config,
> >  				struct drm_connector_state *conn_state,
> >  				struct link_config_limits *limits,
> > -				int timeslots)
> > +				int timeslots,
> > +				bool compute_pipe_bpp)
> >  {
> >  	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
> >  	struct drm_i915_private *dev_priv =3D=20
> > to_i915(dig_port->base.base.dev); @@ -1496,7 +1502,10 @@ int intel_dp_d=
sc_compute_config(struct intel_dp *intel_dp,
> >  	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
> >  		return -EINVAL;
> > =20
> > -	pipe_bpp =3D intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_reque=
sted_bpc);
> > +	if (compute_pipe_bpp)
> > +		pipe_bpp =3D intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requ=
ested_bpc);
> > +	else
> > +		pipe_bpp =3D pipe_config->pipe_bpp;
> > =20
> >  	if (intel_dp->force_dsc_bpc) {
> >  		pipe_bpp =3D intel_dp->force_dsc_bpc * 3; @@ -1527,31 +1536,47 @@=20
> > int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> >  			drm_dp_dsc_sink_max_slice_count(intel_dp->dsc_dpcd,
> >  							true);
> >  	} else {
> > -		u16 dsc_max_output_bpp;
> > +		u16 dsc_max_output_bpp =3D 0;
> >  		u8 dsc_dp_slice_count;
> > =20
> > -		dsc_max_output_bpp =3D
> > -			intel_dp_dsc_get_output_bpp(dev_priv,
> > -						    pipe_config->port_clock,
> > -						    pipe_config->lane_count,
> > -						    adjusted_mode->crtc_clock,
> > -						    adjusted_mode->crtc_hdisplay,
> > -						    pipe_config->bigjoiner_pipes,
> > -						    pipe_bpp,
> > -						    timeslots);
> > +		if (compute_pipe_bpp) {
> > +			dsc_max_output_bpp =3D
> > +				intel_dp_dsc_get_output_bpp(dev_priv,
> > +							    pipe_config->port_clock,
> > +							    pipe_config->lane_count,
> > +							    adjusted_mode->crtc_clock,
> > +							    adjusted_mode->crtc_hdisplay,
> > +							    pipe_config->bigjoiner_pipes,
> > +							    pipe_bpp,
> > +							    timeslots);
> > +			if (!dsc_max_output_bpp) {
> > +				drm_dbg_kms(&dev_priv->drm,
> > +					    "Compressed BPP not supported\n");
> > +				return -EINVAL;
> > +			}
> > +		}
> >  		dsc_dp_slice_count =3D
> >  			intel_dp_dsc_get_slice_count(intel_dp,
> >  						     adjusted_mode->crtc_clock,
> >  						     adjusted_mode->crtc_hdisplay,
> >  						     pipe_config->bigjoiner_pipes);
> > -		if (!dsc_max_output_bpp || !dsc_dp_slice_count) {
> > +		if (!dsc_dp_slice_count) {
> >  			drm_dbg_kms(&dev_priv->drm,
> > -				    "Compressed BPP/Slice Count not supported\n");
> > +				    "Compressed Slice Count not supported\n");
> >  			return -EINVAL;
> >  		}
> > -		pipe_config->dsc.compressed_bpp =3D min_t(u16,
> > -							dsc_max_output_bpp >> 4,
> > -							pipe_config->pipe_bpp);
> > +
> > +		/*
> > +		 * compute pipe bpp is set to false for DP MST DSC case
> > +		 * and compressed_bpp is calculated same time once
> > +		 * vpci timeslots are allocated, because overall bpp
> > +		 * calculation procedure is bit different for MST case.
> > +		 */
> > +		if (compute_pipe_bpp) {
> > +			pipe_config->dsc.compressed_bpp =3D min_t(u16,
> > +								dsc_max_output_bpp >> 4,
> > +								pipe_config->pipe_bpp);
> > +		}
> >  		pipe_config->dsc.slice_count =3D dsc_dp_slice_count;
> >  		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n=
",
> >  			    pipe_config->dsc.compressed_bpp, @@ -1659,7 +1684,7 @@=20
> > intel_dp_compute_link_config(struct intel_encoder *encoder,
> >  			    str_yes_no(ret), str_yes_no(joiner_needs_dsc),
> >  			    str_yes_no(intel_dp->force_dsc_en));
> >  		ret =3D intel_dp_dsc_compute_config(intel_dp, pipe_config,
> > -						  conn_state, &limits, 1);
> > +						  conn_state, &limits, 1, true);
> >  		if (ret < 0)
> >  			return ret;
> >  	}
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h=20
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index 0fe10d93b75c..75098001685a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -60,7 +60,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *inte=
l_dp,
> >  				struct intel_crtc_state *pipe_config,
> >  				struct drm_connector_state *conn_state,
> >  				struct link_config_limits *limits,
> > -				int timeslots);
> > +				int timeslots,
> > +				bool recompute_pipe_bpp);
> >  bool intel_dp_is_edp(struct intel_dp *intel_dp);  bool=20
> > intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);  bool=20
> > intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port=20
> > port); diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c=20
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 8442eea27a57..69e383decb39 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -80,12 +80,12 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(str=
uct intel_encoder *encoder,
> >  	}
> > =20
> >  	for (bpp =3D max_bpp; bpp >=3D min_bpp; bpp -=3D step) {
> > -		crtc_state->pipe_bpp =3D bpp;
> > -
> >  		crtc_state->pbn =3D drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
> > -						       dsc ? bpp << 4 : crtc_state->pipe_bpp,
> > +						       dsc ? bpp << 4 : bpp,
> >  						       dsc);
> > =20
> > +		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
> > +
> >  		slots =3D drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
> >  						      connector->port,
> >  						      crtc_state->pbn);
> > @@ -107,9 +107,16 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(st=
ruct intel_encoder *encoder,
> >  	if (ret && slots >=3D 0)
> >  		slots =3D ret;
> > =20
> > -	if (slots < 0)
> > +	if (slots < 0) {
> >  		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
> >  			    slots);
> > +	} else {
> > +		if (!dsc)
> > +			crtc_state->pipe_bpp =3D bpp;
> > +		else
> > +			crtc_state->dsc.compressed_bpp =3D bpp;
> > +		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc %d\n", slo=
ts, bpp, dsc);
> > +	}
> > =20
> >  	return slots;
> >  }
> > @@ -156,8 +163,10 @@ static int intel_dp_dsc_mst_compute_link_config(st=
ruct intel_encoder *encoder,
> >  	int slots =3D -EINVAL;
> >  	int i, num_bpc;
> >  	u8 dsc_bpc[3] =3D {0};
> > -	int min_bpp, max_bpp;
> > +	int min_bpp, max_bpp, sink_min_bpp, sink_max_bpp;
> >  	u8 dsc_max_bpc;
> > +	bool need_timeslot_recalc =3D false;
> > +	u32 last_compressed_bpp;
> > =20
> >  	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> >  	if (DISPLAY_VER(i915) >=3D 12)
> > @@ -170,14 +179,28 @@ static int=20
> > intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
> > =20
> >  	num_bpc =3D drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
> >  						       dsc_bpc);
> > -	for (i =3D 0; i < num_bpc; i++) {
> > -		if (max_bpp >=3D dsc_bpc[i] * 3)
> > -			if (min_bpp > dsc_bpc[i] * 3)
> > -				min_bpp =3D dsc_bpc[i] * 3;
> > +
> > +	drm_dbg_kms(&i915->drm, "DSC Source supported min bpp %d max bpp %d\n=
",
> > +		    min_bpp, max_bpp);
> > +
> > +	sink_max_bpp =3D dsc_bpc[0] * 3;
> > +	sink_min_bpp =3D sink_max_bpp;
> > +
> > +	for (i =3D 1; i < num_bpc; i++) {
> > +		if (sink_min_bpp > dsc_bpc[i] * 3)
> > +			sink_min_bpp =3D dsc_bpc[i] * 3;
> > +		if (sink_max_bpp < dsc_bpc[i] * 3)
> > +			sink_max_bpp =3D dsc_bpc[i] * 3;
> >  	}
> > =20
> >  	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
> > -		    min_bpp, max_bpp);
> > +		    sink_min_bpp, sink_max_bpp);
> > +
> > +	if (min_bpp < sink_min_bpp)
> > +		min_bpp =3D sink_min_bpp;
> > +
> > +	if (max_bpp > sink_max_bpp)
> > +		max_bpp =3D sink_max_bpp;
> > =20
> >  	slots =3D intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, m=
ax_bpp,
> >  						     min_bpp, limits,
> > @@ -186,6 +209,28 @@ static int intel_dp_dsc_mst_compute_link_config(st=
ruct intel_encoder *encoder,
> >  	if (slots < 0)
> >  		return slots;
> > =20
> > +	last_compressed_bpp =3D crtc_state->dsc.compressed_bpp;
> > +
> > +	crtc_state->dsc.compressed_bpp =3D intel_dp_dsc_nearest_vesa_bpp(i915=
,
> > +								       last_compressed_bpp,
> > +								       crtc_state->pipe_bpp);
> > +
> > +	if (crtc_state->dsc.compressed_bpp !=3D last_compressed_bpp)
> > +		need_timeslot_recalc =3D true;
> > +
> > +	/*
> > +	 * Apparently some MST hubs dislike if vcpi slots are not matching pr=
ecisely
> > +	 * the actual compressed bpp we use.
> > +	 */
> > +	if (need_timeslot_recalc) {
> > +		slots =3D intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
> > +							     crtc_state->dsc.compressed_bpp,
> > +							     crtc_state->dsc.compressed_bpp,
> > +							     limits, conn_state, 2 * 3, true);
> > +		if (slots < 0)
> > +			return slots;
> > +	}
> > +
> >  	intel_link_compute_m_n(crtc_state->pipe_bpp,
> >  			       crtc_state->lane_count,
> >  			       adjusted_mode->crtc_clock, @@ -292,7 +337,7 @@ static int=20
> > intel_dp_mst_compute_config(struct intel_encoder *encoder,
> > =20
> >  		ret =3D intel_dp_dsc_compute_config(intel_dp, pipe_config,
> >  						  conn_state, &limits,
> > -						  pipe_config->dp_m_n.tu);
> > +						  pipe_config->dp_m_n.tu, false);
> >  	}
> > =20
> >  	if (ret)
> > @@ -867,7 +912,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *c=
onnector,
> >  							    target_clock,
> >  							    mode->hdisplay,
> >  							    bigjoiner,
> > -							    pipe_bpp, 1) >> 4;
> > +							    pipe_bpp, 64) >> 4;
> >  			dsc_slice_count =3D
> >  				intel_dp_dsc_get_slice_count(intel_dp,
> >  							     target_clock,
> > --
> > 2.37.3
> >=20
