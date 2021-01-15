Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337AD2F7E13
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 15:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520D46E44B;
	Fri, 15 Jan 2021 14:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E146E44B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:23:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3725EAC8F;
 Fri, 15 Jan 2021 14:23:40 +0000 (UTC)
Subject: Re: [PATCH v2] drm: Set vm_ops to GEM object's values during mmap
To: Daniel Vetter <daniel@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20210115093038.10345-1-tzimmermann@suse.de>
 <f8b37a6e-b750-7b23-4628-8b11dbc04d36@ideasonboard.com>
 <YAGii4JitMpYr7iP@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3121ecc4-812d-dfc2-9a85-613f652633b8@suse.de>
Date: Fri, 15 Jan 2021 15:23:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YAGii4JitMpYr7iP@phenom.ffwll.local>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0445264745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0445264745==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cZinz65opcZJwk5lrTN8GwHXvImgMDeXC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cZinz65opcZJwk5lrTN8GwHXvImgMDeXC
Content-Type: multipart/mixed; boundary="5XjEKquvLxIbCH16psRUWPucuIq0PF5qD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Message-ID: <3121ecc4-812d-dfc2-9a85-613f652633b8@suse.de>
Subject: Re: [PATCH v2] drm: Set vm_ops to GEM object's values during mmap
References: <20210115093038.10345-1-tzimmermann@suse.de>
 <f8b37a6e-b750-7b23-4628-8b11dbc04d36@ideasonboard.com>
 <YAGii4JitMpYr7iP@phenom.ffwll.local>
In-Reply-To: <YAGii4JitMpYr7iP@phenom.ffwll.local>

--5XjEKquvLxIbCH16psRUWPucuIq0PF5qD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.21 um 15:11 schrieb Daniel Vetter:
> On Fri, Jan 15, 2021 at 09:57:24AM +0000, Kieran Bingham wrote:
>> Hi Thomas,
>>
>> On 15/01/2021 09:30, Thomas Zimmermann wrote:
>>> The GEM mmap code relies on the GEM object's mmap callback to set the=

>>> VMA's vm_ops field. This is easily forgotten and already led to a mem=
ory
>>> leak in the CMA helpers. Instead set the vm_ops field in the DRM core=

>>> code to the GEM object's value. Drivers with different needs can over=
ride
>>> this in their mmap callback.
>>>
>>> v2:
>>> 	* support (vm_ops =3D=3D NULL) if mmap is given; required by VRAM
>>> 	  helpers
>=20
> I guess vram helpers need this because ttm has it's own vm_ops struct?
> Might be another thing worth unifying (eventually).

I've been working on converting drivers to struct=20
drm_gem_object_funcs.mmap and using DRM helpers for the other mmap=20
callbacks. Part of this would include some unifying of the vm_ops=20
handling. TTM drivers are kind of special here.

Best regards
Thomas

