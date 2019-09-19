Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62EB785F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 13:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37446FB44;
	Thu, 19 Sep 2019 11:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9036FB04
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 11:23:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9426B077;
 Thu, 19 Sep 2019 11:23:34 +0000 (UTC)
Subject: Re: [PATCH v3 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190919100223.13309-1-kraxel@redhat.com>
 <20190919100223.13309-7-kraxel@redhat.com>
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
Message-ID: <884df31e-7c53-bf64-80b3-08bcb2e99540@suse.de>
Date: Thu, 19 Sep 2019 13:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919100223.13309-7-kraxel@redhat.com>
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
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0488487404=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0488487404==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uQk2DwosS2wZUX0QjolrnVXilHe4z3Tid"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uQk2DwosS2wZUX0QjolrnVXilHe4z3Tid
Content-Type: multipart/mixed; boundary="Grr8gef2mKDnC4KQjIw0yMOpTY4I0J5YX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <884df31e-7c53-bf64-80b3-08bcb2e99540@suse.de>
Subject: Re: [PATCH v3 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
References: <20190919100223.13309-1-kraxel@redhat.com>
 <20190919100223.13309-7-kraxel@redhat.com>
In-Reply-To: <20190919100223.13309-7-kraxel@redhat.com>

--Grr8gef2mKDnC4KQjIw0yMOpTY4I0J5YX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.09.19 um 12:02 schrieb Gerd Hoffmann:
> Factor out ttm vma setup to a new function.
> Reduces code duplication a bit.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 46 +++++++++++++++++----------------=

>  1 file changed, 24 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> index 4aa007edffb0..b5314ef85a3d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -426,6 +426,28 @@ static struct ttm_buffer_object *ttm_bo_vm_lookup(=
struct ttm_bo_device *bdev,
>  	return bo;
>  }
> =20
> +void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_are=
a_struct *vma)

Internal helper, therefore 'static'.

Best regards
Thomas

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
> +
>  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
>  		struct ttm_bo_device *bdev)
>  {
> @@ -449,24 +471,7 @@ int ttm_bo_mmap(struct file *filp, struct vm_area_=
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
> @@ -481,10 +486,7 @@ int ttm_fbdev_mmap(struct vm_area_struct *vma, str=
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


--Grr8gef2mKDnC4KQjIw0yMOpTY4I0J5YX--

--uQk2DwosS2wZUX0QjolrnVXilHe4z3Tid
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2DZTUACgkQaA3BHVML
eiO2WAf/XcLbdOQw1iqyQGrloWaI1L+qgEa2p8Ub3/12XdLmXqFCjbLW3664EPQK
NZlyHgu8TGIlbu+f0ujHdb6en1N0BygnCCgCKWZxDQd4FlE70f0yn7wwNI0UkSC4
h9aDTvXz28KlhbTfV2na7DaX/z9RTh5M/t/QfK30noo2n7CC/pSQSnDB8j5BE6Ja
Red9zy2Na2unDNjiWF8+vuprept8vHemVkAS9Vslov/hZ9xTvQKKqJhaBO2yc9uM
d08EwwQ/3SwtjnJOy0riGWm9MrMjgtIpmkpg/iNyXPcQZJju9NuBkWzh5d4U+CZv
sU8ADfZSu0hwKRsz1xHHEiRZlpfa1g==
=T7cB
-----END PGP SIGNATURE-----

--uQk2DwosS2wZUX0QjolrnVXilHe4z3Tid--

--===============0488487404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0488487404==--
