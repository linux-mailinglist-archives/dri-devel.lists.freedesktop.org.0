Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48D773A16
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 14:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802BA10E09F;
	Tue,  8 Aug 2023 12:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D715C10E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691496844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDuO9bhbYkQmnoJmdA06h2aMhfAOsX8hw8Z40IIdVdQ=;
 b=XC28ZiC1SaD0V1oFzUj3EiPcVNy2Jvs6NHxh4VqnW9Tf18pl+2eipeesOF+F7etaqCa5+A
 khKV3t4aXCftQ0Jz5JjOH/eYtvaWBKjbb3HfauSQycPi5wxgOe4fsfuEoJ3EJCcToM64yL
 MmiJ1HT9s7IfL0euSIih0AJFkuxON9s=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-T7AQE6tNN0S0zWTaS-wU-Q-1; Tue, 08 Aug 2023 08:14:02 -0400
X-MC-Unique: T7AQE6tNN0S0zWTaS-wU-Q-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b9dc1bfdd2so58878231fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 05:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691496841; x=1692101641;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDuO9bhbYkQmnoJmdA06h2aMhfAOsX8hw8Z40IIdVdQ=;
 b=cfhFRB7jOpxxzsXZWQl+UbMrS3KB2yyS+YQqmArrSWF4iUZXkWQH5PRAyxjEVghALu
 NCYDI/GHHByo6DBkq0BXdX3kgeYEFUY4WNdmE2qxgjECgJq8xToBgtGUQ9DFIKc+05bP
 JYIri7p3eICnguWsRNoQfDZ1UlAlwbGPRp5JFcogc3blRmNKBBTj34vXUsvSd56bELdx
 g48k+DYpqcuzczU3oh34E6GijHG/lInG4/RGE8bzO6L/uSnR2QK00J6cLacUKr49CDUg
 h97nXSQLr9LDp148IqBvjUobTJUZo0wawBqdE3R4e5bdXGZwpfajJdeuI8A2DkX0xzQ3
 aI9w==
X-Gm-Message-State: AOJu0YzsVQf+8oFoQg3M2ariAAVktOu/d79l/+KruD98dmbcBCZxtblQ
 ejsF8w+TFVA99SqqH3ge5P556qOBEgZXqA1XedR3i3UuvtUfcmHOU20J8UAeFX0YTyB71SzJ31o
 35UrNPjvTuPg4AJOjvRZCglrHclYI2asApeBPu+16tMst
X-Received: by 2002:a2e:8884:0:b0:2b9:4413:864e with SMTP id
 k4-20020a2e8884000000b002b94413864emr8771818lji.53.1691496841066; 
 Tue, 08 Aug 2023 05:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG00dtg78xBWNPk1NuFuyep1trDdeEvs4ECjrJZuNImsJLQBbQZ4eZdAKc/+97p72TE9mUQKtvCTnAVcwA5V28=
X-Received: by 2002:a2e:8884:0:b0:2b9:4413:864e with SMTP id
 k4-20020a2e8884000000b002b94413864emr8771790lji.53.1691496840716; Tue, 08 Aug
 2023 05:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <ZMz3IXIzXS5gNK3G@phenom.ffwll.local>
In-Reply-To: <ZMz3IXIzXS5gNK3G@phenom.ffwll.local>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 8 Aug 2023 14:13:49 +0200
Message-ID: <CA+hFU4wbn=efbS10c14A9sLTf9GYJ_O12kowh76ELLdo2+x5fA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, 
 pierre-eric.pelloux-prayer@amd.com, Simon Ser <contact@emersion.fr>, 
 Rob Clark <robdclark@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, 
 Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, 
 Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 3:03=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Tue, Jun 27, 2023 at 10:23:23AM -0300, Andr=C3=A9 Almeida wrote:
> > Create a section that specifies how to deal with DRM device resets for
> > kernel and userspace drivers.
> >
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > ---
> >
> > v4: https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@iga=
lia.com/
> >
> > Changes:
> >  - Grammar fixes (Randy)
> >
> >  Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 65fb3036a580..3cbffa25ed93 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a th=
ird handler for
> >  mmapped regular files. Threads cause additional pain with signal
> >  handling as well.
> >
> > +Device reset
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The GPU stack is really complex and is prone to errors, from hardware =
bugs,
> > +faulty applications and everything in between the many layers. Some er=
rors
> > +require resetting the device in order to make the device usable again.=
 This
