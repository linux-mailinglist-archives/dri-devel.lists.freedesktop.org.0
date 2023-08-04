Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6557A77010B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DF910E6FC;
	Fri,  4 Aug 2023 13:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB2D10E083
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691154967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0S2XcXsMofbaYB3fRcp5wRBkGQeJxqeYSj3fDwyK+w=;
 b=F3NMjVDNSofG/jxj8DEZ77I59skB6AaFLfD7LfC3ej/kSItQiN6Sg++J/PbEUJfz8Kvf3R
 3NAsxM4IXNBR8z7gnJTzWo4Gij678KiafQ/HxEoclT/hwjH3mmReqxpAAefGeBoFoKTpag
 uGSeivgHM+bEC8f2m7DvUWgXzQ1HqIE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-fCFr1A3GPFGxWxigTkE-nA-1; Fri, 04 Aug 2023 09:16:06 -0400
X-MC-Unique: fCFr1A3GPFGxWxigTkE-nA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe2631f5a6so2152330e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 06:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691154965; x=1691759765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0S2XcXsMofbaYB3fRcp5wRBkGQeJxqeYSj3fDwyK+w=;
 b=TD8dfTwfTWh4FJpknmwKAB19pRUNB/9+l8Co25A3C2sU97x4gPLN9ByMLD8nh0V/4n
 x7XmLvS9t0T3U5Uzr4CKHYr8qkhEy24TZif+wtADQr/RUesPb93gioZCaHXgyp90SHb/
 feUG6n/BImV1ziVxNf3UNFG1MoEk19O8crU5WsJNmRvEvrHWEIbEkXNYbPqMPbU26AmU
 3TLaZhlCsjyRRB84Iw9Ln/GG2umLGGWb2gCOcXCdwCMyd28I5KrvYobEfBhjY5bD5w8f
 3dKUk017Dy6zK6zdWfvptcezTagudRKcTZG9QP52b3uQCLjjuu27PG8kVvdA9K6Rj80I
 8Ihg==
X-Gm-Message-State: AOJu0YxElTiaMm7cZwj4jDmgNgD83YY0Rp4pBdSf4ICBfJcPGsd5mUIi
 i03oMezJ2KwfvASwPiiZwT3G2ACRkA+VeBokrKnm79GJe8qrjLxPOXMTGf5iVaYduPyyEMP3ZGr
 dk/x6UYZS9G+7EioR49V8piYk3PU4RFvx8uboqRvyJzLRMp0ve3o1YijrGA==
X-Received: by 2002:ac2:5e24:0:b0:4fd:da95:6f39 with SMTP id
 o4-20020ac25e24000000b004fdda956f39mr1205405lfg.68.1691154965036; 
 Fri, 04 Aug 2023 06:16:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6uail52C5gVgUk/0ECJ9p12X9oDJ3coJJluinvJB6xdxkB7qkUHsWU6fm5/PtLmfxSPGMHzul+cnk8uQGODw=
X-Received: by 2002:ac2:5e24:0:b0:4fd:da95:6f39 with SMTP id
 o4-20020ac25e24000000b004fdda956f39mr1205378lfg.68.1691154964654; Fri, 04 Aug
 2023 06:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-1-053dbefa909c@quicinc.com>
In-Reply-To: <20230728-solid-fill-v5-1-053dbefa909c@quicinc.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 4 Aug 2023 15:15:53 +0200
Message-ID: <CA+hFU4ywNbK77Nj+AVkRbgnomyP-YHhP6pKvNhFG-6HXwAY=Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 01/10] drm: Introduce pixel_source DRM plane
 property
