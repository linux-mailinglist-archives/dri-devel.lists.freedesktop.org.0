Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A432D9B85
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DAE8905E;
	Mon, 14 Dec 2020 15:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421E8905E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:55:53 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:55:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607961353;
 bh=7vCSGPuVmcJcIU053wxeeFt/OHphBY/y22MGgCi5USA=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=d6sNZcyhT7+iZuJ3dO0vhKEuz84fqSaZkvwShFZt78TvNvlCx42L0EK2VjUKhyAA4
 JXQFBUuMrOdbTGXk9PVU+A/OqqHjOAd9v4e05XaoX9oHn6orslR9aBhZCm3wtTlznw
 z6P6HPErBIHOcMkkHPO7kMw5NiAhhQa0SSHEx6hOYO5Aogmr4S6u9jwBJKvGBh7ObY
 T7rKUDTZnNdse0t/8UMkBRfV5m1VNkVtv6bymX5Fv0PhrQZvv1rzCi/plqzx5nSa11
 mNfNDdbtlwXPgJ7UoNz+mSQYuFmkCZ0j1gxzjyjdJ3moaSBHsFcxNWWZl8q4quTXBl
 VuBDNDTRQCQnw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 16/29] drm/panel: panel-dsi-cm: remove extra 'if'
Message-ID: <20201214155551.k3jpvgjuxn2lr2bk@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-17-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-17-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============2046045437=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2046045437==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggtzqcqnf3xbhkml"
Content-Disposition: inline


--ggtzqcqnf3xbhkml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:42PM +0200, Tomi Valkeinen wrote:
> We have a useless 'if' in the dsicm_bl_update_status(), a left over from
> the conversion to DRM model. Drop the if.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 556f9a2c5c0c..fa564aad7f25 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -202,11 +202,9 @@ static int dsicm_bl_update_status(struct backlight_d=
evice *dev)
> =20
>  	mutex_lock(&ddata->lock);
> =20
> -	if (ddata->enabled) {
> -		if (!r)
> -			r =3D dsicm_dcs_write_1(
> -				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
> -	}
> +	if (ddata->enabled)
> +		r =3D dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				      level);
> =20
>  	mutex_unlock(&ddata->lock);
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--ggtzqcqnf3xbhkml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XiwYACgkQ2O7X88g7
+prvZRAAj8/YuLu7eqqReaHRl8SdWzUXVVAgO+vkMBT8MPnJkEuCeE5NbruHWLqH
8JzJna9aDdEZxVCS0PgPVoJK1SgVsomjfWjReDJaJ5B2rHprG1HcK+5sCClxlOWx
suGTBOqvaeKJkUks/u6ljc6PjZRnpAJqHtbhQDpk3W+rxvmP8fojyDuAO1O8Buzs
amxH4/TfPHBXa583/RHoT3sdq0MJYdAEM/uOYU11F8Wijy7JtfOP2jHJBT2SHqqR
MVWuxV5Vl7A8uEHOiSS5pHGMTCM0yXhdJCgauYjECHvLYUA8e5O+4AizuXxwNAGO
y02FK7Mxzr/n7LQCWjXkSW18CRWLw4nCld584vN+1HWmemIwg9sc0s6l8dsOsGVc
FE2zCg99Nk/7X0Vsp4nXxlL8tzXzF71zPsGXLJZceJAZJIdHp6X0emscpm0oVKW7
oCk/60+8SYGhrAtGHGnL1p1dCkN/KoPryEaAFY2AhZVfKSWnyVrLuhBo/ytwM0DO
/SsxRbdEQNFzLVA9KgX2Ov+Nf/oIAEco59PuJ7BG2HhjNZdfVINI8wgJCmdDAKLh
hPq7jDrHDhXWH1nNNNGD2GYX8U59B0hblGv2+/GoFGDClCq86HY45xk3CaiMP3QN
TvsBejgpNOAJRL7vMW2CzVyM/kY+f9IADNZpxKgalhst1PhOvRA=
=XSBz
-----END PGP SIGNATURE-----

--ggtzqcqnf3xbhkml--

--===============2046045437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2046045437==--
