Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EC130971
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 19:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FE489F92;
	Sun,  5 Jan 2020 18:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Sun, 05 Jan 2020 18:41:47 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E81189F89
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 18:41:47 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id AE2F01C21EA; Sun,  5 Jan 2020 19:32:02 +0100 (CET)
Date: Sun, 5 Jan 2020 19:32:02 +0100
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
 nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
 martin_rysavy@centrum.cz, agx@sigxcpu.org, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: LED backlight on Droid 4 and others
Message-ID: <20200105183202.GA17784@duo.ucw.cz>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jjhiblot@ti.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com
Content-Type: multipart/mixed; boundary="===============0598420325=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0598420325==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

It would be good to get LED backlight to work in clean way for 5.6
kernel.

As far as I can see, these are neccessary (but not enough; it does not
work for me): lm3532 changes to register LED with of node, plus device
tree changes for droid 4, and these generic changes:

commit d457d0c97d6d55fe3e62633791ac05d289a37d2e
Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Thu Oct 3 10:28:12 2019 +0200

    backlight: add led-backlight driver
   =20
    This patch adds a led-backlight driver (led_bl), which is similar to
    pwm_bl except the driver uses a LED class driver to adjust the
    brightness in the HW. Multiple LEDs can be used for a single backlight.
   =20
    Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
    Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

commit 44b7adbf0b07904e4198ae1d0a763917d1c68a23
Author: Jean-Jacques Hiblot <jjhiblot@ti.com>
Date:   Thu Oct 3 10:28:10 2019 +0200

    leds: Add managed API to get a LED from a device driver
   =20
    If the LED is acquired by a consumer device with devm_led_get(), it is
    automatically released when the device is detached.
   =20
    Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Signed-off-by: Pavel <pavel@ucw.cz>

commit 93b98c570d7f898063ab6204e1b3950a3335dd12
Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Thu Oct 3 10:28:09 2019 +0200

    leds: Add of_led_get() and led_put()
   =20
    This patch adds basic support for a kernel driver to get a LED device.
    This will be used by the led-backlight driver.
   =20
    Only OF version is implemented for now, and the behavior is similar to
    PWM's of_pwm_get() and pwm_put().
   =20
    Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
    Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Signed-off-by: Pavel <pavel@ucw.cz>

[If you have an idea what else is needed, it would be welcome; it
works for me in development tree but not in tree I'd like to
upstream.]

Lee, would you be willing to take "backlight: add led-backlight
driver"? Would it help if I got "leds: Add managed API to get a LED
=66rom a device driver" and "leds: Add of_led_get() and led_put()" into
for_next tree of the LED subsystem?

It is kind of important as, well, phone without screen looks pretty
much dead, and same issue hits Droid 4 and Librem 5 phones at least...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXhIroQAKCRAw5/Bqldv6
8qprAJ90Q8brwIbYFi2ax/hmdk3CLdmWuwCfX3POM4PZoSAPnOvVbdh+jOO7cfI=
=sBIE
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--

--===============0598420325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0598420325==--
