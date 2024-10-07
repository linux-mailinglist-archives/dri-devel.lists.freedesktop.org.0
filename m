Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD779928F8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 12:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD43E10E36A;
	Mon,  7 Oct 2024 10:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D032210E36A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 10:17:52 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sxkoF-0006gA-76; Mon, 07 Oct 2024 12:17:47 +0200
Message-ID: <13b9c1bde7f0534f7f3c576126def206bdafd60c.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/etnaviv: Map and unmap the GPU VA range with
 respect to its user size
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 07 Oct 2024 12:17:46 +0200
In-Reply-To: <20241004194207.1013744-3-sui.jingfeng@linux.dev>
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
 <20241004194207.1013744-3-sui.jingfeng@linux.dev>
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

Am Samstag, dem 05.10.2024 um 03:42 +0800 schrieb Sui Jingfeng:
> Since the GPU VA space is compact in terms of 4KiB unit, map and/or unmap
> the area that doesn't belong to a context breaks the philosophy of PPAS.
> That results in severe errors: GPU hang and MMU fault (page not present)
> and such.
>=20
> Shrink the usuable size of etnaviv GEM buffer object to its user size,
> instead of the original physical size of its backing memory.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 28 +++++++++------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index 6fbc62772d85..a52ec5eb0e3d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -70,8 +70,10 @@ static int etnaviv_context_map(struct etnaviv_iommu_co=
ntext *context,
>  }
> =20
>  static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 =
iova,
> +			     unsigned int user_len,
>  			     struct sg_table *sgt, int prot)
> -{	struct scatterlist *sg;
> +{
> +	struct scatterlist *sg;
>  	unsigned int da =3D iova;
>  	unsigned int i;
>  	int ret;
> @@ -81,7 +83,8 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_conte=
xt *context, u32 iova,
> =20
>  	for_each_sgtable_dma_sg(sgt, sg, i) {
>  		phys_addr_t pa =3D sg_dma_address(sg) - sg->offset;
> -		size_t bytes =3D sg_dma_len(sg) + sg->offset;
> +		unsigned int phys_len =3D sg_dma_len(sg) + sg->offset;
> +		size_t bytes =3D MIN(phys_len, user_len);
> =20
>  		VERB("map[%d]: %08x %pap(%zx)", i, iova, &pa, bytes);
> =20
> @@ -89,6 +92,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_conte=
xt *context, u32 iova,
>  		if (ret)
>  			goto fail;
> =20
> +		user_len -=3D bytes;
>  		da +=3D bytes;
>  	}

Since the MIN(phys_len, user_len) may limit the mapped amount in the
wrong direction, I would think it would be good to add a
WARN_ON(user_len !=3D 0) after the dma SG iteration.

> =20
> @@ -104,21 +108,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_co=
ntext *context, u32 iova,
>  static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u=
32 iova,
>  				struct sg_table *sgt, unsigned len)
>  {
> -	struct scatterlist *sg;
> -	unsigned int da =3D iova;
> -	int i;
> -
> -	for_each_sgtable_dma_sg(sgt, sg, i) {
> -		size_t bytes =3D sg_dma_len(sg) + sg->offset;
> -
> -		etnaviv_context_unmap(context, da, bytes);
> -
> -		VERB("unmap[%d]: %08x(%zx)", i, iova, bytes);
> -
> -		BUG_ON(!PAGE_ALIGNED(bytes));
> -
> -		da +=3D bytes;
> -	}
> +	etnaviv_context_unmap(context, iova, len);

This drops some sanity checks, but I have only ever seen them fire when
we had other kernel memory corruption issues, so I'm fine with the
simplification you did here.

Regards,
Lucas

> =20
>  	context->flush_seq++;
>  }
> @@ -131,7 +121,7 @@ static void etnaviv_iommu_remove_mapping(struct etnav=
iv_iommu_context *context,
>  	lockdep_assert_held(&context->lock);
> =20
>  	etnaviv_iommu_unmap(context, mapping->vram_node.start,
> -			    etnaviv_obj->sgt, etnaviv_obj->base.size);
> +			    etnaviv_obj->sgt, etnaviv_obj->user_size);
>  	drm_mm_remove_node(&mapping->vram_node);
>  }
> =20
> @@ -314,7 +304,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_contex=
t *context,
>  		goto unlock;
> =20
>  	mapping->iova =3D node->start;
> -	ret =3D etnaviv_iommu_map(context, node->start, sgt,
> +	ret =3D etnaviv_iommu_map(context, node->start, user_size, sgt,
>  				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
> =20
>  	if (ret < 0) {

