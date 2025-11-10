Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB9C4583E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2854210E359;
	Mon, 10 Nov 2025 09:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhF4b7PW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F01C10E326;
 Mon, 10 Nov 2025 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762765571; x=1794301571;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=sy+86sYBy9f6vcuG082VybEB5fwSXKYjG6sOaZgNuow=;
 b=EhF4b7PWyXZHS0muwW7ORjSsYXA32UzCGfB7ibeoTdNyZ64i3vfu4ZEC
 EWYrujZKcDjOlKbsupssxuluL4040/sJePmaLWHDQGZePI6NTQhVSZdNV
 GE2G5jL0OSCQKn9k2okUiVo7oQwb+3IVdu4E1gXyRT61I7wmZbfTPaN4d
 +YRwp8BW92IokX0zKZvoxWyCy3vaQzQB6cWhtKlm5kK5L3RzmALfv0oxz
 KSr0Xlx8jHxV+8YTHmc8s+F4Esi37rUny/kTbh6d1tpoNOtmaqZdmrvZL
 HjK3eS8CXr9o+AbSx4rGy0ONiC5WswMsDdpdYWgwB+ZVcwZNsGwTWRYxK Q==;
X-CSE-ConnectionGUID: 87Afn3yUQGyy5gnm68Uq5g==
X-CSE-MsgGUID: D4NkHUauTg2uRw2ZmF1GZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="87442986"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="87442986"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:06:11 -0800
X-CSE-ConnectionGUID: BcF6LUvJQrStRQciudwu5Q==
X-CSE-MsgGUID: gjxtygzxSkqd+7toIDHypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="225879837"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:06:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time
 calculation
In-Reply-To: <DS0PR11MB80493549C11D2E93AD1E3DA8F9C3A@DS0PR11MB8049.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-5-animesh.manna@intel.com>
 <DM3PPF208195D8DA39A8CC8C853DF4CF4FDE3C3A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DS0PR11MB80493549C11D2E93AD1E3DA8F9C3A@DS0PR11MB8049.namprd11.prod.outlook.com>
Date: Mon, 10 Nov 2025 11:06:06 +0200
Message-ID: <70995298ddf19481ee4e0e052adde739eb3328fe@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Nov 2025, "Manna, Animesh" <animesh.manna@intel.com> wrote:
>> -----Original Message-----
>> From: Kandpal, Suraj <suraj.kandpal@intel.com>
>> Sent: Friday, November 7, 2025 9:31 AM
>> To: Manna, Animesh <animesh.manna@intel.com>; intel-
>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org
>> Cc: Nikula, Jani <jani.nikula@intel.com>; Manna, Animesh
>> <animesh.manna@intel.com>; Hogander, Jouni
>> <jouni.hogander@intel.com>
>> Subject: RE: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time
>> calculation
>>=20
>> > Subject: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time
>> > calculation
>> >
>> > Divide the auxless wake time calculation in parts which will help
>> > later to add Xe3p related modification.
>> >
>> > v1: Initial version.
>>=20
>> No need for this you can start off with v2 directly Same for all patches=
 where
