Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1E898BDCE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 15:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576610E315;
	Tue,  1 Oct 2024 13:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9A610E315
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 13:34:23 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svd19-0004Gu-Um; Tue, 01 Oct 2024 15:34:20 +0200
Message-ID: <1fa17d58ed1ef842cf8a4cb384d69b9a78ff0d6f.camel@pengutronix.de>
Subject: Re: [PATCH v15 03/19] drm/etnaviv: Implement
 drm_gem_object_funcs::vunmap()
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 15:34:19 +0200
In-Reply-To: <20240908094357.291862-4-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-4-sui.jingfeng@linux.dev>
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
> The vunmap() can be used to release virtual mapping obtained by vmap(),
> While the vmap() is used to make a long duration mapping of multiple
> physical pages into a contiguous virtual space.
>=20
> Make the implementation-specific vunmap() operation untangled with the
> etnaviv_gem_xxx_release() function. As then, the etnaviv_gem_xxx_release(=
)
> only need to responsible for the release page works.
>=20
> The etnaviv_gem_vunmap() is added for driver internal usa case, where no
> DRM GEM framework is involved.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 38 ++++++++++++++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h       |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 ++++---
>  4 files changed, 47 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etna=
viv/etnaviv_drv.h
> index b3eb1662e90c..2eb2ff13f6e8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -61,6 +61,7 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_tabl=
e(struct drm_device *dev,
>  int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
>  void etnaviv_gem_prime_unpin(struct drm_gem_object *obj);
>  void *etnaviv_gem_vmap(struct drm_gem_object *obj);
> +void etnaviv_gem_vunmap(struct drm_gem_object *obj);
>  int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
>  		struct drm_etnaviv_timespec *timeout);
>  int etnaviv_gem_cpu_fini(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 6bdf72cd9e85..fad23494d08e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -340,6 +340,25 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
>  	return etnaviv_obj->vaddr;
>  }
> =20
> +void etnaviv_gem_vunmap(struct drm_gem_object *obj)
> +{
> +	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
> +
> +	if (!etnaviv_obj->vaddr)
> +		return;
> +
> +	mutex_lock(&etnaviv_obj->lock);

Either the mutex must extend across the above vaddr check, or the check
need to be repeated within the mutex section, similar to the
implementation in etnaviv_gem_vmap.

Regards,
Lucas

> +	etnaviv_obj->ops->vunmap(etnaviv_obj);
> +	etnaviv_obj->vaddr =3D NULL;
> +	mutex_unlock(&etnaviv_obj->lock);
> +}
> +
> +static void etnaviv_gem_object_vunmap(struct drm_gem_object *obj,
> +				      struct iosys_map *map)
> +{
> +	etnaviv_gem_vunmap(obj);
> +}
> +
>  static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>  {
>  	struct page **pages;
> @@ -471,14 +490,21 @@ void etnaviv_gem_describe_objects(struct etnaviv_dr=
m_private *priv,
> =20
>  static void etnaviv_gem_shmem_release(struct etnaviv_gem_object *etnaviv=
_obj)
>  {
> -	vunmap(etnaviv_obj->vaddr);
>  	put_pages(etnaviv_obj);
>  }
> =20
> +static void etnaviv_gem_shmem_vunmap(struct etnaviv_gem_object *etnaviv_=
obj)
> +{
> +	lockdep_assert_held(&etnaviv_obj->lock);
> +
> +	vunmap(etnaviv_obj->vaddr);
> +}
> +
>  static const struct etnaviv_gem_ops etnaviv_gem_shmem_ops =3D {
>  	.get_pages =3D etnaviv_gem_shmem_get_pages,
>  	.release =3D etnaviv_gem_shmem_release,
>  	.vmap =3D etnaviv_gem_vmap_impl,
> +	.vunmap =3D etnaviv_gem_shmem_vunmap,
>  	.mmap =3D etnaviv_gem_mmap_obj,
>  };
> =20
> @@ -508,6 +534,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *o=
bj)
>  		kfree(mapping);
>  	}
> =20
> +	etnaviv_obj->ops->vunmap(etnaviv_obj);
>  	etnaviv_obj->ops->release(etnaviv_obj);
>  	drm_gem_object_release(obj);
> =20
> @@ -569,6 +596,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_=
object_funcs =3D {
>  	.unpin =3D etnaviv_gem_prime_unpin,
>  	.get_sg_table =3D etnaviv_gem_prime_get_sg_table,
>  	.vmap =3D etnaviv_gem_prime_vmap,
> +	.vunmap =3D etnaviv_gem_object_vunmap,
>  	.mmap =3D etnaviv_gem_mmap,
>  	.vm_ops =3D &vm_ops,
>  };
> @@ -723,6 +751,13 @@ static void etnaviv_gem_userptr_release(struct etnav=
iv_gem_object *etnaviv_obj)
>  	}
>  }
> =20
> +static void etnaviv_gem_userptr_vunmap(struct etnaviv_gem_object *etnavi=
v_obj)
> +{
> +	lockdep_assert_held(&etnaviv_obj->lock);
> +
> +	vunmap(etnaviv_obj->vaddr);
> +}
> +
>  static int etnaviv_gem_userptr_mmap_obj(struct etnaviv_gem_object *etnav=
iv_obj,
>  		struct vm_area_struct *vma)
>  {
> @@ -733,6 +768,7 @@ static const struct etnaviv_gem_ops etnaviv_gem_userp=
tr_ops =3D {
>  	.get_pages =3D etnaviv_gem_userptr_get_pages,
>  	.release =3D etnaviv_gem_userptr_release,
>  	.vmap =3D etnaviv_gem_vmap_impl,
> +	.vunmap =3D etnaviv_gem_userptr_vunmap,
>  	.mmap =3D etnaviv_gem_userptr_mmap_obj,
>  };
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etna=
viv/etnaviv_gem.h
> index 3f8fe19a77cc..d4965de3007c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -65,6 +65,7 @@ struct etnaviv_gem_ops {
>  	int (*get_pages)(struct etnaviv_gem_object *);
>  	void (*release)(struct etnaviv_gem_object *);
>  	void *(*vmap)(struct etnaviv_gem_object *);
> +	void (*vunmap)(struct etnaviv_gem_object *);
>  	int (*mmap)(struct etnaviv_gem_object *, struct vm_area_struct *);
>  };
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem_prime.c
> index 6b98200068e4..bea50d720450 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -62,11 +62,6 @@ void etnaviv_gem_prime_unpin(struct drm_gem_object *ob=
j)
> =20
>  static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv=
_obj)
>  {
> -	struct iosys_map map =3D IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
> -
> -	if (etnaviv_obj->vaddr)
> -		dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map)=
;
> -
>  	/* Don't drop the pages for imported dmabuf, as they are not
>  	 * ours, just free the array we allocated:
>  	 */
> @@ -88,6 +83,13 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnavi=
v_gem_object *etnaviv_obj)
>  	return map.vaddr;
>  }
> =20
> +static void etnaviv_gem_prime_vunmap(struct etnaviv_gem_object *etnaviv_=
obj)
> +{
> +	struct iosys_map map =3D IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
> +
> +	dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map);
> +}
> +
>  static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv=
_obj,
>  		struct vm_area_struct *vma)
>  {
> @@ -106,6 +108,7 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime=
_ops =3D {
>  	/* .get_pages should never be called */
>  	.release =3D etnaviv_gem_prime_release,
>  	.vmap =3D etnaviv_gem_prime_vmap_impl,
> +	.vunmap =3D etnaviv_gem_prime_vunmap,
>  	.mmap =3D etnaviv_gem_prime_mmap_obj,
>  };
> =20

