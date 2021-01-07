Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8531E2ECDC1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324376E28B;
	Thu,  7 Jan 2021 10:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7016E28B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:28:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41E9DACCF;
 Thu,  7 Jan 2021 10:28:05 +0000 (UTC)
Subject: Re: [PATCH v3 6/8] drm/shmem-helper: Provide a vmap function for
 short-term mappings
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-7-tzimmermann@suse.de>
 <20201211095016.GL401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e3b3062d-2fc6-4871-3562-5272188414dd@suse.de>
Date: Thu, 7 Jan 2021 11:28:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211095016.GL401619@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1513187012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1513187012==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="88KxvCruBJe8UE3M4G3C6cS55Ur55MMC6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--88KxvCruBJe8UE3M4G3C6cS55Ur55MMC6
Content-Type: multipart/mixed; boundary="Vsa6WbAzSSWCT5kLrdgOeayLJCwhV1wOB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: christian.koenig@amd.com, airlied@linux.ie, sumit.semwal@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kraxel@redhat.com,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org
Message-ID: <e3b3062d-2fc6-4871-3562-5272188414dd@suse.de>
Subject: Re: [PATCH v3 6/8] drm/shmem-helper: Provide a vmap function for
 short-term mappings
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-7-tzimmermann@suse.de>
 <20201211095016.GL401619@phenom.ffwll.local>
In-Reply-To: <20201211095016.GL401619@phenom.ffwll.local>

--Vsa6WbAzSSWCT5kLrdgOeayLJCwhV1wOB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Am 11.12.20 um 10:50 schrieb Daniel Vetter:
[...]
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
>=20
> This bites. You need to check for shmem->import_attach and call
> dma_buf_vmap_local directly here before you take any shmem helper locks=
=2E
> Real fix would be to replace both vmap_lock and pages_lock with dma_res=
v
> lock, but that's more work. Same for vunmap_local

This comment confuses me. AFAICT vmap_lock protects vmap_use_count. Why=20
does this exact code work in drm_gem_shmem_vmap() but not in _local() ?

Best regards
Thomas

