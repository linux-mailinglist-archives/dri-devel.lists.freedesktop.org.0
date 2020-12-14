Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3B2D99B8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 15:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495C56E20C;
	Mon, 14 Dec 2020 14:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DD36E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:22:11 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:22:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607955730;
 bh=a42FyKxT/hIQb1eguzTqD+Pb8aluOrnPe/aTVYbf7j4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=dl4CAQA9NVtqYkr7vtUNF+Urafl2nRCOZlzXXjBjSUiCVsm3h7wu1ct0BXcAKk0z0
 r5mR7DZhZ/qLXb0mn7VfftRYSJp+kgKMllqdx3DD2aUAjsrrihz5/Y2AgSenIdmDx0
 zgdoApS0j0B2Amgy5fYHPXwboX6nCgP5NSAqgVaRzBtBK8oioJXEOGXsLTGk4cN4OA
 IA1Uylq1bDqHDeuu4yjqCq/H04kIdMBihdhrggySjJq6ewRx5AO9aPGPmQghPsnsFa
 D83eIqU8o2IfPlcw1wM5GQM0A4hilWltqcAnqmyS2QvwTeMI60mOB0uMUgqYy9WH78
 sj+iky6wMrcjg==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 06/29] drm/omap: dsi: send nop instead of page & column
Message-ID: <20201214142208.2x4yk6ucnhztqted@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-7-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-7-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1313874919=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1313874919==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="urlkngycnuhra2ye"
Content-Disposition: inline


--urlkngycnuhra2ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:32PM +0200, Tomi Valkeinen wrote:
> The OMAP DSI command mode panel driver used to send page & column
> address before each frame update, and this code was moved into the DSI
> host driver when converting it to the DRM bridge model.
>=20
> However, it's not really required to send the page & column address
> before each frame. It's also something that doesn't really belong to the
> DSI host driver, so we should drop the code.
>=20
> That said, frame updates break if we don't send _something_ between the
> frames. A NOP command does the trick.
>=20
> It is not clear if this behavior is as expected from a DSI command mode
> frame transfer, or is it a feature/issue with OMAP DSI driver, or a
> feature/issue in the command mode panel used.
>=20
> Most likely this is related to the following from the DSI spec:
>=20
> "To enable PHY synchronization the host processor should periodically
> end HS transmission and drive the Data Lanes to the LP state. This
> transition should take place at least once per frame."
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 46 ++++++++++++-------------------
>  1 file changed, 17 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 7fee9cf8782d..c6e044f8bece 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3884,35 +3884,19 @@ static int _dsi_update(struct dsi_data *dsi)
>  	return 0;
>  }
> =20
> -static int _dsi_update_window(struct dsi_data *dsi, int channel,
> -			      int x, int y, int w, int h)
> -{
> -	int x1 =3D x, x2 =3D (x + w - 1);
> -	int y1 =3D y, y2 =3D (y + h - 1);
> -	u8 payloadX[5] =3D { MIPI_DCS_SET_COLUMN_ADDRESS,
> -			   x1 >> 8, x1 & 0xff, x2 >> 8, x2 & 0xff };
> -	u8 payloadY[5] =3D { MIPI_DCS_SET_PAGE_ADDRESS,
> -			   y1 >> 8, y1 & 0xff, y2 >> 8, y2 & 0xff };
> -	struct mipi_dsi_msg msgX =3D { 0 }, msgY =3D { 0 };
> -	int ret;
> +static int _dsi_send_nop(struct dsi_data *dsi, int channel)
> +{
> +	const u8 payload[] =3D { MIPI_DCS_NOP };
> +	const struct mipi_dsi_msg msg =3D {
> +		.channel =3D channel,
> +		.type =3D MIPI_DSI_DCS_SHORT_WRITE,
> +		.tx_len =3D 1,
> +		.tx_buf =3D payload,
> +	};
> =20
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> -	msgX.type =3D MIPI_DSI_DCS_LONG_WRITE;
> -	msgX.channel =3D channel;
> -	msgX.tx_buf =3D payloadX;
> -	msgX.tx_len =3D sizeof(payloadX);
> -
> -	msgY.type =3D MIPI_DSI_DCS_LONG_WRITE;
> -	msgY.channel =3D channel;
> -	msgY.tx_buf =3D payloadY;
> -	msgY.tx_len =3D sizeof(payloadY);
> -
> -	ret =3D _omap_dsi_host_transfer(dsi, &msgX);
> -	if (ret !=3D 0)
> -		return ret;
> -
> -	return _omap_dsi_host_transfer(dsi, &msgY);
> +	return _omap_dsi_host_transfer(dsi, &msg);
>  }
> =20
>  static int dsi_update_channel(struct omap_dss_device *dssdev, int channe=
l)
> @@ -3944,10 +3928,14 @@ static int dsi_update_channel(struct omap_dss_dev=
ice *dssdev, int channel)
> =20
>  	dsi_set_ulps_auto(dsi, false);
> =20
> -	r =3D _dsi_update_window(dsi, channel, 0, 0, dsi->vm.hactive,
> -			       dsi->vm.vactive);
> +	/*
> +	 * Send NOP between the frames. If we don't send something here, the
> +	 * updates stop working. This is probably related to DSI spec stating
> +	 * that the DSI host should transition to LP at least once per frame.
> +	 */
> +	r =3D _dsi_send_nop(dsi, channel);
>  	if (r < 0) {
> -		DSSWARN("window update error: %d\n", r);
> +		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
>  	}
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--urlkngycnuhra2ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XdQkACgkQ2O7X88g7
+ppgrA/+J0tgWBdDZ351BE02AgdH4fqjMbnkOaWXDkjUKe1jYaogW1Ma4tU87dxe
fP4Ee5euKYhkYEf1LHOwJ1Hl+3nTCR67KzPiXs+jHtugtiqqotoyu7c4keQUgf+B
J6djhd3Rs/OmDOxrhHqQITHHCM8GuZkI6BoOhwMV0mbvL0ipFYBKNeSx0tT2S4K+
w5OipHLDH7IGtFvSRBGcqxGRGMJLuSPEGMGlKEMc4Ac2NoemgZNNvg8j0TEQb1un
aGMkNu/tY2piWF5uv3eszqlC/mzuMFHr/gg+/L8J2HWEhq/wQHpiaKlCAEKR+ava
Knq7lX0zyAoKqmKhLBdGUyDs8dyEMftKP/Ql50mvJoB1E0OF72cDle2zwADyy76I
06xx+SS5xlcG8AQL4arbk87WNDl2xLMOcXC0D27YS0LD/Fr8QTU6KjEbWQAY1uc3
PgKqSKSI7Ac4+Yr548lkeqg8qDXOPaK77gEox+TNYN9hRRNTIlf3q95Jqj8K0kTg
z+a33vm6gOqADe2HAytwmFqhNT8qgNQF1PZ5BYrqcL+i4IOc06mSmb6kz2hNhGWa
59xooZ8LPcmmlc+0SeXHLfEt0hGpb8rtaMB9jo0qsZWDU31SPPSDR2+CH3ipAQl6
oxkVjXtyyyEnYBoP5YtuIWgumAd+6c4VX6fjpQ226uDeF8izXCA=
=ow6b
-----END PGP SIGNATURE-----

--urlkngycnuhra2ye--

--===============1313874919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1313874919==--
