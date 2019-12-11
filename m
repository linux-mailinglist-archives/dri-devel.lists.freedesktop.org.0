Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696F911A89B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 11:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED276E190;
	Wed, 11 Dec 2019 10:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164BC6E190
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:07:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3A02AD75;
 Wed, 11 Dec 2019 10:07:29 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] drm/shmem: add support for per object caching
 attributes
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20191211081810.20079-1-kraxel@redhat.com>
 <20191211081810.20079-2-kraxel@redhat.com>
 <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>
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
Message-ID: <ed9142da-ce10-7df2-8a85-ba9ad0c26551@suse.de>
Date: Wed, 11 Dec 2019 11:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 gurchetansingh@chromium.org
Content-Type: multipart/mixed; boundary="===============1644932129=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1644932129==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="r8TvLUVhGQQ8aTEs6Xg8KLXS7KMPkSUSl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--r8TvLUVhGQQ8aTEs6Xg8KLXS7KMPkSUSl
Content-Type: multipart/mixed; boundary="PWptc28KfncWqAB1I31NMJorptpyGRJEF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>, gurchetansingh@chromium.org
Message-ID: <ed9142da-ce10-7df2-8a85-ba9ad0c26551@suse.de>
Subject: Re: [PATCH v2 1/2] drm/shmem: add support for per object caching
 attributes
References: <20191211081810.20079-1-kraxel@redhat.com>
 <20191211081810.20079-2-kraxel@redhat.com>
 <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>
In-Reply-To: <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>

