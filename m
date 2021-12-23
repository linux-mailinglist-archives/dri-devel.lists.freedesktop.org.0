Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D647E8AC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 21:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85310E119;
	Thu, 23 Dec 2021 20:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54510E119
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IcO10EFOAHXbYii7+2if9uyAg8ITxUoTZa3TlOwxbl0=; b=TQUkjZ7FXi2v2bkN1FB1bBh4Wr
 6kojVLpAF7ykT0tnvxBdKSbpGhNMcotvIuJCJLpzaS98o+nibj1YcB/SEjaTQyFXUxHl24Itsgos4
 1IJv4hHC1zVc8gns4YSEyiDZT/E3xgPV2wEbesQX/3o49hmJFOJf5OhPs4xaXPm8sgHs7R6uC0W7I
 BTKt7zjvYb8GKnydzeAUGEOOPjjb51W456jPHY9G6y5Dc3+wTHGVH+ciOaEpvaWpCmB6OQ2nZydGP
 b8V7ZCZ3JMTqdMtTckpuvylo3wWMshC7Yb2xC4C/0eg5KUnQgsOmsMBK/8Jc7u5Zf7aZYSLQIpaHA
 3TgnIJIA==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1n0UWc-0002hG-0F; Thu, 23 Dec 2021 21:17:18 +0100
Date: Thu, 23 Dec 2021 19:17:06 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 2/3] drm/vkms: add support for multiple overlay planes
Message-ID: <20211223201624.3w2zy265ehrfwm2w@mail.igalia.com>
References: <20211213181131.17223-1-jose.exposito89@gmail.com>
 <20211213181131.17223-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7exwymhb44a6obmx"
Content-Disposition: inline
In-Reply-To: <20211213181131.17223-3-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7exwymhb44a6obmx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/13, Jos=E9 Exp=F3sito wrote:
> Add a new module parameter to allow to set the number of overlay planes
> to create. Set it to 1 by default in order to keep the "enable_overlay"
> backwards compatible.
>=20
Hi Jos=E9,

in general, lgtm. However, I think we need some limits for this number
of planes. I would suggest to just expand the enable_overlay option to
expose a predefined number of planes and to avoid passing "crazy"
numbers by another module option.
Afaik, we are also limited to 32, as you can see in this commit:

2a8d3eac3d6e1
drm: Warn if plane/crtc/encoder/connector index exceeds our 32bit bitmasks

I don't have a strong opinion on an exact/practical number. I took a
quick look at other drivers and exposing 8 planes seems reasonable to
me. Also, changing this number in the future would be pretty
straightfoward.

Thanks,

Melissa

> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    | 5 +++++
>  drivers/gpu/drm/vkms/vkms_drv.h    | 1 +
>  drivers/gpu/drm/vkms/vkms_output.c | 9 ++++++---
>  3 files changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 0ffe5f0e33f7..bb98f6c6c561 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,6 +51,10 @@ static bool enable_overlay;
>  module_param_named(enable_overlay, enable_overlay, bool, 0444);
>  MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> =20
> +static unsigned int num_overlay_planes =3D 1;
> +module_param_named(num_overlay_planes, num_overlay_planes, uint, 0444);
> +MODULE_PARM_DESC(num_overlay_planes, "Number of overlay planes to create=
");
> +
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
> =20
>  static void vkms_release(struct drm_device *dev)
> @@ -229,6 +233,7 @@ static int __init vkms_init(void)
>  	config->cursor =3D enable_cursor;
>  	config->writeback =3D enable_writeback;
>  	config->overlay =3D enable_overlay;
> +	config->num_overlay_planes =3D num_overlay_planes;
> =20
>  	return vkms_create(config);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index d48c23d40ce5..33bdf717e3cd 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -97,6 +97,7 @@ struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> +	unsigned int num_overlay_planes;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 2e805b2d36ae..6f26998fdb7e 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -57,15 +57,18 @@ int vkms_output_init(struct vkms_device *vkmsdev, int=
 index)
>  	struct vkms_plane *primary, *cursor =3D NULL;
>  	int ret;
>  	int writeback;
> +	unsigned int n;
> =20
>  	primary =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
> =20
>  	if (vkmsdev->config->overlay) {
> -		ret =3D vkms_add_overlay_plane(vkmsdev, index, crtc);
> -		if (ret)
> -			return ret;
> +		for (n =3D 0; n < vkmsdev->config->num_overlay_planes; n++) {
> +			ret =3D vkms_add_overlay_plane(vkmsdev, index, crtc);
> +			if (ret)
> +				return ret;
> +		}
>  	}
> =20
>  	if (vkmsdev->config->cursor) {
> --=20
> 2.25.1
>=20

--7exwymhb44a6obmx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHE2UEACgkQwqF3j0dL
ehwDORAAseQAKNmEfOb7qAaHQKdYMc3nw4j9rnPsGJG2O1R0YaaayS6nHEjJyLPT
mXImN1ZNt8bgjuUoLzCW+4l67I9dcyL0eza80rv7ng11l2/jqCN+/MaGEYQnXtIM
JdIiNM/D/EViKSMFzAe6UatdyeSS8bTYLMx5teW305p1CDfIni6JQsLO/6xBvfrL
Mg+H9J8XpOzB7XfVfZz8QRH2mojYvL4mj8QcbeShcNNkXtcYpyze/9Or8x1vOSfr
8y+Zts7szo6F8iJnct8/NlsgqfAFpc+Ge6emltvYDfRCdO33j37miGhEUYesybDI
UjPOxO11oDGu6ywAZ9r+YEea2R5ml0pMcxad6LRJZYP43g3cN5iHqsoStNtt7n4c
jzraBWw7hUSCVTWb3eAF8zE1X0Pzl75U9kQclJuPCN/nQcyQNed/UX5/8xW5bkG7
KMCzQJmTULWaIaHrhfnsGNk2jHcZXIk2I4L2TOB1kTH08LMuT/I4fJkUHl4kF94M
exlvKgZlynh5Zhe40/81esuT2J3ZKlkgE4Tm8Ioo6X9UhaImWFJstXgRV8ZDOenH
xHTbCBs1lb8XyLmXvuXvDPpCd6fZg7Ru/IVapc4UBy+A81t05GXfOOC/woaZXl1p
x8PYJa4ncfk2IX/XZy/J8nUOsoJQx/0z03M9m6sQa6U/zAePavQ=
=hso5
-----END PGP SIGNATURE-----

--7exwymhb44a6obmx--
