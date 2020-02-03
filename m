Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE715094D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CE76EC20;
	Mon,  3 Feb 2020 15:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B886EC20;
 Mon,  3 Feb 2020 15:12:40 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="310747262"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 03 Feb 2020 07:12:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:12:36 +0200
Date: Mon, 3 Feb 2020 17:12:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/dp: Add checking of YCBCR420 Pass-through
 to YCBCR420 outputs.
Message-ID: <20200203151236.GG13686@intel.com>
References: <20200203120421.113744-1-gwan-gyeong.mun@intel.com>
 <20200203120421.113744-2-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203120421.113744-2-gwan-gyeong.mun@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 02:04:21PM +0200, Gwan-gyeong Mun wrote:
> When a DP downstream uses a DP to HDMI active converter, the active
> converter needs to support YCbCr420 Pass-through to enable DP YCbCr 4:2:0
> outputs.
> =

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 26 +++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index f4dede6253f8..824ed8096426 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2298,6 +2298,22 @@ intel_dp_compute_link_config(struct intel_encoder =
*encoder,
>  	return 0;
>  }
>  =

> +static bool
> +intel_dp_downstream_is_hdmi_detailed_cap_info(struct intel_dp *intel_dp)
> +{
> +	int type =3D intel_dp->downstream_ports[0] & DP_DS_PORT_TYPE_MASK;
> +	bool detailed_cap_info =3D intel_dp->dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> +				 DP_DETAILED_CAP_INFO_AVAILABLE;
> +
> +	return type =3D=3D DP_DS_PORT_TYPE_HDMI && detailed_cap_info;

This looks a bit incomplete, and should really be in the core. I have a
bunch of stuff for DFPs sitting in a branch. I'll just post the whole
thing...

> +}
> +
> +static bool
> +intel_dp_downstream_supports_ycbcr_420_passthru(struct intel_dp *intel_d=
p)
> +{
> +	return intel_dp->downstream_ports[3] & DP_DS_YCBCR420_PASSTHRU_SUPPORT;
> +}
> +
>  static int
>  intel_dp_ycbcr420_config(struct intel_dp *intel_dp,
>  			 struct drm_connector *connector,
> @@ -2314,6 +2330,16 @@ intel_dp_ycbcr420_config(struct intel_dp *intel_dp,
>  	    !connector->ycbcr_420_allowed)
>  		return 0;
>  =

> +	/*
> +	 * When a DP downstream uses a DP to HDMI active converter,
> +	 * the active converter needs to support YCbCr420 Pass-through.
> +	 */
> +	if (drm_dp_is_branch(intel_dp->dpcd)) {
> +		if (intel_dp_downstream_is_hdmi_detailed_cap_info(intel_dp) &&
> +		    !intel_dp_downstream_supports_ycbcr_420_passthru(intel_dp))
> +			return 0;
> +	}
> +
>  	crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;
>  =

>  	/* YCBCR 420 output conversion needs a scaler */
> -- =

> 2.24.1
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
