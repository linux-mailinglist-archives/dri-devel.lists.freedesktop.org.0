Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E21B2CEAB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 23:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7703710E677;
	Tue, 19 Aug 2025 21:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eI+3DtAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D06110E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 15:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755617469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OeWRMq4NolNVy7XTnNb2tgNZtoQs/hKakUhJixL3Es=;
 b=eI+3DtAwrFwyuJDdbDZlpAQpFoxCuiKc3JO8wmZJUvJd/s8QvkfXpByNA+JqtJuPKpmswY
 zikoLC7UpG+3Wgu2O2YbXKmY51P5Z+qq4bb5DA8YD7GhNJbqYF5+HW8zIjMf49uaqx/jEW
 gLZdM10QavN7x+5H/ja4f4cglHsDLDo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-YxvZ81OrPyi6mmd5U4ANUg-1; Tue, 19 Aug 2025 11:31:08 -0400
X-MC-Unique: YxvZ81OrPyi6mmd5U4ANUg-1
X-Mimecast-MFC-AGG-ID: YxvZ81OrPyi6mmd5U4ANUg_1755617467
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a1b0d221aso23121765e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 08:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755617467; x=1756222267;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fJEEWjS4nx0j4iBms/XL+mfUSySmqxuEsDLBnWVb1kw=;
 b=hZfIKcm+I7Qqe4cPQlMgHPmoRCvOomg1o1yoAd3HCNO0TitBgNQedUvK7F2rxc42KK
 0lWxUWHrl/B7AV/qx5cGdV0l41U1hcwomyN2UO+nfcY8FwCGHJJOx/QAIsA4pytYBCUD
 Dm5wK7iuMs1H9+I1boWpltQY54a/KF0mWfHWhcB+RAAg2CcY+pDQutkucXxPra2NIBB5
 JWDey258kiq4M0H32ZGzurAaZi076sVrIll1HuHkcBN8FpmD9KcZMyo63MgeBIVEhets
 7xUVIFjUB6U0dX7me9AWTXVYnda3Rj3fB8qZy6P6sC2bnQjAULFt6luAchw9PWV7zroq
 F2pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKDc3Sr7NGvHROjmeGtBk9eMoZD7KCPqZuJuxgViVsGohRZLtcIP69mSHNGdLs1NdmdsJVspFEvFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmI1eaClkJ+3mD8AihK/G2FllijtoseH9qnu0feQ+Qmfe7197e
 sa0hCmoiBK7irmth+cjJdVEIg5tGz5Z9tXLpjpe7+4zyxfMLZ4Lp4dFClFlZ8xkrnrF8kSHiKW5
 QQKD0moRYG7g/4XuWX28SGzdAqc7T3dN9kmlyLJf9/tPhqtgjmPpUmXJVFTym45JxTMumZA==
X-Gm-Gg: ASbGnctLQjyUaqY8dX68TKh500lvcE3Ko95OT9ONYnp4X/jUb+6GRnBJC0zcGXIigMP
 /HK2fhVbZidyZ/DNbzkHotQnFqZsLGxQ8mw+ViQifqNt2tyulzti/SYc8ttxX6OTU6y4T7CtGzu
 vP+osE7T8tOxsD9gLSY+hqObKPavCPXgAoJtqHXG+CIQc9zwPUOOqKjVJHkzfnYhChfCW5z4h2x
 0sBCVyDfTrHB+y9jk0nM1wqvM/KcsVeWLmm9hZ4JJWNdG1V19xiy7dcSLvCS3/z5AgPD5YTfm3k
 3q6VgFTz+5xQupqBQyPs827sgtWbEz93EJN3Nz1dkDXKeA==
X-Received: by 2002:a05:6000:26c2:b0:3b9:1684:e10 with SMTP id
 ffacd0b85a97d-3c0e6f4ec63mr2194350f8f.23.1755617466644; 
 Tue, 19 Aug 2025 08:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSu74ukqzE13XtkzdMZwcfl94j95lW/tVfVWJLdV/nTd4Cp3t10+cKvLmNo/ZQ4uzuKA6sxA==
X-Received: by 2002:a05:6000:26c2:b0:3b9:1684:e10 with SMTP id
 ffacd0b85a97d-3c0e6f4ec63mr2194291f8f.23.1755617466028; 
 Tue, 19 Aug 2025 08:31:06 -0700 (PDT)
