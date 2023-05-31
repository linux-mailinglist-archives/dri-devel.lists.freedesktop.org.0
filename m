Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CF718777
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 18:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9210E2C9;
	Wed, 31 May 2023 16:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593BE10E263
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:34:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q4Oll-0007Z0-9S; Wed, 31 May 2023 18:33:53 +0200
Message-ID: <35c15c0912b4a9372b9c2194a46b518ce515ce3d.camel@pengutronix.de>
Subject: Re: [PATCH v6 6/6] drm/etnaviv: allow usperspace create cached
 coherent bo
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 31 May 2023 18:33:50 +0200
In-Reply-To: <20230530160643.2344551-7-suijingfeng@loongson.cn>
References: <20230530160643.2344551-1-suijingfeng@loongson.cn>
 <20230530160643.2344551-7-suijingfeng@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui Jingfeng,

Am Mittwoch, dem 31.05.2023 um 00:06 +0800 schrieb Sui Jingfeng:
> cached system RAM is coherent on loongson CPUs, and the GPU and DC allway=
s
> snoop the CPU's cache. write-combine caching property is not suitiable fo=
r
> us.
>=20
As previously mentioned in the Mesa MR, I don't think this is the right
approach.

ETNA_BO_CACHED already looks coherent to userspace, as all accesses are
bracketed via the ETNAVIV_GEM_CPU_PREP and ETNAVIV_GEM_CPU_FINI ioctls,
which will do the necessary cache maintenance on platforms where device
coherence isn't enforced by the hardware, so there is no need for a
separate ETNA_BO_CACHED_COHERENT.

Instead we just need a new ETNAVIV_PARAM to inform userspace about
hardware cache coherence being available for a specific GPU core, in
which case the userspace driver should switch to preferring
ETNA_BO_CACHED over ETNA_BO_WC.

Regards,
Lucas

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c       |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 22 +++++++++++++++++++--
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  9 ++++++++-
>  include/uapi/drm/etnaviv_drm.h              | 11 ++++++-----
>  4 files changed, 35 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 052f745cecc0..2816c654c023 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -274,7 +274,7 @@ static int etnaviv_ioctl_gem_new(struct drm_device *d=
ev, void *data,
>  	struct drm_etnaviv_gem_new *args =3D data;
> =20
>  	if (args->flags & ~(ETNA_BO_CACHED | ETNA_BO_WC | ETNA_BO_UNCACHED |
> -			    ETNA_BO_FORCE_MMU))
> +			    ETNA_BO_CACHED_COHERENT | ETNA_BO_FORCE_MMU))
>  		return -EINVAL;
> =20
>  	return etnaviv_gem_new_handle(dev, file, args->size,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index b5f73502e3dd..d8b559bd33d3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -343,6 +343,7 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
>  static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>  {
>  	struct page **pages;
> +	pgprot_t prot;
> =20
>  	lockdep_assert_held(&obj->lock);
> =20
> @@ -350,8 +351,20 @@ static void *etnaviv_gem_vmap_impl(struct etnaviv_ge=
m_object *obj)
>  	if (IS_ERR(pages))
>  		return NULL;
> =20
> -	return vmap(pages, obj->base.size >> PAGE_SHIFT,
> -			VM_MAP, pgprot_writecombine(PAGE_KERNEL));
> +	switch (obj->flags) {
> +	case ETNA_BO_CACHED_COHERENT:
> +	case ETNA_BO_CACHED:
> +		prot =3D PAGE_KERNEL;
> +		break;
> +	case ETNA_BO_UNCACHED:
> +		prot =3D pgprot_noncached(PAGE_KERNEL);
> +		break;
> +	case ETNA_BO_WC:
> +	default:
> +		prot =3D pgprot_writecombine(PAGE_KERNEL);
> +	}
> +
> +	return vmap(pages, obj->base.size >> PAGE_SHIFT, VM_MAP, prot);
>  }
> =20
>  static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
> @@ -545,6 +558,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_=
object_funcs =3D {
>  static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 fl=
ags,
>  	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>  {
> +	struct etnaviv_drm_private *priv =3D dev->dev_private;
>  	struct etnaviv_gem_object *etnaviv_obj;
>  	unsigned sz =3D sizeof(*etnaviv_obj);
>  	bool valid =3D true;
> @@ -555,6 +569,10 @@ static int etnaviv_gem_new_impl(struct drm_device *d=
ev, u32 size, u32 flags,
>  	case ETNA_BO_CACHED:
>  	case ETNA_BO_WC:
>  		break;
> +	case ETNA_BO_CACHED_COHERENT:
> +		if (priv->has_cached_coherent)
> +			break;
> +		fallthrough;
>  	default:
>  		valid =3D false;
>  	}
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem_prime.c
> index 3524b5811682..671d91d8f1c6 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -112,11 +112,18 @@ static const struct etnaviv_gem_ops etnaviv_gem_pri=
me_ops =3D {
>  struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_devi=
ce *dev,
>  	struct dma_buf_attachment *attach, struct sg_table *sgt)
>  {
> +	struct etnaviv_drm_private *priv =3D dev->dev_private;
>  	struct etnaviv_gem_object *etnaviv_obj;
>  	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
> +	u32 cache_flags;
>  	int ret, npages;
> =20
> -	ret =3D etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
> +	if (priv->has_cached_coherent)
> +		cache_flags =3D ETNA_BO_CACHED_COHERENT;
> +	else
> +		cache_flags =3D ETNA_BO_WC;
> +
> +	ret =3D etnaviv_gem_new_private(dev, size, cache_flags,
>  				      &etnaviv_gem_prime_ops, &etnaviv_obj);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_dr=
m.h
> index af024d90453d..474b0db286de 100644
> --- a/include/uapi/drm/etnaviv_drm.h
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -90,13 +90,14 @@ struct drm_etnaviv_param {
>   * GEM buffers:
>   */
> =20
> -#define ETNA_BO_CACHE_MASK   0x000f0000
> +#define ETNA_BO_CACHE_MASK              0x000f0000
>  /* cache modes */
> -#define ETNA_BO_CACHED       0x00010000
> -#define ETNA_BO_WC           0x00020000
> -#define ETNA_BO_UNCACHED     0x00040000
> +#define ETNA_BO_CACHED                  0x00010000
> +#define ETNA_BO_WC                      0x00020000
> +#define ETNA_BO_UNCACHED                0x00040000
> +#define ETNA_BO_CACHED_COHERENT         0x00080000
>  /* map flags */
> -#define ETNA_BO_FORCE_MMU    0x00100000
> +#define ETNA_BO_FORCE_MMU               0x00100000
> =20
>  struct drm_etnaviv_gem_new {
>  	__u64 size;           /* in */

