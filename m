Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A7520296
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D291A10F39A;
	Mon,  9 May 2022 16:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE20F10F39A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dMawLoZFMIIf3a0+WnP0cN3SQyoBzoKKmA2ja2X5flI=; b=ak0EjJYLKcE6dinD52t2D2M2qG
 XFkFL3XlovpA0zI8CBYdVDCqBK9bqYEbt3yz2s4wS1/2c9XVVCmoYj34d9jfVrrzEF6kFqORZc7ge
 cUf/mj/jVNTvqPvVtfjI+470DHeSK189pKZonYodl6Ox0CfzY2Ehi0qcGd7OVv+nSiIdKoj/RI1gB
 uce/bjukdWbjya92RXELIFyy8QryntDGfFSr8BotHYNPJgWOIcsObw0QVS+dBIUo2fVn4gbUbZEQV
 c+58R2zNMz0ypTbklbZQOxO3nd7VSfuGQ4/QPH7q78T7QiS8sH/lhYPgqKJb3vi6Eb7fWWyAwYMnX
 5NSWOCxw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1no6OI-00093z-9j; Mon, 09 May 2022 18:37:46 +0200
Date: Mon, 9 May 2022 15:37:29 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 05/14] drm/vc4: drv: Register a different driver on BCM2711
Message-ID: <20220509163729.e7ohe6h4igouweoz@mail.igalia.com>
References: <20220503121341.983842-1-maxime@cerno.tech>
 <20220503121341.983842-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zkim2o5k5k6gociv"
