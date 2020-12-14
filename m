Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB42D9BB0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC446E332;
	Mon, 14 Dec 2020 16:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5846B6E332
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:04:35 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:04:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607961875;
 bh=usCttM9UWOaZRoHso+h7e3djMyaXbAiPURu3AgJuAOY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=HkYyWMZfHh+YHan6t+4PlzTFUGYEeD6Mo3f+KLa0kzSS8uMiQ8YoqBL0HMQsGlDYG
 mwtwuepPEmoYGjSVxHr/RX+raouCohj8UM0UnB0XH3vogQPkmzcVMcNL+Qzn2XPJ8a
 8sjkVEbEqAhkysk8s9lgJY72J/3tx3rtAFeXsYE7rzzxDiXDqkWPn0p/CRXxXis/gy
 tT9efLdjtV65UgqD7+EA1Se+jM5pP/4vVOFgMQ5a1ztfU/9rzdPM8G/Pds7RZRCfW0
 8kkYsW6g6YApDYMS2V8sGfuFkEzx+iWZUO/n5R0dcScSnzCfm87Z24Hyz93mBWTzAC
 eC6tiUVFKaNEw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 17/29] drm/panel: panel-dsi-cm: add panel database to
 driver
Message-ID: <20201214160432.b3exd37yaj74jirg@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-18-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-18-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0334992707=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0334992707==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnqugli3o2psx3qb"
Content-Disposition: inline


