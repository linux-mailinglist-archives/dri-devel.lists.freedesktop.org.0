Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E64E68EE9E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F0810E75C;
	Wed,  8 Feb 2023 12:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154E810E75C;
 Wed,  8 Feb 2023 12:13:17 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 559D2660209D;
 Wed,  8 Feb 2023 12:13:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675858395;
 bh=g9j1fDmfv9xHp4xl5zbInuKsujbDL3q51aT/p61neiI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WcGSm4muMlEbkGKHSqJSMxTbVWk8tVkeee6968UPEk8rTFSKcI/ZIS6u2wnNSxWcA
 eOfFFuBOX7EKOiQXe739sAlMkXR8gapDFldSDjYs7xcuEmY9EAH8nSPpuPg/63MyT9
 G4fjpztXatoQrsf4gQomT/1MVijg6Sxe+WRWpLjxy4uCHYuOj6rfdPytx4M6Lk7X1P
 ZJw/HcPnTcIq+3+PcNWbvqbOi8WjO4M2fKEQtIbDYkwEihBEJ8UdZGjYLHvAKWLnKY
 qAun3q/2i6KkT0ifjUSQdPmtDuTE/tYpTIVd2gXprNIHWKOKDm8CfSAToXVf3AOiTD
 j7aOZPalnoxww==
Date: Wed, 8 Feb 2023 14:13:12 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <20230208141312.76df0cb0.pekka.paalanen@collabora.com>
In-Reply-To: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
 <20230208040911.12590-2-ville.syrjala@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Wed,  8 Feb 2023 06:09:10 +0200
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
> Note that the reported sizes (either via the property or the
> caps) make no claims about things such as plane scaling. So
> these things should only really be consulted for simple
> "cursor like" use cases.
>=20
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c |  7 +++++++
>  drivers/gpu/drm/drm_plane.c       | 33 +++++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h     |  5 +++++
>  include/drm/drm_plane.h           |  4 ++++
>  include/uapi/drm/drm_mode.h       |  5 +++++
>  5 files changed, 54 insertions(+)
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
> index 24e7998d1731..d0a277f4be1f 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1582,3 +1582,36 @@ int drm_plane_create_scaling_filter_property(struc=
t drm_plane *plane,
>  	return 0;
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
> +				      const struct drm_plane_size_hint *hints,
> +				      int num_hints)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +	struct drm_mode_config *config =3D &dev->mode_config;
> +	struct drm_property_blob *blob;
> +
> +	blob =3D drm_property_create_blob(dev,
> +					array_size(sizeof(hints[0]), num_hints),
> +					hints);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	drm_object_attach_property(&plane->base, config->size_hints_property,
> +				   blob->base.id);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_add_size_hints_property);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index e5b053001d22..ed9f6938dca1 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -949,6 +949,11 @@ struct drm_mode_config {
>  	 */
>  	struct drm_property *modifiers_property;
> =20
> +	/**
> +	 * @size_hints_property: Plane SIZE_HINTS property.
> +	 */
> +	struct drm_property *size_hints_property;
> +
>  	/* cursor size */
>  	uint32_t cursor_width, cursor_height;
> =20
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..1997d7d64b69 100644
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
> @@ -945,5 +946,8 @@ drm_plane_get_damage_clips(const struct drm_plane_sta=
te *state);
> =20
>  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  					     unsigned int supported_filters);
> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
> +				      const struct drm_plane_size_hint *hints,
> +				      int num_hints);
> =20
>  #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 46becedf5b2f..4f0551d7f481 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -849,6 +849,11 @@ struct drm_color_lut {
>  	__u16 reserved;
>  };
> =20
> +struct drm_plane_size_hint {
> +	__u16 width;
> +	__u16 height;
> +};

Hi Ville,

uAPI documentation is missing.

When there is just a single recommended size listed, userspace has it
easy: allocate a pair of DRM dumb buffers for each active CRTC, do
atomic test commits with those, and if the test succeeds, copy in the
pixels and fill the padding.

What if we have multiple or a huge number of possible sizes? Probably
for each KMS reconfiguration cycle (which could be up to every refresh
cycle) userspace would need to allocate a new dumb buffer to have the
right size, and then test. Is that something we can actually afford to
do? I don't know.

Therefore maybe this proposal is a good compromise. The driver lists
*few* sizes that are roughly equally likely to work, that is, if the
cursor plane does not work, it's not because of the size. Userspace
pre-allocates DRM dumb buffers for each size. When attempting to use a
cursor plane, userspace picks the smallest size that suffices, and tests
only with that.

Seems fine to me. The uAPI docs should explain what userspace is
expected to do with it.


Thanks,
pq

> +
>  /**
>   * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
>   *

