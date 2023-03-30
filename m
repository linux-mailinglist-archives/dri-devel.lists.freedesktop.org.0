Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6536D0136
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2BF10EDA1;
	Thu, 30 Mar 2023 10:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA61510EDA1;
 Thu, 30 Mar 2023 10:29:59 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 254436603183;
 Thu, 30 Mar 2023 11:29:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680172198;
 bh=vhjPj2kbm5Y+A7eBhdKagL7l5yP2aUIRVOpwAuAvMkU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a+QEpWKjQf2mBR45mYJW5s5DVqXq36DpFolUyyDsF/NrifWl2ZnkgDh06z0z7RkMR
 SiGpykaCFzIEqZEv+tx+Dl04w6wBgzIIJ974o7korEgCBWbdNBIuehSdfhy1ZO8r5k
 OqARfU/dshCd89B6mWhw4+UOs9qmrqkz7igarMXXoWX5CtSOZ7DFTeqvqJDGm4O2GN
 Llh2R9XfQoEyYpQ+uGjJwovGISy47SwdcNw/qTFvD3XK5mjwtJlYJT0gpaXC5jP4jP
 oEat5Cb5MVb/plkG88EaVxQHUQCQ+K3+2nKKR+1PgmX8g619YpB5NV096gJVDc3i3M
 k8xmY5iVAzriQ==
Date: Thu, 30 Mar 2023 13:29:54 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [RFC][PATCH v2 1/3] drm: Introduce plane SIZE_HINTS property
Message-ID: <20230330132954.42b1db21.pekka.paalanen@collabora.com>
In-Reply-To: <20230321143643.26676-2-ville.syrjala@linux.intel.com>
References: <20230321143643.26676-1-ville.syrjala@linux.intel.com>
 <20230321143643.26676-2-ville.syrjala@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023 16:36:41 +0200
