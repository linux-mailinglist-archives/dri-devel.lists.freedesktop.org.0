Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC721C280
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 08:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0346E0CD;
	Sat, 11 Jul 2020 06:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16206E0CD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 06:19:11 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ju8qk-0004uC-FP; Sat, 11 Jul 2020 08:19:02 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1ju8qj-0004v7-50; Sat, 11 Jul 2020 08:19:01 +0200
Date: Sat, 11 Jul 2020 08:19:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 00/15] acpi/pwm/i915: Convert pwm-crc and i915
 driver's PWM code to use the atomic PWM API
Message-ID: <20200711061901.njwx3xofo4awcflg@pengutronix.de>
References: <20200708211432.28612-1-hdegoede@redhat.com>
 <20200709141407.GA226971@ravnborg.org>
 <fb370663-9efe-a820-2e57-d43d3af7828c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb370663-9efe-a820-2e57-d43d3af7828c@redhat.com>
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
Cc: linux-pwm@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1174799479=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1174799479==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nypanwwsq5jw6gz2"
Content-Disposition: inline


--nypanwwsq5jw6gz2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, Jul 09, 2020 at 04:40:56PM +0200, Hans de Goede wrote:
> On 7/9/20 4:14 PM, Sam Ravnborg wrote:
> > On Wed, Jul 08, 2020 at 11:14:16PM +0200, Hans de Goede wrote:
> > > Here is v4 of my patch series converting the i915 driver's code for
> > > controlling the panel's backlight with an external PWM controller to
> > > use the atomic PWM API. See below for the changelog.
> >=20
> > Why is it that i915 cannot use the pwm_bl driver for backlight?
> > I have not studied the code - just wondering.
>=20
> The intel_panel.c code deals with 7 different types of PWM controllers
> which are built into the GPU + support for external PWM controllers
> through the kernel's PWM subsystem.
>=20
> pwm_bl will work for the external PWM controller case, but not for
> the others. On top of that the intel_panel code integrates which
> the video BIOS, getting things like frequency, minimum value
> and if the range is inverted (0% duty =3D=3D backlight brightness max).
> I'm not even sure if pwm_bl supports all of this, but even if it
> does the intel_panel code handles this in a unified manner for
> all supported PWM controllers, including the ones which are
> an integral part of the GPU.

pwm_bl handles inverted PWM just fine. I'm unsure what "integrates which
the video BIOS" means, but I don't see how "handling 7 different types
of PWM controllers explicitly and others using the PWM API" can be seen
as "unified manner" compared to "provide a pwm driver for whatever might
be in the GPU and then use generic code (PWM API, pwm_bl) to drive it".

Maybe I'm not understanding some involved complexity here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nypanwwsq5jw6gz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8JWdEACgkQwfwUeK3K
7AnPNAf+MKmUG9Hx1mJmN2GjjMQrjge/K+GBb1l7uYqiy1ixtStSudPDHN1cqVfB
/efzIuhjOG13a/TcwBf6FE+2IpqcJzB0fH5lRlki3jIk8LKEKYxd6yESQkdAmf6Q
b3wBrveA8ogMLODq3SG/JWpONSMAZ0Dimi0bJgYIMTi5j5M4k5rloIAi+VbuKf8O
gDxDo2yMtEF3mVyFoClxJ0GYCqShchZLRa7oalK/yD+uJNcAebZN+BWuhwXFpSQM
JG9F4kI7SJvjJzZjwQlWr8RMh4LTdfHB2LlA6i4mEUAgvrB1Rg68sSDV4ZLXCpD4
LRN1sSRmYdYmK2gvSwJ7xIOQYTx+Tg==
=UoeA
-----END PGP SIGNATURE-----

--nypanwwsq5jw6gz2--

--===============1174799479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1174799479==--
