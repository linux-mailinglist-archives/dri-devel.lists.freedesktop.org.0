Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726851A1591
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 21:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AE36E8E6;
	Tue,  7 Apr 2020 19:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C226E8F2;
 Tue,  7 Apr 2020 19:08:05 +0000 (UTC)
IronPort-SDR: ehzQc0A5+88SuKHY0OO5c2Gy9/SNqj2O1A2mFv9z0x7NCujf1QkTjOYjHwmQA1RImQ2IO/5jKA
 c6OeS6PxKHAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 12:08:04 -0700
IronPort-SDR: QfdkvTKiZ9mDsGzaCBzGozXMF6/BDZ7Xm7Nwgr0dj97o81+14jHBFoWNRAqkCAhULsOi0bIqSX
 V+ChHJ4/TcLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; d="scan'208";a="297026749"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 07 Apr 2020 12:08:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Apr 2020 22:08:00 +0300
Date: Tue, 7 Apr 2020 22:08:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 15/17] drm/gma500: Stop using mode->private_flags
Message-ID: <20200407190800.GO6112@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-16-ville.syrjala@linux.intel.com>
 <20200407185653.GL6356@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407185653.GL6356@ravnborg.org>
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

On Tue, Apr 07, 2020 at 08:56:53PM +0200, Sam Ravnborg wrote:
> Hi Ville.
> =

> On Fri, Apr 03, 2020 at 11:40:06PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > gma500 only uses mode->private_flags to convey the sdvo pixel
> > multiplier from the encoder .mode_fixup() hook to the encoder
> > .mode_set() hook. Those always seems get called as a pair so
> > let's just stuff the pixel multiplier into the encoder itself
> > as there are no state objects we could use in this non-atomic
> > driver.
> > =

> > Paves the way for nuking mode->private_flag.
> Nice little clean-up. One comment below.
> =

> 	Sam
> > =

> > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > CC: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Emil Velikov <emil.l.velikov@gmail.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/gma500/psb_intel_drv.h  | 19 -------------------
> >  drivers/gpu/drm/gma500/psb_intel_sdvo.c | 11 ++++++-----
> >  2 files changed, 6 insertions(+), 24 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/g=
ma500/psb_intel_drv.h
> > index fb601983cef0..3dd5718c3e31 100644
> > --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> > +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> > @@ -56,25 +56,6 @@
> >  #define INTEL_OUTPUT_DISPLAYPORT 9
> >  #define INTEL_OUTPUT_EDP 10
> >  =

> > -#define INTEL_MODE_PIXEL_MULTIPLIER_SHIFT (0x0)
> > -#define INTEL_MODE_PIXEL_MULTIPLIER_MASK (0xf << INTEL_MODE_PIXEL_MULT=
IPLIER_SHIFT)
> > -
> > -static inline void
> > -psb_intel_mode_set_pixel_multiplier(struct drm_display_mode *mode,
> > -				int multiplier)
> > -{
> > -	mode->clock *=3D multiplier;
> > -	mode->private_flags |=3D multiplier;
> > -}
> > -
> > -static inline int
> > -psb_intel_mode_get_pixel_multiplier(const struct drm_display_mode *mod=
e)
> > -{
> > -	return (mode->private_flags & INTEL_MODE_PIXEL_MULTIPLIER_MASK)
> > -	       >> INTEL_MODE_PIXEL_MULTIPLIER_SHIFT;
> > -}
> > -
> > -
> >  /*
> >   * Hold information useally put on the device driver privates here,
> >   * since it needs to be shared across multiple of devices drivers priv=
ates.
> > diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/=
gma500/psb_intel_sdvo.c
> > index 264d7ad004b4..9e88a37f55e9 100644
> > --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> > @@ -132,6 +132,8 @@ struct psb_intel_sdvo {
> >  	/* DDC bus used by this SDVO encoder */
> >  	uint8_t ddc_bus;
> >  =

> > +	u8 pixel_multiplier;
> > +
> =

> There is really no good reason to use an u8 here.

Wastes less space.

> psb_intel_sdvo_get_pixel_multiplier() return an int, so use an int here
> too.
> =

> With this fixed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> =

> >  	/* Input timings for adjusted_mode */
> >  	struct psb_intel_sdvo_dtd input_dtd;
> >  =

> > @@ -958,7 +960,6 @@ static bool psb_intel_sdvo_mode_fixup(struct drm_en=
coder *encoder,
> >  				  struct drm_display_mode *adjusted_mode)
> >  {
> >  	struct psb_intel_sdvo *psb_intel_sdvo =3D to_psb_intel_sdvo(encoder);
> > -	int multiplier;
> >  =

> >  	/* We need to construct preferred input timings based on our
> >  	 * output timings.  To do that, we have to set the output
> > @@ -985,8 +986,9 @@ static bool psb_intel_sdvo_mode_fixup(struct drm_en=
coder *encoder,
> >  	/* Make the CRTC code factor in the SDVO pixel multiplier.  The
> >  	 * SDVO device will factor out the multiplier during mode_set.
> >  	 */
> > -	multiplier =3D psb_intel_sdvo_get_pixel_multiplier(adjusted_mode);
> > -	psb_intel_mode_set_pixel_multiplier(adjusted_mode, multiplier);
> > +	psb_intel_sdvo->pixel_multiplier =3D
> > +		psb_intel_sdvo_get_pixel_multiplier(adjusted_mode);
> > +	adjusted_mode->clock *=3D psb_intel_sdvo->pixel_multiplier;
> >  =

> >  	return true;
> >  }
> > @@ -1002,7 +1004,6 @@ static void psb_intel_sdvo_mode_set(struct drm_en=
coder *encoder,
> >  	u32 sdvox;
> >  	struct psb_intel_sdvo_in_out_map in_out;
> >  	struct psb_intel_sdvo_dtd input_dtd;
> > -	int pixel_multiplier =3D psb_intel_mode_get_pixel_multiplier(adjusted=
_mode);
> >  	int rate;
> >  	int need_aux =3D IS_MRST(dev) ? 1 : 0;
> >  =

> > @@ -1060,7 +1061,7 @@ static void psb_intel_sdvo_mode_set(struct drm_en=
coder *encoder,
> >  =

> >  	(void) psb_intel_sdvo_set_input_timing(psb_intel_sdvo, &input_dtd);
> >  =

> > -	switch (pixel_multiplier) {
> > +	switch (psb_intel_sdvo->pixel_multiplier) {
> >  	default:
> >  	case 1: rate =3D SDVO_CLOCK_RATE_MULT_1X; break;
> >  	case 2: rate =3D SDVO_CLOCK_RATE_MULT_2X; break;
> > -- =

> > 2.24.1
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
