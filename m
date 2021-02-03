Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6630D79B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451C26E1A3;
	Wed,  3 Feb 2021 10:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5306E1A3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:34:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32E48AD26;
 Wed,  3 Feb 2021 10:34:22 +0000 (UTC)
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210127140503.31772-1-tzimmermann@suse.de>
 <YBp7CzzBjECx5lAu@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
Date: Wed, 3 Feb 2021 11:34:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBp7CzzBjECx5lAu@phenom.ffwll.local>
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1270414377=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1270414377==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aZ3aVAXGJyF3CCtVAgE8wUWh4X5561YNf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aZ3aVAXGJyF3CCtVAgE8wUWh4X5561YNf
Content-Type: multipart/mixed; boundary="yWE0usKwrRWm5iO0SKRLjZ1UoZXVGwVEm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
References: <20210127140503.31772-1-tzimmermann@suse.de>
 <YBp7CzzBjECx5lAu@phenom.ffwll.local>
In-Reply-To: <YBp7CzzBjECx5lAu@phenom.ffwll.local>

--yWE0usKwrRWm5iO0SKRLjZ1UoZXVGwVEm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.02.21 um 11:29 schrieb Daniel Vetter:
> On Wed, Jan 27, 2021 at 03:05:03PM +0100, Thomas Zimmermann wrote:
>> Functions in the atomic commit tail are not allowed to acquire the
>> dmabuf's reservation lock. So we cannot legally call the GEM object's
>> vmap functionality in atomic_update.
>>
>> Instead vmap the cursor BO in prepare_fb and vunmap it in cleanup_fb.
>> The cursor plane state stores the mapping's address. The pinning of th=
e
>> BO is implicitly done by vmap.
>>
>> As an extra benefit, there's no source of runtime errors left in
>> atomic_update.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Did you test this with my dma_fence_signalling annotations patches?

Not with vbox. I did test similar code in my recent ast patchset. But I=20
think there's still a bug here, as there's no custom plane-reset function=
=2E

>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll certainly send out an updated patch.

Best regards
Thomas

