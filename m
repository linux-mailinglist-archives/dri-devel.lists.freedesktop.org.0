Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D3D4DAC33
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 09:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41B510E7B3;
	Wed, 16 Mar 2022 08:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F29510E7B3;
 Wed, 16 Mar 2022 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647417880; x=1678953880;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ud3ZGW99NB2N9YtEXOyV+ImHcKiBaY2G/sDAEK31UH8=;
 b=T63nVg9YbghWWkRa6TTqNPN1w8vK7qB1k6yGzr8p0rmrNXDI9kw9lBaC
 +ILGU+T3l22Xb2YKm5yUhtDZ2dgUOCnO0f1R8tunY10aAfhvEeRy2klTX
 5c5t5eqJe/2wFLCb3IfPvI4OHtDGcZL6BNuDci0ymSTxpMR/HNZRfz2t1
 QU9TEcVu6ekH8NxjuPZitSXp1BBGzN80rIjF4Cou4/Ajf4C1eu4/UzBYg
 noTqh4ATSDyjxPteCnkFJTVw2omXzokiTyZZP9r5czKOJF0PCltERQsLf
 ZiLa0vZxNZ8aCrE3QdLKtW8qDkZl4fZX7+fM8qz9YvrnZ26C18Xig8hEn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319736929"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="319736929"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 01:04:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="557333296"
Received: from jgarrosx-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.34.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 01:04:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 19/22] drm/i915: Use drm_mode_copy()
In-Reply-To: <20220218100403.7028-20-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-20-ville.syrjala@linux.intel.com>
Date: Wed, 16 Mar 2022 10:04:34 +0200
Message-ID: <871qz2pbl9.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
>
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
>
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
>
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
>
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode =3D E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
>
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode =3D E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
>
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 74c5a99ab276..661e36435793 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5506,8 +5506,10 @@ intel_crtc_copy_uapi_to_hw_state_modeset(struct in=
tel_atomic_state *state,
>=20=20
>  	crtc_state->hw.enable =3D crtc_state->uapi.enable;
>  	crtc_state->hw.active =3D crtc_state->uapi.active;
> -	crtc_state->hw.mode =3D crtc_state->uapi.mode;
> -	crtc_state->hw.adjusted_mode =3D crtc_state->uapi.adjusted_mode;
> +	drm_mode_copy(&crtc_state->hw.mode,
> +		      &crtc_state->uapi.mode);
> +	drm_mode_copy(&crtc_state->hw.adjusted_mode,
> +		      &crtc_state->uapi.adjusted_mode);
>  	crtc_state->hw.scaling_filter =3D crtc_state->uapi.scaling_filter;
>=20=20
>  	intel_crtc_copy_uapi_to_hw_state_nomodeset(state, crtc);
> @@ -5584,9 +5586,12 @@ copy_bigjoiner_crtc_state_modeset(struct intel_ato=
mic_state *state,
>  	memset(&slave_crtc_state->hw, 0, sizeof(slave_crtc_state->hw));
>  	slave_crtc_state->hw.enable =3D master_crtc_state->hw.enable;
>  	slave_crtc_state->hw.active =3D master_crtc_state->hw.active;
> -	slave_crtc_state->hw.mode =3D master_crtc_state->hw.mode;
> -	slave_crtc_state->hw.pipe_mode =3D master_crtc_state->hw.pipe_mode;
> -	slave_crtc_state->hw.adjusted_mode =3D master_crtc_state->hw.adjusted_m=
ode;
> +	drm_mode_copy(&slave_crtc_state->hw.mode,
> +		      &master_crtc_state->hw.mode);
> +	drm_mode_copy(&slave_crtc_state->hw.pipe_mode,
> +		      &master_crtc_state->hw.pipe_mode);
> +	drm_mode_copy(&slave_crtc_state->hw.adjusted_mode,
> +		      &master_crtc_state->hw.adjusted_mode);
>  	slave_crtc_state->hw.scaling_filter =3D master_crtc_state->hw.scaling_f=
ilter;
>=20=20
>  	copy_bigjoiner_crtc_state_nomodeset(state, slave_crtc);

--=20
Jani Nikula, Intel Open Source Graphics Center
