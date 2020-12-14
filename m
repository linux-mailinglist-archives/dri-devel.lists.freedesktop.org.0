Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3D2D9B84
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5293890BA;
	Mon, 14 Dec 2020 15:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0896E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:54:36 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:54:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607961276;
 bh=l+dtLE4LskrqWf5ZcL+GIhfdnp2ieOPmWNfgEXXEWDE=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=jVEmEtnoHctfwPky5Wds2Y8kKNKivH/WoTuf6iuv91iSPZGt/+HxUdeiQXM6CQ38B
 tmzbgA88ooCKZL34F1RYxkJsC5MpyXbdQrpBlaRCt6ua9RfoWX1nNwUV/ZK/8qdHZi
 7K02sVl9SclRHPgzfXTHvANxtjhBUm/KurpSmm/nkHZbFGjQlI0zdRv/jqVIbk3cNE
 E+4GgyFHzCBAHXQ4ElU68XJdoQ5OohSye1fNxiTXM/nEsecWvgWnM5fTTgrXgFFWSt
 jZMSZtOgr+HzRgOPvtdREVeKRrRIxyEc0rgBb/3wdlQCnW2IdIBWw94l2MhUtjjTX7
 Aco8Bwle0kC+Q==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 15/29] drm/omap: dsi: use separate VCs for cmd and video
Message-ID: <20201214155434.gryuzypfihecsmpt@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-16-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-16-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1087775806=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1087775806==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lxmuzrzlkmauqrm"
Content-Disposition: inline


--6lxmuzrzlkmauqrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:41PM +0200, Tomi Valkeinen wrote:
> For command mode panels we can use a single VC for sending command and
> video data, even if we have to change the data source for that VC when
> going from command to video or vice versa.
>=20
> However, with video mode panels we want to keep the pixel data VC
> enabled, and use another VC for command data, and the commands will get
> interleaved into the pixel data.
>=20
> This patch makes the driver use VC0 for commands and VC1 for video.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 9d210a020916..0795efdd8902 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -452,7 +452,9 @@ static bool dsi_perf;
>  module_param(dsi_perf, bool, 0644);
>  #endif
> =20
> -#define VC_DEFAULT 0
> +/* Note: for some reason video mode seems to work only if VC_VIDEO is 0 =
*/
> +#define VC_VIDEO	0
> +#define VC_CMD		1
> =20
>  #define drm_bridge_to_dsi(bridge) \
>  	container_of(bridge, struct dsi_data, bridge)
> @@ -3723,7 +3725,7 @@ static void dsi_disable_video_outputs(struct omap_d=
ss_device *dssdev)
>  	dsi_bus_lock(dsi);
>  	dsi->video_enabled =3D false;
> =20
> -	dsi_disable_video_output(dssdev, VC_DEFAULT);
> +	dsi_disable_video_output(dssdev, VC_VIDEO);
> =20
>  	dsi_display_disable(dssdev);
> =20
> @@ -3951,7 +3953,7 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int vc)
> =20
>  static int dsi_update_all(struct omap_dss_device *dssdev)
>  {
> -	return dsi_update_channel(dssdev, VC_DEFAULT);
> +	return dsi_update_channel(dssdev, VC_VIDEO);
>  }
> =20
>  /* Display funcs */
> @@ -4184,7 +4186,7 @@ static void dsi_enable_video_outputs(struct omap_ds=
s_device *dssdev)
> =20
>  	dsi_display_enable(dssdev);
> =20
> -	dsi_enable_video_output(dssdev, VC_DEFAULT);
> +	dsi_enable_video_output(dssdev, VC_VIDEO);
> =20
>  	dsi->video_enabled =3D true;
> =20
> @@ -4941,7 +4943,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_d=
si_host *host,
>  {
>  	struct dsi_data *dsi =3D host_to_omap(host);
>  	int r;
> -	int vc =3D VC_DEFAULT;
> +	int vc =3D VC_CMD;
> =20
>  	dsi_bus_lock(dsi);
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--6lxmuzrzlkmauqrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XiroACgkQ2O7X88g7
+pr47A/9Fe1d9IY95xZa7ovHcbcNRXLxWjZjUzGQtp3jHzhp6XWHZs2BLMlagLLR
jZHaLn7hF1mRIIXGkHBrV0Fjvq4oAEEqtAw4t2ryYFVt69FPmvQPx8SlXGtzHfgU
Dpzt8EuGlqnQKg6u2dPHh8bxjnZhFM8od0sziO6o5uQeLDW2+DrSTPaLgdwT5RCv
KUHqgrrOriVZs70q79WgquI9SWrNCZXSeVkKtD/Z61qRKgzcVG1195VEgS2sH/Kn
QbXSCQCxPPP4h7oWLGtecRvSSJVSiOV/t1XJextJ5oRZJNqdsY0Co33vU/j9prUe
gmRNiletoge9UI1M0eMuO2p6iea0WIantgAhz1X+mHx/26aOWhsuhuF/wdjO1FbK
Zw9oe/cQqm7aEz3+8MNnrIdUPh08MDewA825Q9Xjo5FO2AdPc+przkaVUJVOL8ii
L1rmiBIaxQzFGcbC2ACVY/AIVNQlA7H7IG4Ww7gqoajz056gsLKCZb9oxr0SQLx9
zJIlIRXXYO71YrGDUHKQsI0BqsBFQe8YvlQsRYb7/bbfDGl/k/zfgompvK83ED2N
bqUKLp7ddN+ybca4e45m1jgbq77sFDdKkXQvd1zz7rbbJWSnh0s2mkaAKi2wM9+S
shIHAlBDnsLdE0xHJ6Rz4zDqRW6TK+HBaYsXE3GAnWS9qYNq8pE=
=dWKE
-----END PGP SIGNATURE-----

--6lxmuzrzlkmauqrm--

--===============1087775806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1087775806==--
