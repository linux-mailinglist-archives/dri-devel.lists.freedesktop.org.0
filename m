Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A662D9CC7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B716E3BB;
	Mon, 14 Dec 2020 16:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25E06E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:34:05 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:34:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607963645;
 bh=dZs+5+GYmP+VlZQRcSjjV8OVABBpP/Q+4+Ej0Z0Tkwo=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRGQ69pWXYOroCKEJusMKJDH4pBFae5fFh+epxRf5ZfIwx/TJyWoZQbB4/TySGNm5
 4EM3htfTrFDAynJmPbUVLbKrYIqGVJ0Hn1jnCNga+02zX1c8ALMVC5P4cC0BlRUuCb
 zeMPMZH76xRConLSA08giTn8Z8+o0CdvLHzpllm61oQ6NbMBZgkm79bMOnznGqhPdS
 D2Drcxxt4TDA/RRukyXZJ9O+SjjbTMQQs7SaPmD7Nev9LU9TnjJ50bvX8biQGW2yMz
 55eBj4zAM9GSq5XAhxLjWokeZ4p5esPElTqxDkrYnDK9CXg7kbXglqhCaraNeahT+z
 EULA+EkV3uETw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 24/29] drm/omap: dsi: cleanup initial vc setup
Message-ID: <20201214163403.zs22bydkxfmrz2xh@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-25-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-25-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1396122642=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1396122642==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lwn3vm5nlmu7ccg3"
Content-Disposition: inline


--lwn3vm5nlmu7ccg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:50PM +0200, Tomi Valkeinen wrote:
> As we now have a fixed setup for VCs (VC0 for video stream, VC1 for
> commands), we can simplify the VC setup.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 85 +++++++++++--------------------
>  1 file changed, 31 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index d9c2cd849328..c32884f167b8 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2017,40 +2017,6 @@ static void dsi_vc_initial_config(struct dsi_data =
*dsi, int vc)
>  	dsi->vc[vc].source =3D DSI_VC_SOURCE_L4;
>  }
> =20
> -static int dsi_vc_config_source(struct dsi_data *dsi, int vc,
> -				enum dsi_vc_source source)
> -{
> -	if (dsi->vc[vc].source =3D=3D source)
> -		return 0;
> -
> -	DSSDBG("Source config of VC %d", vc);
> -
> -	dsi_sync_vc(dsi, vc);
> -
> -	dsi_vc_enable(dsi, vc, 0);
> -
> -	/* VC_BUSY */
> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 15, 0)) {
> -		DSSERR("vc(%d) busy when trying to config for VP\n", vc);
> -		return -EIO;
> -	}
> -
> -	/* SOURCE, 0 =3D L4, 1 =3D video port */
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), source, 1, 1);
> -
> -	/* DCS_CMD_ENABLE */
> -	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) {
> -		bool enable =3D source =3D=3D DSI_VC_SOURCE_VP;
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 30, 30);
> -	}
> -
> -	dsi_vc_enable(dsi, vc, 1);
> -
> -	dsi->vc[vc].source =3D source;
> -
> -	return 0;
> -}
> -
>  static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>  		bool enable)
>  {
> @@ -2072,10 +2038,6 @@ static void dsi_vc_enable_hs(struct omap_dss_devic=
e *dssdev, int vc,
>  	dsi_if_enable(dsi, 1);
> =20
>  	dsi_force_tx_stop_mode_io(dsi);
> -
> -	/* start the DDR clock by sending a NULL packet */
> -	if (dsi->vm_timings.ddr_clk_always_on && enable)
> -		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
>  }
> =20
>  static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
> @@ -2270,8 +2232,6 @@ static int dsi_vc_send_long(struct dsi_data *dsi, i=
nt vc,
>  		return -EINVAL;
>  	}
> =20
> -	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
> -
>  	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len,=
 0);
