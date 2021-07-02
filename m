Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF83B9F6C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF2F6E0FF;
	Fri,  2 Jul 2021 11:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2586E0FF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:02:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso6126091wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 04:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v/tOHuJnex4NuJG8cJcaUr1WTjdeZ2K6FMjObN092Po=;
 b=EparL/SUZPUi99pitv7Ag9SThP2SKnGTV72bSfvlFu5APBaU6e+u+TRfySgsahA1Jl
 1IeT3dmFutwRE5LIJR7vmDHYOevdYbfICgVsEAhY2WxZNmeEmnJJWN3UaEDtROlrykaO
 656l00VXfbkHkHqpS2TrdL4zC5dD/Uze8JSv5ocPcE92gkXr5KwpBf02guAb3MoNO9O5
 5YNjMrfaNlMpZj4299GuIPuD0cs7Jofw7MTWzfWRaImcxBHGLmU2T3W9ldj1bStxzjOD
 qCtentRi8Qb5GVu/EeNxdveHqF9gkncrcB8+JkAvynE6gXUtlgoqOJgcM7KdzNK5T9xc
 ofmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v/tOHuJnex4NuJG8cJcaUr1WTjdeZ2K6FMjObN092Po=;
 b=QnDZhBzUQfFOKMLZsLeYyGi8ZB0AofREjlAzQouSal49S7ciorJuAjkayJk6IjjwTO
 EbYqfac+CViRkd5DlIoZpq54Q8WH9B16S4mbb0pYck4Br/3izE2r1WcQ13VCuN4ijVQE
 zPYJUSdwFofM1ZCm4ccnOud/Df/GqDIxacL8/IdzUnywoHRQ5rh8IK4tEDQl6wZW31Sa
 kl2FQCKCI15Hse192Ap8jHm5tJU0J480eoXy/6sdxEijjFp6yH0XaeRAewD0gMGaDqbN
 QyD6hYjSvL0sBYIfrSOo5HYaQU+ZjlCxcUnmYaUTrBkSiBzTuYejID4YGjY03v+PWqgW
 GXgg==
X-Gm-Message-State: AOAM5320VLSrQQ0Kw+cizRbdHs+cWfdAtmjJJtk4cL3yw/hC+Qu8AV6X
 +bPkezzYK2i/xG42yYsRHEFZlJDvqEHDbDAVIuUX0w==
X-Google-Smtp-Source: ABdhPJwEdS2E4outtUt417w9cX1dGKZUi6QwO6Bs8VhHb0EgIA3Zeg2KKSgixdn/C/rbXFJZNWl9hPQ//ZDgQSkFgKs=
X-Received: by 2002:a7b:c0d6:: with SMTP id s22mr15853440wmh.52.1625223755075; 
 Fri, 02 Jul 2021 04:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-5-boris.brezillon@collabora.com>
 <b277ce22-f2d2-35e5-30cd-c851a7896b44@arm.com>
 <20210702124320.1bd0f228@collabora.com>
 <3955f63e-40af-bcb3-0214-2d1f22dbfdec@arm.com>
In-Reply-To: <3955f63e-40af-bcb3-0214-2d1f22dbfdec@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 2 Jul 2021 12:02:23 +0100
Message-ID: <CAPj87rNX56TkmC4mYQrWGw6jLYv37zb67f5F-t8ryyoAAXKfVQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add the ability to create submit
 queues
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 2 Jul 2021 at 11:55, Steven Price <steven.price@arm.com> wrote:
> On 02/07/2021 11:43, Boris Brezillon wrote:
> > On Fri, 2 Jul 2021 10:56:29 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >> My Vulkan knowledge is limited so I'm not sure whether this is the right
> >> approach or not. In particular is it correct that an application can
> >> create a high priority queue which could affect other (normal priority)
> >> applications?
> >
> > That's what msm does (with no extra CAPS check AFAICT), and the
> > freedreno driver can already create high priority queues if
> > PIPE_CONTEXT_HIGH_PRIORITY is passed. Not saying that's okay to allow
> > userspace to tweak the priority, but if that's a problem, other drivers
> > are in trouble too ;-).
>
> Oh well I guess if others are doing the same ;) I have to admit kbase
> has always struggled with how to identify a "privileged" process - it's
> something that makes a bit of sense on Android but for other userspaces
> there really doesn't seem to be a good way of identifying what should or
> should not be allowed to create high priority queues.

Yeah, it's a platform-specific question. Some might want to say
compositor-only, some might want to let foreground apps ramp, etc.

Thankfully, Vulkan is pretty clear that it's just a hint and the
results might be anything or nothing.

> >> Also does it really make sense to allow user space to create an
> >> unlimited number of queues? It feels like an ideal way for an malicious
> >> application to waste kernel memory.
> >
> > Same here, I see no limit on the number of queues the msm driver can
> > create. I can definitely pick an arbitrary limit of 2^16 (or 2^8 if
> > 2^16 is too high) if you prefer, but I feel like there's plenty of ways
> > to force kernel allocations already, like allocating a gazillion of 4k
> > GEM buffers (cgroup can probably limit the total amount of memory
> > allocated, but you'd still have all gem-buf meta data in kernel memory).
>
> I guess the real problem is picking a sensible limit ;) My main concern
> here is that there doesn't appear to be any memory accounted against the
> process. For GEM buffers at least there is some cost to the application
> - so an unbounded allocation isn't possible, even if the bounds are
> likely to be very high.
>
> With kbase we found that syzcaller was good at finding ways of using up
> all the memory on the platform - and if it wasn't accounted to the right
> process that meant the OOM-killer knocked out the wrong process and
> produced a bug report to investigate. Perhaps I'm just scarred by that
> history ;)

Yep, cgroup accounting and restriction is still very much unsolved.
GEM buffers let you make an outsize impact on the whole system at
little to no cost to yourself. You can also create a million syncobjs
if you want. Oh well.

Cheers,
Daniel
