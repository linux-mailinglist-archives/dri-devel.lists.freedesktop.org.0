Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBF9CBDF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 10:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B362A89E15;
	Mon, 26 Aug 2019 08:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B3789E15
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 08:47:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C50EB011;
 Mon, 26 Aug 2019 08:47:11 +0000 (UTC)
Subject: Re: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190808134417.10610-1-kraxel@redhat.com>
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
Message-ID: <510b8714-2b9a-ee1d-3b03-f2704c69637e@suse.de>
Date: Mon, 26 Aug 2019 10:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0386008183=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0386008183==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dCCLT0uunhC92DmZKJGbc4To3YrmuoTcW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dCCLT0uunhC92DmZKJGbc4To3YrmuoTcW
Content-Type: multipart/mixed; boundary="xS3zMFV52pMdiTzP62jhF1mYjjf3kavbP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Message-ID: <510b8714-2b9a-ee1d-3b03-f2704c69637e@suse.de>
Subject: Re: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
References: <20190808134417.10610-1-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>

--xS3zMFV52pMdiTzP62jhF1mYjjf3kavbP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I would have liked to get some context on the purpose of GEM TTM
helpers. Is is just share-able code?

=46rom my understanding VRAM helpers _are_ GEM TTM helpers. And they wher=
e
re-named to VRAM helpers, so that the naming is independent from the
implementation (and vice versa).

Wrt qxl, would it be possible to convert the driver over to VRAM helpers
entirely? I noticed a memory region named PRIV. Could we add this to
VRAM helpers?

Best regards
Thomas


Am 08.08.19 um 15:44 schrieb Gerd Hoffmann:
>=20
>=20
> Gerd Hoffmann (17):
>   drm/ttm: turn ttm_bo_device.vma_manager into a pointer
>   drm/ttm: add gem_ttm_bo_device_init()
>   drm/vram: switch vram helpers to the new gem_ttm_bo_device_init()
>   drm/qxl: switch qxl to the new gem_ttm_bo_device_init()
>   drm: add mmap() to drm_gem_object_funcs
>   drm/shmem: switch shmem helper to drm_gem_object_funcs->mmap
>   drm/shmem: drop DEFINE_DRM_GEM_SHMEM_FOPS
>   drm/ttm: factor out ttm_bo_mmap_vma_setup
>   drm/ttm: add drm_gem_ttm_mmap()
>   drm/vram: switch vram helper to drm_gem_object_funcs->mmap codepath
>   drm/vram: drop verify_access
>   drm: drop DRM_VRAM_MM_FILE_OPERATIONS
>   drm/qxl: use drm_gem_object_funcs
>   drm/qxl: drop qxl_ttm_fault
>   drm/qxl: switch qxl to drm_gem_object_funcs->mmap codepath
>   drm/qxl: drop verify_access
>   drm/qxl: use DEFINE_DRM_GEM_FOPS()
>=20
>  drivers/gpu/drm/qxl/qxl_drv.h                 |  5 +-
>  drivers/gpu/drm/qxl/qxl_object.h              |  5 --
>  include/drm/drm_gem.h                         |  9 +++
>  include/drm/drm_gem_shmem_helper.h            | 28 +--------
>  include/drm/drm_gem_ttm_helper.h              | 32 ++++++++++
>  include/drm/drm_gem_vram_helper.h             |  9 +--
>  include/drm/drm_vram_mm_helper.h              | 27 ---------
>  include/drm/ttm/ttm_bo_api.h                  |  8 +++
>  include/drm/ttm/ttm_bo_driver.h               | 11 +++-
>  drivers/gpu/drm/ast/ast_drv.c                 |  5 +-
>  drivers/gpu/drm/bochs/bochs_drv.c             |  5 +-
>  drivers/gpu/drm/cirrus/cirrus.c               |  2 +-
>  drivers/gpu/drm/drm_gem.c                     |  6 ++
>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 18 +++---
>  drivers/gpu/drm/drm_gem_ttm_helper.c          | 47 +++++++++++++++
>  drivers/gpu/drm/drm_gem_vram_helper.c         | 53 +----------------
>  drivers/gpu/drm/drm_vram_mm_helper.c          | 44 +-------------
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  6 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c         |  5 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  1 +
>  drivers/gpu/drm/qxl/qxl_drv.c                 | 19 +-----
>  drivers/gpu/drm/qxl/qxl_dumb.c                | 17 ------
>  drivers/gpu/drm/qxl/qxl_ioctl.c               |  5 +-
>  drivers/gpu/drm/qxl/qxl_object.c              | 13 +++++
>  drivers/gpu/drm/qxl/qxl_ttm.c                 | 58 ++-----------------=

>  drivers/gpu/drm/ttm/ttm_bo.c                  | 29 +++++++---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c               | 53 +++++++++--------
>  drivers/gpu/drm/v3d/v3d_bo.c                  |  1 +
>  drivers/gpu/drm/v3d/v3d_drv.c                 |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          |  5 +-
>  Documentation/gpu/drm-mm.rst                  | 12 ++++
>  drivers/gpu/drm/Kconfig                       |  8 +++
>  drivers/gpu/drm/Makefile                      |  3 +
>  drivers/gpu/drm/qxl/Kconfig                   |  1 +
>  35 files changed, 231 insertions(+), 323 deletions(-)
>  create mode 100644 include/drm/drm_gem_ttm_helper.h
>  create mode 100644 drivers/gpu/drm/drm_gem_ttm_helper.c
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--xS3zMFV52pMdiTzP62jhF1mYjjf3kavbP--

--dCCLT0uunhC92DmZKJGbc4To3YrmuoTcW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1jnIsACgkQaA3BHVML
eiOgdwgAkBljP67t0BH2d5L5nvnwoYYLEq/zEGKi9aBiR5LwSf3WJfSTsz4wcpeI
ywxiFGk3JKZtkcfFaGm/3JsQHWEjsBSnApuH0E6pPWy85K7vCGd1poPYtrkR91AS
yuQGr2zNyllh8LOO5errXnZQGuYtMLQlC/46DUWJFSks428JlMOcY7TUV20eMo/X
PGYbBBt4ZtaZv8f85NR0HzqVQk2pPJY+5CELdcrcpDr8wPZ6+YWIGkIT1FfgR2TW
Sv1N0icy9QW85gau/G4rbRTpD08e7kdCViJtAuAIH0AD66uOEAzE/uT+LizFLJxD
pBk7yiijQfRSJ+SUVfx15yGZyL/zsA==
=0z4A
-----END PGP SIGNATURE-----

--dCCLT0uunhC92DmZKJGbc4To3YrmuoTcW--

--===============0386008183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0386008183==--
