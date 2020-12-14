Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0E2D9B2E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2545B6E19B;
	Mon, 14 Dec 2020 15:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FF56E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:37:39 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:37:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607960259;
 bh=7xrQQsflbVXBCtHso6v6KBJxiVYw5BK6rctMad4t9Iw=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=QUAP/t2AjSy5aICF8T1krfE0jPlcUFBs9kUR/nAvCN1EtFMM2hbNa5IU3uGCzdDgG
 zNibNg1CNUTB2KDhWLVIlyM5mgKEFCHSu0+dDtisu23WIofYTnxIPswCE923FXKIAM
 gZC0eRaNpOqEqX0SRAL+WA6IDWjvhPxvlHGJD4O71F9BTS1oX4IV3Ko6syXb0SHX4x
 lf24Y8HKS/jKCDph+4xxVIkqrv70Dgr3aSGEdOVajRNHg/idLoOzn7kampASgMHo05
 epePIFCv7jLch/51IEaHJEwx5waerjw7um9yauCAe9L5Rfy5jWRyXdmCIYuMd5hd4/
 YtDbGrg7wJ0Vw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 11/29] drm/omap: dsi: pass vc to various functions
Message-ID: <20201214153736.c4tipxwt2aq6eifu@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-12-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-12-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============0574752737=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0574752737==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="secuwurx6akade3m"
Content-Disposition: inline


--secuwurx6akade3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:37PM +0200, Tomi Valkeinen wrote:
> To start fixing the issues related to channels and vcs described in the
> previous commit, pass vc to various functions which will need it do
> properly handle different DSI channels and VCs.
>=20
> No functional changes.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 54 ++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 273159e8f992..8d8412199693 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -214,9 +214,9 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, b=
ool enable);
>  static int dsi_display_init_dispc(struct dsi_data *dsi);
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi);
> =20
> -static int dsi_vc_send_null(struct dsi_data *dsi, int vc);
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
> =20
> -static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg);
> =20
>  static void dsi_display_disable(struct omap_dss_device *dssdev);
> @@ -2455,7 +2455,7 @@ static void dsi_vc_enable_hs(struct omap_dss_device=
 *dssdev, int vc,
> =20
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
> -		dsi_vc_send_null(dsi, vc);
> +		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
> =20
>  	dsi->in_lp_mode =3D !enable;
>  }
> @@ -2605,7 +2605,8 @@ static int dsi_vc_send_bta_sync(struct omap_dss_dev=
ice *dssdev, int vc)
>  }
> =20
>  static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int vc,
> -					    u8 data_type, u16 len, u8 ecc)
> +					    int channel, u8 data_type, u16 len,
> +					    u8 ecc)
>  {
>  	u32 val;
>  	u8 data_id;
> @@ -2633,7 +2634,7 @@ static inline void dsi_vc_write_long_payload(struct=
 dsi_data *dsi, int vc,
>  	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(vc), val);
>  }
> =20
> -static int dsi_vc_send_long(struct dsi_data *dsi,
> +static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
>  			    const struct mipi_dsi_msg *msg)
>  {
>  	/*u32 val; */
> @@ -2653,7 +2654,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
> =20
>  	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
> =20
> -	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len, 0);
> +	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len,=
 0);
> =20
>  	p =3D msg->tx_buf;
>  	for (i =3D 0; i < msg->tx_len >> 2; i++) {
> @@ -2696,7 +2697,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
>  	return r;
>  }
> =20
> -static int dsi_vc_send_short(struct dsi_data *dsi,
> +static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
>  			     const struct mipi_dsi_msg *msg)
>  {
>  	struct mipi_dsi_packet pkt;
> @@ -2727,26 +2728,26 @@ static int dsi_vc_send_short(struct dsi_data *dsi,
>  	return 0;
>  }
> =20
> -static int dsi_vc_send_null(struct dsi_data *dsi, int vc)
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel)
>  {
>  	const struct mipi_dsi_msg msg =3D {
>  		.channel =3D vc,
>  		.type =3D MIPI_DSI_NULL_PACKET,
>  	};
> =20
> -	return dsi_vc_send_long(dsi, &msg);
> +	return dsi_vc_send_long(dsi, vc, &msg);
>  }
> =20
> -static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> +static int dsi_vc_write_common(struct omap_dss_device *dssdev, int vc,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	int r;
> =20
>  	if (mipi_dsi_packet_format_is_short(msg->type))
> -		r =3D dsi_vc_send_short(dsi, msg);
> +		r =3D dsi_vc_send_short(dsi, vc, msg);
>  	else
> -		r =3D dsi_vc_send_long(dsi, msg);
> +		r =3D dsi_vc_send_long(dsi, vc, msg);
> =20
>  	if (r < 0)
>  		return r;
> @@ -2882,7 +2883,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi=
, int vc, u8 *buf,
>  	return r;
>  }
> =20
> -static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
> +static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int vc,
>  			   const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> @@ -2893,7 +2894,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *=
dssdev,
>  	if (dsi->debug_read)
>  		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, cmd);
> =20
> -	r =3D dsi_vc_send_short(dsi, msg);
> +	r =3D dsi_vc_send_short(dsi, vc, msg);
>  	if (r)
>  		goto err;
> =20
> @@ -2917,13 +2918,13 @@ static int dsi_vc_dcs_read(struct omap_dss_device=
 *dssdev,
>  	return r;
>  }
> =20
> -static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
> +static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	int r;
> =20
> -	r =3D dsi_vc_send_short(dsi, msg);
> +	r =3D dsi_vc_send_short(dsi, vc, msg);
>  	if (r)
>  		goto err;
> =20
> @@ -3672,7 +3673,7 @@ static void dsi_enable_video_output(struct omap_dss=
_device *dssdev, int vc)
> =20
>  		word_count =3D DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
> =20
> -		dsi_vc_write_long_header(dsi, vc, data_type,
> +		dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
>  				word_count, 0);
> =20
>  		dsi_vc_enable(dsi, vc, true);
> @@ -3770,7 +3771,7 @@ static void dsi_update_screen_dispc(struct dsi_data=
 *dsi)
