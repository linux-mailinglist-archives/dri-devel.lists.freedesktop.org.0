Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E75175AA82
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966BA10E099;
	Thu, 20 Jul 2023 09:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C01610E099
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:20:57 +0000 (UTC)
Date: Thu, 20 Jul 2023 09:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689844855; x=1690104055;
 bh=QSTlkep2gvU1lpBhG3metLfc4qjy+I16fMFydkJ+a/o=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=kdB2nhmeVr/QnAny4hP254fGyWt2hdCWjU4hOOjZTYb/W+rAut+7MWc3lNea+WnJV
 AFVVcw+/mO0u71QVrZlDdBLMX1Mt4xVRMRZwwdA6ZKwWsarxf9LhJdfz/Dd7PMfagp
 dBiK9WOekHl5ot2Cxv6b90Cbn+fzpD/dVgBx+YP54LtZ6ONby5sWhy8orIMV9DWGMU
 Ax5gW2LsyQvnxK5QlBs0VkTR1n4ur0pvHgHJH0vgzOzS/yZj0upYV9WL/9a3rIZoxQ
 lxmp3G2XgXsSSBX8Nc9y3+V9oYzlJqf7iHNQnFomCBoeUW/GiwygD7rLZN4k/zqdby
 61IBCBpJJy9Yw==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 2/9] drm/atomic: Add support for mouse hotspots
Message-ID: <U-YIMqatVKkZH9FlOrhSidTMeJ4y4YUl0eWHhVWdModT28d-uXePM4S1snszE0g6ERCjizuOp5_aypLlnRg47PM8_xJdLu-pPHESIp150i8=@emersion.fr>
In-Reply-To: <20230719014218.1700057-3-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-3-zack@kde.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, javierm@redhat.com, banackm@vmware.com,
 krastevm@vmware.com, ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, July 19th, 2023 at 03:42, Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Atomic modesetting code lacked support for specifying mouse cursor
> hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
> the hotspot but the functionality was not implemented in the new atomic
> paths.
>=20
> Due to the lack of hotspots in the atomic paths userspace compositors
> completely disable atomic modesetting for drivers that require it (i.e.
> all paravirtualized drivers).
>=20
> This change adds hotspot properties to the atomic codepaths throughtout
> the DRM core and will allow enabling atomic modesetting for virtualized
> drivers in the userspace.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++
>  drivers/gpu/drm/drm_plane.c               | 50 +++++++++++++++++++++++
>  include/drm/drm_plane.h                   | 14 +++++++
>  4 files changed, 98 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 784e63d70a42..54975de44a0e 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -275,6 +275,20 @@ void __drm_atomic_helper_plane_state_reset(struct dr=
m_plane_state *plane_state,
>  =09=09=09plane_state->normalized_zpos =3D val;
>  =09=09}
>  =09}
> +
> +=09if (plane->hotspot_x_property) {
> +=09=09if (!drm_object_property_get_default_value(&plane->base,
> +=09=09=09=09=09=09=09   plane->hotspot_x_property,
> +=09=09=09=09=09=09=09   &val))
> +=09=09=09plane_state->hotspot_x =3D val;
> +=09}
> +
> +=09if (plane->hotspot_y_property) {
> +=09=09if (!drm_object_property_get_default_value(&plane->base,
> +=09=09=09=09=09=09=09   plane->hotspot_y_property,
> +=09=09=09=09=09=09=09   &val))
> +=09=09=09plane_state->hotspot_y =3D val;
> +=09}
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 98d3b10c08ae..07a7b3f18df2 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -593,6 +593,22 @@ static int drm_atomic_plane_set_property(struct drm_=
plane *plane,
>  =09} else if (plane->funcs->atomic_set_property) {
>  =09=09return plane->funcs->atomic_set_property(plane, state,
>  =09=09=09=09property, val);
> +=09} else if (property =3D=3D plane->hotspot_x_property) {
> +=09=09if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> +=09=09=09drm_dbg_atomic(plane->dev,
> +=09=09=09=09       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> +=09=09=09=09       plane->base.id, plane->name, val);
> +=09=09=09return -EINVAL;
> +=09=09}

Hm, it sounds a bit weird to catch this case here. Wouldn't it be a driver =
bug
to attach the hotspot props to a plane which isn't a cursor? Wouldn't it ma=
ke
more sense to WARN in drm_plane_create_hotspot_properties() if a driver
attempts to do so?

> +=09=09state->hotspot_x =3D val;
> +=09} else if (property =3D=3D plane->hotspot_y_property) {
> +=09=09if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> +=09=09=09drm_dbg_atomic(plane->dev,
> +=09=09=09=09       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> +=09=09=09=09       plane->base.id, plane->name, val);
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09state->hotspot_y =3D val;
>  =09} else {
>  =09=09drm_dbg_atomic(plane->dev,
>  =09=09=09       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
> @@ -653,6 +669,10 @@ drm_atomic_plane_get_property(struct drm_plane *plan=
e,
>  =09=09*val =3D state->scaling_filter;
>  =09} else if (plane->funcs->atomic_get_property) {
>  =09=09return plane->funcs->atomic_get_property(plane, state, property, v=
al);
> +=09} else if (property =3D=3D plane->hotspot_x_property) {
> +=09=09*val =3D state->hotspot_x;
> +=09} else if (property =3D=3D plane->hotspot_y_property) {
> +=09=09*val =3D state->hotspot_y;
>  =09} else {
>  =09=09drm_dbg_atomic(dev,
>  =09=09=09       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index c6bbb0c209f4..eaca367bdc7e 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -230,6 +230,47 @@ static int create_in_format_blob(struct drm_device *=
dev, struct drm_plane *plane
>  =09return 0;
>  }
>=20
> +/**
> + * drm_plane_create_hotspot_properties - creates the mouse hotspot
> + * properties and attaches them to the given cursor plane
> + *
> + * @plane: drm cursor plane
> + *
> + * This function enables the mouse hotspot property on a given
> + * cursor plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
> +{
> +=09struct drm_property *prop_x;
> +=09struct drm_property *prop_y;
> +
> +=09drm_WARN_ON(plane->dev,
> +=09=09    !drm_core_check_feature(plane->dev,
> +=09=09=09=09=09    DRIVER_CURSOR_HOTSPOT));
> +
> +=09prop_x =3D drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X=
",
> +=09=09=09=09=09=09  INT_MIN, INT_MAX);

This is an atomic-only property, the DRM_MODE_PROP_ATOMIC flag should be pa=
ssed.

> +=09if (IS_ERR(prop_x))
> +=09=09return PTR_ERR(prop_x);
> +
> +=09prop_y =3D drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y=
",
> +=09=09=09=09=09=09  INT_MIN, INT_MAX);
> +=09if (IS_ERR(prop_y)) {
> +=09=09drm_property_destroy(plane->dev, prop_x);
> +=09=09return PTR_ERR(prop_y);
> +=09}
> +
> +=09drm_object_attach_property(&plane->base, prop_x, 0);
> +=09drm_object_attach_property(&plane->base, prop_y, 0);
> +=09plane->hotspot_x_property =3D prop_x;
> +=09plane->hotspot_y_property =3D prop_y;
> +
> +=09return 0;
> +}
