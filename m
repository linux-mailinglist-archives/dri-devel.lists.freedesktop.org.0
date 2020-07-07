Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B222177A0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 21:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F386E199;
	Tue,  7 Jul 2020 19:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E2E6E220
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 19:10:02 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jssya-0001Y5-Ds; Tue, 07 Jul 2020 21:09:56 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jssyZ-00083M-IF; Tue, 07 Jul 2020 21:09:55 +0200
Date: Tue, 7 Jul 2020 21:09:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 04/15] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200707190955.e7wzmphdgi5reeyg@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-5-hdegoede@redhat.com>
 <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
 <e07a7dd6-c361-32b8-c4e7-91e022f9c21d@redhat.com>
 <20200707073424.w6vd6e4bhl56kosd@pengutronix.de>
 <1496178b-ce39-9285-ff75-cd39bc0e9aa7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1496178b-ce39-9285-ff75-cd39bc0e9aa7@redhat.com>
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
 kernel@pengutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1053477771=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1053477771==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7plpv6eju6vsnduo"
Content-Disposition: inline


--7plpv6eju6vsnduo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hans,

On Tue, Jul 07, 2020 at 07:31:29PM +0200, Hans de Goede wrote:
> On 7/7/20 9:34 AM, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jul 06, 2020 at 10:53:08PM +0200, Hans de Goede wrote:
> > > But if we do then I think closest to the truth would be:
> > >=20
> > > state->period     =3D UINT_MAX;
> > > state->duty_cycle =3D 0;
> >=20
> > I'd say state->period =3D 1 & state->duty_cycle =3D 0 is a better
> > representation.
>=20
> But that would suggest the output is configured for an
> infinitely high output frequency, but the frequency is
> actually 0, the reason why get_state needs to treat a
> base_unit val of 0 special at all is to avoid a division
> by 0, and in math dividing by 0 gives infinite, isn't
> UINT_MAX a better way to represent infinity ?

Given that duty_cycle is 0, how can to tell anything about the period
when only seeing the signal (=3D a constant low)?

Given that (ideally) a period is completed when pwm_apply_state() is
called, a short period is much more sensible.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7plpv6eju6vsnduo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8EyIAACgkQwfwUeK3K
7Ambpgf+OJ0vfCZ750TsxFAYyk4uk7rXKWCSqHpltV8Pe7x4Mr2iu+tbdOiznRX9
ynS7zwePeRY1gwvSL31SrekGtm+JNGgLCvq2Dz/9xhHXA3W3wKFw3SO8am+MhT3R
Y9MDsdHpxTBh0AjbN1daU/7BNP+hTsWnTkJVTiSXu38aaj7heo5gpCB0R7OQ2D3j
9JCQOIMXKfnwSojxgXqOyjs5Pq2CbI8EXhgrQzkCObHFMQI9mNsq+pDsNqHAR/KJ
McCWW0NQOASKTyTD30+7VanXhcX3Mo462MoVWK2n+HsAkIZmwiTYs3L0+MiJvBSQ
A320+clEqiXwb25gfgV2LmabdrQA6w==
=Ac4Q
-----END PGP SIGNATURE-----

--7plpv6eju6vsnduo--

--===============1053477771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1053477771==--
