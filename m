Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD481682B0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 17:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B491E6F4B9;
	Fri, 21 Feb 2020 16:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524F6F4BC;
 Fri, 21 Feb 2020 16:04:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 08:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="270030725"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 21 Feb 2020 08:04:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 21 Feb 2020 18:04:25 +0200
Date: Fri, 21 Feb 2020 18:04:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/12] drm: Nuke mode->hsync
Message-ID: <20200221160425.GR13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-2-ville.syrjala@linux.intel.com>
 <CACvgo53w0+anXrf0fSGkdAx8gctMFzLh311n74tBCQ7qt+_--A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo53w0+anXrf0fSGkdAx8gctMFzLh311n74tBCQ7qt+_--A@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 10:55:18AM +0000, Emil Velikov wrote:
> On Wed, 19 Feb 2020 at 20:35, Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > Let's just calculate the hsync rate on demand. No point in wasting
> > space storing it and risking the cached value getting out of sync
> > with reality.
> >
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_modes.c                  | 14 ++------------
> >  drivers/gpu/drm/i915/display/intel_display.c |  1 -
> >  include/drm/drm_modes.h                      | 10 ----------
> >  3 files changed, 2 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index d4d64518e11b..fe7e872a6239 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -752,24 +752,14 @@ EXPORT_SYMBOL(drm_mode_set_name);
> >   * @mode: mode
> >   *
> >   * Returns:
> > - * @modes's hsync rate in kHz, rounded to the nearest integer. Calcula=
tes the
> > - * value first if it is not yet set.
> > + * @modes's hsync rate in kHz, rounded to the nearest integer
> >   */
> >  int drm_mode_hsync(const struct drm_display_mode *mode)
> >  {
> > -       unsigned int calc_val;
> > -
> > -       if (mode->hsync)
> > -               return mode->hsync;
> > -
> >         if (mode->htotal <=3D 0)
> >                 return 0;
> >
> > -       calc_val =3D (mode->clock * 1000) / mode->htotal; /* hsync in H=
z */
> > -       calc_val +=3D 500;                                /* round to 1=
000Hz */
> > -       calc_val /=3D 1000;                               /* truncate t=
o kHz */
> > -
> > -       return calc_val;
> > +       return DIV_ROUND_CLOSEST(mode->clock, mode->htotal);
> >  }
> >  EXPORT_SYMBOL(drm_mode_hsync);
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index ee7d54ccd3e6..fab914819489 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -8867,7 +8867,6 @@ void intel_mode_from_pipe_config(struct drm_displ=
ay_mode *mode,
> >
> >         mode->clock =3D pipe_config->hw.adjusted_mode.crtc_clock;
> >
> > -       mode->hsync =3D drm_mode_hsync(mode);
> =

> With this gone, we could make drm_mode_hsync() internal and move it to
> drm_foo_internal.h.
> Making it obvious that drivers, should be copy/pasting it.

Hmm. Looks like drm_edid.c is the only user left actually. Should
probably just move it there and make it static.

> =

> Regardless, the patch is:
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> =

> -Emil

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
