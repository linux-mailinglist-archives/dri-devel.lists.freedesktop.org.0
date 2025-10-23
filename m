Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70016C003E2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752F210E370;
	Thu, 23 Oct 2025 09:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNgi5Xwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154EE10E370;
 Thu, 23 Oct 2025 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761211781; x=1792747781;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EufZLqUhN2qqOip0QWOC/yCO/eu8CO+amcAzmDK0VVE=;
 b=cNgi5XwxCCp20zyqhzhTEc3kssJFU+agC637EHmoHHiVU9Hph3z0c3NP
 h8gMYc2Ib2XN0YWPBtp4Y9W6fl3qFeaeE1F4PPp2sceUWVjNiNM8Kdnwi
 dbx6Ty5lw1TJb6uNCdjR5euoOC3NgqpiqlNtZJ3O1Vs9DmGvua5vXHwX1
 24MN9jR7/KvM4aUIeKL9ZKO/slxvsvFH3+kql1QxS89pCi7oVrbifj6XX
 3cDUWAdQ7NW9UsdLAmsnLj9EuRRRMrU74fACE8E0L9RiZYBRvu5t/pTHF
 tLWkPb2hfwOtq65ooaQmahZhj5B7PLYvnEDXih2KsEkBMspo8bs4d02I+ A==;
X-CSE-ConnectionGUID: eIiYbVpCS9S5QA5jtBMbxw==
X-CSE-MsgGUID: VxNvLaFtSTuGITopXsq/6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63280103"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63280103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:29:41 -0700
X-CSE-ConnectionGUID: gCK84nzFRmqXC8ONWxrK1A==
X-CSE-MsgGUID: HcstKMOZR3mADgoSBr/kjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="188164007"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:29:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>
Subject: Re: [PATCH 5/8] drm/i915/alpm: Auxless wake time calculation for Xe3p
In-Reply-To: <20251023084147.572535-6-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251023084147.572535-1-animesh.manna@intel.com>
 <20251023084147.572535-6-animesh.manna@intel.com>
Date: Thu, 23 Oct 2025 12:29:34 +0300
Message-ID: <7c4d73597e6b68ea08a1eb0c1e4b81cea2f30440@intel.com>
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

On Thu, 23 Oct 2025, Animesh Manna <animesh.manna@intel.com> wrote:
> Add support for auxless waketime calculation for DP2.1 ALPM
> as dependent parameter got changed.
>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 78 +++++++++++++++++++----
>  1 file changed, 67 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 0f6b15bca3be..ee5b1e3d79d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -96,6 +96,66 @@ static int get_lfps_half_cycle_clocks(const struct int=
el_crtc_state *crtc_state)
>  		1000 / (2 * LFPS_CYCLE_COUNT);
>  }
>=20=20
> +static int get_tphy2_p2_to_p0(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +
> +	return DISPLAY_VER(display) >=3D 35 ? (40 * 1000) : (12 * 1000);
> +}
> +
> +static int get_establishment_period(struct intel_dp *intel_dp,
> +				    const struct intel_crtc_state *crtc_state)
> +{
> +	int port_clock =3D crtc_state->port_clock;
> +	int t1 =3D 50 * 1000;
> +	int tps4 =3D (port_clock >=3D 1000000) ? (396 * 32) : (252 * 10);

intel_dp_is_uhbr()

> +	int tml_phy_lock =3D 1000 * 1000 * tps4 / port_clock / 10;

That would overflow 32 bits.

> +	int lttpr_count =3D 0;
> +	int establishment_period;
> +	int tcds;
> +
> +	if (!intel_dp_is_edp(intel_dp)) {

Please turn the branches around to not have the !.

> +		lttpr_count =3D drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
> +		tcds =3D 7 * tml_phy_lock;
> +	} else {
> +		tcds =3D (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
> +	}
> +
> +	if (lttpr_count) {
> +		int tlw =3D 13000;
> +		int tcs =3D 10000;
> +		int tlfps_period =3D get_lfps_cycle_time(crtc_state);
> +		int tdcs =3D (SILENCE_PERIOD_TIME + t1 + tcs +
> +			    (lttpr_count - 1) * (tlw + tlfps_period));
> +		int tacds =3D 70000;
> +		int tds =3D (lttpr_count - 1) * 7 * tml_phy_lock;
> +
> +		/* tdrl is same as tcds*/
> +		establishment_period =3D tlw + tlfps_period + tdcs + tacds + tds + tcd=
s;
> +	} else {
> +		/* TODO: Add a check for data realign by DPCD 0x116[3] */
> +
> +		establishment_period =3D (SILENCE_PERIOD_TIME + t1 + tcds);
> +	}
> +
> +	return establishment_period;
> +}
> +
> +static int get_switch_to_active(int port_clock)
> +{
> +	int switch_to_active;
> +
> +	if (port_clock >=3D 1000000) {

Again, there are uhbr helpers.

> +		int symbol_clock =3D port_clock / intel_dp_link_symbol_size(port_clock=
);
> +
> +		switch_to_active =3D 32 * DIV_ROUND_UP((396 + 3 + 64), symbol_clock);
> +	} else {
> +		switch_to_active =3D 0;
> +	}
> +
> +	return switch_to_active;
> +}
> +
>  /*
>   * AUX-Less Wake Time =3D CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
>   * tSilence, Max+ tPHY Establishment + tCDS) / tline)
> @@ -115,19 +175,15 @@ static int get_lfps_half_cycle_clocks(const struct =
intel_crtc_state *crtc_state)
>   * tML_PHY_LOCK =3D TPS4 Length * ( 10 / (Link Rate in MHz) )
>   * TPS4 Length =3D 252 Symbols
>   */
> -static int _lnl_compute_aux_less_wake_time(const struct intel_crtc_state=
 *crtc_state)
> +static int _lnl_compute_aux_less_wake_time(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state)
>  {
> -	int tphy2_p2_to_p0 =3D 12 * 1000;
> -	int t1 =3D 50 * 1000;
> -	int tps4 =3D 252;
> -	/* port_clock is link rate in 10kbit/s units */
> -	int tml_phy_lock =3D 1000 * 1000 * tps4 / crtc_state->port_clock;
> -	int num_ml_phy_lock =3D 7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1;
> -	int t2 =3D num_ml_phy_lock * tml_phy_lock;
> -	int tcds =3D 1 * t2;
> +	int tphy2_p2_to_p0 =3D get_tphy2_p2_to_p0(intel_dp);
> +	int establishment_period =3D get_establishment_period(intel_dp, crtc_st=
ate);
> +	int switch_to_active =3D get_switch_to_active(crtc_state->port_clock);
>=20=20
>  	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
> -			    SILENCE_PERIOD_TIME + t1 + tcds, 1000);
> +			    establishment_period + switch_to_active, 1000);

Looks like you should *first* refactor this to separate functions,
before adding functionality.

>  }
>=20=20
>  static int
> @@ -139,7 +195,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *in=
tel_dp,
>  		lfps_half_cycle;
>=20=20
>  	aux_less_wake_time =3D
> -		_lnl_compute_aux_less_wake_time(crtc_state);
> +		_lnl_compute_aux_less_wake_time(intel_dp, crtc_state);
>  	aux_less_wake_lines =3D intel_usecs_to_scanlines(&crtc_state->hw.adjust=
ed_mode,
>  						       aux_less_wake_time);
>  	silence_period =3D get_silence_period_symbols(crtc_state);

--=20
Jani Nikula, Intel
