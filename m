Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF9170C9F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 00:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E686E1F6;
	Wed, 26 Feb 2020 23:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060986E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 23:34:33 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 988C324670;
 Wed, 26 Feb 2020 23:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582760073;
 bh=fZobbN6MJ6wCSI/9I2owrnCn7ucfi8JgoS7AnIPsNag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CDlW12V2TE/tWheRwikWML3/26TfteTWdmXl4g2nwJn8iIcM+TQ7FCWSwfz4lxOUx
 387D4sdS1Amem3TecZ3yeC+GICQgnSjlTLLNrnflYBOEhd/4FeecE1TodAwUfdCyGq
 oDjaJviTDS09GsqMVvhOnMibRfS+jhZt1WF8HhOA=
Received: by earth.universe (Postfix, from userid 1000)
 id 214643C0C83; Thu, 27 Feb 2020 00:34:31 +0100 (CET)
Date: Thu, 27 Feb 2020 00:34:31 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 13/56] drm/omap: dsi: switch dsi_vc_send_long/short to
 mipi_dsi_msg
Message-ID: <20200226233431.c7spyx6kem4tr7xw@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-14-sebastian.reichel@collabora.com>
 <20200225163001.GN4764@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200225163001.GN4764@pendragon.ideasonboard.com>
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
Content-Type: multipart/mixed; boundary="===============0345453672=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0345453672==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4gorsnrfznbfjk6b"
Content-Disposition: inline


