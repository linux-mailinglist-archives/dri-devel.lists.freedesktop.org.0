Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E315536FEFE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 18:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FEC6E4D0;
	Fri, 30 Apr 2021 16:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9B86E4D0;
 Fri, 30 Apr 2021 16:56:37 +0000 (UTC)
IronPort-SDR: hfE2OMOLQtcBGUcQRhDRQb3O6b4UI0956iqcDl+hPOyhLseyR4kOBcIhhiX0DjAOxHdOH/flQ8
 Zyd9zKI2XEoQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="258598955"
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; d="scan'208";a="258598955"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 09:56:15 -0700
IronPort-SDR: YUGVD6OuFnLWQXxHFjFki+kLn5GBZg/daEAUdttm24KDaa2MLmef0QWSh5qvAkpdxQmaD3sWo1
 qtew7sjj8syw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; d="scan'208";a="426517262"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 30 Apr 2021 09:56:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Apr 2021 19:56:11 +0300
Date: Fri, 30 Apr 2021 19:56:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH] drm/i915/display Try YCbCr420 color when RGB fails
Message-ID: <YIw2q/aibOplo7b+@intel.com>
References: <20210429120553.7823-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429120553.7823-1-wse@tuxedocomputers.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 02:05:53PM +0200, Werner Sembach wrote:
> When encoder validation of a display mode fails, retry with less bandwidth
> heavy YCbCr420 color mode, if available. This enables some HDMI 1.4 setups
> to support 4k60Hz output, which previously failed silently.
> =

> AMDGPU had nearly the exact same issue. This problem description is
> therefore copied from my commit message of the AMDGPU patch.
> =

> On some setups, while the monitor and the gpu support display modes with
> pixel clocks of up to 600MHz, the link encoder might not. This prevents
> YCbCr444 and RGB encoding for 4k60Hz, but YCbCr420 encoding might still be
> possible. However, which color mode is used is decided before the link
> encoder capabilities are checked. This patch fixes the problem by retrying
> to find a display mode with YCbCr420 enforced and using it, if it is
> valid.
> =

> I'm not entierly sure if the second
> "if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv))" check in
> intel_hdmi_compute_config(...) after forcing ycbcr420 is necessary. I
> included it to better be safe then sorry.
> =

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: <stable@vger.kernel.org>
> ---
> Rebased from 5.12 to drm-tip and resend to resolve merge conflict.
> =

> >From 876c1c8d970ff2a411ee8d08651bd4edbe9ecb3d Mon Sep 17 00:00:00 2001
> From: Werner Sembach <wse@tuxedocomputers.com>
> Date: Thu, 29 Apr 2021 13:59:30 +0200
> Subject: [PATCH] Retry using YCbCr420 encoding if clock setup for RGB fai=
ls
> =

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 80 +++++++++++++++++------
>  1 file changed, 60 insertions(+), 20 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 46de56af33db..c9b5a7d7f9c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1861,6 +1861,30 @@ static int intel_hdmi_port_clock(int clock, int bp=
c)
>  	return clock * bpc / 8;
>  }
>  =

> +static enum drm_mode_status
> +intel_hdmi_check_bpc(struct intel_hdmi *hdmi, int clock, bool has_hdmi_s=
ink, struct drm_i915_private *dev_priv)

Don't pass dev_priv. It can be extracted from the intel_hdmi.

The name of the function isn't really sitting super well with me.
I guess I'd just call it something like intel_hdmi_mode_clock_valid().

We should also split this big patch up into smaller parts. Just this
mechanical extraction of this function without any functional changes
could be a nice first patch in the series.

> +{
> +	enum drm_mode_status status;
> +
> +	/* check if we can do 8bpc */
> +	status =3D hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 8),
> +				       true, has_hdmi_sink);
> +
> +	if (has_hdmi_sink) {
> +		/* if we can't do 8bpc we may still be able to do 12bpc */
> +		if (status !=3D MODE_OK && !HAS_GMCH(dev_priv))
> +			status =3D hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 1=
2),
> +						       true, has_hdmi_sink);
> +
> +		/* if we can't do 8,12bpc we may still be able to do 10bpc */
> +		if (status !=3D MODE_OK && DISPLAY_VER(dev_priv) >=3D 11)
> +			status =3D hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 1=
0),
> +						       true, has_hdmi_sink);
> +	}
> +
> +	return status;
> +}
> +
>  static enum drm_mode_status
>  intel_hdmi_mode_valid(struct drm_connector *connector,
>  		      struct drm_display_mode *mode)
> @@ -1891,23 +1915,18 @@ intel_hdmi_mode_valid(struct drm_connector *conne=
ctor,
>  	if (drm_mode_is_420_only(&connector->display_info, mode))
>  		clock /=3D 2;
>  =

> -	/* check if we can do 8bpc */
> -	status =3D hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 8),
> -				       true, has_hdmi_sink);
> +	status =3D intel_hdmi_check_bpc(hdmi, clock, has_hdmi_sink, dev_priv);
>  =

