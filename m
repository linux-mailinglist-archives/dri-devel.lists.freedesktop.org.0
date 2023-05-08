Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943766FA4E5
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C7C10E1DD;
	Mon,  8 May 2023 10:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0EA10E1D3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683540247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFAr0sUrHOdVRZibK1BPdvQLLvOGoS2cKTV3l4CCoj4=;
 b=chIZO8lm4k0L3r06ZZCMkjs/uv+jeR9KHcNKIy9x8kzfx93Dq2a8lBM3iq2RRUEDEuduRT
 T+IvBFDtk/9DmUgbYLdHgrgutshSwiA1e1LSriPPZFKJKRdBRQk9q11AAfeMmD0RSoD5Vs
 ERc6ZtSDobdBdyn+7xEevgz/d40yrn8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-7ywaf1qFOYGub8pVBBeCtA-1; Mon, 08 May 2023 06:04:04 -0400
X-MC-Unique: 7ywaf1qFOYGub8pVBBeCtA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ad94975f84so3636191fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683540243; x=1686132243;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFAr0sUrHOdVRZibK1BPdvQLLvOGoS2cKTV3l4CCoj4=;
 b=FxzvlwxrIw2sAmmP73ylUMG+u4uHebe+5YHYouKxp/F7PgUXN2xi/ZPmPpXwF8l+dW
 BKDNn8s9tvmy5ce8LFwsMd6omPS5nfryKjvHEw5TyefPgJEpXVpbh6dWEpmSfgAC+wgK
 VSaGdCTEBGwqMNXChKaUNj0dbn7CTV5w4dvYXFpyPWKqTqs+E/zYwGERhy00fTb8njEK
 vcC5Hk05VZqqKY7EtnQnIdHfoFeOPkJarS8LL17zB9fBoblZq/srH3AL3xN/+kZpyTxI
 2fhaPdn66IyBUInJvEXZh60myT1vx1ZS9mVzlk2GcCVW4qSKViMCU90/digFeC/SkXOK
 lNcQ==
X-Gm-Message-State: AC+VfDyYMk1v46oY2/9TCI+Tfm8d5jNvn/Yhu0wGERBae5NFD43OmywI
 w3mTqipO1Gy9ljtAxI6JRho/8zlPeYkpF93rjNMAVtwfWTaiYx66siv1mbSfU5f0ulqzVMLfgai
 yhDlpLUjuigZpImdkxaXPF5L8FCIx
X-Received: by 2002:ac2:5fc1:0:b0:4dc:4fe2:2aad with SMTP id
 q1-20020ac25fc1000000b004dc4fe22aadmr2479838lfg.41.1683540243109; 
 Mon, 08 May 2023 03:04:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6q6jh9T/EDisOsvdt4HzCrj+Vch4BImQKg1K+155HU2OLGwIZgyYPASYrevlGf9Lh1BhnIOw==
X-Received: by 2002:ac2:5fc1:0:b0:4dc:4fe2:2aad with SMTP id
 q1-20020ac25fc1000000b004dc4fe22aadmr2479819lfg.41.1683540242714; 
 Mon, 08 May 2023 03:04:02 -0700 (PDT)
Received: from redhat.com (host-95-193-100-112.mobileonline.telia.com.
 [95.193.100.112]) by smtp.gmail.com with ESMTPSA id
 p17-20020ac246d1000000b004edd32d0bdesm1255820lfo.288.2023.05.08.03.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 03:04:01 -0700 (PDT)
