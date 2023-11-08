Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC257E55B6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 12:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBF310E718;
	Wed,  8 Nov 2023 11:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE27810E718
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699443653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaKAy6lsb67xJXjD38xZ9Xk+FgPJz9/9MYgINsgg/Zo=;
 b=hJMjA2T5r4AE9/+7BO1jR8jJJd1zFJ4R0Waft9B8LKaZvM5hu4ck4VqVHtL4Wk7/2/gfIJ
 X3/5fK3XVi13voUfjaeFfVJ2bw2gBQlqd5htT+maUAJUWNdszC2p/X1OdU+httLGpQkH4n
 Wr4i092fAQF5jZWl38MRsNz6FqD5CNk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-x4WpriPJN8SCJy-AZiUMiw-1; Wed, 08 Nov 2023 06:40:52 -0500
X-MC-Unique: x4WpriPJN8SCJy-AZiUMiw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-507b0270b7fso6666161e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 03:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699443650; x=1700048450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XaKAy6lsb67xJXjD38xZ9Xk+FgPJz9/9MYgINsgg/Zo=;
 b=PDIbCUKEFgZq1WkergnP0bj9505E9awxHiUKpvvTOnq6X7dXASS4qhgtZJi/4d9bt6
 pLUz9uDdxof3y+Ohm0Ig4NUbyjwtaK1QE7/mPBGUbcmJ7DqKh+W91PqaR7LPjGxN6J9f
 1gsVCpsj4uvfGp2Pt/ZK34O0UFxcg3FVgD7B7Z7yQN2C7PorTwhka1NH9Axi7rYRl5Z8
 rlR/M4VHABqkswyWnDPdVYlHnJkWqPxSxyleQR36AgxYJI0qHzV0fq5WjMbe98F7Ieo+
 OwYGRtyzFS6yQsyOZj5g/BosozZ5NprFgQSFIEAVWHPwIJgFISZX8Vpso5A5aB/e9dqA
 miOQ==
X-Gm-Message-State: AOJu0Yyeg9ge60jX9orY9RZS00745ISZC0BvKYfFKcrlgUrUEGPQaF44
 bPjd8fPv/pahmX9D8JztMY2i6esIJqpA+Lk+j1IdUlRBkV5kCU3uxIvuqk6RsCTeZct7SVHMdep
 bCGVH/fU6s2NP6WfE7rRr0r53BramFREgX5a/cqyjipip
X-Received: by 2002:a05:6512:239e:b0:504:7bb0:9d7e with SMTP id
 c30-20020a056512239e00b005047bb09d7emr1510119lfv.27.1699443650697; 
 Wed, 08 Nov 2023 03:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1rP/bT8ULnyXh1JQ+nLgp6puZPliQhTO/3bJL5O48g40kIO3enQrtPaBl9wdPSi2c9QwfxvDg9ITx0BaVMvI=
X-Received: by 2002:a05:6512:239e:b0:504:7bb0:9d7e with SMTP id
 c30-20020a056512239e00b005047bb09d7emr1510080lfv.27.1699443650186; Wed, 08
 Nov 2023 03:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
 <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
 <20231108121601.163e58db@eldfell>
In-Reply-To: <20231108121601.163e58db@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Wed, 8 Nov 2023 12:40:39 +0100
Message-ID: <CA+hFU4zFz1NyDRzgaeaWVEw9GU-Lm9D=oDsOABnOpMsNHQfdzQ@mail.gmail.com>
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

On Wed, Nov 8, 2023 at 11:16=E2=80=AFAM Pekka Paalanen <ppaalanen@gmail.com=
> wrote:
>
> On Tue, 7 Nov 2023 11:58:26 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
>
> > On 2023-11-07 04:55, Pekka Paalanen wrote:
> > > On Mon, 6 Nov 2023 11:19:27 -0500
> > > Harry Wentland <harry.wentland@amd.com> wrote:
> > >
> > >> On 2023-10-20 06:36, Pekka Paalanen wrote:
> > >>> On Thu, 19 Oct 2023 10:56:40 -0400
> > >>> Harry Wentland <harry.wentland@amd.com> wrote:
> > >>>
> > >>>> On 2023-10-10 12:13, Melissa Wen wrote:
> > >>>>> O 09/08, Harry Wentland wrote:
> > >>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > >>>
> > >>> ...
> > >>>
> > >>>>> Also, with this new plane API in place, I understand that we will
> > >>>>> already need think on how to deal with the mixing between old drm=
 color
> > >>>>> properties (color encoding and color range) and these new way of =
setting
> > >>>>> plane color properties. IIUC, Pekka asked a related question abou=
t it
> > >>>>> when talking about CRTC automatic RGB->YUV (?)
> > >>>>>
> > >>>>
> > >>>> We'll still need to confirm whether we'll want to deprecate these
> > >>>> existing properties. If we do that we'd want a client prop. Things
> > >>>> should still work without deprecating them, if drivers just pick u=
p
> > >>>> after the initial encoding and range CSC.
> > >>>>
> > >>>> But realistically it might be better to deprecate them and turn th=
em
> > >>>> into explicit colorops.
> > >>>
> > >>> The existing properties would need to be explicitly reflected in th=
e
> > >>> new pipelines anyway, otherwise there would always be doubt at whic=
h
> > >>> point of a pipeline the old properties apply, and they might even
> > >>> need to change positions between pipelines.
> > >>>
> > >>> I think it is simply easier to just hide all old color related
> > >>> properties when userspace sets the client-cap to enable pipelines. =
The
> > >>> problem is to make sure to hide all old properties on all drivers t=
hat
> > >>> support the client-cap.
> > >>>
> > >>> As a pipeline must be complete (describe everything that happens to
> > >>> pixel values), it's going to be a flag day per driver.
> > >>>
> > >>> Btw. the plane FB YUV->RGB conversion needs a colorop in every pipe=
line
> > >>> as well. Maybe it's purely informative and non-configurable, keyed =
by
> > >>> FB pixel format, but still.
> > >>>
> > >>> We also need a colorop to represent sample filtering, e.g. bilinear=
,
> > >>> like I think Sebastian may have mentioned in the past. Everything
> > >>> before the sample filter happens "per tap" as Joshua Ashton put it,=
 and
