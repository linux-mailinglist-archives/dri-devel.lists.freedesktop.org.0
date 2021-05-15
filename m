Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCAB381710
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 11:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A096E1B2;
	Sat, 15 May 2021 09:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB536E1B2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 09:03:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37E6EB087;
 Sat, 15 May 2021 09:03:36 +0000 (UTC)
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210514201138.162230-1-paul@crapouillou.net>
 <20210514201138.162230-2-paul@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
Message-ID: <738660d9-495b-a9b5-b371-a2e4364ee9b8@suse.de>
Date: Sat, 15 May 2021 11:03:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514201138.162230-2-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZT5443mLo47pvuIfKGLm1jd991pioFzRy"
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
Cc: Christoph Hellwig <hch@infradead.org>, od@opendingux.net,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZT5443mLo47pvuIfKGLm1jd991pioFzRy
Content-Type: multipart/mixed; boundary="3awZKbiB8nLnLm0gXzNdnXHNfzOnK0Sty";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 od@opendingux.net
Message-ID: <738660d9-495b-a9b5-b371-a2e4364ee9b8@suse.de>
Subject: Re: [PATCH v3 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
References: <20210514201138.162230-1-paul@crapouillou.net>
 <20210514201138.162230-2-paul@crapouillou.net>
In-Reply-To: <20210514201138.162230-2-paul@crapouillou.net>

--3awZKbiB8nLnLm0gXzNdnXHNfzOnK0Sty
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.05.21 um 22:11 schrieb Paul Cercueil:
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
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/gpu/drm/drm_gem_cma_helper.c | 41 +++++++++++++++++++++++++--=
-
>   include/drm/drm_gem_cma_helper.h     |  7 ++++-
>   2 files changed, 43 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm=
_gem_cma_helper.c
> index 7942cf05cd93..81a31bcf7d68 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -115,8 +115,15 @@ struct drm_gem_cma_object *drm_gem_cma_create(stru=
ct drm_device *drm,
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
> @@ -499,8 +506,13 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, s=
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
> @@ -556,3 +568,24 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_=
device *dev,
>   	return obj;
>   }
>   EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
> +
> +/**
> + * drm_gem_cma_prime_mmap - PRIME mmap function for CMA GEM drivers
> + * @obj: GEM object
> + * @vma: Virtual address range
> + *
> + * Carbon copy of drm_gem_prime_mmap, but the 'map_noncoherent' flag i=
s
> + * disabled to ensure that the exported buffers have the expected cach=
e
> + * coherency.
> + */
> +int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
> +			   struct vm_area_struct *vma)
> +{
> +	struct drm_gem_cma_object *cma_obj =3D to_drm_gem_cma_obj(obj);
> +
> +	/* Use standard cache settings for PRIME-exported GEM buffers */
> +	cma_obj->map_noncoherent =3D false;
> +
> +	return drm_gem_prime_mmap(obj, vma);
> +}
> +EXPORT_SYMBOL(drm_gem_cma_prime_mmap);
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma=
_helper.h
> index 0a9711caa3e8..b597e00fd5f6 100644
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
> @@ -119,7 +122,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, st=
ruct vm_area_struct *vma);
>   	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd, \
>   	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle, \
>   	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table, \
> -	.gem_prime_mmap		=3D drm_gem_prime_mmap
> +	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap

gem_prime_mmap is deprecated and on the way out. Only mmap in=20
drm_gem_object_funcs should be used. I have patches for other drivers=20
that convert everything to drm_gem_prime_mmap. Afterwards the pointer=20
can be removed.

Rather than writing a custom prime mmap function, update=20
drm_gem_cma_prime_import_sg_table() so that it disables non-coherent=20
mappings for imported buffers. For an example, see how SHMEM's internal=20
create function uses the 'private' parameter. [1]

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_gem_sh=
mem_helper.c#L39

>  =20
>   /**
>    * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
> @@ -181,5 +184,7 @@ struct drm_gem_object *
>   drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
>   				       struct dma_buf_attachment *attach,
>   				       struct sg_table *sgt);
> +int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
> +			   struct vm_area_struct *vma);
>  =20
>   #endif /* __DRM_GEM_CMA_HELPER_H__ */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3awZKbiB8nLnLm0gXzNdnXHNfzOnK0Sty--

--ZT5443mLo47pvuIfKGLm1jd991pioFzRy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCfjmYFAwAAAAAACgkQlh/E3EQov+Dw
og/9HXqVWE6QKAASbeXIkrmhDQAdVHuhHEwwc1i9d5KzMHuHnmD/EReZor5KpBas5yWX7UUHSUui
KkbEY/f7Sa6tE+qtuLTOJhHyocNa1mrrGfQy7EvILjHNzdRPZeB51iqcUtya7pzWkbfki5ir1SKe
B8iFiAzxUetiENk+G+QRq0tBV4cB1wi+mzP2SKyCAHn2GGHLQeRzPjj71C1ZyPqTfsLZUDKqtfvU
n7JqPc59xx5GNpoX0RfDYt2zTLt4qjWRDL3ju1wShCvm/pqR277eTp6qIkZcc7gVnO/nEsxcoV7u
nVcxmpJKJ8FVrrE/RY3Pk7MvDKfTDhF9IXz2fBQLbkb1YlRVzvadvphaMaxAYL4831yuFPrOc7oO
CrlC/Egn5JFUTyAxhU9yTj1XHOl426Ot96/Y+wLZXd2tPAWlzUPrMxtSZHEx7cP8851dyGMfN9J0
7ILgf6Z4Y8f8y2OhTBkkZrc2Kl8Ubrvc7f5UWnhksCJNC+BtPyeWr6tLhL7CDfWiK2CzLTKGsG+K
janf892A5X2/7EzehOnupzGqNJgeckbcKoSR+I4nV2aQqBv+QLmF7PMeV+xdJ98SoytR9t2pUKGE
scv8tNWfkaguLlp1UlZUzxK8YMNKYWt7d2WkS4LBnpxq6u2Lb+Teawgo+pLlzkr66CgU2Vcn+fia
D+Y=
=kzo4
-----END PGP SIGNATURE-----

--ZT5443mLo47pvuIfKGLm1jd991pioFzRy--
