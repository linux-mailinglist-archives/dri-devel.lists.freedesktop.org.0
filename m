Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EE81F6F5E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 23:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415FB6E0B9;
	Thu, 11 Jun 2020 21:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AE06E0B9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 21:21:57 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jjUdw-00059a-EA; Thu, 11 Jun 2020 23:21:48 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jjUdu-0005Y0-VA; Thu, 11 Jun 2020 23:21:46 +0200
Date: Thu, 11 Jun 2020 23:21:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: pwm/i915: Convert pwm-crc and i915 driver's PWM code to use the
 atomic PWM API
Message-ID: <20200611212144.i7ma7kriznidds4r@taurus.defre.kleine-koenig.org>
References: <20200606202601.48410-1-hdegoede@redhat.com>
 <20200608143500.GX20149@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20200608143500.GX20149@phenom.ffwll.local>
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1461634707=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1461634707==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="um757tuptzwklztk"
Content-Disposition: inline


--um757tuptzwklztk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jun 08, 2020 at 04:35:00PM +0200, Daniel Vetter wrote:
> On Sat, Jun 06, 2020 at 10:25:45PM +0200, Hans de Goede wrote:
> > Hi All,
> >=20
> > This patch series converts the i915 driver's cpde for controlling the
> > panel's backlight with an external PWM controller to use the atomic PWM=
 API.
> >=20
> > Initially the plan was for this series to consist of 2 parts:
> > 1. convert the pwm-crc driver to support the atomic PWM API and
> > 2. convert the i915 driver's PWM code to use the atomic PWM API.
> >=20
> > But during testing I've found a number of bugs in the pwm-lpss and I
> > found that the acpi_lpss code needs some special handling because of
> > some ugliness found in most Cherry Trail DSDTs.
> >=20
> > So now this series has grown somewhat large and consists of 4 parts:
> >=20
> > 1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
> > 2. various fixes to the pwm-lpss driver
> > 3. convert the pwm-crc driver to support the atomic PWM API and
> > 4. convert the i915 driver's PWM code to use the atomic PWM API
> >=20
> > So we need to discuss how to merge this (once it passes review).
> > Although the inter-dependencies are only runtime I still think we should
> > make sure that 1-3 are in the drm-intel-next-queued (dinq) tree before
> > merging the i915 changes. Both to make sure that the intel-gfx CI system
> > does not become unhappy and for bisecting reasons.
>=20
> Simplest is if acpi acks the acpi patches for merging through
> drm-intel.git. Second simplest is topic branch (drm-intel maintainers can
> do that) with the entire pile, which then acpi and drm-intel can both pull
> in.
>=20
> Up to the two maintainer teams to figure this one out.

I'm unclear about the dependencies, but the changes to drivers/pwm need
an ack (or processing) by the PWM team.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--um757tuptzwklztk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7ioGMACgkQwfwUeK3K
7AlrPAgAhUE8d3GvXZoHPrmKHb+cPda0ce2u02QUj6/2tkjY86coGILKhleJhJto
l/tBpJjC6ORuFRJDNIrCP3DYu+2f3kfMLlp3X5GoJqTmEoAcXaeuXYZuq+2KlFtX
u+MVZnZYUjC1QvmNJTsW5j0pVbJB18J9xucYNK6TotZ6mnwg1bWOtrLq7ON6MXId
W+LUiIrn7/foJGKHxkQeE6HuVMdvTk5RlCad3aGMerLSbgRQx9ylzvEn8u53Gfwb
k94wKTmTgOGR0UnNl2Ae5scWRTPO3msjWBhQfGyKts0jwqVErqEqjv147CpClfn6
bTOWIyzvJtnUmQav97PQpgvygfujbg==
=95k0
-----END PGP SIGNATURE-----

--um757tuptzwklztk--

--===============1461634707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1461634707==--
