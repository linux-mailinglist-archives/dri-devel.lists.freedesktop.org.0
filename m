Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9E745B94
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 13:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11F310E158;
	Mon,  3 Jul 2023 11:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DE210E210
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688385015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46Sracu/D/0a4Yd4cBQRbtvN6kMcQIjjw3Sb/7ByX0U=;
 b=T4W4aHNsiDB2za0S2WQIMEr79G5RLYwBdL36imTPEnucUm5Sxitf0/+JGpEg5C2NHdEtpL
 8Pi2lYQJOuL8sDDT72sh42ZP6ML6IXIBQgqMMB7J5oKCNETT34axmcycOJeG0teMnkRpu0
 TWSdzbJnRTgp0gWaptPrP/UZg1XOX/4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-rWj5Hd6jOmGWOox_K5DVGA-1; Mon, 03 Jul 2023 07:50:11 -0400
X-MC-Unique: rWj5Hd6jOmGWOox_K5DVGA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4f956a29f2aso4023302e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 04:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688385010; x=1690977010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46Sracu/D/0a4Yd4cBQRbtvN6kMcQIjjw3Sb/7ByX0U=;
 b=EounHK0cwfgY3m5/TVcVtxr837FCoS28FIvwsW6dQMSHDbKJ2J+o6CSKtgIoJVrL5p
 CFR1MDdiRpuwfmT7RHSY4MAyKInoQUKW0PQqCRL/hgtrAZuMSbCqB8xBMimX0OLc2avI
 fLDINC+PrXOU5uMz8a8mkGRlpBcqwV/wntJTOQGRPXy/jbQ+2tWb0+SV98mWdlkr9lsB
 rZRuZXai1Yabfi6NEdndpbP0T9VzCxdf5rBpw4iCK3qDPQjSwDB8mLuRp4oiRNV0VstK
 tyIiGavcJFuNoHBpD3BbZE1KqmF5W7CJt3wxbkMx12a/oVV9FSyDQLPPY2kQIZ5vMuO5
 lUkQ==
X-Gm-Message-State: ABy/qLbpfHyIjm7bchjnG5dbayF/pfMq0nODQeQ+kScQ2Dn4Ukx76sxX
 Sw11T+ENK6RrqAanXyxQ4KWF1kXSQjC4rDlnajtQTgVV/bYSrhs59GyJyxf7SmtGB3ZVl89eE04
 pd0IYiWR7ldg0L11SuLacLyy59iT74Jx/XSeQOHGPe122
X-Received: by 2002:a05:6512:4013:b0:4fb:8939:d962 with SMTP id
 br19-20020a056512401300b004fb8939d962mr7931348lfb.19.1688385010205; 
 Mon, 03 Jul 2023 04:50:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFnpM2bSBA1XglWdQgvquuyBJkuMOOv1oRAzQrb67XquQwB6pE6yMXwU+4MHi0nmAmGO5Fu7XqqEiBMmqUTJDs=
X-Received: by 2002:a05:6512:4013:b0:4fb:8939:d962 with SMTP id
 br19-20020a056512401300b004fb8939d962mr7931319lfb.19.1688385009760; Mon, 03
 Jul 2023 04:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <CA+hFU4zQFkbi8BjFdWDBDMPR7cC8UqJg0udu7MJYOFac1J8XsQ@mail.gmail.com>
 <68629132-b77a-bfbc-20f7-92a76cf24953@quicinc.com>
