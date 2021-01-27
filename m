Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE762305AD9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B646E7D1;
	Wed, 27 Jan 2021 12:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3A789ABA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:08:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ADD03AC9B;
 Wed, 27 Jan 2021 12:08:06 +0000 (UTC)
Subject: Re: [PATCH v4 04/13] drm/shmem-helper: Provide a vmap function for
 short-term mappings
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-5-tzimmermann@suse.de>
 <X/yB3LC79f/zWTwG@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <006b7d47-e7dd-8fa6-6cf1-eff194d7b30f@suse.de>
Date: Wed, 27 Jan 2021 13:08:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <X/yB3LC79f/zWTwG@phenom.ffwll.local>
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0964530691=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0964530691==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tRlTM4HNzrgFrkMWIRsGqWWdQVVBk3euU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tRlTM4HNzrgFrkMWIRsGqWWdQVVBk3euU
Content-Type: multipart/mixed; boundary="upjnMjSq5bX9GpDTGFit6wkgbrPPC1F2R";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, kraxel@redhat.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 linux-media@vger.kernel.org
Message-ID: <006b7d47-e7dd-8fa6-6cf1-eff194d7b30f@suse.de>
Subject: Re: [PATCH v4 04/13] drm/shmem-helper: Provide a vmap function for
 short-term mappings
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-5-tzimmermann@suse.de>
 <X/yB3LC79f/zWTwG@phenom.ffwll.local>
In-Reply-To: <X/yB3LC79f/zWTwG@phenom.ffwll.local>

--upjnMjSq5bX9GpDTGFit6wkgbrPPC1F2R
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.01.21 um 17:50 schrieb Daniel Vetter:
> On Fri, Jan 08, 2021 at 10:43:31AM +0100, Thomas Zimmermann wrote:
>> Implementations of the vmap/vunmap GEM callbacks may perform pinning
>> of the BO and may acquire the associated reservation object's lock.
>> Callers that only require a mapping of the contained memory can thus
>> interfere with other tasks that require exact pinning, such as scanout=
=2E
>> This is less of an issue with private SHMEM buffers, but may happen
>> with imported ones.
>>
>> Therefore provide the new interfaces drm_gem_shmem_vmap_local() and
>> drm_gem_shmem_vunmap_local(), which only perform the vmap/vunmap
>> operations. Callers have to hold the reservation lock while the mappin=
g
>> persists.
>>
>> This patch also connects GEM SHMEM helpers to GEM object functions wit=
h
>> equivalent functionality.
>>
>> v4:
>> 	* call dma_buf_{vmap,vunmap}_local() where necessary (Daniel)
>> 	* move driver changes into separate patches (Daniel)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 90 +++++++++++++++++++++++-=
--
>>   include/drm/drm_gem_shmem_helper.h     |  2 +
>>   2 files changed, 84 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/=
drm_gem_shmem_helper.c
>> index 9825c378dfa6..298832b2b43b 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -32,6 +32,8 @@ static const struct drm_gem_object_funcs drm_gem_shm=
em_funcs =3D {
>>   	.get_sg_table =3D drm_gem_shmem_get_sg_table,
>>   	.vmap =3D drm_gem_shmem_vmap,
>>   	.vunmap =3D drm_gem_shmem_vunmap,
>> +	.vmap_local =3D drm_gem_shmem_vmap_local,
>> +	.vunmap_local =3D drm_gem_shmem_vunmap_local,
>>   	.mmap =3D drm_gem_shmem_mmap,
>>   };
>>  =20
>> @@ -261,7 +263,8 @@ void drm_gem_shmem_unpin(struct drm_gem_object *ob=
j)
>>   }
>>   EXPORT_SYMBOL(drm_gem_shmem_unpin);
>>  =20
>> -static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shm=
em, struct dma_buf_map *map)
>> +static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shm=
em, struct dma_buf_map *map,
>> +				     bool local)
>=20
> This is a bit spaghetti and also has the problem that we're not changin=
g
> shmem->vmap_use_count under different locks, depending upon which path
> we're taking.
>=20
> I think the cleanest would be if we pull the if (import_attach) case ou=
t
> of the _locked() version completely, for all cases, and also outside of=

> the shmem->vmap_lock. This means no caching of vmaps in the shmem layer=

> anymore for imported buffers, but this is no longer a problem: We cache=

