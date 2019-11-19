Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7475102681
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6796E30C;
	Tue, 19 Nov 2019 14:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7A26E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:22:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 4655C3B4AEE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:12:15 +0000 (UTC)
X-Originating-IP: 86.206.246.123
Received: from aptenodytes (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr
 [86.206.246.123])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 069CF2001E;
 Tue, 19 Nov 2019 14:11:51 +0000 (UTC)
Date: Tue, 19 Nov 2019 15:11:51 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH] drm/gma500: Fixup fbdev stolen size usage evaluation
Message-ID: <20191119141151.GB2001@aptenodytes>
References: <20191107153048.843881-1-paul.kocialkowski@bootlin.com>
 <CAMeQTsYG+YvXqQqvJvsxT1h0z5zZJbdCtc5wPjUossvwidV=cA@mail.gmail.com>
 <20191112151157.GD4506@aptenodytes>
 <20191112155012.GE4506@aptenodytes>
 <CAMeQTsb0+Tc9Gij_1zMH=mPSbDAjMkMEFatvZrfjLvVsQGwVgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeQTsb0+Tc9Gij_1zMH=mPSbDAjMkMEFatvZrfjLvVsQGwVgA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1554012102=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1554012102==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 13 Nov 19, 11:04, Patrik Jakobsson wrote:
> On Tue, Nov 12, 2019 at 4:50 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi,
> >
> > On Tue 12 Nov 19, 16:11, Paul Kocialkowski wrote:
> > > Hi,
> > >
> > > On Tue 12 Nov 19, 11:20, Patrik Jakobsson wrote:
> > > > On Thu, Nov 7, 2019 at 4:30 PM Paul Kocialkowski
> > > > <paul.kocialkowski@bootlin.com> wrote:
> > > > >
> > > > > psbfb_probe performs an evaluation of the required size from the =
stolen
> > > > > GTT memory, but gets it wrong in two distinct ways:
> > > > > - The resulting size must be page-size-aligned;
> > > > > - The size to allocate is derived from the surface dimensions, no=
t the fb
> > > > >   dimensions.
> > > > >
> > > > > When two connectors are connected with different modes, the small=
est will
> > > > > be stored in the fb dimensions, but the size that needs to be all=
ocated must
> > > > > match the largest (surface) dimensions. This is what is used in t=
he actual
> > > > > allocation code.
> > > > >
> > > > > Fix this by correcting the evaluation to conform to the two point=
s above.
> > > > > It allows correctly switching to 16bpp when one connector is e.g.=
 1920x1080