> > +sections describes the expectations for DRM and usermode drivers when =
a
> > +device resets and how to propagate the reset status.
> > +
> > +Kernel Mode Driver
> > +------------------
> > +
> > +The KMD is responsible for checking if the device needs a reset, and t=
o perform
> > +it as needed. Usually a hang is detected when a job gets stuck executi=
ng. KMD
> > +should keep track of resets, because userspace can query any time abou=
t the
> > +reset stats for an specific context. This is needed to propagate to th=
e rest of
> > +the stack that a reset has happened. Currently, this is implemented by=
 each
> > +driver separately, with no common DRM interface.
> > +
> > +User Mode Driver
> > +----------------
> > +
> > +The UMD should check before submitting new commands to the KMD if the =
device has
> > +been reset, and this can be checked more often if the UMD requires it.=
 After
> > +detecting a reset, UMD will then proceed to report it to the applicati=
on using
> > +the appropriate API error code, as explained in the section below abou=
t
> > +robustness.
> > +
> > +Robustness
> > +----------
> > +
> > +The only way to try to keep an application working after a reset is if=
 it
> > +complies with the robustness aspects of the graphical API that it is u=
sing.
> > +
> > +Graphical APIs provide ways to applications to deal with device resets=
. However,
> > +there is no guarantee that the app will use such features correctly, a=
nd the
> > +UMD can implement policies to close the app if it is a repeating offen=
der,
>
> Not sure whether this one here is due to my input, but s/UMD/KMD. Repeat
> offender killing is more a policy where the kernel enforces policy, and n=
o
> longer up to userspace to dtrt (because very clearly userspace is not
> really doing the right thing anymore when it's just hanging the gpu in an
> endless loop). Also maybe tune it down further to something like "the
> kernel driver may implemnent ..."
>
> In my opinion the umd shouldn't implement these kind of magic guesses, th=
e
> entire point of robustness apis is to delegate responsibility for
> correctly recovering to the application. And the kernel is left with
> enforcing fair resource usage policies (which eventually might be a
> cgroups limit on how much gpu time you're allowed to waste with gpu
> resets).

Killing apps that the kernel thinks are misbehaving really doesn't
seem like a good idea to me. What if the process is a service getting
restarted after getting killed? What if killing that process leaves
the system in a bad state?

Can't the kernel provide some information to user space so that e.g.
systemd can handle those situations?

> > +likely in a broken loop. This is done to ensure that it does not keep =
blocking
> > +the user interface from being correctly displayed. This should be done=
 even if
> > +the app is correct but happens to trigger some bug in the hardware/dri=
ver.
> > +
> > +OpenGL
> > +~~~~~~
> > +
> > +Apps using OpenGL should use the available robust interfaces, like the
> > +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL E=
S). This
> > +interface tells if a reset has happened, and if so, all the context st=
ate is
> > +considered lost and the app proceeds by creating new ones. If it is po=
ssible to
> > +determine that robustness is not in use, the UMD will terminate the ap=
p when a
> > +reset is detected, giving that the contexts are lost and the app won't=
 be able
> > +to figure this out and recreate the contexts.
> > +
> > +Vulkan
> > +~~~~~~
> > +
> > +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submis=
sions.
> > +This error code means, among other things, that a device reset has hap=
pened and
> > +it needs to recreate the contexts to keep going.
> > +
> > +Reporting causes of resets
> > +--------------------------
> > +
> > +Apart from propagating the reset through the stack so apps can recover=
, it's
> > +really useful for driver developers to learn more about what caused th=
e reset in
> > +first place. DRM devices should make use of devcoredump to store relev=
ant
> > +information about the reset, so this information can be added to user =
bug
> > +reports.
>
> Since we do not seem to have a solid consensus in the community about
> non-robust userspace, maybe we could just document that lack of consensus
> to unblock this patch? Something like this:
>
> Non-Robust Userspace
> --------------------
>
> Userspace that doesn't support robust interfaces (like an non-robust
> OpenGL context or API without any robustness support like libva) leave th=
e
> robustness handling entirely to the userspace driver. There is no strong
> community consensus on what the userspace driver should do in that case,
> since all reasonable approaches have some clear downsides.
>
> With the s/UMD/KMD/ further up and maybe something added to record the
> non-robustness non-consensus:
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Cheers, Daniel
>
>
>
> > +
> >  .. _drm_driver_ioctl:
> >
> >  IOCTL Support on Device Nodes
> > --
> > 2.41.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

