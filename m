Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 395FC135CB8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 16:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB756E914;
	Thu,  9 Jan 2020 15:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093EF6E914;
 Thu,  9 Jan 2020 15:27:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 07:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="216331926"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 09 Jan 2020 07:26:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Jan 2020 17:26:57 +0200
Date: Thu, 9 Jan 2020 17:26:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
Message-ID: <20200109152656.GP1208@intel.com>
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
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
Cc: mario.kleiner.de@gmail.de, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrote:
> If the current eDP link rate, as read from hw, provides a
> higher bandwidth than the standard link rates, then add the
> current link rate to the link_rates array for consideration
> in future mode-sets.
> =

> These initial current eDP link settings have been set up by
> firmware during boot, so they should work on the eDP panel.
> Therefore use them if the firmware thinks they are good and
> they provide higher link bandwidth, e.g., to enable higher
> resolutions / color depths.
> =

> This fixes a problem found on the MacBookPro 2017 Retina panel:
> =

> The panel reports 10 bpc color depth in its EDID, and the UEFI
> firmware chooses link settings at boot which support enough
> bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
> DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
> so intel_dp_set_sink_rates() would cap at that. This restricts
> achievable color depth to 8 bpc, not providing the full color
> depth of the panel. With this commit, we can use firmware setting
> and get the full 10 bpc advertised by the Retina panel.
> =

> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 2f31d226c6eb..aa3e0b5108c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4368,6 +4368,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  {
>  	struct drm_i915_private *dev_priv =3D
>  		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
> +	int max_rate;
> +	u8 link_bw;
>  =

>  	/* this function is meant to be called only once */
>  	WARN_ON(intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> @@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  	else
>  		intel_dp_set_sink_rates(intel_dp);
>  =

> +	/*
> +	 * If the firmware programmed a rate higher than the standard sink rates
> +	 * during boot, then add that rate as a valid sink rate, as fw knows
> +	 * this is a good rate and we get extra bandwidth.
> +	 *
> +	 * Helps, e.g., on the Apple MacBookPro 2017 Retina panel, which is only
> +	 * eDP 1.1, but supports the unusual rate of 324000 kHz at bootup, for
> +	 * 10 bpc / 30 bit color depth.
> +	 */
> +	if (!intel_dp->use_rate_select &&
> +	    (drm_dp_dpcd_read(&intel_dp->aux, DP_LINK_BW_SET, &link_bw, 1) =3D=
=3D 1) &&
> +	    (link_bw > 0) && (intel_dp->num_sink_rates < DP_MAX_SUPPORTED_RATES=
)) {
> +		max_rate =3D drm_dp_bw_code_to_link_rate(link_bw);
> +		if (max_rate > intel_dp->sink_rates[intel_dp->num_sink_rates - 1]) {
> +			intel_dp->sink_rates[intel_dp->num_sink_rates] =3D max_rate;
> +			intel_dp->num_sink_rates++;
> +			DRM_DEBUG_KMS("Adding max bandwidth eDP rate %d kHz.\n",
> +				      max_rate);
> +		}

Hmm. I guess we could do this. But plese put it into a separate
function so we don't end up with that super ugly if condition.

The debug message should probably be a bit more explicit. Eg. =

something like: =

"Firmware using non-standard link rate %d kHz. Including it in sink rates.\=
n"

I'm also wondering if we shouldn't just add the link rate to the sink
rates regradless of whether it's the highest rate or not...

> +	}
> +
>  	intel_dp_set_common_rates(intel_dp);
>  =

>  	/* Read the eDP DSC DPCD registers */
> -- =

> 2.24.0
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