--4gorsnrfznbfjk6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Feb 25, 2020 at 06:30:01PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 25, 2020 at 12:20:43AM +0100, Sebastian Reichel wrote:
> > Simplify the DSI encoder by using mipi_dsi_msg for
> > dsi_vc_send_long and dsi_vc_send_short. Further improvements
> > require cleaning up the channel allocation code first.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  drivers/gpu/drm/omapdrm/dss/dsi.c | 92 +++++++++++++++----------------
> >  1 file changed, 45 insertions(+), 47 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdr=
m/dss/dsi.c
> > index 9b5b078beb6d..4899bfa2d76f 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -2599,30 +2599,36 @@ static inline void dsi_vc_write_long_payload(st=
ruct dsi_data *dsi, int channel,
> >  	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
> >  }
> > =20
> > -static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data=
_type,
> > -			    const u8 *data, u16 len, u8 ecc)
> > +static int dsi_vc_send_long(struct dsi_data *dsi,
> > +			    const struct mipi_dsi_msg *msg)
> >  {
> > +	struct mipi_dsi_packet pkg;
> >  	/*u32 val; */
> >  	int i;
> >  	const u8 *p;
> >  	int r =3D 0;
> >  	u8 b1, b2, b3, b4;
> > =20
> > +	r =3D mipi_dsi_create_packet(&pkg, msg);
> > +	if (r < 0)
> > +		return r;
> > +
> >  	if (dsi->debug_write)
> > -		DSSDBG("dsi_vc_send_long, %d bytes\n", len);
> > +		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
> > =20
> >  	/* len + header */
> > -	if (dsi->vc[channel].tx_fifo_size * 32 * 4 < len + 4) {
> > +	if (dsi->vc[msg->channel].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
> >  		DSSERR("unable to send long packet: packet too long.\n");
> >  		return -EINVAL;
> >  	}
> > =20
> > -	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
> > +	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
> > =20
> > -	dsi_vc_write_long_header(dsi, channel, data_type, len, ecc);
> > +	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len,
> > +				 pkg.header[3]);
>=20
> mipi_dsi_create_packet() never sets header[3]. I suppose that's not an
> issue as we were always passing ecc as 0 to this function, but you may
> want to drop mipi_dsi_create_packet() above and just hardcode 0 here.

sure.

> > =20
> > -	p =3D data;
> > -	for (i =3D 0; i < len >> 2; i++) {
> > +	p =3D msg->tx_buf;
> > +	for (i =3D 0; i < msg->tx_len >> 2; i++) {
> >  		if (dsi->debug_write)
> >  			DSSDBG("\tsending full packet %d\n", i);
> > =20
> > @@ -2631,10 +2637,10 @@ static int dsi_vc_send_long(struct dsi_data *ds=
i, int channel, u8 data_type,
> >  		b3 =3D *p++;
> >  		b4 =3D *p++;
> > =20
> > -		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, b4);
> > +		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
> >  	}
> > =20
> > -	i =3D len % 4;
> > +	i =3D msg->tx_len % 4;
> >  	if (i) {
> >  		b1 =3D 0; b2 =3D 0; b3 =3D 0;
> > =20
> > @@ -2656,64 +2662,64 @@ static int dsi_vc_send_long(struct dsi_data *ds=
i, int channel, u8 data_type,
> >  			break;
> >  		}
> > =20
> > -		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, 0);
> > +		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, 0);
> >  	}
> > =20
> >  	return r;
> >  }
> > =20
> > -static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 dat=
a_type,
> > -			     u16 data, u8 ecc)
> > +static int dsi_vc_send_short(struct dsi_data *dsi,
> > +			     const struct mipi_dsi_msg *msg)
> >  {
> > +	struct mipi_dsi_packet pkg;
>=20
> s/pkg/pkt/ (or packet)

Ack.

-- Sebastian

> >  	u32 r;
> > -	u8 data_id;
> > +
> > +	r =3D mipi_dsi_create_packet(&pkg, msg);
> > +	if (r < 0)
> > +		return r;
> > =20
> >  	WARN_ON(!dsi_bus_is_locked(dsi));
> > =20
> >  	if (dsi->debug_write)
> >  		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
> > -				channel,
> > -				data_type, data & 0xff, (data >> 8) & 0xff);
> > +				msg->channel,
> > +				msg->type, pkg.header[1], pkg.header[2]);
> > =20
> > -	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
> > +	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
> > =20
> > -	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(channel)), 16, 16)) {
> > +	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(msg->channel)), 16, 16)) {
> >  		DSSERR("ERROR FIFO FULL, aborting transfer\n");
> >  		return -EINVAL;
> >  	}
> > =20
> > -	data_id =3D data_type | channel << 6;
> > -
> > -	r =3D (data_id << 0) | (data << 8) | (ecc << 24);
> > +	r =3D pkg.header[3] << 24 | pkg.header[2] << 16 | pkg.header[1] << 8 |
> > +	    pkg.header[0];
>=20
> OK, this justifies using mipi_dsi_create_packet(), so you can skip the
> related comments in earlier patches.
>=20
> > -	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel), r);
> > +	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(msg->channel), r);
> > =20
> >  	return 0;
> >  }
> > =20
> >  static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
> >  {
> > -	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, =
0);
> > +	const struct mipi_dsi_msg msg =3D {
> > +		.channel =3D channel,
> > +		.type =3D MIPI_DSI_NULL_PACKET,
> > +	};
> > +
> > +	return dsi_vc_send_long(dsi, &msg);
> >  }
> > =20
> >  static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> >  			       const struct mipi_dsi_msg *msg)
> >  {
> >  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> > -	struct mipi_dsi_packet packet;
> >  	int r;
> > =20
> > -	r =3D mipi_dsi_create_packet(&packet, msg);
> > -	if (r < 0)
> > -		return r;
> > -
> > -	if (mipi_dsi_packet_format_is_short(msg->type)) {
> > -		u16 data =3D packet.header[1] | (packet.header[2] << 8);
> > -		r =3D dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
> > -	} else {
> > -		r =3D dsi_vc_send_long(dsi, msg->channel, msg->type,
> > -						   msg->tx_buf, msg->tx_len, 0);
> > -	}
> > +	if (mipi_dsi_packet_format_is_short(msg->type))
> > +		r =3D dsi_vc_send_short(dsi, msg);
> > +	else
> > +		r =3D dsi_vc_send_long(dsi, msg);
> > =20
> >  	if (r < 0)
> >  		return r;
> > @@ -2853,10 +2859,10 @@ static int dsi_vc_dcs_read(struct omap_dss_devi=
ce *dssdev,
> >  			   const struct mipi_dsi_msg *msg)
> >  {
> >  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> > +	u8 cmd =3D ((u8*) msg->tx_buf)[0];
> >  	int r;
> > -	u8 dcs_cmd =3D ((u8*) msg->tx_buf)[0];
> > =20
> > -	r =3D dsi_vc_send_short(dsi, msg->channel, MIPI_DSI_DCS_READ, dcs_cmd=
, 0);
> > +	r =3D dsi_vc_send_short(dsi, msg);
> >  	if (r)
> >  		goto err;
> > =20
> > @@ -2877,7 +2883,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device=
 *dssdev,
> >  	return 0;
> >  err:
> >  	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n",
> > -		msg->channel, dcs_cmd);
> > +		msg->channel, cmd);
> >  	return r;
> >  }
> > =20
> > @@ -2885,17 +2891,9 @@ static int dsi_vc_generic_read(struct omap_dss_d=
evice *dssdev,
> >  			       const struct mipi_dsi_msg *msg)
> >  {
> >  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> > -	struct mipi_dsi_packet packet;
> > -	u16 data;
> >  	int r;
> > =20
> > -	r =3D mipi_dsi_create_packet(&packet, msg);
> > -	if (r < 0)
> > -		goto err;
> > -
> > -	data =3D packet.header[1] | (packet.header[2] << 8);
> > -
> > -	r =3D dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
> > +	r =3D dsi_vc_send_short(dsi, msg);
> >  	if (r)
> >  		goto err;
> > =20
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--4gorsnrfznbfjk6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5XAIMACgkQ2O7X88g7
+poxzA//UZBM7jbq5LR2YDY7HEU1dcllne8cOvDMEspcCbWkEkxVVbnsMjuh1fIk
rdsooFZ+itVNxCYysADwaYkiAuvO53Oycfv+ID83T6m2QwVVp/Zirsq7U88ZZhmq
DFeBW/RH70xKGAQa6eQZctP5zLUvHEpLgUzqwaNPLq8UPUvtJZ4alDO5utH4KcX0
Gj/K9J9yMl/7yLqBnEYlu8P23ikdHJTFlUlvdZC3ScStqokJov5UsZmUZ3Bfnvrx
tAdWStNWMOB61Jk/r3fnrDbTQMUJRdihlUCJMryarCnpbXx1dME7pL1p+aJ3DqZb
VgRDW0NhKvo0YVzWubEs+CQbwY/xODWlVatrvhX357dNQ71Tt2ZGx3t4LkuuK82K
u+nOqC6mDMUS3tD3qznfm8NsKMc1SxQSX4t9Lxm69cSQA2ODM6PgTozGtgycjvvh
w3XIxeM0eFV7LwvIEUSlEXmoymJK4qh457tM965FxyemOTVJGsPh5GRK6VAVmsIo
2w1UlnwTQXRt41DprHiXdVTU5V9PayvHxQSZeUZJQS4zMWTHOxGTVPgSP3jdvArQ
La5MiE/tUAhYgJ9ZeOYOOlQmL14oDBezclkznU1kgnz5Ss6kdt0/GXivkWmGa0aJ
26Op7n/I7VrrIJylvEDSl4D09GQHnL5ENUwntrxP3Etg4Ox5HtM=
=pzq/
-----END PGP SIGNATURE-----

--4gorsnrfznbfjk6b--

--===============0345453672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0345453672==--
