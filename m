Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE530D840
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 12:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E586EA61;
	Wed,  3 Feb 2021 11:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644976EA61
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:14:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D82F6B16E;
 Wed,  3 Feb 2021 11:14:39 +0000 (UTC)
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210127140503.31772-1-tzimmermann@suse.de>
 <YBp7CzzBjECx5lAu@phenom.ffwll.local>
 <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
 <YBp+jxbjkdcpN1eo@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <74307294-2220-29d6-9d59-a73c2b8f43c6@suse.de>
Date: Wed, 3 Feb 2021 12:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBp+jxbjkdcpN1eo@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============1017421187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1017421187==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mv1hqL0GI1qPcoSpb4uSDAHT4OvDMhtbS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mv1hqL0GI1qPcoSpb4uSDAHT4OvDMhtbS
Content-Type: multipart/mixed; boundary="mClz3KHHKBTKeSWHZIA3yEbEhDjLrKwWG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <74307294-2220-29d6-9d59-a73c2b8f43c6@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
References: <20210127140503.31772-1-tzimmermann@suse.de>
 <YBp7CzzBjECx5lAu@phenom.ffwll.local>
 <9997d4d0-4664-d38c-22ae-346aeccba896@suse.de>
 <YBp+jxbjkdcpN1eo@phenom.ffwll.local>
In-Reply-To: <YBp+jxbjkdcpN1eo@phenom.ffwll.local>

--mClz3KHHKBTKeSWHZIA3yEbEhDjLrKwWG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.02.21 um 11:44 schrieb Daniel Vetter:
> On Wed, Feb 03, 2021 at 11:34:21AM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 03.02.21 um 11:29 schrieb Daniel Vetter:
>>> On Wed, Jan 27, 2021 at 03:05:03PM +0100, Thomas Zimmermann wrote:
>>>> Functions in the atomic commit tail are not allowed to acquire the
>>>> dmabuf's reservation lock. So we cannot legally call the GEM object'=
s
>>>> vmap functionality in atomic_update.
>>>>
>>>> Instead vmap the cursor BO in prepare_fb and vunmap it in cleanup_fb=
=2E
>>>> The cursor plane state stores the mapping's address. The pinning of =
the
>>>> BO is implicitly done by vmap.
>>>>
>>>> As an extra benefit, there's no source of runtime errors left in
>>>> atomic_update.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> Did you test this with my dma_fence_signalling annotations patches?
>>
>> Not with vbox. I did test similar code in my recent ast patchset. But =
I
>> think there's still a bug here, as there's no custom plane-reset funct=
ion.
>=20
> Do right, KASAN should complain when you load the driver because the fi=
rst
> state is a bit too small. But probably still within the kmalloc'ed bloc=
k
> by sheer luck. Worth confirming that KASAN can catch this.

I have KASAN enabled and I might just have missed the error message. I=20
later saw the error with another driver after I already posted the vbox=20
and ast patches.

If you have the time, a look at the first half of the ast patchset might =

still be worth it. It removes the cursor-code abstraction and shouldn't=20
be affected by the issue.

Best regards
Thomas

