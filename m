Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A6E4503
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 09:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43456E8DA;
	Fri, 25 Oct 2019 07:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A645F6E8CF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:59:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00A12B87B;
 Fri, 25 Oct 2019 07:59:25 +0000 (UTC)
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(), vmap(), 
 and vunmap()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
 <20191025074038.GQ11828@phenom.ffwll.local>
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
Message-ID: <b3677f98-d357-8464-302b-4d1991bfc621@suse.de>
Date: Fri, 25 Oct 2019 09:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025074038.GQ11828@phenom.ffwll.local>
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
Cc: sam@ravnborg.org, airlied@redhat.com, sean@poorly.run,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0095281582=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0095281582==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jJ1pbET0VljEkDFDDzeOklGzGXPuhEzBw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jJ1pbET0VljEkDFDDzeOklGzGXPuhEzBw
Content-Type: multipart/mixed; boundary="EO3snfQMX0EyuhaDqGOCsHQjRSk5ZT3Qn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org
Message-ID: <b3677f98-d357-8464-302b-4d1991bfc621@suse.de>
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(), vmap(),
 and vunmap()
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
 <20191025074038.GQ11828@phenom.ffwll.local>
In-Reply-To: <20191025074038.GQ11828@phenom.ffwll.local>

--EO3snfQMX0EyuhaDqGOCsHQjRSk5ZT3Qn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.10.19 um 09:40 schrieb Daniel Vetter:
> On Thu, Oct 24, 2019 at 04:42:35PM +0200, Thomas Zimmermann wrote:
>> Implementing vmap() and vunmap() of struct drm_gem_object_funcs is
>> required by generic fbdev emulation. Supporting free() is easy as
>> well. More udl-specific interfaces can probably be replaced by GEM
>> object functions in later patches.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/udl/udl_gem.c | 34 ++++++++++++++++++++++++++++++++++=

>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_g=
em.c
>> index 3ea0cd9ae2d6..6ca097c270d6 100644
>> --- a/drivers/gpu/drm/udl/udl_gem.c
>> +++ b/drivers/gpu/drm/udl/udl_gem.c
>> @@ -11,6 +11,8 @@
>> =20
>>  #include "udl_drv.h"
>> =20
>> +static const struct drm_gem_object_funcs udl_gem_object_funcs;
>> +
>>  struct udl_gem_object *udl_gem_alloc_object(struct drm_device *dev,
>>  					    size_t size)
>>  {
>> @@ -25,6 +27,7 @@ struct udl_gem_object *udl_gem_alloc_object(struct d=
rm_device *dev,
>>  		return NULL;
>>  	}
>> =20
>> +	obj->base.funcs =3D &udl_gem_object_funcs;
>>  	obj->flags =3D UDL_BO_CACHEABLE;
>>  	return obj;
>>  }
>> @@ -230,3 +233,34 @@ int udl_gem_mmap(struct drm_file *file, struct dr=
m_device *dev,
>>  	mutex_unlock(&udl->gem_lock);
>>  	return ret;
>>  }
>> +
>> +/*
>> + * Helpers for struct drm_gem_object_funcs
>> + */
>> +
>> +static void udl_gem_object_free(struct drm_gem_object *obj)
>> +{
>> +	udl_gem_free_object(obj);
>> +}
>> +
>> +static void *udl_gem_object_vmap(struct drm_gem_object *obj)
>> +{
>> +	struct udl_gem_object *uobj =3D to_udl_bo(obj);
>> +	int ret;
>> +
>> +	ret =3D udl_gem_vmap(uobj);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +	return uobj->vmapping;
>> +}
>> +
>> +static void udl_gem_object_vunmap(struct drm_gem_object *obj, void *v=
addr)
>> +{
>> +	return udl_gem_vunmap(to_udl_bo(obj));
>> +}
>> +
>> +static const struct drm_gem_object_funcs udl_gem_object_funcs =3D {
>> +	.free	=3D udl_gem_object_free,
>> +	.vmap	=3D udl_gem_object_vmap,
>> +	.vunmap	=3D udl_gem_object_vunmap,
>=20
> Yeah this doesn't work, you need to refcount the vmap here I think. I'd=


I see. Should have thought of that...

> say simpler to first cut over to shmem helpers.

Right. I was already attempting the conversion and the udl gem is more
or less the same as shmem, except for the flags field. [1] The flag
signals page attributes for mmap-ing [2]. For prime-imported BOs its is
set to writecombining, and for local BOs it is set to cached. Shmem
always maps with writecombining.

I don't see why udl BOs are special wrt to mmap-ing. It seems to be some
kind of optimization. Do you have an idea?

Best regards
Thomas

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/udl/udl_drv.h?h=3Dv5.3#n78
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/udl/udl_gem.c?h=3Dv5.3#n57

> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--EO3snfQMX0EyuhaDqGOCsHQjRSk5ZT3Qn--

--jJ1pbET0VljEkDFDDzeOklGzGXPuhEzBw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2yq1wACgkQaA3BHVML
eiMElwgAlYmPtDZ9NfB38zvAGUCMXdT5ErGbGGa8TeyHH6KMW9/2faQtMn6cVsO3
KtRZUoFnvN0m81k+nMEoRpCpc0FeShOk0VxLoyvJ/CesOLEYjJf+KGos6HmTJ6wp
0JkTf0bnjFqrpMj6nOklAqkYUedb1MVZS4JOXmP5N6jzDITi7+1kRwZotCgOZhDv
92DV0z2vC5o6xr0bpNwxmEpKNzSU5e0gQoaQT3xPqLyQY20a9uIitIWGBeKmgHlX
TD5HwF+ia+QD+8rsi4q/6v9XwhBbyPRHhjJB+6GvPRdPe7LBWrMrxGzwPxWp2VcG
uyEcIN6e6xVXM8Mp9ZaSAlNEvgPLQw==
=k3Xg
-----END PGP SIGNATURE-----

--jJ1pbET0VljEkDFDDzeOklGzGXPuhEzBw--

--===============0095281582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0095281582==--