Received: from localhost ([2001:9e8:8986:8500:d724:cc1e:d6eb:bc50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c748a9esm217496815e9.19.2025.08.19.08.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 08:31:05 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 19 Aug 2025 17:31:03 +0200
Message-Id: <DC6IG8LQAIF4.6KM7AM5JD3J3@redhat.com>
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
Subject: Re: [PATCH V11 35/47] drm/colorop: Add 1D Curve Custom LUT type
From: "Sebastian Wick" <sebastian.wick@redhat.com>
To: "Alex Hung" <alex.hung@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-36-alex.hung@amd.com>
In-Reply-To: <20250815035047.3319284-36-alex.hung@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J3SzfxTuP0oCeJWz8rpQTsHKMa8BzWt3_gBS4at37vk_1755617467
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

On Fri Aug 15, 2025 at 5:50 AM CEST, Alex Hung wrote:
> We've previously introduced DRM_COLOROP_1D_CURVE for
> pre-defined 1D curves. But we also have HW that supports
> custom curves and userspace needs the ability to pass
> custom curves, aka LUTs.
>
> This patch introduces a new colorop type, called
> DRM_COLOROP_1D_LUT that provides a SIZE property which
> is used by a driver to advertise the supported SIZE
> of the LUT, as well as a DATA property which userspace
> uses to set the LUT.
>
> DATA and size function in the same way as current drm_crtc
> GAMMA and DEGAMMA LUTs.
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> v11:
>  - Update names from *_lut_32_* to *_lut32_* (Simon Ser)
>
> v10:
>  - 1D LUT API is now using 32BIT RGB with drm_color_lut_32 (Uma Shankar)
>
> v9:
>  - Update function names by _plane_ (Chaitanya Kumar Borah)
>
> v8:
>  - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
>  - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)
>
> v7:
>  - Change "size" to "lut_size" (this affects multiple following commits)
>  - Move "lut_size" from drm_colorop_state to drm_colorop
>  - Modify other files accordingly (i.e. from drm_colorop_state->size
>    to drm_colorop->lut_size)
>
> v5:
>  - Add kernel doc
>  - Define SIZE in similar manner to GAMMA_SIZE on drm_crtc (Melissa)
>
>  drivers/gpu/drm/drm_atomic.c      |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c |  5 ++++
>  drivers/gpu/drm/drm_colorop.c     | 43 +++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         | 16 ++++++++++++
>  include/uapi/drm/drm_mode.h       | 14 ++++++++++
>  5 files changed, 82 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 1f47949aa10b..27eba485fe2b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -793,6 +793,10 @@ static void drm_atomic_colorop_print_state(struct dr=
m_printer *p,
>  =09=09drm_printf(p, "\tcurve_1d_type=3D%s\n",
>  =09=09=09   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
>  =09=09break;
> +=09case DRM_COLOROP_1D_LUT:
> +=09=09drm_printf(p, "\tsize=3D%d\n", colorop->lut_size);
> +=09=09drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data->=
base.id : 0);
> +=09=09break;
>  =09case DRM_COLOROP_CTM_3X4:
>  =09=09drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data->=
base.id : 0);
>  =09=09break;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index fe59dd1f2c07..093635d43ea3 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -697,6 +697,9 @@ static int drm_atomic_color_set_data_property(struct =
drm_colorop *colorop,
>  =09bool replaced =3D false;
> =20
>  =09switch (colorop->type) {
> +=09case DRM_COLOROP_1D_LUT:
> +=09=09size =3D colorop->lut_size * sizeof(struct drm_color_lut32);
> +=09=09break;
>  =09case DRM_COLOROP_CTM_3X4:
>  =09=09size =3D sizeof(struct drm_color_ctm_3x4);
>  =09=09break;
> @@ -746,6 +749,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *c=
olorop,
>  =09=09*val =3D state->bypass;
>  =09} else if (property =3D=3D colorop->curve_1d_type_property) {
>  =09=09*val =3D state->curve_1d_type;
> +=09} else if (property =3D=3D colorop->lut_size_property) {
> +=09=09*val =3D colorop->lut_size;
>  =09} else if (property =3D=3D colorop->data_property) {
>  =09=09*val =3D (state->data) ? state->data->base.id : 0;
>  =09} else {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index c245a3ff45d3..e799a87f25fe 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -64,6 +64,7 @@
> =20
>  static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D =
{
>  =09{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +=09{ DRM_COLOROP_1D_LUT, "1D LUT" },
>  =09{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>  };
> =20
> @@ -265,6 +266,47 @@ static int drm_colorop_create_data_prop(struct drm_d=
evice *dev, struct drm_color
>  =09return 0;
>  }
> =20
> +/**
> + * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @lut_size: LUT size supported by driver
> + * @return zero on success, -E value on failure
> + */
> +int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> +=09=09=09=09=09struct drm_plane *plane, uint32_t lut_size)
> +{
> +=09struct drm_property *prop;
> +=09int ret;
> +
> +=09ret =3D drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LU=
T);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* initialize 1D LUT only attribute */
> +=09/* LUT size */
> +=09prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM=
_MODE_PROP_ATOMIC,
> +=09=09=09=09=09 "SIZE", 0, UINT_MAX);
> +=09if (!prop)
> +=09=09return -ENOMEM;
> +
> +=09colorop->lut_size_property =3D prop;

I'm a bit confused here. The property itself is just called "SIZE" which
looks very similar to the generic "DATA" property. However, it is
assigned to `lut_size_property`.

Is this meant to be to be a generic property where the exact usage
depends on the type of the color op (like "DATA"), or is this meant to
be specific to LUTs (in which case the generic name is misleading)?

I also tried to find the user space documentation for all the properties
but could not find them. The only thing I could find was the kernel
documentation of

    struct drm_property *lut_size_property;

Which says "Size property for custom LUT from userspace."


> +=09drm_object_attach_property(&colorop->base, colorop->lut_size_property=
, lut_size);
> +=09colorop->lut_size =3D lut_size;
> +
> +=09/* data */
> +=09ret =3D drm_colorop_create_data_prop(dev, colorop);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09drm_colorop_reset(colorop);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
> +
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
>  =09=09=09=09   struct drm_plane *plane)
>  {
> @@ -373,6 +415,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
> =20
>  static const char * const colorop_type_name[] =3D {
>  =09[DRM_COLOROP_1D_CURVE] =3D "1D Curve",
> +=09[DRM_COLOROP_1D_LUT] =3D "1D LUT",
>  =09[DRM_COLOROP_CTM_3X4] =3D "3x4 Matrix",
>  };
> =20
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index c6d2b289e3cf..fe662e0f89aa 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -259,6 +259,13 @@ struct drm_colorop {
>  =09 */
>  =09struct drm_property *bypass_property;
> =20
> +=09/**
> +=09 * @lut_size:
> +=09 *
> +=09 * Number of entries of the custom LUT. This should be read-only.
> +=09 */
> +=09uint32_t lut_size;
> +
>  =09/**
>  =09 * @curve_1d_type_property:
>  =09 *
> @@ -266,6 +273,13 @@ struct drm_colorop {
>  =09 */
>  =09struct drm_property *curve_1d_type_property;
> =20
> +=09/**
> +=09 * @lut_size_property:
> +=09 *
> +=09 * Size property for custom LUT from userspace.
> +=09 */
> +=09struct drm_property *lut_size_property;
> +
>  =09/**
>  =09 * @data_property:
>  =09 *
> @@ -312,6 +326,8 @@ void drm_colorop_pipeline_destroy(struct drm_device *=
dev);
> =20
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_c=
olorop *colorop,
>  =09=09=09=09    struct drm_plane *plane, u64 supported_tfs);
> +int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> +=09=09=09=09=09struct drm_plane *plane, uint32_t lut_size);
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
>  =09=09=09=09   struct drm_plane *plane);
> =20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index bcc4e9845881..24fd52e16953 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -902,6 +902,20 @@ enum drm_colorop_type {
>  =09 */
>  =09DRM_COLOROP_1D_CURVE,
> =20
> +=09/**
> +=09 * @DRM_COLOROP_1D_LUT:
> +=09 *
> +=09 * enum string "1D LUT"
> +=09 *
> +=09 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
> +=09 * packed into a blob via the DATA property. The driver's
> +=09 * expected LUT size is advertised via the SIZE property.
> +=09 *
> +=09 * The DATA blob is an array of struct drm_color_lut32 with size
> +=09 * of "lut_size".
> +=09 */
> +=09DRM_COLOROP_1D_LUT,
> +
>  =09/**
>  =09 * @DRM_COLOROP_CTM_3X4:
>  =09 *