> > >>> everything after it happens on the sample that was computed as a
> > >>> weighted average of the filter tap inputs (texels).
> > >>>
> > >>> There could be colorops other than sample filtering that operate on
> > >>> more than one sample at a time, like blur or sharpness. There could
> > >>> even be colorops that change the image size like adding padding tha=
t
> > >>> the following colorop hardware requires, and then yet another color=
op
> > >>> that clips that padding away. For an example, see
> > >>> https://lists.freedesktop.org/archives/dri-devel/2023-October/42701=
5.html
> > >>>
> > >>> If that padding and its color can affect the pipeline results of th=
e
> > >>> pixels near the padding (e.g. some convolution is applied with them=
,
> > >>> which may be the reason why padding is necessary to begin with), th=
en
> > >>> it would be best to model it.
> > >>>
> > >>
> > >> I hear you but I'm also somewhat shying away from defining this at t=
his point.
> > >
> > > Would you define them before the new UAPI is released though?
> > >
> > > I agree there is no need to have them in this patch series, but I thi=
nk
> > > we'd hit the below problems if the UAPI is released without them.
> > >
> > >> There are already too many things that need to happen and I will foc=
us on the
> > >> actual color blocks (LUTs, matrices) first. We'll always be able to =
add a new
> > >> (read-only) colorop type to define scaling and tap behavior at any p=
oint and
> > >> a client is free to ignore a color pipeline if it doesn't find any t=
ap/scale
> > >> info in it.
> > >
> > > How would userspace know to look for tap/scale info, if there is no
> > > upstream definition even on paper?
> > >
> >
> > So far OSes did not care about this. Whether that's good or bad is
> > something everyone can answer for themselves.
> >
> > If you write a compositor and really need this you can just ignore
> > color pipelines that don't have this, i.e., you'll probably want
> > to wait with implementing color pipeline support until you have what
> > you need from DRM/KMS.
> >
> > This is not to say I don't want to have support for Weston. But I'm
> > wondering if we place too much importance on getting every little
> > thing figured out whereas we could be making forward progress and
> > address more aspects of a color pipeline in the future. There is a
> > reason gamescope has made a huge difference in driving the color
> > management work forward.
> >
> > > And the opposite case, if someone writes userspace without tap/scale
> > > colorops, and then drivers add those, and there is no pipeline withou=
t
> > > them, because they always exist. Would that userspace disregard all
> > > those pipelines because it does not understand tap/scale colorops,
> > > leaving no usable pipelines? Would that not be kernel regressing
> > > userspace?
> > >
> >
> > The simple solution is to leave previously advertised pipelines
> > untouched and add a new version that does include scaling information.
> >
> > > If the kernel keeps on exposing pipelines without the colorops, it
> > > fails the basic promise of the whole design: that all pixel value
> > > affecting operations are at least listed if not controllable.
> > >
> > > How will we avoid painting ourselves in a corner?
> > >
> > > Maybe we need a colorop for "here be dragons" documented as having
> > > unknown and unreliable effects, until driver authors are sure that
> > > everything has been modelled in the pipeline and there are no unknown=
s?
> > > Or a flag on the pipelines, if we can have that. Then we can at least
> > > tell when the pipeline does not fulfil the basic promise.
> > >
> >
> > The will always be dragons at some level.
>
> Do I understand right that the goal of fully understood color pipelines
> is a lost cause?
>
> That every pipeline might always have something unknown and there is no
> way for userspace to know if it does? Maybe because driver developers
> don't know either?
>
> By something unknown I refer to anything outside of basic precision
> issues. Doing interpolation or mixing of inputs on the wrong side of a
> known non-linear colorop, for example.

I don't think that's the case. Hardware vendors should understand the
hardware and exposing everything that affects the values is the goal
here. There will be a transitional period where the pipelines might
not expose every detail yet but that's fine. It's better than what we
have now and should become even better with time. It would maybe be
helpful in the future to have a cap, or property, or whatever, to
indicate that the pipelines are "complete" descriptions of what
happens to the values but we can discuss it when it becomes relevant.

> An incremental UAPI development approach is fine by me, meaning that
> pipelines might not be complete at first, but I believe that requires
> telling userspace whether the driver developers consider the pipeline
> complete (no undescribed operations that would significantly change
> results from the expected results given the UAPI exposed pipeline).
>
> The prime example of what I would like to know is that if a FB
> contains PQ-encoded image and I use a color pipeline to scale that
> image up, will the interpolation happen before or after the non-linear
> colorop that decodes PQ. That is a significant difference as pointed
> out by Joshua.
>
>
> Thanks,
> pq

