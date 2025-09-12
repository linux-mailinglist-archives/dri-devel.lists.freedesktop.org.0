Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C934B553AF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 17:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95F510EC9A;
	Fri, 12 Sep 2025 15:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aLXF526B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D0810EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 15:33:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F94044130;
 Fri, 12 Sep 2025 15:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6CAC4CEF1;
 Fri, 12 Sep 2025 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757691225;
 bh=TZsxSsLl1ZF/kLeCpDk3sug+FPKw9MiWr/SECsiw4MU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aLXF526BefTgEl9spOrlXrKiyu1TFqt01fSIJFLigjJQsmmSsFB0zypq3c4lTCOMu
 S0ubd2vhnaS/+QGc+AUO/pZxw583VdgrDVI5t18He2aCIKtxACWqbjbu99a2I3RQRr
 /TObS5br/ontes+x5A/NfK0M3N3iBLWaXVCMc2FnY/eYquBU6GA1CfHNhx8MiJVwbg
 pNQZU2lnpfJEhmLlVaQKplAZ8hXOG7dgnx4+7xI+YIxoSVS7ms8oB5baWQ9SPvgzAp
 ZV3I2D2I/j6fX5x2xeuMjAZWuVazJM3+0oIvUDeKVkMdf6T4Ma0A575yvb9mo4oQqv
 NIIiOS1WD8Caw==
Date: Fri, 12 Sep 2025 17:33:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, 
 andri@yngvason.is, sebastian.wick@redhat.com, daniel.stone@collabora.com, 
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch, 
 harry.wentland@amd.com, christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <20250912-efficient-pistachio-tiger-a7ce06@penduick>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3j2xocorbsfkurfa"
Content-Disposition: inline
In-Reply-To: <20250911130739.4936-6-marius.vlad@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3j2xocorbsfkurfa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 04:07:36PM +0300, Marius Vlad wrote:
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 61cab32e213a..15820e6ba057 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1057,7 +1057,7 @@ static int mtk_dpi_bind(struct device *dev, struct =
device *master, void *data)
>  	if (ret)
>  		goto err_cleanup;
> =20
> -	dpi->connector =3D drm_bridge_connector_init(drm_dev, &dpi->encoder);
> +	dpi->connector =3D drm_bridge_connector_init(drm_dev, &dpi->encoder, BI=
T(HDMI_COLORSPACE_RGB));
>  	if (IS_ERR(dpi->connector)) {
>  		dev_err(dev, "Unable to create bridge connector\n");
>  		ret =3D PTR_ERR(dpi->connector);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d7726091819c..91afdbf676f0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -930,7 +930,7 @@ static int mtk_dsi_encoder_init(struct drm_device *dr=
m, struct mtk_dsi *dsi)
>  	if (ret)
>  		goto err_cleanup_encoder;
> =20
> -	dsi->connector =3D drm_bridge_connector_init(drm, &dsi->encoder);
> +	dsi->connector =3D drm_bridge_connector_init(drm, &dsi->encoder, BIT(HD=
MI_COLORSPACE_RGB));
>  	if (IS_ERR(dsi->connector)) {
>  		DRM_ERROR("Unable to create bridge connector\n");
>  		ret =3D PTR_ERR(dsi->connector);
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm=
/meson/meson_encoder_cvbs.c
> index dc374bfc5951..a475fc34ca23 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -275,7 +275,8 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>  	}
> =20
>  	/* Initialize & attach Bridge Connector */
> -	connector =3D drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs-=
>encoder);
> +	connector =3D drm_bridge_connector_init(priv->drm,
> +			&meson_encoder_cvbs->encoder, BIT(HDMI_COLORSPACE_RGB));
>  	if (IS_ERR(connector))
>  		return dev_err_probe(priv->dev, PTR_ERR(connector),
>  				     "Unable to create CVBS bridge connector\n");

Why do we need to pass an HDMI color format for a DSI, DPI or Analog TV
driver?

Maxime

--3j2xocorbsfkurfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMQ9VQAKCRAnX84Zoj2+
dki9AX9mFD5bwyr6KpvvYF+Wy+vnouOxEKXr0drg+DkfZKXy4mRJSu8rRMs3GkHm
yN8qzaUBgIUjy9fSVBW2oI+qInc+onQ/KJk5MzTEl7Nn+ih6mpGd3CvZXo8ZaYiZ
nMo7NfUabw==
=GlMn
-----END PGP SIGNATURE-----

--3j2xocorbsfkurfa--
