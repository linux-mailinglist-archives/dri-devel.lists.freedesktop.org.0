Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457C30DCAB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 15:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CD86EB29;
	Wed,  3 Feb 2021 14:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91A76EAE1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 14:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 678C4ACBA;
 Wed,  3 Feb 2021 14:26:18 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210203131046.22371-1-tzimmermann@suse.de>
 <20210203131046.22371-3-tzimmermann@suse.de>
 <YBqsvhIROEVLnC2L@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm/shmem-helper: Add additional KMS helpers
Message-ID: <03fd24e8-2133-9b78-ae3b-d297ab9472b4@suse.de>
Date: Wed, 3 Feb 2021 15:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBqsvhIROEVLnC2L@phenom.ffwll.local>
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
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1367892307=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1367892307==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rfCIL0LEPkrv2ry9xh5YPyUE3DYoCRfxs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rfCIL0LEPkrv2ry9xh5YPyUE3DYoCRfxs
Content-Type: multipart/mixed; boundary="FfII8onD1bqmMFBdC9Pqh0A2MvBpdlF9i";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, sean@poorly.run
Message-ID: <03fd24e8-2133-9b78-ae3b-d297ab9472b4@suse.de>
Subject: Re: [PATCH 2/6] drm/shmem-helper: Add additional KMS helpers
References: <20210203131046.22371-1-tzimmermann@suse.de>
 <20210203131046.22371-3-tzimmermann@suse.de>
 <YBqsvhIROEVLnC2L@phenom.ffwll.local>
In-Reply-To: <YBqsvhIROEVLnC2L@phenom.ffwll.local>

--FfII8onD1bqmMFBdC9Pqh0A2MvBpdlF9i
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.02.21 um 15:01 schrieb Daniel Vetter:
> On Wed, Feb 03, 2021 at 02:10:42PM +0100, Thomas Zimmermann wrote:
>> Several drivers use GEM SHMEM buffer objects as shadow buffers for
>> the actual framebuffer memory. Right now, drivers do these vmap
>> operations in their commit tail, which is actually not allowed by the
>> locking rules for the dma-buf reservation lock. The involved SHMEM
>> BO has to be vmapped in the plane's prepare_fb callback and vunmapped
>> in cleanup_fb.
>>
>> This patch introduces a DRM library that implements KMS helpers for
>> GEM SHMEM buffer objects. The first set of helpers is the plane state
>> for shadow planes. The provided implementations for prepare_fb and
>> cleanup_fb vmap and vunmap all BOs of struct drm_plane_state.fb. The
>> mappings are afterwards available in the plane's commit-tail functions=
=2E
>>
>> All rsp drivers use the simple KMS helpers, so we add the plane callba=
cks
>> and wrappers for simple KMS.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/Kconfig                    |   7 +
>>   drivers/gpu/drm/Makefile                   |   1 +
>>   drivers/gpu/drm/drm_gem_shmem_kms_helper.c | 159 +++++++++++++++++++=
++
>>   include/drm/drm_gem_shmem_kms_helper.h     |  56 ++++++++
>>   4 files changed, 223 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_gem_shmem_kms_helper.c
>>   create mode 100644 include/drm/drm_gem_shmem_kms_helper.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 8bf103de1594..b8d8b00ab5d4 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -214,6 +214,13 @@ config DRM_GEM_SHMEM_HELPER
>>   	help
>>   	  Choose this if you need the GEM shmem helper functions
>>  =20
>> +config DRM_GEM_SHMEM_KMS_HELPER
>> +	bool
>> +	depends on DRM_GEM_SHMEM_HELPER
>> +	help
>> +	help
>> +	  Choose this if you need the GEM SHMEM helper functions for KMS
>=20
> I think we should just stuff this into simple pipe helpers directly. Al=
so
> needs some kerneldoc and ideally intro section of some sorts, but I gue=
ss
> that was just missing for RFC.

The missing docs is why it's an RFC. i was concerned about the=20
additional simple-pipe callbacks, but I'm glad you're OK with them. I=20
thought about simple_pipe state (as you mentioned below) or=20
drm_private_state, but found it all too complex for this simple problem.

>=20
> Thinking a bit bigger and looking at the first patch, I wonder whether =
we
> shouldn't outright integrate this simple pipe helpers. Adding all the
> hooks for plane_state (instead of a simple_pipe_state or something like=

> that) feels a bit icky to me. But on the driver side the integration wi=
th
> just the single macro line is very neat, so that's redeeming feature.