>  	l =3D FLD_VAL(total_len, 23, 0); /* TE_SIZE */
>  	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
> =20
> -	dsi_vc_write_long_header(dsi, vc, MIPI_DSI_DCS_LONG_WRITE,
> +	dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, MIPI_DSI_DCS_LO=
NG_WRITE,
>  		packet_len, 0);
> =20
>  	if (dsi->te_enabled)
> @@ -3882,7 +3883,7 @@ static int _dsi_update(struct dsi_data *dsi)
>  	return 0;
>  }
> =20
> -static int _dsi_send_nop(struct dsi_data *dsi, int channel)
> +static int _dsi_send_nop(struct dsi_data *dsi, int vc, int channel)
>  {
>  	const u8 payload[] =3D { MIPI_DCS_NOP };
>  	const struct mipi_dsi_msg msg =3D {
> @@ -3894,7 +3895,7 @@ static int _dsi_send_nop(struct dsi_data *dsi, int =
channel)
> =20
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> -	return _omap_dsi_host_transfer(dsi, &msg);
> +	return _omap_dsi_host_transfer(dsi, vc, &msg);
>  }
> =20
>  static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
> @@ -3923,7 +3924,7 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int vc)
>  	 * updates stop working. This is probably related to DSI spec stating
>  	 * that the DSI host should transition to LP at least once per frame.
>  	 */
> -	r =3D _dsi_send_nop(dsi, vc);
> +	r =3D _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
>  	if (r < 0) {
>  		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
> @@ -4885,7 +4886,7 @@ static enum omap_channel dsi_get_dispc_channel(stru=
ct dsi_data *dsi)
>  	}
>  }
> =20
> -static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg)
>  {
>  	struct omap_dss_device *dssdev =3D &dsi->output;
> @@ -4905,15 +4906,15 @@ static ssize_t _omap_dsi_host_transfer(struct dsi=
_data *dsi,
>  	case MIPI_DSI_DCS_LONG_WRITE:
>  	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
>  	case MIPI_DSI_NULL_PACKET:
> -		r =3D dsi_vc_write_common(dssdev, msg);
> +		r =3D dsi_vc_write_common(dssdev, vc, msg);
>  		break;
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> -		r =3D dsi_vc_generic_read(dssdev, msg);
> +		r =3D dsi_vc_generic_read(dssdev, vc, msg);
>  		break;
>  	case MIPI_DSI_DCS_READ:
> -		r =3D dsi_vc_dcs_read(dssdev, msg);
> +		r =3D dsi_vc_dcs_read(dssdev, vc, msg);
>  		break;
>  	default:
>  		r =3D -EINVAL;
> @@ -4941,12 +4942,13 @@ static ssize_t omap_dsi_host_transfer(struct mipi=
_dsi_host *host,
>  {
>  	struct dsi_data *dsi =3D host_to_omap(host);
>  	int r;
> +	int vc =3D VC_DEFAULT;
> =20
>  	dsi_bus_lock(dsi);
> =20
>  	if (dsi->video_enabled) {
>  		dsi_set_ulps_auto(dsi, false);
> -		r =3D _omap_dsi_host_transfer(dsi, msg);
> +		r =3D _omap_dsi_host_transfer(dsi, vc, msg);
>  		dsi_set_ulps_auto(dsi, true);
>  	} else {
>  		r =3D -EIO;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--secuwurx6akade3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XhrcACgkQ2O7X88g7
+prKMQ/8CGRFhkDsrxrW3DyzNarQKbXltR1Qth727iMl3wRBlDjL2m/jckv0c544
CUuQhcG12jTxLIGoh8o78VnssDjhbZes2dpjneUbDgnHhb7/4Z8a/DH1h3Vv5DJd
R6ZkFuYbMFSiEMgGd6cZlUSA3XaVmTjjZ6wXyv/qiTzk2Nm2uB0DGBKxdangCmtj
FOA0knCX/LWa5DDtV36Guxf1ZBMR3oH7h4ikSBH967lyHd2Psu7ZjcV+wF7P6BC6
QCWJeXoN9jcTfUrC53Aae78B03o5g4raOD+7Ya6aiO5xumeHs3bV2voN4oPhaXLV
sx0T+XJ6TdUw8N8zO0NzBkFdH9mM2wZ98Hkm67arXKkqauUtdZIwyKsCKfURRoaA
qZPwXj2tIQBo+Cee3pOXqQKLl3qbcVBaA1Ni9OG/w+vjpmscOTKmb34oVgYSVXB0
59+PH2uHs9L9NCGr3857nkORGHUZEXG/D2L8Wo6mM7n8D66nqrQ2GKhZV0+wnmb1
M62bhcs+cCabR1Doc1qnwc6MvxFNW6dtEERyP/nPguLLU9L+2SxgRhxsgGcpJRbb
oy4j7DsueWnV0FQCEYJJy9z3rgsQ1gub+xxwAKll2pbEssWayhskhOt/I+O7bvKv
Rh2s3qHmmPgp6pZOcLZRNC3KzTfOIFJDwnMG3/7IkD/IIFO7NkM=
=qB1x
-----END PGP SIGNATURE-----

--secuwurx6akade3m--

--===============0574752737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0574752737==--
