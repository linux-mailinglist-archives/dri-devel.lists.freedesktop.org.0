Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A23B2CEA8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 23:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B848510E096;
	Tue, 19 Aug 2025 21:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KWob3tbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A1E10E619
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755616281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pvEEgBbNgsTwxehtfFeqqEpqIgwOhBrJLQl9HVJAuzk=;
 b=KWob3tbJPWGBGO2Ql7eVI//PsWVMm8aw5AW/LcY/eIQNnezclrg6BhDGR/xWp2Xa5JVvB6
 qVjV30+/K87PXes4rIf46KNveo/ERyTy+TI0N2QOD9OgbzTRJKv9eYdhgfCqiOJKt9b0d5
 y2Wxieo7wMh8KUtpCJXznlgxGOPS1NY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-J25GNnM9N-iGXnx0x9-gTw-1; Tue, 19 Aug 2025 11:11:19 -0400
X-MC-Unique: J25GNnM9N-iGXnx0x9-gTw-1
X-Mimecast-MFC-AGG-ID: J25GNnM9N-iGXnx0x9-gTw_1755616278
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b9e4146aa2so3104511f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 08:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755616278; x=1756221078;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ee3u3flTv1kn0zk1T2GKB/BxJ08k470D8YW1cLQnvsk=;
 b=ktftwj/1W1pXay7HEmrmyNRnCEYufJcg67vZgLqs/3+szVUaklGuO8e2SmAYQtEb7X
 W3WUbRMlMN2gIT/70ZschbHexY3qQg+2dc3knl6CDbDcRUDSyYGocN4Tdjgf3L1VWf+w
 61MYApn70Nr/knaKwHUKSzJPL9d+aXJviwb2+m8pjzRwxXxVMhYcRsVCYhsQQljI879o
 kFw8B1bLoAHmXbcRYbk6ctc/VB0pWHSh0QKJ5ccwvp7ElqgWkfm1KAQMRgTdGWRGziJF
 PuXwopZ8tkqrShbU7snr97AbnFc64uS4Y+LYL3lQri2KxO8LkMgvvgiZbsPhKiUP8/x4
 4CFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQkWK/no9D3pWJmNJN2rGRGDn7SaXlSEYY7FTfmFlIdDbQVjxr4EWzjAZvUejhYhQV8rxcBKm6IHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpnChWP4lh1kaolPvamlnxBMz9EjSvbHOYby+l6Y4d6F0p/Xiu
 wKN2pwGlY6SAYSuG5RV66Z40FdsV5lgUvNq3ZKoL1yhWYCWbXWWWKwIsE2224/1o6oyrlgmALI9
 KxxUNbbdi135wFbn95Oap+gHVprxjdOsj0/z8JtE2BW8hIsfKpdro+gIQJ0lmYGY+TNSheg==
X-Gm-Gg: ASbGncsESc6M/YxEhkv5RQK7Jsy3oTiOsy00uTi9c2zvcrrF89HHCEisB1U5L0ONH52
 Mgn9WDOXH6Cocw6dJ+DNLBNtZ9zEO2wDw7aFJDrc3AgG2S4McXFxN2zU+DzbqjO/PxOpCBsnNgB
 /Y3g8qWnJaGExWFRKjtYHV4ItTo+6osKLYdDj3gRwtKOhRL3aOaU3KugLmthr9s7Q6xuV1kkoQB
 Yltcg8m0IHHz/TQpB1ozIi9Hx4W9EClggwv5kY/yiS3HPlRDHjCBq9mZqjYIH9EFLvdeVbqhhI2
 Z5+gU69rfpbNGCyXQRPiHBwYA3gF0tBzgXG3EDFfxYqcAQ==
X-Received: by 2002:a05:6000:200d:b0:3b7:8832:fdd5 with SMTP id
 ffacd0b85a97d-3c0eaf4f6dfmr2225065f8f.16.1755616277713; 
 Tue, 19 Aug 2025 08:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYoJJIKVUgdiScKbKjVAGpcWgHzca9rJLqk+FuKY/tpu+fr2yqbqHZ6pYqrduWZp1/thUOYQ==
