Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159947C5D76
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 21:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2010E1E8;
	Wed, 11 Oct 2023 19:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2876B10E0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697051558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+faO1Sfs8IcAfrNBh28bokKajOgz+r5bXqGdn6Pss5g=;
 b=XyvO9crX8SPXvHNz26TNVK8dulsxfwiJhv8brT6dIgkv0V6ym6hXOceHscY6ZpDYaTZEOV
 Mu7KYljHzMjppP7isVav7wv3qmH08rk+SACrN64sM1OV8WZJuw63QkdqsoQRpe82Cw9qf9
 phRkO1r2FQ2YPQy6LECxeEcpI013qpg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-BjbE635rN0aSwCAXufb-fA-1; Wed, 11 Oct 2023 15:12:33 -0400
X-MC-Unique: BjbE635rN0aSwCAXufb-fA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5041bea78a5so177937e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 12:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697051550; x=1697656350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+faO1Sfs8IcAfrNBh28bokKajOgz+r5bXqGdn6Pss5g=;
 b=soIULJ73HcpLNzm/oO0Y5yY4RXxdb7gIT2ltGzd4TOHRJOxzVMAB/EMUtsXbxfq1Jw
 2AMaNSQmSQuWYJnUmw6POf5yenRSPct3ao46PLIHCWyuSEbH6jBC30UZ/YFWU9eo9Sn4
 pcYSTd5iK5QyvTgjwGPQnJ7JOIcSh9TjtDpO1BYSXZGSCKrpDebLGX0EV8C+a9pH8qWF
 Wfjs8ycY5cd0ev5a/afP9UGkPT13qg+L/81hj0fnvUM93ig39Kw/v6UCQU7Umnhe4KDk
 r+XaFWPycsJDiGHfBX2BRlASdREw/UhHXGjMz8bbUZpJwZxXE9GRk7iNn77r4hqQKFVJ
 fnJQ==
X-Gm-Message-State: AOJu0Yx8a59Go22Y9b6CrWurL0BicBbEvZn4BVcrqHrdXaxRTMMosCPV
 tYhD7UcLUdETFJl8BlyA0eDB3EAQRFDGZ0l2vdK3pkSq8t/bOULHRfdxPWeo9kA2cioA2B8TMAF
 cesuuMHYw9AdYNcZsDlXZrq/BpfHzbQFYbUo/6Lp4W2L9
X-Received: by 2002:ac2:5d31:0:b0:503:778:9ad2 with SMTP id
 i17-20020ac25d31000000b0050307789ad2mr16543374lfb.19.1697051550233; 
 Wed, 11 Oct 2023 12:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiZ79LVHEOG9KJJaZ2dd8ArTIN7+Usw3GHDppe8oNjT8+FGKjava5cZ/Dbwm06buOJ0NNFoC5BFgi5L74zBgU=
X-Received: by 2002:ac2:5d31:0:b0:503:778:9ad2 with SMTP id
 i17-20020ac25d31000000b0050307789ad2mr16543354lfb.19.1697051549739; Wed, 11
 Oct 2023 12:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <20231011132005.43d2a86a@eldfell>
In-Reply-To: <20231011132005.43d2a86a@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Wed, 11 Oct 2023 21:12:18 +0200
Message-ID: <CA+hFU4z3ZvooTgTri10w9=hAnbOdm9pwdk5d_j_fToDfYs7YJA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 12:20=E2=80=AFPM Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:
>
> On Tue, 10 Oct 2023 15:13:46 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>
> > O 09/08, Harry Wentland wrote:
> > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Melissa Wen <mwen@igalia.com>
> > > Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > Cc: Shashank Sharma <shashank.sharma@amd.com>
> > > Cc: Alexander Goins <agoins@nvidia.com>
> > > Cc: Joshua Ashton <joshua@froggi.es>
> > > Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> > > Cc: Aleix Pol <aleixpol@kde.org>
> > > Cc: Xaver Hugl <xaver.hugl@gmail.com>
> > > Cc: Victoria Brekenfeld <victoria@system76.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Uma Shankar <uma.shankar@intel.com>
> > > Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> > > Cc: Christopher Braga <quic_cbraga@quicinc.com>
> > > ---
> > >  Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++=
++
> > >  1 file changed, 278 insertions(+)
> > >  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
> > >
> > > diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation=
/gpu/rfc/color_pipeline.rst
> > > new file mode 100644
> > > index 000000000000..bfa4a8f12087
> > > --- /dev/null
> > > +++ b/Documentation/gpu/rfc/color_pipeline.rst
>
> ...
>
> > > +Color Pipeline Discovery
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +
> > > +A DRM client wanting color management on a drm_plane will:
> > > +
> > > +1. Read all drm_colorop objects
> > > +2. Get the COLOR_PIPELINE property of the plane
> > > +3. iterate all COLOR_PIPELINE enum values
> > > +4. for each enum value walk the color pipeline (via the NEXT pointer=
s)
> > > +   and see if the available color operations are suitable for the
> > > +   desired color management operations
> > > +
> > > +An example of chained properties to define an AMD pre-blending color
> > > +pipeline might look like this::
> >
> > Hi Harry,
> >
> > Thanks for sharing this proposal. Overall I think it's very aligned wit=
h
> > Simon's description of the generic KMS color API. I think it's a good
> > start point and we can refine over iterations. My general questions hav=
e
> > already been pointed out by Sebastian and Pekka (mainly regarding the
> > BYPASS property).
> >
> > I still have some doubts on how to fit these set of colorops with some
> > AMD corners cases as below:
> >
> > > +
> > > +    Plane 10
> > > +    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cur=
sor} =3D Primary
> > > +    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> > > +    Color operation 42 (input CSC)
> > > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > > +    =E2=94=9C=E2=94=80 "matrix_data": blob
> > > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> > IIUC, for input CSC, there are currently two possiblities, or we use
> > `drm_plane_color_encoding` and `drm_plane_color range` to get
> > pre-defined coefficients or we set a custom matrix here, right? If so, =
I
> > think we need some kind of pre-defined matrix option?

