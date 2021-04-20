Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602C936602B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CACA6E8BB;
	Tue, 20 Apr 2021 19:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECD76E8BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:27:21 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 i25-20020a4aa1190000b02901bbd9429832so8711070ool.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NPjtyv0dRldvoisxdDLqvGffr95Pp9uiiOTQ5tY04xY=;
 b=KC45neJhZWLKE8SjAZYU88hfbuMt8tu+IN+5i/cUXhyh8guAmfQkf9tfnf1ASzHuOi
 fN/ARnOoUuXHSYTVaRz9AjvGDF2n5Li/OaPzUbdOHZtE1R4krZLlAYIjRMYR6/4Ge0qK
 9Jx0ZI/b78lAkwph1/d081s0adyCn/q8SL2+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NPjtyv0dRldvoisxdDLqvGffr95Pp9uiiOTQ5tY04xY=;
 b=c/WFZmzXgPE2BWgmiJI9trJtnRfE3XxpDr7bemohSP+1r41Gw92YWSh1FWc0wH7hmU
 SkXWsSCpaME7xkaCAUvao7/K3q5x1r9r13yRtdGKZjg+gs53Rtua0XUIaREAYUjMqjVA
 vksvbZWn2eI2EGeG1MDHeqoBTSiVGV2Qn3pihsLLkNraG1c9VTM+Mxy3lK8+JrbiMxsA
 D6yH3d6mAzoSquAGdML3j9Ou0+yO6egCNkSSE8PVJ7CiIi5Nndeacs9Jv51WOYEnNU9m
 bkHUgeCxp7B12SYNUFw0iC22IibuzAmaVRXhNWOhyMwYESOFMhnjAnMhOmQJ4efKhV3l
 Vc3A==
X-Gm-Message-State: AOAM530GfqrmuIfxNDd7VLOrYN5lvJCJZn2oFtUZLjVC6p/cUTRMONrD
 7CK1rpijAkQM8V4kDCr5eNWDjRi/6SN2H7SWLIsBFw==
X-Google-Smtp-Source: ABdhPJw7kRYUx2rBxM2PZUnvL/MvNe+cJ/5x8iBDvPRY70fdKT0EGPZiQA8ECSCYkRupEYeoFW5KY/R0cUHH+MlmVR0=
X-Received: by 2002:a4a:e873:: with SMTP id m19mr18283656oom.85.1618946840907; 
 Tue, 20 Apr 2021 12:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAOFGe95BDOk2qfU8G_Ye6FOL8-8jH5z5QZG1Yh1+BvPBoYAwfw@mail.gmail.com>
In-Reply-To: <CAOFGe95BDOk2qfU8G_Ye6FOL8-8jH5z5QZG1Yh1+BvPBoYAwfw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Apr 2021 21:27:09 +0200
Message-ID: <CAKMK7uEGc2cCPcXWQdRNHA-+rdc4vxt1mAjktM4eSqo2AJcQ7A@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Jason Ekstrand <jason@jlekstrand.net>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 9:17 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Tue, Apr 20, 2021 at 1:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Apr 20, 2021 at 7:45 PM Daniel Stone <daniel@fooishbar.org> wrote:
> >
> > > And something more concrete:
> > >
> > > dma_fence.
> > >
> > > This already has all of the properties described above. Kernel-wise, it already devolves to CPU-side signaling when it crosses device boundaries. We need to support it roughly forever since it's been plumbed so far and so wide. Any primitive which is acceptable for winsys-like usage which crosses so many device/subsystem/process/security boundaries has to meet the same requirements. So why reinvent something which looks so similar, and has the same requirements of the kernel babysitting completion, providing little to no benefit for that difference?
> >
> > So I can mostly get behind this, except it's _not_ going to be
> > dma_fence. That thing has horrendous internal ordering constraints
> > within the kernel, and the one thing that doesn't allow you is to make
> > a dma_fence depend upon a userspace fence.
>
> Let me elaborate on this a bit.  One of the problems I mentioned
> earlier is the conflation of fence types inside the kernel.  dma_fence
> is used for solving two different semi-related but different problems:
> client command synchronization and memory residency synchronization.
> In the old implicit GL world, we conflated these two and thought we
> were providing ourselves a service.  Not so much....
>
> It's all well and good to say that we should turn the memory fence
> into a dma_fence and throw a timeout on it.  However, these
> window-system sync primitives, as you said, have to be able to be
> shared across everything.  In particular, we have to be able to share
> them with drivers that don't make a good separation between command
> and memory synchronization.
>
> Let's say we're rendering on ANV with memory fences and presenting on
> some USB display adapter whose kernel driver is a bit old-school.
> When we pass that fence to the other driver via a sync_file or
> similar, that driver may shove that dma_fence into the dma_resv on
> some buffer somewhere.  Then our client, completely unaware of
> internal kernel dependencies, binds that buffer into its address space
> and kicks off another command buffer.  So i915 throws in a dependency
> on that dma_resv which contains the previously created dma_fence and
> refuses to execute any more command buffers until it signals.
> Unfortunately, unbeknownst to i915, that command buffer which the
> client kicked off after doing that bind was required for signaling the
> memory fence on which our first dma_fence depends.  Deadlock.

Nope. Because the waiting for this future fence will only happen in two places:
- driver submit thread, which is just userspace without holding
anything. From the kernel pov this can be preempted, memory
temporarily taken away, all these things. Until that's done you will
_not_ get a real dma_fence, but just another future fence.
- but what about the usb display you're asking? well for that we'll
need a new atomic extension, which takes a timeline syncobj and gives
you back a timeline syncobj. And the rules are that if one of the is a
future fence/userspace fence, so will the other (even if it's created
by the kernel)

Either way you get a timeline syncobj back which anv can then again
handle properly with it's submit thread. Not a dma_fence with a funny
timeout because there's deadlock issues with those.

So no you wont be able to get a dma_fence out of your slight of hands here.

> Sure, we put a timeout on the dma_fence and it will eventually fire
> and unblock everything.  However, there's one very important point
> that's easy to miss here:  Neither i915 nor the client did anything
> wrong in the above scenario.  The Vulkan footgun approach works
> because there are a set of rules and, if you follow those rules,
> you're guaranteed everything works.  In the above scenario, however,
> the client followed all of the rules and got a deadlock anyway.  We
> can't have that.
>
>
> > But what we can do is use the same currently existing container
> > objects like drm_syncobj or sync_file (timeline syncobj would fit best
> > tbh), and stuff a userspace fence behind it. The only trouble is that
> > currently timeline syncobj implement vulkan's spec, which means if you
> > build a wait-before-signal deadlock, you'll wait forever. Well until
> > the user ragequits and kills your process.
>
> Yeah, it may be that this approach can be made to work.  Instead of
> reusing dma_fence, maybe we can reuse syncobj and have another form of
> syncobj which is a memory fence, a value to wait on, and a timeout.

It's going to be the same container. But very much not a dma_fence.

Note the other approach is if you split the kernel's notion of what a
dma_fence is into two parts: memory fence and synchronization
primitive. The trouble is that there's tons of hw for which these are
by necessity the same things (because they can't preempt or dont have
a scheduler), so the value of this for the overall ecosystem is slim.
And the work to make it happen (plump future fences through the
drm/scheduler and everything) is giantic. drm/i915-gem tried, the
result is not pretty and we're now backing it largely all out least
because it's not where hw/vulkan/compute are actually going I think.

So that's an approach which I think does exist in theory, but really
not something I think we should attempt.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