>=20
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: f5ca8eb6f9bd ("drm/cma-helper: Implement mmap as GEM CMA objec=
t functions")
>>> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>=

>>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Re-tested just fine this side ;-)
>>   - https://paste.ubuntu.com/p/Jgz6xMKNJX/
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>>
>> Thanks
>>
>> Kieran
>>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Eric Anholt <eric@anholt.net>
>>> Cc: dri-devel@lists.freedesktop.org
>>> ---
>>>   drivers/gpu/drm/drm_gem.c   | 19 ++++++++++---------
>>>   drivers/gpu/drm/drm_prime.c |  2 ++
>>>   2 files changed, 12 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 34b2f111c01c..c2ce78c4edc3 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1068,20 +1068,17 @@ int drm_gem_mmap_obj(struct drm_gem_object *o=
bj, unsigned long obj_size,
>>>   	drm_gem_object_get(obj);
>>>  =20
>>>   	vma->vm_private_data =3D obj;
>>> +	vma->vm_ops =3D obj->funcs->vm_ops;
>>>  =20
>>>   	if (obj->funcs->mmap) {
>>>   		ret =3D obj->funcs->mmap(obj, vma);
>>> -		if (ret) {
>>> -			drm_gem_object_put(obj);
>>> -			return ret;
>>> -		}
>>> +		if (ret)
>>> +			goto err_drm_gem_object_put;
>>>   		WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));
>>>   	} else {
>>> -		if (obj->funcs->vm_ops)
>>> -			vma->vm_ops =3D obj->funcs->vm_ops;
>>> -		else {
>>> -			drm_gem_object_put(obj);
>>> -			return -EINVAL;
>>> +		if (!vma->vm_ops) {
>>> +			ret =3D -EINVAL;
>>> +			goto err_drm_gem_object_put;
>>>   		}
>>>  =20
>>>   		vma->vm_flags |=3D VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUM=
P;
>>> @@ -1090,6 +1087,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *ob=
j, unsigned long obj_size,
>>>   	}
>>>  =20
>>>   	return 0;
>>> +
>>> +err_drm_gem_object_put:
>>> +	drm_gem_object_put(obj);
>>> +	return ret;
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_mmap_obj);
>>>  =20
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.=
c
>>> index 683aa29ecd3b..2a54f86856af 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -717,6 +717,8 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj=
, struct vm_area_struct *vma)
>>>   	vma->vm_pgoff +=3D drm_vma_node_start(&obj->vma_node);
>>>  =20
>>>   	if (obj->funcs && obj->funcs->mmap) {
>>> +		vma->vm_ops =3D obj->funcs->vm_ops;
>>> +
>=20
> Do you know how much we still need the non-obj->funcs path here? Maybe
> time to detele it and wrape the obj->funcs check in a WARN_ON?
> -Daniel
>=20
>=20
>>>   		ret =3D obj->funcs->mmap(obj, vma);
>>>   		if (ret)
>>>   			return ret;
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--5XjEKquvLxIbCH16psRUWPucuIq0PF5qD--

--cZinz65opcZJwk5lrTN8GwHXvImgMDeXC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmABpWsFAwAAAAAACgkQlh/E3EQov+A5
ShAAt8JNxPi2HkDY2xx3J9ISZmwnI6BLxZSxNm0tU9vjn2qZPbxiulN1dc8XutkZZ9ZW12ewj4Ux
aRfLquD786XKrTbvX++82gU/ChfAnNSAA0+1pF+DCj9UfKvYEYaG9Zc5DpD22MikwaXBqORE3Oph
OMixoTep6+56p9sZc4jg4lobvksfkG8E54toMF710Ob11ZuEUFjWK2QrizV1cioL8Ann2wQHlazN
yEEOI8Nfl3K6eJ18jRHYqXWThcXLzJFC+CK2IHhgJhGyXl40FW2lnAKr2dqSu1XzR66TVeU119Rr
aZ9redb6w5TgYDE7H+Pn49C7DAm1G5YPIbWjAnKBQ2Hg17UF5uVvqqExWDtZcZzaWJzchSkcwwX5
b0j8844KuLkpkrgNf3TdvIPbzkteL4GEq/GnWlGZBlhk8vovHsqv1wfcceQNqyr8tvu2cFEGCZfj
2UI9NBlNXy9kx0Eca9j36p7Gyq9u9rYd6AEIa8ecf10/SYUGe9mdrr2QDV1B0cF89EKUj8Z/8MOU
Jdv8lhPD7T5kc8ltp2LYj693mRt7xxa+TgxSxSB9tz9pdIFlg5i0WxH59ra0stMd/OVbKfN+8TJG
XzIFOdFktpgMtacMJiUygxfaxYmfhTuxcq0OFEMUgS8R/b3MjIOsHMdixfFK189xObcN8IcpTuk0
gKY=
=YxAT
-----END PGP SIGNATURE-----

--cZinz65opcZJwk5lrTN8GwHXvImgMDeXC--

--===============0445264745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0445264745==--