To: Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 ppaalanen@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 7:03=E2=80=AFPM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
> Add support for pixel_source property to drm_plane and related
> documentation. In addition, force pixel_source to
> DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
> legacy userspace.
>
> This enum property will allow user to specify a pixel source for the
> plane. Possible pixel sources will be defined in the
> drm_plane_pixel_source enum.
>
> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_NONE and
> DRM_PLANE_PIXEL_SOURCE_FB with *_PIXEL_SOURCE_FB being the default value.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_blend.c               | 85 +++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/drm_plane.c               |  3 ++
>  include/drm/drm_blend.h                   |  2 +
>  include/drm/drm_plane.h                   | 21 ++++++++
>  6 files changed, 116 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 784e63d70a42..01638c51ce0a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm=
_plane_state *plane_state,
>
>         plane_state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
>         plane_state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> +       plane_state->pixel_source =3D DRM_PLANE_PIXEL_SOURCE_FB;
>
>         if (plane->color_encoding_property) {
>                 if (!drm_object_property_get_default_value(&plane->base,
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index d867e7f9f2cd..454f980e16c9 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -544,6 +544,8 @@ static int drm_atomic_plane_set_property(struct drm_p=
lane *plane,
>                 state->src_w =3D val;
>         } else if (property =3D=3D config->prop_src_h) {
>                 state->src_h =3D val;
> +       } else if (property =3D=3D plane->pixel_source_property) {
> +               state->pixel_source =3D val;
>         } else if (property =3D=3D plane->alpha_property) {
>                 state->alpha =3D val;
>         } else if (property =3D=3D plane->blend_mode_property) {
> @@ -616,6 +618,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane=
,
>                 *val =3D state->src_w;
>         } else if (property =3D=3D config->prop_src_h) {
>                 *val =3D state->src_h;
> +       } else if (property =3D=3D plane->pixel_source_property) {
> +               *val =3D state->pixel_source;
>         } else if (property =3D=3D plane->alpha_property) {
>                 *val =3D state->alpha;
>         } else if (property =3D=3D plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..c500310a3d09 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -185,6 +185,21 @@
>   *              plane does not expose the "alpha" property, then this is
>   *              assumed to be 1.0
>   *
> + * pixel_source:
> + *     pixel_source is set up with drm_plane_create_pixel_source_propert=
y().
> + *     It is used to toggle the active source of pixel data for the plan=
e.
> + *     The plane will only display data from the set pixel_source -- any
> + *     data from other sources will be ignored.
> + *
> + *     Possible values:
> + *
> + *     "NONE":
> + *             No active pixel source.
> + *             Committing with a NONE pixel source will disable the plan=
e.
> + *
> + *     "FB":
> + *             Framebuffer source set by the "FB_ID" property.
> + *
>   * Note that all the property extensions described here apply either to =
the
>   * plane or the CRTC (e.g. for the background color, which currently is =
not
>   * exposed and assumed to be black).
> @@ -615,3 +630,73 @@ int drm_plane_create_blend_mode_property(struct drm_=
plane *plane,
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
> +
> +/**
> + * drm_plane_create_pixel_source_property - create a new pixel source pr=
operty
> + * @plane: DRM plane
> + * @extra_sources: Bitmask of additional supported pixel_sources for the=
 driver.
> + *                DRM_PLANE_PIXEL_SOURCE_FB always be enabled as a suppo=
rted
> + *                source.
> + *
> + * This creates a new property describing the current source of pixel da=
ta for the
> + * plane. The pixel_source will be initialized as DRM_PLANE_PIXEL_SOURCE=
_FB by default.
> + *
> + * Drivers can set a custom default source by overriding the pixel_sourc=
e value in
> + * drm_plane_funcs.reset()
> + *
> + * The property is exposed to userspace as an enumeration property calle=
d
> + * "pixel_source" and has the following enumeration values:
> + *
> + * "NONE":
> + *      No active pixel source
> + *
> + * "FB":
> + *     Framebuffer pixel source
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned long extra_sources)
> +{
> +       struct drm_device *dev =3D plane->dev;
> +       struct drm_property *prop;
> +       static const struct drm_prop_enum_list enum_list[] =3D {
> +               { DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +       };
> +       static const unsigned int valid_source_mask =3D BIT(DRM_PLANE_PIX=
EL_SOURCE_FB);
> +       int i;
> +
> +       /* FB is supported by default */
> +       unsigned long supported_sources =3D extra_sources | BIT(DRM_PLANE=
_PIXEL_SOURCE_FB);

The DRM_PLANE_PIXEL_SOURCE_NONE property should also be enabled by
default and in the valid_source_mask. In a later patch you implement
the DRM_PLANE_PIXEL_SOURCE_NONE logic in drm core so everyone gets the
enum value for free. Might want to pull that logic into its own patch
and move it before this one.

> +
> +       if (WARN_ON(supported_sources & ~valid_source_mask))
> +               return -EINVAL;
> +
> +       prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM | DRM_MODE_P=
ROP_ATOMIC, "pixel_source",
> +                       hweight32(supported_sources));
> +
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(enum_list); i++) {
> +               int ret;
> +
> +               if (!test_bit(enum_list[i].type, &supported_sources))
> +                       continue;
> +
> +               ret =3D drm_property_add_enum(prop, enum_list[i].type, en=
um_list[i].name);
> +               if (ret) {
> +                       drm_property_destroy(dev, prop);
> +
> +                       return ret;
> +               }
> +       }
> +
> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SO=
URCE_FB);
> +       plane->pixel_source_property =3D prop;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..f342cf15412b 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -987,6 +987,9 @@ int drm_mode_setplane(struct drm_device *dev, void *d=
ata,
>                 return -ENOENT;
>         }
>
> +       if (plane->state && plane->state->pixel_source !=3D DRM_PLANE_PIX=
EL_SOURCE_FB)
> +               plane->state->pixel_source =3D DRM_PLANE_PIXEL_SOURCE_FB;
> +
>         if (plane_req->fb_id) {
>                 fb =3D drm_framebuffer_lookup(dev, file_priv, plane_req->=
fb_id);
>                 if (!fb) {
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..122bbfbaae33 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>                               struct drm_atomic_state *state);
>  int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>                                          unsigned int supported_modes);
> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> +                                          unsigned long extra_sources);
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..89508b4dea4a 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -40,6 +40,12 @@ enum drm_scaling_filter {
>         DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>  };
>
> +enum drm_plane_pixel_source {
> +       DRM_PLANE_PIXEL_SOURCE_NONE,
> +       DRM_PLANE_PIXEL_SOURCE_FB,
> +       DRM_PLANE_PIXEL_SOURCE_MAX
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -116,6 +122,14 @@ struct drm_plane_state {
>         /** @src_h: height of visible portion of plane (in 16.16) */
>         uint32_t src_h, src_w;
>
> +       /**
> +        * @pixel_source:
> +        *
> +        * Source of pixel information for the plane. See
> +        * drm_plane_create_pixel_source_property() for more details.
> +        */
> +       enum drm_plane_pixel_source pixel_source;
> +
>         /**
>          * @alpha:
>          * Opacity of the plane with 0 as completely transparent and 0xff=
ff as
> @@ -699,6 +713,13 @@ struct drm_plane {
>          */
>         struct drm_plane_state *state;
>
> +       /*
> +        * @pixel_source_property:
> +        * Optional pixel_source property for this plane. See
> +        * drm_plane_create_pixel_source_property().
> +        */
> +       struct drm_property *pixel_source_property;
> +
>         /**
>          * @alpha_property:
>          * Optional alpha property for this plane. See
>
> --
> 2.41.0
>