> -	if (has_hdmi_sink) {
> -		/* if we can't do 8bpc we may still be able to do 12bpc */
> -		if (status !=3D MODE_OK && !HAS_GMCH(dev_priv))
> -			status =3D hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 1=
2),
> -						       true, has_hdmi_sink);
> +	if (status !=3D MODE_OK) {
> +		if (drm_mode_is_420_also(&connector->display_info, mode)) {

We also need a connector->ycbcr_420_allowed check here.

> +			/* if we can't do full color resolution we may still be able to do re=
duced color resolution */
> +			clock /=3D 2;
>  =

> -		/* if we can't do 8,12bpc we may still be able to do 10bpc */
> -		if (status !=3D MODE_OK && DISPLAY_VER(dev_priv) >=3D 11)
> -			status =3D hdmi_port_clock_valid(hdmi, intel_hdmi_port_clock(clock, 1=
0),
> -						       true, has_hdmi_sink);
> +			status =3D intel_hdmi_check_bpc(hdmi, clock, has_hdmi_sink, dev_priv);
> +		}
> +		if (status !=3D MODE_OK)
> +			return status;
>  	}
> -	if (status !=3D MODE_OK)
> -		return status;
>  =

>  	return intel_mode_valid_max_plane_size(dev_priv, mode, false);
>  }
> @@ -1990,14 +2009,17 @@ static bool hdmi_deep_color_possible(const struct=
 intel_crtc_state *crtc_state,
>  =

>  static int
>  intel_hdmi_ycbcr420_config(struct intel_crtc_state *crtc_state,
> -			   const struct drm_connector_state *conn_state)
> +			   const struct drm_connector_state *conn_state,
> +			   const bool force_ycbcr420)
>  {
>  	struct drm_connector *connector =3D conn_state->connector;
>  	struct drm_i915_private *i915 =3D to_i915(connector->dev);
>  	const struct drm_display_mode *adjusted_mode =3D
>  		&crtc_state->hw.adjusted_mode;
>  =

> -	if (!drm_mode_is_420_only(&connector->display_info, adjusted_mode))
> +	if (!(drm_mode_is_420_only(&connector->display_info, adjusted_mode) ||
> +			(force_ycbcr420 &&
> +			drm_mode_is_420_also(&connector->display_info, adjusted_mode))))
>  		return 0;
>  =


This function I think we just want to throw out and roll something
a bit better.

Something like this I believe should work nicely:

intel_hdmi_compute_output_format()
{
	if (drm_mode_is_420_only())
		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;
	else
		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_RGB;

	ret =3D intel_hdmi_compute_clock();
	if (ret) {
		if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
			return ret;

		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;

		ret =3D intel_hdmi_compute_clock()
		if (ret)
			return ret;
	}

	return 0;
}

assuming we make intel_hdmi_compute_clock() check whether 420 output
is actually supported.

Could roll a small helper for that. Something along these lines perhaps:
static bool intel_hdmi_ycbcr_420_supported()
{
	return connector->ycbcr_420_allowed &&
	       (drm_mode_is_420_only() || drm_mode_is_420_also());
}

The intel_pch_panel_fitting() call should probably just be hoisted
into intel_hdmi_compute_config() after we've called the new
intel_hdmi_compute_output_format().

I think a three patch series is probably what we want for this:
patch 1: extract intel_hdmi_mode_clock_valid() without 420_also handling
patch 2: introduce intel_hdmi_compute_output_format() without 420_also hand=
ling
patch 3: drop in the 420_also handling everywhere

That way if there's any regression due to the 420_also stuff at least
we won't have to revert the whole thing, and can then more easily work
on fixing whatever needs fixing.

>  	if (!connector->ycbcr_420_allowed) {
> @@ -2126,7 +2148,7 @@ int intel_hdmi_compute_config(struct intel_encoder =
*encoder,
>  	struct drm_display_mode *adjusted_mode =3D &pipe_config->hw.adjusted_mo=
de;
>  	struct drm_connector *connector =3D conn_state->connector;
>  	struct drm_scdc *scdc =3D &connector->display_info.hdmi.scdc;
> -	int ret;
> +	int ret, ret_saved;
>  =

>  	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN)
>  		return -EINVAL;
> @@ -2141,7 +2163,7 @@ int intel_hdmi_compute_config(struct intel_encoder =
*encoder,
>  	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		pipe_config->pixel_multiplier =3D 2;
>  =

> -	ret =3D intel_hdmi_ycbcr420_config(pipe_config, conn_state);
> +	ret =3D intel_hdmi_ycbcr420_config(pipe_config, conn_state, false);
>  	if (ret)
>  		return ret;
>  =

> @@ -2155,8 +2177,26 @@ int intel_hdmi_compute_config(struct intel_encoder=
 *encoder,
>  		intel_hdmi_has_audio(encoder, pipe_config, conn_state);
>  =

>  	ret =3D intel_hdmi_compute_clock(encoder, pipe_config);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		ret_saved =3D ret;
> +
> +		ret =3D intel_hdmi_ycbcr420_config(pipe_config, conn_state, true);
> +		if (ret)
> +			return ret;
> +
> +		if (pipe_config->output_format !=3D INTEL_OUTPUT_FORMAT_YCBCR420)
> +			return ret_saved;
> +
> +		pipe_config->limited_color_range =3D
> +			intel_hdmi_limited_color_range(pipe_config, conn_state);
> +
> +		if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv))
> +			pipe_config->has_pch_encoder =3D true;
> +
> +		ret =3D intel_hdmi_compute_clock(encoder, pipe_config);
> +		if (ret)
> +			return ret;
> +	}
>  =

>  	if (conn_state->picture_aspect_ratio)
>  		adjusted_mode->picture_aspect_ratio =3D
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
