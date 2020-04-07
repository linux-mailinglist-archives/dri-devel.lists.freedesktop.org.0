Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EBD1A1012
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 17:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95376E894;
	Tue,  7 Apr 2020 15:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355AE6E890;
 Tue,  7 Apr 2020 15:20:55 +0000 (UTC)
IronPort-SDR: mKZ1p9OZck9e0yGQnQKq8yAZWhFUQxmli4VWff99NtR+jKlG8qGV6tHyshVVKE5+NobFDijORy
 E7UAbix0c4Zw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 08:20:54 -0700
IronPort-SDR: V7ZcDLyLs6cTl0T2HOEefkqV0o2JS5TGpMd1HTKRuP+fqYMbKvZmJh7Y3rO5HXAYu8bhpIaIjz
 n/1W4bOvbf/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,355,1580803200"; d="scan'208";a="239987173"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 07 Apr 2020 08:20:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Apr 2020 18:20:50 +0300
Date: Tue, 7 Apr 2020 18:20:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 13/17] drm/i915: Stop using mode->private_flags
Message-ID: <20200407152050.GC6112@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-14-ville.syrjala@linux.intel.com>
 <20200407073847.GB3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407073847.GB3456981@phenom.ffwll.local>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 09:38:47AM +0200, Daniel Vetter wrote:
> On Fri, Apr 03, 2020 at 11:40:04PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Replace the use of mode->private_flags with a truly private bitmaks
> > in our own crtc state. We also need a copy in the crtc itself so the
> > vblank code can get at it. We already have scanline_offset in there
> > for a similar reason, as well as the vblank->hwmode which is assigned
> > via drm_calc_timestamping_constants(). Fortunately we now have a
> > nice place for doing the crtc_state->crtc copy in
> > intel_crtc_update_active_timings() which gets called both for
> > modesets and init/resume readout.
> > =

> > The one slightly iffy spot is the INHERITED flag which we want to
> > preserve until userspace/fb_helper does the first proper commit after
> > actually calling .detecti() on the connectors. Otherwise we don't have
> > the full sink capabilities (audio,infoframes,etc.) when .compute_config=
()
> > gets called and thus we will fail to enable those features when the
> > first userspace commit happens. The only internal commit we do prior to
> > that should be from intel_initial_commit() and there we can simply
> > preserve the INHERITED flag from the readout.
> > =

> > CC: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Emil Velikov <emil.l.velikov@gmail.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/icl_dsi.c        | 13 ++++------
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |  1 +
> >  drivers/gpu/drm/i915/display/intel_display.c  | 24 +++++++++++++------
> >  .../drm/i915/display/intel_display_types.h    |  9 ++++++-
> >  drivers/gpu/drm/i915/display/intel_tv.c       |  4 ++--
> >  drivers/gpu/drm/i915/display/vlv_dsi.c        |  6 ++---
> >  drivers/gpu/drm/i915/i915_irq.c               |  4 ++--
> >  7 files changed, 37 insertions(+), 24 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i=
915/display/icl_dsi.c
> > index 99a25c0bb08f..4d6788ef2e5e 100644
> > --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> > +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> > @@ -1469,8 +1469,7 @@ static void gen11_dsi_get_config(struct intel_enc=
oder *encoder,
> >  	pipe_config->pipe_bpp =3D bdw_get_pipemisc_bpp(crtc);
> >  =

> >  	if (gen11_dsi_is_periodic_cmd_mode(intel_dsi))
> > -		pipe_config->hw.adjusted_mode.private_flags |=3D
> > -					I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE;
> > +		pipe_config->mode_flags |=3D I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE;
> >  }
> >  =

> >  static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
> > @@ -1555,10 +1554,6 @@ static int gen11_dsi_compute_config(struct intel=
_encoder *encoder,
> >  =

> >  	pipe_config->port_clock =3D afe_clk(encoder, pipe_config) / 5;
> >  =

> > -	/* We would not operate in periodic command mode */
> > -	pipe_config->hw.adjusted_mode.private_flags &=3D
> > -					~I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE;
> > -
> =

> Since you delete this here, but not above (and then you could also detel
> gen11_dsi_is_periodic_cmd_mode I think): It's dead code, maybe prep patch
> to just garbage collect I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE?

I think this flag is still WIP. It was added very recently so I'm
assuming there is some plan for it (not that I like adding half
baked dead stuff like this). So we may want to wait a bit to see
where it's going. The reason I deleted this specific statement is
that we zero the crtc state before .compute_config() so this one
would remain dead code even if the flag starts to get used for
something.

> =

> I think the proper replacement is the mode flag stuff below, this is just
> interim stuff that fell through the review.
> =

> With that prep patch to get rid of these 2 hunks above:
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> Also surplus Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> on the patch
> to delete I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE in case I miss the new
> version.
> =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
