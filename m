Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC104170B42
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 23:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1E6890B2;
	Wed, 26 Feb 2020 22:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F960890B2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 22:12:09 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09FF72072D;
 Wed, 26 Feb 2020 22:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582755129;
 bh=KF4JGqyvPyYrE62O4ZXyNhw9QSFsaoR3MAv27zMCHas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oYu3qQcmf4CVfj0HmvMQpaWe9rr2D0zzFNtiLerJkpj/SUHSL4dCbFULYF642eMCb
 GI6T7ExTGNRcJnF293vG1jjrAmaJWdqepM8cekgOOc65kEg1LiqL12Dv+v2k4isoFw
 JHbCnhckCRsb1txz+yTnbCBuXJYllX/MoJDGZd2U=
Received: by earth.universe (Postfix, from userid 1000)
 id 95C1D3C0C83; Wed, 26 Feb 2020 23:12:06 +0100 (CET)
Date: Wed, 26 Feb 2020 23:12:06 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 08/56] drm/omap: panel-dsi-cm: convert to transfer API
Message-ID: <20200226221206.bazba2kia7hzani6@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-9-sebastian.reichel@collabora.com>
 <20200225145221.GG4764@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200225145221.GG4764@pendragon.ideasonboard.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0887813265=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0887813265==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhnsu7ty2ssdcicb"
Content-Disposition: inline


--zhnsu7ty2ssdcicb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 25, 2020 at 04:52:21PM +0200, Laurent Pinchart wrote:
> Hi Sebastian,
>=20
> Thank you for the patch.
>=20
> On Tue, Feb 25, 2020 at 12:20:38AM +0100, Sebastian Reichel wrote:
> > This converts the panel-dsi-cm driver to use the transfer
> > API instead of specific functions, so that the specific
> > functions can be unexported and squashed into the generic
> > transfer function.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 133 +++++++++++++-----
> >  1 file changed, 96 insertions(+), 37 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/=
gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > index e6ebfc35243e..92f510a771fe 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > @@ -140,45 +140,61 @@ static void hw_guard_wait(struct panel_drv_data *=
ddata)
> >  static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, =
u8 *data)
> >  {
> >  	struct omap_dss_device *src =3D ddata->src;
> > -	int r;
> > -	u8 buf[1];
> > -
> > -	r =3D src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd, buf, 1);
> > -
> > -	if (r < 0)
> > -		return r;
> > -
> > -	*data =3D buf[0];
> > +	const struct mipi_dsi_msg msg =3D {
> > +		.channel =3D ddata->channel,
> > +		.type =3D MIPI_DSI_DCS_READ,
> > +		.tx_len =3D 1,
> > +		.tx_buf =3D &dcs_cmd,
> > +		.rx_len =3D 1,
> > +		.rx_buf =3D data
> > +	};
> > =20
> > -	return 0;
> > +	return src->ops->dsi.transfer(src, &msg);
> >  }
> > =20
> >  static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
> >  {
> >  	struct omap_dss_device *src =3D ddata->src;
> > +	const struct mipi_dsi_msg msg =3D {
> > +		.channel =3D ddata->channel,
> > +		.type =3D MIPI_DSI_DCS_SHORT_WRITE,
> > +		.tx_buf =3D &dcs_cmd,
> > +		.tx_len =3D 1,
> > +	};
> > =20
> > -	return src->ops->dsi.dcs_write(src, ddata->channel, &dcs_cmd, 1);
> > +	return src->ops->dsi.transfer(src, &msg);
> >  }
> > =20
> >  static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd,=
 u8 param)
