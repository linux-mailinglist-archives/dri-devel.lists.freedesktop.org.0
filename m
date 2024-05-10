Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619BC8C1FCF
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 10:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCD910E271;
	Fri, 10 May 2024 08:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA76E10E271
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 08:35:04 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s5LiP-0003WU-RF; Fri, 10 May 2024 10:34:53 +0200
Message-ID: <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
From: Lucas Stach <l.stach@pengutronix.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 10 May 2024 10:34:47 +0200
In-Reply-To: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Tomeu,

Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso:
> If we expose a render node for NPUs without rendering capabilities, the
> userspace stack will offer it to compositors and applications for
> rendering, which of course won't work.
>=20
> Userspace is probably right in not questioning whether a render node
> might not be capable of supporting rendering, so change it in the kernel
> instead by exposing a /dev/accel node.
>=20
> Before we bring the device up we don't know whether it is capable of
> rendering or not (depends on the features of its blocks), so first try
> to probe a rendering node, and if we find out that there is no rendering
> hardware, abort and retry with an accel node.
>=20
I thought about this for a while. My opinion is that this is the wrong
approach. We are adding another path to the kernel driver, potentially
complicating the userspace side, as now the NPU backend needs to look
for both render and accel nodes. While currently accel and drm are
pretty closely related and we can share most of the driver, it might
still be a maintenance hassle in the long run.

On the other hand we already have precedence of compute only DRM
devices exposing a render node: there are AMD GPUs that don't expose a
graphics queue and are thus not able to actually render graphics. Mesa
already handles this in part via the PIPE_CAP_GRAPHICS and I think we
should simply extend this to not offer a EGL display on screens without
that capability.

Regards,
Lucas

> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 46 ++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6500f3999c5f..8e7dd23115f4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
> =20
> +#include <drm/drm_accel.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -488,10 +489,10 @@ static const struct drm_ioctl_desc etnaviv_ioctls[]=
 =3D {
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
> =20
> -DEFINE_DRM_GEM_FOPS(fops);
> +DEFINE_DRM_GEM_FOPS(render_fops);
> +DEFINE_DRM_ACCEL_FOPS(accel_fops);
> =20
> -static const struct drm_driver etnaviv_drm_driver =3D {
> -	.driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
> +static struct drm_driver etnaviv_drm_driver =3D {
>  	.open               =3D etnaviv_open,
>  	.postclose           =3D etnaviv_postclose,
>  	.gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_table,
> @@ -500,7 +501,6 @@ static const struct drm_driver etnaviv_drm_driver =3D=
 {
>  #endif
>  	.ioctls             =3D etnaviv_ioctls,
>  	.num_ioctls         =3D DRM_ETNAVIV_NUM_IOCTLS,
> -	.fops               =3D &fops,
>  	.name               =3D "etnaviv",
>  	.desc               =3D "etnaviv DRM",
>  	.date               =3D "20151214",
> @@ -508,15 +508,20 @@ static const struct drm_driver etnaviv_drm_driver =
=3D {
>  	.minor              =3D 4,
>  };
> =20
> -/*
> - * Platform driver:
> - */
> -static int etnaviv_bind(struct device *dev)
> +static int etnaviv_bind_with_type(struct device *dev, u32 type)
>  {
>  	struct etnaviv_drm_private *priv;
>  	struct drm_device *drm;
> +	bool is_compute_only =3D true;
>  	int ret;
> =20
> +	etnaviv_drm_driver.driver_features =3D DRIVER_GEM | type;
> +
> +	if (type =3D=3D DRIVER_RENDER)
> +		etnaviv_drm_driver.fops =3D &render_fops;
> +	else
> +		etnaviv_drm_driver.fops =3D &accel_fops;
> +
>  	drm =3D drm_dev_alloc(&etnaviv_drm_driver, dev);
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
> @@ -553,6 +558,18 @@ static int etnaviv_bind(struct device *dev)
> =20
>  	load_gpu(drm);
> =20
> +	for (unsigned int i =3D 0; i < ETNA_MAX_PIPES; i++) {
> +		struct etnaviv_gpu *g =3D priv->gpu[i];
> +
> +		if (g && (g->identity.minor_features8 & chipMinorFeatures8_COMPUTE_ONL=
Y) =3D=3D 0)
> +			is_compute_only =3D false;
> +	}
> +
> +	if (type =3D=3D DRIVER_RENDER && is_compute_only) {
> +		ret =3D -EINVAL;
> +		goto out_unbind;
> +	}
> +
>  	ret =3D drm_dev_register(drm, 0);
>  	if (ret)
>  		goto out_unbind;
> @@ -571,6 +588,19 @@ static int etnaviv_bind(struct device *dev)
>  	return ret;
>  }
> =20
> +/*
> + * Platform driver:
> + */
> +static int etnaviv_bind(struct device *dev)
> +{
> +	int ret =3D etnaviv_bind_with_type(dev, DRIVER_RENDER);
> +
> +	if (ret =3D=3D -EINVAL)
> +		return etnaviv_bind_with_type(dev, DRIVER_COMPUTE_ACCEL);
> +
> +	return ret;
> +}
> +
>  static void etnaviv_unbind(struct device *dev)
>  {
>  	struct drm_device *drm =3D dev_get_drvdata(dev);

