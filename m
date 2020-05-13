Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C237F1D1C10
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 19:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7156B6E185;
	Wed, 13 May 2020 17:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602C36E185
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 17:20:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC4DAAFC4;
 Wed, 13 May 2020 17:20:03 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/udl: Use GEM vmap/mmap function from SHMEM helpers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-3-tzimmermann@suse.de>
 <20200513154953.GL206103@phenom.ffwll.local>
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
Message-ID: <14e9a8da-0510-9d00-5d66-694672b5dd58@suse.de>
Date: Wed, 13 May 2020 19:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513154953.GL206103@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sam@ravnborg.org, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0138872975=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0138872975==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="b6kuJV3DwLXTnz9NAkRnFGymavaksxtN5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b6kuJV3DwLXTnz9NAkRnFGymavaksxtN5
Content-Type: multipart/mixed; boundary="WoCypHNkvxRnBzPzWP58NduTAE8rszXsA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sam@ravnborg.org, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Message-ID: <14e9a8da-0510-9d00-5d66-694672b5dd58@suse.de>
Subject: Re: [PATCH 2/2] drm/udl: Use GEM vmap/mmap function from SHMEM
 helpers
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-3-tzimmermann@suse.de>
 <20200513154953.GL206103@phenom.ffwll.local>
In-Reply-To: <20200513154953.GL206103@phenom.ffwll.local>

--WoCypHNkvxRnBzPzWP58NduTAE8rszXsA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Am 13.05.20 um 17:49 schrieb Daniel Vetter:
> On Wed, May 13, 2020 at 05:03:12PM +0200, Thomas Zimmermann wrote:
>> The udl driver contains an implementation of GEM vmap and mmap
>> operations that is identical to the common SHMEM helper; except
>> that udl's code does not support writecombine mappings.
>>
>> Convert udl to regular SHMEM helper functions. There's no reason
>> to have udl behave differently from all other SHMEM drivers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> So I remember the problem again I think ... on some x86 gpu drivers
> (*cough* i915 on specific chipsets) you get an uncached dma-buf.
>=20
> Which means if you set up a cached mapping, you get corruption.

With these patches, dma-buf imports get the writecombine mapping
unconditionally. I don't know if that is enough, but at least it's the
old behavior.

>=20
> But if the shmem helpers to correctly forward _all_ calls to the dma-bu=
f
> functions of the exporter, this works. I've tried to clean up that a bi=
t
> with my patch series that I just posted this week, to make sure there's=
 no
> bugs like that.
>=20
> I think once we have that fully sorted, we could land this and be happy=
=2E

Great. I'll take another look at your patch series tomorrow.

Best regards
Thomas

> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/udl/Makefile  |   2 +-
>>  drivers/gpu/drm/udl/udl_drv.c |   3 -
>>  drivers/gpu/drm/udl/udl_drv.h |   3 -
>>  drivers/gpu/drm/udl/udl_gem.c | 106 ---------------------------------=
-
>>  4 files changed, 1 insertion(+), 113 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/udl/udl_gem.c
>>
>> diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefi=
le
>> index b50179bb4de06..24d61f61d7db2 100644
>> --- a/drivers/gpu/drm/udl/Makefile
>> +++ b/drivers/gpu/drm/udl/Makefile
>> @@ -1,4 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>> -udl-y :=3D udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_tra=
nsfer.o udl_gem.o
>> +udl-y :=3D udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_tra=
nsfer.o
>> =20
>>  obj-$(CONFIG_DRM_UDL) :=3D udl.o
>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_d=
rv.c
>> index d1aa50fd6d65a..cf5b679bf58bb 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.c
>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>> @@ -37,9 +37,6 @@ DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>>  static struct drm_driver driver =3D {
>>  	.driver_features =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>> =20
>> -	/* gem hooks */
>> -	.gem_create_object =3D udl_driver_gem_create_object,
>> -
>>  	.fops =3D &udl_driver_fops,
>>  	DRM_GEM_SHMEM_DRIVER_OPS,
>> =20
>> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_d=
rv.h
>> index 2642f94a63fc8..b1461f30780bc 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.h
>> +++ b/drivers/gpu/drm/udl/udl_drv.h
>> @@ -81,9 +81,6 @@ int udl_render_hline(struct drm_device *dev, int log=
_bpp, struct urb **urb_ptr,
>>  		     const char *front, char **urb_buf_ptr,
>>  		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
>> =20
>> -struct drm_gem_object *udl_driver_gem_create_object(struct drm_device=
 *dev,
>> -						    size_t size);
>> -
>>  int udl_drop_usb(struct drm_device *dev);
>> =20
>>  #define CMD_WRITE_RAW8   "\xAF\x60" /**< 8 bit raw write command. */
>> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_g=
em.c
>> deleted file mode 100644
>> index b6e26f98aa0af..0000000000000
>> --- a/drivers/gpu/drm/udl/udl_gem.c
>> +++ /dev/null
>> @@ -1,106 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright (C) 2012 Red Hat
>> - */
>> -
>> -#include <linux/dma-buf.h>
>> -#include <linux/vmalloc.h>
>> -
>> -#include <drm/drm_drv.h>
>> -#include <drm/drm_gem_shmem_helper.h>
>> -#include <drm/drm_mode.h>
>> -#include <drm/drm_prime.h>
>> -
>> -#include "udl_drv.h"
>> -
>> -/*
>> - * GEM object funcs
>> - */
>> -
>> -static int udl_gem_object_mmap(struct drm_gem_object *obj,
>> -			       struct vm_area_struct *vma)
>> -{
>> -	int ret;
>> -
>> -	ret =3D drm_gem_shmem_mmap(obj, vma);
>> -	if (ret)
>> -		return ret;
>> -
>> -	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>> -	if (obj->import_attach)
>> -		vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
>> -	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>> -
>> -	return 0;
>> -}
>> -
>> -static void *udl_gem_object_vmap(struct drm_gem_object *obj)
>> -{
>> -	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
>> -	int ret;
>> -
>> -	ret =3D mutex_lock_interruptible(&shmem->vmap_lock);
>> -	if (ret)
>> -		return ERR_PTR(ret);
>> -
>> -	if (shmem->vmap_use_count++ > 0)
>> -		goto out;
>> -
>> -	ret =3D drm_gem_shmem_get_pages(shmem);
>> -	if (ret)
>> -		goto err_zero_use;
>> -
>> -	if (obj->import_attach)
>> -		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
>> -	else
>> -		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>> -				    VM_MAP, PAGE_KERNEL);
>> -
>> -	if (!shmem->vaddr) {
>> -		DRM_DEBUG_KMS("Failed to vmap pages\n");
>> -		ret =3D -ENOMEM;
>> -		goto err_put_pages;
>> -	}
>> -
>> -out:
>> -	mutex_unlock(&shmem->vmap_lock);
>> -	return shmem->vaddr;
>> -
>> -err_put_pages:
>> -	drm_gem_shmem_put_pages(shmem);
>> -err_zero_use:
>> -	shmem->vmap_use_count =3D 0;
>> -	mutex_unlock(&shmem->vmap_lock);
>> -	return ERR_PTR(ret);
>> -}
>> -
>> -static const struct drm_gem_object_funcs udl_gem_object_funcs =3D {
>> -	.free =3D drm_gem_shmem_free_object,
>> -	.print_info =3D drm_gem_shmem_print_info,
>> -	.pin =3D drm_gem_shmem_pin,
>> -	.unpin =3D drm_gem_shmem_unpin,
>> -	.get_sg_table =3D drm_gem_shmem_get_sg_table,
>> -	.vmap =3D udl_gem_object_vmap,
>> -	.vunmap =3D drm_gem_shmem_vunmap,
>> -	.mmap =3D udl_gem_object_mmap,
>> -};
>> -
>> -/*
>> - * Helpers for struct drm_driver
>> - */
>> -
>> -struct drm_gem_object *udl_driver_gem_create_object(struct drm_device=
 *dev,
>> -						    size_t size)
>> -{
>> -	struct drm_gem_shmem_object *shmem;
>> -	struct drm_gem_object *obj;
>> -
>> -	shmem =3D kzalloc(sizeof(*shmem), GFP_KERNEL);
>> -	if (!shmem)
>> -		return NULL;
>> -
>> -	obj =3D &shmem->base;
>> -	obj->funcs =3D &udl_gem_object_funcs;
>> -
>> -	return obj;
>> -}
>> --=20
>> 2.26.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WoCypHNkvxRnBzPzWP58NduTAE8rszXsA--

--b6kuJV3DwLXTnz9NAkRnFGymavaksxtN5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl68LDoACgkQaA3BHVML
eiN83wgAqHyh22VjGcGleH1Lu8m8lYKtwdTvYJQwAd0ZtX1ZPPqjH05nGKmPEPyN
LZrdUpkHJY0ddgpluqb9LjEKGgFcDTcYZKJpkcvV7jOtnJIyia9iYpsMCS9BqElR
1rNKnMT34hgm5liEAZfZVrQlg421IC+7gFoN0HZ/+SC7HjemhiYrgenVxUKV2q6r
gHtQh1OBsorTjpQ9hbufiOo5NweAASXJWP0R2wk3zsSzjZctmXJjzO9Npjox0K/7
ngaqQnCTbwNiUm+csHRll5B3CDV+C16PxEfSkGLi+57Lqe6FK6fOx9HySU7iWb5g
FS+1qCwFDHd3f34lmIaciBXuziuxKg==
=g8je
-----END PGP SIGNATURE-----

--b6kuJV3DwLXTnz9NAkRnFGymavaksxtN5--

--===============0138872975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0138872975==--