I do disagree with integrating the shadow-plane code into simple-pipe.=20
Right now it's SHMEM-depended and CMA-based simple-pipe drivers would=20
probably not want to depend on this. The other reason is that I can=20
certainly generalize the shadow planes away from SHMEM helpers; and use=20
them for these vbox and ast patchsets as well. These drivers use VRAM=20
helpers and full KMS helpers. I guess shadow planes could then be moved=20
into drm_gem_framebuffer.c. There's other plane-helper code there already=
=2E

Unfortunately, I only realized this after sending out the patch set. :)

Best regards
Thomas

>=20
> Note doing a drm_simple_display_pipe_state would be a bit tricky to do,=

> since we'd need custome duplicate_state functions to make sure there's
> only ever exactly one:
>=20
> struct drm_simple_display_pipe_state {
> 	struct drm_crtc_state crtc_state;
> 	struct drm_plane_state plane_state;
>=20
> 	struct dma_buf_map map[4];
> };
>=20
> But that's a bit a bigger step, maybe when we also need to subclass crt=
c
> stuff we can look into this. Or maybe that's then too much feature cree=
p,
> dunno. Implemenation shouldn't be too tricky:
> - crtc state just duplicates itself (including plane_state duplication)=
=2E
>    In release it also cleans up the plane state.
> - plane state grabs the crtc state instead, and then does a cast. destr=
oy
>    hook does nothing (to avoid touching freed memory, since we always d=
upe
>    the crtc state when the plane state exists we know the crtc destroy =
hook
>    will clean things up).
>=20
> That means drm_atomic_state has 2 pointers pointing into the same
> allocation, but that should be all fine.
>=20
> Aside from this bikeshed here pondering a bit how this best first into =
our
> simple pipe helpers I think this all looks very clean.
> -Daniel
>=20
>> +
>>   config DRM_SCHED
>>   	tristate
>>   	depends on DRM
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 926adef289db..37a73dee5baf 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -53,6 +53,7 @@ drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) +=3D dr=
m_fb_helper.o
>>   drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) +=3D drm_fb_cma_helper.o=

>>   drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) +=3D drm_dp_aux_dev.o
>>   drm_kms_helper-$(CONFIG_DRM_DP_CEC) +=3D drm_dp_cec.o
>> +drm_kms_helper-$(CONFIG_DRM_GEM_SHMEM_KMS_HELPER) +=3D drm_gem_shmem_=
kms_helper.o
>>  =20
>>   obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
>>   obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D selftests/
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_kms_helper.c b/drivers/gpu/=
drm/drm_gem_shmem_kms_helper.c
>> new file mode 100644
>> index 000000000000..8843c5837f98
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_gem_shmem_kms_helper.c
>> @@ -0,0 +1,159 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <drm/drm_atomic_state_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_shmem_helper.h>
>> +#include <drm/drm_gem_shmem_kms_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>> +/*
>> + * Helpers for struct drm_plane_funcs
>> + *
>> + */
>> +
>> +static struct drm_plane_state *
>> +drm_gem_shmem_duplicate_shadow_plane_state(struct drm_plane *plane,
>> +					   struct drm_plane_state *plane_state)
>> +{
>> +	struct drm_gem_shmem_shadow_plane_state *new_shadow_plane_state;
>> +
>> +	if (!plane_state)
>> +		return NULL;
>> +
>> +	new_shadow_plane_state =3D kzalloc(sizeof(*new_shadow_plane_state), =
GFP_KERNEL);
>> +	if (!new_shadow_plane_state)
>> +		return NULL;
>> +	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_s=
tate->base);
>> +
>> +	return &new_shadow_plane_state->base;
>> +}
>> +
>> +static void drm_gem_shmem_destroy_shadow_plane_state(struct drm_plane=
 *plane,
>> +						     struct drm_plane_state *plane_state)
>> +{
>> +	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =3D
>> +		to_drm_gem_shmem_shadow_plane_state(plane_state);
>> +
>> +	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
>> +	kfree(shadow_plane_state);
>> +}
>> +
>> +static void drm_gem_shmem_reset_shadow_plane(struct drm_plane *plane)=