Date: Mon, 8 May 2023 12:03:59 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <ZFjJD4DTsgsdIEGf@redhat.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 09:14:18AM +1000, Dave Airlie wrote:
> On Sat, 6 May 2023 at 08:21, Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >
> > On Fri, May 5, 2023 at 10:40 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > On Fri, 5 May 2023 at 01:23, Simon Ser <contact@emersion.fr> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > The goal of this RFC is to expose a generic KMS uAPI to configure the color
> > > > pipeline before blending, ie. after a pixel is tapped from a plane's
> > > > framebuffer and before it's blended with other planes. With this new uAPI we
> > > > aim to reduce the battery life impact of color management and HDR on mobile
> > > > devices, to improve performance and to decrease latency by skipping
> > > > composition on the 3D engine. This proposal is the result of discussions at
> > > > the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> > > > familiar with the AMD, Intel and NVIDIA hardware have participated in the
> > > > discussion.
> > > >
> > > > This proposal takes a prescriptive approach instead of a descriptive approach.
> > > > Drivers describe the available hardware blocks in terms of low-level
> > > > mathematical operations, then user-space configures each block. We decided
> > > > against a descriptive approach where user-space would provide a high-level
> > > > description of the colorspace and other parameters: we want to give more
> > > > control and flexibility to user-space, e.g. to be able to replicate exactly the
> > > > color pipeline with shaders and switch between shaders and KMS pipelines
> > > > seamlessly, and to avoid forcing user-space into a particular color management
> > > > policy.
> > >
> > > I'm not 100% sold on the prescriptive here, let's see if someone can
> > > get me over the line with some questions later.
> > >
> > > My feeling is color pipeline hw is not a done deal, and that hw
> > > vendors will be revising/evolving/churning the hw blocks for a while
> > > longer, as there is no real standards in the area to aim for, all the
> > > vendors are mostly just doing whatever gets Windows over the line and
> > > keeps hw engineers happy. So I have some concerns here around forwards
> > > compatibility and hence the API design.
> > >
> > > I guess my main concern is if you expose a bunch of hw blocks and
> > > someone comes up with a novel new thing, will all existing userspace
> > > work, without falling back to shaders?
> > > Do we have minimum guarantees on what hardware blocks have to be
> > > exposed to build a useable pipeline?
> > > If a hardware block goes away in a new silicon revision, do I have to
> > > rewrite my compositor? or will it be expected that the kernel will
> > > emulate the old pipelines on top of whatever new fancy thing exists.
> >
> > I think there are two answers to those questions.
> 
> These aren't selling me much better :-)
> >
> > The first one is that right now KMS already doesn't guarantee that
> > every property is supported on all hardware. The guarantee we have is
> > that properties that are supported on a piece of hardware on a
> > specific kernel will be supported on the same hardware on later
> > kernels. The color pipeline is no different here. For a specific piece
> > of hardware a newer kernel might only change the pipelines in a
> > backwards compatible way and add new pipelines.
> >
> > So to answer your question: if some hardware with a novel pipeline
> > will show up it might not be supported and that's fine. We already
> > have cases where some hardware does not support the gamma lut property
> > but only the CSC property and that breaks night light because we never
> > bothered to write a shader fallback. KMS provides ways to offload work
> > but a generic user space always has to provide a fallback and this
> > doesn't change. Hardware specific user space on the other hand will
> > keep working with the forward compatibility guarantees we want to
> > provide.
> 
> In my mind we've screwed up already, isn't a case to be made for
> continue down the same path.
> 
> The kernel is meant to be a hardware abstraction layer, not just a
> hardware exposure layer. The kernel shouldn't set policy and there are
> cases where it can't act as an abstraction layer (like where you need
> a compiler), but I'm not sold that this case is one of those yet. I'm
> open to being educated here on why it would be.

It would still be an abstraction of the hardware, just that the level
of abstraction is a bit "lower" than your intuition currently tells you
we should have. IMO it's not too different from the kernel providing low
level input events describing what what the hardware can do and does,
with a rather massive user space library (libinput) turning all of that
low level nonsense to actual useful abstractions.

In this case it's the other way around, the kernel provides vendor
independent knobs that describe what the output hardware can do, and
exactly how it does it, and a userspace library turns that into a
different and perhaps more useful abstraction.

I realize input and output is dramatically different, just making a
point about the level of abstraction that is ideal is not necessary "the
more the better".

> 
> >
> > The second answer is that we want to provide a user space library
> > which takes a description of a color pipeline and tries to map that to
> > the available KMS color pipelines. If there is a novel color
> > operation, adding support in this library would then make it possible
> > to offload compatible color pipelines on this new hardware for all
> > consumers of the library. Obviously there is no guarantee that
> > whatever color pipeline compositors come up with can actually be
> > realized on specific hardware but that's just an inherent hardware
> > issue.
> >
> 
> Why does this library need to be in userspace though? If there's a
> library making device dependent decisions, why can't we just make
> those device dependent decisions in the kernel?

Compositors will want to switch between using the KMS color pipeline and
using shaders without visible differences at any point in time, or
predictable visible differences. Lets say for example you are playing a
video, and everything bypasses the GPU, and we're saving important power
and all that. Suddenly the user moves the mouse or touches the screen
and we'll suddenly have overlays that make it necessary to stop
bypassing the GPU and start compositing.

These transitions should not result in any visible difference, and that
is hard/impossible to do perfectly if the level of abstraction is too
high, as implementation details of the pipeline would be hidden. The
decisions the kernel had to make to turn the descriptive declaration
into actual hardware configuration wouldn't be predictable or known.

Userspace needs to know how the kernel implements a pipeline, so that it
can decide if it's "good enough" or perhaps even adapt its compositing
to match it so that it can implement non-glitchy offloading. The
compositor should make the decision if pixel perfect transitions is
mandatory or not, it shouldn't be a policy implemented inside the
kernel.

It is also within scope of a library that provides the descriptive API
to also know how to handle the fallback, e.g. by providing shaders that
compositors can use when compositing. The kernel is the wrong place to
generate shaders.

> 
> This feels like we are trying to go down the Android HWC road, but we
> aren't in that business.
> 
> My thoughts would be userspace has to have some way to describe what
> it wants anyways, otherwise it does sound like I need to update
> mutter, kwin, surfaceflinger, chromeos, gamescope, every time a new HW
> device comes out that operates slightly different to previously
> generations. This isn't the kernel doing hw abstraction at all, it's
> the kernel just opting out of designing interfaces and it isn't
> something I'm sold on.

It is true that for a new generation of hardware that changes the color
pipeline in a way that makes existing userspace no longer able to
off-load compositing, needs an updated userspace, but the grand long
term idea is that one wouldn't update all those compositors, but only
the shared library that provides the descriptive API they all (ideally)
make use of. The compositors still handle interacting with KMS
themselves, but would share this helper library that can help
configuring a subset of the knobs KMS provide to their individual needs.

So indeed the kernel isn't doing all the abstraction, it'd be the kernel
together with a userspace library.

Jonas

> 
> Dave.
> 

