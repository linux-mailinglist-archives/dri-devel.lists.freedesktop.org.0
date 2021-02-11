Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE3318A7E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 13:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03296EE15;
	Thu, 11 Feb 2021 12:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBAD6EE14;
 Thu, 11 Feb 2021 12:29:50 +0000 (UTC)
IronPort-SDR: /+3PBbrvnGaMwmNqqAEcyvB6EHbVnWcw8xggE0LwjKzBwzNPXb0nDNDKpBctnRtohks7JcvbBt
 QsTcJ+NS+Sqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="243723833"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="243723833"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 04:29:44 -0800
IronPort-SDR: H7yP2PQM+TPM+jXUHDzPz3WlLEenm2FLducWiHjmKtVmp6v6Z0BxoGILePPq/H+xK0rCZr8NZ+
 HxGyZJTO8tvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="437098951"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 11 Feb 2021 04:29:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Feb 2021 14:29:39 +0200
Date: Thu, 11 Feb 2021 14:29:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 18/18] drm/i915/display13: Enabling dithering
 after the CC1 pipe
Message-ID: <YCUjM1QwEexccF2x@intel.com>
References: <20210128192413.1715802-1-matthew.d.roper@intel.com>
 <20210128192413.1715802-19-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128192413.1715802-19-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Nischal Varide <nischal.varide@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 11:24:13AM -0800, Matt Roper wrote:
> From: Nischal Varide <nischal.varide@intel.com>
> =

> If the panel is 12bpc then Dithering is not enabled in the Legacy
> dithering block , instead its Enabled after the C1 CC1 pipe post
> color space conversion.For a 6bpc pannel Dithering is enabled in
> Legacy block.

Dithering is probably going to require a whole uapi bikeshed.
Not sure we can just enable it unilaterally.

Ccing dri-devel, and Mario who had issues with dithering in the
past...

> =

> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Nischal Varide <nischal.varide@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c   | 16 ++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.c |  9 ++++++++-
>  drivers/gpu/drm/i915/i915_reg.h              |  3 ++-
>  3 files changed, 26 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm=
/i915/display/intel_color.c
> index ff7dcb7088bf..9a0572bbc5db 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -1604,6 +1604,20 @@ static u32 icl_csc_mode(const struct intel_crtc_st=
ate *crtc_state)
>  	return csc_mode;
>  }
>  =

> +static u32 dither_after_cc1_12bpc(const struct intel_crtc_state *crtc_st=
ate)
> +{
> +	u32 gamma_mode =3D crtc_state->gamma_mode;
> +	struct drm_i915_private *i915 =3D to_i915(crtc_state->uapi.crtc->dev);
> +
> +	if (HAS_DISPLAY13(i915)) {
> +		if (!crtc_state->dither_force_disable &&
> +		    (crtc_state->pipe_bpp =3D=3D 36))
> +			gamma_mode |=3D GAMMA_MODE_DITHER_AFTER_CC1;
> +	}
> +
> +	return gamma_mode;
> +}
> +
>  static int icl_color_check(struct intel_crtc_state *crtc_state)
>  {
>  	int ret;
> @@ -1614,6 +1628,8 @@ static int icl_color_check(struct intel_crtc_state =
*crtc_state)
>  =

>  	crtc_state->gamma_mode =3D icl_gamma_mode(crtc_state);
>  =

> +	crtc_state->gamma_mode =3D dither_after_cc1_12bpc(crtc_state);
> +
>  	crtc_state->csc_mode =3D icl_csc_mode(crtc_state);
>  =

>  	crtc_state->preload_luts =3D intel_can_preload_luts(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 4dc4b1be0809..e3dbcd956fc6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8098,9 +8098,15 @@ static void bdw_set_pipemisc(const struct intel_cr=
tc_state *crtc_state)
>  		break;
>  	}
>  =

> -	if (crtc_state->dither)
> +	/*
> +	 * If 12bpc panel then, Enables dithering after the CC1 pipe
> +	 * post color space conversion and not here
> +	 */
> +
> +	if (crtc_state->dither && (crtc_state->pipe_bpp !=3D 36))
>  		val |=3D PIPEMISC_DITHER_ENABLE | PIPEMISC_DITHER_TYPE_SP;
>  =

> +
>  	if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420 ||
>  	    crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444)
>  		val |=3D PIPEMISC_OUTPUT_COLORSPACE_YUV;
> @@ -10760,6 +10766,7 @@ intel_modeset_pipe_config(struct intel_atomic_sta=
te *state,
>  	 */
>  	pipe_config->dither =3D (pipe_config->pipe_bpp =3D=3D 6*3) &&
>  		!pipe_config->dither_force_disable;
> +
>  	drm_dbg_kms(&i915->drm,
>  		    "hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
>  		    base_bpp, pipe_config->pipe_bpp, pipe_config->dither);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 128b835c0adb..27f25214a839 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6132,7 +6132,7 @@ enum {
>  #define   PIPEMISC_DITHER_8_BPC		(0 << 5)
>  #define   PIPEMISC_DITHER_10_BPC	(1 << 5)
>  #define   PIPEMISC_DITHER_6_BPC		(2 << 5)
> -#define   PIPEMISC_DITHER_12_BPC	(3 << 5)
> +#define   PIPEMISC_DITHER_12_BPC	(4 << 5)
>  #define   PIPEMISC_DITHER_ENABLE	(1 << 4)
>  #define   PIPEMISC_DITHER_TYPE_MASK	(3 << 2)
>  #define   PIPEMISC_DITHER_TYPE_SP	(0 << 2)
> @@ -7668,6 +7668,7 @@ enum {
>  #define  GAMMA_MODE_MODE_12BIT	(2 << 0)
>  #define  GAMMA_MODE_MODE_SPLIT	(3 << 0) /* ivb-bdw */
>  #define  GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED	(3 << 0) /* icl + */
> +#define  GAMMA_MODE_DITHER_AFTER_CC1 (1 << 26)
>  =

>  /* DMC/CSR */
>  #define CSR_PROGRAM(i)		_MMIO(0x80000 + (i) * 4)
> -- =

> 2.25.4
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
