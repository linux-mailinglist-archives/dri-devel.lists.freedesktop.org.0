Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8D2D988A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D92F89CAD;
	Mon, 14 Dec 2020 13:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EBF89CAD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 13:09:24 +0000 (UTC)
Date: Mon, 14 Dec 2020 14:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607951364;
 bh=pn8M9Hin8USzFT67HImYKt0e9V3ni6fDVNQ1wplIdoA=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=eW51iyb/ZVqWCuVf87qlvZ0ccqtogAps4iw99MHCMDq8Rwzvkj+F5Tt2VT6NEaFus
 RIw4lH3q9x29ksVaoqTLVuhDmTucsZvRRKI9hUVjFJu+2ZGd9OxZhH98RJgypiiQmY
 MF4Sqx72DdS0OaP3nvhtogqZTX23dgDPiS8A2ZRSoq9pQPLdXbWRm970a8JP9UEso6
 ba/6El+srOx/lBO7151VPbD8CdLOjgDVU8/96+th5Ye6OX5s1xLIlgdrgA6BWbVD6G
 1ZLP50q7d4aaKrz+lKoMWAEIlcSV7RyBPvpsBBpTWOuDkaj2S1HzExzGgPhrBLMl2X
 jmOx3Fo/ei1VQ==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 01/29] drm/panel: panel-dsi-cm: cleanup tear enable
Message-ID: <20201214130921.wueiup4bm22eapxc@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-2-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1476114196=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1476114196==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ihhxurpfhrc3j6eb"
Content-Disposition: inline


--ihhxurpfhrc3j6eb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:27PM +0200, Tomi Valkeinen wrote:
> Simplify the code by moving code from _dsicm_enable_te() into
> dsicm_power_on().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 729b42b4dabd..38f79dca1fd0 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -68,8 +68,6 @@ static inline struct panel_drv_data *panel_to_ddata(str=
uct drm_panel *panel)
>  	return container_of(panel, struct panel_drv_data, panel);
>  }
> =20
> -static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
> -
>  static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
>  {
>  	struct backlight_device *backlight;
> @@ -313,10 +311,13 @@ static int dsicm_power_on(struct panel_drv_data *dd=
ata)
>  	if (r)
>  		goto err;
> =20
> -	r =3D _dsicm_enable_te(ddata, true);
> +	r =3D mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLAN=
K);
>  	if (r)
>  		goto err;
> =20
> +	/* possible panel bug */
> +	msleep(100);
> +
>  	ddata->enabled =3D true;
> =20
>  	if (!ddata->intro_printed) {
> @@ -417,22 +418,6 @@ static int dsicm_disable(struct drm_panel *panel)
>  	return r;
>  }
> =20
> -static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
> -{
> -	struct mipi_dsi_device *dsi =3D ddata->dsi;
> -	int r;
> -
> -	if (enable)
> -		r =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	else
> -		r =3D mipi_dsi_dcs_set_tear_off(dsi);
> -
> -	/* possible panel bug */
> -	msleep(100);
> -
> -	return r;
> -}
> -
>  static int dsicm_get_modes(struct drm_panel *panel,
>  			   struct drm_connector *connector)
>  {
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--ihhxurpfhrc3j6eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XZAEACgkQ2O7X88g7
+ppiHg//QkKz71VqsEeXiRmPA3waRe/piZWdSyAu2uqMZyIZ4uc00/7kEC0o3n/3
K9iSlcrRKVEKvgoTm1yyAcY/tOJW52eWt383qEI8LJ+KIU00zPJZWuGYNt3KG5w+
tOEHJk0G33U+IAiIM+Urpa3++O9Ged3IlVA2NUQCtV9fd5dSAwrb3QiqPmswu3hw
aPo4NbNXiwmjly8VH2x92HvpDgj7YzIpyIy66f3PYFBGIrReRJKjrTqLaLRiEGJT
m+CDh+8iJW576L0EXOuq0ikdoutBUTwP7Jghp70agIAIHqOzx5fRvvLTeiopbyUD
KvGC9iBYEfTelDih1vfS66EnE1/9iH7Ab5HuYYk5heFeKK9gIXfO0w6YGGwYV21B
aPmz+uGHkk8/BtWgblT3kYUAyFGCMDPJnOkKAA/u3CTorA7ztJTRu31oGKpP0vu6
UzgRaO3QeuEy8yPrle23JXKYpImOouS17dAyx7GpUXZG/hX9H2CDlxKLVOzkae/p
5JwH4x9YA7FtRPcAq3dPoQJDnfNmFOY4C5fLvG/OLGUaZA2HzEVSeYQybyCdcJDw
XO53121IaSqDH0TRCSqzLn2xDThYzZEMIbkNJ3CePD5jaNf4S8Evc7wWgmuUcSfV
t/LBA8cI7zAEMLRcQi8Oc5btp9t8U6m2slsGLG5jxNC3L6GNI9I=
=9bUa
-----END PGP SIGNATURE-----

--ihhxurpfhrc3j6eb--

--===============1476114196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1476114196==--
