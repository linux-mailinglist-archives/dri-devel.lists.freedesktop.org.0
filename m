Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCEDCB54C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB346EACB;
	Fri,  4 Oct 2019 07:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE9A6E0FE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 10:42:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id A801228FA88
Received: by earth.universe (Postfix, from userid 1000)
 id DD71E3C0CA1; Thu,  3 Oct 2019 12:42:28 +0200 (CEST)
Date: Thu, 3 Oct 2019 12:42:28 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
Message-ID: <20191003104228.c5nho6eimwzqwxpt@earth.universe>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191003082812.28491-3-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============0744714972=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0744714972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3dwpceevmlujtme"
Content-Disposition: inline


--j3dwpceevmlujtme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 03, 2019 at 10:28:09AM +0200, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>=20
> This patch adds basic support for a kernel driver to get a LED device.
> This will be used by the led-backlight driver.
>=20
> Only OF version is implemented for now, and the behavior is similar to
> PWM's of_pwm_get() and pwm_put().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/led-class.c | 44 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     |  4 ++++
>  2 files changed, 48 insertions(+)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index c2167b66b61f..455545f5d663 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -19,6 +19,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/timer.h>
>  #include <uapi/linux/uleds.h>
> +#include <linux/of.h>
>  #include "leds.h"
> =20
>  static struct class *leds_class;
> @@ -214,6 +215,49 @@ static int led_resume(struct device *dev)
> =20
>  static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
> =20
> +/**
> + * of_led_get() - request a LED device via the LED framework
> + * @np: device node to get the LED device from
> + * @index: the index of the LED
> + *
> + * Returns the LED device parsed from the phandle specified in the "leds"
> + * property of a device tree node or a negative error-code on failure.
> + */
> +struct led_classdev *of_led_get(struct device_node *np, int index)
> +{
> +	struct device *led_dev;
> +	struct led_classdev *led_cdev;
> +	struct device_node *led_node;
> +
> +	led_node =3D of_parse_phandle(np, "leds", index);
> +	if (!led_node)
> +		return ERR_PTR(-ENOENT);
> +
> +	led_dev =3D class_find_device_by_of_node(leds_class, led_node);

If you convert led_node into a fwnode, you can use
class_find_device_by_fwnode() instead. That way the
first patch can just be dropped.

-- Sebastian

> +	of_node_put(led_node);
> +
> +	if (!led_dev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	led_cdev =3D dev_get_drvdata(led_dev);
> +
> +	if (!try_module_get(led_cdev->dev->parent->driver->owner))
> +		return ERR_PTR(-ENODEV);
> +
> +	return led_cdev;
> +}
> +EXPORT_SYMBOL_GPL(of_led_get);
> +
> +/**
> + * led_put() - release a LED device
> + * @led_cdev: LED device
> + */
> +void led_put(struct led_classdev *led_cdev)
> +{
> +	module_put(led_cdev->dev->parent->driver->owner);
> +}
> +EXPORT_SYMBOL_GPL(led_put);
> +
>  static int led_classdev_next_name(const char *init_name, char *name,
>  				  size_t len)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b8df71193329..6f7371bc7757 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -20,6 +20,7 @@
> =20
>  struct device;
>  struct led_pattern;
> +struct device_node;
>  /*
>   * LED Core
>   */
> @@ -196,6 +197,9 @@ extern void devm_led_classdev_unregister(struct devic=
e *parent,
>  extern void led_classdev_suspend(struct led_classdev *led_cdev);
>  extern void led_classdev_resume(struct led_classdev *led_cdev);
> =20
> +extern struct led_classdev *of_led_get(struct device_node *np, int index=
);
> +extern void led_put(struct led_classdev *led_cdev);
> +
>  /**
>   * led_blink_set - set blinking with software fallback
>   * @led_cdev: the LED to start blinking
> --=20
> 2.17.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--j3dwpceevmlujtme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2V0GcACgkQ2O7X88g7
+prmzg/9E0CAs3oiLnssD5zcaRUXA/TReOyQrGD1nboLusSjJFrB/8qx4spJtmBt
qewY2Ra2ekk/xSk6RAxIhuDmUubU2pCqBgSzbB3rrqEVHLO/cp4oSZP8sDb/Jzbr
GA2Uy/0p+sa/mAaSBUofsX0n7A0yeYlUHObix8dt+Jhdw9oW7zOj2EBGgd/zjZpb
GG24jamgRTIDgXgwzUJ/xDQOkRbSZAXcbt1L/kptrz6h23bOoF3pka6SUOKm9FNq
yRqBFEyEZENyNgS33z4nXVH4Iy/IR+C2dve9Q6JMzpvCNumygszhN3g5vbf7iJU3
sJdZVhOTvhMja9WiU179X8zQbYyy7TD/f0HoDI5gJZN1Z4LkHK35pwr8ymr1sQtK
vw8tE8Ij7c6x01YhugFrWkdYCa1W/FbVc6xtmkH9Udl1bjcTv0uZk6Ol586JMbbS
1OKQJ8BhWQsvw5kq7IPXQ/wvrtUMSIUpneBzgApdtD5eFRQgRm9J/Pl3PXhAA0Bh
+HA9sf7JHoqLhx/tmCS2/X+cvhjJPagSG054/NjYKdibl5wlbsMRqkGnYHx8nM1B
4Lsk4+SmrQOd36w06KQtQ1zPqTytk/UbykCp6VdPTaxIFH+0zJCt3ApAkXUBYmNr
pUzKvFILC12lHMAn5obK54+Kh4oYWppTbbL84ZjEMsPdFh2zsw8=
=HisU
-----END PGP SIGNATURE-----

--j3dwpceevmlujtme--

--===============0744714972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0744714972==--
