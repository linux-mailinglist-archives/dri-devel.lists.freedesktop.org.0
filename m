Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDBB318DD4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 16:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D0D6E43D;
	Thu, 11 Feb 2021 15:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EA76E43D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 15:12:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C867ACBF;
 Thu, 11 Feb 2021 15:12:24 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
References: <20210211131659.276275-1-christian.koenig@amd.com>
 <365e99a6-24c4-33b5-ae9c-15904b056b89@suse.de>
 <acc54d35-38b1-52b0-1ef1-75a8a4f6469a@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3d0169ca-3b8d-c76d-044f-da4c5b39f88f@suse.de>
Date: Thu, 11 Feb 2021 16:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <acc54d35-38b1-52b0-1ef1-75a8a4f6469a@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2032475553=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2032475553==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iF4pJArQZlfJqTDq4cy37E9zx2ZJxmAG5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iF4pJArQZlfJqTDq4cy37E9zx2ZJxmAG5
Content-Type: multipart/mixed; boundary="nypgqGkSqqfBr2LHzRRrNDs7G8QBI3Aye";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
Message-ID: <3d0169ca-3b8d-c76d-044f-da4c5b39f88f@suse.de>
Subject: Re: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
References: <20210211131659.276275-1-christian.koenig@amd.com>
 <365e99a6-24c4-33b5-ae9c-15904b056b89@suse.de>
 <acc54d35-38b1-52b0-1ef1-75a8a4f6469a@gmail.com>
In-Reply-To: <acc54d35-38b1-52b0-1ef1-75a8a4f6469a@gmail.com>

--nypgqGkSqqfBr2LHzRRrNDs7G8QBI3Aye
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.02.21 um 16:05 schrieb Christian K=C3=B6nig:
>=20
>=20
> Am 11.02.21 um 15:52 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 11.02.21 um 14:16 schrieb Christian K=C3=B6nig:
>>> Swapping bo->mem was completely unecessary. Cleanup the function whic=
h
>>> is just a leftover from a TTM cleanup.
>>
>> Yes this was introduced in a recent cleanup effort. Can you explain=20
>> what the code intends to do? It seems as if it tries to "re-unmap the =

>> BO" if the move_memcpy fails.
>>
>> If the move_memcpy fails now, it seems like we can live without=20
>> reverting that call to drm_gem_vram_bo_driver_move_notify(). (?)
>=20
> I think so, but I'm not 100% sure either.
>=20
> The swap() -> notify -> swap() was just how TTM did it and that was=20
> moved into the drivers.
>=20
> I'm now just trying to remove all the hard write accesses to bo->mem=20
> from drivers and stumbled over this here.

We already have a vmap count of zero; so unmapping the BO pages is fine=20
at any time. The next caller of vmap will simple instantiate a new mappin=
g.

Let me give this patch a test run tomorrow, but it seems correct.

Best regards
Thomas

>=20
> Thanks for the comments,
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> ---
>>> =C2=A0 drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++--------------
>>> =C2=A0 1 file changed, 4 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c=20
>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> index a0992f0b8afd..0c2233ee6029 100644
>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> @@ -564,9 +564,7 @@ static void=20
>>> drm_gem_vram_bo_driver_evict_flags(struct drm_gem_vram_object *gbo,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *pl =3D gbo->placement;
>>> =C2=A0 }
>>> =C2=A0 -static void drm_gem_vram_bo_driver_move_notify(struct=20
>>> drm_gem_vram_object *gbo,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bool evict,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct ttm_resource *new_mem)
>>> +static void drm_gem_vram_bo_driver_move_notify(struct=20
>>> drm_gem_vram_object *gbo)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *bo =3D &gbo-=
>bo;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D bo->base.de=
v;
>>> @@ -582,16 +580,8 @@ static int drm_gem_vram_bo_driver_move(struct=20
>>> drm_gem_vram_object *gbo,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 struct ttm_operation_ctx *ctx,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 struct ttm_resource *new_mem)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 drm_gem_vram_bo_driver_move_notify(gbo, evict, ne=
w_mem);
>>> -=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem=
);
>>> -=C2=A0=C2=A0=C2=A0 if (ret) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swap(*new_mem, gbo->bo.me=
m);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_vram_bo_driver_mo=
ve_notify(gbo, false, new_mem);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swap(*new_mem, gbo->bo.me=
m);
>>> -=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0 drm_gem_vram_bo_driver_move_notify(gbo);
>>> +=C2=A0=C2=A0=C2=A0 return ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem)=
;
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 /*
>>> @@ -947,7 +937,7 @@ static void bo_driver_delete_mem_notify(struct=20
>>> ttm_buffer_object *bo)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gbo =3D drm_gem_vram_of_bo(bo);=

>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 drm_gem_vram_bo_driver_move_notify(gbo, fa=
lse, NULL);
>>> +=C2=A0=C2=A0=C2=A0 drm_gem_vram_bo_driver_move_notify(gbo);
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 static int bo_driver_move(struct ttm_buffer_object *bo,=

>>>
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--nypgqGkSqqfBr2LHzRRrNDs7G8QBI3Aye--

--iF4pJArQZlfJqTDq4cy37E9zx2ZJxmAG5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAlSVYFAwAAAAAACgkQlh/E3EQov+By
5xAAgGJ6Qn18OaU6RhzXYDCpkktExjPLUDg8mcM7egw+umf7/eO3t6sC3wJZ11U+lyw5a25I2Cts
qsyl8KRvcDoty51N0uVRq6ZqMLMLkcfwNpEg5mkwCRyNgrLg/toyniNcb2ChjxKHIBxwI+gcTG5F
Nfvzkkt4HnkecUylI/+I2ESQT0q9QDzTwljS200nJm8RN70kKCG2kZEwJQlVA2peK6oCOjQGkA90
5wkiEDYnRU00n+2tvEpVuGE/rt8OSuTVACGsQo5wUoiHKXdP7pqX+UmnlgQioF6bHP/wFDQYU56x
3L4BLuVE2QSSHN9KAzVQlNvDEK7ZYWaHX2RpM/wK1CwWtxASh4DN9ANyh+b46j3GoJ1kHXWuIiAn
zF+9zoLbIBNC1tnrSM3f/ky5EeTR4MpA0dPZCQocbsV2B5llSLyAY1aDkGD6wrsve8sOKP6xn5mI
DuHUj5oLuvZG23c9OMcj2CDEGk4MU8UFYxVz9aNd0ND+e4zEyVBeBk6LHQcM5UP+BL3/R/f17bGt
LhJgsNbNEnvBtfx/zSuFP/wA+3+PjGzUE/iBz/JsXoGYVErT2yXFut6eH25mAgtAh8SPLBwRBHVN
7HkfACd6h0VGP32wh/s4FjeXOI+XvbtOVIQsE3MbnCr54My4zdRwl0Ffj7ki6aRxGzM4hCUO+Qat
jcQ=
=QZ/s
-----END PGP SIGNATURE-----

--iF4pJArQZlfJqTDq4cy37E9zx2ZJxmAG5--

--===============2032475553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2032475553==--
