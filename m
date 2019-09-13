Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C983B1E4D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022066F3A6;
	Fri, 13 Sep 2019 13:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6746F3A6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:10:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C784AF77;
 Fri, 13 Sep 2019 13:10:03 +0000 (UTC)
Subject: Re: [PATCH 6/8] drm/vram: switch vram helper to
 &drm_gem_object_funcs.mmap()
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-7-kraxel@redhat.com>
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
Message-ID: <dba5d37c-b1d8-4e25-778e-834eab56ac22@suse.de>
Date: Fri, 13 Sep 2019 15:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913122908.784-7-kraxel@redhat.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0196603901=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0196603901==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RmsZZWSXavej7oVe5ush19wY9mOx8b3S7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RmsZZWSXavej7oVe5ush19wY9mOx8b3S7
Content-Type: multipart/mixed; boundary="PJnqTNeeviakBB93394pK2IBJaf2SDsO7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <dba5d37c-b1d8-4e25-778e-834eab56ac22@suse.de>
Subject: Re: [PATCH 6/8] drm/vram: switch vram helper to
 &drm_gem_object_funcs.mmap()
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-7-kraxel@redhat.com>
In-Reply-To: <20190913122908.784-7-kraxel@redhat.com>

--PJnqTNeeviakBB93394pK2IBJaf2SDsO7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.09.19 um 14:29 schrieb Gerd Hoffmann:
> Wire up the new drm_gem_ttm_mmap() helper function,
> use generic drm_gem_mmap for &fops.mmap and
> delete dead drm_vram_mm_file_operations_mmap().
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  include/drm/drm_gem_vram_helper.h     |  9 +------
>  drivers/gpu/drm/drm_gem_vram_helper.c | 34 +--------------------------=

>  2 files changed, 2 insertions(+), 41 deletions(-)
>=20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 9aaef4f8c327..9d5526650291 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -180,13 +180,6 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
>  	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
>  void drm_vram_helper_release_mm(struct drm_device *dev);
> =20
> -/*
> - * Helpers for &struct file_operations
> - */
> -
> -int drm_vram_mm_file_operations_mmap(
> -	struct file *filp, struct vm_area_struct *vma);
> -
>  /**
>   * define DRM_VRAM_MM_FILE_OPERATIONS - default callback functions for=
 \
>  	&struct file_operations
> @@ -200,7 +193,7 @@ int drm_vram_mm_file_operations_mmap(
>  	.poll		=3D drm_poll, \
>  	.unlocked_ioctl =3D drm_ioctl, \
>  	.compat_ioctl	=3D drm_compat_ioctl, \
> -	.mmap		=3D drm_vram_mm_file_operations_mmap, \
> +	.mmap		=3D drm_gem_mmap, \
>  	.open		=3D drm_open, \
>  	.release	=3D drm_release \
> =20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 7bee80c6b6e8..e100b97ea6e3 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -681,6 +681,7 @@ static const struct drm_gem_object_funcs drm_gem_vr=
am_object_funcs =3D {
>  	.unpin	=3D drm_gem_vram_object_unpin,
>  	.vmap	=3D drm_gem_vram_object_vmap,
>  	.vunmap	=3D drm_gem_vram_object_vunmap,
> +	.mmap   =3D drm_gem_ttm_mmap,
>  	.print_info =3D drm_gem_ttm_print_info,
>  };
> =20
> @@ -915,12 +916,6 @@ static void drm_vram_mm_cleanup(struct drm_vram_mm=
 *vmm)
>  	ttm_bo_device_release(&vmm->bdev);
>  }
> =20
> -static int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *=
vma,
> -			    struct drm_vram_mm *vmm)
> -{
> -	return ttm_bo_mmap(filp, vma, &vmm->bdev);
> -}
> -
>  /*
>   * Helpers for integration with struct drm_device
>   */
> @@ -976,30 +971,3 @@ void drm_vram_helper_release_mm(struct drm_device =
*dev)
>  	dev->vram_mm =3D NULL;
>  }
>  EXPORT_SYMBOL(drm_vram_helper_release_mm);
> -
> -/*
> - * Helpers for &struct file_operations
> - */
> -
> -/**
> - * drm_vram_mm_file_operations_mmap() - \
> -	Implements &struct file_operations.mmap()
> - * @filp:	the mapping's file structure
> - * @vma:	the mapping's memory area
> - *
> - * Returns:
> - * 0 on success, or
> - * a negative error code otherwise.
> - */
> -int drm_vram_mm_file_operations_mmap(
> -	struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_file *file_priv =3D filp->private_data;
> -	struct drm_device *dev =3D file_priv->minor->dev;
> -
> -	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
> -		return -EINVAL;
> -
> -	return drm_vram_mm_mmap(filp, vma, dev->vram_mm);
> -}
> -EXPORT_SYMBOL(drm_vram_mm_file_operations_mmap);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--PJnqTNeeviakBB93394pK2IBJaf2SDsO7--

--RmsZZWSXavej7oVe5ush19wY9mOx8b3S7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl17lSoACgkQaA3BHVML
eiMlnAgAuxM3198AW62WoPQh/tnCpRgXAfVVr139GaUue632fn62jXkyNkqemGss
0k+tOeN7cUqQvZJAnG1nY6dlsRYznmhRBTVeJpKngf/faFDuX8Ndj73KmQ5/JBCU
UT9lWo7d5XlVOkdsF7Pm7U/haEwYi7HHe6yFdFGDN8P2t4CoCosFGLNqw41mdTlv
JBrGg+kJbfPYDx/0uKHSO8r5nnwyUKTgAp3sDa3LmwG/wC232x4WHFk7ccDWmCph
E4qO6KVnXFAWqKZfccnhNGHx1el5aKPBzxEoms/Gr8R2VCF0cNTj2bu4ETwfuDV+
zUbPrHqLGjwVT+Kf2u3oYUt8Pdvmmg==
=hVky
-----END PGP SIGNATURE-----

--RmsZZWSXavej7oVe5ush19wY9mOx8b3S7--

--===============0196603901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0196603901==--
