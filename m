Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645EC9DB3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 13:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324F16E9AC;
	Thu,  3 Oct 2019 11:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7AD6E9AC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 11:47:39 +0000 (UTC)
Received: from earth.universe (dyndsl-037-138-174-173.ewe-ip-backbone.de
 [37.138.174.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39C7B2086A;
 Thu,  3 Oct 2019 11:47:39 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id 4654A3C0CA1; Thu,  3 Oct 2019 13:47:35 +0200 (CEST)
Date: Thu, 3 Oct 2019 13:47:35 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v8 5/5] backlight: add led-backlight driver
Message-ID: <20191003114735.byayntpe35qqrjeu@earth.universe>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-6-jjhiblot@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191003082812.28491-6-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570103259;
 bh=gjF+Beu9cVE7QyxON52ocEaaf6UCJYqYDNkFZGF0kpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B5+4uathTZgUBWwoMwRo0uKanKIL2bOTtJFzQgJEYAcj1SoRrqO8DsUk5iYnV4ToO
 N5OvBSs6m7bLw8EzfIVFNWlW3c0IlgICEb880+CLdGeOmIhJbuiRekWiWYJyGQptOV
 TwugluC14UmIXQrkrt9QEaes7DKAjXTh0OaAGnL8=
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
Content-Type: multipart/mixed; boundary="===============1493438094=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1493438094==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3lt566epwms7icad"
Content-Disposition: inline


--3lt566epwms7icad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 03, 2019 at 10:28:12AM +0200, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>=20
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

(with some suggestions below)

>  drivers/video/backlight/Kconfig  |   7 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++
>  3 files changed, 268 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c
>=20
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kc=
onfig
> index 8b081d61773e..585a1787618c 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -458,6 +458,13 @@ config BACKLIGHT_RAVE_SP
>  	help
>  	  Support for backlight control on RAVE SP device.
> =20
> +config BACKLIGHT_LED
> +	tristate "Generic LED based Backlight Driver"
> +	depends on LEDS_CLASS && OF
> +	help
> +	  If you have a LCD backlight adjustable by LED class driver, say Y
> +	  to enable this driver.
> +
>  endif # BACKLIGHT_CLASS_DEVICE
> =20
>  endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/M=
akefile
> index 63c507c07437..2a67642966a5 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+=3D tps65217_bl.o
>  obj-$(CONFIG_BACKLIGHT_WM831X)		+=3D wm831x_bl.o
>  obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+=3D arcxcnn_bl.o
>  obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+=3D rave-sp-backlight.o
> +obj-$(CONFIG_BACKLIGHT_LED)		+=3D led_bl.o
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/l=
ed_bl.c
> new file mode 100644
> index 000000000000..3f66549997c8
> --- /dev/null
> +++ b/drivers/video/backlight/led_bl.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.=
ti.com/
> + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> + *
> + * Based on pwm_bl.c
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +struct led_bl_data {
> +	struct device		*dev;
> +	struct backlight_device	*bl_dev;
> +	struct led_classdev	**leds;
> +	bool			enabled;
> +	int			nb_leds;
> +	unsigned int		*levels;
> +	unsigned int		default_brightness;
> +	unsigned int		max_brightness;
> +};
> +
> +static void led_bl_set_brightness(struct led_bl_data *priv, int level)
> +{
> +	int i;
> +	int bkl_brightness;
> +
> +	if (priv->levels)
> +		bkl_brightness =3D priv->levels[level];
> +	else
> +		bkl_brightness =3D level;
> +
> +	for (i =3D 0; i < priv->nb_leds; i++)
> +		led_set_brightness(priv->leds[i], bkl_brightness);
> +
> +	priv->enabled =3D true;
> +}
> +
> +static void led_bl_power_off(struct led_bl_data *priv)
> +{
> +	int i;
> +
> +	if (!priv->enabled)
> +		return;
> +
> +	for (i =3D 0; i < priv->nb_leds; i++)
> +		led_set_brightness(priv->leds[i], LED_OFF);
> +
> +	priv->enabled =3D false;
> +}
> +
> +static int led_bl_update_status(struct backlight_device *bl)
> +{
> +	struct led_bl_data *priv =3D bl_get_data(bl);
> +	int brightness =3D bl->props.brightness;
> +
> +	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> +	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
> +	    bl->props.state & BL_CORE_FBBLANK)
> +		brightness =3D 0;
> +
> +	if (brightness > 0)
> +		led_bl_set_brightness(priv, brightness);
> +	else
> +		led_bl_power_off(priv);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops led_bl_ops =3D {
> +	.update_status	=3D led_bl_update_status,
> +};
> +
> +static int led_bl_get_leds(struct device *dev,
> +			   struct led_bl_data *priv)
> +{
> +	int i, nb_leds, ret;
> +	struct device_node *node =3D dev->of_node;
> +	struct led_classdev **leds;
> +	unsigned int max_brightness;
> +	unsigned int default_brightness;
> +
> +	ret =3D of_count_phandle_with_args(node, "leds", NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "Unable to get led count\n");
> +		return -EINVAL;
> +	}
> +
> +	nb_leds =3D ret;
> +	if (nb_leds < 1) {
> +		dev_err(dev, "At least one LED must be specified!\n");
> +		return -EINVAL;
> +	}
> +
> +	leds =3D devm_kzalloc(dev, sizeof(struct led_classdev *) * nb_leds,
> +			    GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < nb_leds; i++) {
> +		leds[i] =3D devm_of_led_get(dev, i);
> +		if (IS_ERR(leds[i]))
> +			return PTR_ERR(leds[i]);
> +	}
> +
> +	/* check that the LEDs all have the same brightness range */
> +	max_brightness =3D leds[0]->max_brightness;
> +	for (i =3D 1; i < nb_leds; i++) {
> +		if (max_brightness !=3D leds[i]->max_brightness) {
> +			dev_err(dev, "LEDs must have identical ranges\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* get the default brightness from the first LED from the list */
> +	default_brightness =3D leds[0]->brightness;
> +
> +	priv->nb_leds =3D nb_leds;
> +	priv->leds =3D leds;
> +	priv->max_brightness =3D max_brightness;
> +	priv->default_brightness =3D default_brightness;
> +
> +	return 0;
> +}
> +
> +static int led_bl_parse_levels(struct device *dev,
> +			   struct led_bl_data *priv)
> +{
> +	struct device_node *node =3D dev->of_node;
> +	int num_levels;
> +	u32 value;
> +	int ret;
> +
> +	if (!node)
> +		return -ENODEV;
> +
> +	num_levels =3D of_property_count_u32_elems(node, "brightness-levels");
> +	if (num_levels > 1) {
> +		int i;
> +		unsigned int db;
> +		u32 *levels =3D NULL;
> +
> +		levels =3D devm_kzalloc(dev, sizeof(u32) * num_levels,
> +				      GFP_KERNEL);
> +		if (!levels)
> +			return -ENOMEM;
> +
> +		ret =3D of_property_read_u32_array(node, "brightness-levels",
> +						levels,
> +						num_levels);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Try to map actual LED brightness to backlight brightness
> +		 * level
> +		 */
> +		db =3D priv->default_brightness;
> +		for (i =3D 0 ; i < num_levels; i++) {
> +			if ((i && db > levels[i-1]) && db <=3D levels[i])
> +				break;
> +		}
> +		priv->default_brightness =3D i;
> +		priv->max_brightness =3D num_levels - 1;
> +		priv->levels =3D levels;
> +	} else if (num_levels >=3D 0)
> +		dev_warn(dev, "Not enough levels defined\n");
> +
> +	ret =3D of_property_read_u32(node, "default-brightness-level", &value);
> +	if (!ret && value <=3D priv->max_brightness)
> +		priv->default_brightness =3D value;
> +	else if (!ret  && value > priv->max_brightness)
> +		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
> +
> +	return 0;
> +}
> +
> +static int led_bl_probe(struct platform_device *pdev)
> +{
> +	struct backlight_properties props;
> +	struct led_bl_data *priv;
> +	int ret, i;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->dev =3D &pdev->dev;
> +
> +	ret =3D led_bl_get_leds(&pdev->dev, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D led_bl_parse_levels(&pdev->dev, priv);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to parse DT data\n");
> +		return ret;
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type =3D BACKLIGHT_RAW;
> +	props.max_brightness =3D priv->max_brightness;
> +	props.brightness =3D priv->default_brightness;
> +	props.power =3D (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> +		      FB_BLANK_UNBLANK;
> +	priv->bl_dev =3D backlight_device_register(dev_name(&pdev->dev),
> +			&pdev->dev, priv, &led_bl_ops, &props);
> +	if (IS_ERR(priv->bl_dev)) {
> +		dev_err(&pdev->dev, "Failed to register backlight\n");
> +		return PTR_ERR(priv->bl_dev);
> +	}
> +
> +	for (i =3D 0; i < priv->nb_leds; i++)
> +		led_sysfs_disable(priv->leds[i]);

I suggest to restructure:

1. call led_sysfs_disable

2. use devm_add_action_or_reset() to register the
   led_sysfs_enable loop

3. use devm_backlight_device_register() to register BL

4. drop the remove function

> +
> +	backlight_update_status(priv->bl_dev);
> +
> +	return 0;
> +}
> +
> +static int led_bl_remove(struct platform_device *pdev)
> +{
> +	struct led_bl_data *priv =3D platform_get_drvdata(pdev);
> +	struct backlight_device *bl =3D priv->bl_dev;
> +	int i;
> +
> +	backlight_device_unregister(bl);
> +
> +	led_bl_power_off(priv);
> +	for (i =3D 0; i < priv->nb_leds; i++)
> +		led_sysfs_enable(priv->leds[i]);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id led_bl_of_match[] =3D {
> +	{ .compatible =3D "led-backlight" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, led_bl_of_match);
> +
> +static struct platform_driver led_bl_driver =3D {
> +	.driver		=3D {
> +		.name		=3D "led-backlight",
> +		.of_match_table	=3D of_match_ptr(led_bl_of_match),

You should drop of_match_ptr(). Since the driver depends on OF,
it will always simply return led_bl_of_match.

(Also after removing the OF dependency from the driver it would
either require led_bl_of_match to be marked __maybe_unused or
moving it into a #if CONFIG_OF area to avoid warnings.)

-- Sebastian

> +	},
> +	.probe		=3D led_bl_probe,
> +	.remove		=3D led_bl_remove,
> +};
> +
> +module_platform_driver(led_bl_driver);
> +
> +MODULE_DESCRIPTION("LED based Backlight Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:led-backlight");
> --=20
> 2.17.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--3lt566epwms7icad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2V39EACgkQ2O7X88g7
+pqCeBAAjejzox0B9olFgbjOZnJehF9gXVkcLB4FgAZ7Jr/RpmJvXeSCBgDWLPT1
swGlEG1dCHiYnY7W8LI/g7vsrLLv2XmkbPX4AQ16fBHYy3udf3AU5v6uswD8W8Qg
Cs0n7jS3ojWSjvj5SBFI1Ckfhl8s5h9tVSBZjFMfC5vQ7AUyi+4R4jY+/y+y30WU
ZgcjmBX41Rp4XASAIMv1ZMAt0uzynyMQmU23FJ1L9aMIaQgVCYd+z8ynnnTvdWBa
hFUE3mbrQLBG3DMrTMclzWRPQJpGnT3sFGW9iFatyseh31j+/zT0AXuZ7SocVWmw
7tXpUs7IxMoNrsl6tB8ThqL+8SIH0eKiJR6aP57qT/WYiTVoJ+WRlZ7Pp+6aT6F7
Uut2u37WYkrttmpKFF/QzquiuO+5KoMT6w5FiieuEHe1yc1GRJS8dJ/uMB87pdnQ
ZsKL9sF7LD989nphmvJjqvqBlQhQYDr10oVrCVwuV8t73p3Jljtftx8vSnWGKBbu
YtDm+QM/FsWrbXvzgx9Ecy+/SiPgWQ+WPYGu5zvZkzDBmur481POvWGf+F23T4mZ
MqKOvJSIyG9nU/+mzavxlAjwWZspWdODltI/ciLdGSYcDrPrQbJKdNEiT/zSZxKb
5Fcpz7U/oQFIUMDULp6TcUT5mU8pMzN2bJeg9wUr/q9ID97rGFU=
=znKz
-----END PGP SIGNATURE-----

--3lt566epwms7icad--

--===============1493438094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1493438094==--
