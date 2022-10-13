Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA845FDDEA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 18:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63F510E909;
	Thu, 13 Oct 2022 16:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8310E8FB;
 Thu, 13 Oct 2022 16:02:54 +0000 (UTC)
Date: Thu, 13 Oct 2022 16:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665676970; x=1665936170;
 bh=zJQyuQkZTNJy13oIhq28i/TW2/ylTXSZQY69f1tPt1A=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=NFM8aBXb3uFEkTiPxTigwd+XLR4efbjsyxvCHG3nEAk2m/WgA4PTw1Uhx+lAuGjRh
 FYVhyuXxala0b7uGrsN376cnj8ZxSF1SrIaaa2yKjFJ1Fpzu6PZQThPWR3dkfhjSZV
 imQ1Bb+5c7K9zjA6rJzSO87olIJiQw2klCywpCaEScIPwcb7G+ebQDsdyg24N9blGZ
 lFm4VOqUVYEANklzG8yVo9adg5u3Mit6kdIQ/Ud3SUyw1eZuWdfbs8mJgx+Excf2Jd
 S+mrGNSXLBawYBDeZ+kf8dOImklJYGop3kciZGd33Gaqre3AXQ92K20WX8DLFiMt6q
 RL+X3ikZYufCg==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
Message-ID: <PJIfCPDOH8tzwE1mwv58g4ICBZbEgW44vwzW-JdUde6PjLDUeF_JNT0kUZ_Z8hZWqii_DTdDFfAYpRbO_T1Tu28wpjiwYlQpRdsrHJXLF58=@emersion.fr>
In-Reply-To: <YzcGw9myJotLRTVl@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > So no tests that actually verify that the kernel properly rejects
> > > stuff stuff like modesets, gamma LUT updates, plane movement,
> > > etc.?
> >
> > Pondering this a bit more, it just occurred to me the current driver
> > level checks might easily lead to confusing behaviour. Eg. is
> > the ioctl going to succeed if you ask for an async change of some
> > random property while the crtc disabled, but fails if you ask for
> > the same async property change when the crtc is active?
> >
> > So another reason why rejecting most properties already at
> > the uapi level might be a good idea.
>=20
> And just to be clear this is pretty much what I suggest:
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 79730fa1dd8e..471a2c703847 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1392,6 +1392,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  =09=09=09=09goto out;
>  =09=09=09}
>=20
> +=09=09=09if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC &&
> +=09=09=09    prop !=3D dev->mode_config.prop_fb_id) {
> +=09=09=09=09drm_mode_object_put(obj);
> +=09=09=09=09ret =3D -EINVAL;
> +=09=09=09=09goto out;
> +=09=09=09}
> +
>  =09=09=09if (copy_from_user(&prop_value,
>  =09=09=09=09=09   prop_values_ptr + copied_props,
>  =09=09=09=09=09   sizeof(prop_value))) {
>=20
>=20
> That would actively discourage people from even attempting the
> "just dump all the state into the ioctl" approach with async flips
> since even the props whose value isn't even changing would be rejected.

How does this sound?

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 945761968428..ffd16bdc7b83 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -972,14 +972,26 @@ int drm_atomic_set_property(struct drm_atomic_state *=
state,
 =09=09=09    struct drm_file *file_priv,
 =09=09=09    struct drm_mode_object *obj,
 =09=09=09    struct drm_property *prop,
-=09=09=09    uint64_t prop_value)
+=09=09=09    uint64_t prop_value,
+=09=09=09    bool async_flip)
 {
 =09struct drm_mode_object *ref;
 =09int ret;
+=09uint64_t old_val;
=20
 =09if (!drm_property_change_valid_get(prop, prop_value, &ref))
 =09=09return -EINVAL;
=20
+=09if (async_flip && prop !=3D prop->dev->mode_config.prop_fb_id) {
+=09=09ret =3D drm_atomic_get_property(obj, prop, &old_val);
+=09=09if (ret !=3D 0 || old_val !=3D prop_value) {
+=09=09=09drm_dbg_atomic(prop->dev,
+=09=09=09=09       "[PROP:%d:%s] cannot be changed during async flip\n",
+=09=09=09=09       prop->base.id, prop->name);
+=09=09=09return -EINVAL;
+=09=09}
+=09}
+
 =09switch (obj->type) {
 =09case DRM_MODE_OBJECT_CONNECTOR: {
 =09=09struct drm_connector *connector =3D obj_to_connector(obj);
