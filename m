Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0498BE21
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 15:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A8610E281;
	Tue,  1 Oct 2024 13:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F91A10E281
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 13:40:56 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1svd7W-0007sc-4U; Tue, 01 Oct 2024 15:40:54 +0200
Message-ID: <4a8d06075edb6b5e0d2d71355a55acfd19cd2983.camel@pengutronix.de>
Subject: Re: [PATCH v15 04/19] drm/etnaviv: Make etnaviv_gem_prime_vmap() a
 static function
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Oct 2024 15:40:53 +0200
In-Reply-To: <20240908094357.291862-5-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-5-sui.jingfeng@linux.dev>
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
> The etnaviv_gem_prime_vmap() function has no caller in the
> etnaviv_gem_prime.c file, move it into etnaviv_gem.c file.
> While at it, rename it as etnaviv_gem_object_vmap(), since
> it is a intermidiate layer function, it has no direct relation
> ship with the PRIME. The etnaviv_gem_prime.c file already has
> etnaviv_gem_prime_vmap_impl() as the implementation to vmap
> a imported GEM buffer object.
>=20
I don't agree with the premise with this patch. This function is
clearly prime specific, so I don't think it should move.

Regards,
Lucas

> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 16 +++++++++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 12 ------------
>  3 files changed, 15 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etna=
viv/etnaviv_drv.h
> index 2eb2ff13f6e8..c217b54b214c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -55,7 +55,6 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> =20
>  int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
>  struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *o=
bj);
> -int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map =
*map);
>  struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_devi=
ce *dev,
>  	struct dma_buf_attachment *attach, struct sg_table *sg);
>  int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index fad23494d08e..85d4e7c87a6a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_prime.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/iosys-map.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/spinlock.h>
>  #include <linux/vmalloc.h>
> @@ -340,6 +341,19 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
>  	return etnaviv_obj->vaddr;
>  }
> =20
> +static int etnaviv_gem_object_vmap(struct drm_gem_object *obj,
> +				   struct iosys_map *map)
> +{
> +	void *vaddr;
> +
> +	vaddr =3D etnaviv_gem_vmap(obj);
> +	if (!vaddr)
> +		return -ENOMEM;
> +	iosys_map_set_vaddr(map, vaddr);
> +
> +	return 0;
> +}
> +
>  void etnaviv_gem_vunmap(struct drm_gem_object *obj)
>  {
>  	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
> @@ -595,7 +609,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_=
object_funcs =3D {
>  	.pin =3D etnaviv_gem_prime_pin,
>  	.unpin =3D etnaviv_gem_prime_unpin,
>  	.get_sg_table =3D etnaviv_gem_prime_get_sg_table,
> -	.vmap =3D etnaviv_gem_prime_vmap,
> +	.vmap =3D etnaviv_gem_object_vmap,
>  	.vunmap =3D etnaviv_gem_object_vunmap,
>  	.mmap =3D etnaviv_gem_mmap,
>  	.vm_ops =3D &vm_ops,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem_prime.c
> index bea50d720450..8f523cbee60a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -25,18 +25,6 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct=
 drm_gem_object *obj)
>  	return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, npages);
>  }
> =20
> -int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map =
*map)
> -{
> -	void *vaddr;
> -
> -	vaddr =3D etnaviv_gem_vmap(obj);
> -	if (!vaddr)
> -		return -ENOMEM;
> -	iosys_map_set_vaddr(map, vaddr);
> -
> -	return 0;
> -}
> -
>  int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
>  {
>  	if (!obj->import_attach) {

