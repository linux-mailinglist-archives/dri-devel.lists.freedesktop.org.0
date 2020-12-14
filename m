Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8D2D9857
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 13:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AB489BFB;
	Mon, 14 Dec 2020 12:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346F89B84
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 12:54:40 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:54:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607950480;
 bh=LqCjwZLJTjVeRUdOVwfI0WnhbX1C13m/H3uvyWm4eZ0=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWRfGC2RlK7t4OG84Z/Y4CtLayP9hVe8B9LcEz2KBW/rlxmv7P+NZGnxAEV4wHJ6X
 Ht8e/mSqHPRxP2IFCNzfoFvp9R6duxmlCH0VjljTVgFGnM+lgfrZWuKe+EHzDh0dZQ
 bRwGtvhElfvhrkpEDxndjXzECaGdEs5u+nNo74xX9x290H93DqBoy6REutPVJoQkru
 HQXmG1msDM/4kS7fQxFDb+GjdF5/Ns6hInd1eq5rwVrUN4CjCqQ6GuEnjhupAEhK9s
 43EOEYUueyE0IqKuTtg+c8P0ZvYQ6XY+8iycExHbALTGbbgFe/LbUQbZSGJuqlYZGb
 EpOaofkxYvDyQ==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 56/80] drm/panel: panel-dsi-cm: cleanup tear enable
Message-ID: <20201214125438.3quklk2dy72rynpb@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-57-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201124124538.660710-57-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1519052410=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1519052410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cem4wzu62ppnagqy"
Content-Disposition: inline


--cem4wzu62ppnagqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:14PM +0200, Tomi Valkeinen wrote:
> Simplify the code by moving code from _dsicm_enable_te() into
> dsicm_power_on().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index cb0d27a38555..59e8e6b18e97 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -69,8 +69,6 @@ static inline struct panel_drv_data *panel_to_ddata(str=
uct drm_panel *panel)
>  	return container_of(panel, struct panel_drv_data, panel);
>  }
> =20
> -static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
> -
>  static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
>  {
>  	struct backlight_device *backlight;
> @@ -314,10 +312,13 @@ static int dsicm_power_on(struct panel_drv_data *dd=
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
> @@ -418,22 +419,6 @@ static int dsicm_disable(struct drm_panel *panel)
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

--cem4wzu62ppnagqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYI4ACgkQ2O7X88g7
+pqJPQ//X05ooYU+O6LTxJ8/EsNVcCQ10CVEFb9a3Dl90k7H0N1pA5aAXaKs5DVc
p2JF9W+FQU636R3xd8206dh9LNcpg5fVHhR/uYP+cprfl2yxitAL+hzfZfahCUbQ
eqfP0ai68Tis3iE++cqyxiKBo5pey9pKc9TiCuIGnjgCeZuhsSIieWQV6yLqWaOz
lSojxufSX3PFLkm8oKRReXVvPyLskoSkyxkFEmQzNhcwkSlSsilYkVpxg/aUTyrq
tNn3mMdjSX5k28XR+mkRaIZdIPD/8eHTfO2JdDxorR5K8bY3SCAgjsvPyArJvZSf
z3n1c8D9FIcGVGBgwkjG3BvFvrF4iyg37s96RhPvCTE9et+AUHcZocH6W0N9r37S
V1aWbF1/W8IzTA/fjc+ocC1f/lIHp1farFR5COZzorO8et0SQw0oJsNVmbnb18Y2
2oxtDoBX3JLuN39LBYACf29lL4XlsYQqm2r8L6ryt745ZaZWUDcUtWVGdNJXTCuk
wlGkWDcGuohOnX8O9eEmZ/PfYdsMXSaOBcs7BBtE1GkiEpdCGvJoyEMqHj0rOZJ6
J2gLb+jn9uOB1TGoVyIwEDHFOtCWCPYJjlTLSwfdJtoRQK7S5LI6TsTxWQcq39lx
qdapQvoiQ5Yu37zeccntTT1Dv+PhRO23rFo43xk3kXCmAIopuBQ=
=s2OR
-----END PGP SIGNATURE-----

--cem4wzu62ppnagqy--

--===============1519052410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1519052410==--
