Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7EA7C99CC
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 17:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25C010E110;
	Sun, 15 Oct 2023 15:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085B10E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1697384256; x=1697643456;
 bh=8BBhZx/oYqQAhSV5FykVPMwsfqhMw4AqDKL0Y1ylAG8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=NEnE2sSYpGroarwZBJn9UG7Vd3T/SU9lIFUQBU0roBwUd5kYWvnkZd+PE/gfyC9kJ
 AII9PiOwRmXDOXmDksaTTBp7RXfL/wJmMDsGB5YfuEv3FcOuK3MMKO1lZZrhiILREb
 zWzQBw1WvwwnGOaCEnVZtSjXYhaaQgHN3Pkd2VESAO1hFT2SqKiaB5YK+WyvqTJ6lv
 Rnl3pZMoEHBiRoMiZmwHxsIUihF+JdDghdI3BVOZeLTTtzJP9m6J9KEDe402nhlPED
 8gBHR3V24zBQMjRXKhg6vbNIvDOlNg3XVzfS4+bE/HE8fUzVp2+6ulB9pmwTLBPI7E
 3gI1ZhqPqdnJA==
Date: Sun, 15 Oct 2023 15:37:25 +0000
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 5/6] drm: Refuse to async flip with atomic prop changes
Message-ID: <1vjWvRxgo-TI_cWpN8HouVtqP0eftQcTA58yrbbelGK02RChNF3owgcgZJVjjREIBnz3RXwtPuRHh2pGI4qMkSmG4UCiY_4T6D0V1TjBjE0=@emersion.fr>
In-Reply-To: <20230815185710.159779-6-andrealmeid@igalia.com>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <20230815185710.159779-6-andrealmeid@igalia.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: pierre-eric.pelloux-prayer@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, hwentlan@amd.com,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 15th, 2023 at 20:57, Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:

