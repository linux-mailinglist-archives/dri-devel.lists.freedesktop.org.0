Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B7314E9B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F446EB07;
	Tue,  9 Feb 2021 12:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74086EB07
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:04:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43EE0AD24;
 Tue,  9 Feb 2021 12:04:16 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] drm/gem: Export helpers for shadow-buffered planes
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210208135044.27827-1-tzimmermann@suse.de>
 <20210208135044.27827-2-tzimmermann@suse.de>
 <YCJZaTR1Q2MrOm81@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <521f4aac-206a-c07a-4406-4dc0f2b07d64@suse.de>
Date: Tue, 9 Feb 2021 13:04:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCJZaTR1Q2MrOm81@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============1925381628=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1925381628==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fdXazBJRdoylXzYO20KZ7fFpeln760Dth"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fdXazBJRdoylXzYO20KZ7fFpeln760Dth
Content-Type: multipart/mixed; boundary="oNoZbIX4pDCKBXFBTs58QJWMCogrzQYjt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: hdegoede@redhat.com, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org
Message-ID: <521f4aac-206a-c07a-4406-4dc0f2b07d64@suse.de>
Subject: Re: [PATCH v2 1/2] drm/gem: Export helpers for shadow-buffered planes
References: <20210208135044.27827-1-tzimmermann@suse.de>
 <20210208135044.27827-2-tzimmermann@suse.de>
 <YCJZaTR1Q2MrOm81@phenom.ffwll.local>
In-Reply-To: <YCJZaTR1Q2MrOm81@phenom.ffwll.local>

--oNoZbIX4pDCKBXFBTs58QJWMCogrzQYjt
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.02.21 um 10:44 schrieb Daniel Vetter:
> On Mon, Feb 08, 2021 at 02:50:43PM +0100, Thomas Zimmermann wrote:
>> Export the helpers for shadow-buffered planes. These will be used by
>> several drivers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 148 ++++++++++++++++++++++=
+-
>>   include/drm/drm_gem_atomic_helper.h     |  32 +++++
>>   2 files changed, 174 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm=
/drm_gem_atomic_helper.c
>> index e27762cef360..79b4d3f0495a 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -14,13 +14,101 @@
>>    * functions for drivers that use GEM objects. Currently, it provide=
s
>>    * plane state and framebuffer BO mappings for planes with shadow
>>    * buffers.
>> + *
>> + * A driver using a shadow buffer copies the content of the shadow bu=
ffers
>> + * into the HW's framebuffer memory during an atomic update. This req=
uires
>> + * a mapping of the shadow buffer into kernel address space. The mapp=
ings
>> + * cannot be established by commit-tail functions, such as atomic_upd=
ate,
>> + * as this would violate locking rules vmap.
>=20
> "... locking rules around dma_buf_vmap()"?
>=20
>> + *
>> + * The helpers for shadow-buffered planes establish and release mappi=
ngs,
>> + * and provide struct drm_shadow_plane_state, which stores the plane'=
s mapping
>> + * for commit-tail functons.
>> + *
>> + * Shadow-buffered planes can easily be enabled by using the provided=
 macros
>> + * DRM_GEM_PLANE_SHADOW_FUNCS and DRM_GEM_SHADOE_PLANE_HELPER_FUNCS.
>=20
> I think for hyperlinks/highlights we need %CONSTANT? Maybe check what w=
orks.
>=20
>> + * These macros set up the plane and plane-helper callbacks to point =
to the
>> + * shadow-buffer helpers.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	#include <drm/drm/gem_atomic_helper.h>
>> + *
>> + *	struct drm_plane_funcs driver_plane_funcs =3D {
>> + *		...,
>> + *		DRM_GEM_SHADOW_PLANE_FUNCS,
>> + *	};
>> + *
>> + *	struct drm_plane_helper_funcs driver_plane_helper_funcs =3D {
>> + *		...,
>> + *		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>> + *	};
>> + *
>> + * In the driver's atomic-update function, shadow-buffer mappings are=
 available
