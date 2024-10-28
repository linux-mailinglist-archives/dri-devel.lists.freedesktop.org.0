Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A59B3573
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD5410E504;
	Mon, 28 Oct 2024 15:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEE510E504
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:56:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1t5S65-0004NU-9n; Mon, 28 Oct 2024 16:56:01 +0100
Message-ID: <436b5d7896951199b7a6bed5e8b432221c878a4c.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Fix missing mutex_destroy()
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2024 16:56:00 +0100
In-Reply-To: <20240825121452.363342-1-sui.jingfeng@linux.dev>
References: <20240825121452.363342-1-sui.jingfeng@linux.dev>
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

Am Sonntag, dem 25.08.2024 um 20:14 +0800 schrieb Sui Jingfeng:
> Currently, the calling of mutex_destroy() is ignored on error handling
> code path. It is safe for now, since mutex_destroy() actually does
> nothing in non-debug builds. But the mutex_destroy() is used to mark
> the mutex uninitialized on debug builds, and any subsequent use of the
> mutex is forbidden.
>=20
> It also could lead to problems if mutex_destroy() gets extended, add
> missing mutex_destroy() to eliminate potential concerns.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Thanks, applied to etnaviv/next.

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 3 +++
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c    | 1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c    | 1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c    | 5 +++++
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c    | 2 +-
>  5 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_cmdbuf.c
> index 721d633aece9..1edc02022be4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -79,6 +79,9 @@ void etnaviv_cmdbuf_suballoc_destroy(struct etnaviv_cmd=
buf_suballoc *suballoc)
>  {
>  	dma_free_wc(suballoc->dev, SUBALLOC_SIZE, suballoc->vaddr,
>  		    suballoc->paddr);
> +
> +	mutex_destroy(&suballoc->lock);
> +
>  	kfree(suballoc);
>  }
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6500f3999c5f..7844cd961a29 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -564,6 +564,7 @@ static int etnaviv_bind(struct device *dev)
>  out_destroy_suballoc:
>  	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
>  out_free_priv:
> +	mutex_destroy(&priv->gem_lock);
>  	kfree(priv);
>  out_put:
>  	drm_dev_put(drm);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index fe665ca20c02..b68e3b235a7d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -515,6 +515,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *o=
bj)
>  	etnaviv_obj->ops->release(etnaviv_obj);
>  	drm_gem_object_release(obj);
> =20
> +	mutex_destroy(&etnaviv_obj->lock);
>  	kfree(etnaviv_obj);
>  }
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index af52922ff494..d6acc4c68102 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1929,8 +1929,13 @@ static int etnaviv_gpu_platform_probe(struct platf=
orm_device *pdev)
> =20
>  static void etnaviv_gpu_platform_remove(struct platform_device *pdev)
>  {
> +	struct etnaviv_gpu *gpu =3D dev_get_drvdata(&pdev->dev);
> +
>  	component_del(&pdev->dev, &gpu_ops);
>  	pm_runtime_disable(&pdev->dev);
> +
> +	mutex_destroy(&gpu->lock);
> +	mutex_destroy(&gpu->sched_lock);
>  }
> =20
>  static int etnaviv_gpu_rpm_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index e3be16165c86..ed6c42384856 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -361,7 +361,7 @@ static void etnaviv_iommu_context_free(struct kref *k=
ref)
>  		container_of(kref, struct etnaviv_iommu_context, refcount);
> =20
>  	etnaviv_cmdbuf_suballoc_unmap(context, &context->cmdbuf_mapping);
> -
> +	mutex_destroy(&context->lock);
>  	context->global->ops->free(context);
>  }
>  void etnaviv_iommu_context_put(struct etnaviv_iommu_context *context)