In-Reply-To: <68629132-b77a-bfbc-20f7-92a76cf24953@quicinc.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Mon, 3 Jul 2023 13:49:58 +0200
Message-ID: <CA+hFU4whcUq_0KEPrgk39tL29vsaW4v9MRXjGrPYBKWcVH7hFw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
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
Cc: freedreno@lists.freedesktop.org, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 11:27=E2=80=AFPM Jessica Zhang
<quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 6/30/2023 7:43 AM, Sebastian Wick wrote:
> > On Fri, Jun 30, 2023 at 2:26=E2=80=AFAM Jessica Zhang <quic_jesszhan@qu=
icinc.com> wrote:
> >>
> >> Add support for pixel_source property to drm_plane and related
> >> documentation.
> >>
> >> This enum property will allow user to specify a pixel source for the
> >> plane. Possible pixel sources will be defined in the
> >> drm_plane_pixel_source enum.
> >>
> >> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
> >> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> >>   drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++=
++++++++++
> >>   include/drm/drm_blend.h                   |  2 +
> >>   include/drm/drm_plane.h                   | 21 ++++++++
> >>   5 files changed, 109 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/d=
rm/drm_atomic_state_helper.c
> >> index fe14be2bd2b2..86fb876efbe6 100644
> >> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >> @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct =
drm_plane_state *plane_state,
> >>
> >>          plane_state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> >>          plane_state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> >> +       plane_state->pixel_source =3D DRM_PLANE_PIXEL_SOURCE_FB;
> >>
> >>          if (plane_state->solid_fill_blob) {
> >>                  drm_property_blob_put(plane_state->solid_fill_blob);
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_a=
tomic_uapi.c
> >> index a28b4ee79444..6e59c21af66b 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct dr=
m_plane *plane,
> >>                  drm_property_blob_put(solid_fill);
> >>
> >>                  return ret;
> >> +       } else if (property =3D=3D plane->pixel_source_property) {
> >> +               state->pixel_source =3D val;
> >>          } else if (property =3D=3D plane->alpha_property) {
> >>                  state->alpha =3D val;
> >>          } else if (property =3D=3D plane->blend_mode_property) {
> >> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *pl=
ane,
> >>          } else if (property =3D=3D plane->solid_fill_property) {
> >>                  *val =3D state->solid_fill_blob ?
> >>                          state->solid_fill_blob->base.id : 0;
> >> +       } else if (property =3D=3D plane->pixel_source_property) {
> >> +               *val =3D state->pixel_source;
> >>          } else if (property =3D=3D plane->alpha_property) {
> >>                  *val =3D state->alpha;
> >>          } else if (property =3D=3D plane->blend_mode_property) {
> >> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> >> index 38c3c5d6453a..8c100a957ee2 100644
> >> --- a/drivers/gpu/drm/drm_blend.c
> >> +++ b/drivers/gpu/drm/drm_blend.c
> >> @@ -189,6 +189,18 @@
> >>    *     solid_fill is set up with drm_plane_create_solid_fill_propert=
y(). It
> >>    *     contains pixel data that drivers can use to fill a plane.
> >>    *
> >> + * pixel_source:
> >> + *     pixel_source is set up with drm_plane_create_pixel_source_prop=
erty().
> >> + *     It is used to toggle the source of pixel data for the plane.
> >> + *
> >> + *     Possible values:
> >> + *
> >> + *     "FB":
> >> + *             Framebuffer source
> >> + *
> >> + *     "COLOR":
> >> + *             solid_fill source
> >> + *
> >>    * Note that all the property extensions described here apply either=
 to the
> >>    * plane or the CRTC (e.g. for the background color, which currently=
 is not
> >>    * exposed and assumed to be black).
> >> @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct d=
rm_plane *plane)
> >>          return 0;
> >>   }
> >>   EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> >> +
> >> +/**
> >> + * drm_plane_create_pixel_source_property - create a new pixel source=
 property
> >> + * @plane: drm plane
> >> + * @supported_sources: bitmask of supported pixel_sources for the dri=
ver (NOT
> >> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it wil=
l be supported
> >> + *                     by default).
> >> + *
> >> + * This creates a new property describing the current source of pixel=
 data for the
> >> + * plane.
> >> + *
> >> + * The property is exposed to userspace as an enumeration property ca=
lled
> >> + * "pixel_source" and has the following enumeration values:
> >> + *
> >> + * "FB":
> >> + *     Framebuffer pixel source
> >> + *
> >> + * "COLOR":
> >> + *     Solid fill color pixel source
> >
> > Can we add a "NONE" value?
> >
> > I know it has been discussed earlier if we *need*  this and I don't
> > think we do. I just think it would be better API design to disable
> > planes this way than having to know that a framebuffer pixel source
> > with a NULL framebuffer disables the plane. Obviously also keep the
> > old behavior for backwards compatibility.
>
> Hi Sebastian,
>
> Sounds good.
>
> So if pixel_source =3D=3D NONE disables the planes, would that mean cases
> where pixel_source =3D=3D COLOR && solid_fill_blob =3D=3D NULL, the atomi=
c
> commit should throw an error?

I would say so, yes.

> Thanks,
>
> Jessica Zhang
>
> >
> >> + *
> >> + * Returns:
> >> + * Zero on success, negative errno on failure.
> >> + */
> >> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> >> +                                          unsigned int supported_sour=
ces)
> >> +{
> >> +       struct drm_device *dev =3D plane->dev;
> >> +       struct drm_property *prop;
> >> +       const struct drm_prop_enum_list enum_list[] =3D {
> >> +               { DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> >> +               { DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
> >> +       };
> >> +       unsigned int valid_source_mask =3D BIT(DRM_PLANE_PIXEL_SOURCE_=
FB) |
> >> +                                      BIT(DRM_PLANE_PIXEL_SOURCE_COLO=
R);
> >> +       int i;
> >> +
> >> +       /* FB is supported by default */
> >> +       supported_sources |=3D BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> >> +
> >> +       if (WARN_ON(supported_sources & ~valid_source_mask))
> >> +               return -EINVAL;
> >> +
> >> +       prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_s=
ource",
> >> +                       hweight32(supported_sources));
> >> +
> >> +       if (!prop)
> >> +               return -ENOMEM;
> >> +
> >> +       for (i =3D 0; i < ARRAY_SIZE(enum_list); i++) {
> >> +               int ret;
> >> +
> >> +               if (!(BIT(enum_list[i].type) & supported_sources))
> >> +                       continue;
> >> +
> >> +               ret =3D drm_property_add_enum(prop, enum_list[i].type,=
 enum_list[i].name);
> >> +
> >> +               if (ret) {
> >> +                       drm_property_destroy(dev, prop);
> >> +
> >> +                       return ret;
> >> +               }
> >> +       }
> >> +
> >> +       drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL=
_SOURCE_FB);
> >> +       plane->pixel_source_property =3D prop;
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> >> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> >> index 0338a860b9c8..31af7cfa5b1b 100644
> >> --- a/include/drm/drm_blend.h
> >> +++ b/include/drm/drm_blend.h
> >> @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev=
,
> >>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
> >>                                           unsigned int supported_modes=
);
> >>   int drm_plane_create_solid_fill_property(struct drm_plane *plane);
> >> +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> >> +                                          unsigned int supported_sour=
ces);
> >>   #endif
> >> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> >> index f6ab313cb83e..73fb6cf8a5d9 100644
> >> --- a/include/drm/drm_plane.h
> >> +++ b/include/drm/drm_plane.h
> >> @@ -59,6 +59,12 @@ struct drm_solid_fill {
> >>          uint32_t b;
> >>   };
> >>
> >> +enum drm_plane_pixel_source {
> >> +       DRM_PLANE_PIXEL_SOURCE_FB,
> >> +       DRM_PLANE_PIXEL_SOURCE_COLOR,
> >> +       DRM_PLANE_PIXEL_SOURCE_MAX
> >> +};
> >> +
> >>   /**
> >>    * struct drm_plane_state - mutable plane state
> >>    *
> >> @@ -152,6 +158,14 @@ struct drm_plane_state {
> >>           */
> >>          struct drm_solid_fill solid_fill;
> >>
> >> +       /*
> >> +        * @pixel_source:
> >> +        *
> >> +        * Source of pixel information for the plane. See
> >> +        * drm_plane_create_pixel_source_property() for more details.
> >> +        */
> >> +       enum drm_plane_pixel_source pixel_source;
> >> +
> >>          /**
> >>           * @alpha:
> >>           * Opacity of the plane with 0 as completely transparent and =
0xffff as
> >> @@ -742,6 +756,13 @@ struct drm_plane {
> >>           */
> >>          struct drm_property *solid_fill_property;
> >>
> >> +       /*
> >> +        * @pixel_source_property:
> >> +        * Optional pixel_source property for this plane. See
> >> +        * drm_plane_create_pixel_source_property().
> >> +        */
> >> +       struct drm_property *pixel_source_property;
> >> +
> >>          /**
> >>           * @alpha_property:
> >>           * Optional alpha property for this plane. See
> >>
> >> --
> >> 2.41.0
> >>
> >
>

