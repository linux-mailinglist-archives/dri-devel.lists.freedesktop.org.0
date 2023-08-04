Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45D770219
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3CC10E70A;
	Fri,  4 Aug 2023 13:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F7E10E713
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691156641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpOIG5n3MxbFIH92Jg66Rf7F45WxAwd2M2vqn7RHptk=;
 b=M4CfQZVjLKOUy8G3b11AXDQTPoD5O23j94bs0/TYJ+Gr2gu9lnlR/n7LWhDkZG0DYAxILs
 DFAgmIgPqy0FteBiUc/6ikIXbqh8i6AdXeggPkMD2kvRjJGPyezS73h1ZzkCOPZ69fBG4i
 Lai75JJqZAo6Y8jq+CPJpjTfvQwQ8bE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-q4cClO03NTG1pkqArRffPw-1; Fri, 04 Aug 2023 09:43:58 -0400
X-MC-Unique: q4cClO03NTG1pkqArRffPw-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fe5e67adc6so329712e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 06:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691156637; x=1691761437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpOIG5n3MxbFIH92Jg66Rf7F45WxAwd2M2vqn7RHptk=;
 b=HjOm+tw53pSKifnTqEwy8EEJdyUpIHJ2TkQx3OJzPyQsO7yEDpD21DGxMO0B8JDJ9r
 uF2XXEKL2ZlWvh7e/yxKAnYCDvi9Bj8t3D8vtqMtXL0KdgSksbT6nJNimSe89jCTEW86
 QRErxD048DfurMwBO083JtpxQD05PqKeB1KM74xodm9WhCBZFHQgiuiWwQzpriCnFGRZ
 vJKrCzvKixu6iqNCdNm3zzYoYZxfCWb9Q9/xiFmVZfoSQOrwyVgq3WyKPZ35twLCP+w7
 ZoGZRxk8NXP1vROpQeoOepqpi6wjle5o/3Fmyoaw3aUcWFiuGQY1Uueq9W4t21GNYYhJ
 8Z3g==
X-Gm-Message-State: AOJu0YyjqPSZr0GdyTt8k+JnBRRg0aVcKXiSNOTfAl6EYsCrYTqZ3XA+
 kXufk5nGqMbJwEULPihtdlkF9k6gFSoUwBytNs6or3+cF0FuOhrR0XHA34p/DaAC8s5VZU3znug
 x6jxHBUs+gcLkKmiohXzl9iiaZ3tQWq2tl2lXBAauoLEc
X-Received: by 2002:a05:6512:2821:b0:4fb:bef0:948e with SMTP id
 cf33-20020a056512282100b004fbbef0948emr1624366lfb.5.1691156636883; 
 Fri, 04 Aug 2023 06:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4TC7gMZF2ei8j5FBv3RQrBOVNN/MDvRv3kcEy9bNjf6yT6T+EyfwKjB1EnVg7s3ShGDE6vL7iyVUjtK3tb6k=
X-Received: by 2002:a05:6512:2821:b0:4fb:bef0:948e with SMTP id
 cf33-20020a056512282100b004fbbef0948emr1624343lfb.5.1691156636477; Fri, 04
 Aug 2023 06:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
In-Reply-To: <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 4 Aug 2023 15:43:45 +0200
Message-ID: <CA+hFU4y38MTTUsbri1jy=n4Vyp7xx2CosD9Nmk97z_au6NHCdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 3:27=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc.com> w=
rote:
> >
> > Document and add support for solid_fill property to drm_plane. In
> > addition, add support for setting and getting the values for solid_fill=
.
> >
> > To enable solid fill planes, userspace must assign a property blob to
> > the "solid_fill" plane property containing the following information:
> >
> > struct drm_mode_solid_fill {
> >         u32 version;
> >         u32 r, g, b;
> > };
> >
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> >  drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
> >  include/drm/drm_blend.h                   |  1 +
> >  include/drm/drm_plane.h                   | 35 ++++++++++++++++++++
> >  include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
> >  6 files changed, 154 insertions(+)
> >
>
> [skipped most of the patch]
>
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 43691058d28f..53c8efa5ad7f 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
> >         char name[DRM_DISPLAY_MODE_LEN];
> >  };
> >
> > +/**
> > + * struct drm_mode_solid_fill - User info for solid fill planes
> > + *
> > + * This is the userspace API solid fill information structure.
> > + *
> > + * Userspace can enable solid fill planes by assigning the plane "soli=
d_fill"
> > + * property to a blob containing a single drm_mode_solid_fill struct p=
opulated with an RGB323232
> > + * color and setting the pixel source to "SOLID_FILL".
> > + *
> > + * For information on the plane property, see drm_plane_create_solid_f=
ill_property()
> > + *
> > + * @version: Version of the blob. Currently, there is only support for=
 version =3D=3D 1
> > + * @r: Red color value of single pixel
> > + * @g: Green color value of single pixel
> > + * @b: Blue color value of single pixel
> > + */
> > +struct drm_mode_solid_fill {
> > +       __u32 version;
> > +       __u32 r;
> > +       __u32 g;
> > +       __u32 b;
>
> Another thought about the drm_mode_solid_fill uABI. I still think we
> should add alpha here. The reason is the following:
>
> It is true that we have  drm_plane_state::alpha and the plane's
> "alpha" property. However it is documented as "the plane-wide opacity
> [...] It can be combined with pixel alpha. The pixel values in the
> framebuffers are expected to not be pre-multiplied by the global alpha
> associated to the plane.".
>
> I can imagine a use case, when a user might want to enable plane-wide
> opacity, set "pixel blend mode" to "Coverage" and then switch between
> partially opaque framebuffer and partially opaque solid-fill without
> touching the plane's alpha value.

The only reason I see against this is that there might be some
hardware which supports only RGB but not alpha on planes and they
could then not use this property. Maybe another COLOR_FILL enum value
with alpha might be better? Maybe just doing the alpha via the alpha
property is good enough.

>
> --
> With best wishes
> Dmitry
>

