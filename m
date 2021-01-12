Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402042F2BF7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 10:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC406E19A;
	Tue, 12 Jan 2021 09:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8A26E198;
 Tue, 12 Jan 2021 09:56:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12825AC8F;
 Tue, 12 Jan 2021 09:56:54 +0000 (UTC)
Subject: Re: [PATCH 1/6] drm: Inline AGP wrappers into their only callers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210112081035.6882-1-tzimmermann@suse.de>
 <20210112081035.6882-2-tzimmermann@suse.de>
 <X/1k30zps1I36JDd@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <db1ccba8-f890-cbd4-9417-19c71b3d5b5e@suse.de>
Date: Tue, 12 Jan 2021 10:56:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X/1k30zps1I36JDd@phenom.ffwll.local>
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
Cc: airlied@linux.ie, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1120733018=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1120733018==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="83R3OKgb5FUxLOaz6VORZZ5GnjHlGAqN4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--83R3OKgb5FUxLOaz6VORZZ5GnjHlGAqN4
Content-Type: multipart/mixed; boundary="cI19EithxEu2URgZY4x9nGfn1DKPa8HzC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Message-ID: <db1ccba8-f890-cbd4-9417-19c71b3d5b5e@suse.de>
Subject: Re: [PATCH 1/6] drm: Inline AGP wrappers into their only callers
References: <20210112081035.6882-1-tzimmermann@suse.de>
 <20210112081035.6882-2-tzimmermann@suse.de>
 <X/1k30zps1I36JDd@phenom.ffwll.local>
In-Reply-To: <X/1k30zps1I36JDd@phenom.ffwll.local>

--cI19EithxEu2URgZY4x9nGfn1DKPa8HzC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.01.21 um 09:59 schrieb Daniel Vetter:
> On Tue, Jan 12, 2021 at 09:10:30AM +0100, Thomas Zimmermann wrote:
>> The AGP wrapper functions serve no purpose.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> They do, without them we fail compiling (I think at least) when agp isn=
't

I thought so. But the only callers are in drm_agpsupport.c, which=20
depends on CONFIG_AGP in the Makefile. So I expected this to work.

Best regards
Thomas

> enabled. Did you check for that? I should all work if we have the dummy=

