Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2DAB1E2B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372B26F3A4;
	Fri, 13 Sep 2019 13:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CAA6F3A4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:05:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E35DAEB8;
 Fri, 13 Sep 2019 13:05:35 +0000 (UTC)
Subject: Re: [PATCH 4/8] drm/ttm: factor out ttm_bo_mmap_vma_setup
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-5-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <88d5a253-ef9e-c998-6353-5ba8680129f2@suse.de>
Date: Fri, 13 Sep 2019 15:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913122908.784-5-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0654562970=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0654562970==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nWOOOT7UOLyu1G0Q4r9rVJDsYE2LkmBbc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nWOOOT7UOLyu1G0Q4r9rVJDsYE2LkmBbc
Content-Type: multipart/mixed; boundary="P9JePctjIFAF8jCFKV4ivu5NZDLMTjGAk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Message-ID: <88d5a253-ef9e-c998-6353-5ba8680129f2@suse.de>
Subject: Re: [PATCH 4/8] drm/ttm: factor out ttm_bo_mmap_vma_setup
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-5-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-5-kraxel@redhat.com>

--P9JePctjIFAF8jCFKV4ivu5NZDLMTjGAk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.09.19 um 14:29 schrieb Gerd Hoffmann:
> Factor out ttm vma setup to a new function.  Reduces
> code duplication a bit and allows to implement
> &drm_gem_object_funcs.mmap in gem ttm helpers.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/ttm/ttm_bo_api.h    |  8 ++++++
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 47 ++++++++++++++++++---------------=

>  2 files changed, 33 insertions(+), 22 deletions(-)
>=20
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.=
h
> index 43c4929a2171..88c652f49602 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -734,6 +734,14 @@ int ttm_fbdev_mmap(struct vm_area_struct *vma, str=
uct ttm_buffer_object *bo);
>  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
>  		struct ttm_bo_device *bdev);
> =20
> +/**
> + * ttm_bo_mmap_vma_setup - initialize vma for ttm bo mmap
> + *
> + * @bo: The buffer object.
> + * @vma: vma as input from the mmap method.
> + */
> +void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_are=
a_struct *vma);
> +
>  void *ttm_kmap_atomic_prot(struct page *page, pgprot_t prot);
> =20
>  void ttm_kunmap_atomic_prot(void *addr, pgprot_t prot);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> index 4aa007edffb0..7c0e85c10e0e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -426,6 +426,29 @@ static struct ttm_buffer_object *ttm_bo_vm_lookup(=
struct ttm_bo_device *bdev,
>  	return bo;
>  }
> =20
> +void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_are=
a_struct *vma)
> +{
> +	vma->vm_ops =3D &ttm_bo_vm_ops;
> +
> +	/*
> +	 * Note: We're transferring the bo reference to
> +	 * vma->vm_private_data here.
> +	 */
> +
> +	vma->vm_private_data =3D bo;
> +
> +	/*
> +	 * We'd like to use VM_PFNMAP on shared mappings, where
> +	 * (vma->vm_flags & VM_SHARED) !=3D 0, for performance reasons,
> +	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
> +	 * bad for performance. Until that has been sorted out, use
> +	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
> +	 */
> +	vma->vm_flags |=3D VM_MIXEDMAP;
> +	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> +}
> +EXPORT_SYMBOL(ttm_bo_mmap_vma_setup);

To me, this function looks like an internal helper that should rather
remain internal. As mentioned in my reply to patch 5, maybe re-using
ttm_fbdev_mmap() could help.

Best regards
Thomas

> +
>  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
>  		struct ttm_bo_device *bdev)
>  {
> @@ -449,24 +472,7 @@ int ttm_bo_mmap(struct file *filp, struct vm_area_=
struct *vma,
>  	if (unlikely(ret !=3D 0))
>  		goto out_unref;
> =20
> -	vma->vm_ops =3D &ttm_bo_vm_ops;
> -
> -	/*
> -	 * Note: We're transferring the bo reference to
> -	 * vma->vm_private_data here.
> -	 */
> -
> -	vma->vm_private_data =3D bo;
> -
> -	/*
> -	 * We'd like to use VM_PFNMAP on shared mappings, where
> -	 * (vma->vm_flags & VM_SHARED) !=3D 0, for performance reasons,
> -	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
> -	 * bad for performance. Until that has been sorted out, use
> -	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
> -	 */
> -	vma->vm_flags |=3D VM_MIXEDMAP;
> -	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> +	ttm_bo_mmap_vma_setup(bo, vma);
>  	return 0;
>  out_unref:
>  	ttm_bo_put(bo);
> @@ -481,10 +487,7 @@ int ttm_fbdev_mmap(struct vm_area_struct *vma, str=
uct ttm_buffer_object *bo)
> =20
>  	ttm_bo_get(bo);
> =20
> -	vma->vm_ops =3D &ttm_bo_vm_ops;
> -	vma->vm_private_data =3D bo;
> -	vma->vm_flags |=3D VM_MIXEDMAP;
> -	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND;
> +	ttm_bo_mmap_vma_setup(bo, vma);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_fbdev_mmap);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--P9JePctjIFAF8jCFKV4ivu5NZDLMTjGAk--

--nWOOOT7UOLyu1G0Q4r9rVJDsYE2LkmBbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl17lB4ACgkQaA3BHVML
eiPPxgf+JQ9G3h4+YESWGhpDSwBbWmRWB9mEiB1dmn/XBI+8R6DaV7LQO87dZcJw
pBtIHQa27YA55oA6410wQKYyNUs8dDNuEcqSfcY8Uu4G/C7Ecle/sYreoOmCh0UT
Q7Zks4sKjlE0A5+3LMkXF7LsKPY1FitgomJ9DwnwFwFn8MF0OjAQpdZPJn9yRwsv
lsTURpBf7/6rmzrITDQylr8CzugyA5uCwmwnfLcMWZluHr35q5iIHpZ5O941kIdd
D0yVFxcUisj1qPVn5Zeqt0jkoC8DvpPUUjc/p7i4rgUkw8pK7MOhfWOa+OSMfPl0
wzxlhv8pa19b6SV9new86OgvexlVGA==
=y/Ql
-----END PGP SIGNATURE-----

--nWOOOT7UOLyu1G0Q4r9rVJDsYE2LkmBbc--

--===============0654562970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0654562970==--
