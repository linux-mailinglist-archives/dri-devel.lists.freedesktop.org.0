Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567491FD3D8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 19:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0FD6EA00;
	Wed, 17 Jun 2020 17:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738476EA00
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 17:56:12 +0000 (UTC)
IronPort-SDR: C2JCoLGtDd2QYtbBOo6tVfdDIEJogsbZ+Wiv4+Crl9CsqbcTgM5ouR1SmIxJzfjbPS0HpO3iid
 91hXKGKovxUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 10:56:11 -0700
IronPort-SDR: uLjDcLQFXZLsMmZ1k8P/BJrERaOOA0rDTl+4i/2ly7R/mvYGhi/ipnoFdWUxSTj/eXrdLmd8Sc
 gTwkT/RNnBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="262643233"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 17 Jun 2020 10:56:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 17 Jun 2020 20:56:07 +0300
Date: Wed, 17 Jun 2020 20:56:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Cyrus Lien <cyrus.lien@canonical.com>
Subject: Re: [PATCH] drm/edid: add support for min horizontal rate equal to
 max horizontal rate
Message-ID: <20200617175607.GO6112@intel.com>
References: <20200608195704.29841-1-cyrus.lien@canonical.com>
 <20200609145745.GO6112@intel.com>
 <CAC513mV1B1O90RCbiUGN9Z_4jCHRmcTVjH+R0GffYtG=YwjD5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAC513mV1B1O90RCbiUGN9Z_4jCHRmcTVjH+R0GffYtG=YwjD5A@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 12:58:33AM +0800, Cyrus Lien wrote:
> On Tue, Jun 9, 2020 at 10:58 PM Ville Syrj=E4l=E4 <ville.syrjala@linux.in=
tel.com>
> wrote:
> =

> > On Tue, Jun 09, 2020 at 03:57:04AM +0800, Cyrus Lien wrote:
> > > According to EDID spec, table 3.26, byte #6 and #8, which said "Minim=
um
> > > rate value shall be less than or equal to maximum rate value". The
> > minimum
> > > horizontal/vertical rate value is able to be equal to maximum horizon=
tal/
> > > veritcal rate value.
> >
> > How does that justifiy ignoring the min value?
> >
> > Indeed, this patch does not make sense.
> Setting minimum horizontal rate equal to maximum horizontal rate is a
> request come from AMD Windows graphic driver for support freesync (I'm not
> sure if linux AMD driver also require it).

AFAICS the DP spec itself doesn't say anything about the
horizontal min/max rates. However DP-EDID-CTS 1.2 / 4.8 seems to
say that hmin=3D=3Dhmax=3D=3Dhsync should hold. Not sure if that should
be the hsync rate of the min/max/nominal refresh rate. I would
have maybe expected the max since that's the actual rate it's
going operate at. Alhtough I even less of an idea what it should
be if the monitor supports multiple resolutions.

In this case it doesn't seem to be any of those exactly. Pretty
close to the min refresh rate though. hmin=3Dhmax=3D110 kHz vs.
actual hsync rate for 50Hz would be 111.1 kHz (if it was actually
running at 50Hz with the declared vblank length which it won't be
of course). If we calculate in the opposite direction we get a
vrefresh of ~49.5 Hz based on the 110 kHz hsync rate. So if we
round to nearest integer it does match the declared vmin of 50Hz.

I suspect the right answer is to just ignore hmin/hmax when
it comes to adaptive sync.

> The problem is mode_in_hsync_range always return false except the mode's
> hsync exactly equal to hmax and hmin.
> =

> Add print in mode_in_hsync_range():
> [drm] mode_in_hsync_range 1920x1200: hsync: 94, hmax: 110, hmix:110
> [drm] mode_in_hsync_range 1920x1200: hsync: 107, hmax: 110, hmix:110
> [drm] mode_in_hsync_range 1920x1200: hsync: 152, hmax: 110, hmix:110
> [drm] mode_in_hsync_range 1920x1440: hsync: 90, hmax: 110, hmix:110
> [drm] mode_in_hsync_range 1920x1440: hsync: 113, hmax: 110, hmix:110
> [drm] mode_in_hsync_range 1920x1440: hsync: 183, hmax: 110, hmix:110
> =