>> this has occured
>>=20
>> > v2: Refactor first existing calculation. [Jani]
>> >
>>=20
>> Add Bspec link
>>=20
>> > Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
>> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_alpm.c | 37
>> > ++++++++++++++++-------
>> >  1 file changed, 26 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
>> > b/drivers/gpu/drm/i915/display/intel_alpm.c
>> > index 779718d0c8dd..8d07455a62c2 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_alpm.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
>> > @@ -85,6 +85,26 @@ static int get_lfps_half_cycle_clocks(const struct
>> > intel_crtc_state *crtc_state)
>> >  		1000 / (2 * LFPS_CYCLE_COUNT);
>> >  }
>> >
>> > +static int get_tphy2_p2_to_p0(struct intel_dp *intel_dp) {
>> > +	return 12 * 1000;
>> > +}
>> > +
>> > +static int get_establishment_period(struct intel_dp *intel_dp,
>> > +				    const struct intel_crtc_state *crtc_state) {
>> > +	int port_clock =3D crtc_state->port_clock;
>> > +	int t1 =3D 50 * 1000;
>> > +	int tps4 =3D (252 * 10);
>>=20
>> Where did this * 10 come from?
>
> The Link Rate Divider (Rate Div) is 10 for 8b/10b and 32
> 128b/132b. Also please check the next patch for more clarity.

Please separate pure code movement and changes like this.

git show --color-moved on the commit should give you a nice idea what
code movement looks like. It's a breeze to review when very few things
change during code movement.

BR,
Jani.



>
>>=20
>> > +	long tml_phy_lock =3D 1000 * 1000 * tps4 / port_clock / 10;
>>=20
>> Why the extra /10 required here also if you had not multiplied tps4 with=
 10
>> then this wouldn't be required You also removed the comment telling us
>> portclock need to be in 10Kb/s
>
> Divide by 10 always needed due to unit size of 10kb/sec, earlier both neg=
ated but for 128b/132b mode rate_div is 32. It will be more clear with next=
 patch where added the changes for 128b/132b.
>
>>=20
>> > +	int tcds, establishment_period;
>> > +
>> > +	tcds =3D (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
>> > +	establishment_period =3D (SILENCE_PERIOD_TIME + t1 + tcds);
>> > +
>> > +	return establishment_period;
>> > +}
>> > +
>> >  /*
>> >   * AUX-Less Wake Time =3D CEILING( ((PHY P2 to P0) + tLFPS_Period, Ma=
x+
>> >   * tSilence, Max+ tPHY Establishment + tCDS) / tline) @@ -104,19
>> > +124,14 @@ static int get_lfps_half_cycle_clocks(const struct
>> > intel_crtc_state
>> > *crtc_state)
>> >   * tML_PHY_LOCK =3D TPS4 Length * ( 10 / (Link Rate in MHz) )
>> >   * TPS4 Length =3D 252 Symbols
>> >   */
>> > -static int _lnl_compute_aux_less_wake_time(const struct
>> > intel_crtc_state
>> > *crtc_state)
>> > +static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
>> > +					   const struct intel_crtc_state
>>=20
>> I don=E2=80=99t see any justified reason to send intel_dp here
>
> Its needed in next patch, fix the function prototype here.
>
> Regards,
> Animesh
>
>>=20
>> Regards,
>> Suraj Kandpal
>>=20
>> > *crtc_state)
>> >  {
>> > -	int tphy2_p2_to_p0 =3D 12 * 1000;
>> > -	int t1 =3D 50 * 1000;
>> > -	int tps4 =3D 252;
>> > -	/* port_clock is link rate in 10kbit/s units */
>> > -	int tml_phy_lock =3D 1000 * 1000 * tps4 / crtc_state->port_clock;
>> > -	int num_ml_phy_lock =3D 7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1;
>> > -	int t2 =3D num_ml_phy_lock * tml_phy_lock;
>> > -	int tcds =3D 1 * t2;
>> > +	int tphy2_p2_to_p0 =3D get_tphy2_p2_to_p0(intel_dp);
>> > +	int establishment_period =3D get_establishment_period(intel_dp,
>> > +crtc_state);
>> >
>> >  	return DIV_ROUND_UP(tphy2_p2_to_p0 +
>> > get_lfps_cycle_time(crtc_state) +
>> > -			    SILENCE_PERIOD_TIME + t1 + tcds, 1000);
>> > +			    establishment_period, 1000);
>> >  }
>> >
>> >  static int
>> > @@ -128,7 +143,7 @@ _lnl_compute_aux_less_alpm_params(struct
>> intel_dp
>> > *intel_dp,
>> >  		lfps_half_cycle;
>> >
>> >  	aux_less_wake_time =3D
>> > -		_lnl_compute_aux_less_wake_time(crtc_state);
>> > +		_lnl_compute_aux_less_wake_time(intel_dp, crtc_state);
>> >  	aux_less_wake_lines =3D intel_usecs_to_scanlines(&crtc_state-
>> > >hw.adjusted_mode,
>> >  						       aux_less_wake_time);
>> >  	silence_period =3D get_silence_period_symbols(crtc_state);
>> > --
>> > 2.29.0
>

--=20
Jani Nikula, Intel
