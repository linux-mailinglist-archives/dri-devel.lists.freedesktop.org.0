Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9F2D9B5F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640C06E2D7;
	Mon, 14 Dec 2020 15:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEC66E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:48:01 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:47:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607960881;
 bh=Mu/622fOHJOZIhN6LvV/8Bi8E7Bvy2jmbdrkiC43Lkg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZwBwEvmEWdDMvIsbNOwTSs9/OEEgW+0TAMKNvcIZQF79j9cTrJc18sh2sHMMuvRdB
 ewb2K3LrVrC7mMrBg5qXLFpXchTU49qt7RS0rNv4ugV7HBdelKKUl4gdEF4IDELCBV
 kJPnF2wMEozLreDIasqjzzDuj9nwqIunD/3T29A2AvHSsnD1OvrWB7sjK34V8IjRRC
 yox7T4Jj225dmbUZVIAkGWGKSd+tegzxL6CXPYvVo8ffO63cNqBwrC8HjoE5lokA7t
 FYUvsFxMf22Ax0H5pQAGFVarVmn88HtHtv2QD5DzPikJd1dw/CqEqZmNhqHxQaKGM1
 lKGvCpOEP5zdQ==
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 12/29] drm/omap: dsi: untangle vc & channel
Message-ID: <20201214154759.nbe2vrfduahkp7z2@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-13-tomi.valkeinen@ti.com>
 <X8+eo2qJwxZctAAd@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <X8+eo2qJwxZctAAd@pendragon.ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============1361007672=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1361007672==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4vambtgrohnuicd"
Content-Disposition: inline


--y4vambtgrohnuicd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 05:41:23PM +0200, Laurent Pinchart wrote:
> Hi Tomi,
>=20
> Thank you for the patch.
>=20
> On Tue, Dec 08, 2020 at 02:28:38PM +0200, Tomi Valkeinen wrote:
> > DSI virtual channel and hardware VC blocks have gotten tangled as
> > described in the previous commits. This has not caused any issues, as
> > the value for both is 0, so it happens to work.
> >=20
> > To fix the issue, change the code to use the correct one of the two.
> >=20
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> >  drivers/gpu/drm/omapdrm/dss/dsi.c | 43 +++++++++++++++----------------
> >  1 file changed, 21 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdr=
m/dss/dsi.c
> > index 8d8412199693..a1f3623f45b1 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -2613,7 +2613,7 @@ static inline void dsi_vc_write_long_header(struc=
t dsi_data *dsi, int vc,
> > =20
> >  	WARN_ON(!dsi_bus_is_locked(dsi));
> > =20
> > -	data_id =3D data_type | vc << 6;
> > +	data_id =3D data_type | channel << 6;
> > =20
> >  	val =3D FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
> >  		FLD_VAL(ecc, 31, 24);
> > @@ -2647,12 +2647,12 @@ static int dsi_vc_send_long(struct dsi_data *ds=
i, int vc,
> >  		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
> > =20
> >  	/* len + header */
> > -	if (dsi->vc[msg->channel].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
> > +	if (dsi->vc[vc].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
> >  		DSSERR("unable to send long packet: packet too long.\n");
> >  		return -EINVAL;
> >  	}
> > =20
> > -	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
> > +	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
> > =20
> >  	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_le=
n, 0);
> > =20
> > @@ -2666,7 +2666,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,=
 int vc,
> >  		b3 =3D *p++;
> >  		b4 =3D *p++;
> > =20
> > -		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
> > +		dsi_vc_write_long_payload(dsi, vc, b1, b2, b3, b4);
> >  	}
> > =20
> >  	i =3D msg->tx_len % 4;
> > @@ -2691,7 +2691,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,=
 int vc,
> >  			break;
> >  		}
> > =20
> > -		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, 0);
> > +		dsi_vc_write_long_payload(dsi, vc, b1, b2, b3, 0);
> >  	}
> > =20
> >  	return r;
> > @@ -2711,11 +2711,11 @@ static int dsi_vc_send_short(struct dsi_data *d=
si, int vc,
> > =20
> >  	if (dsi->debug_write)
> >  		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
> > -		       msg->channel, msg->type, pkt.header[1], pkt.header[2]);
> > +		       vc, msg->type, pkt.header[1], pkt.header[2]);

