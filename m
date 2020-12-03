Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07F2CCEDD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 06:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4C6E834;
	Thu,  3 Dec 2020 05:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662966E834
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 05:57:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6804ABCE;
 Thu,  3 Dec 2020 05:57:48 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Use managed VRAM-helper initialization
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1606964953-24309-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7baf0a61-bef8-e847-afd2-3a1d05875cdf@suse.de>
Date: Thu, 3 Dec 2020 06:57:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606964953-24309-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1144440080=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1144440080==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="u1SpjsDYRN3Hc6zNiGVIKjVTnIrTErLNb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--u1SpjsDYRN3Hc6zNiGVIKjVTnIrTErLNb
Content-Type: multipart/mixed; boundary="GOyPcIWYUn6LwumklnAr7qdZcUdyNCe3H";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <7baf0a61-bef8-e847-afd2-3a1d05875cdf@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Use managed VRAM-helper initialization
References: <1606964953-24309-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1606964953-24309-1-git-send-email-tiantao6@hisilicon.com>

--GOyPcIWYUn6LwumklnAr7qdZcUdyNCe3H
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.12.20 um 04:09 schrieb Tian Tao:
> updated to use drmm_vram_helper_init()
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

As a good follow-up patch, I would suggest to get rig of the entire file =

hibmc_ttm.c. drmm_vram_helper_init() can be called directly from=20
hibmc_load(). hibmc_dumb_create() and hibmc_mode_funcs can go to=20
hibmc_drm_drv.c.

Best regards
Thomas

> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  1 -
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  1 -
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c     | 19 +++-------------=
---
>   3 files changed, 3 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 8020604..5aea2e9 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -249,7 +249,6 @@ static int hibmc_unload(struct drm_device *dev)
>  =20
>   	pci_disable_msi(dev->pdev);
>   	hibmc_kms_fini(priv);
> -	hibmc_mm_fini(priv);
>   	dev->dev_private =3D NULL;
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index 7e0c756..2786de5 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -64,7 +64,6 @@ int hibmc_de_init(struct hibmc_drm_private *priv);
>   int hibmc_vdac_init(struct hibmc_drm_private *priv);
>  =20
>   int hibmc_mm_init(struct hibmc_drm_private *hibmc);
> -void hibmc_mm_fini(struct hibmc_drm_private *hibmc);
>   int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>   		      struct drm_mode_create_dumb *args);
>   int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_connect=
or *connector);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_ttm.c
> index e84fb81..892d566 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -23,15 +23,12 @@
>  =20
>   int hibmc_mm_init(struct hibmc_drm_private *hibmc)
>   {
> -	struct drm_vram_mm *vmm;
>   	int ret;
>   	struct drm_device *dev =3D &hibmc->dev;
>  =20
> -	vmm =3D drm_vram_helper_alloc_mm(dev,
> -				       pci_resource_start(dev->pdev, 0),
> -				       hibmc->fb_size);
> -	if (IS_ERR(vmm)) {
> -		ret =3D PTR_ERR(vmm);
> +	ret =3D drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
> +				    hibmc->fb_size);
> +	if (ret) {
>   		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
>   		return ret;
>   	}
> @@ -39,16 +36,6 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
>   	return 0;
>   }
>  =20
> -void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
> -{
> -	struct drm_device *dev =3D &hibmc->dev;
> -
> -	if (!dev->vram_mm)
> -		return;
> -
> -	drm_vram_helper_release_mm(dev);
> -}
> -
>   int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>   		      struct drm_mode_create_dumb *args)
>   {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--GOyPcIWYUn6LwumklnAr7qdZcUdyNCe3H--

--u1SpjsDYRN3Hc6zNiGVIKjVTnIrTErLNb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/IflsFAwAAAAAACgkQlh/E3EQov+CP
PQ//cjecoEHrzdZ8LnQJiFRKZf7AbsBkUZ/97lsnbGFBPPHPfls3fG9vW9m4maAn0o1n6esiRMgC
9eB1aA3aZKaw7unXcBCh/8NzfiLDFbihpveV30f584zlU3+cm5MBcfgjb8HTS5ThC3/xPBJ6E1/j
L9ClTB2R7YA08JsPn9T+Ge7dujYSg7IJyidWZY4w2vfpl0zFV7qy5W8CyQR9orNxsNCWekGYH02f
OnhHnh7u+Iw1ByVFkPxA5vgLiRisl8A/Zfk9MZ41rqz4bQ+qb0Xi5EdhQpufrY2zhnjxj4mmkA2f
2xJmhMRMm5D1OK5R++Rtyu87pvFfcb/omst9WF9SER9axDh8wrD5Ib8u6u2BmvYhwFqoBkdfuQDR
IfpoN3aK9do0yGpaV/cl1UO3r7ugWOy/krMiEwT0d5FKgsv+vI7YQX+gWGHFMvLyKUKUJS4l1BEl
+hEzKBTh3nmBn2XxzoOFTiJZnBbmiRZkbMCw/+bUY6WXdj0VvLuJrNunbQvyldrg3qLz0flIsj+/
iIxqTo9bAJohL7IHSMCpcoDL7mhXUNrRrqKljVugjtsWcO7YtJtzBsPqoLetUrSU2ljYrEWFGWQJ
MqAFYioz7FnsH87aF3Qge5xE3RmUZ4iUoOQ5KDULhwUpTlgtjF6/6bN9XNncepVfrUjESFs7LTkL
7Tg=
=BnE5
-----END PGP SIGNATURE-----

--u1SpjsDYRN3Hc6zNiGVIKjVTnIrTErLNb--

--===============1144440080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1144440080==--
