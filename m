Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA6C00391
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8B310E383;
	Thu, 23 Oct 2025 09:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dhbv4mBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4667310E067;
 Thu, 23 Oct 2025 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761211337; x=1792747337;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9V5ROWPr+FfUC8q31sjMllDis5EHGK2R6/fRx/RB9zE=;
 b=Dhbv4mBErwWwmZ261m1fm2B3WNjP76SoXquy+tNkKn6BT+i9x++DoHDT
 dlrG/3AmvouesIUXbarWRJJBpGIkIvFl5/j0IzEYbfRjDUGre0aIEJL3d
 8AZxVdONH2ulwhs7ZKQVEQUpKh9PdnrlWsI/S7X2b878n2Op+R7xwWhsd
 JcMFEu9PiGdXh6qBhtdg/8tnnPDoMAo1jl1FzI6sbl4JrjJL7L0GypCaF
 JvgoS6hEQiZDjD++9nPqGTsJWn+mAScGyyaQv3tq9KEt75uY1NRdHxnA/
 FK1qcejOgRBbFWrh5Ox3qekCXNG+zosjUsBHcK3zZWHqJyw0e8YXGIi4a w==;
X-CSE-ConnectionGUID: VR7eSEuOTHicoj2lrdbB5A==
X-CSE-MsgGUID: +EIKjKmnRRqV132bAw1SDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73666897"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="73666897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:22:17 -0700
X-CSE-ConnectionGUID: 0F8T5DUQTQKV/1Y0R1JQew==
X-CSE-MsgGUID: tX2PSKcxSM2iLwwsKSArAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183810244"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:22:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>
Subject: Re: [PATCH 3/8] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
In-Reply-To: <20251023084147.572535-4-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251023084147.572535-1-animesh.manna@intel.com>
 <20251023084147.572535-4-animesh.manna@intel.com>
Date: Thu, 23 Oct 2025 12:22:11 +0300
Message-ID: <310f857615e378179fe25a6f39d62cfae8ca8fc9@intel.com>
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
> Add a separate alpm_is_possible() which will check for both edp and dp.

AFAICT you're not ready to actually do ALPM for non-eDP at this point. I
presume things will go bonkers if you run this commit.

You can add the helper, but keep the functionality unchanged until
you've actually implemented ALPM for DP.

BR,
Jani.

>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 16 +++++++++++++---
>  drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 6372f533f65b..973791f8956c 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -41,6 +41,16 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *inte=
l_dp,
>  		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
>  }
>=20=20
> +bool intel_alpm_is_possible(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +
> +	return (DISPLAY_VER(display) >=3D 12 && intel_dp->alpm_dpcd) ||
> +	       (DISPLAY_VER(display) >=3D 35 &&
> +		intel_dp->lttpr_common_caps[DP_LTTPR_ALPM_CAPABILITIES -
> +					    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV]);
> +}
> +
>  void intel_alpm_init(struct intel_dp *intel_dp)
>  {
>  	u8 dpcd;
> @@ -265,7 +275,7 @@ void intel_alpm_lobf_compute_config(struct intel_dp *=
intel_dp,
>  	if (intel_dp->alpm.sink_alpm_error)
>  		return;
>=20=20
> -	if (!intel_dp_is_edp(intel_dp))
> +	if (!intel_alpm_is_possible(intel_dp))
>  		return;
>=20=20
>  	if (DISPLAY_VER(display) < 20)
> @@ -416,7 +426,7 @@ void intel_alpm_pre_plane_update(struct intel_atomic_=
state *state,
>=20=20
>  		intel_dp =3D enc_to_intel_dp(encoder);
>=20=20
> -		if (!intel_dp_is_edp(intel_dp))
> +		if (!intel_alpm_is_possible(intel_dp))
>  			continue;
>=20=20
>  		if (old_crtc_state->has_lobf) {
> @@ -468,7 +478,7 @@ void intel_alpm_post_plane_update(struct intel_atomic=
_state *state,
>=20=20
>  		intel_dp =3D enc_to_intel_dp(encoder);
>=20=20
> -		if (intel_dp_is_edp(intel_dp)) {
> +		if (intel_alpm_is_possible(intel_dp)) {
>  			intel_alpm_enable_sink(intel_dp, crtc_state);
>  			intel_alpm_configure(intel_dp, crtc_state);
>  		}
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/=
i915/display/intel_alpm.h
> index 53599b464dea..0c9972faa2e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -15,6 +15,7 @@ struct intel_connector;
>  struct intel_atomic_state;
>  struct intel_crtc;
>=20=20
> +bool intel_alpm_is_possible(struct intel_dp *intel_dp);
>  void intel_alpm_init(struct intel_dp *intel_dp);
>  bool intel_alpm_compute_params(struct intel_dp *intel_dp,
>  			       struct intel_crtc_state *crtc_state);

--=20
Jani Nikula, Intel