>=20
>> ---
>>   drivers/gpu/drm/vboxvideo/vbox_mode.c | 102 +++++++++++++++++++++---=
--
>>   1 file changed, 82 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/v=
boxvideo/vbox_mode.c
>> index dbc0dd53c69e..b5625a7d6cef 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>> @@ -324,6 +324,19 @@ static void vbox_primary_atomic_disable(struct dr=
m_plane *plane,
>>   				    old_state->src_y >> 16);
>>   }
>>  =20
>> +struct vbox_cursor_plane_state {
>> +	struct drm_plane_state base;
>> +
>> +	/* Transitional state - do not export or duplicate */
>> +
>> +	struct dma_buf_map map;
>> +};
>> +
>> +static struct vbox_cursor_plane_state *to_vbox_cursor_plane_state(str=
uct drm_plane_state *state)
>> +{
>> +	return container_of(state, struct vbox_cursor_plane_state, base);
>> +}
>> +
>>   static int vbox_cursor_atomic_check(struct drm_plane *plane,
>>   				    struct drm_plane_state *new_state)
>>   {
>> @@ -381,14 +394,13 @@ static void vbox_cursor_atomic_update(struct drm=
_plane *plane,
>>   		container_of(plane->dev, struct vbox_private, ddev);
>>   	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(plane->state->crtc);
>>   	struct drm_framebuffer *fb =3D plane->state->fb;
>> -	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj[0]);=

>>   	u32 width =3D plane->state->crtc_w;
>>   	u32 height =3D plane->state->crtc_h;
>> +	struct vbox_cursor_plane_state *vbox_state =3D to_vbox_cursor_plane_=
state(plane->state);
>> +	struct dma_buf_map map =3D vbox_state->map;
>> +	u8 *src =3D map.vaddr; /* TODO: Use mapping abstraction properly */
>>   	size_t data_size, mask_size;
>>   	u32 flags;
>> -	struct dma_buf_map map;
>> -	int ret;
>> -	u8 *src;
>>  =20
>>   	/*
>>   	 * VirtualBox uses the host windowing system to draw the cursor so
>> @@ -401,17 +413,6 @@ static void vbox_cursor_atomic_update(struct drm_=
plane *plane,
>>  =20
>>   	vbox_crtc->cursor_enabled =3D true;
>>  =20
>> -	ret =3D drm_gem_vram_vmap(gbo, &map);
>> -	if (ret) {
>> -		/*
>> -		 * BUG: we should have pinned the BO in prepare_fb().
>> -		 */
>> -		mutex_unlock(&vbox->hw_mutex);
>> -		DRM_WARN("Could not map cursor bo, skipping update\n");
>> -		return;
>> -	}
>> -	src =3D map.vaddr; /* TODO: Use mapping abstraction properly */
>> -
>>   	/*
>>   	 * The mask must be calculated based on the alpha
>>   	 * channel, one bit per ARGB word, and must be 32-bit
>> @@ -421,7 +422,6 @@ static void vbox_cursor_atomic_update(struct drm_p=
lane *plane,
>>   	data_size =3D width * height * 4 + mask_size;
>>  =20
>>   	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size)=
;
>> -	drm_gem_vram_vunmap(gbo, &map);
>>  =20
>>   	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>>   		VBOX_MOUSE_POINTER_ALPHA;
>> @@ -458,6 +458,43 @@ static void vbox_cursor_atomic_disable(struct drm=
_plane *plane,
>>   	mutex_unlock(&vbox->hw_mutex);
>>   }
>>  =20
>> +static int vbox_cursor_prepare_fb(struct drm_plane *plane, struct drm=
_plane_state *new_state)
>> +{
>> +	struct vbox_cursor_plane_state *new_vbox_state =3D to_vbox_cursor_pl=
ane_state(new_state);
>> +	struct drm_framebuffer *fb =3D new_state->fb;
>> +	struct drm_gem_vram_object *gbo;
>> +	struct dma_buf_map map;
>> +	int ret;
>> +
>> +	if (!fb)
>> +		return 0;
>> +
>> +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>> +
>> +	ret =3D drm_gem_vram_vmap(gbo, &map);
>> +	if (ret)
>> +		return ret;
>> +
>> +	new_vbox_state->map =3D map;
>> +
>> +	return 0;
>> +}
>> +
>> +static void vbox_cursor_cleanup_fb(struct drm_plane *plane, struct dr=
m_plane_state *old_state)
>> +{
>> +	struct vbox_cursor_plane_state *old_vbox_state =3D to_vbox_cursor_pl=
ane_state(old_state);
>> +	struct drm_framebuffer *fb =3D old_state->fb;
>> +	struct dma_buf_map map =3D old_vbox_state->map;
>> +	struct drm_gem_vram_object *gbo;
>> +
>> +	if (!fb)
>> +		return;
>> +
>> +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>> +
>> +	drm_gem_vram_vunmap(gbo, &map);
>> +}
>> +
>>   static const u32 vbox_cursor_plane_formats[] =3D {
>>   	DRM_FORMAT_ARGB8888,
>>   };
>> @@ -466,17 +503,42 @@ static const struct drm_plane_helper_funcs vbox_=
cursor_helper_funcs =3D {
>>   	.atomic_check	=3D vbox_cursor_atomic_check,
>>   	.atomic_update	=3D vbox_cursor_atomic_update,
>>   	.atomic_disable	=3D vbox_cursor_atomic_disable,
>> -	.prepare_fb	=3D drm_gem_vram_plane_helper_prepare_fb,
>> -	.cleanup_fb	=3D drm_gem_vram_plane_helper_cleanup_fb,
>> +	.prepare_fb	=3D vbox_cursor_prepare_fb,
>> +	.cleanup_fb	=3D vbox_cursor_cleanup_fb,
>>   };
>>  =20
>> +static struct drm_plane_state *vbox_cursor_atomic_duplicate_state(str=
uct drm_plane *plane)
>> +{
>> +	struct vbox_cursor_plane_state *new_vbox_state;
>> +	struct drm_device *dev =3D plane->dev;
>> +
>> +	if (drm_WARN_ON(dev, !plane->state))
>> +		return NULL;
>> +
>> +	new_vbox_state =3D kzalloc(sizeof(*new_vbox_state), GFP_KERNEL);
>> +	if (!new_vbox_state)
>> +		return NULL;
>> +	__drm_atomic_helper_plane_duplicate_state(plane, &new_vbox_state->ba=
se);
>> +
>> +	return &new_vbox_state->base;
>> +}
>> +
>> +static void vbox_cursor_atomic_destroy_state(struct drm_plane *plane,=

>> +					     struct drm_plane_state *state)
>> +{
>> +	struct vbox_cursor_plane_state *vbox_state =3D to_vbox_cursor_plane_=
state(state);
>> +
>> +	__drm_atomic_helper_plane_destroy_state(&vbox_state->base);
>> +	kfree(vbox_state);
>> +}
>> +
>>   static const struct drm_plane_funcs vbox_cursor_plane_funcs =3D {
>>   	.update_plane	=3D drm_atomic_helper_update_plane,
>>   	.disable_plane	=3D drm_atomic_helper_disable_plane,
>>   	.destroy	=3D drm_primary_helper_destroy,
>>   	.reset		=3D drm_atomic_helper_plane_reset,
>> -	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_state,=

>> -	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
>> +	.atomic_duplicate_state =3D vbox_cursor_atomic_duplicate_state,
>> +	.atomic_destroy_state =3D vbox_cursor_atomic_destroy_state,
>>   };
>>  =20
>>   static const u32 vbox_primary_plane_formats[] =3D {
>>
>> base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
>> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
>> --=20
>> 2.30.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yWE0usKwrRWm5iO0SKRLjZ1UoZXVGwVEm--

--aZ3aVAXGJyF3CCtVAgE8wUWh4X5561YNf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAafC0FAwAAAAAACgkQlh/E3EQov+BJ
YhAApPj1p+qvsxlpYTNAClmcKRFQ/CXceYEQ9jFATl3jxHm3xKY7lCqo0cJRs9tXyVq7IawS9bam
Yc50IFvOwUe4vTqoH6NiOC7oT41gRjz0+ukyQy95fKzvnks/vcrQmmO9N7CIonQc6+pXaWjRESkm
d7EszoKzoKxGrXjoCCEXIdXKd8lv5Tw1+n2qdnck/30UogebsP/EmddOGAYYIHJsv51qUnsQgMLr
rB7gB/LRHNTr463101UiYZhDqVKD7bK91HiC8QTyzvPLl5987D8/xDdbFvLIhriCiz5RAfj8N4Xm
hlEiNKO54vGZCk4I7nWGz6+SI4l6gQpnMAXBk5JbTI5KoWeLtCWu23mdfsrFvvCGM/6glnAaIlWl
1caPRonXRd6nGMl4YEuskLVCPZHGy6sJoW1EFipoZEABGkwDSVDKM72mnoegzeowpKqRIohbgQz9
45w2GU5Uuns0DvKAlhztinwtDL7jOLyXT3BWJ3nGtu4y3xKhTQKAJFO6he80Z1l5edkr2hjQBqb/
VqFcZxs6H3mXaHQRracqdiOK2WflpVyp17IT1qasOdkomB2fU5T/3ZHQ3Onc+5FVOVqZWD7d/O2U
oTzqGdcT4RCYwuuldNA3ezJH/dLJVewXdtYh236AFNg5piOmR8qFUuCB67RepkA1vNSiTWxtw04x
mkU=
=f4fH
-----END PGP SIGNATURE-----

--aZ3aVAXGJyF3CCtVAgE8wUWh4X5561YNf--

--===============1270414377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1270414377==--