>=20
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> I'll certainly send out an updated patch.
>=20
> I wonder whether it's worth to have a runtime check that when you
> overwrite one, you have to overwrite all of them or it's clearly buggy?=

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/vboxvideo/vbox_mode.c | 102 +++++++++++++++++++++=
-----
>>>>    1 file changed, 82 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm=
/vboxvideo/vbox_mode.c
>>>> index dbc0dd53c69e..b5625a7d6cef 100644
>>>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>>> @@ -324,6 +324,19 @@ static void vbox_primary_atomic_disable(struct =
drm_plane *plane,
>>>>    				    old_state->src_y >> 16);
>>>>    }
>>>> +struct vbox_cursor_plane_state {
>>>> +	struct drm_plane_state base;
>>>> +
>>>> +	/* Transitional state - do not export or duplicate */
>>>> +
>>>> +	struct dma_buf_map map;
>>>> +};
>>>> +
>>>> +static struct vbox_cursor_plane_state *to_vbox_cursor_plane_state(s=
truct drm_plane_state *state)
>>>> +{
>>>> +	return container_of(state, struct vbox_cursor_plane_state, base);
>>>> +}
>>>> +
>>>>    static int vbox_cursor_atomic_check(struct drm_plane *plane,
>>>>    				    struct drm_plane_state *new_state)
>>>>    {
>>>> @@ -381,14 +394,13 @@ static void vbox_cursor_atomic_update(struct d=
rm_plane *plane,
>>>>    		container_of(plane->dev, struct vbox_private, ddev);
>>>>    	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(plane->state->crtc)=
;
>>>>    	struct drm_framebuffer *fb =3D plane->state->fb;
>>>> -	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj[0]=
);
>>>>    	u32 width =3D plane->state->crtc_w;
>>>>    	u32 height =3D plane->state->crtc_h;
>>>> +	struct vbox_cursor_plane_state *vbox_state =3D to_vbox_cursor_plan=
e_state(plane->state);
>>>> +	struct dma_buf_map map =3D vbox_state->map;
>>>> +	u8 *src =3D map.vaddr; /* TODO: Use mapping abstraction properly *=
/
>>>>    	size_t data_size, mask_size;
>>>>    	u32 flags;
>>>> -	struct dma_buf_map map;
>>>> -	int ret;
>>>> -	u8 *src;
>>>>    	/*
>>>>    	 * VirtualBox uses the host windowing system to draw the cursor =
so
>>>> @@ -401,17 +413,6 @@ static void vbox_cursor_atomic_update(struct dr=
m_plane *plane,
>>>>    	vbox_crtc->cursor_enabled =3D true;
>>>> -	ret =3D drm_gem_vram_vmap(gbo, &map);
>>>> -	if (ret) {
>>>> -		/*
>>>> -		 * BUG: we should have pinned the BO in prepare_fb().
>>>> -		 */
>>>> -		mutex_unlock(&vbox->hw_mutex);
>>>> -		DRM_WARN("Could not map cursor bo, skipping update\n");
>>>> -		return;
>>>> -	}
>>>> -	src =3D map.vaddr; /* TODO: Use mapping abstraction properly */
>>>> -
>>>>    	/*
>>>>    	 * The mask must be calculated based on the alpha
>>>>    	 * channel, one bit per ARGB word, and must be 32-bit
>>>> @@ -421,7 +422,6 @@ static void vbox_cursor_atomic_update(struct drm=
_plane *plane,
>>>>    	data_size =3D width * height * 4 + mask_size;
>>>>    	copy_cursor_image(src, vbox->cursor_data, width, height, mask_si=
ze);
>>>> -	drm_gem_vram_vunmap(gbo, &map);
>>>>    	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE =
|
>>>>    		VBOX_MOUSE_POINTER_ALPHA;
>>>> @@ -458,6 +458,43 @@ static void vbox_cursor_atomic_disable(struct d=
rm_plane *plane,
>>>>    	mutex_unlock(&vbox->hw_mutex);
>>>>    }
>>>> +static int vbox_cursor_prepare_fb(struct drm_plane *plane, struct d=
rm_plane_state *new_state)
>>>> +{
>>>> +	struct vbox_cursor_plane_state *new_vbox_state =3D to_vbox_cursor_=
plane_state(new_state);
>>>> +	struct drm_framebuffer *fb =3D new_state->fb;
>>>> +	struct drm_gem_vram_object *gbo;
>>>> +	struct dma_buf_map map;
>>>> +	int ret;
>>>> +
>>>> +	if (!fb)
>>>> +		return 0;
>>>> +
>>>> +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>>>> +
>>>> +	ret =3D drm_gem_vram_vmap(gbo, &map);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	new_vbox_state->map =3D map;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void vbox_cursor_cleanup_fb(struct drm_plane *plane, struct =
drm_plane_state *old_state)
>>>> +{
>>>> +	struct vbox_cursor_plane_state *old_vbox_state =3D to_vbox_cursor_=
plane_state(old_state);
>>>> +	struct drm_framebuffer *fb =3D old_state->fb;
>>>> +	struct dma_buf_map map =3D old_vbox_state->map;
>>>> +	struct drm_gem_vram_object *gbo;
>>>> +
>>>> +	if (!fb)
>>>> +		return;
>>>> +
>>>> +	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>>>> +
>>>> +	drm_gem_vram_vunmap(gbo, &map);
>>>> +}
>>>> +
>>>>    static const u32 vbox_cursor_plane_formats[] =3D {
>>>>    	DRM_FORMAT_ARGB8888,
>>>>    };
>>>> @@ -466,17 +503,42 @@ static const struct drm_plane_helper_funcs vbo=
x_cursor_helper_funcs =3D {
>>>>    	.atomic_check	=3D vbox_cursor_atomic_check,
>>>>    	.atomic_update	=3D vbox_cursor_atomic_update,
>>>>    	.atomic_disable	=3D vbox_cursor_atomic_disable,
>>>> -	.prepare_fb	=3D drm_gem_vram_plane_helper_prepare_fb,
>>>> -	.cleanup_fb	=3D drm_gem_vram_plane_helper_cleanup_fb,
>>>> +	.prepare_fb	=3D vbox_cursor_prepare_fb,
>>>> +	.cleanup_fb	=3D vbox_cursor_cleanup_fb,
>>>>    };
>>>> +static struct drm_plane_state *vbox_cursor_atomic_duplicate_state(s=
truct drm_plane *plane)
>>>> +{
>>>> +	struct vbox_cursor_plane_state *new_vbox_state;
>>>> +	struct drm_device *dev =3D plane->dev;
>>>> +
>>>> +	if (drm_WARN_ON(dev, !plane->state))
>>>> +		return NULL;
>>>> +
>>>> +	new_vbox_state =3D kzalloc(sizeof(*new_vbox_state), GFP_KERNEL);
>>>> +	if (!new_vbox_state)
>>>> +		return NULL;
>>>> +	__drm_atomic_helper_plane_duplicate_state(plane, &new_vbox_state->=
base);
>>>> +
>>>> +	return &new_vbox_state->base;
>>>> +}
>>>> +
>>>> +static void vbox_cursor_atomic_destroy_state(struct drm_plane *plan=
e,
>>>> +					     struct drm_plane_state *state)
>>>> +{
>>>> +	struct vbox_cursor_plane_state *vbox_state =3D to_vbox_cursor_plan=
e_state(state);
>>>> +
>>>> +	__drm_atomic_helper_plane_destroy_state(&vbox_state->base);
>>>> +	kfree(vbox_state);
>>>> +}
>>>> +
>>>>    static const struct drm_plane_funcs vbox_cursor_plane_funcs =3D {=

>>>>    	.update_plane	=3D drm_atomic_helper_update_plane,
>>>>    	.disable_plane	=3D drm_atomic_helper_disable_plane,
>>>>    	.destroy	=3D drm_primary_helper_destroy,
>>>>    	.reset		=3D drm_atomic_helper_plane_reset,
>>>> -	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_stat=
e,
>>>> -	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
>>>> +	.atomic_duplicate_state =3D vbox_cursor_atomic_duplicate_state,
>>>> +	.atomic_destroy_state =3D vbox_cursor_atomic_destroy_state,
>>>>    };
>>>>    static const u32 vbox_primary_plane_formats[] =3D {
>>>>
>>>> base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
>>>> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
>>>> --=20
>>>> 2.30.0
>>>>
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mClz3KHHKBTKeSWHZIA3yEbEhDjLrKwWG--

--mv1hqL0GI1qPcoSpb4uSDAHT4OvDMhtbS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAahZ8FAwAAAAAACgkQlh/E3EQov+CQ
eQ/7BjZzVm28oZWedcQ33CfYKfTdyUH65lmIz6dGMzZcy/khoeBd9qroBZl7AOhx8q+DG1e4Jhji
QG3bCTWHDaBgFOAvZlc97CbwoyVWP1HfNsc1LTVpsADjm7ciyHknCnsuxoeIAfuEBJEYp2ycVqRH
683rRprEtyUs7jKJ7MithriqpjwEPtijPGBofEQde2S4V95zE+aDF/B4aZ+sygyM/v2blXD5Gp1S
nc9t9VEzUYJjNRMrSm1wPw+wNtmsqpxwRrXLr65WUd+wVcy8hvcNJv6zbVD9kFGscdzAHvuVJNbu
YI+xtQklGm4vFrXhcsWRj3+Ef8wnNwhpZKNQ32KT9OjUFp7XqWsvu6U6bDvhlWVkPTTeXXSOYJi6
pRMOCPaAzn50OW/mZ1Lg80doJDDWynFsfBQE7qa9qcg30Ujy+8/+E4O/n5pMzJj2LbPLqvQBgBms
MFLCWKZF0m7C+BQ0oymbBhTs0/EfsGApmEnUcxGYs4vZj9OTHVjFg9KHkaMqC/RySOntvs23DmVF
uVvQDph2droxabjKHKvPYRfuBbs0R89uv1EzEVPqhKDW9CUMj5MrgA/E94aySKJCFBhTSUNCRgIh
cNP2cAv/k0zynDOJJmWntaFG9eE94RzehDeSbDG3vmyYSaBzfIzUJGmhnV2WouFsbI/A7rqOobhu
YbU=
=Z54g
-----END PGP SIGNATURE-----

--mv1hqL0GI1qPcoSpb4uSDAHT4OvDMhtbS--

--===============1017421187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1017421187==--