>> + * from the plane state. Use to_drm_shadow_plane_state() to upcast fr=
om
>> + * struct drm_plane_state.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	void driver_plane_atomic_update(struct drm_plane *plane,
>> + *					struct drm_plane_state *old_plane_state)
>> + *	{
>> + *		struct drm_plane_state *plane_state =3D plane->state;
>> + *		struct drm_shadow_plane_state *shadow_plane_state =3D
>> + *			to_drm_shadow_plane_state(plane_state);
>> + *
>> + *		// access shadow buffer via shadow_plane_state->map
>> + *	}
>> + *
>> + * A mapping address for each of the framebuffer's buffer object is s=
tored in
>> + * struct drm_shadow_plane_state.map. The mappings are valid while th=
e state
>> + * is being used.
>> + *
>> + * Drivers that use struct drm_simple_display_pipe can use
>> + * DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS to initialize the r=
sp
>> + * callbacks. Access to shadow-buffer mappings is similar to regular
>> + * atomic_update.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	struct drm_simple_display_pipe_funcs driver_pipe_funcs =3D {
>> + *		...,
>> + *		DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
>> + *	};
>> + *
>> + *	void driver_pipe_enable(struct drm_simple_display_pipe *pipe,
>> + *				struct drm_crtc_state *crtc_state,
>> + *				struct drm_plane_state *plane_state)
>> + *	{
>> + *		struct drm_shadow_plane_state *shadow_plane_state =3D
>> + *			to_drm_shadow_plane_state(plane_state);
>> + *
>> + *		// access shadow buffer via shadow_plane_state->map
>> + *	}
>>    */
>>  =20
>>   /*
>>    * Shadow-buffered Planes
>>    */
>>  =20
>> -static struct drm_plane_state *
>> +/**
>> + * drm_gem_duplicate_shadow_plane_state - duplicates shadow-buffered =
plane state
>> + * @plane: the plane
>> + *
>> + * This function implements struct drm_plane_funcs.atomic_duplicate_s=
tate for
>=20
> Does this hyperlink automatically? I didn't know it works since for
> members I just always use &struct.member myself.

Ah, ok. Fixed. This work with struct &name.field. The % only adds=20
formatting to constants.

Best regards
Thomas

>=20
>> + * shadow-buffered planes. It assumes the existing state to be of typ=
e
>> + * struct drm_shadow_plane_state and it allocates the new state to be=
 of this
>> + * type.
>> + *
>> + * The function does not duplicate existing mappings of the shadow bu=
ffers.
>> + * Mappings are maintained during the atomic commit by the plane's pr=
epare_fb
>> + * and cleanup_fb helpers. See drm_gem_prepare_shadow_fb() and drm_ge=
m_cleanup_shadow_fb()
>> + * for corresponding helpers.
>> + *
>> + * Returns:
>> + * A pointer to a new plane state on success, or NULL otherwise.
>> + */
>> +struct drm_plane_state *
>>   drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane)
>>   {
>>   	struct drm_plane_state *plane_state =3D plane->state;
>> @@ -36,9 +124,19 @@ drm_gem_duplicate_shadow_plane_state(struct drm_pl=
ane *plane)
>>  =20
>>   	return &new_shadow_plane_state->base;
>>   }
>> +EXPORT_SYMBOL(drm_gem_duplicate_shadow_plane_state);
>>  =20
>> -static void drm_gem_destroy_shadow_plane_state(struct drm_plane *plan=
e,
>> -					       struct drm_plane_state *plane_state)
>> +/**
>> + * drm_gem_destroy_shadow_plane_state - deletes shadow-buffered plane=
 state
>> + * @plane: the plane
>> + * @plane_state: the plane state of type struct drm_shadow_plane_stat=
e
>> + *
>> + * This function implements struct drm_plane_funcs.atomic_destroy_sta=
te
>> + * for shadow-buffered planes. It expects that mappings of shadow buf=
fers
>> + * have been released already.
>> + */
>> +void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
>> +					struct drm_plane_state *plane_state)
>>   {
>>   	struct drm_shadow_plane_state *shadow_plane_state =3D
>>   		to_drm_shadow_plane_state(plane_state);
>> @@ -46,8 +144,18 @@ static void drm_gem_destroy_shadow_plane_state(str=
uct drm_plane *plane,
>>   	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);=

>>   	kfree(shadow_plane_state);
>>   }
>> +EXPORT_SYMBOL(drm_gem_destroy_shadow_plane_state);
>>  =20
>> -static void drm_gem_reset_shadow_plane(struct drm_plane *plane)
>> +/**
>> + * drm_gem_reset_shadow_plane - resets a shadow-buffered plane
>> + * @plane: the plane
>> + *
>> + * This function implements struct drm_plane_funcs.reset_plane for
>> + * shadow-buffered planes. It assumes the current plane state to be
>> + * of type struct drm_shadow_plane and it allocates the new state of
>> + * this type.
>> + */
>> +void drm_gem_reset_shadow_plane(struct drm_plane *plane)
>>   {
>>   	struct drm_shadow_plane_state *shadow_plane_state;
>>  =20
>> @@ -61,8 +169,24 @@ static void drm_gem_reset_shadow_plane(struct drm_=
plane *plane)
>>   		return;
>>   	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
>>   }
>> +EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
>>  =20
>> -static int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct =
drm_plane_state *plane_state)
>> +/**
>> + * drm_gem_prepare_shadow_fb - prepares shadow framebuffers
>> + * @plane: the plane
>> + * @plane_state: the plane state of type struct drm_shadow_plane_stat=
e
>> + *
>> + * This function implements struct drm_plane_helper_funcs.prepare_fb.=
 It
>> + * maps all buffer objects of the plane's framebuffer into kernel add=
ress
>> + * space and stores them in struct drm_shadow_plane_state.map. The
>> + * framebuffer will be synchronized as part of the atomic commit.
>> + *
>> + * See drm_gem_cleanup_shadow_fb() for cleanup.
>> + *
>> + * Returns:
>> + * 0 on success, or a negative errno code otherwise.
>> + */
>> +int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_pla=
ne_state *plane_state)
>>   {
>>   	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow=
_plane_state(plane_state);
>>   	struct drm_framebuffer *fb =3D plane_state->fb;
>> @@ -100,8 +224,19 @@ static int drm_gem_prepare_shadow_fb(struct drm_p=
lane *plane, struct drm_plane_s
>>   	}
>>   	return ret;
>>   }
>> +EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
>>  =20
>> -static void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct=
 drm_plane_state *plane_state)
