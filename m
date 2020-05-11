Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582401CD94C
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 14:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860C16E44E;
	Mon, 11 May 2020 12:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEF96E447;
 Mon, 11 May 2020 12:05:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7AA7BAC91;
 Mon, 11 May 2020 12:05:05 +0000 (UTC)
Subject: Re: [PATCH 5/9] drm/udl: Don't call get/put_pages on imported dma-buf
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-6-daniel.vetter@ffwll.ch>
 <d34c53ef-1cba-9559-8169-66535d06b6cf@suse.de>
 <20200511113740.GE206103@phenom.ffwll.local>
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
Message-ID: <82c0365f-4963-da7c-572f-2c11dda3c5d8@suse.de>
Date: Mon, 11 May 2020 14:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511113740.GE206103@phenom.ffwll.local>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1453938667=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1453938667==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="14DO7Ly8obsuF3OOLdOnV7UecYyvyL5An"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--14DO7Ly8obsuF3OOLdOnV7UecYyvyL5An
Content-Type: multipart/mixed; boundary="N36e26HDN4UHQ3jShoEWJj3V5dJybsu8g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <82c0365f-4963-da7c-572f-2c11dda3c5d8@suse.de>
Subject: Re: [PATCH 5/9] drm/udl: Don't call get/put_pages on imported dma-buf
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-6-daniel.vetter@ffwll.ch>
 <d34c53ef-1cba-9559-8169-66535d06b6cf@suse.de>
 <20200511113740.GE206103@phenom.ffwll.local>
In-Reply-To: <20200511113740.GE206103@phenom.ffwll.local>

--N36e26HDN4UHQ3jShoEWJj3V5dJybsu8g
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.05.20 um 13:37 schrieb Daniel Vetter:
> On Mon, May 11, 2020 at 01:23:38PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
>>> There's no direct harm, because for the shmem helpers these are noops=

>>> on imported buffers. The trouble is in the locks these take - I want
>>> to change dma_buf_vmap locking, and so need to make sure that we only=

>>> ever take certain locks on one side of the dma-buf interface: Either
>>> for exporters, or for importers.
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> ---
>>>  drivers/gpu/drm/udl/udl_gem.c | 22 ++++++++++++----------
>>>  1 file changed, 12 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_=
gem.c
>>> index b6e26f98aa0a..c68d3e265329 100644
>>> --- a/drivers/gpu/drm/udl/udl_gem.c
>>> +++ b/drivers/gpu/drm/udl/udl_gem.c
>>> @@ -46,29 +46,31 @@ static void *udl_gem_object_vmap(struct drm_gem_o=
bject *obj)
>>
>> It's still not clear to me why this function exists in the first place=
=2E
>> It's the same code as the default implementation, except that it doesn=
't
>> support cached mappings.
>>
>> I don't see why udl is special. I'd suggest to try to use the original=

>> shmem function and remove this one. Same for the mmap code.
>=20
> tbh no idea, could be that the usb code is then a bit too inefficient a=
t
> uploading stuff if it needs to cache flush.

IIRC I was told that some other component (userspace, dma-buf provider)
might not work well with cached mappings. But that problem should affect
all other shmem-based drivers as well. I'm not aware of any problems here=
=2E

The upload code is in udl_render_hline. It's an elaborate
format-conversion helper that packs the framebuffer into USB URBs and
sends them out. Again, I don't see much of a conceptual difference to
other drivers that do similar things on device memory.

>=20
> But then on x86 at least everything (except real gpus) is coherent, so
> cached mappings should be faster.
>=20
> No idea, but also don't have the hw so not going to touch udl that much=
=2E

I can help with testing.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>  	if (shmem->vmap_use_count++ > 0)
>>>  		goto out;
>>> =20
>>> -	ret =3D drm_gem_shmem_get_pages(shmem);
>>> -	if (ret)
>>> -		goto err_zero_use;
>>> -
>>> -	if (obj->import_attach)
>>> +	if (obj->import_attach) {
>>>  		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
>>> -	else
>>> +	} else {
>>> +		ret =3D drm_gem_shmem_get_pages(shmem);
>>> +		if (ret)
>>> +			goto err;
>>> +
>>>  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>>>  				    VM_MAP, PAGE_KERNEL);
>>> =20
>>> +		if (!shmem->vaddr)
>>> +			drm_gem_shmem_put_pages(shmem);
>>> +	}
>>> +
>>>  	if (!shmem->vaddr) {
>>>  		DRM_DEBUG_KMS("Failed to vmap pages\n");
>>>  		ret =3D -ENOMEM;
>>> -		goto err_put_pages;
>>> +		goto err;
>>>  	}
>>> =20
>>>  out:
>>>  	mutex_unlock(&shmem->vmap_lock);
>>>  	return shmem->vaddr;
>>> =20
>>> -err_put_pages:
>>> -	drm_gem_shmem_put_pages(shmem);
>>> -err_zero_use:
>>> +err:
>>>  	shmem->vmap_use_count =3D 0;
>>>  	mutex_unlock(&shmem->vmap_lock);
>>>  	return ERR_PTR(ret);
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--N36e26HDN4UHQ3jShoEWJj3V5dJybsu8g--

--14DO7Ly8obsuF3OOLdOnV7UecYyvyL5An
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl65P2oACgkQaA3BHVML
eiP0jAf/WP9bv7O5utlz/EUlBaGskM2QqACLGKDMoSEKrCRDh70A2mrjpY4n34AS
6UDzLCTfkNkS5p8FT87PgJZiwzv/WCeIdyyQ8cbwOymM+8rrqaOi/m1sJQUxBpen
Up2f83W3cKNo7HrahRGrDgFpl3URkM8kAygBXaJaV8K81/xUWq9Xghns655buXW8
UWaVwUhH/HzXEGD8LxGdiTAYr9FwHwhj/946v26eQFKASjxnG2KHt8LGOi8kW7HC
9bEs1aRvQrU9CpI6yUIKqR6uv+Vwq89wDycwtLK/5h6vld0vVe8oe8drTiUKxD4W
LrK19mAw0xUMms+uG5vtJJJ5AO7qpg==
=UxEC
-----END PGP SIGNATURE-----

--14DO7Ly8obsuF3OOLdOnV7UecYyvyL5An--

--===============1453938667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1453938667==--
