Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D52D73AB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BAA6ED42;
	Fri, 11 Dec 2020 10:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C0D6ED64
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:16:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2738AC10;
 Fri, 11 Dec 2020 10:16:26 +0000 (UTC)
Subject: Re: [PATCH v3 8/8] drm/fb-helper: Move BO locking from DRM client to
 fbdev damage worker
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-9-tzimmermann@suse.de>
 <20201211100134.GN401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e1b4d35a-f624-bca2-cd12-ca6dbaf860d1@suse.de>
Date: Fri, 11 Dec 2020 11:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211100134.GN401619@phenom.ffwll.local>
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
Cc: airlied@linux.ie, sean@poorly.run, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, kraxel@redhat.com, sam@ravnborg.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0505478568=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0505478568==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SjVwQ8ymHuMOUUVTrEN95juI6Y70IsD7Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SjVwQ8ymHuMOUUVTrEN95juI6Y70IsD7Q
Content-Type: multipart/mixed; boundary="9O3Hm3aaHpTi0E7OCX3m926eejB6HYYq9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Message-ID: <e1b4d35a-f624-bca2-cd12-ca6dbaf860d1@suse.de>
Subject: Re: [PATCH v3 8/8] drm/fb-helper: Move BO locking from DRM client to
 fbdev damage worker
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-9-tzimmermann@suse.de>
 <20201211100134.GN401619@phenom.ffwll.local>
In-Reply-To: <20201211100134.GN401619@phenom.ffwll.local>

--9O3Hm3aaHpTi0E7OCX3m926eejB6HYYq9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.12.20 um 11:01 schrieb Daniel Vetter:
> On Wed, Dec 09, 2020 at 03:25:27PM +0100, Thomas Zimmermann wrote:
>> Fbdev emulation has to lock the BO into place while flushing the shado=
w
>> buffer into the BO's memory. Remove any interference with pinning by
>> using vmap_local functionality (instead of full vmap). This requires
>> BO reservation locking in fbdev's damage worker.
>>
>> The new DRM client functions for locking and vmap_local functionality
>> are added for consistency with the existing style.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> The old vmap/vunmap in the client library aren't used anymore, please
> delete. That will also make it clearer in the diff what's going on and
> that it makes sense to have the client and fb-helper part in one patch.=


They are still around for perma-mapped BOs where HW supports it (really=20
only CMA-based drivers). See drm_fb_helper_generic_probe() and=20
drm_fbdev_cleanup().

Best regards
Thomas

>=20
> With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>> ---
>>   drivers/gpu/drm/drm_client.c    | 91 +++++++++++++++++++++++++++++++=
++
>>   drivers/gpu/drm/drm_fb_helper.c | 41 +++++++--------
>>   include/drm/drm_client.h        |  4 ++
>>   3 files changed, 116 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client=
=2Ec
>> index ce45e380f4a2..795f5cb052ba 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -288,6 +288,37 @@ drm_client_buffer_create(struct drm_client_dev *c=
lient, u32 width, u32 height, u
>>   	return ERR_PTR(ret);
>>   }
>>  =20
>> +/**
>> + * drm_client_buffer_lock - Locks the DRM client buffer
>> + * @buffer: DRM client buffer
>> + *
>> + * This function locks the client buffer by acquiring the buffer
>> + * object's reservation lock.
>> + *
>> + * Unlock the buffer with drm_client_buffer_unlock().
>> + *
>> + * Returns:
>> + *	0 on success, or a negative errno code otherwise.
>> + */
>> +int
>> +drm_client_buffer_lock(struct drm_client_buffer *buffer)
>> +{
>> +	return dma_resv_lock(buffer->gem->resv, NULL);
>> +}
>> +EXPORT_SYMBOL(drm_client_buffer_lock);
>> +
>> +/**
>> + * drm_client_buffer_unlock - Unlock DRM client buffer
>> + * @buffer: DRM client buffer
>> + *
>> + * Unlocks a client buffer. See drm_client_buffer_lock().
>> + */
>> +void drm_client_buffer_unlock(struct drm_client_buffer *buffer)
>> +{
>> +	dma_resv_unlock(buffer->gem->resv);
>> +}
>> +EXPORT_SYMBOL(drm_client_buffer_unlock);
>> +
>>   /**
>>    * drm_client_buffer_vmap - Map DRM client buffer into address space=

>>    * @buffer: DRM client buffer
>> @@ -348,6 +379,66 @@ void drm_client_buffer_vunmap(struct drm_client_b=
uffer *buffer)
>>   }
>>   EXPORT_SYMBOL(drm_client_buffer_vunmap);
>>  =20
>> +/**
>> + * drm_client_buffer_vmap_local - Map DRM client buffer into address =
space
>> + * @buffer: DRM client buffer
>> + * @map_copy: Returns the mapped memory's address
>> + *
>> + * This function maps a client buffer into kernel address space. If t=
he
>> + * buffer is already mapped, it returns the existing mapping's addres=
s.
>> + *
>> + * Client buffer mappings are not ref'counted. Each call to
>> + * drm_client_buffer_vmap_local() should be followed by a call to
>> + * drm_client_buffer_vunmap_local(); or the client buffer should be m=
apped
>> + * throughout its lifetime.
>> + *
>> + * The returned address is a copy of the internal value. In contrast =
to
>> + * other vmap interfaces, you don't need it for the client's vunmap
>> + * function. So you can modify it at will during blit and draw operat=
ions.
>> + *
>> + * Returns:
>> + *	0 on success, or a negative errno code otherwise.
>> + */
>> +int
>> +drm_client_buffer_vmap_local(struct drm_client_buffer *buffer, struct=
 dma_buf_map *map_copy)