>> +{
>> +	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state;
>> +
>> +	if (plane->state) {
>> +		drm_gem_shmem_destroy_shadow_plane_state(plane, plane->state);
>> +		plane->state =3D NULL; /* must be set to NULL here */
>> +	}
>> +
>> +	shadow_plane_state =3D kzalloc(sizeof(*shadow_plane_state), GFP_KERN=
EL);
>> +	if (!shadow_plane_state)
>> +		return;
>> +	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
>> +}
>> +
>> +/*
>> + * Helpers for struct drm_plane_helper_funcs
>> + */
>> +
>> +static int drm_gem_shmem_prepare_shadow_fb(struct drm_plane *plane,
>> +					   struct drm_plane_state *plane_state)
>> +{
>> +	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =3D
>> +		to_drm_gem_shmem_shadow_plane_state(plane_state);
>> +	struct drm_framebuffer *fb =3D plane_state->fb;
>> +	struct drm_gem_object *obj;
>> +	struct dma_buf_map map;
>> +	int ret;
>> +	size_t i;
>> +
>> +	if (!fb)
>> +		return 0;
>> +
>> +	ret =3D drm_gem_fb_prepare_fb(plane, plane_state);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(shadow_plane_state->map); ++i) {
>> +		obj =3D drm_gem_fb_get_obj(fb, i);
>> +		if (!obj)
>> +			continue;
>> +		ret =3D drm_gem_shmem_vmap(obj, &map);
>> +		if (ret)
>> +			goto err_drm_gem_shmem_vunmap;
>> +		shadow_plane_state->map[i] =3D map;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_drm_gem_shmem_vunmap:
>> +	while (i) {
>> +		--i;
>> +		obj =3D drm_gem_fb_get_obj(fb, i);
>> +		if (!obj)
>> +			continue;
>> +		drm_gem_shmem_vunmap(obj, &shadow_plane_state->map[i]);
>> +	}
>> +	return ret;
>> +}
>> +
>> +static void drm_gem_shmem_cleanup_shadow_fb(struct drm_plane *plane,
>> +					    struct drm_plane_state *plane_state)
>> +{
>> +	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =3D
>> +		to_drm_gem_shmem_shadow_plane_state(plane_state);
>> +	struct drm_framebuffer *fb =3D plane_state->fb;
>> +	size_t i =3D ARRAY_SIZE(shadow_plane_state->map);
>> +	struct drm_gem_object *obj;
>> +
>> +	if (!fb)
>> +		return;
>> +
>> +	while (i) {
>> +		--i;
>> +		obj =3D drm_gem_fb_get_obj(fb, i);
>> +		if (!obj)
>> +			continue;
>> +		drm_gem_shmem_vunmap(obj, &shadow_plane_state->map[i]);
>> +	}
>> +}
>> +
>> +/*
>> + * Simple KMS helpers
>> + */
>> +
>> +int drm_gem_shmem_simple_kms_prepare_shadow_fb(struct drm_simple_disp=
lay_pipe *pipe,
>> +					       struct drm_plane_state *plane_state)
>> +{
>> +	return drm_gem_shmem_prepare_shadow_fb(&pipe->plane, plane_state);
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_simple_kms_prepare_shadow_fb);
>> +
>> +void drm_gem_shmem_simple_kms_cleanup_shadow_fb(struct drm_simple_dis=
play_pipe *pipe,
>> +						struct drm_plane_state *plane_state)
>> +{
>> +	drm_gem_shmem_cleanup_shadow_fb(&pipe->plane, plane_state);
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_simple_kms_cleanup_shadow_fb);
>> +
>> +void drm_gem_shmem_simple_kms_reset_shadow_plane(struct drm_simple_di=
splay_pipe *pipe)
>> +{
>> +	drm_gem_shmem_reset_shadow_plane(&pipe->plane);
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_simple_kms_reset_shadow_plane);
>> +
>> +struct drm_plane_state *
>> +drm_gem_shmem_simple_kms_duplicate_shadow_plane_state(struct drm_simp=
le_display_pipe *pipe,
>> +						      struct drm_plane_state *plane_state)
>> +{
>> +	return drm_gem_shmem_duplicate_shadow_plane_state(&pipe->plane, plan=
e_state);
>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_simple_kms_duplicate_shadow_plane_state);=

