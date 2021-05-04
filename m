Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E91372879
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 12:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5DB6E1AA;
	Tue,  4 May 2021 10:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B8B6E1AA;
 Tue,  4 May 2021 10:08:50 +0000 (UTC)
IronPort-SDR: tEo2heKSAUKfsyJR/HLvscR+xbWonS+cWwrNFSNdZIv+ncS/diwU2hB3Kg6BJyPWv67FIuRciK
 WFEl6xWYCAKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="259227823"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="259227823"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 03:08:48 -0700
IronPort-SDR: FUqnMRWgvRXRQYs3FzsQuFrazFO/ZVAWQcVuQ+ry4ms1nCReGwYNKDEQ6ogxTpmj6tFlnlQiUN
 4yZ8JKi3VSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="530955511"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 04 May 2021 03:08:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 May 2021 13:08:45 +0300
Date: Tue, 4 May 2021 13:08:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 4/4] Use YCbCr420 as fallback when RGB fails
Message-ID: <YJEdLbE5EOQv+Nib@intel.com>
References: <20210503182148.851790-1-wse@tuxedocomputers.com>
 <20210503182148.851790-5-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503182148.851790-5-wse@tuxedocomputers.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 08:21:48PM +0200, Werner Sembach wrote:
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

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> =

> >From 4ea0c8839b47e846d46c613e38af475231994f0f Mon Sep 17 00:00:00 2001
> From: Werner Sembach <wse@tuxedocomputers.com>
> Date: Mon, 3 May 2021 16:23:17 +0200
> Subject: [PATCH 4/4] Use YCbCr420 as fallback when RGB fails
> =

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index e2553ac6fd13..20c800f2ed60 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1913,7 +1913,7 @@ intel_hdmi_mode_valid(struct drm_connector *connect=
or,
>  		clock *=3D 2;
>  	}
>  =

> -	if (connector->ycbcr_420_allowed && drm_mode_is_420_only(&connector->di=
splay_info, mode))
> +	if (connector->ycbcr_420_allowed && drm_mode_is_420(&connector->display=
_info, mode))
>  		clock /=3D 2;

This is too early. We want to keep clock as is for checking whether RGB
output is possible with 420_also modes.

So the structure you had in your original patch was the correct way to
go about it. Which I think was something along the lines of:

if (420_only)
	clock /=3D 2;

status =3D intel_hdmi_mode_clock_valid()
if (status !=3D OK) {
	if (420_only || !420_also || !420_allowed)
		return status;
	=

	clock /=3D 2;
	status =3D intel_hdmi_mode_clock_valid()
}


>  =

>  	status =3D intel_hdmi_mode_clock_valid(hdmi, clock, has_hdmi_sink);
> @@ -2119,6 +2119,14 @@ int intel_hdmi_compute_output_format(struct intel_=
encoder *encoder,
>  		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_RGB;
>  =

>  	ret =3D intel_hdmi_compute_clock(encoder, crtc_state);
> +	if (ret) {
> +		if (crtc_state->output_format !=3D INTEL_OUTPUT_FORMAT_YCBCR420 ||
> +				connector->ycbcr_420_allowed ||
> +				drm_mode_is_420_also(&connector->display_info, adjusted_mode)) {

That needs s/||/&&/ or we flip the conditions around to:

if (ret) {
	if (output_format =3D=3D 420 || !420_allowed || !420_also)
		return ret;

	output_format =3D 420;
	...
}

which would have the benefit of avoiding the extra indent level.

> +			crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;
> +			ret =3D intel_hdmi_compute_clock(encoder, crtc_state);
> +		}
> +	}
>  =

>  	return ret;
>  }
> -- =

> 2.25.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
