Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE14F365ABF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 16:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771746E509;
	Tue, 20 Apr 2021 14:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F4D6E508
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 14:04:41 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id l17so7703186oil.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BljezzpgMgUXtgbR7MWDThqJmRXbXa9XCKJxhNxJ7LA=;
 b=DOO0nxgu5WT9Ou0SfmL0qTyHHubyuCQOVM4rICfIzQdSn9AQ9mGBF5x91NNGkO9mVa
 sw3AGm4KTr/PRreeKgEAK/z1NLa8kyVQmlHL9FVLDUF2y0BKmngGrMvrVpS7XuOwre1i
 iNbIDpiBIAsrXyl2vCR3oOK3SUhg+KzWuFw4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BljezzpgMgUXtgbR7MWDThqJmRXbXa9XCKJxhNxJ7LA=;
 b=DqwG5DbfyNR5i1CRth79awFrOrUJkQK8M1lJPuNJFSqWdxIYMqn9shfF+jucJu4RDc
 3dFdH8JkQShSb3OjAwvIDutGLsScJZo3i4oHgQ2SGCRD1T0FGiFAcC303wc5E+lB6PA9
 hCq6sDncJv5kffHECHsUCSP+8PBF0931qnqH0sLc3SjzmhTRuWx8tTiD4sWZYurUiuRk
 a0ZWGLEEFZHQOWER5/lHD3S0C4ip0G4IgkAVB35JCQ/QGqnhPHoQIDlJNTphtmyYT03e
 3rUlaF0at57JwmA8kN0z+uhw3x1WqA3n/KmSXD5aT+6EwOhkW72ErMruYnkQ9qRg/jvQ
 SKyQ==
X-Gm-Message-State: AOAM5336alhpAr8Bm7c2eYGgw3knrATUWAJmQOD8l1SRI7bLJ97BRvsr
 BqSuLLU1mf+bqkwAXnY6AWsD8Ol4HJYURaVGHtjhlA==
X-Google-Smtp-Source: ABdhPJxkizS5B/n7GvUenBkrFqmo5u0XakD7fqUnx5vvq0lPdg5vFgebe4ur1+QJFqVqGAbFlDw7SH2XraeJQvvw92U=
X-Received: by 2002:a05:6808:9b0:: with SMTP id
 e16mr2657847oig.128.1618927480549; 
 Tue, 20 Apr 2021 07:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <YH7CmXyKFFh3lagO@phenom.ffwll.local>
 <CAPj87rOhAfLRpRCAgNnCB+dW3vuyVuZK6h3EHdxA-wrH8LxuuQ@mail.gmail.com>
In-Reply-To: <CAPj87rOhAfLRpRCAgNnCB+dW3vuyVuZK6h3EHdxA-wrH8LxuuQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Apr 2021 16:04:28 +0200
Message-ID: <CAKMK7uF8RPV2MExH8Neh4820TN_w+AjiQmV=18KQErA-APx1vg@mail.gmail.com>
Subject: Re: [RFC] Linux Graphics Next: Explicit fences everywhere and no BO
 fences - initial proposal
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 3:04 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Tue, 20 Apr 2021 at 13:01, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> - We live in a post xf86-video-$vendor world, and all these other
>>   compositors rely on implicit sync. You're not going to be able to get
>>   rid of them anytime soon. What's worse, all the various EGL/vk buffer
>>   sharing things also rely on implicit sync, so you get to fix up tons of
>>   applications on top. Any plan that's realistic needs to cope with
>>   implicit/explicit at the same time together won't work.
>>
>> - Absolute infuriating, but you can't use page-faulting together with any
>>   dma_fence synchronization primitives, whether implicit or explicit. This
>>   means until the entire ecosystem moved forward (good luck with that) we
>>   have to support dma_fence. The only sync model that works together with
>>   page faults is userspace fence based sync.
>>
>> This should get rid of the oversync issues, and since implicit sync is
>> backed in everywhere right now, you'll have to deal with implicit sync for
>> a very long time.
>
>
> Depends what you mean by 'implicit sync'. ;)
>
> Getting userspace (Vulkan WSI, EGL, Wayland compositors, browsers, media clients) over to explicit sync is easy, _provided_ that the explicit sync gives us the same guarantees as implicit sync, i.e. completes in bounded time, GPU/display work can be flushed to the kernel predicated on fence completion with the kernel handling synchronisation and scheduling. It's just a matter of typing, and until now we haven't had a great reason to do that typing. Now we do have that reason, so we are implementing it. Whether it's dma_fence or drm_syncobj is mostly immaterial; we can encode in protocol requirements that you can't try to use wait-before-signal with drm_syncobj and you'll get killed if you try.
>
> Getting that userspace over to fully userspace-based sync (wait-before-signal or wait-never-signal, no kernel assistance but you just have to roll your own polling or signal handling on either CPU or GPU side) is not easy. It might never happen, because it's an extraordinary amount of work, introduces a huge amount of fragility into a super-critical path, and and so far it's not clear that it's a global performance improvement for the whole system, just shifting performance problems from kernel to userspace, and probably (AFAICT) making them worse in addition to the other problems it brings.
>
> What am I missing?

Nothing I think.

Which is why I'm arguing that kernel based sync with all the current
dma_fence guarantees is probably going to stick around for something
close to forever, and we need to assume so.

Only in specific cases does full userspace sync make sense imo:
- anything compute, excluding using compute/shaders to create
displayable buffers, but compute as in your final target is writing
some stuff to files and never interacting with any winsys. Those
really care because "run a compute kernel for a few hours" isn't
supported without userspace sync, and I don't think ever will.
- maybe vulkan direct display, once/if we have the extensions for
atomic kms wired up
- maybe someone wants to write a vulkan based compositor and deal with
all this themselves. That model I think would also imply that they
deal with all the timeouts and fallbacks, irrespective of whether
underneath we actually run on dma_fence timeline syncobjs or userspace
fence timeline syncobjs.

From about 2 years of screaming at this stuff it feels like this will
be a pretty exhaustive list for the next 10 years. Definitely doesn't
include your random linux desktop wayland compositor stack. But
there's definitely some are specific areas where people care enough
for all the pain. For everyone else it's all the other pieces I laid
out.

This also means that I don't think we now have that impedus to start
typing all the explicit sync protocol/compositor bits, since:
- the main driver is compute stuff, that needs mesa work (well vk/ocl
plus all the various repainted copies of cuda)
- with the tricks to make implicit sync work more like explicit sync
the oversyncing can be largely solved without protocol work
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