--tnqugli3o2psx3qb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 02:28:43PM +0200, Tomi Valkeinen wrote:
> Add a panel database to the driver instead of reading propertes from DT
> data. This is similar to panel-simple, and I believe it's more future
> safe way to handle the panels.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 107 +++++++++++++++++----------
>  1 file changed, 69 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index fa564aad7f25..3fb5b2856283 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -21,10 +21,7 @@
>  #include <drm/drm_modes.h>
>  #include <drm/drm_panel.h>
> =20
> -#include <video/display_timing.h>
>  #include <video/mipi_display.h>
> -#include <video/of_display_timing.h>
> -#include <video/videomode.h>
> =20
>  #define DCS_GET_ID1		0xda
>  #define DCS_GET_ID2		0xdb
> @@ -32,6 +29,18 @@
> =20
>  #define DCS_REGULATOR_SUPPLY_NUM 2
> =20
> +static const struct of_device_id dsicm_of_match[];
> +
> +struct dsic_panel_data {
> +	u32 xres;
> +	u32 yres;
> +	u32 refresh;
> +	u32 width_mm;
> +	u32 height_mm;
> +	u32 max_hs_rate;
> +	u32 max_lp_rate;
> +};
> +
>  struct panel_drv_data {
>  	struct mipi_dsi_device *dsi;
>  	struct drm_panel panel;
> @@ -47,16 +56,14 @@ struct panel_drv_data {
>  					 */
>  	unsigned long	hw_guard_wait;	/* max guard time in jiffies */
> =20
> -	/* panel HW configuration from DT or platform data */
> +	const struct dsic_panel_data *panel_data;
> +
>  	struct gpio_desc *reset_gpio;
> =20
>  	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
> =20
>  	bool use_dsi_backlight;
> =20
> -	int width_mm;
> -	int height_mm;
> -
>  	/* runtime variables */
>  	bool enabled;
> =20
> @@ -450,11 +457,8 @@ static int dsicm_get_modes(struct drm_panel *panel,
>  		return -ENOMEM;
>  	}
> =20
> -	drm_mode_set_name(mode);
> -	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -
> -	connector->display_info.width_mm =3D ddata->width_mm;
> -	connector->display_info.height_mm =3D ddata->height_mm;
> +	connector->display_info.width_mm =3D ddata->panel_data->width_mm;
> +	connector->display_info.height_mm =3D ddata->panel_data->height_mm;
> =20
>  	drm_mode_probed_add(connector, mode);
> =20
> @@ -471,15 +475,10 @@ static const struct drm_panel_funcs dsicm_panel_fun=
cs =3D {
> =20
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>  {
> -	struct device_node *node =3D dsi->dev.of_node;
>  	struct backlight_device *backlight;
>  	struct panel_drv_data *ddata =3D mipi_dsi_get_drvdata(dsi);
> -	struct display_timing timing;
> -	struct videomode vm =3D {
> -		.hactive =3D 864,
> -		.vactive =3D 480,
> -	};
>  	int err;
> +	struct drm_display_mode *mode =3D &ddata->mode;
> =20
>  	ddata->reset_gpio =3D devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ddata->reset_gpio)) {
> @@ -488,23 +487,16 @@ static int dsicm_probe_of(struct mipi_dsi_device *d=
si)
>  		return err;
>  	}
> =20
> -	err =3D of_get_display_timing(node, "panel-timing", &timing);
> -	if (!err) {
> -		videomode_from_timing(&timing, &vm);
> -	} else {
> -		dev_warn(&dsi->dev,
> -			 "failed to get video timing, using defaults\n");
> -	}
> -
> -	if (!vm.pixelclock)
> -		vm.pixelclock =3D vm.hactive * vm.vactive * 60;
> -	drm_display_mode_from_videomode(&vm, &ddata->mode);
> -
> -	ddata->width_mm =3D 0;
> -	of_property_read_u32(node, "width-mm", &ddata->width_mm);
> -
> -	ddata->height_mm =3D 0;
> -	of_property_read_u32(node, "height-mm", &ddata->height_mm);
> +	mode->hdisplay =3D mode->hsync_start =3D mode->hsync_end =3D mode->htot=
al =3D
> +		ddata->panel_data->xres;
> +	mode->vdisplay =3D mode->vsync_start =3D mode->vsync_end =3D mode->vtot=
al =3D
> +		ddata->panel_data->yres;
> +	mode->clock =3D ddata->panel_data->xres * ddata->panel_data->yres *
> +		ddata->panel_data->refresh / 1000;
> +	mode->width_mm =3D ddata->panel_data->width_mm;
> +	mode->height_mm =3D ddata->panel_data->height_mm;
> +	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_set_name(mode);
> =20
>  	ddata->supplies[0].supply =3D "vpnl";
>  	ddata->supplies[1].supply =3D "vddi";
> @@ -531,6 +523,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	struct panel_drv_data *ddata;
>  	struct backlight_device *bldev =3D NULL;
>  	struct device *dev =3D &dsi->dev;
> +	const struct of_device_id *id;
>  	int r;
> =20
>  	dev_dbg(dev, "probe\n");
> @@ -542,6 +535,12 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	mipi_dsi_set_drvdata(dsi, ddata);
>  	ddata->dsi =3D dsi;
> =20
> +	id =3D of_match_node(dsicm_of_match, dev->of_node);
> +	if (!id)
> +		return -ENODEV;
> +
> +	ddata->panel_data =3D id->data;

ddata->panel_data =3D of_device_get_match_data(dev);
if (!ddata->panel_data)
    return -ENODEV;

Otherwise looks good to me:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  	r =3D dsicm_probe_of(dsi);
>  	if (r)
>  		return r;
> @@ -578,8 +577,8 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	dsi->format =3D MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags =3D MIPI_DSI_CLOCK_NON_CONTINUOUS |
>  			  MIPI_DSI_MODE_EOT_PACKET;
> -	dsi->hs_rate =3D 300000000;
> -	dsi->lp_rate =3D 10000000;
> +	dsi->hs_rate =3D ddata->panel_data->max_hs_rate;
> +	dsi->lp_rate =3D ddata->panel_data->max_lp_rate;
> =20
>  	drm_panel_add(&ddata->panel);
> =20
> @@ -617,8 +616,40 @@ static int dsicm_remove(struct mipi_dsi_device *dsi)
>  	return 0;
>  }
> =20
> +static const struct dsic_panel_data taal_data =3D {
> +	.xres =3D 864,
> +	.yres =3D 480,
> +	.refresh =3D 60,
> +	.width_mm =3D 0,
> +	.height_mm =3D 0,
> +	.max_hs_rate =3D 300000000,
> +	.max_lp_rate =3D 10000000,
> +};
> +
> +static const struct dsic_panel_data himalaya_data =3D {
> +	.xres =3D 480,
> +	.yres =3D 864,
> +	.refresh =3D 60,
> +	.width_mm =3D 49,
> +	.height_mm =3D 88,
> +	.max_hs_rate =3D 300000000,
> +	.max_lp_rate =3D 10000000,
> +};
> +
> +static const struct dsic_panel_data droid4_data =3D {
> +	.xres =3D 540,
> +	.yres =3D 960,
> +	.refresh =3D 60,
> +	.width_mm =3D 50,
> +	.height_mm =3D 89,
> +	.max_hs_rate =3D 300000000,
> +	.max_lp_rate =3D 10000000,
> +};
> +
>  static const struct of_device_id dsicm_of_match[] =3D {
> -	{ .compatible =3D "panel-dsi-cm", },
> +	{ .compatible =3D "tpo,taal", .data =3D &taal_data },
> +	{ .compatible =3D "nokia,himalaya", &himalaya_data },
> +	{ .compatible =3D "motorola,droid4-panel", &droid4_data },
>  	{},
>  };
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--tnqugli3o2psx3qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XjRAACgkQ2O7X88g7
+precg/+PyrY6iGUPm/NafnhhLU1nHtm0UcU08O40pf4wg0hn+SOcYG1+Cy00NZu
Py4267GrGRaaBntqJQKzuBkEltLjaN0KEUPUt6+EUI0kdSGcFmbu14aHI/VabntK
9/LOICoehYkw1ZzaCxVN+l/k1metAvOgU1zl+rKhEab4NtWwUEpj0goprPNTCIX0
+Wx4JXXrNDahlNgDvtN9Qu7LkqcEfuIzF8XrxJGt4GEDI08qID1gJFGP8otVJg6m
9hlv5o4FlLJo3+C477U4YKMudi7PjS0nvU/YQbNCw7RyE8yuFedFyGpj0OgTzApm
MTPXfzL4+1wiK6lKt9DUlLIJtxscQUGJaHaQ/Q4QNOqOFk5mk4X9G6eEXNr0iS0d
k9kTt4tUKozaJ1G52GeB2XLssyhs06VXYcF33fErEr+ONBDkg8DiLLyMad9TXyKR
HgF14gLIJOWrWYXvmlqfJ46wGm+9RNe5JxcjWn3W1JyYeu4ppiuN2yFPaU/r/BuJ
hn0Q34qol80P3hozCsgkLk1RwsjAAFSDuR0obk98eNMR/EAAZcZ0Oz0aIRZtDva7
MdVEG6bx2AYBvo7QQIvlZVI2A2GY6GRX7+AdV0mCMvu9FrZLnJo9terXbt7Zph5s
s2PG6YpDfULFEBUMhT0DiNMpq/wTTjah4Ozfx+dINsseri93wP8=
=Sz88
-----END PGP SIGNATURE-----

--tnqugli3o2psx3qb--

--===============0334992707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0334992707==--
