Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B12D9D6A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 18:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6AC6E08C;
	Mon, 14 Dec 2020 17:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5536E08C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 17:17:05 +0000 (UTC)
Date: Mon, 14 Dec 2020 18:17:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607966225;
 bh=UXqE8KDXEwGVgpN8odHRIJXGNCkcNp4f1pqgv3rMc+w=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=ahLKEyjy9zK5kS3KEWacgmZEEUE09Z8cw+n+rz0Lh6u6Ia+v/sBt1z9ApPjcNTHfK
 +xHTCLKXFFoY5llNVIcZ5wfHcL3r7SI2LA99jqyN7DU3jtD8qm7km35bLEEr2VT6Iw
 J2ZXLm+1utQ2pkH7AQjn+X4kLjLJHaGT7om/5ypXzksmM/F7U+b9LwguCwKJPB0mu2
 OYmBY2HrSHr3FK+IF6xH973WiKq5M/NkjWOpv6aNrTo4306pH3GMTkepmhu8Ou+8o4
 PNGrDhewDYAL0XEdOTcyBmzb3J5MCmn7xvnPt+d7HVilkzIaum53FLSL6HI+sa8Rja
 ccdjwN+iknnJw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 29/29] drm/omap: dsi: allow DSI commands to be sent
 early
Message-ID: <20201214171703.aljagq444etuzdnx@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-30-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-30-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============0090827376=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0090827376==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4o6apbwzibxmohte"
Content-Disposition: inline


