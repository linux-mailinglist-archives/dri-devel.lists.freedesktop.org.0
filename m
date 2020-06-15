Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E356F1F9149
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 10:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE4A89B01;
	Mon, 15 Jun 2020 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF1589B01;
 Mon, 15 Jun 2020 08:23:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 81CBFB158;
 Mon, 15 Jun 2020 08:23:43 +0000 (UTC)
Subject: Re: [PATCH 9/9] drm/shmem-helpers: Simplify dma-buf importing
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-10-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <b29c8109-30e5-83a4-0f98-ddf7637d5436@suse.de>
Date: Mon, 15 Jun 2020 10:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200511093554.211493-10-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1648459195=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1648459195==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QIMMCKfJ8gPyXsDTW2faqoEQdZS3etzDg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QIMMCKfJ8gPyXsDTW2faqoEQdZS3etzDg
Content-Type: multipart/mixed; boundary="eBqHmzbz8WAE4gmhYELncjiP13XSBosSu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <b29c8109-30e5-83a4-0f98-ddf7637d5436@suse.de>
Subject: Re: [PATCH 9/9] drm/shmem-helpers: Simplify dma-buf importing
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-10-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511093554.211493-10-daniel.vetter@ffwll.ch>

--eBqHmzbz8WAE4gmhYELncjiP13XSBosSu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

this patch causes a segmentation fault.

Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> - Ditch the ->pages array
> - Make it a private gem bo, which means no shmem object, which means
>   fireworks if anyone calls drm_gem_object_get_pages. But we've just
>   made sure that's all covered.
>=20
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 59 ++++++++++----------------=

>  1 file changed, 23 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index f7011338813e..8c7d4f422b7b 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -35,22 +35,12 @@ static const struct drm_gem_object_funcs drm_gem_sh=
mem_funcs =3D {
>  	.mmap =3D drm_gem_shmem_mmap,
>  };
> =20
> -/**
> - * drm_gem_shmem_create - Allocate an object with the given size
> - * @dev: DRM device
> - * @size: Size of the object to allocate
> - *
> - * This function creates a shmem GEM object.
> - *
> - * Returns:
> - * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded =
negative
> - * error code on failure.
> - */
> -struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *d=
ev, size_t size)
> +static struct drm_gem_shmem_object *
> +__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool priva=
te)
>  {
>  	struct drm_gem_shmem_object *shmem;
>  	struct drm_gem_object *obj;
> -	int ret;
> +	int ret =3D 0;
> =20
>  	size =3D PAGE_ALIGN(size);
> =20
> @@ -64,7 +54,10 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
>  	if (!obj->funcs)
>  		obj->funcs =3D &drm_gem_shmem_funcs;
> =20
> -	ret =3D drm_gem_object_init(dev, obj, size);
> +	if (private)
> +		drm_gem_private_object_init(dev, obj, size);

This call doesn't set obj->filp, which is dereferenced further below at
[1]. This happens from dumb_create().

Best regards
Thomas

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/drm_gem_shmem_helper.c?h=3Dv5.8-rc1#n87

> +	else
> +		ret =3D drm_gem_object_init(dev, obj, size);
>  	if (ret)
>  		goto err_free;
> =20
> @@ -96,6 +89,21 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
> =20
>  	return ERR_PTR(ret);
>  }
> +/**
> + * drm_gem_shmem_create - Allocate an object with the given size
> + * @dev: DRM device
> + * @size: Size of the object to allocate
> + *
> + * This function creates a shmem GEM object.
> + *
> + * Returns:
> + * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded =
negative
> + * error code on failure.
> + */
> +struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *d=
ev, size_t size)
> +{
> +	return __drm_gem_shmem_create(dev, size, false);
> +}
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> =20
>  /**
> @@ -115,7 +123,6 @@ void drm_gem_shmem_free_object(struct drm_gem_objec=
t *obj)
>  	if (obj->import_attach) {
>  		shmem->pages_use_count--;
>  		drm_prime_gem_destroy(obj, shmem->sgt);
> -		kvfree(shmem->pages);
>  	} else {
>  		if (shmem->sgt) {
>  			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> @@ -371,7 +378,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *f=
ile_priv,
>  	struct drm_gem_shmem_object *shmem;
>  	int ret;
> =20
> -	shmem =3D drm_gem_shmem_create(dev, size);
> +	shmem =3D __drm_gem_shmem_create(dev, size, true);
>  	if (IS_ERR(shmem))
>  		return shmem;
> =20
> @@ -695,36 +702,16 @@ drm_gem_shmem_prime_import_sg_table(struct drm_de=
vice *dev,
>  				    struct sg_table *sgt)
>  {
>  	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
> -	size_t npages =3D size >> PAGE_SHIFT;
>  	struct drm_gem_shmem_object *shmem;
> -	int ret;
> =20
>  	shmem =3D drm_gem_shmem_create(dev, size);
>  	if (IS_ERR(shmem))
>  		return ERR_CAST(shmem);
> =20
> -	shmem->pages =3D kvmalloc_array(npages, sizeof(struct page *), GFP_KE=
RNEL);
> -	if (!shmem->pages) {
> -		ret =3D -ENOMEM;
> -		goto err_free_gem;
> -	}
> -
> -	ret =3D drm_prime_sg_to_page_addr_arrays(sgt, shmem->pages, NULL, npa=
ges);
> -	if (ret < 0)
> -		goto err_free_array;
> -
>  	shmem->sgt =3D sgt;
> -	shmem->pages_use_count =3D 1; /* Permanently pinned from our point of=
 view */
> =20
>  	DRM_DEBUG_PRIME("size =3D %zu\n", size);
> =20
>  	return &shmem->base;
> -
> -err_free_array:
> -	kvfree(shmem->pages);
> -err_free_gem:
> -	drm_gem_object_put_unlocked(&shmem->base);
> -
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eBqHmzbz8WAE4gmhYELncjiP13XSBosSu--

--QIMMCKfJ8gPyXsDTW2faqoEQdZS3etzDg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7nMAYACgkQaA3BHVML
eiNQhAf/e1438dmETIObbVXOwQbHs6oyXFxqLE4hZSrVj4YNH98jaY/hzeJoDeVO
DoZPryQRnnVkbfwkiMMKphURFXM0I8O5X00NqXRn5wX5Di6TgUoF+HKN1zRF5eI4
COhtQWtZBWhw39SZX05+b4lnQkct5R0kxA/fV93KIZULvSaK110QsAfYVIySloq3
fx0clt0IgxK6vt9RTuPdD+hrpEmaOQTa+IJuOxZM3mWVJc2yT5+Cf9t1WEelSJ4W
Z6TH+QvyNctqe4PmvrGu/uuOgR5cNmUF1xLmllcr6GqtYmtP9ZIujOcd0x/iUTxp
SXduxjHL0Xf6ovc7cO/BR0svdLfq8g==
=zqh9
-----END PGP SIGNATURE-----

--QIMMCKfJ8gPyXsDTW2faqoEQdZS3etzDg--

--===============1648459195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1648459195==--
