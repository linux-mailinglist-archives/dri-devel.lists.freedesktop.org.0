Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05F6C43CF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9CA10E042;
	Wed, 22 Mar 2023 07:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3A310E042
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 07:04:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pesVo-0007oC-Ef; Wed, 22 Mar 2023 08:03:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pesVm-005rNb-PK; Wed, 22 Mar 2023 08:03:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pesVl-006z71-Sy; Wed, 22 Mar 2023 08:03:53 +0100
Date: Wed, 22 Mar 2023 08:03:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Aisheng Dong <aisheng.dong@nxp.com>
Subject: Regression in deaeeda2051f ("backlight: pwm_bl: Don't rely on a
 disabled PWM emiting inactive state")
Message-ID: <20230322070352.xfwmnqyrao3mifuu@pengutronix.de>
References: <DB9PR04MB84779AF9758B7FE747C6693D80869@DB9PR04MB8477.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="34rk2z2khodqsv3a"
Content-Disposition: inline
In-Reply-To: <DB9PR04MB84779AF9758B7FE747C6693D80869@DB9PR04MB8477.eurprd04.prod.outlook.com>
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--34rk2z2khodqsv3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

hmm, the subject is wrong, this is about commit deaeeda2051f
("backlight: pwm_bl: Don't rely on a disabled PWM emiting inactive
state") and not 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only
once per backlight toggle"). I fixed it accordingly.

On Wed, Mar 22, 2023 at 05:13:24AM +0000, Aisheng Dong wrote:
> It seems this patch changed the behavior of pwm_backlight_suspend a littl=
e bit in
> pwm_backlight_power_off() that pwm state keep unchanged during suspend.
> Then pwm_imx_tpm_suspend() will return -Ebusy due to tpm->enable_count > =
0.
> Was this intended behavior? Should we fix pwm core or the driver?

A I see. The problem is the combination of the following facts:

 - Some PWMs don't emit a constant inactive signal when disabled, so a
   consumer who wants a constant inactive signal must not disable the
   PWM.

 - A used PWM is supposed to be disabled by its consumer on suspend.
   (This is right IMHO because on suspend the PWM is likely to stop
   oscillating and if the consumer requested some output wave form a
   suspend usually stops to adhere to the consumer's request.)

So the options to fix this are (in order of my preference):

 a) Improve the check in the pwm_bl driver when it's safe to disable the
    PWM.

 b) Disable the PWM on suspend in the pwm_bl driver.

 c) If the pwm-imx-tpm's PWM output is configured with duty_cycle =3D 0 and
    is known not to continue driving a constant inactive signal on
    suspend, it might continue to suspend.

I think a) is not possible in general. To determine that: Which machine
do you experience this regression on?

b) is the right one from the PWM framework's POV. If you have a PWM like
pwm-imx27 that might result in the backlight going on on suspend. That's
bad, but compared to the pre-deaeeda2051f state it's still an
improvement (as there the backlight went on on disable *and* suspend).
Depending on the machine the backlight might or might not go off again
later when suspend progresses.

c) isn't that nice because that's an a bit special behaviour and people
who intend to write code that is correct for all PWMs but only have an
pwm-imx-tpm to test might fail to do so.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--34rk2z2khodqsv3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQaqFcACgkQj4D7WH0S
/k5suAgAmpZJvcEqnAqbYWdSB4WE5JEZE786KVSowcw/mmcCDcmRlWJ94Glr7Yei
qBA1qAC8rCJjSgbqgQ0zSZUPdjDdpcCmjO6mTvHGWZjVqQc2PYOBkg3quGBeN/Jl
OTW5SHJUAGrmtxsOM/upc8NhbmgiYTegRM7PCIAhzr/kGCpPmywMJymA6b3aGid6
9xFd67RUs9oE6xVe6t8JDRmby4OGTe1DAxmrlw0wtx8YAozqWWCWgeaYUc7O4icr
5AwoVkRIRk3xr8VvEwWI7HnHrTXxcd3DCfWZTRq19tC+xxH4io7n3PL4OsqNeANO
XiWTmxDZwOPBYnP2CwsA/xlbzuH4jQ==
=CCM+
-----END PGP SIGNATURE-----

--34rk2z2khodqsv3a--
