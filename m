Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA925216788
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924C289B0D;
	Tue,  7 Jul 2020 07:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1889B0D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 07:34:29 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jsi7V-00081N-40; Tue, 07 Jul 2020 09:34:25 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jsi7U-0007tr-Ev; Tue, 07 Jul 2020 09:34:24 +0200
Date: Tue, 7 Jul 2020 09:34:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 04/15] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200707073424.w6vd6e4bhl56kosd@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-5-hdegoede@redhat.com>
 <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
 <e07a7dd6-c361-32b8-c4e7-91e022f9c21d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e07a7dd6-c361-32b8-c4e7-91e022f9c21d@redhat.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1695639730=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1695639730==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qd3xbyefs3wivnic"
Content-Disposition: inline


--qd3xbyefs3wivnic
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2020 at 10:53:08PM +0200, Hans de Goede wrote:
> Hi,
>=20
> Thank you for your review and sorry for the slow reply.

No problem for me, I didn't hold my breath :-)
=20
> > > diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
> > > index 43b1fc634af1..80d0f9c64f9d 100644
> > > --- a/drivers/pwm/pwm-lpss.c
> > > +++ b/drivers/pwm/pwm-lpss.c
> > > @@ -97,6 +97,9 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *=
lpwm, struct pwm_device *pwm,
> > >   	freq *=3D base_unit_range;
> > >   	base_unit =3D DIV_ROUND_CLOSEST_ULL(freq, c);
> >=20
> > DIV_ROUND_CLOSEST_ULL is most probably wrong, too. But I didn't spend
> > the time to actually confirm that.
>=20
> Yes I saw your comment elsewhere that the PWM API defines rounding
> in a certain direction, but fixing that falls outside of this patch.

Yeah, sure.

> [...]
> I hope this helps to explain what is going on a bit.

I will try to make sense of that and reply to the patch directly when I
succeeded.

> ###
>=20
> As for the behavior on base_unit=3D=3D0 in the get_state method,
> as mentioned above I wrote that when I did not fully understood
> how the controller works.
>=20
> We really should never encounter this.
>=20
> But if we do then I think closest to the truth would be:
>=20
> state->period     =3D UINT_MAX;
> state->duty_cycle =3D 0;

I'd say state->period =3D 1 & state->duty_cycle =3D 0 is a better
representation.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qd3xbyefs3wivnic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8EJX0ACgkQwfwUeK3K
7AmI0gf9HG7/YBOsiIEPcU3M+eOUVXk1sW7CBIb3I5sPHqAGlNsRoSfjS2gzIiPR
mgzcKErOOiHzpcE7wEkm/zGs2OpjYfJ60lMRZnxYbjGRisCSZlbJADDCP58jEDy3
u+Xnr3j5mP8QY3JlbrmcjazWjb/eP+ibacoEMqz0KvbqefTo4pu0d9qX6GrZLg/P
tbJ6A6vh+lOcg4vmDEubkCMgId65pejF5NNg9dYICprAx8Q2CkClI1JsrjJIMkCu
ElgwyPj4TG+Ihn6ubWPePdIygNlKulT8hzFJCyzKTh7mIOwlCmeQgwcoMlGS6tz8
DKY/3Q1sSmEHbsMHSnoe/XiELkUsiw==
=VCT7
-----END PGP SIGNATURE-----

--qd3xbyefs3wivnic--

--===============1695639730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1695639730==--
