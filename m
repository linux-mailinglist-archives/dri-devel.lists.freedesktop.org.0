Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF7358214
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B0D6EAAA;
	Thu,  8 Apr 2021 11:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714966EAAA;
 Thu,  8 Apr 2021 11:39:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED368AE06;
 Thu,  8 Apr 2021 11:39:00 +0000 (UTC)
Subject: Re: [PATCH 0/8] drm: Clean up mmap for TTM-based GEM drivers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <YG7msOScvAKpjAXx@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <78bd7249-8bea-e61d-ab7f-7067d31aa854@suse.de>
Date: Thu, 8 Apr 2021 13:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG7msOScvAKpjAXx@phenom.ffwll.local>
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
Cc: shashank.sharma@amd.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 Felix.Kuehling@amd.com, sroland@vmware.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, ray.huang@amd.com,
 emil.velikov@collabora.com, sam@ravnborg.org, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1004611215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1004611215==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sDPoDcmukfUBBxTaUFOWpiXevH5uZhoHa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sDPoDcmukfUBBxTaUFOWpiXevH5uZhoHa
Content-Type: multipart/mixed; boundary="O3TMjlR7PgKlHqfUxzXGTdR2cCRU3Er0i";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, shashank.sharma@amd.com,
 airlied@linux.ie, nouveau@lists.freedesktop.org, Felix.Kuehling@amd.com,
 sroland@vmware.com, nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org,
 ray.huang@amd.com, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sam@ravnborg.org, christian.koenig@amd.com,
 emil.velikov@collabora.com
Message-ID: <78bd7249-8bea-e61d-ab7f-7067d31aa854@suse.de>
Subject: Re: [PATCH 0/8] drm: Clean up mmap for TTM-based GEM drivers
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <YG7msOScvAKpjAXx@phenom.ffwll.local>
In-Reply-To: <YG7msOScvAKpjAXx@phenom.ffwll.local>

--O3TMjlR7PgKlHqfUxzXGTdR2cCRU3Er0i
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.04.21 um 13:19 schrieb Daniel Vetter:
> On Tue, Apr 06, 2021 at 11:08:55AM +0200, Thomas Zimmermann wrote:
>> Implement mmap via struct drm_gem_object_functions.mmap for amdgpu,
>> radeon and nouveau. This allows for using common DRM helpers for
>> the mmap-related callbacks in struct file_operations and struct
>> drm_driver. The drivers have their own vm_ops, which are now set
>> automatically by the DRM core functions. The code in each driver's
>> verify_access becomes part of the driver's new mmap implementation.
>=20
> Is there anything left in there which isn't already handled by the gem
> checks? Iirc there was some custom limit for ttm drivers once to allow
> co-existing with ums drivers, but that's never really been a thing sinc=
e
> forever ...

Vmwgfx does its own thing. radeon and amdgpu have some checks (userptr). =

But it's all very small. The general tests will be in the GEM helpers.

Best regards
Thomas

> -Daniel
>=20
>>
>> With the GEM drivers converted, vmwgfx is the only user of
>> ttm_bo_mmap() and related infrastructure. So move everything into
>> vmwgfx and delete the rsp code from TTM.
>>
>> This touches several drivers. Preferably everything would be merged
>> at once via drm-misc-next.
>>
>> Thomas Zimmermann (8):
>>    drm/ttm: Don't override vm_ops callbacks, if set
>>    drm/amdgpu: Remove unused function amdgpu_bo_fbdev_mmap()
>>    drm/amdgpu: Implement mmap as GEM object function
>>    drm/radeon: Implement mmap as GEM object function
>>    drm/nouveau: Implement mmap as GEM object function
>>    drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
>>    drm/vmwgfx: Inline vmw_verify_access()
>>    drm/ttm: Remove ttm_bo_mmap() and friends
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 64 +++++++++++++++++++=

>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 19 ------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  2 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 71 -------------------=
--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
>>   drivers/gpu/drm/nouveau/nouveau_bo.c        | 10 ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  3 +-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c       | 36 +++++++++++
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c       | 49 --------------
>>   drivers/gpu/drm/nouveau/nouveau_ttm.h       |  1 -
>>   drivers/gpu/drm/radeon/radeon_drv.c         |  3 +-
>>   drivers/gpu/drm/radeon/radeon_gem.c         | 52 +++++++++++++++
>>   drivers/gpu/drm/radeon/radeon_ttm.c         | 65 -------------------=

>>   drivers/gpu/drm/radeon/radeon_ttm.h         |  1 -
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c             | 60 ++---------------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  9 ---
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 51 ++++++++++++++-
>>   include/drm/ttm/ttm_bo_api.h                | 13 ----
>>   include/drm/ttm/ttm_device.h                | 15 -----
>>   22 files changed, 212 insertions(+), 365 deletions(-)
>>
>> --
>> 2.30.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--O3TMjlR7PgKlHqfUxzXGTdR2cCRU3Er0i--

--sDPoDcmukfUBBxTaUFOWpiXevH5uZhoHa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBu61MFAwAAAAAACgkQlh/E3EQov+BH
lA//bL9iV3UhjKAbp2tlIlo/5cVEbOsN29tOkzcfUDqvV9u4JJKPZB+VhSU9kAa1yqloK4Aj+TpQ
aw4eaf0lO9u48nSngdGycxV4RlIhuas+xpX75y2mCWeuZJNR9/H5CX+gpaN0ixagmo1p/tZt1OGF
fwJmDZv7d76gAEM6bHZEtY0Iv0uHK2MEdL4VFyGDiRT2XJ8lvOvUuSFKeTfgeZyU4bcWRGK5ZCMz
vXJ2BgHxpd5k1+jizPIWFkHwzs+ZkJ7AI9krtPCwKXODBbrkCj+BAs39kCkN5AYwxy436inZfMyD
3g7YF0mxy0Q16v6fmXavVWCvrcUxp8zfCTEZFtlY189UT2cehPyCIxPmZKcEB0DOwqY5FwdvCDtT
7XNximExuWEv4VeiXAWc6V0yisnyawW6uR2ZmohLo5rmvkoz6EW/3rnqzQhf3QATVJzvplH3TFKt
d88LiYPf8nBmq/Wq5VOufyayDqeqXycVUBsJixZCqPsIJ6ixeMU2/xwhRA6pqZV+GEkBlyMPzdLb
7aNiHrEWJlF7SAoboE1pCsXeg99pXruBSa98OsP+8WiPahoHOeb/VCgtAtip60VReuBrZJ/wGK1d
iax+kDH+EcZgtzfGhoSv9EeZi1eU6tmRRT7+eN7gllEF5fJTlLJJQyJ9jX7V9WTObmkkthJIroBC
ank=
=0hZw
-----END PGP SIGNATURE-----

--sDPoDcmukfUBBxTaUFOWpiXevH5uZhoHa--

--===============1004611215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1004611215==--