Ville Syrjala <ville.syrjala@linux.intel.com> wrote:

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
>=20
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
> The blob contains explicit min and max plane sizes, as
> well as a 2D bitmap representing all the square and non-square
> power of two sizes between the min and max.
>=20
> Note that the reported sizes (either via the property or the
> caps) make no claims about things such as plane scaling. So
> these things should only really be consulted for simple
> "cursor like" use cases.
>=20
> v2: Try to add some docs
> v3: Specify that value 0 is reserved for future use (basic idea from Jona=
s)
>     Drop the note about typical hardware (Pekka)
> v4: Total redesign to include the 2D bitmap
>=20
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c |  7 +++
>  drivers/gpu/drm/drm_plane.c       | 96 +++++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h     |  5 ++
>  include/drm/drm_plane.h           |  6 ++
>  include/uapi/drm/drm_mode.h       | 29 ++++++++++
>  5 files changed, 143 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 87eb591fe9b5..21860f94a18c 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struc=
t drm_device *dev)
>  		return -ENOMEM;
>  	dev->mode_config.modifiers_property =3D prop;
> =20
> +	prop =3D drm_property_create(dev,
> +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> +				   "SIZE_HINTS", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +	dev->mode_config.size_hints_property =3D prop;
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..fb9cee504767 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -140,6 +140,27 @@
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
> + *     For optimal usage userspace should pick the smallest size
> + *     that satisfies its own requirements.
> + *
> + *     The blob contains explicit min/max sizes, as well as a 2D bitmap
> + *     representign all square and non-square POT sizes between.
> + *
> + *     Drivers should only attach this property to planes that
> + *     support a very limited set of sizes.
> + *
> + *     Note that property value 0 (ie. no blob) is reserved for potential
> + *     future use. Current userspace is expected to ignore the property
> + *     if the value is 0, and fall back to some other means (eg.
> + *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
> + *     the appropriate plane size to use.
>   */
> =20
>  static unsigned int drm_num_planes(struct drm_device *dev)
> @@ -1582,3 +1603,78 @@ int drm_plane_create_scaling_filter_property(struc=
t drm_plane *plane,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> +
> +static int hint_dim(int x, int x0, int w, int min, int max)
> +{
> +	if (x =3D=3D 0)
> +		return min;
> +	else if (x =3D=3D w - 1)
> +		return max;
> +	else
> +		return 1 << (x0 + x);
> +}
> +
> +/**
> + * drm_plane_add_size_hint_property - create a size hint property
> + *
> + * @plane: drm plane
> + * @min_width: minimum width
> + * @min_height: minimum height
> + * @max_width: maximum width
> + * @max_height: maximum height
> + * @cursor_size_ok: function to check if specified size is ok
> + *
> + * Create a size hints property for the plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +				      int min_width, int min_height,
> +				      int max_width, int max_height,
> +				      bool (*size_ok)(struct drm_plane *plane,
> +						      int width, int height))
> +{
> +	struct drm_device *dev =3D plane->dev;
> +	struct drm_mode_config *config =3D &dev->mode_config;
> +	struct drm_property_blob *blob;
> +	struct drm_plane_size_hint *hints;
> +	int x, y, x0, y0, w, h;
> +
> +	x0 =3D fls(min_width) - 1;
> +	y0 =3D fls(min_height) - 1;
> +	w =3D fls(2 * max_width - 1) - x0;
> +	h =3D fls(2 * max_height - 1) - y0;
> +
> +	blob =3D drm_property_create_blob(dev,
> +					struct_size(hints, bitmap,
> +						    DIV_ROUND_UP(w * h, 32)),
> +					NULL);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	hints =3D blob->data;
> +
> +	hints->min_width =3D min_width;
> +	hints->min_height =3D min_height;
> +	hints->max_width =3D max_width;
> +	hints->max_height =3D max_height;
> +
> +	for (y =3D 0; y < h; y++) {
> +		int height =3D hint_dim(y, y0, h, min_height, max_height);
> +
> +		for (x =3D 0; x < w; x++) {
> +			int width =3D hint_dim(x, x0, w, min_width, max_width);
> +			unsigned int bit =3D y * w + x;
> +
> +			if (size_ok(plane, width, height))
> +				hints->bitmap[bit/32] |=3D 1 << (bit & 31);
> +		}
> +	}
> +
> +	drm_object_attach_property(&plane->base, config->size_hints_property,
> +				   blob->base.id);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_add_size_hints_property);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index e5b053001d22..d5495c0804c5 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -949,6 +949,11 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *modifiers_property;
> =20
> +	/**
> +	 * @size_hints_propertty: Plane size hints property.
> +	 */
> +	struct drm_property *size_hints_property;
> +
>  	/* cursor size */
>  	uint32_t cursor_width, cursor_height;
> =20
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..6d7326f15761 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -32,6 +32,7 @@
>  #include <drm/drm_util.h>
> =20
>  struct drm_crtc;
> +struct drm_plane_size_hint;
>  struct drm_printer;
>  struct drm_modeset_acquire_ctx;
> =20
> @@ -945,5 +946,10 @@ drm_plane_get_damage_clips(const struct drm_plane_st=
ate *state);
> =20
>  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  					     unsigned int supported_filters);
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +				      int min_width, int min_height,
> +				      int max_width, int max_height,
> +				      bool (*size_ok)(struct drm_plane *plane,
> +						      int width, int height));
> =20
>  #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2f..5a1de6bd80dd 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -849,6 +849,35 @@ struct drm_color_lut {
>  	__u16 reserved;
>  };
> =20
> +/**
> + * struct drm_plane_size_hint - Plane size hints
> + *
> + * Includes a 2D bitmap in row major order of one bit per plane
> + * size (WxH). The colums represent the possible plane widths as
> + * <min>,<power of two values between min-max>,<max>
> + * the rows do the same for plane heights. The minimums and
> + * maximums need not be power of two themselves. The bits
> + * are walked in lsb->msb order.
> + *
> + * Example:
> + * min_width =3D 33, min_height =3D 16
> + * max_width =3D 128, max_height =3D 127
> + * bitmap[0] =3D 0b100111011001
> + *     33 64 128
> + * 16   *
> + * 32   *  *
> + * 64   *  *   *
> + * 127         *
> + *
> + * Indicating support for 33x16,33xx32,
> + * 64x32,64x64,128x64,128x127 sizes.
> + */
> +struct drm_plane_size_hint {
> +	__u16 min_width, min_height;
> +	__u16 max_width, max_height;
> +	__u32 bitmap[];
> +};

Hi,

as a compositor developer, I believe I could make use of this somehow.
I would probably pose the optimization problem as "what dimensions
result in the smallest area" in a compositor, iterating over the
possible and allowed widths and checking the smallest possible and
allowed height.

If you think this is a good match to hardware capabilities, it's fine
by me. The power-of-two is a pretty fundamental built-in assumption and
I have no idea how good it is.


Thanks,
pq