>> +{
>> +	struct dma_buf_map *map =3D &buffer->map;
>> +	int ret;
>> +
>> +	/*
>> +	 * FIXME: The dependency on GEM here isn't required, we could
>> +	 * convert the driver handle to a dma-buf instead and use the
>> +	 * backend-agnostic dma-buf vmap_local support instead. This would
>> +	 * require that the handle2fd prime ioctl is reworked to pull the
>> +	 * fd_install step out of the driver backend hooks, to make that
>> +	 * final step optional for internal users.
>> +	 */
>> +	ret =3D drm_gem_vmap_local(buffer->gem, map);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*map_copy =3D *map;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_client_buffer_vmap_local);
>> +
>> +/**
>> + * drm_client_buffer_vunmap_local - Unmap DRM client buffer
>> + * @buffer: DRM client buffer
>> + *
>> + * This function removes a client buffer's memory mapping. Calling th=
is
>> + * function is only required by clients that manage their buffer mapp=
ings
>> + * by themselves.
>> + */
>> +void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)=

>> +{
>> +	struct dma_buf_map *map =3D &buffer->map;
>> +
>> +	drm_gem_vunmap_local(buffer->gem, map);
>> +}
>> +EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
>> +
>>   static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)=

>>   {
>>   	int ret;
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
>> index e82db0f4e771..a56a7d9f7e35 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -399,28 +399,34 @@ static int drm_fb_helper_damage_blit(struct drm_=
fb_helper *fb_helper,
>>   	int ret;
>>  =20
>>   	/*
>> -	 * We have to pin the client buffer to its current location while
>> -	 * flushing the shadow buffer. In the general case, concurrent
>> -	 * modesetting operations could try to move the buffer and would
>> -	 * fail. The modeset has to be serialized by acquiring the reservati=
on
>> -	 * object of the underlying BO here.
>> -	 *
>>   	 * For fbdev emulation, we only have to protect against fbdev modes=
et
>>   	 * operations. Nothing else will involve the client buffer's BO. So=
 it
>>   	 * is sufficient to acquire struct drm_fb_helper.lock here.
>>   	 */
>>   	mutex_lock(&fb_helper->lock);
>>  =20
>> -	ret =3D drm_client_buffer_vmap(buffer, &map);
>> +	/*
>> +	 * We have to keep the client buffer at its current location while
>> +	 * flushing the shadow buffer. Concurrent operations could otherwise=

>> +	 * try to move the buffer. Therefore acquiring the reservation
>> +	 * object of the underlying BO here.
>> +	 */
>> +	ret =3D drm_client_buffer_lock(buffer);
>> +	if (ret)
>> +		goto out_mutex_unlock;
>> +
>> +	ret =3D drm_client_buffer_vmap_local(buffer, &map);
>>   	if (ret)
>> -		goto out;
>> +		goto out_drm_client_buffer_unlock;
>>  =20
>>   	dst =3D map;
>>   	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
>>  =20
>> -	drm_client_buffer_vunmap(buffer);
>> +	drm_client_buffer_vunmap_local(buffer);
>>  =20
>> -out:
>> +out_drm_client_buffer_unlock:
>> +	drm_client_buffer_unlock(buffer);
>> +out_mutex_unlock:
>>   	mutex_unlock(&fb_helper->lock);
>>  =20
>>   	return ret;
>> @@ -946,15 +952,11 @@ static int setcmap_legacy(struct fb_cmap *cmap, =
struct fb_info *info)
>>   	drm_modeset_lock_all(fb_helper->dev);
>>   	drm_client_for_each_modeset(modeset, &fb_helper->client) {
>>   		crtc =3D modeset->crtc;
>> -		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
>> -			ret =3D -EINVAL;
>> -			goto out;
>> -		}
>> +		if (!crtc->funcs->gamma_set || !crtc->gamma_size)
>> +			return -EINVAL;
>>  =20
>> -		if (cmap->start + cmap->len > crtc->gamma_size) {
>> -			ret =3D -EINVAL;
>> -			goto out;
>> -		}
>> +		if (cmap->start + cmap->len > crtc->gamma_size)
>> +			return -EINVAL;
>>  =20
>>   		r =3D crtc->gamma_store;
>>   		g =3D r + crtc->gamma_size;
>> @@ -967,9 +969,8 @@ static int setcmap_legacy(struct fb_cmap *cmap, st=
ruct fb_info *info)
>>   		ret =3D crtc->funcs->gamma_set(crtc, r, g, b,
>>   					     crtc->gamma_size, NULL);
>>   		if (ret)
>> -			goto out;
>> +			return ret;
>>   	}
>> -out:
>>   	drm_modeset_unlock_all(fb_helper->dev);
>>  =20
>>   	return ret;
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index f07f2fb02e75..df61e339a11c 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -156,8 +156,12 @@ struct drm_client_buffer *
>>   drm_client_framebuffer_create(struct drm_client_dev *client, u32 wid=
th, u32 height, u32 format);
>>   void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)=
;
>>   int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, s=
truct drm_rect *rect);
>> +int drm_client_buffer_lock(struct drm_client_buffer *buffer);
>> +void drm_client_buffer_unlock(struct drm_client_buffer *buffer);
>>   int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct =
dma_buf_map *map);
>>   void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>> +int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer, st=
ruct dma_buf_map *map);
>> +void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)=
;
>>  =20
>>   int drm_client_modeset_create(struct drm_client_dev *client);
>>   void drm_client_modeset_free(struct drm_client_dev *client);
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


