Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC811ABF0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 14:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BF26E15D;
	Wed, 11 Dec 2019 13:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AA76EAFE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:21:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E584ABF6;
 Wed, 11 Dec 2019 13:21:14 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] drm: add pgprot callback to drm_gem_object_funcs
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20191211121957.18637-1-kraxel@redhat.com>
 <20191211121957.18637-2-kraxel@redhat.com>
 <20191211123835.GZ624164@phenom.ffwll.local>
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
Message-ID: <226bad4b-09db-4c89-0611-d3c89e3628cd@suse.de>
Date: Wed, 11 Dec 2019 14:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191211123835.GZ624164@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============2128181413=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2128181413==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8rsNep00E8ys0bAoSOGO4rfAQ3Hgi85R2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8rsNep00E8ys0bAoSOGO4rfAQ3Hgi85R2
Content-Type: multipart/mixed; boundary="ZpRogva5wQ0Ag0bvgxTv8YttlUxQqsu2m";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <226bad4b-09db-4c89-0611-d3c89e3628cd@suse.de>
Subject: Re: [PATCH v3 1/4] drm: add pgprot callback to drm_gem_object_funcs
References: <20191211121957.18637-1-kraxel@redhat.com>
 <20191211121957.18637-2-kraxel@redhat.com>
 <20191211123835.GZ624164@phenom.ffwll.local>
In-Reply-To: <20191211123835.GZ624164@phenom.ffwll.local>

--ZpRogva5wQ0Ag0bvgxTv8YttlUxQqsu2m
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.12.19 um 13:38 schrieb Daniel Vetter:
> On Wed, Dec 11, 2019 at 01:19:53PM +0100, Gerd Hoffmann wrote:
>> The callback allows drivers and helpers to tweak pgprot for mappings.
>> This is especially helpful when using shmem helpers.  It allows driver=
s
>> to switch mappings from writecombine (default) to something else (cach=
ed
>> for example) on a per-object base without having to supply their own
>> mmap() and vmap() functions.
>>
>> The patch also adds two implementations for the callback, for cached a=
nd
>> writecombine mappings, and the drm_gem_pgprot() function to update
>> pgprot for a given object, using the new &drm_gem_object_funcs.pgprot
>> callback if available.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  include/drm/drm_gem.h     | 15 +++++++++++++
>>  drivers/gpu/drm/drm_gem.c | 46 ++++++++++++++++++++++++++++++++++++++=
-
>>  2 files changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 0b375069cd48..5beef7226e69 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -163,6 +163,17 @@ struct drm_gem_object_funcs {
>>  	 */
>>  	int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);=

>> =20
>> +	/**
>> +	 * @pgprot:
>> +	 *
>> +	 * Tweak pgprot as needed, typically used to set cache bits.
>> +	 *
>> +	 * This callback is optional.
>> +	 *
>> +	 * If unset drm_gem_pgprot_wc() will be used.
>> +	 */
>> +	pgprot_t (*pgprot)(struct drm_gem_object *obj, pgprot_t prot);
>=20
> I kinda prefer v1, mostly because this is a huge can of worms, and solv=
ing
> this properly is going to be real hard (and will necessarily involve
> dma-buf and dma-api and probably more). Charging ahead here just risks
> that we dig ourselves into a corner. You're v1 is maybe not the most
> clean, but just a few code bits here&there should be more flexible and
> easier to hack on and experiment around with.
> -Daniel

I agree; at least patch v1 is known to be a sound approach. The others
might fall on our feet at some point. Sorry, Gerd, if my proposals added
lots of work for you.

Best regards
Thomas