--PWptc28KfncWqAB1I31NMJorptpyGRJEF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 11.12.19 um 10:58 schrieb Thomas Zimmermann:
> Hi Gerd
>=20
> Am 11.12.19 um 09:18 schrieb Gerd Hoffmann:
>> Add caching field to drm_gem_shmem_object to specify the cachine
>> attributes for mappings.  Add helper function to tweak pgprot
>> accordingly.  Switch vmap and mmap functions to the new helper.
>>
>> Set caching to write-combine when creating the object so behavior
>> doesn't change by default.  Drivers can override that later if
>> needed.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>=20
> If you want to merge this patch, you have my
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Please see my comment below.
>=20
>> ---
>>  include/drm/drm_gem_shmem_helper.h     | 12 ++++++++++++
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 24 +++++++++++++++++++++---
>>  2 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_=
shmem_helper.h
>> index 6748379a0b44..9d6e02c6205f 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -17,6 +17,11 @@ struct drm_mode_create_dumb;
>>  struct drm_printer;
>>  struct sg_table;
>> =20
>> +enum drm_gem_shmem_caching {
>> +	DRM_GEM_SHMEM_CACHED =3D 1,
>> +	DRM_GEM_SHMEM_WC,
>> +};
>> +
>>  /**
>>   * struct drm_gem_shmem_object - GEM object backed by shmem
>>   */
>> @@ -83,6 +88,11 @@ struct drm_gem_shmem_object {
>>  	 * The address are un-mapped when the count reaches zero.
>>  	 */
>>  	unsigned int vmap_use_count;
>> +
>> +	/**
>> +	 * @caching: caching attributes for mappings.
>> +	 */
>> +	enum drm_gem_shmem_caching caching;
>>  };
>> =20
>>  #define to_drm_gem_shmem_obj(obj) \
>> @@ -130,6 +140,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_dev=
ice *dev,
>> =20
>>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *o=
bj);
>> =20
>> +pgprot_t drm_gem_shmem_caching(struct drm_gem_shmem_object *shmem, pg=
prot_t prot);
>> +
>>  /**
>>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>>   *
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/=
drm_gem_shmem_helper.c
>> index a421a2eed48a..5bb94e130a50 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -76,6 +76,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
>>  	mutex_init(&shmem->pages_lock);
>>  	mutex_init(&shmem->vmap_lock);
>>  	INIT_LIST_HEAD(&shmem->madv_list);
>> +	shmem->caching =3D DRM_GEM_SHMEM_WC;
>> =20
>>  	/*
>>  	 * Our buffers are kept pinned, so allocating them
>> @@ -256,9 +257,11 @@ static void *drm_gem_shmem_vmap_locked(struct drm=
_gem_shmem_object *shmem)
>> =20
>>  	if (obj->import_attach)
>>  		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
>> -	else
>> +	else {
>> +		pgprot_t prot =3D drm_gem_shmem_caching(shmem, PAGE_KERNEL);
>>  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>> -				    VM_MAP, pgprot_writecombine(PAGE_KERNEL));
>> +				    VM_MAP, prot);
>> +	}
>> =20
>>  	if (!shmem->vaddr) {
>>  		DRM_DEBUG_KMS("Failed to vmap pages\n");
>> @@ -540,7 +543,8 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj,=
 struct vm_area_struct *vma)
>>  	}
>> =20
>>  	vma->vm_flags |=3D VM_MIXEDMAP | VM_DONTEXPAND;
>> -	vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_f=
lags));
>> +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>> +	vma->vm_page_prot =3D drm_gem_shmem_caching(shmem, vma->vm_page_prot=
);
>>  	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>>  	vma->vm_ops =3D &drm_gem_shmem_vm_ops;
>> =20
>> @@ -683,3 +687,17 @@ drm_gem_shmem_prime_import_sg_table(struct drm_de=
vice *dev,
>>  	return ERR_PTR(ret);
>>  }
>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>> +
>> +pgprot_t drm_gem_shmem_caching(struct drm_gem_shmem_object *shmem, pg=
prot_t prot)
>> +{
>> +	switch (shmem->caching) {
>> +	case DRM_GEM_SHMEM_CACHED:
>> +		return prot;
>> +	case DRM_GEM_SHMEM_WC:
>> +		return pgprot_writecombine(prot);
>> +	default:
>> +		WARN_ON_ONCE(1);
>> +		return prot;
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_caching);
>=20
> Two reason why I'd reconsider this design.
>=20
> I don't like switch statements new the bottom of the call graph. The
> code ends up with default warnings, such as this one.
>=20
> Udl has different caching flags for imported and 'native' buffers. This=

> would require a new constant and additional code here.
>=20
> What do you think about turning this function into a callback in struct=

> shmem_funcs? The default implementation would be for WC, virtio would
> use CACHED. The individual implementations could still be located in th=
e
> shmem code. Udl would later provide its own code.

On a second thought, all this might be over-engineered and v1 of the
patchset was the correct approach. You can add my

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

if you prefer to merge v1.

>=20
> Best regards
> Thomas
>=20
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PWptc28KfncWqAB1I31NMJorptpyGRJEF--

--r8TvLUVhGQQ8aTEs6Xg8KLXS7KMPkSUSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3wv90ACgkQaA3BHVML
eiO64Qf/YBbsWDQuJn4oSmZ4mtNOipUzxozbGDzsimdp95A//zGbwtYuSiAsEaom
gqnUWkfh4aZ6eDwixlNmyUwZa7duLQ6Nw5QmA36BCyzhHdjoUoNt22gggKMHP6Jv
ODbtVVpOkdMpNo9MrrxKI0zwiaZFFPEbNLH1Dg6B2JcwLupSAJs4C9JITQ3vqgct
fQsNDJqQtQk5ylIh7J4qiC9/zvt0wsfQhHFTc0YkeHv24ejvi3o37dXe2vmGKMjM
xzILi2sG6pRPzJPx/LxkU4hcYUSAd9C9gKlkLSt2ncae+3Vh9fQajphP/1sZv+0z
eXjXG/FPxleeSVzZenwW4dE0rgiJhQ==
=ZM7a
-----END PGP SIGNATURE-----

--r8TvLUVhGQQ8aTEs6Xg8KLXS7KMPkSUSl--

--===============1644932129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1644932129==--