>> +/**
>> + * drm_gem_cleanup_shadow_fb - releases shadow framebuffers
>> + * @plane: the plane
>> + * @plane_state: the plane state of type struct drm_shadow_plane_stat=
e
>> + *
>> + * This function implements struct drm_plane_helper_funcs.cleanup_fb.=

>> + * This function unmaps all buffer objects of the plane's framebuffer=
=2E
>> + *
>> + * See drm_gem_prepare_shadow_fb() for more inforamtion.
>> + */
>> +void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_pl=
ane_state *plane_state)
>>   {
>>   	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow=
_plane_state(plane_state);
>>   	struct drm_framebuffer *fb =3D plane_state->fb;
>> @@ -119,6 +254,7 @@ static void drm_gem_cleanup_shadow_fb(struct drm_p=
lane *plane, struct drm_plane_
>>   		drm_gem_vunmap(obj, &shadow_plane_state->map[i]);
>>   	}
>>   }
>> +EXPORT_SYMBOL(drm_gem_cleanup_shadow_fb);
>>  =20
>>   /**
>>    * drm_gem_simple_kms_prepare_shadow_fb - prepares shadow framebuffe=
rs
>> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem=
_atomic_helper.h
>> index 08b96ccea325..7abf40bdab3d 100644
>> --- a/include/drm/drm_gem_atomic_helper.h
>> +++ b/include/drm/drm_gem_atomic_helper.h
>> @@ -45,6 +45,38 @@ to_drm_shadow_plane_state(struct drm_plane_state *s=
tate)
>>   	return container_of(state, struct drm_shadow_plane_state, base);
>>   }
>>  =20
>> +void drm_gem_reset_shadow_plane(struct drm_plane *plane);
>> +struct drm_plane_state *drm_gem_duplicate_shadow_plane_state(struct d=
rm_plane *plane);
>> +void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
>> +					struct drm_plane_state *plane_state);
>> +
>> +/**
>> + * DRM_GEM_SHADOW_PLANE_FUNCS -
>> + *	Initializes struct drm_plane_funcs for shadow-buffered planes
>> + *
>> + * Drivers may use GEM BOs as shadow buffers over the framebuffer mem=
ory. This
>> + * macro initializes struct drm_plane_funcs to use the rsp helper fun=
ctions.
>> + */
>> +#define DRM_GEM_SHADOW_PLANE_FUNCS \
>> +	.reset =3D drm_gem_reset_shadow_plane, \
>> +	.atomic_duplicate_state =3D drm_gem_duplicate_shadow_plane_state, \
>> +	.atomic_destroy_state =3D drm_gem_destroy_shadow_plane_state
>> +
>> +int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_pla=
ne_state *plane_state);
>> +void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_pl=
ane_state *plane_state);
>> +
>> +/**
>> + * DRM_GEM_SHADOW_PLANE_HELPER_FUNCS -
>> + *	Initializes struct drm_plane_helper_funcs for shadow-buffered plan=
es
>> + *
>> + * Drivers may use GEM BOs as shadow buffers over the framebuffer mem=
ory. This
>> + * macro initializes struct drm_plane_helper_funcs to use the rsp hel=
per
>> + * functions.
>> + */
>> +#define DRM_GEM_SHADOW_PLANE_HELPER_FUNCS \
>> +	.prepare_fb =3D drm_gem_prepare_shadow_fb, \
>> +	.cleanup_fb =3D drm_gem_cleanup_shadow_fb
>> +
>>   int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_p=
ipe *pipe,
>>   					 struct drm_plane_state *plane_state);
>>   void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_=
pipe *pipe,
>=20
>=20
> Very nice and thoroughly explained docs!
>=20
> Thanks, Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
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


