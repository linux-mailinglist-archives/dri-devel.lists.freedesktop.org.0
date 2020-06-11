Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516351F6FC0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 00:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621E6E203;
	Thu, 11 Jun 2020 22:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8666E1EC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 22:12:49 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jjVRF-0000vZ-JC; Fri, 12 Jun 2020 00:12:45 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jjVRE-0007M8-Nk; Fri, 12 Jun 2020 00:12:44 +0200
Date: Fri, 12 Jun 2020 00:12:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 03/15] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200611221242.3bjqvnhcwwxaocxy@taurus.defre.kleine-koenig.org>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-4-hdegoede@redhat.com>
 <20200608035023.GZ2428291@smile.fi.intel.com>
 <90769dc0-3174-195b-34e0-ef4bb9d9b982@redhat.com>
MIME-Version: 1.0
In-Reply-To: <90769dc0-3174-195b-34e0-ef4bb9d9b982@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1034206622=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1034206622==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hp7kq6gze6fyafh7"
Content-Disposition: inline


--hp7kq6gze6fyafh7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 01:07:12PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 6/8/20 5:50 AM, Andy Shevchenko wrote:
> > On Sun, Jun 07, 2020 at 08:18:28PM +0200, Hans de Goede wrote:
> > > When the user requests a high enough period ns value, then the
> > > calculations in pwm_lpss_prepare() might result in a base_unit value =
of 0.
> > >=20
> > > But according to the data-sheet the way the PWM controller works is t=
hat
> > > each input clock-cycle the base_unit gets added to a N bit counter and
> > > that counter overflowing determines the PWM output frequency. Adding 0
> > > to the counter is a no-op. The data-sheet even explicitly states that
> > > writing 0 to the base_unit bits will result in the PWM outputting a
> > > continuous 0 signal.
> >=20
> > So, and why it's a problem?
>=20
> Lets sya the user requests a PWM output frequency of 100Hz on Cherry Trail
> which has a 19200000 Hz clock this will result in 100 * 65536 / 19200000 =
=3D
> 0.3 -> 0 as base-unit value. So instead of getting 100 Hz the user will
> now get a pin which is always outputting low.

I didn't follow the complete discussion but note that the general rule
is:

	round period down to the next possible implementable period
	round duty_cycle down to the next possible implementable duty_cycle

so if a small enough period (and so a small duty_cycle) is requested it
is expected that duty_cycle will be zero.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hp7kq6gze6fyafh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7irFUACgkQwfwUeK3K
7AnMUQf/aHewf+zp0iswwki725rW1yDFIDBTEXn8BJGshdgTgK7jVxnmeAnp68jL
GrJUDVL2PD9tInqZkJmgQXpXDKJ2hToPm3qePnpFWRKsZX+wxIg5fJ/lOOnDzwYU
xeh6Y5vp2nhtK7e9u+YhN9C77/SqmjOW9hYPuwlFSs5jTxFQZruS8AHnGw+//F5V
KC2HwNoHwfUpiBIiUdITW3ZYHLotXRcqwI0wPZLCuOTIMAEqEWNH6WAtrHGU1BTn
KMmpuHs8Q5Z+hM+pcZGiL09cI4wEhatYCPCFhik1wXOAwwAtxsowNnIpbFgftPFS
e3MUGd4aKKhhexrR4pk5ODSfs2zhzA==
=p0QV
-----END PGP SIGNATURE-----

--hp7kq6gze6fyafh7--

--===============1034206622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1034206622==--
