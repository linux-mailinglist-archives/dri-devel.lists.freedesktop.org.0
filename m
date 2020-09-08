Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 194022610F8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229E3883F4;
	Tue,  8 Sep 2020 11:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802286E1BD;
 Tue,  8 Sep 2020 11:50:51 +0000 (UTC)
IronPort-SDR: o0c8Q4AtFHfm4XuTrtX2R90kK3whEeeDZdhp3H5/BCc4baHKAVCXZKv2l6ZNUCHxKiP0LYc+Y0
 5pk0IWLcnBSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="242929237"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="242929237"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 04:50:51 -0700
IronPort-SDR: AxB0uXb2O24A+ehSgbwFe1iGfNdgMwnlisc1mHL6uLkz8hEawq0LKhlHp8Zh4PXy7509cNCxjS
 iuXjq3oDaeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; d="scan'208";a="304064265"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 08 Sep 2020 04:50:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Sep 2020 14:50:47 +0300
Date: Tue, 8 Sep 2020 14:50:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Drop the
 drm_atomic_helper_calc_timestamping_constants() call
Message-ID: <20200908115047.GH6112@intel.com>
References: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
 <20200907120026.6360-3-ville.syrjala@linux.intel.com>
 <20200907181438.GC2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907181438.GC2352366@phenom.ffwll.local>
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

On Mon, Sep 07, 2020 at 08:14:38PM +0200, Daniel Vetter wrote:
> On Mon, Sep 07, 2020 at 03:00:26PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > We update the timestamping constants per-crtc explicitly in
> > intel_crtc_update_active_timings(). Furtermore the helper will
> > use uapi.adjusted_mode whereas we want hw.adjusted_mode. Thus
> > let's drop the helper call an rely on what we already have in
> > intel_crtc_update_active_timings(). We can now also drop the
> > hw.adjusted_mode -> uapi.adjusted_mode copy hack that was added
> > to keep the helper from deriving the timestamping constants from
> > the wrong thing.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Does this fix some CI fail? I'd kinda expect/hope for that ...

Nah. Just trying to get rid of some of the confusing stuff before
we add even more confusing stuff for bigjoiner.

> =

> Anyway looks like a good idea to not mess with the uapi state like this.
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index 035840ce3825..a846f414c759 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -13472,12 +13472,6 @@ intel_modeset_pipe_config(struct intel_crtc_st=
ate *pipe_config)
> >  		    "hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
> >  		    base_bpp, pipe_config->pipe_bpp, pipe_config->dither);
> >  =

> > -	/*
> > -	 * Make drm_calc_timestamping_constants in
> > -	 * drm_atomic_helper_update_legacy_modeset_state() happy
> > -	 */
> > -	pipe_config->uapi.adjusted_mode =3D pipe_config->hw.adjusted_mode;
> > -
> >  	return 0;
> >  }
> >  =

> > @@ -15578,7 +15572,6 @@ static void intel_atomic_commit_tail(struct int=
el_atomic_state *state)
> >  =

> >  	if (state->modeset) {
> >  		drm_atomic_helper_update_legacy_modeset_state(dev, &state->base);
> > -		drm_atomic_helper_calc_timestamping_constants(&state->base);
> >  =

> >  		intel_set_cdclk_pre_plane_update(state);
> >  =

> > -- =

> > 2.26.2
> > =

> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
