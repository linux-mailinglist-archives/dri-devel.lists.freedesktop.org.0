Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018B2D9873
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 13:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F42689BD5;
	Mon, 14 Dec 2020 12:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EFE89BD5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 12:59:52 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:59:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607950792;
 bh=kF6ePMidLoNHq5BFFMKVcAb4qOKFmkwiDdF/N7rPbKQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=W8RHPvnQljWKQm32MD/ldEAhZDoPogaNiBL5fcGYywTlTyLTpChk6VcEDwvIa4G6f
 m1RpgWzt0PLiMpFgZMEnGfedNFahpYe5PIM8pZdirx4W8j7Zr58S0VcO7J4/DzlJ7+
 vxjvTgP7MIIjQaRcUrqC2vUe6aGf42HD3AafTHUIX6sQcOBoaSMwXo/UmP4IsaJlhg
 fM90xwopK50XDWCsXMBRrn98q7jeACRPsZLS+CAjgPAh84wHaKJrAVuPx9PNwA3Xav
 rdwqo4jw6lI3s2r2u26ekjjm+8KdwKW1YKqmoEgXCzPn/oQht0IKngRRMXEjkmj7na
 N4MkT5DdvDlIg==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 60/80] drm/panel: panel-dsi-cm: set column & page at
 setup
Message-ID: <20201214125950.5jeaotj2eas3fxai@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-61-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201124124538.660710-61-tomi.valkeinen@ti.com>
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
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============2086259274=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2086259274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mbkxzyrfujxf7reg"
Content-Disposition: inline


--mbkxzyrfujxf7reg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:18PM +0200, Tomi Valkeinen wrote:
> Set the column & page address once during setup, instead of relying the
> DSI host driver to set those.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

I'm fine with or without removal of the variables:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 59e8e6b18e97..1e7f73340736 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -171,6 +171,26 @@ static int dsicm_get_id(struct panel_drv_data *ddata=
, u8 *id1, u8 *id2, u8 *id3)
>  	return 0;
>  }
> =20
> +static int dsicm_set_update_window(struct panel_drv_data *ddata)
> +{
> +	struct mipi_dsi_device *dsi =3D ddata->dsi;
> +	int r;
> +	u16 x1 =3D 0;
> +	u16 x2 =3D ddata->mode.hdisplay - 1;
> +	u16 y1 =3D 0;
> +	u16 y2 =3D ddata->mode.vdisplay - 1;
> +
> +	r =3D mipi_dsi_dcs_set_column_address(dsi, x1, x2);
> +	if (r < 0)
> +		return r;
> +
> +	r =3D mipi_dsi_dcs_set_page_address(dsi, y1, y2);
> +	if (r < 0)
> +		return r;
> +
> +	return 0;
> +}
> +
>  static int dsicm_bl_update_status(struct backlight_device *dev)
>  {
>  	struct panel_drv_data *ddata =3D dev_get_drvdata(&dev->dev);
> @@ -308,6 +328,10 @@ static int dsicm_power_on(struct panel_drv_data *dda=
ta)
>  	if (r)
>  		goto err;
> =20
> +	r =3D dsicm_set_update_window(ddata);
> +	if (r)
> +		goto err;
> +
>  	r =3D mipi_dsi_dcs_set_display_on(ddata->dsi);
>  	if (r)
>  		goto err;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--mbkxzyrfujxf7reg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYcYACgkQ2O7X88g7
+pqz5w//UCj40j0obj0IwXwcVS9Req9aeN0mx2slWTz829Vr1PM07x4KqwiYHqBC
vOllsPxh+YYox18jIxSlmoHvtdkzyBXMMYqPWNIKRbEM97nW4mDXWpReEzJyuzRj
qyDUuDFmuteoBLsAHAT3axJTkbhWuFvOnTYAc58Lss28f5zlqSC/Yr2jcmXnObZ9
PMgmql/IMKfVzjTmitLXtuGVJV4wY7A5wghk3ni7piKkq/nwl6zmals2dlWx8Cwe
XVEYDrhPq56OrZD2GXbjgpKfLq6RtNtYegJ3b4JBk7eerEX4uBgTpUNx0HzAJh0g
/ZQmyErmS/iXDfgxguMDnTOsqSGRG/Km8mxMg/+d6wAJGnPKkQUTq4iDG5qDUWrP
BlmWwiW2I6ZHLJivvHzrTN9i50QOMrLnG4jHY3X5V3oHyiTgF4rIoRpMGl7LiJOm
FQwlms0AtCL8m59GeC/kn+u+ulFkYDssanR3ffh81MRVNFHf7na2NS8jzCQAm1s9
STuZ8SpfqgfLYosrKtMyGfbqP96VbKkgjgYwS+H4ZjRTOMl1JqkVwkORI8zRh+MT
a0GNCYNX+UolqK3VSnwYY457TZjP8FqIVzo7i6hcCiyj4Qz1F4N/1LjU5LdxFccZ
pAXpSjQS0zH7gfUPHhmXjI3zM0rGAW6cmdkw734KvMIQg4hmJXM=
=sH8E
-----END PGP SIGNATURE-----

--mbkxzyrfujxf7reg--

--===============2086259274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2086259274==--
