Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054B3D2545
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 16:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EEF6E977;
	Thu, 22 Jul 2021 14:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C5D6E977
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:12:54 +0000 (UTC)
Date: Thu, 22 Jul 2021 15:12:43 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] drm/panel-simple: add Gopher 2b LCD panel
To: Artjom Vejsel <akawolf0@gmail.com>
Message-Id: <7TGNWQ.L2GCQQC1CJ603@crapouillou.net>
In-Reply-To: <20210722140432.1426173-4-akawolf0@gmail.com>
References: <20210722140432.1426173-1-akawolf0@gmail.com>
 <20210722140432.1426173-4-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artjom,

Le jeu., juil. 22 2021 at 17:04:32 +0300, Artjom Vejsel=20
<akawolf0@gmail.com> a =E9crit :
> The Gopher 2b LCD panel is used in Gopher 2b handhelds.
> It's simple panel with NewVision NV3047 driver,
> but SPI lines are not connected.
> It has no specific name, since it's unique to that handhelds.
> lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG
> NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface
>=20
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 44=20
> ++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c=20
> b/drivers/gpu/drm/panel/panel-simple.c
> index 9b286bd4444f..9cce6b63a147 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4306,6 +4306,47 @@ static const struct panel_desc=20
> yes_optoelectronics_ytc700tlag_05_201c =3D {
>  	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,
>  };
>=20
> +static const struct drm_display_mode=20
> qishenglong_gopher2b_lcd_panel_modes[] =3D {
> +	{ /* 60 Hz */
> +		.clock =3D 10800,
> +		.hdisplay =3D 480,
> +		.hsync_start =3D 480 + 77,
> +		.hsync_end =3D 480 + 77 + 41,
> +		.htotal =3D 480 + 77 + 41 + 2,
> +		.vdisplay =3D 272,
> +		.vsync_start =3D 272 + 16,
> +		.vsync_end =3D 272 + 16 + 10,
> +		.vtotal =3D 272 + 16 + 10 + 2,
> +		.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +	},
> +	{ /* 50 Hz */
> +		.clock =3D 10800,
> +		.hdisplay =3D 480,
> +		.hsync_start =3D 480 + 17,
> +		.hsync_end =3D 480 + 17 + 41,
> +		.htotal =3D 480 + 17 + 41 + 2,
> +		.vdisplay =3D 272,
> +		.vsync_start =3D 272 + 116,
> +		.vsync_end =3D 272 + 116 + 10,
> +		.vtotal =3D 272 + 116 + 10 + 2,
> +		.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +	},
> +};
> +
> +static const struct panel_desc qishenglong_gopher2b_lcd_panel =3D {
> +	.modes =3D qishenglong_gopher2b_lcd_panel_modes,
> +	.num_modes =3D ARRAY_SIZE(qishenglong_gopher2b_lcd_panel_modes),
> +	.num_modes =3D 1,

Thank you for your patch. From a quick look though, you have .num_modes=20
listed twice here. I believe the second line should be removed.

Cheers,
-Paul

> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 95,
> +		.height =3D 54,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH |=20
> DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +	.connector_type =3D DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct drm_display_mode arm_rtsm_mode[] =3D {
>  	{
>  		.clock =3D 65000,
> @@ -4753,6 +4794,9 @@ static const struct of_device_id=20
> platform_of_match[] =3D {
>  	}, {
>  		.compatible =3D "yes-optoelectronics,ytc700tlag-05-201c",
>  		.data =3D &yes_optoelectronics_ytc700tlag_05_201c,
> +	}, {
> +		.compatible =3D "qishenglong,gopher2b-lcd-panel",
> +		.data =3D &qishenglong_gopher2b_lcd_panel,
>  	}, {
>  		/* Must be the last entry */
>  		.compatible =3D "panel-dpi",
> --
> 2.32.0


