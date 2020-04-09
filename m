Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD051A3AD1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 21:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D33A6E25F;
	Thu,  9 Apr 2020 19:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884956E25F;
 Thu,  9 Apr 2020 19:54:33 +0000 (UTC)
IronPort-SDR: BrEPkX+GGXgocsblcsdrtx0BWsKWDY/qFbP3P62qJu3WlxSapVC/Of8yRPOsoco4hqbsxQJU3P
 6OMMwET6E2jQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:54:32 -0700
IronPort-SDR: yY1VYe29l0Zv9IFtrHVcJmp7EykBCz1QzniZUwfXPsdGaZkeqK4Y27TUhehAUuKcYcpckPNI94
 7VE0cBUgemLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="258596492"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 09 Apr 2020 12:54:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Apr 2020 22:54:29 +0300
Date: Thu, 9 Apr 2020 22:54:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 15/17] drm/gma500: Stop using mode->private_flags
Message-ID: <20200409195428.GA6112@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-16-ville.syrjala@linux.intel.com>
 <20200407185653.GL6356@ravnborg.org>
 <20200407190800.GO6112@intel.com>
 <20200407193537.GA28584@ravnborg.org>
 <20200409194952.GZ6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409194952.GZ6112@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 10:49:52PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Apr 07, 2020 at 09:35:37PM +0200, Sam Ravnborg wrote:
> > On Tue, Apr 07, 2020 at 10:08:00PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Apr 07, 2020 at 08:56:53PM +0200, Sam Ravnborg wrote:
> > > > Hi Ville.
> > > > =

> > > > On Fri, Apr 03, 2020 at 11:40:06PM +0300, Ville Syrjala wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > =

> > > > > gma500 only uses mode->private_flags to convey the sdvo pixel
> > > > > multiplier from the encoder .mode_fixup() hook to the encoder
> > > > > .mode_set() hook. Those always seems get called as a pair so
> > > > > let's just stuff the pixel multiplier into the encoder itself
> > > > > as there are no state objects we could use in this non-atomic
> > > > > driver.
> > > > > =

> > > > > Paves the way for nuking mode->private_flag.
> > > > Nice little clean-up. One comment below.
> > > > =

> > > > 	Sam
> > > > > =

> > > > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > > > CC: Sam Ravnborg <sam@ravnborg.org>
> > > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > Cc: Emil Velikov <emil.l.velikov@gmail.com>
> > > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/gma500/psb_intel_drv.h  | 19 -------------------
> > > > >  drivers/gpu/drm/gma500/psb_intel_sdvo.c | 11 ++++++-----
> > > > >  2 files changed, 6 insertions(+), 24 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu=
/drm/gma500/psb_intel_drv.h
> > > > > index fb601983cef0..3dd5718c3e31 100644
> > > > > --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> > > > > +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> > > > > @@ -56,25 +56,6 @@
> > > > >  #define INTEL_OUTPUT_DISPLAYPORT 9
> > > > >  #define INTEL_OUTPUT_EDP 10
> > > > >  =

> > > > > -#define INTEL_MODE_PIXEL_MULTIPLIER_SHIFT (0x0)
> > > > > -#define INTEL_MODE_PIXEL_MULTIPLIER_MASK (0xf << INTEL_MODE_PIXE=
L_MULTIPLIER_SHIFT)
> > > > > -
> > > > > -static inline void
> > > > > -psb_intel_mode_set_pixel_multiplier(struct drm_display_mode *mod=
e,
> > > > > -				int multiplier)
> > > > > -{
> > > > > -	mode->clock *=3D multiplier;
> > > > > -	mode->private_flags |=3D multiplier;
> > > > > -}
> > > > > -
> > > > > -static inline int
> > > > > -psb_intel_mode_get_pixel_multiplier(const struct drm_display_mod=
e *mode)
> > > > > -{
> > > > > -	return (mode->private_flags & INTEL_MODE_PIXEL_MULTIPLIER_MASK)
> > > > > -	       >> INTEL_MODE_PIXEL_MULTIPLIER_SHIFT;
> > > > > -}
> > > > > -
> > > > > -
> > > > >  /*
> > > > >   * Hold information useally put on the device driver privates he=
re,
> > > > >   * since it needs to be shared across multiple of devices driver=
s privates.
> > > > > diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gp=
u/drm/gma500/psb_intel_sdvo.c
> > > > > index 264d7ad004b4..9e88a37f55e9 100644
> > > > > --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > > > > +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > > > > @@ -132,6 +132,8 @@ struct psb_intel_sdvo {
> > > > >  	/* DDC bus used by this SDVO encoder */
> > > > >  	uint8_t ddc_bus;
> > > > >  =

> > > > > +	u8 pixel_multiplier;
> > > > > +
> > > > =

> > > > There is really no good reason to use an u8 here.
> > > =

> > > Wastes less space.
> > =

> > When there is a good reason - use the size limited variants.
> > But in this use case there is no reason to space optimize it.
> =

> IMO when it's stuffed into a structure there's no reason not to
> optimize it. At some point it all starts to add up.
> =

> At least i915 suffers a lot from bloated structures (dev_priv
> and atomic state structs being the prime examples) where we
> could probably shave dozens if not hundreds of bytes if
> everything just used the smallest type possible. In fact
> this series does shave dozens of bytes from the crtc state
> alone.

Make that hundreds of bytes actually. I think we have three or more
copies of drm_display_mode embedded in there and this series shrinks
each one by 80 bytes (iirc).

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