> them in the exporters instead (I think at least, if not maybe need to f=
ix
> that where it's expensive).

There's no vmap refcounting in amdgpu AFAICT. So importing pages from=20
there into an SHMEM object has the potential of breaking. IIRC same fro=20
radeon and nouveau.

So I'm somewhat reluctant to making this change. I guess I'll look=20
elsewhere first to fix some of the locking issues (e.g., my recent ast=20
cursor patches).

Best regards
Thomas

>=20
> Other option would be to unly pull it out for the _vmap_local case, but=

> that's a bit ugly because no longer symmetrical in the various paths.
>=20
>>   {
>>   	struct drm_gem_object *obj =3D &shmem->base;
>>   	int ret =3D 0;
>> @@ -272,7 +275,10 @@ static int drm_gem_shmem_vmap_locked(struct drm_g=
em_shmem_object *shmem, struct
>>   	}
>>  =20
>>   	if (obj->import_attach) {
>> -		ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
>> +		if (local)
>> +			ret =3D dma_buf_vmap_local(obj->import_attach->dmabuf, map);
>> +		else
>> +			ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
>>   		if (!ret) {
>>   			if (WARN_ON(map->is_iomem)) {
>>   				ret =3D -EIO;
>> @@ -313,7 +319,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_ge=
m_shmem_object *shmem, struct
>>   	return ret;
>>   }
>>  =20
>> -/*
>> +/**
>>    * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM obj=
ect
>>    * @shmem: shmem GEM object
>>    * @map: Returns the kernel virtual address of the SHMEM GEM object'=
s backing
>> @@ -339,15 +345,53 @@ int drm_gem_shmem_vmap(struct drm_gem_object *ob=
j, struct dma_buf_map *map)
>>   	ret =3D mutex_lock_interruptible(&shmem->vmap_lock);
>>   	if (ret)
>>   		return ret;
>> -	ret =3D drm_gem_shmem_vmap_locked(shmem, map);
>> +	ret =3D drm_gem_shmem_vmap_locked(shmem, map, false);
>>   	mutex_unlock(&shmem->vmap_lock);
>>  =20
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_gem_shmem_vmap);
>>  =20
>> +/**
>> + * drm_gem_shmem_vmap_local - Create a virtual mapping for a shmem GE=
M object
>> + * @shmem: shmem GEM object
>> + * @map: Returns the kernel virtual address of the SHMEM GEM object's=
 backing
>> + *       store.
>> + *
>> + * This function makes sure that a contiguous kernel virtual address =
mapping
>> + * exists for the buffer backing the shmem GEM object.
>> + *
>> + * The function is called with the BO's reservation object locked. Ca=
llers must
>> + * hold the lock until after unmapping the buffer.
>> + *
>> + * This function can be used to implement &drm_gem_object_funcs.vmap_=
local. But
>> + * it can also be called by drivers directly, in which case it will h=
ide the
>> + * differences between dma-buf imported and natively allocated object=
s.
>=20
> So for the other callbacks I tried to make sure we have different entry=

> points for this, since it's not really the same thing and because of th=
e
> locking mess we have with dma_resv_lock vs various pre-existing local
> locking scheme, it's easy to get a mess.
>=20
> I think the super clean version here would be to also export just the
> internal stuff for the ->v(un)map_local hooks, but that's maybe a bit t=
oo
> much boilerplate for no real gain.
> -Daniel
>=20
>> + *
>> + * Acquired mappings should be cleaned up by calling drm_gem_shmem_vu=
nmap_local().
>> + *
>> + * Returns:
>> + * 0 on success or a negative error code on failure.
>> + */
>> +int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_b=
uf_map *map)
>> +{
>> +	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
>> +	int ret;
>> +
>> +	dma_resv_assert_held(obj->resv);
>> +
>> +	ret =3D mutex_lock_interruptible(&shmem->vmap_lock);
>> +	if (ret)
>> +		return ret;
>> +	ret =3D drm_gem_shmem_vmap_locked(shmem, map, true);
>> +	mutex_unlock(&shmem->vmap_lock);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_vmap_local);
>> +
>>   static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object =
*shmem,
>> -					struct dma_buf_map *map)
>> +					struct dma_buf_map *map, bool local)
>>   {
>>   	struct drm_gem_object *obj =3D &shmem->base;
>>  =20
>> @@ -358,7 +402,10 @@ static void drm_gem_shmem_vunmap_locked(struct dr=
m_gem_shmem_object *shmem,
>>   		return;
>>  =20
>>   	if (obj->import_attach)
>> -		dma_buf_vunmap(obj->import_attach->dmabuf, map);
>> +		if (local)
>> +			dma_buf_vunmap_local(obj->import_attach->dmabuf, map);
>> +		else
>> +			dma_buf_vunmap(obj->import_attach->dmabuf, map);
>>   	else
>>   		vunmap(shmem->vaddr);
>>  =20
>> @@ -366,7 +413,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm=
_gem_shmem_object *shmem,
>>   	drm_gem_shmem_put_pages(shmem);
>>   }
>>  =20
>> -/*
>> +/**
>>    * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM obj=
ect
>>    * @shmem: shmem GEM object
>>    * @map: Kernel virtual address where the SHMEM GEM object was mappe=
d
>> @@ -384,11 +431,38 @@ void drm_gem_shmem_vunmap(struct drm_gem_object =
*obj, struct dma_buf_map *map)
>>   	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
>>  =20
>>   	mutex_lock(&shmem->vmap_lock);
>> -	drm_gem_shmem_vunmap_locked(shmem, map);
>> +	drm_gem_shmem_vunmap_locked(shmem, map, false);
>>   	mutex_unlock(&shmem->vmap_lock);
>>   }
>>   EXPORT_SYMBOL(drm_gem_shmem_vunmap);
>>  =20
>> +/**
>> + * drm_gem_shmem_vunmap_local - Unmap a virtual mapping fo a shmem GE=
M object
>> + * @shmem: shmem GEM object
>> + * @map: Kernel virtual address where the SHMEM GEM object was mapped=

>> + *
>> + * This function cleans up a kernel virtual address mapping acquired =
by
>> + * drm_gem_shmem_vmap_local(). The mapping is only removed when the u=
se count
>> + * drops to zero.
>> + *
>> + * The function is called with the BO's reservation object locked.
>> + *
>> + * This function can be used to implement &drm_gem_object_funcs.vmap_=
local.
>> + * But it can also be called by drivers directly, in which case it wi=
ll hide
>> + * the differences between dma-buf imported and natively allocated ob=
jects.
>> + */
>> +void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dm=
a_buf_map *map)
>> +{
>> +	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
>> +
>> +	dma_resv_assert_held(obj->resv);
>> +
>> +	mutex_lock(&shmem->vmap_lock);
>> +	drm_gem_shmem_vunmap_locked(shmem, map, true);
>> +	mutex_unlock(&shmem->vmap_lock);
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_vunmap_local);
>> +
>>   struct drm_gem_shmem_object *
>>   drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
>>   				 struct drm_device *dev, size_t size,
>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_=
shmem_helper.h
>> index 434328d8a0d9..3f59bdf749aa 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -114,7 +114,9 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_=
object *shmem);
>>   int drm_gem_shmem_pin(struct drm_gem_object *obj);
>>   void drm_gem_shmem_unpin(struct drm_gem_object *obj);
>>   int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_ma=
p *map);
>> +int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_b=
uf_map *map);
>>   void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf=
_map *map);
>> +void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dm=
a_buf_map *map);
>>  =20
>>   int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
>>  =20
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