--oNoZbIX4pDCKBXFBTs58QJWMCogrzQYjt--

--fdXazBJRdoylXzYO20KZ7fFpeln760Dth
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAiej4FAwAAAAAACgkQlh/E3EQov+D/
hg/5AQAMIA4WD/WTmFXvbXenbBqv0T6XR2rNOE8LP3Z1smDCNeIFrXInd9AqZwTFdxkVMnX/RhKB
Tc9hbWyy3WVvpRVQ8d+TYmu4wVlzPUQSCCu2T1v6YFjGjfTgjtOh8yDQr7Kqi+0Rc75ZTD/jKLbc
j9x6O02DjB3UIFAr0tcRDKkue7Z77Qg8hAYYotwgOEBhqML73k82a+EZYlc/+XBi4uzDFuTKjGEb
t2FM+PgRora1IW8B55pDcNf9tS8eFMrVGmL2nx51yDkJysWRF1TL6qxYiUIPPKcVvtBoylLpRrGW
gAydcfwjY8wPAlDrj+rU346N1OG9FFeT8sOXy8n5yXAQKzE8hcA8p6rcutX8B3oHhSSCu8i0z2hn
+Z08hO//LfSkAJ0HGKSfklu0IigTfnkarWFGYbOidsB7e/XsgH4oHe4kdnVsNPWjzZHoDFGCft9+
Rschnk+VxsZcTw3SjB046XK/Va1u8anq7uNJ5EpDz/r0tMC7kvYTty94jfyjHMu+4OHR2tN7X1h1
gRAqcX2d4gOFq6fOGcDwnhyqyu/HcUbMMZfyzC6CCq9oaVGYSVsTU19QHn90ujHNI6qyzlJNsa16
qDEOu7C+q2+l5proNQa6tkxQACIGx6/jhJAPrl8ysGy1tDVHgkXRcVRu6QDUcOBHchwbJZICVT9w
UnQ=
=7n6r
-----END PGP SIGNATURE-----

--fdXazBJRdoylXzYO20KZ7fFpeln760Dth--

--===============1925381628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1925381628==--
