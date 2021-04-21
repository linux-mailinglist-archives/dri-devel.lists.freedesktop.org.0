Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D74A3672B4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 20:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23CE6E9CC;
	Wed, 21 Apr 2021 18:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F166E9B1;
 Wed, 21 Apr 2021 18:39:56 +0000 (UTC)
IronPort-SDR: BGFvayV3tT52vlkLPTw/Rk5lWUv8z/a9fgjbuJygGwULwYR1CRT8vlfRge3y84gXrYrEyGC8LC
 TJPRVrnGAkUQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="175862026"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="175862026"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 11:39:55 -0700
IronPort-SDR: TYr7rALY8BDfHLuqtwjGXeSIhIxdv0mdUqjczB7YQwL3bakP1SpKickfZtMBIQ9F5AuYya2Wu7
 v9a4jUFNPYyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="455450299"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 21 Apr 2021 11:39:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Apr 2021 21:39:50 +0300
Date: Wed, 21 Apr 2021 21:39:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] drm/i915/dp: Use slow and wide link training for
 everything
Message-ID: <YIBxduMptaKAFOUq@intel.com>
References: <20210421052054.1434718-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421052054.1434718-1-kai.heng.feng@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 rodrigo.vivi@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 01:20:31PM +0800, Kai-Heng Feng wrote:
> Screen flickers on Innolux eDP 1.3 panel when clock rate 540000 is in use.
> =

> According to the panel vendor, though clock rate 540000 is advertised,
> but the max clock rate it really supports is 270000.
> =

> Ville Syrj=E4l=E4 mentioned that fast and narrow also breaks some eDP 1.4
> panel, so use slow and wide training for all panels to resolve the
> issue.
> =

> User also confirmed that the new strategy doesn't introduce any
> regression on XPS 9380.
> =

> v2:
>  - Use slow and wide for everything.
> =

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3384
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/272
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thanks. Pushed to drm-intel-next.

I did a quick scan of a few CI logs and noticed that at least cml-u2
changed behaviour:
- [CONNECTOR:95:eDP-1] Link Training passed at link rate =3D 432000, lane c=
ount =3D 1, at DPRX
+ [CONNECTOR:95:eDP-1] Link Training passed at link rate =3D 216000, lane c=
ount =3D 2, at DPRX

But it still appears to work, and 2.16Gbps is also the link rate chosen
by the BIOS, which is reassuring.

> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1095,44 +1095,6 @@ intel_dp_compute_link_config_wide(struct intel_dp =
*intel_dp,
>  	return -EINVAL;
>  }
>  =

> -/* Optimize link config in order: max bpp, min lanes, min clock */
> -static int
> -intel_dp_compute_link_config_fast(struct intel_dp *intel_dp,
> -				  struct intel_crtc_state *pipe_config,
> -				  const struct link_config_limits *limits)
> -{
> -	const struct drm_display_mode *adjusted_mode =3D &pipe_config->hw.adjus=
ted_mode;
> -	int bpp, clock, lane_count;
> -	int mode_rate, link_clock, link_avail;
> -
> -	for (bpp =3D limits->max_bpp; bpp >=3D limits->min_bpp; bpp -=3D 2 * 3)=
 {
> -		int output_bpp =3D intel_dp_output_bpp(pipe_config->output_format, bpp=
);
> -
> -		mode_rate =3D intel_dp_link_required(adjusted_mode->crtc_clock,
> -						   output_bpp);
> -
> -		for (lane_count =3D limits->min_lane_count;
> -		     lane_count <=3D limits->max_lane_count;
> -		     lane_count <<=3D 1) {
> -			for (clock =3D limits->min_clock; clock <=3D limits->max_clock; clock=
++) {
> -				link_clock =3D intel_dp->common_rates[clock];
> -				link_avail =3D intel_dp_max_data_rate(link_clock,
> -								    lane_count);
> -
> -				if (mode_rate <=3D link_avail) {
> -					pipe_config->lane_count =3D lane_count;
> -					pipe_config->pipe_bpp =3D bpp;
> -					pipe_config->port_clock =3D link_clock;
> -
> -					return 0;
> -				}
> -			}
> -		}
> -	}
> -
> -	return -EINVAL;
> -}
> -
>  static int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 dsc_ma=
x_bpc)
>  {
>  	int i, num_bpc;
> @@ -1382,22 +1344,11 @@ intel_dp_compute_link_config(struct intel_encoder=
 *encoder,
>  	    intel_dp_can_bigjoiner(intel_dp))
>  		pipe_config->bigjoiner =3D true;
>  =

> -	if (intel_dp_is_edp(intel_dp))
> -		/*
> -		 * Optimize for fast and narrow. eDP 1.3 section 3.3 and eDP 1.4
> -		 * section A.1: "It is recommended that the minimum number of
> -		 * lanes be used, using the minimum link rate allowed for that
> -		 * lane configuration."
> -		 *
> -		 * Note that we fall back to the max clock and lane count for eDP
> -		 * panels that fail with the fast optimal settings (see
> -		 * intel_dp->use_max_params), in which case the fast vs. wide
> -		 * choice doesn't matter.
> -		 */
> -		ret =3D intel_dp_compute_link_config_fast(intel_dp, pipe_config, &limi=
ts);
> -	else
> -		/* Optimize for slow and wide. */
> -		ret =3D intel_dp_compute_link_config_wide(intel_dp, pipe_config, &limi=
ts);
> +	/*
> +	 * Optimize for slow and wide for everything, because there are some
> +	 * eDP 1.3 and 1.4 panels don't work well with fast and narrow.
> +	 */
> +	ret =3D intel_dp_compute_link_config_wide(intel_dp, pipe_config, &limit=
s);
>  =

>  	/* enable compression if the mode doesn't fit available BW */
>  	drm_dbg_kms(&i915->drm, "Force DSC en =3D %d\n", intel_dp->force_dsc_en=
);
> -- =

> 2.30.2

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