> >  {
> >  	struct omap_dss_device *src =3D ddata->src;
> > -	u8 buf[2] =3D { dcs_cmd, param };
> > +	const u8 buf[] =3D { dcs_cmd, param };
> > +	const struct mipi_dsi_msg msg =3D {
> > +		.channel =3D ddata->channel,
> > +		.type =3D MIPI_DSI_DCS_SHORT_WRITE_PARAM,
> > +		.tx_buf =3D &buf,
> > +		.tx_len =3D 2,
> > +	};
> > =20
> > -	return src->ops->dsi.dcs_write(src, ddata->channel, buf, 2);
> > +	return src->ops->dsi.transfer(src, &msg);
> >  }
> > =20
> >  static int dsicm_sleep_in(struct panel_drv_data *ddata)
> > =20
> >  {
> >  	struct omap_dss_device *src =3D ddata->src;
> > -	u8 cmd;
> >  	int r;
> > +	const u8 cmd =3D MIPI_DCS_ENTER_SLEEP_MODE;
> > +	const struct mipi_dsi_msg msg =3D {
> > +		.channel =3D ddata->channel,
> > +		.type =3D MIPI_DSI_DCS_SHORT_WRITE,
> > +		.tx_buf =3D &cmd,
> > +		.tx_len =3D 1,
> > +	};
> > =20
> >  	hw_guard_wait(ddata);
> > =20
> > -	cmd =3D MIPI_DCS_ENTER_SLEEP_MODE;
> > -	r =3D src->ops->dsi.dcs_write_nosync(src, ddata->channel, &cmd, 1);
> > +	r =3D src->ops->dsi.transfer(src, &msg);
>=20
> Should you call dsicm_dcs_write_0(ddata, MIPI_DCS_ENTER_SLEEP_MODE)
> instead ? This uses the _nosync variant though, is it an issue ?

Right, this will be replaced by mipi_dsi_dcs_enter_sleep_mode() in
a future patch. I did not notice any issues with commands not being
send when panel is turned off, so it should be fine.

> >  	if (r)
> >  		return r;
> > =20
> > @@ -233,28 +249,44 @@ static int dsicm_set_update_window(struct panel_d=
rv_data *ddata,
> >  	u16 y1 =3D y;
> >  	u16 y2 =3D y + h - 1;
> > =20
> > -	u8 buf[5];
> > -	buf[0] =3D MIPI_DCS_SET_COLUMN_ADDRESS;
> > -	buf[1] =3D (x1 >> 8) & 0xff;
> > -	buf[2] =3D (x1 >> 0) & 0xff;
> > -	buf[3] =3D (x2 >> 8) & 0xff;
> > -	buf[4] =3D (x2 >> 0) & 0xff;
> > +	const u8 paramX[] =3D {
> > +		MIPI_DCS_SET_COLUMN_ADDRESS,
> > +		(x1 >> 8) & 0xff,
> > +		(x1 >> 0) & 0xff,
> > +		(x2 >> 8) & 0xff,
> > +		(x2 >> 0) & 0xff,
> > +	};
> > =20
> > -	r =3D src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof=
(buf));
> > -	if (r)
> > -		return r;
> > +	const struct mipi_dsi_msg msgX =3D {
> > +		.channel =3D ddata->channel,
> > +		.type =3D MIPI_DSI_GENERIC_LONG_WRITE,
> > +		.tx_buf =3D paramX,
> > +		.tx_len =3D 5,
> > +	};
> > =20
> > -	buf[0] =3D MIPI_DCS_SET_PAGE_ADDRESS;
> > -	buf[1] =3D (y1 >> 8) & 0xff;
> > -	buf[2] =3D (y1 >> 0) & 0xff;
> > -	buf[3] =3D (y2 >> 8) & 0xff;
> > -	buf[4] =3D (y2 >> 0) & 0xff;
> > +	const u8 paramY[] =3D {
> > +		MIPI_DCS_SET_PAGE_ADDRESS,
> > +		(y1 >> 8) & 0xff,
> > +		(y1 >> 0) & 0xff,
> > +		(y2 >> 8) & 0xff,
> > +		(y2 >> 0) & 0xff,
> > +	};
> > =20
> > -	r =3D src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof=
(buf));
>=20
> Also replacing a _nosync variant here.
>
> > +	const struct mipi_dsi_msg msgY =3D {
> > +		.channel =3D ddata->channel,
> > +		.type =3D MIPI_DSI_GENERIC_LONG_WRITE,
> > +		.tx_buf =3D paramY,
> > +		.tx_len =3D 5,
> > +	};
> > +
> > +
>=20
> A single blank line is enough.
>=20
> > +	r =3D src->ops->dsi.transfer(src, &msgX);
> >  	if (r)
> >  		return r;
> > =20
> > -	src->ops->dsi.bta_sync(src, ddata->channel);
> > +	r =3D src->ops->dsi.transfer(src, &msgY);
>=20
> And here, you're replacing bta_sync. If I understand the code correctly,
> you're essentially removing an optimization, as each write will sync,
> right ? I'm fine with this change if we add the functionality back later
> in this series.

Yes, this is an optimization. X and Y will be sync'd together. This
is removed here, so that we can use the common helpers:
mipi_dsi_dcs_set_column_address() and mipi_dsi_dcs_set_page_address().

Actually those are also removed even further when the update
handling is moved to DSI encoder. It should be possible to
reintroduce it there without the need to expose the nosync
feature via DRM API.

