Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF098BF05
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 16:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F4F10E630;
	Tue,  1 Oct 2024 14:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3ED10E62E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 14:07:43 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svdXP-000659-VL; Tue, 01 Oct 2024 16:07:40 +0200
Message-ID: <8a517e50ae08ee777a9b3465167d7ac4721e6f9f.camel@pengutronix.de>
Subject: Re: [PATCH v15 09/19] drm/etnaviv: Add constructor and destructor
 for the etnaviv_drm_private structure
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 16:07:39 +0200
In-Reply-To: <20240908094357.291862-10-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-10-sui.jingfeng@linux.dev>
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

Am Sonntag, dem 08.09.2024 um 17:43 +0800 schrieb Sui Jingfeng:
> Because there are a lot of data members in the struct etnaviv_drm_private=
,
> which are intended to be shared by all GPU cores. It can be lengthy and
> daunting on error handling, the 'gem_lock' of struct etnaviv_drm_private
> just be forgeten to destroy on driver leave.
>=20
As you seem to have based this patch on top of "drm/etnaviv: Fix
missing mutex_destroy()", the last part of the above sentence doesn't
match the code. Please drop.

> Switch to use the dedicated helpers introduced, etnaviv_bind() and
> etnaviv_unbind() gets simplified. Another potential benefit is that
> we could put the struct drm_device into struct etnaviv_drm_private
> in the future, which made them share the same life time.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 73 +++++++++++++++++----------
>  1 file changed, 46 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6591e420a051..809e5db85df4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -41,6 +41,45 @@ static struct device_node *etnaviv_of_first_available_=
node(void)
>  	return NULL;
>  }
> =20
> +static struct etnaviv_drm_private *etnaviv_alloc_private(struct device *=
dev)
> +{
> +	struct etnaviv_drm_private *priv;
> +
> +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
> +
> +	mutex_init(&priv->gem_lock);
> +	INIT_LIST_HEAD(&priv->gem_list);
> +	priv->num_gpus =3D 0;
> +	priv->shm_gfp_mask =3D GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWAR=
N;
> +
> +	priv->cmdbuf_suballoc =3D etnaviv_cmdbuf_suballoc_new(dev);
> +	if (IS_ERR(priv->cmdbuf_suballoc)) {

If this is supposed to do everything by the books, we should also
destroy the gem_lock mutex and active_contexts xarray here.

Regards,
Lucas

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
> +	mutex_destroy(&priv->gem_lock);
> +
> +	kfree(priv);
> +}
> +
>  static void load_gpu(struct drm_device *dev)
>  {
>  	struct etnaviv_drm_private *priv =3D dev->dev_private;
> @@ -521,35 +560,21 @@ static int etnaviv_bind(struct device *dev)
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
> =20
> -	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		dev_err(dev, "failed to allocate private data\n");
> -		ret =3D -ENOMEM;
> +	priv =3D etnaviv_alloc_private(dev);
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
> @@ -561,11 +586,8 @@ static int etnaviv_bind(struct device *dev)
> =20
>  out_unbind:
>  	component_unbind_all(dev, drm);
> -out_destroy_suballoc:
> -	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
>  out_free_priv:
> -	mutex_destroy(&priv->gem_lock);
> -	kfree(priv);
> +	etnaviv_free_private(priv);
>  out_put:
>  	drm_dev_put(drm);
> =20
> @@ -581,12 +603,9 @@ static void etnaviv_unbind(struct device *dev)
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