Content-Disposition: inline
In-Reply-To: <20220503121341.983842-6-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zkim2o5k5k6gociv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/03, Maxime Ripard wrote:
> Prior to the BCM2711/RaspberryPi4, the GPU was a part of the display
> components of the SoC. It was thus a part of the vc4 driver.
>=20
> However, with the BCM2711, it got split out and thus the v3d driver was
> created. The vc4 driver now only handles the display part.
>=20
> We didn't properly split out the code when doing the BCM2711 support
> though, and most of the code around buffer allocations is still
> involved, even though it doesn't have the backing hardware anymore.
>=20
> Let's start the split out by creating a new drm_driver that only reports
> and uses what we support on the BCM2711. The ioctl were properly
> filtered already, but we were still exposing a .gem_create_object hook,
> as well as having an .open and .postclose hooks which are only relevant
> on older generations.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 51 ++++++++++++++++++++++++++++-------
>  1 file changed, 42 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index eb08940028d3..4f9e2067dad0 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -76,6 +76,19 @@ int vc4_dumb_fixup_args(struct drm_mode_create_dumb *a=
rgs)
>  	return 0;
>  }
> =20
> +static int vc4_dumb_create(struct drm_file *file_priv,
> +			   struct drm_device *dev,
> +			   struct drm_mode_create_dumb *args)
> +{
> +	int ret;
> +
> +	ret =3D vc4_dumb_fixup_args(args);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gem_cma_dumb_create_internal(file_priv, dev, args);
> +}
> +
>  static int vc4_get_param_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file_priv)
>  {
> @@ -173,7 +186,7 @@ static const struct drm_ioctl_desc vc4_drm_ioctls[] =
=3D {
>  	DRM_IOCTL_DEF_DRV(VC4_PERFMON_GET_VALUES, vc4_perfmon_get_values_ioctl,=
 DRM_RENDER_ALLOW),
>  };
> =20
> -static struct drm_driver vc4_drm_driver =3D {
> +static const struct drm_driver vc4_drm_driver =3D {
>  	.driver_features =3D (DRIVER_MODESET |
>  			    DRIVER_ATOMIC |
>  			    DRIVER_GEM |
> @@ -202,6 +215,27 @@ static struct drm_driver vc4_drm_driver =3D {
>  	.patchlevel =3D DRIVER_PATCHLEVEL,
>  };
> =20
> +static const struct drm_driver vc5_drm_driver =3D {
> +	.driver_features =3D (DRIVER_MODESET |
> +			    DRIVER_ATOMIC |
> +			    DRIVER_GEM),
> +
> +#if defined(CONFIG_DEBUG_FS)
> +	.debugfs_init =3D vc4_debugfs_init,
> +#endif
> +
> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(vc4_dumb_create),

I wonder if we can call it `vc5_dumb_create` to dissociate from vc4.
Instead of a `vc4_dumb_create` only used by vc5_drm_driver.

I mean, mistunderstandings already happen between vc4->v3d (component)
and v3d (driver). Then now we have a vc5 - without v3d (component) and
existing a v3d (driver) - and now I worry that it's going to get even
more confusing...

> +
> +	.fops =3D &vc4_drm_fops,
> +
> +	.name =3D DRIVER_NAME,
> +	.desc =3D DRIVER_DESC,
> +	.date =3D DRIVER_DATE,
> +	.major =3D DRIVER_MAJOR,
> +	.minor =3D DRIVER_MINOR,
> +	.patchlevel =3D DRIVER_PATCHLEVEL,
> +};
> +
>  static void vc4_match_add_drivers(struct device *dev,
>  				  struct component_match **match,
>  				  struct platform_driver *const *drivers,
> @@ -225,6 +259,7 @@ static void vc4_match_add_drivers(struct device *dev,
>  static int vc4_drm_bind(struct device *dev)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
> +	const struct drm_driver *driver;
>  	struct rpi_firmware *firmware =3D NULL;
>  	struct drm_device *drm;
>  	struct vc4_dev *vc4;
> @@ -236,14 +271,12 @@ static int vc4_drm_bind(struct device *dev)
>  	dev->coherent_dma_mask =3D DMA_BIT_MASK(32);
> =20
>  	is_vc5 =3D of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5");
> +	if (is_vc5)
> +		driver =3D &vc5_drm_driver;
> +	else
> +		driver =3D &vc4_drm_driver;
> =20
> -	/* If VC4 V3D is missing, don't advertise render nodes. */
> -	node =3D of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
> -	if (!node || !of_device_is_available(node))
> -		vc4_drm_driver.driver_features &=3D ~DRIVER_RENDER;
> -	of_node_put(node);
> -
> -	vc4 =3D devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
> +	vc4 =3D devm_drm_dev_alloc(dev, driver, struct vc4_dev, base);
>  	if (IS_ERR(vc4))
>  		return PTR_ERR(vc4);
>  	vc4->is_vc5 =3D is_vc5;
> @@ -275,7 +308,7 @@ static int vc4_drm_bind(struct device *dev)
>  			return -EPROBE_DEFER;
>  	}
> =20
> -	ret =3D drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
> +	ret =3D drm_aperture_remove_framebuffers(false, driver);
>  	if (ret)
>  		return ret;
> =20
> --=20
> 2.35.1
>=20

--zkim2o5k5k6gociv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ5Q0QACgkQwqF3j0dL
ehxD6xAAvtS21SJ7bUKdTDt9gEbpyESVG+YJ5OfzcUyXU2j/Jysr9iY4T5SpXqW5
sPIDcAg6lh14iWrhUX1UqXNo8KWTNu++GhGt6bKwqw+6RBQj1AeeLi2GlYus2V62
WkJoxVWuvCtGu+pVzZKSXuA1ce0JcY46lg26+uEg12200YAnA970ED3+/0jUTZi2
/Y8ZSoWmp16g7uHvUWYB7t3S5v1Zbanx8CvQwWOfHbgAfqcXmwnxnXgzpmQ/6r2q
XlFmx1UFh0gq3/RV1O3h2IG7cKpj6vPtpTGASw/YSy3DEAtp2Pv1GDG2ktM5265f
j1o+YTYgZhiq1TwWx34UOC+LkH1Y/SgUpmaMAk3Paljlnqrwj/LG5ssoRvQh8EXO
nVH4/hhThwWqKGlpCCCgvMeW/vEjo0mxjRLuwFv9VrTWvwRGYoUH5sLf623ykajj
8Piv5/ZJm2FUkSQwTbOwPw4311WH2zSYHqVw4xJEpwVEsKKtWhqE/uzszbhHaROE
mreBL0fXVT2M/C10xMB87Xb0hu+B/FZWC56K6SYjBy5HhqEvKMeZM/b+Dt6QXQuo
drTXGdvzrUlm5L4F32bqX78Z7uep/HnsbBcHW9ofQG412Fvwdg70WkuoQGyLdk2n
VVEhLkR7isG2apsE1N59IgyIngFWkoQ100FkShfCDHAOQS2937I=
=rPne
-----END PGP SIGNATURE-----

--zkim2o5k5k6gociv--
