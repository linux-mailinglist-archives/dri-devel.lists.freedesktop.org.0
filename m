Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207826F8C50
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 00:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743D910E10A;
	Fri,  5 May 2023 22:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3237010E10A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683325261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3vBocqQ8ngTRhTKYb+VWCwFov1RNlAOBIaghJhsO6A=;
 b=REc7f8/6/UKTRXn+fcPmfROPbTqgfjcw0rfoEjCUArqDbFr0ZHy9RbZCXrJE+hw/Z1/sNa
 BDGJCWLtvZCmd4LzJyjXRit1au14qg+OXpKm05srsT6/IYDQu59DtvH3yL55t58GaU4qdV
 qSCARPqiR2hDldPRajN9g8sfsmPbzQs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-dcXWhvQnNhyT5fUeehZK5g-1; Fri, 05 May 2023 18:20:59 -0400
X-MC-Unique: dcXWhvQnNhyT5fUeehZK5g-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ac828fcd98so9544891fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 15:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683325258; x=1685917258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L3vBocqQ8ngTRhTKYb+VWCwFov1RNlAOBIaghJhsO6A=;
 b=Rb4wvRxdYnI5WnejwpE7dSnjnfQa98HakT5kVVOKNASw59ns2KsNZhgF/3G8DTc8hl
 dEfwvDBNBS4hrHz+sggd7wTamlxZvqspEiHxtRE+7TsVteDzD1I+7zaSdxHxroQ4vO5w
 MPoZKv5KIxcgy6pmET3q4X24t9ONP+d51UOksQZEzfoKJzjPctYrXzqoDs0LiNv6AVn5
 MvwTvxbMQYqJs1Y+OofFPSljeYxcXSnNe0YLlxvbjtl+LXFIDyYpfB/EWiuGKZfqsYAM
 NX565CVzZ33WE2ptImx5My8fZ2byfJqMZB2vyGl7XCNkKOwg9Dt0zmGtaUyxvy4a58vd
 jxGw==
X-Gm-Message-State: AC+VfDwFJuz8S+ej2f2calCRYlrO6jqtwvQagG/NQC34jkKXGVXHNUSu
 J2A0fwDLTBd1t+sJPtCh+BxFoIRoBCUS68rQKve4AX6Heu0lCjASSQlxryHQ1d26FLT/3uNchye
 hqD5Of1+4wAl3/6+IEvHebNrrRBME00AsFhMGdBw8Y+p3
X-Received: by 2002:a2e:9a94:0:b0:2ac:795a:5a90 with SMTP id
 p20-20020a2e9a94000000b002ac795a5a90mr854997lji.38.1683325258398; 
 Fri, 05 May 2023 15:20:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5UeyuFajolU5gUoKjKoLG1dcni9T1R6TuQ6542w/k4TEbB5Px57SseEx/KFUhSCgkeZLpMVFeqRE83VyB6BKQ=
X-Received: by 2002:a2e:9a94:0:b0:2ac:795a:5a90 with SMTP id
 p20-20020a2e9a94000000b002ac795a5a90mr854992lji.38.1683325258102; Fri, 05 May
 2023 15:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
In-Reply-To: <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Sat, 6 May 2023 00:20:46 +0200
Message-ID: <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Dave Airlie <airlied@gmail.com>
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
Cc: Aleix Pol <aleixpol@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 5, 2023 at 10:40=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Fri, 5 May 2023 at 01:23, Simon Ser <contact@emersion.fr> wrote:
> >
> > Hi all,
> >
> > The goal of this RFC is to expose a generic KMS uAPI to configure the c=
olor
> > pipeline before blending, ie. after a pixel is tapped from a plane's
> > framebuffer and before it's blended with other planes. With this new uA=
PI we
> > aim to reduce the battery life impact of color management and HDR on mo=
bile
> > devices, to improve performance and to decrease latency by skipping
> > composition on the 3D engine. This proposal is the result of discussion=
s at
> > the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> > familiar with the AMD, Intel and NVIDIA hardware have participated in t=
he
> > discussion.
> >
> > This proposal takes a prescriptive approach instead of a descriptive ap=
proach.
> > Drivers describe the available hardware blocks in terms of low-level
> > mathematical operations, then user-space configures each block. We deci=
ded
> > against a descriptive approach where user-space would provide a high-le=
vel
> > description of the colorspace and other parameters: we want to give mor=
e
> > control and flexibility to user-space, e.g. to be able to replicate exa=
ctly the
> > color pipeline with shaders and switch between shaders and KMS pipeline=
s
> > seamlessly, and to avoid forcing user-space into a particular color man=
agement
> > policy.
>
> I'm not 100% sold on the prescriptive here, let's see if someone can
> get me over the line with some questions later.
>
> My feeling is color pipeline hw is not a done deal, and that hw
> vendors will be revising/evolving/churning the hw blocks for a while
> longer, as there is no real standards in the area to aim for, all the
> vendors are mostly just doing whatever gets Windows over the line and
> keeps hw engineers happy. So I have some concerns here around forwards
> compatibility and hence the API design.
>
> I guess my main concern is if you expose a bunch of hw blocks and
> someone comes up with a novel new thing, will all existing userspace
> work, without falling back to shaders?
> Do we have minimum guarantees on what hardware blocks have to be
> exposed to build a useable pipeline?
> If a hardware block goes away in a new silicon revision, do I have to
> rewrite my compositor? or will it be expected that the kernel will
> emulate the old pipelines on top of whatever new fancy thing exists.

I think there are two answers to those questions.

The first one is that right now KMS already doesn't guarantee that
every property is supported on all hardware. The guarantee we have is
that properties that are supported on a piece of hardware on a
specific kernel will be supported on the same hardware on later
kernels. The color pipeline is no different here. For a specific piece
of hardware a newer kernel might only change the pipelines in a
backwards compatible way and add new pipelines.

So to answer your question: if some hardware with a novel pipeline
will show up it might not be supported and that's fine. We already
have cases where some hardware does not support the gamma lut property
but only the CSC property and that breaks night light because we never
bothered to write a shader fallback. KMS provides ways to offload work
but a generic user space always has to provide a fallback and this
doesn't change. Hardware specific user space on the other hand will
keep working with the forward compatibility guarantees we want to
provide.

The second answer is that we want to provide a user space library
which takes a description of a color pipeline and tries to map that to
the available KMS color pipelines. If there is a novel color
operation, adding support in this library would then make it possible
to offload compatible color pipelines on this new hardware for all
consumers of the library. Obviously there is no guarantee that
whatever color pipeline compositors come up with can actually be
realized on specific hardware but that's just an inherent hardware
issue.

> We are not Android, or even Steam OS on a Steamdeck, we have to be
> able to independently update the kernel for new hardware and not
> require every compositor currently providing HDR to need to support
> new hardware blocks and models at the same time.
>
> Dave.
>

