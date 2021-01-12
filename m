Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CAA2F2940
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CFE88E4D;
	Tue, 12 Jan 2021 07:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2966A88E4D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 07:54:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD129AC8F;
 Tue, 12 Jan 2021 07:54:03 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-12-tzimmermann@suse.de>
 <X/yFj9zIdW52UKk4@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in
 cursor update
Message-ID: <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
Date: Tue, 12 Jan 2021 08:54:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X/yFj9zIdW52UKk4@phenom.ffwll.local>
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
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 airlied@redhat.com, virtualization@lists.linux-foundation.org, sean@poorly.run,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1080680951=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1080680951==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fr9R9evr0luTzgmklT8KDcbSQUGqt97Kq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fr9R9evr0luTzgmklT8KDcbSQUGqt97Kq
Content-Type: multipart/mixed; boundary="U5F6Qhzznh14i5jrMNqGuORkmSSSTnYpz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kraxel@redhat.com,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net, sam@ravnborg.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org
Message-ID: <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
Subject: Re: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in
 cursor update
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-12-tzimmermann@suse.de>
 <X/yFj9zIdW52UKk4@phenom.ffwll.local>
In-Reply-To: <X/yFj9zIdW52UKk4@phenom.ffwll.local>

--U5F6Qhzznh14i5jrMNqGuORkmSSSTnYpz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.01.21 um 18:06 schrieb Daniel Vetter:
> On Fri, Jan 08, 2021 at 10:43:38AM +0100, Thomas Zimmermann wrote:
>> Cursor updates in vboxvideo require a short-term mapping of the
>> source BO. Use drm_gem_vram_vmap_local() and avoid the pinning
>> operations.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> All these drivers patches break the dma_resv_lock vs
> dma_fence_begin/end_signalling nesting rules, so this doesn't work.
>=20
> Generally this is what the prepare/cleanup_fb hooks are for, that's whe=
re
> mappings (including vmaps) are meant to be set up, permanently.
>=20
> I'm kinda not clear on why we need all these changes, I thought the
> locking problem is just in the fb helper paths, because it's outside of=

> the atomic path and could conflict with an atomic update at the same ti=
me?
> So only that one should get the vmap_local treatment, everything else
> should keep the normal vmap treatment.

Kind of responding to all your comment on the driver changes:

These drivers only require short-term mappings, so using vmap_local=20
would be the natural choice. For SHMEM helpers, it's mostly a cosmetic=20
thing. For VRAM helpers, I was hoping to remove the vmap/vunmap helpers=20
entirely. One cannot really map the BOs for the long-term, so not having =

the helpers at all would make sense.

But reading all your comments on the driver patches, I'd rather not=20
update the drivers here but later convert them to use=20
prepare_fb/cleanup_fb in the correct way.

Best regards
Thomas

> -Daniel
>> ---
>>   drivers/gpu/drm/vboxvideo/vbox_mode.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/v=
boxvideo/vbox_mode.c
>> index dbc0dd53c69e..215b37c78c10 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> @@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm_p=
lane *plane,
>>   		container_of(plane->dev, struct vbox_private, ddev);
>>   	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(plane->state->crtc);
>>   	struct drm_framebuffer *fb =3D plane->state->fb;
>> -	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj[0]);=

>> +	struct drm_gem_object *obj =3D fb->obj[0];
>> +	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(obj);
>>   	u32 width =3D plane->state->crtc_w;
>>   	u32 height =3D plane->state->crtc_h;
>>   	size_t data_size, mask_size;
>> @@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct drm=
_plane *plane,
>>  =20
>>   	vbox_crtc->cursor_enabled =3D true;
>>  =20
>> -	ret =3D drm_gem_vram_vmap(gbo, &map);
>> +	ret =3D dma_resv_lock(obj->resv, NULL);
>> +	if (ret)
>> +		return;
>> +	ret =3D drm_gem_vram_vmap_local(gbo, &map);
>>   	if (ret) {
>> -		/*
>> -		 * BUG: we should have pinned the BO in prepare_fb().
>> -		 */
>> +		dma_resv_unlock(obj->resv);
>>   		mutex_unlock(&vbox->hw_mutex);
>>   		DRM_WARN("Could not map cursor bo, skipping update\n");
>>   		return;
>> @@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm_p=
lane *plane,
>>   	data_size =3D width * height * 4 + mask_size;
>>  =20
>>   	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size)=
;
>> -	drm_gem_vram_vunmap(gbo, &map);
>> +	drm_gem_vram_vunmap_local(gbo, &map);
>> +	dma_resv_unlock(obj->resv);
>>  =20
>>   	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>>   		VBOX_MOUSE_POINTER_ALPHA;
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


--U5F6Qhzznh14i5jrMNqGuORkmSSSTnYpz--

--fr9R9evr0luTzgmklT8KDcbSQUGqt97Kq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/9VZoFAwAAAAAACgkQlh/E3EQov+A8
Wg/+I0SyUQpi71oPpCBYek68iAu50GKUZW7dK67ZMc9RA0DBTxFA5uc7aSSFJtQSIuCZ/EQpFJml
C7QXHsubugL2XGOrYEHTEmMCBEiv5Do1Rn0IgFcBjrs5BhaqYP3Gt/io8yR+TA8NQDYy1QIzR5aU
mrv00bklvUF0i1TMtd+slbdUcnV92eHrTVD6WrKVAPXxyLJvSyQfu3lipPGFvtQAiOHpUieFPPzF
ffJpWXUZic5zZvesXyEiCLx0gVBl75I6PX/2gesMZatLKGNHFtf9U3rwSoXCKxPMLgjEQEZru3Fl
3jVASrvsp7/B2c7Wl3eNaLQixFP20NdhBGQhbF8WmMsW1xTCX3TEiFiq9lLq+S/nJUfv56u2blDQ
4yxfPtlhk8CGBRceHLqmWlgI4hoodMTDT0gov7vvZFHFYmg5JYQpsPSjPAG2kv+3vRGRylU9mJmC
L/m6tDfpDaGmfct6EN0qbFnYjs7WcYLuNpHUCiyEPNKMWZ6A//w6zGHjUj8i5ffzaDW17tUXP16l
hlIyxQNT5huFWZ2yj+FOF0BDGT71EyKNu/8qp5HxDvG/KOqwzxvLt90tOpAPUciJO6TP/pB+bjbM
bqvN9HjrWJHc1bAmbyJ5H3DC8gjnEw8LrAf8Jy6B8OTY0d5tRUCVYksHYBKSfMmCQ86n0xdibpTi
qmE=
=+rp9
-----END PGP SIGNATURE-----

--fr9R9evr0luTzgmklT8KDcbSQUGqt97Kq--

--===============1080680951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1080680951==--
