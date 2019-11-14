Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF826FC198
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3986E6E14D;
	Thu, 14 Nov 2019 08:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC726E14D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:33:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3A19B1BF;
 Thu, 14 Nov 2019 08:33:16 +0000 (UTC)
Subject: Re: [PATCH] drm/ttm: fix mmap refcounting
To: Gerd Hoffmann <kraxel@redhat.com>, drm@redhat.com
References: <20191113135612.19679-1-kraxel@redhat.com>
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
Message-ID: <7c5beaf0-8fbc-d513-fffe-2140bbe5318f@suse.de>
Date: Thu, 14 Nov 2019 09:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191113135612.19679-1-kraxel@redhat.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0814800551=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0814800551==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9Jn5K0veYJiURwnjYY9vK4q8DXTeZXrqv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9Jn5K0veYJiURwnjYY9vK4q8DXTeZXrqv
Content-Type: multipart/mixed; boundary="pgQwq5GsLGYMTNOHVRlAFHRzbpq562mdd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, drm@redhat.com
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Message-ID: <7c5beaf0-8fbc-d513-fffe-2140bbe5318f@suse.de>
Subject: Re: [PATCH] drm/ttm: fix mmap refcounting
References: <20191113135612.19679-1-kraxel@redhat.com>
In-Reply-To: <20191113135612.19679-1-kraxel@redhat.com>

--pgQwq5GsLGYMTNOHVRlAFHRzbpq562mdd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 13.11.19 um 14:56 schrieb Gerd Hoffmann:
> When mapping ttm objects via drm_gem_ttm_mmap() helper
> drm_gem_mmap_obj() will take an object reference.  That gets
> never released due to ttm having its own reference counting.
>=20
> Fix that by dropping the gem object reference once the ttm mmap
> completed (and ttm refcount got bumped).
>=20
> For that to work properly the drm_gem_object_get() call in
> drm_gem_ttm_mmap() must be moved so it happens before calling
> obj->funcs->mmap(), otherwise the gem refcount would go down
> to zero.
>=20
> Fixes: 231927d939f0 ("drm/ttm: add drm_gem_ttm_mmap()")
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem.c            | 24 ++++++++++++++----------
>  drivers/gpu/drm/drm_gem_ttm_helper.c | 13 ++++++++++++-
>  2 files changed, 26 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 2f2b889096b0..000fa4a1899f 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1105,21 +1105,33 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj=
, unsigned long obj_size,
>  	if (obj_size < vma->vm_end - vma->vm_start)
>  		return -EINVAL;
> =20
> +	/* Take a ref for this mapping of the object, so that the fault
> +	 * handler can dereference the mmap offset's pointer to the object.
> +	 * This reference is cleaned up by the corresponding vm_close
> +	 * (which should happen whether the vma was created by this call, or
> +	 * by a vm_open due to mremap or partial unmap or whatever).
> +	 */
> +	drm_gem_object_get(obj);
> +
>  	if (obj->funcs && obj->funcs->mmap) {
>  		/* Remove the fake offset */
>  		vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
> =20
>  		ret =3D obj->funcs->mmap(obj, vma);
> -		if (ret)
> +		if (ret) {
> +			drm_gem_object_put_unlocked(obj);
>  			return ret;
> +		}
>  		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
>  	} else {
>  		if (obj->funcs && obj->funcs->vm_ops)
>  			vma->vm_ops =3D obj->funcs->vm_ops;
>  		else if (dev->driver->gem_vm_ops)
>  			vma->vm_ops =3D dev->driver->gem_vm_ops;
> -		else
> +		else {
> +			drm_gem_object_put_unlocked(obj);
>  			return -EINVAL;
> +		}
> =20
>  		vma->vm_flags |=3D VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
>  		vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_f=
lags));
> @@ -1128,14 +1140,6 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj,=
 unsigned long obj_size,
> =20
>  	vma->vm_private_data =3D obj;
> =20
> -	/* Take a ref for this mapping of the object, so that the fault
> -	 * handler can dereference the mmap offset's pointer to the object.
> -	 * This reference is cleaned up by the corresponding vm_close
> -	 * (which should happen whether the vma was created by this call, or
> -	 * by a vm_open due to mremap or partial unmap or whatever).
> -	 */
> -	drm_gem_object_get(obj);
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_gem_mmap_obj);
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm=
_gem_ttm_helper.c
> index 7412bfc5c05a..605a8a3da7f9 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -64,8 +64,19 @@ int drm_gem_ttm_mmap(struct drm_gem_object *gem,
>  		     struct vm_area_struct *vma)
>  {
>  	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> +	int ret;
> =20
> -	return ttm_bo_mmap_obj(vma, bo);
> +	ret =3D ttm_bo_mmap_obj(vma, bo);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * ttm has its own object refcounting, so drop gem reference
> +	 * to avoid double accounting counting.
> +	 */
> +	drm_gem_object_put_unlocked(gem);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_gem_ttm_mmap);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--pgQwq5GsLGYMTNOHVRlAFHRzbpq562mdd--

--9Jn5K0veYJiURwnjYY9vK4q8DXTeZXrqv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3NEUsACgkQaA3BHVML
eiNGfwf/Yi4/R/f+0J9m9UP4gtjyDkc/mrGpf/8fL8vZLR4Cj2vG8m5MCv7BjojA
rYkTAIppb1Gmctydrs5nawQE/hqiYUyLvzJfWhgXCu6ZaqXwgdiy9qVY6PKzBeQK
p2l9G3X2n3z4maHCaI/7Xc5GG1Nsh5SU9dsz1szHQplDKsPcBbYk6CBF03vZQEDP
HBY6rud4tltBQliVfCqbcvLBenzYAlBBTLmLH5dH6/MtJD3YEj2qTg6lWH3WpY8/
ASkCXmPyvFO7yF9ZdoAFks6VTinPgcODjl8l9QEpPvLleOayBe+IzLmxNRrPeeCU
HG05UPVP7BPD1AufrvlRjWdFMyTvWA==
=1fOC
-----END PGP SIGNATURE-----

--9Jn5K0veYJiURwnjYY9vK4q8DXTeZXrqv--

--===============0814800551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0814800551==--