--upjnMjSq5bX9GpDTGFit6wkgbrPPC1F2R--

--tRlTM4HNzrgFrkMWIRsGqWWdQVVBk3euU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmARV6UFAwAAAAAACgkQlh/E3EQov+CQ
IxAArVKjavIQkE79NPzk+4QLlvTyQYI4dq9H7cIRF6svN5vwwWuykUf+jUqEnpgk5wQJdCxb9fzu
HvxKDh1sMA1uzuIxuHyI3TJSus8ry87d1o+DyXjf/kL+IK8Yb1SagLWYARBIKW1T7UiHoYY+xRH7
3YtqtTbhPHcbMaOcUhgxi2lNQiI9tIibZ/2H7IAtX6w6TGKlOBbEHDHuASwYANg90KNXTEHd96Rj
5O67HhP7RHgwmIOW68Jh+XIQGAoBFqhYgMJgsMxrx1IUaxgN40tvm4w2xYklXPjqO8ND8KgsvF4P
6znmUmVpUnuRRKORYIUB0AXmzGEurE7C337MebDOTxJOkmURk5NHYIIVIMsRWt9cJVj3oX/vHEqV
d/ExWXcsXZQpuGXk8XTGRy5sz5Mf4wC4jUQ93wdOX8UUF1WiQcoWfw2SrAHMkFIXs77ClWftfJeK
ry3C+qYopYGFTin+KRahZtcwpohhCOeGzAjavucxNjEqrkxA7r/IzOlJJAX0UXzDrcn3aET8e0qy
xvSp8SJWYF2m6UczwhrdhrxoSrIYV1e5DIh8KrWtKPtVdpfWb6dlZTY8Z92TVTa4iP2IwUyjKFqL
GYrccYjUVJt23/guXcYj1xyeHAcQ+UNON3exOHKmyirp0m8jQytEi74p7ELMlRGWYUywHuSmOcsh
BlM=
=9bMm
-----END PGP SIGNATURE-----

--tRlTM4HNzrgFrkMWIRsGqWWdQVVBk3euU--

--===============0964530691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0964530691==--