Seems reasonable. If they are mutually exclusive you might want to
expose 2 different pipelines for it.

> > Also, with this new plane API in place, I understand that we will
> > already need think on how to deal with the mixing between old drm color
> > properties (color encoding and color range) and these new way of settin=
g
> > plane color properties. IIUC, Pekka asked a related question about it
> > when talking about CRTC automatic RGB->YUV (?)

Indeed, good catch! I listed some of them in my proposal more than one
year ago but completely forgot about them already.

>
> I didn't realize color encoding and color range KMS plane properties
> even existed. There is even color space on rockchip!
>
> https://drmdb.emersion.fr/properties?object-type=3D4008636142
>
> That list has even more conflicts: DEGAMMA_MODE, EOTF, FEATURE,
> NV_INPUT_COLORSPACE, SCALING_FILTER, WATERMARK, alpha, GLOBAL_ALPHA,
> brightness, colorkey, contrast, and more. I hope most of them are
> actually from downstream drivers.
>
> I think they should be forbidden to be used together with the new
> pipeline UAPI. Mixing does not work in the long run, it would be
> undefined at what position do the old properties apply in a pipeline.
>
> Apparently, we already need a DRM client cap for the new color pipeline
> UAPI to hide these legacy things.

Agreed. We'll need one cap for planes and one in the future for CRTCs then.

>
> This is different from "CRTC automatic RGB->YUV", because the CRTC
> thing is chosen silently by the driver and there is nothing after it.
> Those old plane properties are explicitly programmed by userspace.
>
>
> Thanks,
> pq
>
> > > +    Color operation 43
> > > +    =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> > > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> > > +    Color operation 44 (DeGamma)
> > > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > > +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =
=3D sRGB
> > > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
> > > +    Color operation 45 (gamut remap)
> > > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > > +    =E2=94=9C=E2=94=80 "matrix_data": blob
> > > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> > > +    Color operation 46 (shaper LUT RAM)
> > > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > > +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> > > +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > > +    =E2=94=9C=E2=94=80 "lut_data": blob
> > > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
> >
> > For shaper and blend LUT RAM, that the driver supports pre-defined
> > curves and custom LUT at the same time but the resulted LUT is a
> > combination of those, how to make this behavior clear? Could this
> > behavior be described by two colorop in a row: for example, one for
> > shaper TF and,just after, another for shaper LUT or would it not be the
> > right representation?
> >
> > > +    Color operation 47 (3D LUT RAM)
> > > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> > > +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> > > +    =E2=94=9C=E2=94=80 "lut_data": blob
> > > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> > > +    Color operation 48 (blend gamma)
> > > +    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > > +    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=
=A6} =3D LUT
> > > +    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > > +    =E2=94=9C=E2=94=80 "lut_data": blob
> > > +    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
> > > +
> > > +
> > > +Color Pipeline Programming
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > +
> > > +Once a DRM client has found a suitable pipeline it will:
> > > +
> > > +1. Set the COLOR_PIPELINE enum value to the one pointing at the firs=
t
> > > +   drm_colorop object of the desired pipeline
> > > +2. Set the properties for all drm_colorop objects in the pipeline to=
 the
> > > +   desired values, setting BYPASS to true for unused drm_colorop blo=
cks,
> > > +   and false for enabled drm_colorop blocks
> > > +3. Perform atomic_check/commit as desired
> > > +
> > > +To configure the pipeline for an HDR10 PQ plane and blending in line=
ar
> > > +space, a compositor might perform an atomic commit with the followin=
g
> > > +property values::
> > > +
> > > +    Plane 10
> > > +    =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> > > +    Color operation 42 (input CSC)
> > > +    =E2=94=94=E2=94=80 "bypass" =3D true
> > > +    Color operation 44 (DeGamma)
> > > +    =E2=94=94=E2=94=80 "bypass" =3D true
> > > +    Color operation 45 (gamut remap)
> > > +    =E2=94=94=E2=94=80 "bypasse" =3D true
> > > +    Color operation 46 (shaper LUT RAM)
> > > +    =E2=94=94=E2=94=80 "bypass" =3D true
> > > +    Color operation 47 (3D LUT RAM)
> > > +    =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping +=
 night mode
> > > +    Color operation 48 (blend gamma)
> > > +    =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ inverse EOTF
> >
> > Isn't it a PQ EOTF for blend gamma?
> >
> > Best Regards,
> >
> > Melissa
> >
> > > +
> > > +
> > > +References
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bz=
e_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn48=
8=3D@emersion.fr/
> > > \ No newline at end of file
> > > --
> > > 2.42.0
> > >
>

