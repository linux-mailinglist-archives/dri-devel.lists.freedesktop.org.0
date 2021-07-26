Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B43D5608
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 11:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C54A6E8E5;
	Mon, 26 Jul 2021 09:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD996E8E5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 09:02:18 +0000 (UTC)
Date: Mon, 26 Jul 2021 10:02:08 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 3/3] drm/panel-simple: add Gopher 2b LCD panel
To: Artjom Vejsel <akawolf0@gmail.com>
Message-Id: <K3HUWQ.S5LBW8E092T01@crapouillou.net>
In-Reply-To: <20210725221527.1771892-4-akawolf0@gmail.com>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
 <20210725221527.1771892-4-akawolf0@gmail.com>
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

Le lun., juil. 26 2021 at 01:15:27 +0300, Artjom Vejsel=20
<akawolf0@gmail.com> a =E9crit :
> The Gopher 2b LCD panel is used in Gopher 2b handhelds.
> It's simple panel with NewVision NV3047 driver, but SPI lines are not=20
> connected.
> It has no specific name, since it's unique to that handhelds.
> lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG NV3047=20
> Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface

 From what I gathered the Gopher2's LCD panel is the exact same that is=20
inside the RS-07 handheld. According to the teardown (in [1]), the=20
RS-07 panel is a Amelin AML043056B0-40 (see [2]).

Could you verify that? According to the photos, the product code is=20
written on the flexible connector.

If that's the case, instead of using the=20
"qishenglong,gopher2b-lcd-panel" compatible string, could you use=20
"amelin,aml043056b0-40"?

Cheers,
-Paul

[1]: https://steward-fu.github.io/website/handheld/rs07/teardown.htm
[2]: http://www.amelin.com.cn/en/h-pd-355.html

>=20
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 43=20
> ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c=20
> b/drivers/gpu/drm/panel/panel-simple.c
> index 9b286bd4444f..6b69c0c70814 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3563,6 +3563,46 @@ static const struct panel_desc qd43003c0_40 =3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
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
>  static const struct display_timing rocktech_rk070er9427_timing =3D {
>  	.pixelclock =3D { 26400000, 33300000, 46800000 },
>  	.hactive =3D { 800, 800, 800 },
> @@ -4651,6 +4691,9 @@ static const struct of_device_id=20
> platform_of_match[] =3D {
>  	}, {
>  		.compatible =3D "qiaodian,qd43003c0-40",
>  		.data =3D &qd43003c0_40,
> +	}, {
> +		.compatible =3D "qishenglong,gopher2b-lcd-panel",
> +		.data =3D &qishenglong_gopher2b_lcd_panel,
>  	}, {
>  		.compatible =3D "rocktech,rk070er9427",
>  		.data =3D &rocktech_rk070er9427,
> --
> 2.32.0
>=20


