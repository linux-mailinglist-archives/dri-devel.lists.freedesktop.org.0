Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B2373ADF
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 14:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1336E125;
	Wed,  5 May 2021 12:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D516E125;
 Wed,  5 May 2021 12:15:28 +0000 (UTC)
IronPort-SDR: zXb0ZIAj/nrK07PZgcwCL4XhId0Hcf4htjDhMWIxNiV/WDMMJM/cLRzxkkCAbj6QXu+qJgIb0m
 bN+0DlvUKUWg==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="219046835"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="219046835"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 05:15:28 -0700
IronPort-SDR: 2qvZIvm1j2cVwQyuy1ZCdITMWsNBOwR7bSL9a4ha/ewAeUbw8ExIKx4bMshD1mQPdoT6385dwk
 L+WLN91syKvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="463855330"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 05 May 2021 05:15:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 May 2021 15:15:24 +0300
Date: Wed, 5 May 2021 15:15:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 3/4] Restructure output format computation for better
 expandability
Message-ID: <YJKMXC8Wd+T34rNg@intel.com>
References: <20210503182148.851790-1-wse@tuxedocomputers.com>
 <20210503182148.851790-4-wse@tuxedocomputers.com>
 <YJEZzhhQzmYxi8Gp@intel.com>
 <41aca960-7595-8fed-228c-3b9347c64dc6@tuxedocomputers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41aca960-7595-8fed-228c-3b9347c64dc6@tuxedocomputers.com>
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

On Wed, May 05, 2021 at 11:54:35AM +0200, Werner Sembach wrote:
> Am 04.05.21 um 11:54 schrieb Ville Syrj=E4l=E4:
> =

> > On Mon, May 03, 2021 at 08:21:47PM +0200, Werner Sembach wrote:
> >> Couples the decission between RGB and YCbCr420 mode and the check if t=
he port
> >> clock can archive the required frequency. Other checks and configurati=
on steps
> >> that where previously done in between can also be done before or after.
> >>
> >> This allows for are cleaner implementation of retrying different color
> >> encodings.
> >>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >> ---
> >>
> >> >From 57e42ec6e34ac32da29eb7bc3c691cbeb2534396 Mon Sep 17 00:00:00 2001
> >> From: Werner Sembach <wse@tuxedocomputers.com>
> >> Date: Mon, 3 May 2021 15:30:40 +0200
> >> Subject: [PATCH 3/4] Restructure output format computation for better
> >>  expandability
> >>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_hdmi.c | 57 +++++++++++------------
> >>  1 file changed, 26 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/d=
rm/i915/display/intel_hdmi.c
> >> index ce165ef28e88..e2553ac6fd13 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> >> @@ -1999,29 +1999,6 @@ static bool hdmi_deep_color_possible(const stru=
ct intel_crtc_state *crtc_state,
> >>  					      INTEL_OUTPUT_FORMAT_YCBCR420);
> >>  }
> >>  =

> >> -static int
> >> -intel_hdmi_ycbcr420_config(struct intel_crtc_state *crtc_state,
> >> -			   const struct drm_connector_state *conn_state)
> >> -{
> >> -	struct drm_connector *connector =3D conn_state->connector;
> >> -	struct drm_i915_private *i915 =3D to_i915(connector->dev);
> >> -	const struct drm_display_mode *adjusted_mode =3D
> >> -		&crtc_state->hw.adjusted_mode;
> >> -
> >> -	if (!drm_mode_is_420_only(&connector->display_info, adjusted_mode))
> >> -		return 0;
> >> -
> >> -	if (!connector->ycbcr_420_allowed) {
> >> -		drm_err(&i915->drm,
> >> -			"Platform doesn't support YCBCR420 output\n");
> >> -		return -EINVAL;
> >> -	}
> >> -
> >> -	crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;
> >> -
> >> -	return intel_pch_panel_fitting(crtc_state, conn_state);
> >> -}
> >> -
> >>  static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
> >>  				  struct intel_crtc_state *crtc_state,
> >>  				  int clock)
> >> @@ -2128,6 +2105,24 @@ static bool intel_hdmi_has_audio(struct intel_e=
ncoder *encoder,
> >>  		return intel_conn_state->force_audio =3D=3D HDMI_AUDIO_ON;
> >>  }
> >>  =

> >> +int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
> >> +				     struct intel_crtc_state *crtc_state,
> >> +				     const struct drm_connector_state *conn_state)
> >> +{
> >> +	const struct drm_connector *connector =3D conn_state->connector;
> >> +	const struct drm_display_mode *adjusted_mode =3D &crtc_state->hw.adj=
usted_mode;
> >> +	int ret;
> >> +
> >> +	if (connector->ycbcr_420_allowed && drm_mode_is_420_only(&connector-=
>display_info, adjusted_mode))
> >> +		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;
> >> +	else
> >> +		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_RGB;
> > Slight change in behaviour here since we used to reject 420_only modes
> > if ycbcr_420_allowed wasn't set. But I think this should be OK, and in
> > fact I believe the DP counterpart code always used an RGB fallback
> > rather than failing. So this lines up better with that.
> =

> That was actually an oversight on my side and not intended. Does a RGB fa=
llback make sense?
> =

> Now that I think of it get to 2 scenarios:
> =

> - The screen is really 420_only, which causes a silent fail and a black s=
creen I guess? Where before at least a log message was written.
> =

> - The screen falsely reports as 420_only and using RGB regardless makes i=
t magically work
> =

> I think at least warning should be printed to the logs. Something along t=
he lines of: "Display reports as 420 only, but port does not support 420, t=
ry forcing RGB, but this is likely to fail."

I would just put it into the "user has decided to override the mode and
gets to keep both pieces if it breaks". Typical users would not hit that
since they will only use modes reported by the connector as supported.

So I think the RGB fallback is totally in line with existing behaviour
of the driver. We have other cases where we just ignore the reported
limits of the display if the user overrides the mode manually.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
