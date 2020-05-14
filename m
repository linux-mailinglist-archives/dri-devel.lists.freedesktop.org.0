Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160661D28A0
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C6A6EABD;
	Thu, 14 May 2020 07:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9366EABD;
 Thu, 14 May 2020 07:16:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14D92AAD0;
 Thu, 14 May 2020 07:17:01 +0000 (UTC)
Subject: Re: [PATCH 6/9] drm/shmem-helpers: Don't call get/put_pages on
 imported dma-buf in vmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-7-daniel.vetter@ffwll.ch>
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
Message-ID: <6910cb3c-7169-fe1c-efc1-3acb8a218384@suse.de>
Date: Thu, 14 May 2020 09:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511093554.211493-7-daniel.vetter@ffwll.ch>
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
Content-Type: multipart/mixed; boundary="===============0284331374=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0284331374==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nGCX8FK1bzqHDMgBXJVQiHV5FdyVZEWtt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nGCX8FK1bzqHDMgBXJVQiHV5FdyVZEWtt
Content-Type: multipart/mixed; boundary="VvyT2QdocWlyK4VPGbZQSjM5PWvkvK5Ey";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <6910cb3c-7169-fe1c-efc1-3acb8a218384@suse.de>
Subject: Re: [PATCH 6/9] drm/shmem-helpers: Don't call get/put_pages on
 imported dma-buf in vmap
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511093554.211493-7-daniel.vetter@ffwll.ch>

--VvyT2QdocWlyK4VPGbZQSjM5PWvkvK5Ey
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> There's no direct harm, because for the shmem helpers these are noops
> on imported buffers. The trouble is in the locks these take - I want
> to change dma_buf_vmap locking, and so need to make sure that we only
> ever take certain locks on one side of the dma-buf interface: Either
> for exporters, or for importers.
>=20
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 2a70159d50ef..b9cba5cc61c3 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -252,32 +252,33 @@ static void *drm_gem_shmem_vmap_locked(struct drm=
_gem_shmem_object *shmem)
>  	if (shmem->vmap_use_count++ > 0)
>  		return shmem->vaddr;
> =20
> -	ret =3D drm_gem_shmem_get_pages(shmem);
> -	if (ret)
> -		goto err_zero_use;
> -
>  	if (obj->import_attach) {
>  		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
>  	} else {
>  		pgprot_t prot =3D PAGE_KERNEL;
> =20
> +		ret =3D drm_gem_shmem_get_pages(shmem);
> +		if (ret)
> +			goto err;
> +
>  		if (!shmem->map_cached)
>  			prot =3D pgprot_writecombine(prot);
>  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>  				    VM_MAP, prot);
> +
> +		if (!shmem->vaddr)
> +			drm_gem_shmem_put_pages(shmem);
>  	}
> =20
>  	if (!shmem->vaddr) {
>  		DRM_DEBUG_KMS("Failed to vmap pages\n");
>  		ret =3D -ENOMEM;
> -		goto err_put_pages;
> +		goto err;
>  	}
> =20
>  	return shmem->vaddr;
> =20
> -err_put_pages:
> -	drm_gem_shmem_put_pages(shmem);

I found the new code to be less readable. Maybe keep the error rollback
as-is and protect _put_pages() with if (!import_attach).

In any case

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> -err_zero_use:
> +err:
>  	shmem->vmap_use_count =3D 0;
> =20
>  	return ERR_PTR(ret);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VvyT2QdocWlyK4VPGbZQSjM5PWvkvK5Ey--

--nGCX8FK1bzqHDMgBXJVQiHV5FdyVZEWtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl688GkACgkQaA3BHVML
eiOPdAf/e625C84ss+kTGUiHdD/8RpUIDtCnW4mIUGYRlX3NDTr8YtYdNyWryy0Q
wi0aq69De6YiPgkVlI2tbMchOnIKGQhdpDC9idG6QTYGI1c+cz2ogejIeXDsohdU
6Mn1KSfALoGKeumiEjT6oGG8EAWnIMiucrh99S8fJk25ka8lgH8obyuSnPnwWzHM
1FBFriUydB5zw4SnzTgWzcJcrUTlsvbbX0h2tKJEfLuSODsTTQfuoRUDBJiOhZTD
ogiiOTZFa9gRrD87CdLy5exdFVKPcHFcX/B6JFam07GGuASq/bVHyrN03/VZLTsZ
6WO3wiZuigJIEp0hkjJDk7nO9iKyZQ==
=22Ys
-----END PGP SIGNATURE-----

--nGCX8FK1bzqHDMgBXJVQiHV5FdyVZEWtt--

--===============0284331374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0284331374==--
