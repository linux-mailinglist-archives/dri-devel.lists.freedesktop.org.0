Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8B2D99FC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 15:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D59D6E22C;
	Mon, 14 Dec 2020 14:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1F6E221
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:31:32 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:31:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607956292;
 bh=3rB/z4l5S0QboW7hQONz0dxn6Vz1NEs2veNjXR9NvT8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=QHL691WnncLQQKnfWXf5q49vsBTw7P/VwuxIbQRL8ytWh5QL+PuOWSZsV4yGctMhJ
 0sSh5F/xLUyNiO9cbugiqIZj0HT2jMRL4Hjhea9SRstHKKCmgGdS8WoAAMPiP3OL2z
 dFqm+dLZYN+NPayFp8XHUC8kMvTKZnu9N+DcnG7pArFEPmPDXizKoEWFYs11fiwbPK
 B7cWPcUYuDOed4oZSKeMsU5VYLfGCq48YZDk+reIIS8sFV4BrX/44qGi594FAUGR8Y
 Fa0mMpz1KIOgabezfsLPGVyUQq2bwBpVQ4v+ekt9nLjTULC7R3vgdCmqzUJQpSIXGI
 2jcUSpcwcG5VA==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 07/29] drm/omap: dsi: simplify VC handling
Message-ID: <20201214143130.dhfft3xqk4jneydr@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-8-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-8-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1382554186=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1382554186==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fye2upimt2iaiq6n"
Content-Disposition: inline