> =20
>  	p =3D msg->tx_buf;
> @@ -2331,8 +2291,6 @@ static int dsi_vc_send_short(struct dsi_data *dsi, =
int vc,
>  		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
>  		       vc, msg->type, pkt.header[1], pkt.header[2]);
> =20
> -	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
> -
>  	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(vc)), 16, 16)) {
>  		DSSERR("ERROR FIFO FULL, aborting transfer\n");
>  		return -EINVAL;
> @@ -3351,8 +3309,6 @@ static void dsi_update_screen_dispc(struct dsi_data=
 *dsi)
> =20
>  	DSSDBG("dsi_update_screen_dispc(%dx%d)\n", w, h);
> =20
> -	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_VP);
> -
>  	bytespp	=3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
>  	bytespl =3D w * bytespp;
>  	bytespf =3D bytespl * h;
> @@ -3522,14 +3478,12 @@ static int dsi_update_channel(struct omap_dss_dev=
ice *dssdev, int vc)
> =20
>  	dsi_set_ulps_auto(dsi, false);
> =20
> -	dsi_vc_enable_hs(dssdev, vc, true);
> -
>  	/*
>  	 * Send NOP between the frames. If we don't send something here, the
>  	 * updates stop working. This is probably related to DSI spec stating
>  	 * that the DSI host should transition to LP at least once per frame.
>  	 */
> -	r =3D _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
> +	r =3D _dsi_send_nop(dsi, VC_CMD, dsi->dsidev->channel);
>  	if (r < 0) {
>  		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
> @@ -3654,6 +3608,35 @@ static int dsi_configure_dsi_clocks(struct dsi_dat=
a *dsi)
>  	return 0;
>  }
> =20
> +static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
> +{
> +	/* Setup VC_CMD for LP and cpu transfers */
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_CMD), 0, 9, 9); /* LP */
> +
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_CMD), 0, 1, 1); /* SOURCE_L4 */
> +	dsi->vc[VC_CMD].source =3D DSI_VC_SOURCE_L4;
> +
> +	/* Setup VC_VIDEO for HS and dispc transfers */
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 9, 9); /* HS */
> +
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 1, 1); /* SOURCE_VP */
> +	dsi->vc[VC_VIDEO].source =3D DSI_VC_SOURCE_VP;
> +
> +	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC)
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 30, 30); /* DCS_CMD_ENABLE =
*/
> +
> +	dsi_vc_enable(dsi, VC_CMD, 1);
> +	dsi_vc_enable(dsi, VC_VIDEO, 1);
> +
> +	dsi_if_enable(dsi, 1);
> +
> +	dsi_force_tx_stop_mode_io(dsi);
> +
> +	/* start the DDR clock by sending a NULL packet */
> +	if (dsi->vm_timings.ddr_clk_always_on)
> +		dsi_vc_send_null(dsi, VC_CMD, dsi->dsidev->channel);
> +}
> +
>  static int dsi_init_dsi(struct dsi_data *dsi)
>  {
>  	int r;
> @@ -3696,13 +3679,7 @@ static int dsi_init_dsi(struct dsi_data *dsi)
>  	if (r)
>  		goto err3;
> =20
> -	/* enable interface */
> -	dsi_vc_enable(dsi, 0, 1);
> -	dsi_vc_enable(dsi, 1, 1);
> -	dsi_vc_enable(dsi, 2, 1);
> -	dsi_vc_enable(dsi, 3, 1);
> -	dsi_if_enable(dsi, 1);
> -	dsi_force_tx_stop_mode_io(dsi);
> +	dsi_setup_dsi_vcs(dsi);
> =20
>  	return 0;
>  err3:
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--lwn3vm5nlmu7ccg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/Xk/cACgkQ2O7X88g7
+ppWHQ//aML6tEi1AaBoPBf3ybMRu0krYFQ6fPTAR/PzzL1kwPO7e5EAqJRqEgUn
Zj0B6WK9F2D00ILLgwwoLw/hfE1Js2JxyrtUM2jFnPSeQscWUdyZovFS8r9x7Pz3
F22lAqhhpw3a0IR9hJAJnHLEkO/jTaW7Q0+PFBRhkT+9NTIqbovXWpWHkPKaiJQl
SPCsJnKoEKQqESIk2MHfNuwUKtMP7flN7OAYkmyKn/yZNUyTHceyO1tEf8xUvPSE
gPa9PWXhpsH6DMXwDWLLAs8yP78PBXRvi1Tqwgemq9OeAC66zh3TQHUp1GS+Ode+
fw9RONaXAGuLh9NJVk1bRKruDPNIWIEgShozerANY2zCCtBdgiywOTVTES5Nq7kI
vA0MS6wEgOHRD7ok0ROdTCKmvuTrT8lrEFXzfnFZfmWbvkkI/WkTPZI8PWapOJ0F
9eaGVVAf8TpVoO97KW1xfLLvO0Q3j/UtZOtt4T1xAhbff0whYH7Xv0UvThJ2NSdW
5d/elM2r7hE8ZwMg0UdjMQlbYdHnQAVoubabl+SgT4l6UkTTbOhEfi3AnrF2F6wT
pak5Z2BubiXy7Q4oursNBjIaYkJO9zDu7IUBXCFZxBMcfJ7LSy6PqwvNln+a4YdP
yXlUMA8V1HYdJcj0Ge23eOG5hAm/LtX/zzA9aHVd3wjktmCQJpY=
=THnQ
-----END PGP SIGNATURE-----

--lwn3vm5nlmu7ccg3--

--===============1396122642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1396122642==--
