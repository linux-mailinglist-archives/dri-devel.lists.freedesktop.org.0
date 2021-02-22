Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A908A32187C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 14:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AC76E509;
	Mon, 22 Feb 2021 13:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729CC6E507;
 Mon, 22 Feb 2021 13:24:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1F29AFF2;
 Mon, 22 Feb 2021 13:24:42 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, eric@anholt.net, sumit.semwal@linaro.org,
 stern@rowland.harvard.edu
References: <20210222124328.27340-1-tzimmermann@suse.de>
 <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
Date: Mon, 22 Feb 2021 14:24:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2040123664=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2040123664==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lN59ZmJV8jpzHkc8mY8FfIQNtjxmDSFKJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lN59ZmJV8jpzHkc8mY8FfIQNtjxmDSFKJ
Content-Type: multipart/mixed; boundary="ngtDDk2Psjhu8uZGC0uxh9YKnrrSxlB7n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, eric@anholt.net, sumit.semwal@linaro.org,
 stern@rowland.harvard.edu
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-ID: <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
References: <20210222124328.27340-1-tzimmermann@suse.de>
 <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
In-Reply-To: <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>

--ngtDDk2Psjhu8uZGC0uxh9YKnrrSxlB7n
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.02.21 um 14:09 schrieb Christian K=C3=B6nig:
>=20
>=20
> Am 22.02.21 um 13:43 schrieb Thomas Zimmermann:
>> USB-based drivers cannot use DMA, so the importing of dma-buf attachme=
nts
>> currently fails for udl and gm12u320. This breaks joining/mirroring of=

>> displays.
>>
>> The fix is now a little series. To solve the issue on the importer
>> side (i.e., the affected USB-based driver), patch 1 introduces a new
>> PRIME callback, struct drm_driver.gem_prime_create_object, which creat=
es
>> an object and gives more control to the importing driver. Specifically=
,
>> udl and gm12u320 can now avoid the creation of a scatter/gather table
>> for the imported pages. Patch 1 is self-contained in the sense that it=

>> can be backported into older kernels.
>=20
> Mhm, that sounds like a little overkill to me.
>=20
> Drivers can already import the DMA-bufs all by them selves without the =

> help of the DRM functions. See amdgpu for an example.
>=20
> Daniel also already noted to me that he sees the DRM helper as a bit=20
> questionable middle layer.

And this bug proves that it is. :)

>=20
> Have you thought about doing that instead?

There appears to be some useful code in drm_gem_prime_import_dev(). But=20
if the general sentiment goes towards removing=20
gem_prime_import_sg_table, we can work towards that as well.

Best regards
Thomas

>=20
> Christian.
>=20
>>
>> Patches 2 and 3 update SHMEM and CMA helpers to use the new callback.
>> Effectively this moves the sg table setup from the PRIME helpers into
>> the memory managers. SHMEM now supports devices without DMA support,
>> so custom code can be removed from udl and g12u320.
>>
>> Tested by joining/mirroring displays of udl and radeon under Gnome/X11=
=2E
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* move fix to importer side (Christian, Daniel=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0* update SHMEM and CMA helpers for new PRIME c=
allbacks
>>
>> Thomas Zimmermann (3):
>> =C2=A0=C2=A0 drm: Support importing dmabufs into drivers without DMA
>> =C2=A0=C2=A0 drm/shmem-helper: Implement struct drm_driver.gem_prime_c=
reate_object
>> =C2=A0=C2=A0 drm/cma-helper: Implement struct drm_driver.gem_prime_cre=
ate_object
>>
>> =C2=A0 drivers/gpu/drm/drm_gem_cma_helper.c=C2=A0=C2=A0=C2=A0 | 62 +++=
+++++++++++-----------
>> =C2=A0 drivers/gpu/drm/drm_gem_shmem_helper.c=C2=A0 | 38 ++++++++++---=
--
>> =C2=A0 drivers/gpu/drm/drm_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 43 +++++++++++------
>> =C2=A0 drivers/gpu/drm/lima/lima_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/panfrost/panfrost_drv.c |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/panfrost/panfrost_gem.c |=C2=A0 6 +--
>> =C2=A0 drivers/gpu/drm/panfrost/panfrost_gem.h |=C2=A0 4 +-
>> =C2=A0 drivers/gpu/drm/pl111/pl111_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 8 ++--
>> =C2=A0 drivers/gpu/drm/v3d/v3d_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +--
>> =C2=A0 drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
>> =C2=A0 include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +=
++++
>> =C2=A0 include/drm/drm_gem_cma_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 ++---
>> =C2=A0 include/drm/drm_gem_shmem_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 6 +--
>> =C2=A0 14 files changed, 120 insertions(+), 88 deletions(-)
>>
>> --=20
>> 2.30.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ngtDDk2Psjhu8uZGC0uxh9YKnrrSxlB7n--

--lN59ZmJV8jpzHkc8mY8FfIQNtjxmDSFKJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAzsJkFAwAAAAAACgkQlh/E3EQov+D+
yw/6AklnkSPfC66cCH7wqHT72aMQYxDy4O4Ma5d4EhbIlfF++oLRkyMUj7bmtaPuHCB0LiN/o7F5
lObNcY7ZfLtthUDtAhhAZ4jMOGHX9iNzhKACOB1JoIyGJ3vyJdLFb/jwwdpnJNl9423zc36Vt2s7
VtUr7SNWeiUETO6yEf9rShfZ99yqR0xreGdp86/HCupibDXr3iGcg8esQNebP5i7Ksci6hWGihO4
K/s1cbofhGvmRVaUl97z8VVM/Px5WLISWn9pzWW5S3cFfHjxyFzoLir8YkbsiaekIcYicH9Hif7c
EZJlwXfVGe3fyjVOBer1Sii1n1IClgeBsxi7anYgCfN64jRylAmCnxn5lCPUaXXRNeJgJtfL+iCc
fAvwLOk1PYezWoZ56PQe3poOeDru7I3UV4CGoH5R+zS8hAJECSBDZB+taXnEJyKQ0gLSsxZ3RpUh
c1w1aA0iVZ4hLQjk53DJPLlo8z/i6iFkCrRRJ90Y2cSvp9OoWah1Fwt4X0UZDz5rpuwgB6bOtuup
Bwdft0u6Lx6v4uQU2qR5gnrEc+/B5WJqmIGBdV0xKpIrgdSJZbzsBdc5eHnhg5i3/4R6Zz+pIDdw
dfgAq5XxeF9rUwHhQ5Q1i6Uv989q/N65NFdaehEyhrDySY+ooYvB/0G8FWExVMZ11dXptu1HAd/Q
/1k=
=70/N
-----END PGP SIGNATURE-----

--lN59ZmJV8jpzHkc8mY8FfIQNtjxmDSFKJ--

--===============2040123664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2040123664==--
