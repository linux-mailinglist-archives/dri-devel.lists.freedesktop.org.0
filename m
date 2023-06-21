Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47918737ED8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600B710E424;
	Wed, 21 Jun 2023 09:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4429A10E424
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:22:43 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qBu2r-0004OT-7t; Wed, 21 Jun 2023 11:22:33 +0200
Message-ID: <cba8ebe734aed53e74ddee2242526d10338cbafb.camel@pengutronix.de>
Subject: Re: [PATCH v10 04/11] drm/etnaviv: Add helpers for private data
 construction and destruction
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <18949883232@163.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 11:22:30 +0200
In-Reply-To: <20230620094716.2231414-5-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-5-18949883232@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 20.06.2023 um 17:47 +0800 schrieb Sui Jingfeng:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
> There are numerous members in the struct etnaviv_drm_private, which are
> shared by all GPU core. This patch introduces two dedicated functions for
> the construction and destruction of the instances of this structure.
> The goal is to keep its members from leaking to the outside. The code
> needed for error handling can also be simplified.
>=20
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 73 +++++++++++++++++----------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 +
>  2 files changed, 47 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index cec005035d0e..6a048be02857 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -24,9 +24,47 @@
>  #include "etnaviv_perfmon.h"
> =20
>  /*
> - * DRM operations:
> + * etnaviv private data construction and destructions:
>   */
> +static struct etnaviv_drm_private *
> +etnaviv_alloc_private(struct device *dev, struct drm_device *drm)
> +{
> +	struct etnaviv_drm_private *priv;
> +
> +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->drm =3D drm;

That's an unrelated change that you rely on in later patches. If this
is needed at all it needs to be in a separate patch with a explanation
on why it is needed.

Regards,
Lucas

> +
> +	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
> +
> +	mutex_init(&priv->gem_lock);
> +	INIT_LIST_HEAD(&priv->gem_list);
> +	priv->num_gpus =3D 0;
> +	priv->shm_gfp_mask =3D GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWAR=
N;
> =20
> +	priv->cmdbuf_suballoc =3D etnaviv_cmdbuf_suballoc_new(dev);
> +	if (IS_ERR(priv->cmdbuf_suballoc)) {
> +		kfree(priv);
> +		dev_err(dev, "Failed to create cmdbuf suballocator\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	return priv;
> +}
> +
> +static void etnaviv_free_private(struct etnaviv_drm_private *priv)
> +{
> +	if (!priv)
> +		return;
> +
> +	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
> +
> +	xa_destroy(&priv->active_contexts);
> +
> +	kfree(priv);
> +}
> =20
>  static void load_gpu(struct drm_device *dev)
>  {
> @@ -511,35 +549,21 @@ static int etnaviv_bind(struct device *dev)
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
> =20
> -	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		dev_err(dev, "failed to allocate private data\n");
> -		ret =3D -ENOMEM;
> +	priv =3D etnaviv_alloc_private(dev, drm);
> +	if (IS_ERR(priv)) {
> +		ret =3D PTR_ERR(priv);
>  		goto out_put;
>  	}
> +
>  	drm->dev_private =3D priv;
> =20
>  	dma_set_max_seg_size(dev, SZ_2G);
> =20
> -	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
> -
> -	mutex_init(&priv->gem_lock);
> -	INIT_LIST_HEAD(&priv->gem_list);
> -	priv->num_gpus =3D 0;
> -	priv->shm_gfp_mask =3D GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWAR=
N;
> -
> -	priv->cmdbuf_suballoc =3D etnaviv_cmdbuf_suballoc_new(drm->dev);
> -	if (IS_ERR(priv->cmdbuf_suballoc)) {
> -		dev_err(drm->dev, "Failed to create cmdbuf suballocator\n");
> -		ret =3D PTR_ERR(priv->cmdbuf_suballoc);
> -		goto out_free_priv;
> -	}
> -
>  	dev_set_drvdata(dev, drm);
> =20
>  	ret =3D component_bind_all(dev, drm);
>  	if (ret < 0)
> -		goto out_destroy_suballoc;
> +		goto out_free_priv;
> =20
>  	load_gpu(drm);
> =20
> @@ -551,10 +575,8 @@ static int etnaviv_bind(struct device *dev)
> =20
>  out_unbind:
>  	component_unbind_all(dev, drm);
> -out_destroy_suballoc:
> -	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
>  out_free_priv:
> -	kfree(priv);
> +	etnaviv_free_private(priv);
>  out_put:
>  	drm_dev_put(drm);
> =20
> @@ -570,12 +592,9 @@ static void etnaviv_unbind(struct device *dev)
> =20
>  	component_unbind_all(dev, drm);
> =20
> -	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
> -
> -	xa_destroy(&priv->active_contexts);
> +	etnaviv_free_private(priv);
> =20
>  	drm->dev_private =3D NULL;
> -	kfree(priv);
> =20
>  	drm_dev_put(drm);
>  }
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etna=
viv/etnaviv_drv.h
> index b3eb1662e90c..e58f82e698de 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -35,6 +35,7 @@ struct etnaviv_file_private {
>  };
> =20
>  struct etnaviv_drm_private {
> +	struct drm_device *drm;
>  	int num_gpus;
>  	struct etnaviv_gpu *gpu[ETNA_MAX_PIPES];
>  	gfp_t shm_gfp_mask;