--4o6apbwzibxmohte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:55PM +0200, Tomi Valkeinen wrote:
> Panel drivers can send DSI commands in panel's prepare(), which happens
> before the bridge's enable() is called. The OMAP DSI driver currently
> only sets up the DSI interface at bridge's enable(), so prepare() cannot
> be used to send DSI commands.
>=20
> This patch fixes the issue by making it possible to enable the DSI
> interface any time a command is about to be sent. Disabling the
> interface is be done via delayed work.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Would be nice to include the information why locking is ok from your
reply mails to the patch description. It was helpful for reviewing
the patch :)

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 49 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/omapdrm/dss/dsi.h |  3 ++
>  2 files changed, 47 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 53a64bc91867..34f665aa9a59 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3503,6 +3503,9 @@ static void dsi_enable(struct dsi_data *dsi)
> =20
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> +	if (WARN_ON(dsi->iface_enabled))
> +		return;
> +
>  	mutex_lock(&dsi->lock);
> =20
>  	r =3D dsi_runtime_get(dsi);
> @@ -3515,6 +3518,8 @@ static void dsi_enable(struct dsi_data *dsi)
>  	if (r)
>  		goto err_init_dsi;
> =20
> +	dsi->iface_enabled =3D true;
> +
>  	mutex_unlock(&dsi->lock);
> =20
>  	return;
> @@ -3530,6 +3535,9 @@ static void dsi_disable(struct dsi_data *dsi)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> +	if (WARN_ON(!dsi->iface_enabled))
> +		return;
> +
>  	mutex_lock(&dsi->lock);
> =20
>  	dsi_sync_vc(dsi, 0);
> @@ -3541,6 +3549,8 @@ static void dsi_disable(struct dsi_data *dsi)
> =20
>  	dsi_runtime_put(dsi);
> =20
> +	dsi->iface_enabled =3D false;
> +
>  	mutex_unlock(&dsi->lock);
>  }
> =20
> @@ -4229,10 +4239,12 @@ static ssize_t omap_dsi_host_transfer(struct mipi=
_dsi_host *host,
> =20
>  	dsi_bus_lock(dsi);
> =20
> -	if (dsi->video_enabled)
> -		r =3D _omap_dsi_host_transfer(dsi, vc, msg);
> -	else
> -		r =3D -EIO;
> +	if (!dsi->iface_enabled) {
> +		dsi_enable(dsi);
> +		schedule_delayed_work(&dsi->dsi_disable_work, msecs_to_jiffies(2000));
> +	}
> +
> +	r =3D _omap_dsi_host_transfer(dsi, vc, msg);
> =20
>  	dsi_bus_unlock(dsi);
> =20
> @@ -4397,6 +4409,14 @@ static int omap_dsi_host_detach(struct mipi_dsi_ho=
st *host,
>  	if (WARN_ON(dsi->dsidev !=3D client))
>  		return -EINVAL;
> =20
> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> +
> +	if (dsi->iface_enabled) {
> +		dsi_bus_lock(dsi);
> +		dsi_disable(dsi);
> +		dsi_bus_unlock(dsi);
> +	}
> +
>  	omap_dsi_unregister_te_irq(dsi);
>  	dsi->dsidev =3D NULL;
>  	return 0;
> @@ -4632,9 +4652,12 @@ static void dsi_bridge_enable(struct drm_bridge *b=
ridge)
>  	struct dsi_data *dsi =3D drm_bridge_to_dsi(bridge);
>  	struct omap_dss_device *dssdev =3D &dsi->output;
> =20
> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> +
>  	dsi_bus_lock(dsi);
> =20
> -	dsi_enable(dsi);
> +	if (!dsi->iface_enabled)
> +		dsi_enable(dsi);
> =20
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
> =20
> @@ -4648,6 +4671,8 @@ static void dsi_bridge_disable(struct drm_bridge *b=
ridge)
>  	struct dsi_data *dsi =3D drm_bridge_to_dsi(bridge);
>  	struct omap_dss_device *dssdev =3D &dsi->output;
> =20
> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> +
>  	dsi_bus_lock(dsi);
> =20
>  	dsi->video_enabled =3D false;
> @@ -4840,6 +4865,18 @@ static const struct soc_device_attribute dsi_soc_d=
evices[] =3D {
>  	{ /* sentinel */ }
>  };
> =20
> +static void omap_dsi_disable_work_callback(struct work_struct *work)
> +{
> +	struct dsi_data *dsi =3D container_of(work, struct dsi_data, dsi_disabl=
e_work.work);
> +
> +	dsi_bus_lock(dsi);
> +
> +	if (dsi->iface_enabled && !dsi->video_enabled)
> +		dsi_disable(dsi);
> +
> +	dsi_bus_unlock(dsi);
> +}
> +
>  static int dsi_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *soc;
> @@ -4873,6 +4910,8 @@ static int dsi_probe(struct platform_device *pdev)
>  	INIT_DEFERRABLE_WORK(&dsi->framedone_timeout_work,
>  			     dsi_framedone_timeout_work_callback);
> =20
> +	INIT_DEFERRABLE_WORK(&dsi->dsi_disable_work, omap_dsi_disable_work_call=
back);
> +
>  #ifdef DSI_CATCH_MISSING_TE
>  	timer_setup(&dsi->te_timer, dsi_te_timeout, 0);
>  #endif
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/=
dss/dsi.h
> index de9411067ba2..601707c0ecc4 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
> @@ -394,6 +394,7 @@ struct dsi_data {
>  	atomic_t do_ext_te_update;
> =20
>  	bool te_enabled;
> +	bool iface_enabled;
>  	bool video_enabled;
> =20
>  	struct delayed_work framedone_timeout_work;
> @@ -443,6 +444,8 @@ struct dsi_data {
> =20
>  	struct omap_dss_device output;
>  	struct drm_bridge bridge;
> +
> +	struct delayed_work dsi_disable_work;
>  };
> =20
>  struct dsi_packet_sent_handler_data {
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--4o6apbwzibxmohte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XngcACgkQ2O7X88g7
+ppm2g//VpktfO2DsUVoiXKxpHpreA6RFuh4bC3wyzTHCPVfj0/piT6GrvWTbTnm
lZANuLUXizAT05io9fNlf03MgMr4sm8WUdwuIXvrJWa+F679VNR63l6OUMlcUGpo
XIEZxgMFim6kDji4CdTcEORR8xbSmQPdBWi5Mx0hU4s2HSqXso8z+fxJDsw4SRhB
pT6/Sw8PG9W29APSMBoydyrpE7F0HPQ9whAgHyPWjMZTmFgijpFY3zsKkbIiqvFR
cfmKtSToNoQJk//+6bQSluDVmi2Rl0BLWBYRI8VitvCf0MgewVPGBr3Zj+bdbxiK
fHT8fo8RqRyxmmbEkwhwZ45XM7DB95t1vYWL4anG5lMnxbiJg0Z1HJ750sy5PtLl
bivSrxlzTGZsyIF9eL7R9lPDsQY9rSCYPOaWyNcuxYuinaY2p1PEls9PXUAxGfRc
dBI9g0qBwdMfaXQzD9fUYc+sBwkEltwX7I11TSGgmhDljnw/IT5i3hhFWcIpiLnd
x6swAeJt1pbHr9D5GVEmS0nhPU2zZ5a8X36vGo9StYABFn129u9RmTDEQ2fh/j5+
ytqg8JIjgZoOI43Fe/+VyJQdOxwGKgvA3ABvDYEv8fW5MORtkG/dpU0ORGc46bII
Yt2wfdXMUAhdhtXO+5X5AmaRIuf/apVYw5wJFedldv8f1xpKCUs=
=mRD1
-----END PGP SIGNATURE-----

--4o6apbwzibxmohte--

--===============0090827376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0090827376==--
