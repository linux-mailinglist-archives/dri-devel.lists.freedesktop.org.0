Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F691D3510
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172EC6EB72;
	Thu, 14 May 2020 15:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2F06EB64
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:28:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B537AC24;
 Thu, 14 May 2020 15:28:02 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
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
Message-ID: <e08f5784-109e-326a-1426-529ff7041e0e@suse.de>
Date: Thu, 14 May 2020 17:27:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514124050.GV206103@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0968950546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0968950546==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DMPzOU1gQcbJxCR27oI0RiGy4OIx9EYOh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DMPzOU1gQcbJxCR27oI0RiGy4OIx9EYOh
Content-Type: multipart/mixed; boundary="dv0w86oiplSFBWMG4z8dNRsQVt7SlgtRR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sam@ravnborg.org, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Message-ID: <e08f5784-109e-326a-1426-529ff7041e0e@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
In-Reply-To: <20200514124050.GV206103@phenom.ffwll.local>

--dv0w86oiplSFBWMG4z8dNRsQVt7SlgtRR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.05.20 um 14:40 schrieb Daniel Vetter:
> On Wed, May 13, 2020 at 05:03:11PM +0200, Thomas Zimmermann wrote:
>> SHMEM-buffer backing storage is allocated from system memory; which is=

>> typically cachable. Currently, only virtio uses cachable mappings; udl=

>> uses its own vmap/mmap implementation for cachable mappings. Other
>> drivers default to writecombine mappings.
>=20
> I'm pretty sure this breaks all these drivers. quick grep on a few
> functions says this is used by lima, panfrost, v3d. And they definitely=

> need uncached/wc stuff afaiui. Or I'm completely missing something?

OK, I better get some testing for this code. :D

> -Daniel
>=20
>>
>> Use cached mappings by default. The exception is pages imported via
>> dma-buf. DMA memory is usually not cached.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 6 ++++--
>>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 -
>>  include/drm/drm_gem_shmem_helper.h      | 4 ++--
>>  3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/=
drm_gem_shmem_helper.c
>> index df31e5782eed1..1ce90325dfa31 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -259,7 +259,7 @@ static void *drm_gem_shmem_vmap_locked(struct drm_=
gem_shmem_object *shmem)
>>  	} else {
>>  		pgprot_t prot =3D PAGE_KERNEL;
>> =20
>> -		if (!shmem->map_cached)
>> +		if (shmem->map_wc)
>>  			prot =3D pgprot_writecombine(prot);
>>  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>>  				    VM_MAP, prot);
>> @@ -546,7 +546,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj,=
 struct vm_area_struct *vma)
>> =20
>>  	vma->vm_flags |=3D VM_MIXEDMAP | VM_DONTEXPAND;
>>  	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>> -	if (!shmem->map_cached)
>> +	if (shmem->map_wc)
>>  		vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
>>  	vma->vm_ops =3D &drm_gem_shmem_vm_ops;
>> =20
>> @@ -664,6 +664,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_dev=
ice *dev,
>>  	if (IS_ERR(shmem))
>>  		return ERR_CAST(shmem);
>> =20
>> +	shmem->map_wc =3D false; /* dma-buf mappings use writecombine */
>> +
>>  	shmem->pages =3D kvmalloc_array(npages, sizeof(struct page *), GFP_K=
ERNEL);
>>  	if (!shmem->pages) {
>>  		ret =3D -ENOMEM;
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm=
/virtio/virtgpu_object.c
>> index 6ccbd01cd888c..80ba6b2b61668 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
>> @@ -132,7 +132,6 @@ struct drm_gem_object *virtio_gpu_create_object(st=
ruct drm_device *dev,
>> =20
>>  	dshmem =3D &shmem->base.base;
>>  	dshmem->base.funcs =3D &virtio_gpu_shmem_funcs;
>> -	dshmem->map_cached =3D true;
>>  	return &dshmem->base;
>>  }
>> =20
>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_=
shmem_helper.h
>> index 294b2931c4cc0..a5bc082a77c48 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -98,9 +98,9 @@ struct drm_gem_shmem_object {
>>  	unsigned int vmap_use_count;
>> =20
>>  	/**
>> -	 * @map_cached: map object cached (instead of using writecombine).
>> +	 * @map_wc: map object using writecombine (instead of cached).
>>  	 */
>> -	bool map_cached;
>> +	bool map_wc;
>>  };
>> =20
>>  #define to_drm_gem_shmem_obj(obj) \
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


--dv0w86oiplSFBWMG4z8dNRsQVt7SlgtRR--

--DMPzOU1gQcbJxCR27oI0RiGy4OIx9EYOh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl69Y34ACgkQaA3BHVML
eiPVIggAtY96nRYU3YQmoxGp0GoukBPwGguxCXmJII4T5bZYD3WQ4tJx0C5eEOZu
C6ubWzi6zoO+A34VVzRYBNn+1YqpKXxJhXDfOfHs6GE3Bdi2P+rfYYtV02JgGXcP
VFFpJQdjp88Us1xQO1k86CCAYU97sg6nHgzrCZjwXLayUiqDMsMO0ELhjzbs8/Yt
Slu6wgPESYFtVOlHsTkg1N5jp3JKthKsIbhxHZqlNWbRgA7Th0aXVHJZ5xEozygT
q39xABEGYoWYOouTDXxe7vi8Hv78/w2RW4MOAKpbKKHfi6Ja6/3xBfg8b07FJJgG
98BlDP5PwK1k+lca6HKCZC4Y71ho2Q==
=hQj0
-----END PGP SIGNATURE-----

--DMPzOU1gQcbJxCR27oI0RiGy4OIx9EYOh--

--===============0968950546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0968950546==--