There is another "ch%d" filled with vc. With this and Laurent
findings fixed:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> > =20
> > -	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
> > +	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
> > =20
> > -	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(msg->channel)), 16, 16)) {
> > +	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(vc)), 16, 16)) {
> >  		DSSERR("ERROR FIFO FULL, aborting transfer\n");
> >  		return -EINVAL;
> >  	}
> > @@ -2723,7 +2723,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi=
, int vc,
> >  	r =3D pkt.header[3] << 24 | pkt.header[2] << 16 | pkt.header[1] << 8 |
> >  	    pkt.header[0];
> > =20
> > -	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(msg->channel), r);
> > +	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc), r);
> > =20
> >  	return 0;
> >  }
> > @@ -2731,7 +2731,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi=
, int vc,
> >  static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel)
> >  {
> >  	const struct mipi_dsi_msg msg =3D {
> > -		.channel =3D vc,
> > +		.channel =3D channel,
> >  		.type =3D MIPI_DSI_NULL_PACKET,
> >  	};
> > =20
> > @@ -2759,16 +2759,16 @@ static int dsi_vc_write_common(struct omap_dss_=
device *dssdev, int vc,
> >  	 * In that case we can return early.
> >  	 */
> > =20
> > -	r =3D dsi_vc_send_bta_sync(dssdev, msg->channel);
> > +	r =3D dsi_vc_send_bta_sync(dssdev, vc);
> >  	if (r) {
> >  		DSSERR("bta sync failed\n");
> >  		return r;
> >  	}
> > =20
> >  	/* RX_FIFO_NOT_EMPTY */
> > -	if (REG_GET(dsi, DSI_VC_CTRL(msg->channel), 20, 20)) {
> > +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
> >  		DSSERR("rx fifo not empty after write, dumping data:\n");
> > -		dsi_vc_flush_receive_data(dsi, msg->channel);
> > +		dsi_vc_flush_receive_data(dsi, vc);
> >  		return -EIO;
> >  	}
> > =20
> > @@ -2888,21 +2888,20 @@ static int dsi_vc_dcs_read(struct omap_dss_devi=
ce *dssdev, int vc,
> >  {
> >  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> >  	u8 cmd =3D ((u8 *)msg->tx_buf)[0];
> > -	u8 channel =3D msg->channel;
> >  	int r;
> > =20
> >  	if (dsi->debug_read)
> > -		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, cmd);
> > +		DSSDBG("%s(ch %d, cmd %x)\n", __func__, vc, cmd);
>=20
> How about also renaming ch to vc in the message ?
>=20
> > =20
> >  	r =3D dsi_vc_send_short(dsi, vc, msg);
> >  	if (r)
> >  		goto err;
> > =20
> > -	r =3D dsi_vc_send_bta_sync(dssdev, channel);
> > +	r =3D dsi_vc_send_bta_sync(dssdev, vc);
> >  	if (r)
> >  		goto err;
> > =20
> > -	r =3D dsi_vc_read_rx_fifo(dsi, channel, msg->rx_buf, msg->rx_len,
> > +	r =3D dsi_vc_read_rx_fifo(dsi, vc, msg->rx_buf, msg->rx_len,
> >  		DSS_DSI_CONTENT_DCS);
> >  	if (r < 0)
> >  		goto err;
> > @@ -2914,7 +2913,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device=
 *dssdev, int vc,
> > =20
> >  	return 0;
> >  err:
> > -	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__,  msg->channel, cmd=
);
> > +	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__,  vc, cmd);
>=20
> Same here.
>=20
> >  	return r;
> >  }
> > =20
> > @@ -2928,11 +2927,11 @@ static int dsi_vc_generic_read(struct omap_dss_=
device *dssdev, int vc,
> >  	if (r)
> >  		goto err;
> > =20
> > -	r =3D dsi_vc_send_bta_sync(dssdev, msg->channel);
> > +	r =3D dsi_vc_send_bta_sync(dssdev, vc);
> >  	if (r)
> >  		goto err;
> > =20
> > -	r =3D dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
> > +	r =3D dsi_vc_read_rx_fifo(dsi, vc, msg->rx_buf, msg->rx_len,
> >  		DSS_DSI_CONTENT_GENERIC);
> >  	if (r < 0)
> >  		goto err;
> > @@ -2944,7 +2943,7 @@ static int dsi_vc_generic_read(struct omap_dss_de=
vice *dssdev, int vc,
> > =20
> >  	return 0;
> >  err:
> > -	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  msg->channel, msg-=
>tx_len);
> > +	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
>=20
> And here.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> >  	return r;
> >  }
> > =20
> > @@ -4893,7 +4892,7 @@ static ssize_t _omap_dsi_host_transfer(struct dsi=
_data *dsi, int vc,
> >  	int r;
> > =20
> >  	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) !=3D dsi->in_lp_mode)
> > -		dsi_vc_enable_hs(dssdev, msg->channel,
> > +		dsi_vc_enable_hs(dssdev, vc,
> >  				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
> > =20
> >  	switch (msg->type) {
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--y4vambtgrohnuicd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XiSsACgkQ2O7X88g7
+pquBw//WyDcMRvsogUjmIDdn/TF0eUPd30+oF9S8COVFGLVCUs7bsLwcYuzVBbE
yTuUyGz1XmDi/oboY9X2UmujokoRLrdryDxj6yY0X5muNzptiHMlXVeeXWyTyzo5
s7psu2oaBWMI7hnkrTW0nKY7nrlNIfID86gOGX+E+sWRAUdswW+PAxEBx+LkSFfx
pJsyXR8ifDNT4KzEZ+F2yJDrWP/33ZbAOHwH7IdBsGuuSIZmSjnENtuz12ItxMLx
OsqqhNajvqMdnSoMdVDaCwyhJswJByiwbx/8hQmTGyGHz3lTNZDcKtq+MuOuxR2R
iiGvy6l0bfFrVrOkkaf6PEXNKKX5xV0bLsfQEBULIWmWdtBswmFUJ3MlkFsdAA6S
bxU/jKBeay2Fy151t80BUAbfsbCFXrS3OZGgA6aThFeJuUDVjRzE5+ScJ7hERB0N
QWIjzveDj1We15aGwlwrc0JKsTSAkJ83JHT/zSEp0kYHX1mePJbShr9cNz13LIA1
zVkmqfYp4mA4X9uyV+2xER24TBvYZ4wg1mdXSv3FiN11T4rPjTeCOZ0Rijyy7XC9
mmdF1lifF8X5Tg7ZT2lMQYu9urH3oWj/gnwt9cx4K87BpBkZ8e5jOtZLWhBcehts
d+6FAuQ34kua0TO+7mnLDJHg6Sd48Hx6YUUyJQc6yh9gLEx8qsY=
=qvoe
-----END PGP SIGNATURE-----

--y4vambtgrohnuicd--

--===============1361007672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1361007672==--
