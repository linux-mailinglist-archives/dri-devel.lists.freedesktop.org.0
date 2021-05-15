Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F5381A97
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 20:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6406E431;
	Sat, 15 May 2021 18:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042836E431
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 18:49:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 688AAAF5B;
 Sat, 15 May 2021 18:49:11 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210515145359.64802-1-paul@crapouillou.net>
 <20210515145359.64802-2-paul@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fce9aae9-a9f8-1b90-33fc-16cf64888ff7@suse.de>
Date: Sat, 15 May 2021 20:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515145359.64802-2-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sJrRFkDAoEyRy39xoYSrAUozzf6xYe2ID"
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
Cc: Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sJrRFkDAoEyRy39xoYSrAUozzf6xYe2ID
Content-Type: multipart/mixed; boundary="qhw4perhhhklxwtWZJOyFEtlE03cfno0Q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Message-ID: <fce9aae9-a9f8-1b90-33fc-16cf64888ff7@suse.de>
Subject: Re: [PATCH v4 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
References: <20210515145359.64802-1-paul@crapouillou.net>
 <20210515145359.64802-2-paul@crapouillou.net>
In-Reply-To: <20210515145359.64802-2-paul@crapouillou.net>

--qhw4perhhhklxwtWZJOyFEtlE03cfno0Q
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 15.05.21 um 16:53 schrieb Paul Cercueil:
> Having GEM buffers backed by non-coherent memory is interesting in the
> particular case where it is faster to render to a non-coherent buffer
> then sync the data cache, than to render to a write-combine buffer, and=

> (by extension) much faster than using a shadow buffer. This is true for=

> instance on some Ingenic SoCs, where even simple blits (e.g. memcpy)
> are about three times faster using this method.
>=20
> Add a 'map_noncoherent' flag to the drm_gem_cma_object structure, which=

> can be set by the drivers when they create the dumb buffer.
>=20
> Since this really only applies to software rendering, disable this flag=

> as soon as the CMA objects are exported via PRIME.
>=20
> v3: New patch. Now uses a simple 'map_noncoherent' flag to control how
>      the objects are mapped, and use the new dma_mmap_pages function.
>=20
> v4: Make sure map_noncoherent is always disabled when creating GEM
>      objects meant to be used with dma-buf.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_gem_cma_helper.c | 38 +++++++++++++++++++++------=
-
>   include/drm/drm_gem_cma_helper.h     |  3 +++
>   2 files changed, 32 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm=
_gem_cma_helper.c
> index 7942cf05cd93..235c7a63da2b 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -46,6 +46,7 @@ static const struct drm_gem_object_funcs drm_gem_cma_=
default_funcs =3D {
>    * __drm_gem_cma_create - Create a GEM CMA object without allocating =
memory
>    * @drm: DRM device
>    * @size: size of the object to allocate
> + * @private: true if used for internal purposes
>    *
>    * This function creates and initializes a GEM CMA object of the give=
n size,
>    * but doesn't allocate any memory to back the object.
> @@ -55,11 +56,11 @@ static const struct drm_gem_object_funcs drm_gem_cm=
a_default_funcs =3D {
>    * error code on failure.
>    */
>   static struct drm_gem_cma_object *
> -__drm_gem_cma_create(struct drm_device *drm, size_t size)
> +__drm_gem_cma_create(struct drm_device *drm, size_t size, bool private=
)
>   {
>   	struct drm_gem_cma_object *cma_obj;
>   	struct drm_gem_object *gem_obj;
> -	int ret;
> +	int ret =3D 0;
>  =20
>   	if (drm->driver->gem_create_object)
>   		gem_obj =3D drm->driver->gem_create_object(drm, size);
> @@ -73,7 +74,14 @@ __drm_gem_cma_create(struct drm_device *drm, size_t =
size)
>  =20
>   	cma_obj =3D container_of(gem_obj, struct drm_gem_cma_object, base);
>  =20
> -	ret =3D drm_gem_object_init(drm, gem_obj, size);
> +	if (private) {
> +		drm_gem_private_object_init(drm, gem_obj, size);
> +
> +		/* Always use writecombine for dma-buf mappings */
> +		cma_obj->map_noncoherent =3D false;
> +	} else {
> +		ret =3D drm_gem_object_init(drm, gem_obj, size);
> +	}
>   	if (ret)
>   		goto error;
>  =20
> @@ -111,12 +119,19 @@ struct drm_gem_cma_object *drm_gem_cma_create(str=
uct drm_device *drm,
>  =20
>   	size =3D round_up(size, PAGE_SIZE);
>  =20
> -	cma_obj =3D __drm_gem_cma_create(drm, size);
> +	cma_obj =3D __drm_gem_cma_create(drm, size, false);
>   	if (IS_ERR(cma_obj))
>   		return cma_obj;
>  =20
> -	cma_obj->vaddr =3D dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
> -				      GFP_KERNEL | __GFP_NOWARN);
> +	if (cma_obj->map_noncoherent) {
> +		cma_obj->vaddr =3D dma_alloc_noncoherent(drm->dev, size,
> +						       &cma_obj->paddr,
> +						       DMA_TO_DEVICE,
> +						       GFP_KERNEL | __GFP_NOWARN);
> +	} else {
> +		cma_obj->vaddr =3D dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
> +					      GFP_KERNEL | __GFP_NOWARN);
> +	}
>   	if (!cma_obj->vaddr) {
>   		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
>   			 size);
> @@ -432,7 +447,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device=20
*dev,
>   		return ERR_PTR(-EINVAL);
>  =20
>   	/* Create a CMA GEM buffer. */
> -	cma_obj =3D __drm_gem_cma_create(dev, attach->dmabuf->size);
> +	cma_obj =3D __drm_gem_cma_create(dev, attach->dmabuf->size, true);
>   	if (IS_ERR(cma_obj))
>   		return ERR_CAST(cma_obj);
>  =20
> @@ -499,8 +514,13 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, s=
truct vm_area_struct *vma)
>  =20
>   	cma_obj =3D to_drm_gem_cma_obj(obj);
>  =20
> -	ret =3D dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
> -			  cma_obj->paddr, vma->vm_end - vma->vm_start);
> +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> +	if (!cma_obj->map_noncoherent)
> +		vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
> +
> +	ret =3D dma_mmap_pages(cma_obj->base.dev->dev,
> +			     vma, vma->vm_end - vma->vm_start,
> +			     virt_to_page(cma_obj->vaddr));
>   	if (ret)
>   		drm_gem_vm_close(vma);
>  =20
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma=
_helper.h
> index 0a9711caa3e8..cd13508acbc1 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -16,6 +16,7 @@ struct drm_mode_create_dumb;
>    *       more than one entry but they are guaranteed to have contiguo=
us
>    *       DMA addresses.
>    * @vaddr: kernel virtual address of the backing memory
> + * @map_noncoherent: if true, the GEM object is backed by non-coherent=20
memory
>    */
>   struct drm_gem_cma_object {
>   	struct drm_gem_object base;
> @@ -24,6 +25,8 @@ struct drm_gem_cma_object {
>  =20
>   	/* For objects with DMA memory allocated by GEM CMA */
>   	void *vaddr;
> +
> +	bool map_noncoherent;
>   };
>  =20
>   #define to_drm_gem_cma_obj(gem_obj) \
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qhw4perhhhklxwtWZJOyFEtlE03cfno0Q--

--sJrRFkDAoEyRy39xoYSrAUozzf6xYe2ID
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCgF6QFAwAAAAAACgkQlh/E3EQov+A+
EBAAtZY98FyozHDlGm2x7d3eNgL9WTOzVRGUEu9zoZ7uqTT7++ejjpRBsfOB/a+xe8xAkOsIrSkm
0IHmR1uoMAxCfNCT9IYGjGSky/ZAxMWedHxmSZzNfYE4gW5iudZAO5HIBPVFCsmr9EASxSa2Gorz
u6t8fBiat9JxNUmGVULgeJogtTfIUX9AYRyMISf2Zs/E1QWVKwsnF5yAI41ePqtdxvj4UNauElnF
BRv9JJxg8Sl2jVcvVRaaT9v3KOj/y5nKwxPNaDkfy5unryvUOkW2myws8inkhwPnCJVwt7hz/o69
ub7fJFhX+T9B/3J89+B7lcuERAWcOuYTI7Yz4B05XU9FQTzCvkaKgLBJX3c6eDsYZ5yBEbjSXM1s
ozmb7wPrCj2x4SNj+EAPGc65BMWNr60/RBB5E8YQknenHjY1MmcrC0hHUsp258I2Z9SMqGU0ZWy7
XxH+mTIpfFGQ5sQTP4WRq+CSVwH54voG/mQkDLX56oqxfnMKB7Us4ZXKf7Yn/ecyXutvZmzB9q6G
r6bnFJPvAaP1LYJuDrD+yBoVCgfT0aKqEwoJxNUAAxFYeBuiTJfsPEd2HS89RxEdup8WTgABlES3
UUhKJ/BwP5XDeL6iUYaajTumKuRi3ncfCp2tvmKTQL3MCKhcG++EHFe6+zu39aZ00Ndp90nqRRPx
Ouk=
=Mttz
-----END PGP SIGNATURE-----

--sJrRFkDAoEyRy39xoYSrAUozzf6xYe2ID--
