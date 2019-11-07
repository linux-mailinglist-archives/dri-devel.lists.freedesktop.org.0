Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE9F316B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A6A6EBC4;
	Thu,  7 Nov 2019 14:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FD36EBC4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 14:29:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C6C9C3ACCFB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 14:18:08 +0000 (UTC)
X-Originating-IP: 86.206.246.123
Received: from aptenodytes (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr
 [86.206.246.123])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A33A624001B;
 Thu,  7 Nov 2019 14:17:44 +0000 (UTC)
Date: Thu, 7 Nov 2019 15:17:44 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH 1/2] drm/gma500: Add missing call to allow enabling
 vblank on psb/cdv
Message-ID: <20191107141744.GB670369@aptenodytes>
References: <20191106094400.445834-1-paul.kocialkowski@bootlin.com>
 <20191106094400.445834-2-paul.kocialkowski@bootlin.com>
 <CAMeQTsa+tYWAA5vkChqDvEiFmbjFzNp804fD6J4GfLgHUBho9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeQTsa+tYWAA5vkChqDvEiFmbjFzNp804fD6J4GfLgHUBho9g@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1610842464=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1610842464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 06 Nov 19, 16:23, Patrik Jakobsson wrote:
> On Wed, Nov 6, 2019 at 10:44 AM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > This adds a missing call to drm_crtc_vblank_on to the common DPMS helper
> > (used by poulsbo and cedartrail), which is called in the CRTC enable pa=
th.
> >
> > With that call, it becomes possible to enable vblank when needed.
> > It is already balanced by a drm_crtc_vblank_off call in the helper.
> >
> > Other platforms (oaktrail and medfield) use a dedicated DPMS helper that
> > does not have the proper vblank on/off hooks. They are not added in this
> > commit due to lack of hardware to test it with.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Don't think we ever found a need for having vblanks enabled... until
> now. I'll have a look if something can be done for Oaktrail since I
> have hw.

Neat, thanks!

IIRC the DPMS paths that don't use gma_crtc_dpms also lack the proper
drm_crtc_vblank_on/off calls so that's probably something to start with :)

Thanks for the review on these patches. I may have more fixes coming up.

Cheers,

Paul

> Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>=20
> > ---
> >  drivers/gpu/drm/gma500/gma_display.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma=
500/gma_display.c
> > index e20ccb5d10fd..bc07ae2a9a1d 100644
> > --- a/drivers/gpu/drm/gma500/gma_display.c
> > +++ b/drivers/gpu/drm/gma500/gma_display.c
> > @@ -255,6 +255,8 @@ void gma_crtc_dpms(struct drm_crtc *crtc, int mode)
> >                 /* Give the overlay scaler a chance to enable
> >                  * if it's on this pipe */
> >                 /* psb_intel_crtc_dpms_video(crtc, true); TODO */
> > +
> > +               drm_crtc_vblank_on(crtc);
> >                 break;
> >         case DRM_MODE_DPMS_OFF:
> >                 if (!gma_crtc->active)
> > --
> > 2.23.0
> >

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3EJ4gACgkQ3cLmz3+f
v9GwJQf/QwXxGs4rMmGo6OEb5ANamqku11L7Y9q7skGBuOlJkiiOmnYbJnCZdlv3
n4MCuPA58PX+w7tWIiOFS5MW1mb5YPE2Lg6Sjf5uTozOP+L+DGd8XLXNeXxJEzqU
RctwrXzJDYqvq373QrGhoiU1VpExNj7VmODMAdDV3q8VVwxrTn0iPBIKiK5fbWcj
E6VYKx7QQi2dpwgQSRrWikfERDWKJ2kUYmYv08cx2fYO0imp20N0H8mbXENx0zVY
FjPJYkRi2A7VZ7GbYkxtCMbYvLs1nasK8lIFl8r87b+Q6AOOfraWEqj95yzbcjOp
DCLAxU8JQmCTY3D1jNRh48GnwWU28g==
=Oy6L
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--

--===============1610842464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1610842464==--