>=20
> With that fixed on the helper part of this patch:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>=20
>> +	if (ret)
>> +		return ret;
>> +	ret =3D drm_gem_shmem_vmap_locked(shmem, map);
>> +	mutex_unlock(&shmem->vmap_lock);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_vmap_local);
>> +
>>   static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object =
*shmem,
>>   					struct dma_buf_map *map)
>>   {
>> @@ -366,7 +406,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm=
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
>> @@ -389,6 +429,33 @@ void drm_gem_shmem_vunmap(struct drm_gem_object *=
obj, struct dma_buf_map *map)
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
>> +	drm_gem_shmem_vunmap_locked(shmem, map);
>> +	mutex_unlock(&shmem->vmap_lock);
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_vunmap_local);
>> +
>>   struct drm_gem_shmem_object *
>>   drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
>>   				 struct drm_device *dev, size_t size,
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 1dfc42170059..a33e28d4c5e9 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -1552,22 +1552,32 @@ mgag200_handle_damage(struct mga_device *mdev,=
 struct drm_framebuffer *fb,
>>   		      struct drm_rect *clip)
>>   {
>>   	struct drm_device *dev =3D &mdev->base;
>> +	struct drm_gem_object *obj =3D fb->obj[0];
>>   	struct dma_buf_map map;
>>   	void *vmap;
>>   	int ret;
>>  =20
>> -	ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
>> +	ret =3D dma_resv_lock(obj->resv, NULL);
>>   	if (drm_WARN_ON(dev, ret))
>> -		return; /* BUG: SHMEM BO should always be vmapped */
>> +		return;
>> +	ret =3D drm_gem_shmem_vmap_local(obj, &map);
>> +	if (drm_WARN_ON(dev, ret))
>> +		goto err_dma_resv_unlock; /* BUG: SHMEM BO should always be vmapped=
 */
>>   	vmap =3D map.vaddr; /* TODO: Use mapping abstraction properly */
>>  =20
>>   	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
>>  =20
>> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
>> +	drm_gem_shmem_vunmap_local(obj, &map);
>> +	dma_resv_unlock(obj->resv);
>>  =20
>>   	/* Always scanout image at VRAM offset 0 */
>>   	mgag200_set_startadd(mdev, (u32)0);
>>   	mgag200_set_offset(mdev, fb);
>> +
>> +	return;
>> +
>> +err_dma_resv_unlock:
>> +	dma_resv_unlock(obj->resv);
>>   }
>>  =20
>>   static void
>> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirr=
us.c
>> index 561c49d8657a..58c694964148 100644
>> --- a/drivers/gpu/drm/tiny/cirrus.c
>> +++ b/drivers/gpu/drm/tiny/cirrus.c
>> @@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuf=
fer *fb,
>>   			       struct drm_rect *rect)
>>   {
>>   	struct cirrus_device *cirrus =3D to_cirrus(fb->dev);
>> +	struct drm_gem_object *obj =3D fb->obj[0];
>>   	struct dma_buf_map map;
>>   	void *vmap;
>>   	int idx, ret;
>> @@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebu=
ffer *fb,
>>   	if (!drm_dev_enter(&cirrus->dev, &idx))
>>   		goto out;
>>  =20
>> -	ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
>> +	ret =3D dma_resv_lock(obj->resv, NULL);
>>   	if (ret)
>>   		goto out_dev_exit;
>> +	ret =3D drm_gem_shmem_vmap_local(fb->obj[0], &map);
>> +	if (ret)
>> +		goto out_dma_resv_unlock;
>>   	vmap =3D map.vaddr; /* TODO: Use mapping abstraction properly */
>>  =20
>>   	if (cirrus->cpp =3D=3D fb->format->cpp[0])
>> @@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebu=
ffer *fb,
>>   	else
>>   		WARN_ON_ONCE("cpp mismatch");
>>  =20
>> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
>>   	ret =3D 0;
>>  =20
>> +	drm_gem_shmem_vunmap_local(obj, &map);
>> +out_dma_resv_unlock:
>> +	dma_resv_unlock(obj->resv);
>>   out_dev_exit:
>>   	drm_dev_exit(idx);
>>   out:
>> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm=
12u320.c
>> index 33f65f4626e5..b0c6e350f2b3 100644
>> --- a/drivers/gpu/drm/tiny/gm12u320.c
>> +++ b/drivers/gpu/drm/tiny/gm12u320.c
>> @@ -265,11 +265,16 @@ static void gm12u320_copy_fb_to_blocks(struct gm=
12u320_device *gm12u320)
>>   	y1 =3D gm12u320->fb_update.rect.y1;
>>   	y2 =3D gm12u320->fb_update.rect.y2;
>>  =20
>> -	ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
>> +	ret =3D dma_resv_lock(fb->obj[0]->resv, NULL);
>>   	if (ret) {
>> -		GM12U320_ERR("failed to vmap fb: %d\n", ret);
>> +		GM12U320_ERR("failed to reserve fb: %d\n", ret);
>>   		goto put_fb;
>>   	}
>> +	ret =3D drm_gem_shmem_vmap_local(fb->obj[0], &map);
>> +	if (ret) {
>> +		GM12U320_ERR("failed to vmap fb: %d\n", ret);
>> +		goto unlock_resv;
>> +	}
>>   	vaddr =3D map.vaddr; /* TODO: Use mapping abstraction properly */
>>  =20
>>   	if (fb->obj[0]->import_attach) {
>> @@ -321,8 +326,11 @@ static void gm12u320_copy_fb_to_blocks(struct gm1=
2u320_device *gm12u320)
>>   		if (ret)
>>   			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
>>   	}
>> +
>> +unlock_resv:
>> +	dma_resv_unlock(fb->obj[0]->resv);
>>   vunmap:
>> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
>> +	drm_gem_shmem_vunmap_local(fb->obj[0], &map);
>>   put_fb:
>>   	drm_framebuffer_put(fb);
>>   	gm12u320->fb_update.fb =3D NULL;
>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/u=
dl_modeset.c
>> index 9d34ec9d03f6..46b55b4d03c2 100644
>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>> @@ -290,14 +290,18 @@ static int udl_handle_damage(struct drm_framebuf=
fer *fb, int x, int y,
>>   	else if ((clip.x2 > fb->width) || (clip.y2 > fb->height))
>>   		return -EINVAL;
>>  =20
>> +	ret =3D dma_resv_lock(fb->obj[0]->resv, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>>   	if (import_attach) {
>>   		ret =3D dma_buf_begin_cpu_access(import_attach->dmabuf,
>>   					       DMA_FROM_DEVICE);
>>   		if (ret)
>> -			return ret;
>> +			goto out_dma_resv_unlock;
>>   	}
>>  =20
>> -	ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
>> +	ret =3D drm_gem_shmem_vmap_local(fb->obj[0], &map);
>>   	if (ret) {
>>   		DRM_ERROR("failed to vmap fb\n");
>>   		goto out_dma_buf_end_cpu_access;
>> @@ -307,7 +311,7 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
>>   	urb =3D udl_get_urb(dev);
>>   	if (!urb) {
>>   		ret =3D -ENOMEM;
>> -		goto out_drm_gem_shmem_vunmap;
>> +		goto out_drm_gem_shmem_vunmap_local;
>>   	}
>>   	cmd =3D urb->transfer_buffer;
>>  =20
>> @@ -320,7 +324,7 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
>>   				       &cmd, byte_offset, dev_byte_offset,
>>   				       byte_width);
>>   		if (ret)
>> -			goto out_drm_gem_shmem_vunmap;
>> +			goto out_drm_gem_shmem_vunmap_local;
>>   	}
>>  =20
>>   	if (cmd > (char *)urb->transfer_buffer) {
>> @@ -336,8 +340,8 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
>>  =20
>>   	ret =3D 0;
>>  =20
>> -out_drm_gem_shmem_vunmap:
>> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
>> +out_drm_gem_shmem_vunmap_local:
>> +	drm_gem_shmem_vunmap_local(fb->obj[0], &map);
>>   out_dma_buf_end_cpu_access:
>>   	if (import_attach) {
>>   		tmp_ret =3D dma_buf_end_cpu_access(import_attach->dmabuf,
>> @@ -345,6 +349,8 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
>>   		if (tmp_ret && !ret)
>>   			ret =3D tmp_ret; /* only update ret if not set yet */
>>   	}
>> +out_dma_resv_unlock:
>> +	dma_resv_unlock(fb->obj[0]->resv);
>>  =20
>>   	return ret;
>>   }
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


--Vsa6WbAzSSWCT5kLrdgOeayLJCwhV1wOB--

--88KxvCruBJe8UE3M4G3C6cS55Ur55MMC6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/24jMFAwAAAAAACgkQlh/E3EQov+Bt
SQ//Tmvbnqo06avawZAo53Iy6eHT5YE97d7e/vHd02N6MvwRiOcBd2r2vArAE/4Zdq+1lG3NieTT
W6s22UUsVtUE6B5nm4IzInTLbweMioJ0xvttSH+JDfJ1hZO9G1/EebLsKcP3hSR87vCf5JfDXROs
Gj/nBPvN4tEGaanUTbvVn5k+Kfb13ZUuYSwYqHpWf5Azrr/34aF1tHsrfCgugx8n81dGKJ/NPWG7
x7GqNRxaRlkZfTg6apSu9PG1TRZfXXH7yQIpj9U45ILEDdsidS/cw+TWCEknRGSnu/J7zEYanGdc
k5u6uKy7otLIqV7G0P5cI8mCy1nj8BgozF1OvfIN/GiZygRSVzpaCjM4YOibuv0TmYWbS3PL55i8
9K/eZ/D20O7uToQWMzPyzTyUTLpI4lgCgTahEc1+GMKPkmqEin5ceRAwwBGpuwh96/B0H8RF4SGO
Ei1AGqnnHcLCTyxntAp0SFtRGZ6QBTAbnR0G8taThrVU1VmAA04sBMJBPBvKItv5A3RKeR0aMjVw
aEn4iCEo/7OkoCHuhUROOjUwLaSTGt6KDQMC4jFBDTcD28yXaLk5hM5qv3ghXtaFSQym1X3jAa1e
IXbl4epC/9R2/SqKmieWnXRSzHRjcv87NOsV6e+Q7gdGGIn1nq36W8Tt46/E6VSCktB6wN50zCBF
27Q=
=wiY/
-----END PGP SIGNATURE-----

--88KxvCruBJe8UE3M4G3C6cS55Ur55MMC6--

--===============1513187012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1513187012==--
