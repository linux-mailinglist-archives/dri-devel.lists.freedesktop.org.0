Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393E9E2A3D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CCA10E47C;
	Tue,  3 Dec 2024 18:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0775110E47C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 18:04:23 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tIXFy-0007Zv-TO; Tue, 03 Dec 2024 19:04:18 +0100
Message-ID: <bb0610b61e2f728554f035e25e5530e1a10fd36d.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: Preallocate STLB according to CPU
 PAGE_SIZE
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 03 Dec 2024 19:04:18 +0100
In-Reply-To: <20241108143658.2229786-1-sui.jingfeng@linux.dev>
References: <20241108143658.2229786-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
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

Am Freitag, dem 08.11.2024 um 22:36 +0800 schrieb Sui Jingfeng:
> The dma_direct_alloc() allocate one page at minmium, which size is the CP=
U
> PAGE_SIZE. while the etnaviv_iommuv2_ensure_stlb() only ask for 4KiB. The
> rest memory space that beyond 4KiB gets wasted on bigger page size system=
s.
> For example, on 16KiB CPU page size systems, we will waste the rest 12KiB=
.
> On 64KiB CPU page size systems, we will waste the rest 60KiB.
>=20
> Since addresses within one page are always contiguous, the rest memory ca=
n
> be used to store adjacent slave TLB entries. Then, when the neighbourhood=
s
> TLB is being hit on the next time, we don't have to ask another one page
> from the system. Saving both memorys and times overhead because of that.
>=20
While this isn't adding a lot of code to etnaviv, I wonder if this
couldn't be handled by using a dma_pool for the pagetable allocations.

Regards,
Lucas

> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 64 +++++++++++++++++++---
>  1 file changed, 56 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm=
/etnaviv/etnaviv_iommu_v2.c
> index d664ae29ae20..fa6eed1ae1be 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
> @@ -44,19 +44,66 @@ to_v2_context(struct etnaviv_iommu_context *context)
>  	return container_of(context, struct etnaviv_iommuv2_context, base);
>  }
> =20
> +static int etnaviv_iommuv2_stlb_free(struct etnaviv_iommuv2_context *con=
text)
> +{
> +	struct device *dev =3D context->base.global->dev;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < MMUv2_MAX_STLB_ENTRIES; ++i) {
> +		u32 *vaddr =3D context->stlb_cpu[i];
> +
> +		if (!vaddr)
> +			continue;
> +
> +		context->stlb_cpu[i] =3D NULL;
> +
> +		if (i % (PAGE_SIZE / SZ_4K))
> +			continue;
> +
> +		dma_free_wc(dev, PAGE_SIZE, vaddr, context->stlb_dma[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +etnaviv_iommuv2_ensure_stlb_new(struct etnaviv_iommuv2_context *context,
> +				unsigned int stlb)
> +{
> +	struct device *dev =3D context->base.global->dev;
> +	void *vaddr;
> +	dma_addr_t daddr;
> +	unsigned int i;
> +
> +	if (context->stlb_cpu[stlb])
> +		return 0;
> +
> +	vaddr =3D dma_alloc_wc(dev, PAGE_SIZE, &daddr, GFP_KERNEL);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> +	memset32(vaddr, MMUv2_PTE_EXCEPTION, PAGE_SIZE / sizeof(u32));
> +
> +	stlb &=3D ~(PAGE_SIZE / SZ_4K - 1);
> +
> +	for (i =3D 0; i < PAGE_SIZE / SZ_4K; ++i) {
> +		context->stlb_cpu[stlb + i] =3D vaddr;
> +		context->stlb_dma[stlb + i] =3D daddr;
> +		context->mtlb_cpu[stlb + i] =3D daddr | MMUv2_PTE_PRESENT;
> +		vaddr +=3D SZ_4K;
> +		daddr +=3D SZ_4K;
> +	}
> +
> +	return 0;
> +}
> +
>  static void etnaviv_iommuv2_free(struct etnaviv_iommu_context *context)
>  {
>  	struct etnaviv_iommuv2_context *v2_context =3D to_v2_context(context);
> -	int i;
> =20
>  	drm_mm_takedown(&context->mm);
> =20
> -	for (i =3D 0; i < MMUv2_MAX_STLB_ENTRIES; i++) {
> -		if (v2_context->stlb_cpu[i])
> -			dma_free_wc(context->global->dev, SZ_4K,
> -				    v2_context->stlb_cpu[i],
> -				    v2_context->stlb_dma[i]);
> -	}
> +	etnaviv_iommuv2_stlb_free(v2_context);
> =20
>  	dma_free_wc(context->global->dev, SZ_4K, v2_context->mtlb_cpu,
>  		    v2_context->mtlb_dma);
> @@ -65,6 +112,7 @@ static void etnaviv_iommuv2_free(struct etnaviv_iommu_=
context *context)
> =20
>  	vfree(v2_context);
>  }
> +
>  static int
>  etnaviv_iommuv2_ensure_stlb(struct etnaviv_iommuv2_context *v2_context,
>  			    int stlb)
> @@ -109,7 +157,7 @@ static int etnaviv_iommuv2_map(struct etnaviv_iommu_c=
ontext *context,
>  	mtlb_entry =3D (iova & MMUv2_MTLB_MASK) >> MMUv2_MTLB_SHIFT;
>  	stlb_entry =3D (iova & MMUv2_STLB_MASK) >> MMUv2_STLB_SHIFT;
> =20
> -	ret =3D etnaviv_iommuv2_ensure_stlb(v2_context, mtlb_entry);
> +	ret =3D etnaviv_iommuv2_ensure_stlb_new(v2_context, mtlb_entry);
>  	if (ret)
>  		return ret;
> =20

