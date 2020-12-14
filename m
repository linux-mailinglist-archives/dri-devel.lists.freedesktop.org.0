Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DD2D9C48
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6B66E17E;
	Mon, 14 Dec 2020 16:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D946E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:16:24 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:16:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607962584;
 bh=iX3wJNojy8Tn3EAolSVHVqtoto9+JA9K8OCtneBQVFU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=r53wLGWF8TIi4rPbrRnFI+s0prOQHVTQr3dKVEyH4mYmDqVsbM8YMCfbZn3icgSc/
 Crvr5JUzlXPCyk5khsqluovoUs00MCRMDLlOT1THJ+8AEfjipQ3PiOX4wjDOQLujTw
 YHEcaLlhCzRr9lCCOHP9LxohO7JJs23UkknWCy2W8tYPnhWptbfMuXOJfVsF3QNsNu
 jz3L6tqSzjWmB703lAUfN2EgbZKqI1XEjEAIzw6ILxUBLQEh5MMD1Tj1jdZPp8ZtJZ
 8zaLfn/22ZPxogAcYwuoUMHF3dzu3l23j3vsVKgm9UlAvWMWmxn3HAgYct3qCYfhdn
 vTmYUniPARDSA==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 20/29] drm/omap: dsi: move enable/disable to bridge
 enable/disable
Message-ID: <20201214161622.eubzet3kxh2lblsk@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-21-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-21-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1152841421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1152841421==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcni7sjl27fryd6g"
Content-Disposition: inline


--pcni7sjl27fryd6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:46PM +0200, Tomi Valkeinen wrote:
> Clean up the code by inlining dsi_enable_video_outputs and
> dsi_disable_video_outputs functions.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 55 +++++++++++++------------------
>  1 file changed, 22 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index da3ff9e236bd..44b8e42b52ec 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3336,20 +3336,6 @@ static void dsi_disable_video_output(struct omap_d=
ss_device *dssdev, int vc)
>  	dsi_display_uninit_dispc(dsi);
>  }
> =20
> -static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> -
> -	dsi_bus_lock(dsi);
> -	dsi->video_enabled =3D false;
> -
> -	dsi_disable_video_output(dssdev, VC_VIDEO);
> -
> -	dsi_display_disable(dssdev);
> -
> -	dsi_bus_unlock(dsi);
> -}
> -
>  static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  {
>  	unsigned int bytespp;
> @@ -3796,23 +3782,6 @@ static void dsi_display_enable(struct omap_dss_dev=
ice *dssdev)
>  	_dsi_display_enable(dsi);
>  }
> =20
> -static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> -
> -	dsi_bus_lock(dsi);
> -
> -	dsi_display_enable(dssdev);
> -
> -	dsi_enable_video_output(dssdev, VC_VIDEO);
> -
> -	dsi->video_enabled =3D true;
> -
> -	dsi_set_ulps_auto(dsi, true);
> -
> -	dsi_bus_unlock(dsi);
> -}
> -
>  static void _dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
> @@ -4974,15 +4943,35 @@ static void dsi_bridge_mode_set(struct drm_bridge=
 *bridge,
>  static void dsi_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct dsi_data *dsi =3D drm_bridge_to_dsi(bridge);
> +	struct omap_dss_device *dssdev =3D &dsi->output;
> =20
> -	dsi_enable_video_outputs(&dsi->output);
> +	dsi_bus_lock(dsi);
> +
> +	dsi_display_enable(dssdev);
> +
> +	dsi_enable_video_output(dssdev, VC_VIDEO);
> +
> +	dsi->video_enabled =3D true;
> +
> +	dsi_set_ulps_auto(dsi, true);
> +
> +	dsi_bus_unlock(dsi);
>  }
> =20
>  static void dsi_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct dsi_data *dsi =3D drm_bridge_to_dsi(bridge);
> +	struct omap_dss_device *dssdev =3D &dsi->output;
> +
> +	dsi_bus_lock(dsi);
> +
> +	dsi->video_enabled =3D false;
> +
> +	dsi_disable_video_output(dssdev, VC_VIDEO);
> =20
> -	dsi_disable_video_outputs(&dsi->output);
> +	dsi_display_disable(dssdev);
> +
> +	dsi_bus_unlock(dsi);
>  }
> =20
>  static const struct drm_bridge_funcs dsi_bridge_funcs =3D {
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--pcni7sjl27fryd6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/Xj9YACgkQ2O7X88g7
+pry2A/+I/MELetbVYBuhahY5jt+rIpgIvGLdt8TUUIsjEFgA2VgNCzGHff9JUwB
2XggGiP5iztnw3iOlNNGXC53XRW0DBed3sSUFE7W6TyGOZ7Lg3a1zn39IluCsx2A
VYQZuyJmIdyROgVJyTaeuYQETL5zdpaSQqO0r8WC5cvA9iXfBy7j5GWDqZnXgHdw
p8vsEZEGsH8eYx1k+Fy4nlLKNC8i4luxscZZ/nG8/qUcfeu7+FIrz7Eu+qE1GqNm
fTfArPnibnnDGRwH6m6ANvc08qKO86nKfZ3YSZrX/sEEjqMCY1C16aWQ/jUT/Q33
2qRwrBjwp9PKnyWcBHrJmpXs4KFI8Buo8j/gm8y/IUJGSLXOch61q/GIYmHajztK
OClEJNflATx9n6HUh1t0F89pxISU0cFSuSMaYI//zQRJ4LG+GccLjgWqMi80otSC
8IlMXqoc7iOFgJi+uJ6XTTSkCmv1TqK/Ym0xLQNXQTzWfgGrU1n3IZglLhJHMWOf
2lJI1Iw1oS1RsWUe5cTaHxmewNoH0PEWnwuySmxgiPPIVkDL7XEnRGmGcLGGWq8Q
AhHI0fECohC6Nn8O7gNK/nxXaWtqEiVw3HCP+PU4Th6XGMAlppjmyVc0sceB/Z2w
BZhI65WrXa3tEuI9Qys67lqHGh6TsapvmaO+uIJbVXY+kRzyuXc=
=QV+F
-----END PGP SIGNATURE-----

--pcni7sjl27fryd6g--

--===============1152841421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1152841421==--
