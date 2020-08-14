Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC94B244515
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 08:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC046EB15;
	Fri, 14 Aug 2020 06:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A1E6EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:51:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE603AC3F;
 Fri, 14 Aug 2020 06:51:48 +0000 (UTC)
Subject: Re: [RFC][PATCH v2 0/4] Support GEM object mappings from I/O memory
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, emil.l.velikov@gmail.com,
 lyude@redhat.com, noralf@tronnes.org, zou_wei@huawei.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>
References: <20200806085239.4606-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b0e85fc4-9072-1063-e475-60ed6cf67144@suse.de>
Date: Fri, 14 Aug 2020 08:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806085239.4606-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1291482226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1291482226==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1SfZWYbr6S1mNm6Koa0nzgKDvCQmuoeD7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1SfZWYbr6S1mNm6Koa0nzgKDvCQmuoeD7
Content-Type: multipart/mixed; boundary="aGSK0ED52tjjv0rTELqo9kbPXyG0trPFo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, emil.l.velikov@gmail.com,
 lyude@redhat.com, noralf@tronnes.org, zou_wei@huawei.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <b0e85fc4-9072-1063-e475-60ed6cf67144@suse.de>
Subject: Re: [RFC][PATCH v2 0/4] Support GEM object mappings from I/O memory
References: <20200806085239.4606-1-tzimmermann@suse.de>
In-Reply-To: <20200806085239.4606-1-tzimmermann@suse.de>

--aGSK0ED52tjjv0rTELqo9kbPXyG0trPFo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

cc'ing TTM maintainers for comments. We might want to use the I/O
pointer structure with TTM at some point.

Am 06.08.20 um 10:52 schrieb Thomas Zimmermann:
> DRM's fbdev console uses regular load and store operations to update
> framebuffer memory. The bochs driver on sparc64 requires the use of
> I/O-specific load and store operations. We have a workaround, but need
> a long-term solution to the problem. Previous attempts to resolve the
> issue returned an extra is_iomem flag from vmap(), or added a separate
> vmap_iomem() callback to GEM objects.
>=20
> This patchset is yet another iteration with a different idea. Instead
> of a raw pointer, vmap() interfaces now return a structure that contain=
s
> the buffer address in system or I/O memory, plus a flag that signals
> which location the address is in.
>=20
> Patch #1 updates the vboxvideo driver to match the latest VRAM helpers.=

> This simplifies the other patches and should be merged in any case.
>=20
> Patch #2 adds struct drm_gem_membuf, which contains the pointer and fla=
g,
> and converts the generic GEM interfaces to use it.
>=20
> Patch #3 converts vmap/vunmap in GEM object functions and updates most
> GEM backends. A few drivers are still missing, but the patch should be
> acceptable for an RFC.
>=20
> Patch #4 changes fbdev helpers to access framebuffer memory either with=

> system or I/O memcpy functions.
>=20
> Thomas Zimmermann (4):
>   drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
>   drm/gem: Update client API to use struct drm_gem_membuf
>   drm/gem: Use struct drm_gem_membuf in vmap op and convert GEM backend=
s
>   drm/fb_helper: Access framebuffer as I/O memory, if required
>=20
>  drivers/gpu/drm/ast/ast_cursor.c       |  29 ++-
>  drivers/gpu/drm/ast/ast_drv.h          |   2 +-
>  drivers/gpu/drm/bochs/bochs_kms.c      |   1 -
>  drivers/gpu/drm/drm_client.c           |  25 ++-
>  drivers/gpu/drm/drm_fb_helper.c        | 246 ++++++++++++++++++++++---=

>  drivers/gpu/drm/drm_gem.c              |  28 +--
>  drivers/gpu/drm/drm_gem_cma_helper.c   |  15 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c |  31 ++--
>  drivers/gpu/drm/drm_gem_vram_helper.c  | 142 +++++---------
>  drivers/gpu/drm/drm_internal.h         |   5 +-
>  drivers/gpu/drm/drm_prime.c            |  16 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c |  11 +-
>  drivers/gpu/drm/qxl/qxl_display.c      |  12 +-
>  drivers/gpu/drm/qxl/qxl_draw.c         |  14 +-
>  drivers/gpu/drm/qxl/qxl_drv.h          |   6 +-
>  drivers/gpu/drm/qxl/qxl_object.c       |  19 +-
>  drivers/gpu/drm/qxl/qxl_object.h       |   2 +-
>  drivers/gpu/drm/qxl/qxl_prime.c        |  12 +-
>  drivers/gpu/drm/tiny/cirrus.c          |  15 +-
>  drivers/gpu/drm/tiny/gm12u320.c        |  12 +-
>  drivers/gpu/drm/udl/udl_modeset.c      |  10 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c  |  17 +-
>  include/drm/drm_client.h               |   7 +-
>  include/drm/drm_device.h               |  26 +++
>  include/drm/drm_gem.h                  |   5 +-
>  include/drm/drm_gem_cma_helper.h       |   4 +-
>  include/drm/drm_gem_shmem_helper.h     |   4 +-
>  include/drm/drm_gem_vram_helper.h      |   9 +-
>  include/drm/drm_mode_config.h          |  12 --
>  29 files changed, 464 insertions(+), 273 deletions(-)
>=20
> --
> 2.28.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aGSK0ED52tjjv0rTELqo9kbPXyG0trPFo--

--1SfZWYbr6S1mNm6Koa0nzgKDvCQmuoeD7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl82NG0UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPa9Af/XPcPivt0OXvcuJUeq6YUEhfljw8A
noOlyk4e7ziTfCxUKhN+4apan/7cl6BfoWEArln3CikTSjAbzrzaoZP9AD+EI+zw
0NUTD0etN30Uc/u6/4jvPJGxXpRTSuGvhSc0J0ATWkIZJdTfHj3IN3l1Q/MypStG
23ZBgsIunRtPYeDZpt30lNS2nZpz0HagBtVylq0rnC2zYdfU6crz7JxlzCl2i/dy
LbPPo+f1NqleU4wD8xbwIGL5J9y4K222omh0xV0ofwzH4B4kClOoRZpxktzPQUzA
MTsWiYMsfY7zej43gT0PZ4+BLBKqplW+cIlhj3K6Kj6zCHwJKdE8Ufmr9g==
=/hOF
-----END PGP SIGNATURE-----

--1SfZWYbr6S1mNm6Koa0nzgKDvCQmuoeD7--

--===============1291482226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1291482226==--