--9O3Hm3aaHpTi0E7OCX3m926eejB6HYYq9--

--SjVwQ8ymHuMOUUVTrEN95juI6Y70IsD7Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/TRvkFAwAAAAAACgkQlh/E3EQov+CG
sA/9FVMu9RPjSQpSfEPDiUY0df7CxRtqEaWtw7ct1jUvSZ7AMmrq4YJqplpiPfLeSn5Z2atgPeoK
ys1KO5ykMW2kJBaflstv7Xq/fSuE+b+OkvdeMc3wzJ/d63If4LVd5ZOYI7rr9e9L9DE/YqD1Kj2e
OK3M09enS1m7Ax9KsquyE+WD9th5m3QlJWVLUMEVn0qh8M/aJvuEsvectm+EVF5QdMQimqz21KjJ
cYtRZ7guTn/NZz3ScUfgY85WirZUr4/jXRe+Y0Gc3hwewmFt8VbGqZvejuq1ANDbpGTxpcRgi5hT
pnL1WslT0dRWsz6mWIz1HtLDzlSmqOprXToTDArv0PGtlnjYO+H7ueoGZy44ZVSNqBA1/6j93kXJ
5jkyFwrKld0yxfMXZ3HgVxeLOExbytKT/UQ4lSv/r1XrGjeJrWzOphoWfdUAenZOT4S05G544X19
I5YSla1GPoqm0OtmpE5uhv+mKi5by7w3tHqHiFlKpkkkUG1bWjUsjMHsHPdqiJlh+ifO0fTH7CTR
HrKMJe+1SPMwdx2a1RrnS16/kYM5ssruBunM+oZpK2YiyICetCr2MGd+n/OjfpTPxN/WK0cDFbLI
cNYfWe91OrlTJImLOvwntRyR8Pi0DtKcY+vPws3ASTmMYp3UpaaqX+zCowo6grlT88L6c8TKPR0T
AaE=
=vs4B
-----END PGP SIGNATURE-----

--SjVwQ8ymHuMOUUVTrEN95juI6Y70IsD7Q--

--===============0505478568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0505478568==--
