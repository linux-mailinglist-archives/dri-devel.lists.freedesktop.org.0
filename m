Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DFE373CD4
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 15:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FD36E4B0;
	Wed,  5 May 2021 13:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC9E6E4AB;
 Wed,  5 May 2021 13:59:54 +0000 (UTC)
IronPort-SDR: 7eeDpfHVad8pAaB+Fkq7iRVIq8I+O72HYkbePCZvrqdGVsfsVvaKeRSBZCzQxRTaj03q4rIazQ
 yL/WKfv9bFTg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="198296024"
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; d="scan'208";a="198296024"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 06:59:53 -0700
IronPort-SDR: xCB81/HjslhprMl8z9lYQwcwoqbwBBS4CnDdOOTudCUIWHc76Ib8bSjA6NVo0thnhr1Q5v1LRO
 JPZjO4m4/M0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; d="scan'208";a="429864036"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 05 May 2021 06:59:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 May 2021 16:59:49 +0300
Date: Wed, 5 May 2021 16:59:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 3/4] Restructure output format computation for better
 expandability
Message-ID: <YJKk1QuhXdmneyOq@intel.com>
References: <20210503182148.851790-1-wse@tuxedocomputers.com>
 <20210503182148.851790-4-wse@tuxedocomputers.com>
 <YJEZzhhQzmYxi8Gp@intel.com>
 <41aca960-7595-8fed-228c-3b9347c64dc6@tuxedocomputers.com>
 <YJKMXC8Wd+T34rNg@intel.com>
 <1820519f-b84c-e0cf-0851-d520fd379eaa@tuxedocomputers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1820519f-b84c-e0cf-0851-d520fd379eaa@tuxedocomputers.com>
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

On Wed, May 05, 2021 at 03:02:53PM +0200, Werner Sembach wrote:
> =

> Am 05.05.21 um 14:15 schrieb Ville Syrj=E4l=E4:
> > On Wed, May 05, 2021 at 11:54:35AM +0200, Werner Sembach wrote:
> >> Am 04.05.21 um 11:54 schrieb Ville Syrj=E4l=E4:
> >>
> >>> On Mon, May 03, 2021 at 08:21:47PM +0200, Werner Sembach wrote:
> >>>> Couples the decission between RGB and YCbCr420 mode and the check if=
 the port
> >>>> clock can archive the required frequency. Other checks and configura=
tion steps
> >>>> that where previously done in between can also be done before or aft=
er.
> >>>>
> >>>> This allows for are cleaner implementation of retrying different col=
or
> >>>> encodings.
> >>>>
> >>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >>>> ---
> >>>>
> >>>> >From 57e42ec6e34ac32da29eb7bc3c691cbeb2534396 Mon Sep 17 00:00:00 2=
001
> >>>> From: Werner Sembach <wse@tuxedocomputers.com>
> >>>> Date: Mon, 3 May 2021 15:30:40 +0200
> >>>> Subject: [PATCH 3/4] Restructure output format computation for better
> >>>>  expandability
> >>>>
> >>>> ---
> >>>>  drivers/gpu/drm/i915/display/intel_hdmi.c | 57 +++++++++++---------=
---
> >>>>  1 file changed, 26 insertions(+), 31 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu=
/drm/i915/display/intel_hdmi.c
> >>>> index ce165ef28e88..e2553ac6fd13 100644
> >>>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> >>>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> >>>> @@ -1999,29 +1999,6 @@ static bool hdmi_deep_color_possible(const st=
ruct intel_crtc_state *crtc_state,
> >>>>  					      INTEL_OUTPUT_FORMAT_YCBCR420);
> >>>>  }
> >>>>  =

> >>>> -static int
> >>>> -intel_hdmi_ycbcr420_config(struct intel_crtc_state *crtc_state,
> >>>> -			   const struct drm_connector_state *conn_state)
> >>>> -{
> >>>> -	struct drm_connector *connector =3D conn_state->connector;
> >>>> -	struct drm_i915_private *i915 =3D to_i915(connector->dev);
> >>>> -	const struct drm_display_mode *adjusted_mode =3D
> >>>> -		&crtc_state->hw.adjusted_mode;
> >>>> -
> >>>> -	if (!drm_mode_is_420_only(&connector->display_info, adjusted_mode))
> >>>> -		return 0;
> >>>> -
> >>>> -	if (!connector->ycbcr_420_allowed) {
> >>>> -		drm_err(&i915->drm,
> >>>> -			"Platform doesn't support YCBCR420 output\n");
> >>>> -		return -EINVAL;
> >>>> -	}
> >>>> -
> >>>> -	crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;
> >>>> -
> >>>> -	return intel_pch_panel_fitting(crtc_state, conn_state);
> >>>> -}
> >>>> -
> >>>>  static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
> >>>>  				  struct intel_crtc_state *crtc_state,
> >>>>  				  int clock)
> >>>> @@ -2128,6 +2105,24 @@ static bool intel_hdmi_has_audio(struct intel=
_encoder *encoder,
> >>>>  		return intel_conn_state->force_audio =3D=3D HDMI_AUDIO_ON;
> >>>>  }
> >>>>  =

> >>>> +int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
> >>>> +				     struct intel_crtc_state *crtc_state,
> >>>> +				     const struct drm_connector_state *conn_state)
> >>>> +{
> >>>> +	const struct drm_connector *connector =3D conn_state->connector;
> >>>> +	const struct drm_display_mode *adjusted_mode =3D &crtc_state->hw.a=
djusted_mode;
> >>>> +	int ret;
> >>>> +
> >>>> +	if (connector->ycbcr_420_allowed && drm_mode_is_420_only(&connecto=
r->display_info, adjusted_mode))
> >>>> +		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR420;
> >>>> +	else
> >>>> +		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_RGB;
> >>> Slight change in behaviour here since we used to reject 420_only modes
> >>> if ycbcr_420_allowed wasn't set. But I think this should be OK, and in
> >>> fact I believe the DP counterpart code always used an RGB fallback
> >>> rather than failing. So this lines up better with that.
> >> That was actually an oversight on my side and not intended. Does a RGB=
 fallback make sense?
> >>
> >> Now that I think of it get to 2 scenarios:
> >>
> >> - The screen is really 420_only, which causes a silent fail and a blac=
k screen I guess? Where before at least a log message was written.
> >>
> >> - The screen falsely reports as 420_only and using RGB regardless make=
s it magically work
> >>
> >> I think at least warning should be printed to the logs. Something alon=
g the lines of: "Display reports as 420 only, but port does not support 420=
, try forcing RGB, but this is likely to fail."
> > I would just put it into the "user has decided to override the mode and
> > gets to keep both pieces if it breaks". Typical users would not hit that
> > since they will only use modes reported by the connector as supported.
> >
> > So I think the RGB fallback is totally in line with existing behaviour
> > of the driver. We have other cases where we just ignore the reported
> > limits of the display if the user overrides the mode manually.
> >
> Did I get you right that "connector->ycbcr_420_allowed" is a user setting=
 and not automatically filled configuration depending on hardware capabilit=
ies?

No, ycbcr_420_allowed is an automatic thing. But the user can
manually force the display mode to be whatever they want.

So we could have a case where the user forces a mode which the display
claims needs 4:2:0 but the GPU does not support 4:2:0 output. In that
case we could either reject it or just try to output it as RGB anyway.
The current policy for most things like this is "user knows best".
And sometimes they really do know best since some displays can in
fact do things they claim to not support.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