> > +	if (r)
> > +		return r;
> > =20
> >  	return r;
> >  }
> > @@ -991,6 +1023,27 @@ static int dsicm_get_te(struct omap_dss_device *d=
ssdev)
> >  	return r;
> >  }
> > =20
> > +static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
> > +                                        u16 size)
>=20
> Please use tabs instead of spaces for indentation.

Ack.

> > +{
> > +	struct panel_drv_data *ddata =3D to_panel_data(dssdev);
> > +	struct omap_dss_device *src =3D ddata->src;
> > +
> > +	const u8 buf[] =3D {
> > +		size & 0xff,
> > +		size >> 8 & 0xff,
> > +	};
> > +
> > +	const struct mipi_dsi_msg msg =3D {
> > +		.channel =3D ddata->channel,
> > +		.type =3D MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
> > +		.tx_buf =3D buf,
> > +		.tx_len =3D 2,
> > +	};
> > +
> > +	return src->ops->dsi.transfer(src, &msg);
> > +}
> > +
> >  static int dsicm_memory_read(struct omap_dss_device *dssdev,
> >  		void *buf, size_t size,
> >  		u16 x, u16 y, u16 w, u16 h)
> > @@ -1031,17 +1084,23 @@ static int dsicm_memory_read(struct omap_dss_de=
vice *dssdev,
> > =20
> >  	dsicm_set_update_window(ddata, x, y, w, h);
> > =20
> > -	r =3D src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, plen);
> > +	r =3D dsicm_set_max_rx_packet_size(dssdev, plen);
> >  	if (r)
> >  		goto err2;
> > =20
> >  	while (buf_used < size) {
> >  		u8 dcs_cmd =3D first ? 0x2e : 0x3e;
> > +		const struct mipi_dsi_msg msg =3D {
> > +			.channel =3D ddata->channel,
> > +			.type =3D MIPI_DSI_DCS_READ,
> > +			.tx_buf =3D &dcs_cmd,
> > +			.tx_len =3D 1,
> > +			.rx_buf =3D buf + buf_used,
> > +			.rx_len =3D size - buf_used,
> > +		};
> >  		first =3D 0;
> > =20
> > -		r =3D src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd,
> > -				buf + buf_used, size - buf_used);
> > -
> > +		r =3D src->ops->dsi.transfer(src, &msg);
> >  		if (r < 0) {
> >  			dev_err(dssdev->dev, "read error\n");
> >  			goto err3;
> > @@ -1065,7 +1124,7 @@ static int dsicm_memory_read(struct omap_dss_devi=
ce *dssdev,
> >  	r =3D buf_used;
> > =20
> >  err3:
> > -	src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, 1);
> > +	dsicm_set_max_rx_packet_size(dssdev, 1);
> >  err2:
> >  	src->ops->dsi.bus_unlock(src);
> >  err1:
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--zhnsu7ty2ssdcicb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5W7TMACgkQ2O7X88g7
+poB2RAAoLqMsVXJjWt2lbBVxV4paPt/w++rvPjcCTQzEd1EPruoZjyetOxSyYNC
C8X71Z7Grhb/LqTTAtJvaj+abXsnHq7EG4hRAFtY9GQHypTr3d0xFw5of6BrhHGm
pe1kTB8Htc5Cr4C6JvFft5foU9iM5bPOgKwknQ1tTsn64zmpuUHU8FXCD3ZbCrC1
kjYh5frtxShTRj7GNdFZh1Sw9jdDfVA9usHrUN9cbaTunY6z1XmpVLrwYMIAIPbs
WASakJYGOmPY2pgRysh6mZSy6ChWhuVK54Fsn7I/Q53o14e8MP063hVUTvewyKi6
cA45ACUqFALuTgrqqxxMAqmaxgx4uSI8XijJMe5U7NcAWeaRRisJq/k+1ceo7XT4
MNAUVUk6X4JxbenMVptHDwBivSqwhT1mwy+0g75CD8MDFxGciz0e8LpkXPT60rGf
jf2JujSLdQOO3dc8bBln4A2eOUHX2PBA+RRDZiIANrswq6TitAg75HYKtipcj7To
ntYxoJBt7+ngYmw5I5zb3H+/Vw6dI4Ff0Gw56CJp2r1tLdf+MJcO0YCJ1ZRNgdbn
M6pZcuJRGlC9QUbnbABGg5k1N9Kxg6m1O7oRTPHufCZDOaMy4yorneAj/B9Ohsmv
XnbMglElkQnWgEhGGPWnnLlucUtjcNcwKsd88Ui/UbqlgzXJTv0=
=uF2L
-----END PGP SIGNATURE-----

--zhnsu7ty2ssdcicb--

--===============0887813265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0887813265==--