X-Received: by 2002:a05:6000:200d:b0:3b7:8832:fdd5 with SMTP id
 ffacd0b85a97d-3c0eaf4f6dfmr2225003f8f.16.1755616277086; 
 Tue, 19 Aug 2025 08:11:17 -0700 (PDT)
Received: from localhost ([2001:9e8:8986:8500:d724:cc1e:d6eb:bc50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074879fcbsm4157877f8f.9.2025.08.19.08.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 08:11:16 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 19 Aug 2025 17:11:15 +0200
Message-Id: <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
Cc: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <shashank.sharma@amd.com>, <agoins@nvidia.com>,
 <joshua@froggi.es>, <mdaenzer@redhat.com>, <aleixpol@kde.org>,
 <xaver.hugl@gmail.com>, <victoria@system76.com>, <daniel@ffwll.ch>,
 <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, "Daniel Stone"
 <daniels@collabora.com>
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
From: "Sebastian Wick" <sebastian.wick@redhat.com>
To: "Alex Hung" <alex.hung@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
In-Reply-To: <20250815035047.3319284-7-alex.hung@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DgmT3_G6pBo1_-am3gq3Ea9gWEGiA1jHpPoI4IX-Dkw_1755616278
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Tue, 19 Aug 2025 21:42:05 +0000
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

On Fri Aug 15, 2025 at 5:49 AM CEST, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>
> Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
> DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Co-developed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
> V9: Specify function names by _plane_ (Chaitanya Kumar Borah)
>
> v5:
>  - Add drm_get_colorop_curve_1d_type_name in header
>  - Add drm_colorop_init
>  - Set default curve
>  - Add kernel docs
>
> v4:
>  - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
>  - Create separate init function for 1D curve
>  - Pass supported TFs into 1D curve init function
>
>  drivers/gpu/drm/drm_atomic_uapi.c |  18 ++--
>  drivers/gpu/drm/drm_colorop.c     | 134 ++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         |  63 ++++++++++++++
>  3 files changed, 210 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index ad2043f16268..52b5a9b5523e 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -650,11 +650,17 @@ static int drm_atomic_colorop_set_property(struct d=
rm_colorop *colorop,
>  =09=09struct drm_colorop_state *state, struct drm_file *file_priv,
>  =09=09struct drm_property *property, uint64_t val)
>  {
> -=09drm_dbg_atomic(colorop->dev,
> -=09=09=09"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
> -=09=09=09colorop->base.id,
> -=09=09=09property->base.id, property->name);
> -=09return -EINVAL;
> +=09if (property =3D=3D colorop->curve_1d_type_property) {
> +=09=09state->curve_1d_type =3D val;
> +=09} else {
> +=09=09drm_dbg_atomic(colorop->dev,
> +=09=09=09       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
> +=09=09=09       colorop->base.id, colorop->type,
> +=09=09=09       property->base.id, property->name);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
>  }
> =20
>  static int
> @@ -664,6 +670,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *c=
olorop,
>  {
>  =09if (property =3D=3D colorop->type_property) {
>  =09=09*val =3D colorop->type;
> +=09} else if (property =3D=3D colorop->curve_1d_type_property) {
> +=09=09*val =3D state->curve_1d_type;
>  =09} else {
>  =09=09return -EINVAL;
>  =09}
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 1459a28c7e7b..6fbc3c284d33 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -31,6 +31,123 @@
> =20
>  #include "drm_crtc_internal.h"
> =20
> +static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D =
{
> +=09{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +};
> +
> +static const char * const colorop_curve_1d_type_names[] =3D {
> +=09[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
> +=09[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRGB Inverse EOTF",
> +};
> +
> +
> +/* Init Helpers */
> +
> +static int drm_plane_colorop_init(struct drm_device *dev, struct drm_col=
orop *colorop,
> +=09=09=09    struct drm_plane *plane, enum drm_colorop_type type)
> +{
> +=09struct drm_mode_config *config =3D &dev->mode_config;
> +=09struct drm_property *prop;
> +=09int ret =3D 0;
> +
> +=09ret =3D drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLO=
ROP);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09colorop->base.properties =3D &colorop->properties;
> +=09colorop->dev =3D dev;
> +=09colorop->type =3D type;
> +=09colorop->plane =3D plane;
> +
> +=09list_add_tail(&colorop->head, &config->colorop_list);
> +=09colorop->index =3D config->num_colorop++;
> +
> +=09/* add properties */
> +
> +=09/* type */
> +=09prop =3D drm_property_create_enum(dev,
> +=09=09=09=09=09DRM_MODE_PROP_IMMUTABLE,
> +=09=09=09=09=09"TYPE", drm_colorop_type_enum_list,
> +=09=09=09=09=09ARRAY_SIZE(drm_colorop_type_enum_list));
> +
> +=09if (!prop)
> +=09=09return -ENOMEM;
> +
> +=09colorop->type_property =3D prop;
> +
> +=09drm_object_attach_property(&colorop->base,
> +=09=09=09=09   colorop->type_property,
> +=09=09=09=09   colorop->type);
> +
> +=09return ret;
> +}
> +
> +/**
> + * drm_plane_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_in=
it enum values,
> + *                 created using BIT(curve_type) and combined with the O=
R '|'
> + *                 operator.
> + * @return zero on success, -E value on failure
> + */
> +int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_c=
olorop *colorop,
> +=09=09=09=09    struct drm_plane *plane, u64 supported_tfs)
> +{
> +=09struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
> +=09int i, len;
> +
> +=09struct drm_property *prop;
> +=09int ret;
> +
> +=09if (!supported_tfs) {
> +=09=09drm_err(dev,
> +=09=09=09"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
> +=09=09=09plane->base.id, plane->name);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) !=3D 0) {
> +=09=09drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
> +=09=09=09plane->base.id, plane->name);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09ret =3D drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CU=
RVE);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09len =3D 0;
> +=09for (i =3D 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
> +=09=09if ((supported_tfs & BIT(i)) =3D=3D 0)
> +=09=09=09continue;
> +
> +=09=09enum_list[len].type =3D i;
> +=09=09enum_list[len].name =3D colorop_curve_1d_type_names[i];
> +=09=09len++;
> +=09}
> +
> +=09if (WARN_ON(len <=3D 0))
> +=09=09return -EINVAL;
> +
> +
> +=09/* initialize 1D curve only attribute */
> +=09prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1=
D_TYPE",
> +=09=09=09=09=09enum_list, len);
> +=09if (!prop)
> +=09=09return -ENOMEM;
> +
> +=09colorop->curve_1d_type_property =3D prop;
> +=09drm_object_attach_property(&colorop->base, colorop->curve_1d_type_pro=
perty,
> +=09=09=09=09   enum_list[0].type);
> +=09drm_colorop_reset(colorop);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
> +
>  static void __drm_atomic_helper_colorop_duplicate_state(struct drm_color=
op *colorop,
>  =09=09=09=09=09=09=09struct drm_colorop_state *state)
>  {
> @@ -70,7 +187,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colo=
rop *colorop,
>  static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_=
state,
>  =09=09=09=09      struct drm_colorop *colorop)
>  {
> +=09u64 val;
> +
>  =09colorop_state->colorop =3D colorop;
> +
> +=09if (colorop->curve_1d_type_property) {
> +=09=09drm_object_property_get_default_value(&colorop->base,
> +=09=09=09=09=09=09colorop->curve_1d_type_property,
> +=09=09=09=09=09=09&val);
> +=09=09colorop_state->curve_1d_type =3D val;
> +=09}
>  }
> =20
>  /**
> @@ -114,3 +240,11 @@ const char *drm_get_colorop_type_name(enum drm_color=
op_type type)
> =20
>  =09return colorop_type_name[type];
>  }
> +
> +const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d=
_type type)
> +{
> +=09if (WARN_ON(type >=3D ARRAY_SIZE(colorop_curve_1d_type_names)))
> +=09=09return "unknown";
> +
> +=09return colorop_curve_1d_type_names[type];
> +}
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 9c9698545f63..fa167e642e0d 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -31,6 +31,42 @@
>  #include <drm/drm_mode.h>
>  #include <drm/drm_property.h>
> =20
> +
> +/**
> + * enum drm_colorop_curve_1d_type - type of 1D curve
> + *
> + * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE coloro=
p.
> + */
> +enum drm_colorop_curve_1d_type {
> +=09/**
> +=09 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> +=09 *
> +=09 * enum string "sRGB EOTF"
> +=09 *
> +=09 * sRGB piece-wise electro-optical transfer function. Transfer
> +=09 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
> +=09 * to H.273 TransferCharacteristics code point 13 with
> +=09 * MatrixCoefficients set to 0.
> +=09 */

We user space folks have been convinced at this point that the sRGB EOTF
is actually gamma 2.2, and not the piece-wise function. Now, if the
hardware is actually the piece-wise, then that's what should be exposed,
but I'm a bit unsure if we should do that under the name sRGB EOTF.

Maybe any other alternative is even worse. At least this is clearly
documented to be the piece-wise function, so it's only about the naming.

> +=09DRM_COLOROP_1D_CURVE_SRGB_EOTF,
> +
> +=09/**
> +=09 * @DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> +=09 *
> +=09 * enum string "sRGB Inverse EOTF"
> +=09 *
> +=09 * The inverse of &DRM_COLOROP_1D_CURVE_SRGB_EOTF
> +=09 */
> +=09DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
> +
> +=09/**
> +=09 * @DRM_COLOROP_1D_CURVE_COUNT:
> +=09 *
> +=09 * enum value denoting the size of the enum
> +=09 */
> +=09DRM_COLOROP_1D_CURVE_COUNT
> +};
> +
>  /**
>   * struct drm_colorop_state - mutable colorop state
>   */
> @@ -46,6 +82,13 @@ struct drm_colorop_state {
>  =09 * information.
>  =09 */
> =20
> +=09/**
> +=09 * @curve_1d_type:
> +=09 *
> +=09 * Type of 1D curve.
> +=09 */
> +=09enum drm_colorop_curve_1d_type curve_1d_type;
> +
>  =09/** @state: backpointer to global drm_atomic_state */
>  =09struct drm_atomic_state *state;
>  };
> @@ -127,6 +170,14 @@ struct drm_colorop {
>  =09 * this color operation. The type is enum drm_colorop_type.
>  =09 */
>  =09struct drm_property *type_property;
> +
> +=09/**
> +=09 * @curve_1d_type_property:
> +=09 *
> +=09 * Sub-type for DRM_COLOROP_1D_CURVE type.
> +=09 */
> +=09struct drm_property *curve_1d_type_property;
> +
>  };
> =20
>  #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
> @@ -151,6 +202,9 @@ static inline struct drm_colorop *drm_colorop_find(st=
ruct drm_device *dev,
>  =09return mo ? obj_to_colorop(mo) : NULL;
>  }
> =20
> +int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_c=
olorop *colorop,
> +=09=09=09=09    struct drm_plane *plane, u64 supported_tfs);
> +
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> =20
> @@ -191,4 +245,13 @@ static inline unsigned int drm_colorop_index(const s=
truct drm_colorop *colorop)
>   */
>  const char *drm_get_colorop_type_name(enum drm_colorop_type type);
> =20
> +/**
> + * drm_get_colorop_curve_1d_type_name - return a string for 1D curve typ=
e
> + * @type: 1d curve type to compute name of
> + *
> + * In contrast to the other drm_get_*_name functions this one here retur=
ns a
> + * const pointer and hence is threadsafe.
> + */
> +const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d=
_type type);
> +
>  #endif /* __DRM_COLOROP_H__ */

