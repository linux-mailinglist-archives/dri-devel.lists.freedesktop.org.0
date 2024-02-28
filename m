Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E886ABF7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D309010E9DB;
	Wed, 28 Feb 2024 10:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="ScldvGhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6887E10E9DB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1709115170; x=1709374370;
 bh=fQDfbqIUi9T3Prtvd2kouN9lFcPxRvoILP45mAvY01Q=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ScldvGhjEyPoV7yMaHQXYBSyiKXgfR+BYfk0OiP/B33hpMzmrdcXUy65GanHdUxCT
 iToYiifFMh9X0/iqQQVkc4+Ez2zIlH68VlLMteXesqTUOlcEGFC0prphC/CH7q7qO/
 sP3x6aagRAgA3Nt82LIVj8TVz62Yzts02SE6WbeVBDo/zMQswq+iy8CJTnnB4/kc5c
 a1FuA6Tro9ZB4RXKzI8YnSe+d4Vmhq2KV1YlNjFkPhGf67LzJK+TWNwRLSw9YEJzaR
 n3RU6LxxlBHamD45yFB1b7kKWDWpjE3jaXdqcdc4anERanW56Biwc5uUIEVbxBInOm
 +mYW/sKRDzaAw==
Date: Wed, 28 Feb 2024 10:12:28 +0000
To: Ville Syrjala <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <O9gQXFus9B2-UW8q8mGIm3IjY7CnWe315W6WrTAhUZTxaSjcaCFCh9xYSXnDL7jXaMHE_p_84F4X9E2S09ZQ-3qbSj-gtZsfSKt7OhMX8VU=@emersion.fr>
In-Reply-To: <20240227193523.5601-2-ville.syrjala@linux.intel.com>
References: <20240227193523.5601-1-ville.syrjala@linux.intel.com>
 <20240227193523.5601-2-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 27th, 2024 at 20:35, Ville Syrjala <ville.syrjala@linu=
x.intel.com> wrote:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Add a new immutable plane property by which a plane can advertise
> a handful of recommended plane sizes. This would be mostly exposed
> by cursor planes as a slightly more capable replacement for
> the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
> a one size fits all limit for the whole device.
>=20
> Currently eg. amdgpu/i915/nouveau just advertize the max cursor
> size via the cursor size caps. But always using the max sized
> cursor can waste a surprising amount of power, so a better
> stragey is desirable.

Typo: strategy

> Most other drivers don't specify any cursor size at all, in
> which case the ioctl code just claims that 64x64 is a great
> choice. Whether that is actually true is debatable.
>=20
> A poll of various compositor developers informs us that
> blindly probing with setcursor/atomic ioctl to determine
> suitable cursor sizes is not acceptable, thus the
> introduction of the new property to supplant the cursor
> size caps. The compositor will now be free to select a
> more optimal cursor size from the short list of options.
>=20
> Note that the reported sizes (either via the property or the
> caps) make no claims about things such as plane scaling. So
> these things should only really be consulted for simple
> "cursor like" use cases.
>=20
> Userspace consumer in the form of mutter seems ready:
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165

Do we need an IGT as well to merge this new uAPI?

> v2: Try to add some docs
> v3: Specify that value 0 is reserved for future use (basic idea from Jona=
s)
>     Drop the note about typical hardware (Pekka)
> v4: Update the docs to indicate the list is "in order of preference"
>     Add a a link to the mutter MR
>=20
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c |  7 +++++
>  drivers/gpu/drm/drm_plane.c       | 52 +++++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h     |  5 +++
>  include/drm/drm_plane.h           |  4 +++
>  include/uapi/drm/drm_mode.h       | 11 +++++++
>  5 files changed, 79 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 48fd2d67f352..568972258222 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -372,6 +372,13 @@ static int drm_mode_create_standard_properties(struc=
t drm_device *dev)
>  =09=09return -ENOMEM;
>  =09dev->mode_config.modifiers_property =3D prop;
>=20
> +=09prop =3D drm_property_create(dev,
> +=09=09=09=09   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> +=09=09=09=09   "SIZE_HINTS", 0);
> +=09if (!prop)
> +=09=09return -ENOMEM;
> +=09dev->mode_config.size_hints_property =3D prop;
> +
>  =09return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 672c655c7a8e..4135ce16e608 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -140,6 +140,25 @@
>   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there hav=
e been
>   *     various bugs in this area with inconsistencies between the capabi=
lity
>   *     flag and per-plane properties.
> + *
> + * SIZE_HINTS:
> + *     Blob property which contains the set of recommended plane size
> + *     which can used for simple "cursor like" use cases (eg. no scaling=
).
> + *     Using these hints frees userspace from extensive probing of
> + *     supported plane sizes through atomic/setcursor ioctls.
> + *
> + *     The blob contains an array of struct drm_plane_size_hint, in
> + *     order of preference. For optimal usage userspace should pick
> + *     the first size that satisfies its own requirements.
> + *
> + *     Drivers should only attach this property to planes that
> + *     support a very limited set of sizes.
> + *
> + *     Note that property value 0 (ie. no blob) is reserved for potentia=
l
> + *     future use. Current userspace is expected to ignore the property
> + *     if the value is 0, and fall back to some other means (eg.
> + *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
> + *     the appropriate plane size to use.
>   */
>=20
>  static unsigned int drm_num_planes(struct drm_device *dev)
> @@ -1729,3 +1748,36 @@ int drm_plane_create_scaling_filter_property(struc=
t drm_plane *plane,
>  =09return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> +
> +/**
> + * drm_plane_add_size_hint_property - create a size hint property
> + *
> + * @plane: drm plane
> + * @hints: size hints
> + * @num_hints: number of size hints
> + *
> + * Create a size hints property for the plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +=09=09=09=09      const struct drm_plane_size_hint *hints,
> +=09=09=09=09      int num_hints)
> +{

Can we add a plane type check here, to make sure this is only attached to
cursor planes? If there is a use-case for other plane types, I'd prefer to
discuss about it first before expanding the property's scope.

With that:
Reviewed-by: Simon Ser <contact@emersion.fr>

> +=09struct drm_device *dev =3D plane->dev;
> +=09struct drm_mode_config *config =3D &dev->mode_config;
> +=09struct drm_property_blob *blob;
> +
> +=09blob =3D drm_property_create_blob(dev,
> +=09=09=09=09=09array_size(sizeof(hints[0]), num_hints),
> +=09=09=09=09=09hints);
> +=09if (IS_ERR(blob))
> +=09=09return PTR_ERR(blob);
> +
> +=09drm_object_attach_property(&plane->base, config->size_hints_property,
> +=09=09=09=09   blob->base.id);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_add_size_hints_property);