> inlines for relevant agp functions in linux/agp_backend.h.
> -Daniel
>=20
>> ---
>>   drivers/gpu/drm/drm_agpsupport.c | 12 ++++++------
>>   drivers/gpu/drm/drm_memory.c     | 18 ------------------
>>   include/drm/drm_agpsupport.h     | 18 ------------------
>>   3 files changed, 6 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_ag=
psupport.c
>> index 4c7ad46fdd21..8b690ef306de 100644
>> --- a/drivers/gpu/drm/drm_agpsupport.c
>> +++ b/drivers/gpu/drm/drm_agpsupport.c
>> @@ -285,7 +285,7 @@ int drm_agp_unbind(struct drm_device *dev, struct =
drm_agp_binding *request)
>>   	entry =3D drm_agp_lookup_entry(dev, request->handle);
>>   	if (!entry || !entry->bound)
>>   		return -EINVAL;
>> -	ret =3D drm_unbind_agp(entry->memory);
>> +	ret =3D agp_unbind_memory(entry->memory);
>>   	if (ret =3D=3D 0)
>>   		entry->bound =3D 0;
>>   	return ret;
>> @@ -326,7 +326,7 @@ int drm_agp_bind(struct drm_device *dev, struct dr=
m_agp_binding *request)
>>   	if (!entry || entry->bound)
>>   		return -EINVAL;
>>   	page =3D DIV_ROUND_UP(request->offset, PAGE_SIZE);
>> -	retcode =3D drm_bind_agp(entry->memory, page);
>> +	retcode =3D agp_bind_memory(entry->memory, page);
>>   	if (retcode)
>>   		return retcode;
>>   	entry->bound =3D dev->agp->base + (page << PAGE_SHIFT);
>> @@ -369,11 +369,11 @@ int drm_agp_free(struct drm_device *dev, struct =
drm_agp_buffer *request)
>>   	if (!entry)
>>   		return -EINVAL;
>>   	if (entry->bound)
>> -		drm_unbind_agp(entry->memory);
>> +		agp_unbind_memory(entry->memory);
>>  =20
>>   	list_del(&entry->head);
>>  =20
>> -	drm_free_agp(entry->memory, entry->pages);
>> +	agp_free_memory(entry->memory);
>>   	kfree(entry);
>>   	return 0;
>>   }
>> @@ -453,8 +453,8 @@ void drm_legacy_agp_clear(struct drm_device *dev)
>>  =20
>>   	list_for_each_entry_safe(entry, tempe, &dev->agp->memory, head) {
>>   		if (entry->bound)
>> -			drm_unbind_agp(entry->memory);
>> -		drm_free_agp(entry->memory, entry->pages);
>> +			agp_unbind_memory(entry->memory);
>> +		agp_free_memory(entry->memory);
>>   		kfree(entry);
>>   	}
>>   	INIT_LIST_HEAD(&dev->agp->memory);
>> diff --git a/drivers/gpu/drm/drm_memory.c b/drivers/gpu/drm/drm_memory=
=2Ec
>> index fbea69d6f909..f4f2bffdd5bd 100644
>> --- a/drivers/gpu/drm/drm_memory.c
>> +++ b/drivers/gpu/drm/drm_memory.c
>> @@ -100,24 +100,6 @@ static void *agp_remap(unsigned long offset, unsi=
gned long size,
>>   	return addr;
>>   }
>>  =20
>> -/** Wrapper around agp_free_memory() */
>> -void drm_free_agp(struct agp_memory *handle, int pages)
>> -{
>> -	agp_free_memory(handle);
>> -}
>> -
>> -/** Wrapper around agp_bind_memory() */
>> -int drm_bind_agp(struct agp_memory *handle, unsigned int start)
>> -{
>> -	return agp_bind_memory(handle, start);
>> -}
>> -
>> -/** Wrapper around agp_unbind_memory() */
>> -int drm_unbind_agp(struct agp_memory *handle)
>> -{
>> -	return agp_unbind_memory(handle);
>> -}
>> -
>>   #else /*  CONFIG_AGP  */
>>   static inline void *agp_remap(unsigned long offset, unsigned long si=
ze,
>>   			      struct drm_device *dev)
>> diff --git a/include/drm/drm_agpsupport.h b/include/drm/drm_agpsupport=
=2Eh
>> index 664e120b93e6..f3136750c490 100644
>> --- a/include/drm/drm_agpsupport.h
>> +++ b/include/drm/drm_agpsupport.h
>> @@ -28,10 +28,6 @@ struct drm_agp_head {
>>  =20
>>   #if IS_ENABLED(CONFIG_AGP)
>>  =20
>> -void drm_free_agp(struct agp_memory * handle, int pages);
>> -int drm_bind_agp(struct agp_memory * handle, unsigned int start);
>> -int drm_unbind_agp(struct agp_memory * handle);
>> -
>>   struct drm_agp_head *drm_agp_init(struct drm_device *dev);
>>   void drm_legacy_agp_clear(struct drm_device *dev);
>>   int drm_agp_acquire(struct drm_device *dev);
>> @@ -61,20 +57,6 @@ int drm_agp_bind_ioctl(struct drm_device *dev, void=
 *data,
>>  =20
>>   #else /* CONFIG_AGP */
>>  =20
>> -static inline void drm_free_agp(struct agp_memory * handle, int pages=
)
>> -{
>> -}
>> -
>> -static inline int drm_bind_agp(struct agp_memory * handle, unsigned i=
nt start)
>> -{
>> -	return -ENODEV;
>> -}
>> -
>> -static inline int drm_unbind_agp(struct agp_memory * handle)
>> -{
>> -	return -ENODEV;
>> -}
>> -
>>   static inline struct drm_agp_head *drm_agp_init(struct drm_device *d=
ev)
>>   {
>>   	return NULL;
>> --=20
>> 2.29.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cI19EithxEu2URgZY4x9nGfn1DKPa8HzC--

--83R3OKgb5FUxLOaz6VORZZ5GnjHlGAqN4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/9cmUFAwAAAAAACgkQlh/E3EQov+Cw
8RAAkQkY8jUNQLhTpSFrz6qvglx/NDLAq+LYk2/bIFvccH+f++ygmdMyG7J0AAcR3fpsTak6CxyV
AL+A6SW7S7NszfbupWstOSmKhm2ocQA1uchnLt+ATelhqizX+8XMiK0gKuckgN1MNodskd0kyWID
k8WiisxuCncuHwISC6fO5Rqsmc8wxTn7G6p1EaH6BX9H3NNhK4eVDLtqfpZzTzmiTCBPYz4uO/pO
Fyo6mmFIzqjKmuOxkeQpEp6LJIaNwxqp9dshLX8Ps94GOPKVgp9ThvZBkS1UpGAs3DLVvtRhYcIG
5PsF/29bMSGjR0Mj+eSGkTmxwEOgx3C0QKKptECo8bnBn0R3x9YHp+uLWzTkAc4pHNmOVkSsaayZ
H50rWqpMrSbkBfwwNq1F7PYk4iPm232gr0QX61eaf/KpJJeGob6GKriWg29epbiSvdRZMkYQ6ufe
wPgVqJiMYxmi7pWXwuLQfWeAEmwO99WphviKNBn1mYFX/1rmB6DOeoFHFmsr7UVz3L2NgpR5QBaV
t4pCsD2cl/gVhNuTG60BukGvNkiiyKrDTKFlQwAZedv8y5DaQYBhmB12Z/TnhUzoCU7RJmSsr+0N
jEmX1ZXp7BJ4AIsn3R5o7Yv3orCsQ3CLqm+cNsv4FTyVANuY2C2I204jtypaxCMqqRMLElmdsf2T
3Bc=
=Zmm3
-----END PGP SIGNATURE-----

--83R3OKgb5FUxLOaz6VORZZ5GnjHlGAqN4--

--===============1120733018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1120733018==--
