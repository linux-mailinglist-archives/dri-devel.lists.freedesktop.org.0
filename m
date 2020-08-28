Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF96256653
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207816EC06;
	Sat, 29 Aug 2020 09:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2986E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:55:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id BA7AF29AD4C
Received: by earth.universe (Postfix, from userid 1000)
 id 887973C0C82; Fri, 28 Aug 2020 13:55:23 +0200 (CEST)
Date: Fri, 28 Aug 2020 13:55:23 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 23/24] drm/omap: display: Backlight update
Message-ID: <20200828115523.alivl63yuz4yf7ti@earth.universe>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-24-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200823104532.1024798-24-sam@ravnborg.org>
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Zheng Bin <zhengbin13@huawei.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============1180301713=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1180301713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7tzyuhyvoqwrqw4i"
Content-Disposition: inline


--7tzyuhyvoqwrqw4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

On Sun, Aug 23, 2020 at 12:45:31PM +0200, Sam Ravnborg wrote:
> - Introduce backlight_{enable/disable)
> - Use get/set methods for backlight_properties
> - Drop redundant get_brightness() implementation
>   The default implementation return the current brightness value
> - Use macro for backlight initialization
>=20
> v2:
>   - Drop backlight_update() call as it is redundant (Sebastian)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Zheng Bin <zhengbin13@huawei.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 37 +++----------------
>  1 file changed, 6 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gp=
u/drm/omapdrm/displays/panel-dsi-cm.c
> index 3484b5d4a91c..39b3a7affbc8 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -110,17 +110,10 @@ static void dsicm_bl_power(struct panel_drv_data *d=
data, bool enable)
>  	else
>  		return;
> =20
> -	if (enable) {
> -		backlight->props.fb_blank =3D FB_BLANK_UNBLANK;
> -		backlight->props.state =3D ~(BL_CORE_FBBLANK | BL_CORE_SUSPENDED);
> -		backlight->props.power =3D FB_BLANK_UNBLANK;
> -	} else {
> -		backlight->props.fb_blank =3D FB_BLANK_NORMAL;
> -		backlight->props.power =3D FB_BLANK_POWERDOWN;
> -		backlight->props.state |=3D BL_CORE_FBBLANK | BL_CORE_SUSPENDED;
> -	}
> -
> -	backlight_update_status(backlight);
> +	if (enable)
> +		backlight_enable(backlight);
> +	else
> +		backlight_disable(backlight);
>  }
> =20
>  static void hw_guard_start(struct panel_drv_data *ddata, int guard_msec)
> @@ -363,13 +356,7 @@ static int dsicm_bl_update_status(struct backlight_d=
evice *dev)
>  	struct panel_drv_data *ddata =3D dev_get_drvdata(&dev->dev);
>  	struct omap_dss_device *src =3D ddata->src;
>  	int r =3D 0;
> -	int level;
> -
> -	if (dev->props.fb_blank =3D=3D FB_BLANK_UNBLANK &&
> -			dev->props.power =3D=3D FB_BLANK_UNBLANK)
> -		level =3D dev->props.brightness;
> -	else
> -		level =3D 0;
> +	int level =3D backlight_get_brightness(dev);
> =20
>  	dev_dbg(&ddata->pdev->dev, "update brightness to %d\n", level);
> =20
> @@ -390,17 +377,7 @@ static int dsicm_bl_update_status(struct backlight_d=
evice *dev)
>  	return r;
>  }
> =20
> -static int dsicm_bl_get_intensity(struct backlight_device *dev)
> -{
> -	if (dev->props.fb_blank =3D=3D FB_BLANK_UNBLANK &&
> -			dev->props.power =3D=3D FB_BLANK_UNBLANK)
> -		return dev->props.brightness;
> -
> -	return 0;
> -}
> -
>  static const struct backlight_ops dsicm_bl_ops =3D {
> -	.get_brightness =3D dsicm_bl_get_intensity,
>  	.update_status  =3D dsicm_bl_update_status,
>  };
> =20
> @@ -1305,9 +1282,7 @@ static int dsicm_probe(struct platform_device *pdev)
>  	dsicm_hw_reset(ddata);
> =20
>  	if (ddata->use_dsi_backlight) {
> -		struct backlight_properties props =3D { 0 };
> -		props.max_brightness =3D 255;
> -		props.type =3D BACKLIGHT_RAW;
> +		DECLARE_BACKLIGHT_INIT_RAW(props, 0, 255);
> =20
>  		bldev =3D devm_backlight_device_register(dev, dev_name(dev),
>  			dev, ddata, &dsicm_bl_ops, &props);
> --=20
> 2.25.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--7tzyuhyvoqwrqw4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl9I8KAACgkQ2O7X88g7
+pqFXg//d7cWqUsULHTJK6DDHKOQU1nscEvnVvLTFEpoUPDYkQ+LoGutos6C/ljP
6gbI45h8XtAX8tFUg4slpO79MKATQTij6o0+QSLGfi7kb1j5J+AuwR7PoqQa5tb4
Xu1VyDdeJVgh65Y27g0Rt4r9IF9+j3a1yY0hhEgHBDrPJk/folW3iqGc08bQhVT0
mIbZ/DSSbA/jQtMo1xPu00HULljg8l9QBGd3g7dwMzOFJyfUGZiE/NKIZwIklUAo
e4KhqL7TV4+Ebs8038haDaK4BDOwQEq5lsQY1WYpyJs/MNrc9v3U1oxYqn2ScgKk
/gT8CowMkuOLsDAqB52yXaKhjZgohAUGO4SHP2Rhii0+IWydXffteNkWqgDZdlNf
ALjYRBVQOIlyITI/lYTvQ0fVZpiR2p2BP8ZavjEt1F7swaP//60Ri/DyIZaZNE2o
kwjA4Hc2XhbMtPseccUL3jK5CKoUGlShgJwloPGnTGNNUXq0MxW2gj4CzaI0ly0F
JHM87mrYcXEdZ4vpXyAdDpcLgGsQPczQvCVXQdP3IkW1nWgGrTSPbSm0Q6h/BU/S
FwvVt+oxBdyM8bjKZ+ODsJrzAcB5YfUuyHQ8CdLDNn7727eF5QdHwmMSHpp0i0rc
LJkX2iPOhyWFcHfCysIOoyvwWlkNEK9rjkf6lxHdUIK0E95k0/s=
=BKNY
-----END PGP SIGNATURE-----

--7tzyuhyvoqwrqw4i--

--===============1180301713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1180301713==--
