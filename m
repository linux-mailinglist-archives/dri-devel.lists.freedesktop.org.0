Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274A98BBE8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 14:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5659D10E173;
	Tue,  1 Oct 2024 12:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BA710E173
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 12:17:41 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svboq-00079m-FC; Tue, 01 Oct 2024 14:17:32 +0200
Message-ID: <7a6ffbb773784dee0ea3ee87e563ac4e4f7c9c90.camel@pengutronix.de>
Subject: Re: [PATCH v3] drm/etnaviv: Request pages from DMA32 zone on
 addressing_limited
From: Lucas Stach <l.stach@pengutronix.de>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, sui.jingfeng@linux.dev, 
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 airlied@gmail.com,  daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 14:17:31 +0200
In-Reply-To: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
References: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
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

Hi Xiaolei,

Am Dienstag, dem 03.09.2024 um 10:08 +0800 schrieb Xiaolei Wang:
> Remove __GFP_HIGHMEM when requesting a page from DMA32 zone,
> and since all vivante GPUs in the system will share the same
> DMA constraints, move the check of whether to get a page from
> DMA32 to etnaviv_bind().
>=20
> Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when nee=
ded")
> Suggested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>=20
> change log
>=20
> v1:
>   https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.201=
8783-1-xiaolei.wang@windriver.com/
>=20
> v2:
>   Modify the issue of not retaining GFP_USER in v1 and update the commit =
log.
>=20
> v3:
>   Use "priv->shm_gfp_mask =3D GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWA=
RN;"
> instead of
>   "priv->shm_gfp_mask =3D GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWA=
RN;"

I don't understand this part of the changes in the new version. Why
should we drop the HIGHMEM bit always and not only in the case where
dma addressing is limited? This seems overly restrictive.

Regards,
Lucas

> and move the check of whether to get a page from DMA32 to etnaviv_bind().
>=20
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6500f3999c5f..8cb2c3ec8e5d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -536,7 +536,15 @@ static int etnaviv_bind(struct device *dev)
>  	mutex_init(&priv->gem_lock);
>  	INIT_LIST_HEAD(&priv->gem_list);
>  	priv->num_gpus =3D 0;
> -	priv->shm_gfp_mask =3D GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWAR=
N;
> +	priv->shm_gfp_mask =3D GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +
> +	/*
> +	 * If the GPU is part of a system with DMA addressing limitations,
> +	 * request pages for our SHM backend buffers from the DMA32 zone to
> +	 * hopefully avoid performance killing SWIOTLB bounce buffering.
> +	 */
> +	if (dma_addressing_limited(dev))
> +		priv->shm_gfp_mask |=3D GFP_DMA32;
> =20
>  	priv->cmdbuf_suballoc =3D etnaviv_cmdbuf_suballoc_new(drm->dev);
>  	if (IS_ERR(priv->cmdbuf_suballoc)) {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 7c7f97793ddd..5e753dd42f72 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -839,14 +839,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  	if (ret)
>  		goto fail;
> =20
> -	/*
> -	 * If the GPU is part of a system with DMA addressing limitations,
> -	 * request pages for our SHM backend buffers from the DMA32 zone to
> -	 * hopefully avoid performance killing SWIOTLB bounce buffering.
> -	 */
> -	if (dma_addressing_limited(gpu->dev))
> -		priv->shm_gfp_mask |=3D GFP_DMA32;
> -
>  	/* Create buffer: */
>  	ret =3D etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
>  				  PAGE_SIZE);

