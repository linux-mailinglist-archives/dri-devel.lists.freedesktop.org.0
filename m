Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDE1D350C
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5863F6EB6D;
	Thu, 14 May 2020 15:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF786EB6D;
 Thu, 14 May 2020 15:26:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 885BDAEF9;
 Thu, 14 May 2020 15:26:52 +0000 (UTC)
Subject: Re: [PATCH 9/9] drm/shmem-helpers: Simplify dma-buf importing
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-10-daniel.vetter@ffwll.ch>
 <732e30cc-9169-c409-4ddc-50508ef36efc@suse.de>
 <20200514125528.GA206103@phenom.ffwll.local>
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
Message-ID: <a41fc6fc-05d9-dadd-07f4-1f34550da07b@suse.de>
Date: Thu, 14 May 2020 17:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514125528.GA206103@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============2032041687=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2032041687==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4Twgz8cXFyPJyeWCD36WTkEiD1FxTIoQA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4Twgz8cXFyPJyeWCD36WTkEiD1FxTIoQA
Content-Type: multipart/mixed; boundary="we20hdvbmb3tazoWXHhm1pRNGQIw5xDGP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <a41fc6fc-05d9-dadd-07f4-1f34550da07b@suse.de>
Subject: Re: [PATCH 9/9] drm/shmem-helpers: Simplify dma-buf importing
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-10-daniel.vetter@ffwll.ch>
 <732e30cc-9169-c409-4ddc-50508ef36efc@suse.de>
 <20200514125528.GA206103@phenom.ffwll.local>
In-Reply-To: <20200514125528.GA206103@phenom.ffwll.local>

--we20hdvbmb3tazoWXHhm1pRNGQIw5xDGP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.05.20 um 14:55 schrieb Daniel Vetter:
> On Thu, May 14, 2020 at 09:44:02AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
>>> - Ditch the ->pages array
>>> - Make it a private gem bo, which means no shmem object, which means
>>>   fireworks if anyone calls drm_gem_object_get_pages. But we've just
>>>   made sure that's all covered.
>>>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 59 ++++++++++--------------=
--
>>>  1 file changed, 23 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm=
/drm_gem_shmem_helper.c
>>> index f7011338813e..8c7d4f422b7b 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -35,22 +35,12 @@ static const struct drm_gem_object_funcs drm_gem_=
shmem_funcs =3D {
>>>  	.mmap =3D drm_gem_shmem_mmap,
>>>  };
>>> =20
>>> -/**
>>> - * drm_gem_shmem_create - Allocate an object with the given size
>>> - * @dev: DRM device
>>> - * @size: Size of the object to allocate
>>> - *
>>> - * This function creates a shmem GEM object.
>>> - *
>>> - * Returns:
>>> - * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encode=
d negative
>>> - * error code on failure.
>>> - */
>>> -struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device =
*dev, size_t size)
>>> +static struct drm_gem_shmem_object *
>>> +__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool pri=
vate)
>>>  {
>>>  	struct drm_gem_shmem_object *shmem;
>>>  	struct drm_gem_object *obj;
>>> -	int ret;
>>> +	int ret =3D 0;
>>> =20
>>>  	size =3D PAGE_ALIGN(size);
>>> =20
>>> @@ -64,7 +54,10 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(=
struct drm_device *dev, size_t
>>>  	if (!obj->funcs)
>>>  		obj->funcs =3D &drm_gem_shmem_funcs;
>>> =20
>>> -	ret =3D drm_gem_object_init(dev, obj, size);
>>> +	if (private)
>>> +		drm_gem_private_object_init(dev, obj, size);
>>> +	else
>>> +		ret =3D drm_gem_object_init(dev, obj, size);
>>>  	if (ret)
>>>  		goto err_free;
>>> =20
>>> @@ -96,6 +89,21 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(=
struct drm_device *dev, size_t
>>> =20
>>>  	return ERR_PTR(ret);
>>>  }
>>> +/**
>>> + * drm_gem_shmem_create - Allocate an object with the given size
>>> + * @dev: DRM device
>>> + * @size: Size of the object to allocate
>>> + *
>>> + * This function creates a shmem GEM object.
>>> + *
>>> + * Returns:
>>> + * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encode=
d negative
>>> + * error code on failure.
>>> + */
>>> +struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device =
*dev, size_t size)
>>> +{
>>> +	return __drm_gem_shmem_create(dev, size, false);
>>> +}
>>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>>> =20
>>>  /**
>>> @@ -115,7 +123,6 @@ void drm_gem_shmem_free_object(struct drm_gem_obj=
ect *obj)
>>>  	if (obj->import_attach) {
>>>  		shmem->pages_use_count--;
>>>  		drm_prime_gem_destroy(obj, shmem->sgt);
>>> -		kvfree(shmem->pages);
>>>  	} else {
>>>  		if (shmem->sgt) {
>>>  			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
>>> @@ -371,7 +378,7 @@ drm_gem_shmem_create_with_handle(struct drm_file =
*file_priv,
>>>  	struct drm_gem_shmem_object *shmem;
>>>  	int ret;
>>> =20
>>> -	shmem =3D drm_gem_shmem_create(dev, size);
>>> +	shmem =3D __drm_gem_shmem_create(dev, size, true);
>>>  	if (IS_ERR(shmem))
>>>  		return shmem;
>>> =20
>>> @@ -695,36 +702,16 @@ drm_gem_shmem_prime_import_sg_table(struct drm_=
device *dev,
>>>  				    struct sg_table *sgt)
>>>  {
>>>  	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
>>> -	size_t npages =3D size >> PAGE_SHIFT;
>>>  	struct drm_gem_shmem_object *shmem;
>>> -	int ret;
>>> =20
>>>  	shmem =3D drm_gem_shmem_create(dev, size);
>>>  	if (IS_ERR(shmem))
>>>  		return ERR_CAST(shmem);
>>> =20
>>> -	shmem->pages =3D kvmalloc_array(npages, sizeof(struct page *), GFP_=
KERNEL);
>>> -	if (!shmem->pages) {
>>> -		ret =3D -ENOMEM;
>>> -		goto err_free_gem;
>>> -	}
>>> -
>>> -	ret =3D drm_prime_sg_to_page_addr_arrays(sgt, shmem->pages, NULL, n=
pages);
>>> -	if (ret < 0)
>>> -		goto err_free_array;
>>> -
>>>  	shmem->sgt =3D sgt;
>>> -	shmem->pages_use_count =3D 1; /* Permanently pinned from our point =
of view */
>>
>> This counter protected drm_gem_shmem_get_pages() from being executed o=
n
>> imported buffers. I guess that previous patches sorted out all the
>> instances where this could occur. If so, the current patch looks
>> correct. I'm not sure, if the overall code is really better than what =
we
>> have ATM, but anyway
>=20
> The goal was to clearly sort these cases out, iirc we had callers of
> get_pages doing the wrong thing, but I tried to review them all. Some g=
ot
> removed while this series was hanging around in my tree somewhere.
>=20
> What I wanted to do in the end is replace all mutex_lock with
> dma_resv_lock, which now should be doable. Except I need to audit all t=
he
> drivers, and some want _locked variant since they are already holding t=
he
> lock. That's roughly the point where I gave up on this eandeavour, at
> least for now.
>=20
> But if we'd get there then all the various helpers we have (cma, shmem,=

> vram) would more or less properly use dma_resv_lock as their protection=
g
> concept. That's kinda neat since with the dynamic dma-buf stuff
> dma_resv_lock really becomes _the_ buffer lock for drivers, so some
> motivation to move towards that.
>=20
> Anyway if you don't feel like this is all that useful without the
> dma_resv_lock work on top, I guess I can merge up to the doc patch and
> leave the others out. Not sure myself, thoughts?

