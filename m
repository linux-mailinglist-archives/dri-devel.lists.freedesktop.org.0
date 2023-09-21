Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6537A99ED
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7386710E152;
	Thu, 21 Sep 2023 18:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1825C10E152
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:33:51 +0000 (UTC)
Received: from mercury (unknown [185.254.75.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6743E6607298;
 Thu, 21 Sep 2023 19:33:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695321229;
 bh=lDQ8GBBO0ng+H4kWbKPjf5JLKqSr+zH/fT77VHc7Fhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5bHcWZyf7OCCMpztwXTN34U3HeSXmUlHykJ9GhM/mwXp6Mz2AuqpJi9SSWxhUmhJ
 DVbq7QVgsiv+ULzMYj9hexrgx8dDqmsM5NCJ+pCBfc3vbkEmifUIekctQ4ZbKtCe2E
 9tAp/fOxrD/oI2Ou5XaMTF+O3oeiSEsGej3jC0lR5A72KfbvqwhDzaYSzM7668Hddq
 wI8l/d+aJJoUFzD/apKEZRb8L7xZO/59xRFB4wR1BljvH7apNbl64zsIf/abiBIeNX
 tFq+qjVWQlpOee4MAIFC1rJmCNVEoayDspiudsNwXCYA3WB4q8tVm3JwOBEIri1hRQ
 20u+MT3JT8diQ==
Received: by mercury (Postfix, from userid 1000)
 id B24E210604CA; Thu, 21 Sep 2023 20:33:45 +0200 (CEST)
Date: Thu, 21 Sep 2023 20:33:45 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm/mipi-dsi: Fix detach call without attach
Message-ID: <20230921183345.nbglbbbhh3g4hznl@mercury.elektranox.org>
References: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6ftich7izjxfzuy5"
Content-Disposition: inline
In-Reply-To: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6ftich7izjxfzuy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 21, 2023 at 01:50:32PM +0300, Tomi Valkeinen wrote:
> It's been reported that DSI host driver's detach can be called without
> the attach ever happening:
>=20
> https://lore.kernel.org/all/20230412073954.20601-1-tony@atomide.com/
>=20
> After reading the code, I think this is what happens:
>=20
> We have a DSI host defined in the device tree and a DSI peripheral under
> that host (i.e. an i2c device using the DSI as data bus doesn't exhibit
> this behavior).
>=20
> The host driver calls mipi_dsi_host_register(), which causes (via a few
> functions) mipi_dsi_device_add() to be called for the DSI peripheral. So
> now we have a DSI device under the host, but attach hasn't been called.
>=20
> Normally the probing of the devices continues, and eventually the DSI
> peripheral's driver will call mipi_dsi_attach(), attaching the
> peripheral.
>=20
> However, if the host driver's probe encounters an error after calling
> mipi_dsi_host_register(), and before the peripheral has called
> mipi_dsi_attach(), the host driver will do cleanups and return an error
> from its probe function. The cleanups include calling
> mipi_dsi_host_unregister().
>=20
> mipi_dsi_host_unregister() will call two functions for all its DSI
> peripheral devices: mipi_dsi_detach() and mipi_dsi_device_unregister().
> The latter makes sense, as the device exists, but the former may be
> wrong as attach has not necessarily been done.
>=20
> To fix this, track the attached state of the peripheral, and only detach
> from mipi_dsi_host_unregister() if the peripheral was attached.
>=20
> Note that I have only tested this with a board with an i2c DSI
> peripheral, not with a "pure" DSI peripheral.
>=20
> However, slightly related, the unregister machinery still seems broken.
> E.g. if the DSI host driver is unbound, it'll detach and unregister the
> DSI peripherals. After that, when the DSI peripheral driver unbound
> it'll call detach either directly or using the devm variant, leading to
> a crash. And probably the driver will crash if it happens, for some
> reason, to try to send a message via the DSI bus.
>=20
> But that's another topic.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/drm_mipi_dsi.c | 17 +++++++++++++++--
>  include/drm/drm_mipi_dsi.h     |  2 ++
>  2 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index 14201f73aab1..843a6dbda93a 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -347,7 +347,8 @@ static int mipi_dsi_remove_device_fn(struct device *d=
ev, void *priv)
>  {
>  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(dev);
> =20
> -	mipi_dsi_detach(dsi);
> +	if (dsi->attached)
> +		mipi_dsi_detach(dsi);
>  	mipi_dsi_device_unregister(dsi);
> =20
>  	return 0;
> @@ -370,11 +371,18 @@ EXPORT_SYMBOL(mipi_dsi_host_unregister);
>  int mipi_dsi_attach(struct mipi_dsi_device *dsi)
>  {
>  	const struct mipi_dsi_host_ops *ops =3D dsi->host->ops;
> +	int ret;
> =20
>  	if (!ops || !ops->attach)
>  		return -ENOSYS;
> =20
> -	return ops->attach(dsi->host, dsi);
> +	ret =3D ops->attach(dsi->host, dsi);
> +	if (ret)
> +		return ret;
> +
> +	dsi->attached =3D true;
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(mipi_dsi_attach);
> =20
> @@ -386,9 +394,14 @@ int mipi_dsi_detach(struct mipi_dsi_device *dsi)
>  {
>  	const struct mipi_dsi_host_ops *ops =3D dsi->host->ops;
> =20
> +	if (WARN_ON(!dsi->attached))
> +		return -EINVAL;
> +
>  	if (!ops || !ops->detach)
>  		return -ENOSYS;
> =20
> +	dsi->attached =3D false;
> +
>  	return ops->detach(dsi->host, dsi);
>  }
>  EXPORT_SYMBOL(mipi_dsi_detach);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index c9df0407980c..c0aec0d4d664 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -168,6 +168,7 @@ struct mipi_dsi_device_info {
>   * struct mipi_dsi_device - DSI peripheral device
>   * @host: DSI host for this peripheral
>   * @dev: driver model device node for this peripheral
> + * @attached: the DSI device has been successfully attached
>   * @name: DSI peripheral chip type
>   * @channel: virtual channel assigned to the peripheral
>   * @format: pixel format for video mode
> @@ -184,6 +185,7 @@ struct mipi_dsi_device_info {
>  struct mipi_dsi_device {
>  	struct mipi_dsi_host *host;
>  	struct device dev;
> +	bool attached;
> =20
>  	char name[DSI_DEV_NAME_SIZE];
>  	unsigned int channel;
>=20
> ---
> base-commit: 9fc75c40faa29df14ba16066be6bdfaea9f39ce4
> change-id: 20230921-dsi-detach-fix-6736f7a48ba7
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20

--6ftich7izjxfzuy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUMjIIACgkQ2O7X88g7
+pqw6w/8DQfaBWez0s+nGhOdT5JZQAFfDfjB9f97SUg4YL3nbquq1CW5lWs8IqYy
cZJp7h50+GPFqka87gtUiMuMOuM4MXBe1vy08LnM0cWeMyLNUPsSVfzclprCeuPP
Yz8JyjauIwEK8s3bAAx3BEC4aqKk3d2/D+PF4FIZISMrhgduupvV/lI1aLV0LN5w
lI0h3J/9uagxnXTIU6meqDaBvm1uNkgPqQ+dh42AWtQGGg8W4NmuUABDYZzcEqVh
8KYlj9c91b6dOdDP3aDbf/khqiJufWhI/JSIhF8cjVaZMmYQOl5TgwPYO0i0yJJs
IDLSytb762nibcCL4vE3Ab3IWUVsDCrJg9HLdHfwJD/SIj/kOA6uluzjMPIehQIP
657ay2mCTIFp5HgTbWvDrFlQxkOrFzyGNASvtSSaNy1NphvnC4qrSEDoXUlWVzTd
J3I2YSy3LlrSqcEXfObZQwhWqACnUT4mgSzZ88TiO3REroJvgKLnr3hLKVcbO7WN
8oCT18f6OUE4AtvJckDptSLVUQstwRfluz6jqq3vTeyS3LLxJAmu6sYHMXc38mZW
RTZQF9vJ6e70Ir3pmah9643L/e1GZAbhx5aQ2McGiWOvqt9nhxj2TKF3uftnDdY8
ONccI61oyjbXDYQPP7TPJ6operc6hI9ISSEpsOEnLmLLnr70NVA=
=aIji
-----END PGP SIGNATURE-----

--6ftich7izjxfzuy5--