> Is it available to get or calculate the hmax, hmix value from other fields
> in EDID ?
> Would you please provide some advice or directions to solve this problem ?
> Thank you and appreciated the help.
> =

> edid-decode (hex):
> =

> 00 ff ff ff ff ff ff 00 06 af 9b 32 00 00 00 00
> 00 1e 01 04 b5 26 15 78 03 1f 95 a5 53 35 b5 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 70 d0 00 a0 f0 70 3e 80 30 20
> 35 00 7d d6 10 00 00 1a 00 00 00 fd 00 32 5a 6e
> 6e 17 01 11 01 e0 60 20 50 3c 00 00 00 fe 00 34
> 34 54 52 4e 15 42 31 37 33 5a 41 4e 00 00 00 00
> 00 05 81 01 28 00 12 00 00 0b 01 0a 20 20 01 af
> =

> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> =

> ----------------
> =

> EDID version: 1.4
> Manufacturer: AUO Model 12955 Serial Number 0
> Made in year 2020
> Digital display
> 10 bits per primary color channel
> DisplayPort interface
> Maximum image size: 38 cm x 21 cm
> Gamma: 2.20
> Supported color formats: RGB 4:4:4
> First detailed timing includes the native pixel format and preferred
> refresh rate
> Display is continuous frequency
> Color Characteristics
>   Red:   0.6445, 0.3251
>   Green: 0.2099, 0.7099
>   Blue:  0.1503, 0.0595
>   White: 0.3134, 0.3291
> Established Timings I & II: none
> Standard Timings: none
> Detailed mode: Clock 533.600 MHz, 381 mm x 214 mm
>                3840 3888 3920 4000 ( 48  32  80)
>                2160 2163 2168 2222 (  3   5  54)
>                +hsync -vsync
>                VertFreq: 60.036 Hz, HorFreq: 133.400 kHz
> Display Range Limits
>   Monitor ranges (Bare Limits): 50-90 Hz V, 110-110 kHz H, max dotclock 2=
30
> MHz
> Alphanumeric Data String: 44TRN
> Manufacturer-Specified Display Descriptor (0x00): 00 00 00 05 81 01 28 00
> 12 00 00 0b 01 0a 20 20  ......(.......
> Has 1 extension block
> Checksum: 0xaf
> =

> ----------------
> =

> >
> > > This change check if h/v-sync excess maximum horizontal/vertical rate=
 if
> > > hmin equal to hmax or vmin equal to vmax.
> > >
> > > Signed-off-by: Cyrus Lien <cyrus.lien@canonical.com>
> > > ---
> > >  drivers/gpu/drm/drm_edid.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index fed653f13c26..23878320eabd 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -2674,6 +2674,9 @@ mode_in_hsync_range(const struct drm_display_mo=
de
> > *mode,
> > >           hmax +=3D ((t[4] & 0x08) ? 255 : 0);
> > >       hsync =3D drm_mode_hsync(mode);
> > >
> > > +     if (hmax =3D=3D hmin)
> > > +             return (hsync <=3D hmax);
> > > +
> > >       return (hsync <=3D hmax && hsync >=3D hmin);
> > >  }
> > >
> > > @@ -2691,6 +2694,9 @@ mode_in_vsync_range(const struct drm_display_mo=
de
> > *mode,
> > >           vmax +=3D ((t[4] & 0x02) ? 255 : 0);
> > >       vsync =3D drm_mode_vrefresh(mode);
> > >
> > > +     if (vmax =3D=3D vmin)
> > > +             return (vsync <=3D vmax);
> > > +
> > >       return (vsync <=3D vmax && vsync >=3D vmin);
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel
> >

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