Don't get me wrong, it's useful. The dma-buf support is just always a
bit special and bolted-on in all memory managers.

Please go ahead and merge it if you like. The clean separation of
dma-buf calls is better than what I did in my shmem patches. I'll rebase
my stuff on top of whatever you end up merging.

Best regards
Thomas

>=20
> Thanks for taking a look.
> -Daniel
>=20
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>>> =20
>>>  	DRM_DEBUG_PRIME("size =3D %zu\n", size);
>>> =20
>>>  	return &shmem->base;
>>> -
>>> -err_free_array:
>>> -	kvfree(shmem->pages);
>>> -err_free_gem:
>>> -	drm_gem_object_put_unlocked(&shmem->base);
>>> -
>>> -	return ERR_PTR(ret);
>>>  }
>>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
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


--we20hdvbmb3tazoWXHhm1pRNGQIw5xDGP--

--4Twgz8cXFyPJyeWCD36WTkEiD1FxTIoQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl69YzgACgkQaA3BHVML
eiOxoQf/fqz7Unvcm6M08kEPEbrxWj9zm4RV1Cf8C5aE2xtzIy3BjSdNinAQvo+Y
KyS/+QKCWn6Qt9zOm2r0px8UlRIYcbJFgQ3KtJYtXo4uFr+rKIARomrqbrhPHfC9
yvGhYoTDj/TzqQ0Vu2bFgARvAsxI0k06jbaYIfwyxq/7Pl6ZPz5mrYa4haazAxkI
IBb7gup51cEDWPaz0cykdVn67trIRPrYnqg/NHIvsu4SSlRDqYBDduRqUDnDA7ab
w4t0GOI8DqZ+kIRy1ReaniPzgOZLKb3/+e03dSSrnUVAsue+EJRxr3jJMEgVThEw
uzBm3Dp4qh1lcA1ng9eyL1cwZUuLTg==
=HBz0
-----END PGP SIGNATURE-----

--4Twgz8cXFyPJyeWCD36WTkEiD1FxTIoQA--

--===============2032041687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2032041687==--
