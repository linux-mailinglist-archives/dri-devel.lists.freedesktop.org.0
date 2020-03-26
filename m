Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234CF194AA6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436106E946;
	Thu, 26 Mar 2020 21:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F466E200
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 17:36:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6691AF40;
 Thu, 26 Mar 2020 17:36:23 +0000 (UTC)
Message-ID: <486b5c63e5b9bd81051500c0c310e68af16956c4.camel@suse.de>
Subject: Re: [PATCH] drm/vc4: Fix HDMI mode validation
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 26 Mar 2020 18:36:20 +0100
In-Reply-To: <c4b3e083-ac6e-b321-f0eb-f20e8ec3b1a6@i2se.com>
References: <20200326122001.22215-1-nsaenzjulienne@suse.de>
 <c4b3e083-ac6e-b321-f0eb-f20e8ec3b1a6@i2se.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: f.fainelli@gmail.com, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1594440992=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1594440992==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WLjDMV1ZcTszpN+SQxBm"


--=-WLjDMV1ZcTszpN+SQxBm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-26 at 18:19 +0100, Stefan Wahren wrote:
> Am 26.03.20 um 13:20 schrieb Nicolas Saenz Julienne:
> > Current mode validation impedes setting up some video modes which shoul=
d
> > be supported otherwise. Namely 1920x1200@60Hz.
> >=20
> > Fix this by lowering the minimum HDMI state machine clock to pixel cloc=
k
> > ratio allowed.
> >=20
> > Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clock=
s")
> > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index cea18dc15f77..340719238753 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -681,11 +681,23 @@ static enum drm_mode_status
> >  vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
> >  			    const struct drm_display_mode *mode)
> >  {
> > -	/* HSM clock must be 108% of the pixel clock.  Additionally,
> > -	 * the AXI clock needs to be at least 25% of pixel clock, but
> > -	 * HSM ends up being the limiting factor.
> > +	/*
> > +	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock mu=
st
> > +	 * be faster than pixel clock, infinitesimally faster, tested in
> > +	 * simulation. Otherwise, exact value is unimportant for HDMI
> > +	 * operation." This conflicts with bcm2835's vc4 documentation, which
> > +	 * states HSM's clock has to be at least 108% of the pixel clock.
> > +	 *
> > +	 * Real life tests reveal that vc4's firmware statement holds up, and
> > +	 * users are able to use pixel clocks closer to HSM's, namely for
> > +	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin betwee=
n
> > +	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
>=20
> s/RPi0-3/bcm2835/ ?

Well as Dave Stevenson stated on the previous thread[1], it's the firmware =
that
sets up the HSM limitation. IIUC technically both HSM and pixel clocks coul=
d be
increased. Hence this being more of a RPi limitation than the chip itself.

"Whilst the firmware would appear to use a fixed HSM clock on Pi0-3, I
don't anticipate there being any issue with varying it. It looks like
there was the expectation of it being variable in the past, but
someone has refactored it and either accidentally or deliberately
given up on the idea."

Regards,
Nicolas

[1] https://www.spinics.net/lists/arm-kernel/msg794591.html


--=-WLjDMV1ZcTszpN+SQxBm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl586BQACgkQlfZmHno8
x/7xnQf6AuxYHKRPr2+3HAcUcMvGEUsg4+CG33ixIOsZSzYB4i53R8AaNPUXuT49
DgINWf1HDprPNcucqW0YHLK1MuOHLr037rJaEi8U7niiYwf1NhCowZarMRZsdng0
uDBenGjN+AfeI303kAU/U5oPK+5R013lkXTpi+KKGeAmdsg0cWCnCXvQj4eA2PrT
MJ67v2ageDmRvuA/OJ+N2+tpz7raOs08ErzH5kYW8OUIllpTpIQSNr8Vn1JJZgF9
FjyvhPl4PNuNaUaTQm/Hi+TMH3tW51q5q9ZWPkBikHpyGmUbIaEBqNV0ZEuDAXDR
LUhSe29/+lSxhq7Hvo7FH29Yz183Tw==
=RSrf
-----END PGP SIGNATURE-----

--=-WLjDMV1ZcTszpN+SQxBm--


--===============1594440992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1594440992==--

