Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9EF94B5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 16:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10E46EB65;
	Tue, 12 Nov 2019 15:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9543F6E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:50:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 5D3403AA30D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:50:36 +0000 (UTC)
X-Originating-IP: 86.206.246.123
Received: from aptenodytes (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr
 [86.206.246.123])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 908FDC0022;
 Tue, 12 Nov 2019 15:50:12 +0000 (UTC)
Date: Tue, 12 Nov 2019 16:50:12 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH] drm/gma500: Fixup fbdev stolen size usage evaluation
Message-ID: <20191112155012.GE4506@aptenodytes>
References: <20191107153048.843881-1-paul.kocialkowski@bootlin.com>
 <CAMeQTsYG+YvXqQqvJvsxT1h0z5zZJbdCtc5wPjUossvwidV=cA@mail.gmail.com>
 <20191112151157.GD4506@aptenodytes>
MIME-Version: 1.0
In-Reply-To: <20191112151157.GD4506@aptenodytes>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: multipart/mixed; boundary="===============0902650898=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0902650898==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Content-Disposition: inline


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 12 Nov 19, 16:11, Paul Kocialkowski wrote:
> Hi,
>=20
> On Tue 12 Nov 19, 11:20, Patrik Jakobsson wrote:
> > On Thu, Nov 7, 2019 at 4:30 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > >
> > > psbfb_probe performs an evaluation of the required size from the stol=
en
> > > GTT memory, but gets it wrong in two distinct ways:
> > > - The resulting size must be page-size-aligned;
> > > - The size to allocate is derived from the surface dimensions, not th=
e fb
> > >   dimensions.
> > >
> > > When two connectors are connected with different modes, the smallest =
will
> > > be stored in the fb dimensions, but the size that needs to be allocat=
ed must
> > > match the largest (surface) dimensions. This is what is used in the a=
ctual
> > > allocation code.
> > >
> > > Fix this by correcting the evaluation to conform to the two points ab=
ove.
> > > It allows correctly switching to 16bpp when one connector is e.g. 192=
0x1080
> > > and the other is 1024x768.
> > >
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/gma500/framebuffer.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/g=
ma500/framebuffer.c
> > > index 218f3bb15276..90237abee088 100644
> > > --- a/drivers/gpu/drm/gma500/framebuffer.c
> > > +++ b/drivers/gpu/drm/gma500/framebuffer.c
> > > @@ -462,6 +462,7 @@ static int psbfb_probe(struct drm_fb_helper *help=
er,
> > >                 container_of(helper, struct psb_fbdev, psb_fb_helper);
> > >         struct drm_device *dev =3D psb_fbdev->psb_fb_helper.dev;
> > >         struct drm_psb_private *dev_priv =3D dev->dev_private;
> > > +       unsigned int fb_size;
> > >         int bytespp;
> > >
> > >         bytespp =3D sizes->surface_bpp / 8;
> > > @@ -471,8 +472,11 @@ static int psbfb_probe(struct drm_fb_helper *hel=
per,
> > >         /* If the mode will not fit in 32bit then switch to 16bit to =
get
> > >            a console on full resolution. The X mode setting server wi=
ll
> > >            allocate its own 32bit GEM framebuffer */
> > > -       if (ALIGN(sizes->fb_width * bytespp, 64) * sizes->fb_height >
> > > -                       dev_priv->vram_stolen_size) {
> > > +       fb_size =3D ALIGN(sizes->surface_width * bytespp, 64) *
> > > +                 sizes->surface_height;
> > > +       fb_size =3D ALIGN(fb_size, PAGE_SIZE);
> > > +
> > > +       if (fb_size > dev_priv->vram_stolen_size) {
> >=20
> > psb_gtt_alloc_range() already aligns by PAGE_SIZE for us. Looks like
> > we align a couple of times extra for luck. This needs cleaning up
> > instead of adding even more aligns.
>=20
> I'm not sure this is really for luck. As far as I can see, we need to do =
it
> properly for this size estimation since it's the final size that will be
> allocated (and thus needs to be available in whole).
>=20
> For the other times there is explicit alignment, they seem justified too:
> - in psb_gem_create: it is common to pass the aligned size when creating =
the
>   associated GEM object with drm_gem_object_init, even though it's probab=
ly not
>   crucial given that this is not where allocation actually happens;
> - in psbfb_create: the full size is apparently only really used to memset=
 0
>   the allocated buffer. I think this makes sense for security reasons (an=
d not
>   leak previous contents in the additional space required for alignment).
>=20
> What strikes me however is that each call to psb_gtt_alloc_range takes the
> alignment as a parameter when it's really always PAGE_SIZE, so it should
> probably just be hardcoded in the call to allocate_resource.
>=20
> What do you think?
>=20
> > Your size calculation looks correct and indeed makes my 1024x600 +
> > 1920x1080 setup actually display something, but for some reason I get
> > an incorrect panning on the smaller screen and stale data on the
> > surface only visible by the larger CRTC. Any idea what's going on?
>=20
> I'm not seeing this immediately, but I definitely have something strange
> after having printed more lines than the smallest display can handle or
> scrolling, where more than the actual size of the fb is used.
>=20
> Maybe this is related to using the PowerVR-accelerated fb ops, that aren't
> quite ready for this use case?
>=20
> I'll give it a try with psbfb_roll_ops and psbfb_unaccel_ops instead to s=
ee
> if it changes something for me. Maybe it would help for you too?

Some quick feedback about that:
- psbfb_unaccel_ops gives a correct result where the scrolling area is bound
  to the smallest display;
- psbfb_roll_ops gives a working scrolling but bound to the largest display
  (so the current shell line becomes invisible on the smallest one eventual=
ly);
- psbfb_ops gives the same issue as above and seems to add artifacts on top.

There's probably limited interest in working on that aspect on our side tho=
ugh.
I'd be interested to know if it affects the issue you're seeing though.

Cheers,

Paul

> I suspect that the generic implementation is already bullet-proof for the=
se
> kinds of use case.
>=20
> Cheers and thanks for the feedback,
>=20
> Paul
>=20
> >=20
> > >                  sizes->surface_bpp =3D 16;
> > >                  sizes->surface_depth =3D 16;
> > >          }
> > > --
> > > 2.23.0
> > >
>=20
> --=20
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3K1LQACgkQ3cLmz3+f
v9FCEwf/XEWwxAYDxZCEg77vGI++OJiygsuiXp3KNDxCAdUxBSgECx4fku772WZG
E4j/DBf1RFmUfoBAh9NMtm0+ruWu4SMKCnWKCz4o+Yt15gZocG8T2n/u6gDMQIEj
4ajkRXZ9snM0IDXd5WjmPfktayxETGIs9I3IuMSighuvWUUTrIyUm3kXDQZao10h
MJZvhmCrzUhXG2V1VS+wSdlzFZtLgDbjvk6X7A6SGF2ONFgDIuEK7N3JEzbvFY6a
SOnq1DunTL62uURGJ8Xtio9XN/OycXSXZGrp7C+Bg146gLpSfZqR1FqBrQ1JyW7K
ItMdJAD/rjjcJ61DAagf7H4D9npMwQ==
=6YLs
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--

--===============0902650898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0902650898==--
