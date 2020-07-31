Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D0233FAF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4676B6E9E2;
	Fri, 31 Jul 2020 07:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF74A6E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 07:03:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66886AED6;
 Fri, 31 Jul 2020 07:03:39 +0000 (UTC)
Subject: Re: [PATCH 04/49] drm/ttm: provide a driver-led init path for generic
 mm manager.
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-5-airlied@gmail.com>
 <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>
Message-ID: <15795596-65f2-2605-da32-9fb1c9acc614@suse.de>
Date: Fri, 31 Jul 2020 09:03:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>
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
Cc: kraxel@redhat.com, sroland@vmware.com, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1342380878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1342380878==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="O53LGZi3TWrAGmpbysmHBBZMaDm63MVAX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O53LGZi3TWrAGmpbysmHBBZMaDm63MVAX
Content-Type: multipart/mixed; boundary="FfgSRoTXjM8BmHce9XThXqIYgKVA7wFXy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Message-ID: <15795596-65f2-2605-da32-9fb1c9acc614@suse.de>
Subject: Re: [PATCH 04/49] drm/ttm: provide a driver-led init path for generic
 mm manager.
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-5-airlied@gmail.com>
 <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>
In-Reply-To: <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>

--FfgSRoTXjM8BmHce9XThXqIYgKVA7wFXy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 31.07.20 um 08:57 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 31.07.20 um 06:04 schrieb Dave Airlie:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> This lets the generic mm manager be initialised by the driver.
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> ---
>>  drivers/gpu/drm/ttm/ttm_bo_manager.c | 23 ++++++++++++++++++++---
>>  include/drm/ttm/ttm_bo_driver.h      |  3 +++
>>  2 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/tt=
m/ttm_bo_manager.c
>> index facd3049c3aa..64234e5caee3 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
>> @@ -104,8 +104,8 @@ static void ttm_bo_man_put_node(struct ttm_mem_typ=
e_manager *man,
>>  	}
>>  }
>> =20
>> -static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
>> -			   unsigned long p_size)
>> +static int ttm_bo_man_init_private(struct ttm_mem_type_manager *man,
>> +		    unsigned long p_size)
>>  {
>>  	struct ttm_range_manager *rman;
>> =20
>> @@ -119,6 +119,23 @@ static int ttm_bo_man_init(struct ttm_mem_type_ma=
nager *man,
>>  	return 0;
>>  }
>> =20
>> +int ttm_bo_man_init(struct ttm_bo_device *bdev,
>> +		    struct ttm_mem_type_manager *man,
>> +		    unsigned long p_size)
>> +{
>> +	int ret;
>> +
>> +	man->func =3D &ttm_bo_manager_func;
>=20
> Overriding man->func is the only reason for drivers to call
> ttm_bo_man_init_mm_base and ttm_bo_use_mm directly (e.g., as in nouveau=
)?
>=20
> If so, Wouldn't it be better to do
>=20
>   if (!man->func)
>       man->func =3D &ttm_bo_manager_func;
>=20
> in ttm_bo_man_init and forget about the other fucntions?
>=20
> Best regards
> Thomas
>=20
>> +
>> +	ttm_bo_init_mm_base(bdev, man, p_size);
>> +	ret =3D ttm_bo_man_init_private(man, p_size);

Oh, I just realized that this line's also missing in nouveau.

>> +	if (ret)
>> +		return ret;
>> +	ttm_bo_use_mm(man);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_man_init);
>> +
>>  static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
>>  {
>>  	struct ttm_range_manager *rman =3D (struct ttm_range_manager *) man-=
>priv;
>> @@ -147,7 +164,7 @@ static void ttm_bo_man_debug(struct ttm_mem_type_m=
anager *man,
>>  }
>> =20
>>  const struct ttm_mem_type_manager_func ttm_bo_manager_func =3D {
>> -	.init =3D ttm_bo_man_init,
>> +	.init =3D ttm_bo_man_init_private,
>>  	.takedown =3D ttm_bo_man_takedown,
>>  	.get_node =3D ttm_bo_man_get_node,
>>  	.put_node =3D ttm_bo_man_put_node,
>> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_=
driver.h
>> index 68e75c3b8c7a..5c4ccefd5393 100644
>> --- a/include/drm/ttm/ttm_bo_driver.h
>> +++ b/include/drm/ttm/ttm_bo_driver.h
>> @@ -799,6 +799,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_obje=
ct *bo);
>>   */
>>  pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
>> =20
>> +int ttm_bo_man_init(struct ttm_bo_device *bdev,
>> +		    struct ttm_mem_type_manager *man,
>> +		    unsigned long p_size);
>>  extern const struct ttm_mem_type_manager_func ttm_bo_manager_func;
>> =20
>>  #endif
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--FfgSRoTXjM8BmHce9XThXqIYgKVA7wFXy--

--O53LGZi3TWrAGmpbysmHBBZMaDm63MVAX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8jwjoUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPjKggAgSf0ywXVS+Frf91y2MraAvl8+TV8
pkxWwnil2zKUF/668WoIeQGEAeFgHZJnzp9EjrBMPEo6t5sW6a7ZVRi7FRnxB5AN
fjEaHOiwaauUF4o3f0hNhMNzGXBqx1mlNjawzBRFEIlTO+JpN64W6/hZ8jQ7J59d
mzpcEOA5Fh3YH58NLMGu9bcIz7XghdxYxI9lZBP7RiLvhXb/CkfrKN31h2mIgHk6
lSnWORw0W6gyaXid9PHSrHZt+TVnyMQrEIGFFX9GxCxwPvd2qUwTZwTgbuzv8hl/
fay1+PF3ePnsX45uFJrXWY5io8zoyo8QifvfsK2dlKmKIGZ3yc/Y4Mu+iA==
=iAkT
-----END PGP SIGNATURE-----

--O53LGZi3TWrAGmpbysmHBBZMaDm63MVAX--

--===============1342380878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1342380878==--
