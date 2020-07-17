Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F822340B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 08:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A236E44D;
	Fri, 17 Jul 2020 06:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1A16E44D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 06:26:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5F56AC20;
 Fri, 17 Jul 2020 06:26:08 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/vram-helper: Set object function iff they are not
 provided by driver
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200714083238.28479-1-tzimmermann@suse.de>
 <20200714083238.28479-4-tzimmermann@suse.de>
 <20200716201137.GB2254583@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3033edf9-9be5-2c00-4f45-014dba53b17f@suse.de>
Date: Fri, 17 Jul 2020 08:26:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716201137.GB2254583@ravnborg.org>
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
Cc: airlied@linux.ie, jiayang5@huawei.com, dri-devel@lists.freedesktop.org,
 butterflyhuangxx@gmail.com
Content-Type: multipart/mixed; boundary="===============0837391726=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0837391726==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2tv3b3WAQeXTYgn3JJBGJg9j0IPNhNiFq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2tv3b3WAQeXTYgn3JJBGJg9j0IPNhNiFq
Content-Type: multipart/mixed; boundary="aSshCli58I1CzR5W9AIKozTew3qQxg7nF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: jiayang5@huawei.com, airlied@linux.ie, butterflyhuangxx@gmail.com,
 dri-devel@lists.freedesktop.org
Message-ID: <3033edf9-9be5-2c00-4f45-014dba53b17f@suse.de>
Subject: Re: [PATCH 3/3] drm/vram-helper: Set object function iff they are not
 provided by driver
References: <20200714083238.28479-1-tzimmermann@suse.de>
 <20200714083238.28479-4-tzimmermann@suse.de>
 <20200716201137.GB2254583@ravnborg.org>
In-Reply-To: <20200716201137.GB2254583@ravnborg.org>

--aSshCli58I1CzR5W9AIKozTew3qQxg7nF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 16.07.20 um 22:11 schrieb Sam Ravnborg:
> On Tue, Jul 14, 2020 at 10:32:38AM +0200, Thomas Zimmermann wrote:
>> Don't override the GEM object functions unconditionally. If the driver=

>> sets the GEM functions, VRAM helpers will now them. The idea has been
> s/now/own

Ooops, I forgot a word. This should have been 'will now use them'.

>> taken from SHMEM helpers. If drivers need special versions of some of
>> the GEM functions, they can now override them.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index af767d3da5da..7194144610cb 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -190,6 +190,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(st=
ruct drm_device *dev,
>>  						unsigned long pg_align)
>=20
> The documentation of drm_gem_vram_create() could really use some love
> here. It should document the behavior around gem_create_object(), and
> the default allocation of drm_gem_vram_object with no drm_gem_object
> assigned etc.

Sure

Best regards
Thomas

>=20
> 	Sam
>=20
>=20
>>  {
>>  	struct drm_gem_vram_object *gbo;
>> +	struct drm_gem_object *gem;
>>  	struct drm_vram_mm *vmm =3D dev->vram_mm;
>>  	struct ttm_bo_device *bdev;
>>  	int ret;
>> @@ -199,8 +200,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(st=
ruct drm_device *dev,
>>  		return ERR_PTR(-EINVAL);
>> =20
>>  	if (dev->driver->gem_create_object) {
>> -		struct drm_gem_object *gem =3D
>> -			dev->driver->gem_create_object(dev, size);
>> +		gem =3D dev->driver->gem_create_object(dev, size);
>>  		if (!gem)
>>  			return ERR_PTR(-ENOMEM);
>>  		gbo =3D drm_gem_vram_of_gem(gem);
>> @@ -208,11 +208,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(=
struct drm_device *dev,
>>  		gbo =3D kzalloc(sizeof(*gbo), GFP_KERNEL);
>>  		if (!gbo)
>>  			return ERR_PTR(-ENOMEM);
>> +		gem =3D &gbo->bo.base;
>>  	}
>> =20
>> -	gbo->bo.base.funcs =3D &drm_gem_vram_object_funcs;
>> +	if (!gem->funcs)
>> +		gem->funcs =3D &drm_gem_vram_object_funcs;
>> =20
>> -	ret =3D drm_gem_object_init(dev, &gbo->bo.base, size);
>> +	ret =3D drm_gem_object_init(dev, gem, size);
>>  	if (ret) {
>>  		kfree(gbo);
>>  		return ERR_PTR(ret);
>> --=20
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aSshCli58I1CzR5W9AIKozTew3qQxg7nF--

--2tv3b3WAQeXTYgn3JJBGJg9j0IPNhNiFq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8RRHsUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMSrAf/Ux3y6+Z66jFjh0Jk5mFltrDLjYOQ
MLQT3biCUURJTytTzwDgMXfceQEjHmfDkCwMCKSUQu/9fyTPONMrwYES3d6LANt0
HW+NMUsqsMtdOSVeq5l8R4GKaMvSfOz1IjHfQzIEEThdLzfc8V2QMTm8x22a4p4Z
Q0/Ma5qAzxlqEQbjxHCjmoyq20f7kaSV54eYi7uE/oDe1XG4ea5qoDnikSUtTLoB
dr3vK2kGklmcra0BHV2qjiRkv0wsxSNomGQiqms4kX3VqvKY84Wb34GS0RE3MTJ3
9gOgk23n8PLYM2VhD7uBHY1X9WGsObT7kRWOXcnu1vJ653TDf1dVuefcXg==
=B8eC
-----END PGP SIGNATURE-----

--2tv3b3WAQeXTYgn3JJBGJg9j0IPNhNiFq--

--===============0837391726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0837391726==--
