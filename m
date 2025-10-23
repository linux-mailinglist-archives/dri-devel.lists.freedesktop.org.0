Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8484CC003EE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6770010E388;
	Thu, 23 Oct 2025 09:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZx61XRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129CF10E388;
 Thu, 23 Oct 2025 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761211866; x=1792747866;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=sDm0kyHRcP+Y3mZFDKmoyswaZ7F7ki+izBj+Mzhs4JY=;
 b=QZx61XRvpvIJk+ED/XMzLgR4oyXPg5rMF3psZQN1GbiiVTc5Fdfqz2pn
 e/svs9TaBi1JaZAb6T+FY7WMC7v8Dm7uI9mDBIcoG+cAaqR8V/QT7dPMn
 xH1qKix2qxselAlsTmRSELVjyXZJFmAjHJ840DYm/QTybPtkZo8+YUSCR
 l4++Sw4ur/W6+Chr9bil4JlZ1yN1oN99t7BJL2WPEY8TD0efhz0qaDdsH
 nhjcqCRMnDoTV9uBMQSR1aSi4dV+RoAomSUrJ8diF8+yZkmc6X1aE5TWh
 RjtScS3C+lk2ru5JxWCTTpkR0/RH8Y85/DGf14bZdMDxpS6UyuJMdKzK+ Q==;
X-CSE-ConnectionGUID: EOO9+vcITT20fO7pWl9Veg==
X-CSE-MsgGUID: vIz3ByOoQPGVdhV9K6PwZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63284224"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63284224"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:31:06 -0700
X-CSE-ConnectionGUID: 2Gru4HT+RZ6OxbCjHTKriA==
X-CSE-MsgGUID: 3DL1to2FRFOt9zSUZf+CXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184886635"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:31:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>
Subject: Re: [PATCH 6/8] drm/i915/alpm: Half LFPS cycle calculation
In-Reply-To: <20251023084147.572535-7-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251023084147.572535-1-animesh.manna@intel.com>
 <20251023084147.572535-7-animesh.manna@intel.com>
Date: Thu, 23 Oct 2025 12:31:00 +0300
Message-ID: <54493f4fef12fab9acd8681bfea83399e04f0024@intel.com>
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
> Add support for half LFPS cycle calculation for DP2.1 ALPM as dependent
> parameters got changed.
>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 32 ++++++++++++++++-------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index ee5b1e3d79d2..f7803088f916 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -68,31 +68,43 @@ static int get_silence_period_symbols(const struct in=
tel_crtc_state *crtc_state)
>  		1000 / 1000;
>  }
>=20=20
> -static void get_lfps_cycle_min_max_time(const struct intel_crtc_state *c=
rtc_state,
> +static void get_lfps_cycle_min_max_time(struct intel_dp *intel_dp,
> +					const struct intel_crtc_state *crtc_state,
>  					int *min, int *max)
>  {
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +
> +	if (!intel_dp_is_edp(intel_dp)) {
> +		*min =3D 320;
> +		*max =3D 1600;
> +		return;

You already have an if ladder, make this part of it instead of returning
early.

> +	}
> +
>  	if (crtc_state->port_clock < 540000) {
> -		*min =3D 65 * LFPS_CYCLE_COUNT;
> -		*max =3D 75 * LFPS_CYCLE_COUNT;
> +		*min =3D DISPLAY_VER(display) < 35 ? 65 * LFPS_CYCLE_COUNT : 140;
> +		*max =3D DISPLAY_VER(display) < 35 ? 75 * LFPS_CYCLE_COUNT : 800;
>  	} else {
>  		*min =3D 140;
>  		*max =3D 800;
>  	}
>  }
>=20=20
> -static int get_lfps_cycle_time(const struct intel_crtc_state *crtc_state)
> +static int get_lfps_cycle_time(struct intel_dp *intel_dp,
> +			       const struct intel_crtc_state *crtc_state)
>  {
>  	int tlfps_cycle_min, tlfps_cycle_max;
>=20=20
> -	get_lfps_cycle_min_max_time(crtc_state, &tlfps_cycle_min,
> +	get_lfps_cycle_min_max_time(intel_dp, crtc_state, &tlfps_cycle_min,
>  				    &tlfps_cycle_max);
>=20=20
>  	return tlfps_cycle_min +  (tlfps_cycle_max - tlfps_cycle_min) / 2;
>  }
>=20=20
> -static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crt=
c_state)
> +static int get_lfps_half_cycle_clocks(struct intel_dp *intel_dp,
> +				      const struct intel_crtc_state *crtc_state)
>  {
> -	return get_lfps_cycle_time(crtc_state) * crtc_state->port_clock / 1000 /
> +	return get_lfps_cycle_time(intel_dp, crtc_state) *
> +		crtc_state->port_clock / 1000 /
>  		1000 / (2 * LFPS_CYCLE_COUNT);
>  }
>=20=20
> @@ -124,7 +136,7 @@ static int get_establishment_period(struct intel_dp *=
intel_dp,
>  	if (lttpr_count) {
>  		int tlw =3D 13000;
>  		int tcs =3D 10000;
> -		int tlfps_period =3D get_lfps_cycle_time(crtc_state);
> +		int tlfps_period =3D get_lfps_cycle_time(intel_dp, crtc_state);
>  		int tdcs =3D (SILENCE_PERIOD_TIME + t1 + tcs +
>  			    (lttpr_count - 1) * (tlw + tlfps_period));
>  		int tacds =3D 70000;
> @@ -182,7 +194,7 @@ static int _lnl_compute_aux_less_wake_time(struct int=
el_dp *intel_dp,
>  	int establishment_period =3D get_establishment_period(intel_dp, crtc_st=
ate);
>  	int switch_to_active =3D get_switch_to_active(crtc_state->port_clock);
>=20=20
> -	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(crtc_state) +
> +	return DIV_ROUND_UP(tphy2_p2_to_p0 + get_lfps_cycle_time(intel_dp, crtc=
_state) +
>  			    establishment_period + switch_to_active, 1000);
>  }
>=20=20
> @@ -200,7 +212,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *in=
tel_dp,
>  						       aux_less_wake_time);
>  	silence_period =3D get_silence_period_symbols(crtc_state);
>=20=20
> -	lfps_half_cycle =3D get_lfps_half_cycle_clocks(crtc_state);
> +	lfps_half_cycle =3D get_lfps_half_cycle_clocks(intel_dp, crtc_state);
>=20=20
>  	if (aux_less_wake_lines > ALPM_CTL_AUX_LESS_WAKE_TIME_MASK ||
>  	    silence_period > PORT_ALPM_CTL_SILENCE_PERIOD_MASK ||

--=20
Jani Nikula, Intel
