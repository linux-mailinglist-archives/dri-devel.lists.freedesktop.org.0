Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B866477F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 18:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D9C10E62D;
	Tue, 10 Jan 2023 17:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E425410E630
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 17:35:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFIWc-0006kH-0O; Tue, 10 Jan 2023 18:35:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFIWb-0057tX-8X; Tue, 10 Jan 2023 18:35:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFIWa-00BlM4-Ff; Tue, 10 Jan 2023 18:35:00 +0100
Date: Tue, 10 Jan 2023 18:35:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 2/2] backlight: pwm_bl: Don't disable the PWM to disable
 the backlight
Message-ID: <20230110173500.7w55deshspedexh6@pengutronix.de>
References: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
 <20230109204758.610400-2-u.kleine-koenig@pengutronix.de>
 <Y72RpjK4T2VEoIVI@aspen.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="plxtmce4zw6rhhzf"
Content-Disposition: inline
In-Reply-To: <Y72RpjK4T2VEoIVI@aspen.lan>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--plxtmce4zw6rhhzf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

On Tue, Jan 10, 2023 at 04:26:14PM +0000, Daniel Thompson wrote:
> On Mon, Jan 09, 2023 at 09:47:58PM +0100, Uwe Kleine-K=F6nig wrote:
> > Most but not all PWMs drive the PWM pin to its inactive state when
> > disabled. Rely on the lowlevel PWM implementation to implement
> > duty_cycle =3D 0 in an energy efficient way and don't disable the PWM.
>=20
> I'm a little worried about this one.
>=20
> I thought the PWM APIs allow the duty cycle to be rounded up or down
> slightly during the apply.

In my book only rounding down is correct, but in practise there is some
deviation.

Nearly all PWMs can implement a zero duty cycle. Those that cannot but
emit a constant inactive signal when disabled are expected to disable
when .duty_cycle =3D 0 is requested. (And for those that can neither
implement a zero duty_cycle nor emit the inactive level (not sure there
is any) all bets are lost with and without my patch.)
So if this case will be hit (and noticed) this is fixable.

However there are hardware PWMs that just freeze in their current state
when disabled (e.g. mxs). That's why .duty_cycle=3D0 + .enabled=3Dtrue is
the safer bet. Only disable a PWM if you don't rely on the output state.
See also commit 80a22fde803af6f390be49ee5ced6ee75595ba05.

> So when you say "rely on the lowlevel to implement duty_cycle =3D 0 to..."
> is it confirmed that this is true (and that all PWMs *can* implement
> a duty_cycle of 0 without rounding up)?

The scenario I had in mind that can realistically go wrong here is that
a lowlevel driver that has the property that the inactive level is
emitted for a disabled HW doesn't actually disable when .duty_cycle=3D0 is
requested and so might consume slightly more energy. But I'm confident
my patch is an improvement and I don't expect regressions. (Famous last
words :-)

I suggest to amend the commit log and add something like:

   If this change results in a regression, the bug is in the lowlevel
   pwm driver.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--plxtmce4zw6rhhzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO9ocEACgkQwfwUeK3K
7AnyEAf/QabZhGNeI1++mvRylnepXHLzeloxrGPMp/8KuYxsOt+mMZqraFunTjV7
uJMo+8oMGcLuPBd9h0xLFknVWtV0Bq8aGnGq5aUeHTlsJV2D55hgZ+nm/s76U8cJ
o1Lifl/Jeq69ok+T72KwZ6Y2uUJZOtM61DWLcmF6Qw1f5oFOkgo3cjWRY6HI9HRS
Lsx6e/PSdA/C0N8asujO7KV4wCVarlJ08NjyZCXHf0q97odg93MC5k/HagrkKUUl
TjbtJJAH2bfdmT93faGM3m8JTuqztspyb+KYJz4RCmUjz9N1pZJhDCQU9RVOUr08
EtwKHLdNiI/n2jyYGaRW1bKOD89ZaQ==
=yHOq
-----END PGP SIGNATURE-----

--plxtmce4zw6rhhzf--