> Given that prop changes may lead to modesetting, which would defeat the
> fast path of the async flip, refuse any atomic prop change for async
> flips in atomic API. The only exceptions are the framebuffer ID to flip
> to and the mode ID, that could be referring to an identical mode.
>=20
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> v4: new patch
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  5 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   | 52 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/drm_crtc_internal.h |  2 +-
>  drivers/gpu/drm/drm_mode_object.c   |  2 +-
>  4 files changed, 56 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 2c2c9caf0be5..1e2973f0e1f6 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -629,6 +629,11 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  =09=09WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
>=20
>  =09=09if (!drm_mode_equal(&old_crtc_state->mode, &new_crtc_state->mode))=
 {
> +=09=09=09if (new_crtc_state->async_flip) {
> +=09=09=09=09drm_dbg_atomic(dev, "[CRTC:%d:%s] no mode changes allowed du=
ring async flip\n",
> +=09=09=09=09=09       crtc->base.id, crtc->name);
> +=09=09=09=09return -EINVAL;
> +=09=09=09}

Hmm, so, I've been going back and forth about this for a loooooong time. Ea=
ch
time I convince myself that one of the options we have is a good solution, =
I
think of the drawbacks and change my mind. To sum up:

- Forbid non-FB_ID props from being included in the atomic commit: makes it
  painful for compositors, they need to have a special tearing codepath for=
 no
  real reason and the tearing API doesn't work the same as the non-tearing =
API
  as Pekka said.
- Check any non-FB_ID props in the atomic commit, forbid changes here: we n=
eed
  to use get_property(), which is a bit weird back-and-forth between u64s u=
sed
  in the uAPI and actual underlying values stored in DRM structs. And the
  MODE_ID check is a bit split between the set_property() function and the
  check_modeset() one. Ideally we'd have a something_changed bool like we h=
ave
  for modesets (mode_changed) but that would be a massive pain to plumb thr=
ough
  all of the props. Also get_property() is lightweight, it just casts whate=
ver
  struct field is being used to u64 and that's it.

All in all, I think I'd settle on the approach in this patch, but I'd prefe=
r to
leave the MODE_ID stuff out. It would result in a less convoluted check, an=
d I
can't think of any current compositor which re-creates the mode blob each
page-flip. That's not 100% consistent with the sync page-flip API, but I'm
worried about accumulating more special cases like this in the future.

Does that make sense?

>  =09=09=09drm_dbg_atomic(dev, "[CRTC:%d:%s] mode changed\n",
>  =09=09=09=09       crtc->base.id, crtc->name);
>  =09=09=09new_crtc_state->mode_changed =3D true;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index dfd4cf7169df..536c21f53b5f 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -972,13 +972,28 @@ int drm_atomic_connector_commit_dpms(struct drm_ato=
mic_state *state,
>  =09return ret;
>  }
>=20
> +static int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint=
64_t prop_value,
> +=09=09=09=09=09 struct drm_property *prop)
> +{
> +=09if (ret !=3D 0 || old_val !=3D prop_value) {
> +=09=09drm_dbg_atomic(prop->dev,
> +=09=09=09       "[PROP:%d:%s] No prop can be changed during async flip\n=
",
> +=09=09=09       prop->base.id, prop->name);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> +
>  int drm_atomic_set_property(struct drm_atomic_state *state,
>  =09=09=09    struct drm_file *file_priv,
>  =09=09=09    struct drm_mode_object *obj,
>  =09=09=09    struct drm_property *prop,
> -=09=09=09    uint64_t prop_value)
> +=09=09=09    uint64_t prop_value,
> +=09=09=09    bool async_flip)
>  {
>  =09struct drm_mode_object *ref;
> +=09uint64_t old_val;
>  =09int ret;
>=20
>  =09if (!drm_property_change_valid_get(prop, prop_value, &ref))
> @@ -995,6 +1010,13 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>  =09=09=09break;
>  =09=09}
>=20
> +=09=09if (async_flip) {
> +=09=09=09ret =3D drm_atomic_connector_get_property(connector, connector_=
state,
> +=09=09=09=09=09=09=09=09prop, &old_val);
> +=09=09=09ret =3D drm_atomic_check_prop_changes(ret, old_val, prop_value,=
 prop);

Note to self: I was worried here to pass the "next" state to get_property()=
,
but it's before the set_property() call on that state, so should be fine.

> +=09=09=09break;
> +=09=09}
> +
>  =09=09ret =3D drm_atomic_connector_set_property(connector,
>  =09=09=09=09connector_state, file_priv,
>  =09=09=09=09prop, prop_value);
> @@ -1003,6 +1025,7 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>  =09case DRM_MODE_OBJECT_CRTC: {
>  =09=09struct drm_crtc *crtc =3D obj_to_crtc(obj);
>  =09=09struct drm_crtc_state *crtc_state;
> +=09=09struct drm_mode_config *config =3D &crtc->dev->mode_config;
>=20
>  =09=09crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
>  =09=09if (IS_ERR(crtc_state)) {
> @@ -1010,6 +1033,18 @@ int drm_atomic_set_property(struct drm_atomic_stat=
e *state,
>  =09=09=09break;
>  =09=09}
>=20
> +=09=09/*
> +=09=09 * We allow mode_id changes here for async flips, because we
> +=09=09 * check later on drm_atomic_helper_check_modeset() callers if
> +=09=09 * there are modeset changes or they are equal
> +=09=09 */
> +=09=09if (async_flip && prop !=3D config->prop_mode_id) {
> +=09=09=09ret =3D drm_atomic_crtc_get_property(crtc, crtc_state,
> +=09=09=09=09=09=09=09   prop, &old_val);
> +=09=09=09ret =3D drm_atomic_check_prop_changes(ret, old_val, prop_value,=
 prop);
> +=09=09=09break;
> +=09=09}
> +
>  =09=09ret =3D drm_atomic_crtc_set_property(crtc,
>  =09=09=09=09crtc_state, prop, prop_value);
>  =09=09break;
> @@ -1017,6 +1052,7 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>  =09case DRM_MODE_OBJECT_PLANE: {
>  =09=09struct drm_plane *plane =3D obj_to_plane(obj);
>  =09=09struct drm_plane_state *plane_state;
> +=09=09struct drm_mode_config *config =3D &plane->dev->mode_config;
>=20
>  =09=09plane_state =3D drm_atomic_get_plane_state(state, plane);
>  =09=09if (IS_ERR(plane_state)) {
> @@ -1024,6 +1060,13 @@ int drm_atomic_set_property(struct drm_atomic_stat=
e *state,
>  =09=09=09break;
>  =09=09}
>=20
> +=09=09if (async_flip && prop !=3D config->prop_fb_id) {
> +=09=09=09ret =3D drm_atomic_plane_get_property(plane, plane_state,
> +=09=09=09=09=09=09=09    prop, &old_val);
> +=09=09=09ret =3D drm_atomic_check_prop_changes(ret, old_val, prop_value,=
 prop);
> +=09=09=09break;
> +=09=09}
> +
>  =09=09ret =3D drm_atomic_plane_set_property(plane,
>  =09=09=09=09plane_state, file_priv,
>  =09=09=09=09prop, prop_value);
> @@ -1312,6 +1355,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  =09struct drm_out_fence_state *fence_state;
>  =09int ret =3D 0;
>  =09unsigned int i, j, num_fences;
> +=09bool async_flip =3D false;
>=20
>  =09/* disallow for drivers not supporting atomic: */
>  =09if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
> @@ -1348,6 +1392,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  =09=09=09=09       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supporte=
d with atomic\n");
>  =09=09=09return -EINVAL;
>  =09=09}
> +
> +=09=09async_flip =3D true;
>  =09}
>=20
>  =09/* can't test and expect an event at the same time. */
> @@ -1427,8 +1473,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  =09=09=09=09goto out;
>  =09=09=09}
>=20
> -=09=09=09ret =3D drm_atomic_set_property(state, file_priv,
> -=09=09=09=09=09=09      obj, prop, prop_value);
> +=09=09=09ret =3D drm_atomic_set_property(state, file_priv, obj,
> +=09=09=09=09=09=09      prop, prop_value, async_flip);
>  =09=09=09if (ret) {
>  =09=09=09=09drm_mode_object_put(obj);
>  =09=09=09=09goto out;
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index 501a10edd0e1..381130cebe81 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -251,7 +251,7 @@ int drm_atomic_set_property(struct drm_atomic_state *=
state,
>  =09=09=09    struct drm_file *file_priv,
>  =09=09=09    struct drm_mode_object *obj,
>  =09=09=09    struct drm_property *prop,
> -=09=09=09    uint64_t prop_value);
> +=09=09=09    uint64_t prop_value, bool async_flip);
>  int drm_atomic_get_property(struct drm_mode_object *obj,
>  =09=09=09    struct drm_property *property, uint64_t *val);
>=20
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode=
_object.c
> index ba1608effc0f..64f519254895 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -536,7 +536,7 @@ static int set_property_atomic(struct drm_mode_object=
 *obj,
>  =09=09=09=09=09=09       obj_to_connector(obj),
>  =09=09=09=09=09=09       prop_value);
>  =09} else {
> -=09=09ret =3D drm_atomic_set_property(state, file_priv, obj, prop, prop_=
value);
> +=09=09ret =3D drm_atomic_set_property(state, file_priv, obj, prop, prop_=
value, false);
>  =09=09if (ret)
>  =09=09=09goto out;
>  =09=09ret =3D drm_atomic_commit(state);
> --
> 2.41.0
