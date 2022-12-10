Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD1648DDF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 10:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B47810E0A0;
	Sat, 10 Dec 2022 09:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CCC10E0A0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 09:18:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w0K-0003KC-Jh; Sat, 10 Dec 2022 10:18:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w0G-003YBp-5Q; Sat, 10 Dec 2022 10:18:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3w0G-003yU4-Bx; Sat, 10 Dec 2022 10:18:40 +0100
Date: Sat, 10 Dec 2022 10:18:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nuqt3gnghpavk6fz"
Content-Disposition: inline
In-Reply-To: <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
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
Cc: linux-pwm@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nuqt3gnghpavk6fz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > In v1 Thierry had the concern:
> >=20
> > | That raises the question about what to do in these cases. If we return
> > | an error, that could potentially throw off consumers. So perhaps the
> > | closest would be to return a disabled PWM? Or perhaps it'd be up to t=
he
> > | consumer to provide some fallback configuration for invalidly configu=
red
> > | or unconfigured PWMs.
> >=20
> > .get_state() is only called in pwm_device_request on a pwm_state that a
> > consumer might see. Before my series a consumer might have seen a
> > partial modified pwm_state (because .get_state() might have modified
> > .period, then stumbled and returned silently). The last patch ensures
> > that this partial modification isn't given out to the consumer. Instead
> > they now see the same as if .get_state wasn't implemented at all.
>=20
> I'm wondering why we didn't see a compiler warning about mistyped function
> prototypes in some drivers.

I don't understand where you expected a warning. Care to elaborate?

> P.S. The series is good thing to do, thank you.

It's already too late for an ack, the series is already in Thierry's
tree.

Best regards
Uwe
=20
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nuqt3gnghpavk6fz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOUTt4ACgkQwfwUeK3K
7Amt4gf/VCswPgVD5w7pUM72SEpdjhw28hm2YCuu5RxYMTBVbGTdK9rYJjqmB2FI
ZOQHPgl36sDWhZEM55FY6oZxaGM3XttrjoTnFSk0MuNQmO70aWJtkS+OVmR4UgiR
vIXRy8KMRWEliVRK4dWubiXzQ3OZl1iEDzgc9c7bccEtcdABRG+Z0zLWDCiT8WMw
OzDx+FLvT792TNn4oEHONO3lJVeZ64MdM0VPguFtzbArXlpaJlQhlfhxYnvVxR1o
LkxC6uB5mWT1o1f3+yzw9GD0RJwspghVALqO+g7LoH0oinRso2oaExRDKS5Yt69Z
bmJURLsdOOyquJFcb6f1NqrKVb8fUw==
=nBk6
-----END PGP SIGNATURE-----

--nuqt3gnghpavk6fz--