> > > > > and the other is 1024x768.
> > > > >
> > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > ---
> > > > >  drivers/gpu/drm/gma500/framebuffer.c | 8 ++++++--
> > > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/d=
rm/gma500/framebuffer.c
> > > > > index 218f3bb15276..90237abee088 100644
> > > > > --- a/drivers/gpu/drm/gma500/framebuffer.c
> > > > > +++ b/drivers/gpu/drm/gma500/framebuffer.c
> > > > > @@ -462,6 +462,7 @@ static int psbfb_probe(struct drm_fb_helper *=
helper,
> > > > >                 container_of(helper, struct psb_fbdev, psb_fb_hel=
per);
> > > > >         struct drm_device *dev =3D psb_fbdev->psb_fb_helper.dev;
> > > > >         struct drm_psb_private *dev_priv =3D dev->dev_private;
> > > > > +       unsigned int fb_size;
> > > > >         int bytespp;
> > > > >
> > > > >         bytespp =3D sizes->surface_bpp / 8;
> > > > > @@ -471,8 +472,11 @@ static int psbfb_probe(struct drm_fb_helper =
*helper,
> > > > >         /* If the mode will not fit in 32bit then switch to 16bit=
 to get
> > > > >            a console on full resolution. The X mode setting serve=
r will
> > > > >            allocate its own 32bit GEM framebuffer */
> > > > > -       if (ALIGN(sizes->fb_width * bytespp, 64) * sizes->fb_heig=
ht >
> > > > > -                       dev_priv->vram_stolen_size) {
> > > > > +       fb_size =3D ALIGN(sizes->surface_width * bytespp, 64) *
> > > > > +                 sizes->surface_height;
> > > > > +       fb_size =3D ALIGN(fb_size, PAGE_SIZE);
> > > > > +
> > > > > +       if (fb_size > dev_priv->vram_stolen_size) {
> > > >
> > > > psb_gtt_alloc_range() already aligns by PAGE_SIZE for us. Looks like
> > > > we align a couple of times extra for luck. This needs cleaning up
> > > > instead of adding even more aligns.
> > >
> > > I'm not sure this is really for luck. As far as I can see, we need to=
 do it
> > > properly for this size estimation since it's the final size that will=
 be
> > > allocated (and thus needs to be available in whole).
>=20
> Ok now I understand what you meant. Actually vram_stolen_size is
> always page aligned so fb_size doesn't need any page alignment here.

I'm a bit confused here, what about the case where:
unaligned fb_size < dev_priv->vram_stolen_size but
aligned fb_size > dev_priv->vram_stolen_size ?

Granted, it's a corner case, but I don't follow the logic of comparing alig=
ned
and unaligned sizes: it feels a bit like comparing two values of different
units.

> There is also no need to align for psbfb_create() since it also takes
> care of this.
>=20
> > >
> > > For the other times there is explicit alignment, they seem justified =
too:
> > > - in psb_gem_create: it is common to pass the aligned size when creat=
ing the
> > >   associated GEM object with drm_gem_object_init, even though it's pr=
obably not
> > >   crucial given that this is not where allocation actually happens;
> > > - in psbfb_create: the full size is apparently only really used to me=
mset 0
> > >   the allocated buffer. I think this makes sense for security reasons=
 (and not
> > >   leak previous contents in the additional space required for alignme=
nt).
>=20
> What I would prefer is to have a single place where the alignment is
> made so any hardware requirements would be transparent to the rest of
> the code.

Mhh, I thought that psbfb_create needs to be aware of the alignment in the
form of the pitch_lines variable to decide which 2d accel method can be use=
d or
not (depending on associated alignment requirements). I guess this makes for
another reason to ditch the accelerated 2d accel support.

> Best would be if alignment is only made in psb_gtt_alloc_range() and
> then store the actual size in struct gtt_range. That way we can just
> pass along that value to memset() and drm_gem_object_init() without
> caring about how it is adjusted.
>=20
> > >
> > > What strikes me however is that each call to psb_gtt_alloc_range take=
s the
> > > alignment as a parameter when it's really always PAGE_SIZE, so it sho=
uld
> > > probably just be hardcoded in the call to allocate_resource.
>=20
> This is a remnant from trying to add support for 2D and/or overlay
> planes (don't really remember). Doesn't matter if it stays or goes
> away.
>=20
> > >
> > > What do you think?
>=20
> I suppose most of this is outside the scope of what you're trying to
> do so we can just leave it as is and I can clean it up later.

I guess my main change here was to switch from sizes->fb_width/height to
sizes->surface_width/height anyway, yes. I can totally live without the
final PAGE_SIZE align for fb_size too (even though I think it makes sense).

Feel free to let me know what you'd like to receive as a v2 here and I'll do
that :)

> > >
> > > > Your size calculation looks correct and indeed makes my 1024x600 +
> > > > 1920x1080 setup actually display something, but for some reason I g=
et
> > > > an incorrect panning on the smaller screen and stale data on the
> > > > surface only visible by the larger CRTC. Any idea what's going on?
> > >
> > > I'm not seeing this immediately, but I definitely have something stra=
nge
> > > after having printed more lines than the smallest display can handle =
or
> > > scrolling, where more than the actual size of the fb is used.
> > >
> > > Maybe this is related to using the PowerVR-accelerated fb ops, that a=
ren't
> > > quite ready for this use case?
> > >
> > > I'll give it a try with psbfb_roll_ops and psbfb_unaccel_ops instead =
to see
> > > if it changes something for me. Maybe it would help for you too?
> >
> > Some quick feedback about that:
> > - psbfb_unaccel_ops gives a correct result where the scrolling area is =
bound
> >   to the smallest display;
>=20
> Yes, this also works correctly for me.
>=20
> > - psbfb_roll_ops gives a working scrolling but bound to the largest dis=
play
> >   (so the current shell line becomes invisible on the smallest one even=
tually);
>=20
> It's not panning at all for me. I never really found gtt rolling to be
> useful. It's a neat trick but I didn't have a problem with console
> scrolling speed to begin with. I might just remove it.

Yeah, I also don't understand what the hype of accelerating fbdev ops is ab=
out.
I guess it could have been useful back when there were serious users of fbd=
ev in
userspace (aka directfb) but that's not really where things are going today.
For console usage, I also find the software method fast enough.

> > - psbfb_ops gives the same issue as above and seems to add artifacts on=
 top.
>=20
> Did you try this on CDV? There's only 2D acceleration on Poulsbo and Oakt=
rail.

I tried this one on Poulsbo (the other gma500 platform I have around).

> >
> > There's probably limited interest in working on that aspect on our side=
 though.
> > I'd be interested to know if it affects the issue you're seeing though.
>=20
> Focus on your requirements and I'll look at the rest.

Sounds good to me, thanks a lot! I'll do according to what you'd like for a=
 v2.

Cheers,

Paul

> -Patrik
>=20
> >
> > Cheers,
> >
> > Paul
> >
> > > I suspect that the generic implementation is already bullet-proof for=
 these
> > > kinds of use case.
> > >
> > > Cheers and thanks for the feedback,
> > >
> > > Paul
> > >
> > > >
> > > > >                  sizes->surface_bpp =3D 16;
> > > > >                  sizes->surface_depth =3D 16;
> > > > >          }
> > > > > --
> > > > > 2.23.0
> > > > >
> > >
> > > --
> > > Paul Kocialkowski, Bootlin
> > > Embedded Linux and kernel engineering
> > > https://bootlin.com
> >
> >
> >
> > --
> > Paul Kocialkowski, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3T+CcACgkQ3cLmz3+f
v9GsNAf+MBPTP0JagiRtHK/vSkT+9jkSRuPhedDQhFNolghWPXL4cCItsheQPgQX
mWRT1sNJvjvNW4CZ/wOdG0vHHOHPEc+AgUjgO2Ytelk5B06rYZ9DMSFGVb36NOz+
+RmNyalQXX7BTkURzDHOKxzgm9L4rjc20BhtbRKzps6nlfgwxaIbupi4M3SrKSEg
243H+T3pp2M4Jw6TDSkhtiijJGlTuDl2GTii8mjC9WRd1z+lG/FFBRr8i/KXv61j
AEEJRZTA5tvVzHeBDcSMbEQcZf9AkyB8oyXY0S/g1iCeXsvI1/+IXNZsYRomCyOV
SxQ+jn8vAtRvWYJW5WfUllbWQmVmQQ==
=aKYq
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--

--===============1554012102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1554012102==--