--fye2upimt2iaiq6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:33PM +0200, Tomi Valkeinen wrote:
> The VC handling has gotten quite tangled up. As the first step to clean
> it up, lets define that we only support a single DSI peripheral (which
> was really already the case), and we always use VC0 (define VC_DEFAULT
> 0) register block to send data to the peripheral.
>=20
> We can thus have a single mipi_dsi_device pointer and remove the
> for-loops which made passes over all the four VCs (just the first one
> was ever used).
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 49 ++++++++-----------------------
>  1 file changed, 13 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index c6e044f8bece..5e13478010db 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -360,9 +360,10 @@ struct dsi_data {
>  	bool vdds_dsi_enabled;
>  	struct regulator *vdds_dsi_reg;
> =20
> +	struct mipi_dsi_device *dsidev;
> +
>  	struct {
>  		enum dsi_vc_source source;
> -		struct mipi_dsi_device *dest;
>  		enum fifo_size tx_fifo_size;
>  		enum fifo_size rx_fifo_size;
>  	} vc[4];
> @@ -452,6 +453,8 @@ static bool dsi_perf;
>  module_param(dsi_perf, bool, 0644);
>  #endif
> =20
> +#define VC_DEFAULT 0
> +
>  #define drm_bridge_to_dsi(bridge) \
>  	container_of(bridge, struct dsi_data, bridge)
> =20
> @@ -3716,16 +3719,11 @@ static void dsi_disable_video_output(struct omap_=
dss_device *dssdev, int channel
>  static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> -	unsigned int i;
> =20
>  	dsi_bus_lock(dsi);
>  	dsi->video_enabled =3D false;
> =20
> -	for (i =3D 0; i < 4; i++) {
> -		if (!dsi->vc[i].dest)
> -			continue;
> -		dsi_disable_video_output(dssdev, i);
> -	}
> +	dsi_disable_video_output(dssdev, VC_DEFAULT);
> =20
>  	dsi_display_disable(dssdev);
> =20
> @@ -3914,11 +3912,6 @@ static int dsi_update_channel(struct omap_dss_devi=
ce *dssdev, int channel)
>  		goto err;
>  	}
> =20
> -	if (!dsi->vc[channel].dest) {
> -		r =3D -ENODEV;
> -		goto err;
> -	}
> -
>  	if (dsi->vm.hactive =3D=3D 0 || dsi->vm.vactive =3D=3D 0) {
>  		r =3D -EINVAL;
>  		goto err;
> @@ -3959,16 +3952,7 @@ static int dsi_update_channel(struct omap_dss_devi=
ce *dssdev, int channel)
> =20
>  static int dsi_update_all(struct omap_dss_device *dssdev)
>  {
> -	unsigned int i;
> -	int r;
> -
> -	for (i =3D 0; i < 4; i++) {
> -		r =3D dsi_update_channel(dssdev, i);
> -		if (r && r !=3D -ENODEV)
> -			return r;
> -	}
> -
> -	return r;
> +	return dsi_update_channel(dssdev, VC_DEFAULT);
>  }
> =20
>  /* Display funcs */
> @@ -4196,17 +4180,12 @@ static void dsi_display_enable(struct omap_dss_de=
vice *dssdev)
>  static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> -	unsigned int i;
> =20
>  	dsi_bus_lock(dsi);
> =20
>  	dsi_display_enable(dssdev);
> =20
> -	for (i =3D 0; i < 4; i++) {
> -		if (!dsi->vc[i].dest)
> -			continue;
> -		dsi_enable_video_output(dssdev, i);
> -	}
> +	dsi_enable_video_output(dssdev, VC_DEFAULT);
> =20
>  	dsi->video_enabled =3D true;
> =20
> @@ -5095,8 +5074,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_hos=
t *host,
>  	if (channel > 3)
>  		return -EINVAL;
> =20
> -	if (dsi->vc[channel].dest) {
> -		DSSERR("cannot get VC for display %s", dev_name(&client->dev));
> +	if (dsi->dsidev) {
> +		DSSERR("dsi client already attached\n");
>  		return -EBUSY;
>  	}
> =20
> @@ -5117,7 +5096,7 @@ static int omap_dsi_host_attach(struct mipi_dsi_hos=
t *host,
>  		dsi->mode =3D OMAP_DSS_DSI_CMD_MODE;
>  	}
> =20
> -	dsi->vc[channel].dest =3D client;
> +	dsi->dsidev =3D client;
>  	dsi->pix_fmt =3D client->format;
> =20
>  	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
> @@ -5149,11 +5128,11 @@ static int omap_dsi_host_detach(struct mipi_dsi_h=
ost *host,
>  	if (channel > 3)
>  		return -EINVAL;
> =20
> -	if (dsi->vc[channel].dest !=3D client)
> +	if (WARN_ON(dsi->dsidev !=3D client))
>  		return -EINVAL;
> =20
>  	omap_dsi_unregister_te_irq(dsi);
> -	dsi->vc[channel].dest =3D NULL;
> +	dsi->dsidev =3D NULL;
>  	return 0;
>  }
> =20
> @@ -5685,10 +5664,8 @@ static int dsi_probe(struct platform_device *pdev)
>  	}
> =20
>  	/* DSI VCs initialization */
> -	for (i =3D 0; i < ARRAY_SIZE(dsi->vc); i++) {
> +	for (i =3D 0; i < ARRAY_SIZE(dsi->vc); i++)
>  		dsi->vc[i].source =3D DSI_VC_SOURCE_L4;
> -		dsi->vc[i].dest =3D NULL;
> -	}
> =20
>  	r =3D dsi_get_clocks(dsi);
>  	if (r)
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--fye2upimt2iaiq6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/Xd0IACgkQ2O7X88g7
+pqQZg/+JKHA7HZqEmwlnkbcBFkxHjUTYKhet7kmnxMjiQ59Ofsdwl+z/3f/bjG9
Wl2O00YJn87aS8OF4YrGyVVnu6mwYsiaUbY5I/GaZYaOnhd5ugwR6qhMrTGlwAq7
7s1Fv+nAnkoKB48XlF0PtMh8Hf7npUDtNgmEmf3vGPWWAUxKoKO25wkHRRVt8ekz
CrbLussRi/6dc2xD24fN4ZQfjycE/4JHJyGq/JiHTGKTWoX/bCMH/p1wyz3BXuFO
OTL2vjgZy1r70uZm9T2ub4CXVv6IG9nON8l7bOMZwQLPGLnuto70g0KUsDgFWgje
dzzi01n7tf7QM4iskYW+jeNEyeu2B8aMzyO+RPTpWLePCEGlvYZYg82Tp2qOn9QU
AICesFEpwauLup7d4gIp5eNN+97XLaSMSmqDBgEIiWe7H04WfXuJJ51iOmLdzeIK
TZ/f8Mv2atXH3wANxIHL0LG0CKwreFH9iRoJszK9bDPeKjn2hcPgPEuYoHUr/ZD7
/A1b/kPt1Dqe0FOMDjLv+wsSU21iCL8uKfcD9YXOiXhrPIgLBQYkZupU7AVE39wE
vgkeoPqVhXMkJzPYemYbg9SB5yEDqwwHPvcz1d36BMT9yzzPbHofoQlJB4uh4Ogv
sTX0FAk3zCR/PH43GNHkKiO+xwoxgiIuZNa6/vKjlPk9KdG9nfg=
=VVU3
-----END PGP SIGNATURE-----

--fye2upimt2iaiq6n--

--===============1382554186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1382554186==--
