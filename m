Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931916668B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59876EE48;
	Thu, 20 Feb 2020 18:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB606EE48;
 Thu, 20 Feb 2020 18:47:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 10:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="224951915"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 20 Feb 2020 10:47:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Feb 2020 20:47:02 +0200
Date: Thu, 20 Feb 2020 20:47:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 09/12] drm: Shrink drm_display_mode timings
Message-ID: <20200220184702.GJ13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-10-ville.syrjala@linux.intel.com>
 <20200220181908.GX2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220181908.GX2363188@phenom.ffwll.local>
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

On Thu, Feb 20, 2020 at 07:19:08PM +0100, Daniel Vetter wrote:
> On Wed, Feb 19, 2020 at 10:35:41PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Store the timings (apart from the clock) as u16. The uapi mode
> > struct already uses u16 for everything so using something bigger
> > internally doesn't really help us.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Makes sense I guess. This could mean some implicit pointer math is now no
> longer auto-upgraded to big enough integers though ...

u16 promotes to int. So can't really see how this would go wrong. Well,
unless someone is using these to store some larger intermediate values.

> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> > ---
> >  drivers/gpu/drm/drm_modes.c |  7 ------
> >  include/drm/drm_modes.h     | 46 ++++++++++++++++++-------------------
> >  2 files changed, 23 insertions(+), 30 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 0e7c9ba241c4..cc9fc52f9f7c 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1917,13 +1917,6 @@ EXPORT_SYMBOL(drm_mode_create_from_cmdline_mode);
> >  void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
> >  			       const struct drm_display_mode *in)
> >  {
> > -	WARN(in->hdisplay > USHRT_MAX || in->hsync_start > USHRT_MAX ||
> > -	     in->hsync_end > USHRT_MAX || in->htotal > USHRT_MAX ||
> > -	     in->hskew > USHRT_MAX || in->vdisplay > USHRT_MAX ||
> > -	     in->vsync_start > USHRT_MAX || in->vsync_end > USHRT_MAX ||
> > -	     in->vtotal > USHRT_MAX || in->vscan > USHRT_MAX,
> > -	     "timing values too large for mode info\n");
> > -
> >  	out->clock =3D in->clock;
> >  	out->hdisplay =3D in->hdisplay;
> >  	out->hsync_start =3D in->hsync_start;
> > diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> > index b28c0234fcd7..b585074945b5 100644
> > --- a/include/drm/drm_modes.h
> > +++ b/include/drm/drm_modes.h
> > @@ -278,16 +278,16 @@ struct drm_display_mode {
> >  	 * Pixel clock in kHz.
> >  	 */
> >  	int clock;		/* in kHz */
> > -	int hdisplay;
> > -	int hsync_start;
> > -	int hsync_end;
> > -	int htotal;
> > -	int hskew;
> > -	int vdisplay;
> > -	int vsync_start;
> > -	int vsync_end;
> > -	int vtotal;
> > -	int vscan;
> > +	u16 hdisplay;
> > +	u16 hsync_start;
> > +	u16 hsync_end;
> > +	u16 htotal;
> > +	u16 hskew;
> > +	u16 vdisplay;
> > +	u16 vsync_start;
> > +	u16 vsync_end;
> > +	u16 vtotal;
> > +	u16 vscan;
> >  	/**
> >  	 * @flags:
> >  	 *
> > @@ -356,19 +356,19 @@ struct drm_display_mode {
> >  	 * difference is exactly a factor of 10.
> >  	 */
> >  	int crtc_clock;
> > -	int crtc_hdisplay;
> > -	int crtc_hblank_start;
> > -	int crtc_hblank_end;
> > -	int crtc_hsync_start;
> > -	int crtc_hsync_end;
> > -	int crtc_htotal;
> > -	int crtc_hskew;
> > -	int crtc_vdisplay;
> > -	int crtc_vblank_start;
> > -	int crtc_vblank_end;
> > -	int crtc_vsync_start;
> > -	int crtc_vsync_end;
> > -	int crtc_vtotal;
> > +	u16 crtc_hdisplay;
> > +	u16 crtc_hblank_start;
> > +	u16 crtc_hblank_end;
> > +	u16 crtc_hsync_start;
> > +	u16 crtc_hsync_end;
> > +	u16 crtc_htotal;
> > +	u16 crtc_hskew;
> > +	u16 crtc_vdisplay;
> > +	u16 crtc_vblank_start;
> > +	u16 crtc_vblank_end;
> > +	u16 crtc_vsync_start;
> > +	u16 crtc_vsync_end;
> > +	u16 crtc_vtotal;
> >  =

> >  	/**
> >  	 * @private_flags:
> > -- =

> > 2.24.1
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