>> +
>> +void drm_gem_shmem_simple_kms_destroy_shadow_plane_state(struct drm_s=
imple_display_pipe *pipe,
>> +							 struct drm_plane_state *plane_state)
>> +{
>> +	drm_gem_shmem_destroy_shadow_plane_state(&pipe->plane, plane_state);=

>> +}
>> +EXPORT_SYMBOL(drm_gem_shmem_simple_kms_destroy_shadow_plane_state);
>> diff --git a/include/drm/drm_gem_shmem_kms_helper.h b/include/drm/drm_=
gem_shmem_kms_helper.h
>> new file mode 100644
>> index 000000000000..bd42c9c0a39e
>> --- /dev/null
>> +++ b/include/drm/drm_gem_shmem_kms_helper.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __DRM_GEM_SHMEM_KMS_HELPER_H__
>> +#define __DRM_GEM_SHMEM_KMS_HELPER_H__
>> +
>> +#include <linux/dma-buf-map.h>
>> +
>> +#include <drm/drm_plane.h>
>> +
>> +struct drm_simple_display_pipe;
>> +
>> +struct drm_gem_shmem_shadow_plane_state {
>> +	struct drm_plane_state base;
>> +
>> +	/* Transitional state - do not export or duplicate */
>> +
>> +	struct dma_buf_map map[4];
>> +};
>> +
>> +static inline struct drm_gem_shmem_shadow_plane_state *
>> +to_drm_gem_shmem_shadow_plane_state(struct drm_plane_state *state)
>> +{
>> +	return container_of(state, struct drm_gem_shmem_shadow_plane_state, =
base);
>> +}
>> +
>> +/*
>> + * Simple KMS helpers
>> + */
>> +
>> +int drm_gem_shmem_simple_kms_prepare_shadow_fb(struct drm_simple_disp=
lay_pipe *pipe,
>> +					       struct drm_plane_state *plane_state);
>> +void drm_gem_shmem_simple_kms_cleanup_shadow_fb(struct drm_simple_dis=
play_pipe *pipe,
>> +						struct drm_plane_state *plane_state);
>> +void drm_gem_shmem_simple_kms_reset_shadow_plane(struct drm_simple_di=
splay_pipe *pipe);
>> +struct drm_plane_state *
>> +drm_gem_shmem_simple_kms_duplicate_shadow_plane_state(struct drm_simp=
le_display_pipe *pipe,
>> +						      struct drm_plane_state *plane_state);
>> +void
>> +drm_gem_shmem_simple_kms_destroy_shadow_plane_state(struct drm_simple=
_display_pipe *pipe,
>> +						    struct drm_plane_state *plane_state);
>> +
>> +/**
>> + * DRM_GEM_SHMEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS -
>> + *	Initializes struct drm_simple_display_pipe_funcs for SHMEM shadow =
planes
>> + *
>> + * Drivers may use GEM SHMEM BOs as shadow buffers over the framebuff=
er memory. This
>> + * macro initializes struct drm_simple_display_pipe_funcs to use the =
rsp helper functions.
>> + */
>> +#define DRM_GEM_SHMEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS \
>> +	.prepare_fb =3D drm_gem_shmem_simple_kms_prepare_shadow_fb, \
>> +	.cleanup_fb =3D drm_gem_shmem_simple_kms_cleanup_shadow_fb, \
>> +	.reset_plane =3D drm_gem_shmem_simple_kms_reset_shadow_plane, \
>> +	.duplicate_plane_state =3D drm_gem_shmem_simple_kms_duplicate_shadow=
_plane_state, \
>> +	.destroy_plane_state   =3D drm_gem_shmem_simple_kms_destroy_shadow_p=
lane_state
>> +
>> +#endif /* __DRM_GEM_SHMEM_KMS_HELPER_H__ */
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


--FfII8onD1bqmMFBdC9Pqh0A2MvBpdlF9i--

--rfCIL0LEPkrv2ry9xh5YPyUE3DYoCRfxs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAasokFAwAAAAAACgkQlh/E3EQov+Ay
8g/6AmekIoHVlSYLMn0s262whLelwjolYm/G7sREuCACj6OcWVG4s/7TI4oE0wf2R1T9o5dIjXP2
O5hPqTVyq8CUB27mRfgz7iWiM6FLRso3fjf/PW9PRArkMZ1Zc/oeKOwC7wU3vv86e/T1FGUSPrMx
n9rWWjpWaQPBWehgWstBiY+lHhYpRiaMKFS27wz4LfKdRo5b6DtSdwMHcHJw+UPdpmLeT/EfN8oe
S5MKridcn0QqyKiAJ8khYkwR4sXAdqSPACTE95+GTvt4HILMVgl3yGSkaDDVhUxnmiaouj97f43m
fU9rcf4YvYcR8myw5Uj+9nl+DP+9EUqBoKAGciYgg6Sx24gJLjMxMCLbbweEq4Gj/U7JpI49up3y
iKyDZW6awUjbDOOTjjtrJRJibgeeTxqm4Rkj1LT7BFaFSN6eWbTxlhWhsQeG6sdBk/EIyIFNZKOl
6KSKrRqL+vNkK9mgigtcCnY2RdlfPhfrpv/7g8STqyizehIbXox3ufvs7FeFZ4jiI4M0Z8YmIcTX
dLP2TSw+zmH/kB9Pq+jpvAUHNDJzGLKVrgLHDe0jwp9LDzCXi/EnO8arSIcusNGT/HoMAzCwsSdb
P2JqinrfcRB0WHV3IGMhK1InGzyqiELR8zXIyO0AQeVcHi+BsQuyI9hGyOkPOTV0jg9GwNymF3QO
+1c=
=lw96
-----END PGP SIGNATURE-----

--rfCIL0LEPkrv2ry9xh5YPyUE3DYoCRfxs--

--===============1367892307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1367892307==--