>=20
>> +
>>  	/**
>>  	 * @vm_ops:
>>  	 *
>> @@ -350,6 +361,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, =
unsigned long obj_size,
>>  		     struct vm_area_struct *vma);
>>  int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>> =20
>> +pgprot_t drm_gem_pgprot_cached(struct drm_gem_object *obj, pgprot_t p=
rot);
>> +pgprot_t drm_gem_pgprot_wc(struct drm_gem_object *obj, pgprot_t prot)=
;
>> +pgprot_t drm_gem_pgprot(struct drm_gem_object *obj, pgprot_t prot);
>> +
>>  /**
>>   * drm_gem_object_get - acquire a GEM buffer object reference
>>   * @obj: GEM buffer object
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 56f42e0f2584..1c468fe8e342 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1119,7 +1119,8 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj,=
 unsigned long obj_size,
>>  			return -EINVAL;
>> =20
>>  		vma->vm_flags |=3D VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;=

>> -		vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_=
flags));
>> +		vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>> +		vma->vm_page_prot =3D drm_gem_pgprot(obj, vma->vm_page_prot);
>>  		vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>>  	}
>> =20
>> @@ -1210,6 +1211,49 @@ int drm_gem_mmap(struct file *filp, struct vm_a=
rea_struct *vma)
>>  }
>>  EXPORT_SYMBOL(drm_gem_mmap);
>> =20
>> +/**
>> + * drm_gem_mmap - update pgprot for objects needing a cachable mappin=
g.
>> + * @obj: the GEM object.
>> + * @prot: page attributes.
>> + *
>> + * This function can be used as &drm_gem_object_funcs.pgprot callback=
=2E
>> + */
>> +pgprot_t drm_gem_pgprot_cached(struct drm_gem_object *obj, pgprot_t p=
rot)
>> +{
>> +	return prot;
>> +}
>> +EXPORT_SYMBOL(drm_gem_pgprot_cached);
>> +
>> +/**
>> + * drm_gem_mmap - update pgprot for objects needing a wc mapping.
>> + * @obj: the GEM object.
>> + * @prot: page attributes.
>> + *
>> + * This function can be used as &drm_gem_object_funcs.pgprot callback=
=2E
>> + */
>> +pgprot_t drm_gem_pgprot_wc(struct drm_gem_object *obj, pgprot_t prot)=

>> +{
>> +	return pgprot_writecombine(prot);
>> +}
>> +EXPORT_SYMBOL(drm_gem_pgprot_wc);
>> +
>> +/**
>> + * drm_gem_mmap - update pgprot for a given gem object.
>> + * @obj: the GEM object.
>> + * @prot: page attributes.
>> + *
>> + * This function updates pgprot according to the needs of the given
>> + * object.  If present &drm_gem_object_funcs.pgprot callback will be
>> + * used, otherwise drm_gem_pgprot_wc() is called.
>> + */
>> +pgprot_t drm_gem_pgprot(struct drm_gem_object *obj, pgprot_t prot)
>> +{
>> +	if (obj->funcs->pgprot)
>> +		return obj->funcs->pgprot(obj, prot);
>> +	return drm_gem_pgprot_wc(obj, prot);
>> +}
>> +EXPORT_SYMBOL(drm_gem_pgprot);
>> +
>>  void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>>  			const struct drm_gem_object *obj)
>>  {
>> --=20
>> 2.18.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZpRogva5wQ0Ag0bvgxTv8YttlUxQqsu2m--

--8rsNep00E8ys0bAoSOGO4rfAQ3Hgi85R2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3w7UUACgkQaA3BHVML
eiMNAgf9EYgarwDWgI5cEixKKpWA5Vm47XNqgXIrxMCcqbzy4qAsymMEokX+o+4e
IQQNzkQG5DT+j4MX/b9QnrNkZoerodmLjxksg3jPQHEWENEl/tScL7RktpMVf355
LKBqtkwuPEEAWOzb2nbLkcMSvYYcvNNboVdMlum45YbVj4gcTlajAV/rqyFdlGW+
urccISoEMka+7MDy5slnpCNT4jSUQc4Ofy+VxApeWd2o7An4p/Zb5SJ00oH5YiUo
SS4n8CTOf25ghWPVE+uDnfH0FW1A0t6bV/hETfTed4NTTbUMBuQR4XEUp7faXwIW
ii6pKDDwHF3+FSFOOODtss/+MfLy4A==
=AHVo
-----END PGP SIGNATURE-----

--8rsNep00E8ys0bAoSOGO4rfAQ3Hgi85R2--

--===============2128181413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2128181413==--
