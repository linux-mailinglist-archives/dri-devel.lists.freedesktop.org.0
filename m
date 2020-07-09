Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB3219A5B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 10:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E2F6E9E5;
	Thu,  9 Jul 2020 08:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7606E9C2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 08:01:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o8so839251wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=wPEKO17fBNbXJyPSCAVpwUnC3PkfwFuxmEDaZ9gwODo=;
 b=H9Mg8FF/C3LejA1hSHhUetOBUTIDTpSQIJoqn2yAMPVkKoZwkVVSnXxB0k22MA7EKV
 unF65oIKPw4Uiu5g/Anh5f7g+PDmRby9oCmbsOHB9YBDpPvS9FJ3ECNosCV6GygY4MLd
 ttqarB8Aua7ulT3McqvtlQbVICIpBzvT/zyFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=wPEKO17fBNbXJyPSCAVpwUnC3PkfwFuxmEDaZ9gwODo=;
 b=lrISV3iph+5jbRAhW3zGaIK4/j1Zv39d8YOgH0/ZVuqQBz+10UOKPZxlrwu9E8VKC+
 gN7xFbqwDNSBtDSO4DeIzr0aYQkwR3DclWcMqWv1QvktWw+S+JGZa2Fge4yRJkL81e6t
 Z/INJqx4YhOGvYz4VszgqKhbBoudbMqtuHRi0v4vKtvj1PBwn2m4oZA7oWfTK+yWV2ZG
 VI1DpFn45Ij/5qgp/apKG++Jr1b/JPxk+jPtWT8PhYu+GYkemz9OMXa9SqNhd2fP/hRv
 IdODvTCsFgeeRHVIg/qXLGv+uUqY/0m7znVwFb6RlNX1pd/0uks4rYKHcxXB974G4M7P
 VGig==
X-Gm-Message-State: AOAM532RylyLIRZGRwxTZW3w3QBPfwbc1yhztdqH3ybEuVHeYwbGrs7p
 GL2jvLx+XXCKFKg1SP+2swan4A==
X-Google-Smtp-Source: ABdhPJxaGar9wBX5KuatHiiRZfnlQdi0Nr0flZvS0LRfCmwQgqjIK2KzG5SZr4KXVx+roe0qP8KQrw==
X-Received: by 2002:a1c:9650:: with SMTP id y77mr12826424wmd.101.1594281696018; 
 Thu, 09 Jul 2020 01:01:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j16sm4220057wrt.7.2020.07.09.01.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 01:01:35 -0700 (PDT)
Date: Thu, 9 Jul 2020 10:01:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [Intel-gfx] [PATCH 03/18] dma-fence: basic lockdep annotations
Message-ID: <20200709080133.GN3278063@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <159186243606.1506.4437341616828968890@build.alporthouse.com>
 <CAPM=9ty6r1LuXAH_rf98GH0R9yN3x8xzKPjZG3QyvokpQBR-Hg@mail.gmail.com>
 <CAPj87rM0S2OPssf+WA+pjanT-0Om3yuUM1zUJCv4qTx5VYE=Fw@mail.gmail.com>
 <159255511144.7737.12635440776531222029@build.alporthouse.com>
 <CAKMK7uHEwj6jiZkRZ5PaCUNWcuU9oE4KYm4XHZwHnFzEuChZ7w@mail.gmail.com>
 <159255801588.7737.4425728073225310839@build.alporthouse.com>
 <20200619094309.GT20149@phenom.ffwll.local>
 <CAPj87rOMzBUBWv7kJRvbX3tor-v=3=ZuGeRu0Ws8BOJ=OxX3XA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rOMzBUBWv7kJRvbX3tor-v=3=ZuGeRu0Ws8BOJ=OxX3XA@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 08:29:21AM +0100, Daniel Stone wrote:
> Hi,
> Jumping in after a couple of weeks where I've paged most everything
> out of my brain ...
> 
> On Fri, 19 Jun 2020 at 10:43, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Fri, Jun 19, 2020 at 10:13:35AM +0100, Chris Wilson wrote:
> > > > The proposed patches might very well encode the wrong contract, that's
> > > > all up for discussion. But fundamentally questioning that we need one
> > > > is missing what upstream is all about.
> > >
> > > Then I have not clearly communicated, as my opinion is not that
> > > validation is worthless, but that the implementation is enshrining a
> > > global property on a low level primitive that prevents it from being
> > > used elsewhere. And I want to replace completion [chains] with fences, and
> > > bio with fences, and closures with fences, and what other equivalencies
> > > there are in the kernel. The fence is as central a locking construct as
> > > struct completion and deserves to be a foundational primitive provided
> > > by kernel/ used throughout all drivers for discrete problem domains.
> > >
> > > This is narrowing dma_fence whereby adding
> > >       struct lockdep_map *dma_fence::wait_map
> > > and annotating linkage, allows you to continue to specify that all
> > > dma_fence used for a particular purpose must follow common rules,
> > > without restricting the primitive for uses outside of this scope.
> >
> > Somewhere else in this thread I had discussions with Jason Gunthorpe about
> > this topic. It might maybe change somewhat depending upon exact rules, but
> > his take is very much "I don't want dma_fence in rdma". Or pretty close to
> > that at least.
> >
> > Similar discussions with habanalabs, they're using dma_fence internally
> > without any of the uapi. Discussion there has also now concluded that it's
> > best if they remove them, and simply switch over to a wait_queue or
> > completion like every other driver does.
> >
> > The next round of the patches already have a paragraph to at least
> > somewhat limit how non-gpu drivers use dma_fence. And I guess actual
> > consensus might be pointing even more strongly at dma_fence being solely
> > something for gpus and closely related subsystem (maybe media) for syncing
> > dma-buf access.
> >
> > So dma_fence as general replacement for completion chains I think just
> > wont happen.
> >
> > What might make sense is if e.g. the lockdep annotations could be reused,
> > at least in design, for wait_queue or completion or anything else
> > really. I do think that has a fair chance compared to the automagic
> > cross-release annotations approach, which relied way too heavily on
> > guessing where barriers are. My experience from just a bit of playing
> > around with these patches here and discussing them with other driver
> > maintainers is that accurately deciding where critical sections start and
> > end is a job for humans only. And if you get it wrong, you will have a
> > false positive.
> >
> > And you're indeed correct that if we'd do annotations for completions and
> > wait queues, then that would need to have a class per semantically
> > equivalent user, like we have lockdep classes for mutexes, not just one
> > overall.
> >
> > But dma_fence otoh is something very specific, which comes with very
> > specific rules attached - it's not a generic wait_queue at all. Originally
> > it did start out as one even, but it is a very specialized wait_queue.
> >
> > So there's imo two cases:
> >
> > - Your completion is entirely orthogonal of dma_fences, and can never ever
> >   block a dma_fence. Don't use dma_fence for this, and no problem. It's
> >   just another wait_queue somewhere.
> >
> > - Your completion can eventually, maybe through lots of convolutions and
> >   depdencies, block a dma_fence. In that case full dma_fence rules apply,
> >   and the only thing you can do with a custom annotation is make the rules
> >   even stricter. E.g. if a sub-timeline in the scheduler isn't allowed to
> >   take certain scheduler locks. But the userspace visible/published fence
> >   do take them, maybe as part of command submission or retirement.
> >   Entirely hypotethical, no idea any driver actually needs this.
> 
> I don't claim to understand the implementation of i915's scheduler and
> GEM handling, and it seems like there's some public context missing
> here. But to me, the above is a good statement of what I (and a lot of
> other userspace) have been relying on - that dma-fence is a very
> tightly scoped thing which is very predictable but in extremis.
> 
> It would be great to have something like this enshrined in dma-fence
> documentation, visible to both kernel and external users. The
> properties we've so far been assuming for the graphics pipeline -
> covering production & execution of vertex/fragment workloads on the
> GPU, framebuffer display, and to the extent this is necessary
> involving compute - are something like this:
> 
> A single dma-fence with no dependencies represents (the tail of) a
> unit of work, which has been all but committed to the hardware. Once
> committed to the hardware, this work will complete (successfully or in
> error) in bounded time. The unit of work referred to by a dma-fence
> may carry dependencies on other dma-fences, which must of course be
> subject to the same restrictions as above. No action from any
> userspace component is required to ensure that the completion occurs.
> 
> The cases I know of which legitimately blow holes in this are:
>   - the work is scheduled but GPU execution resource contention
> prevents it from completion, e.g. something on a higher-priority
> context repeatedly gets scheduled in front of it - this is OK because
> by definition it's what should happen
>   - the work is scheduled but CPU execution resource contention
> prevents it from completion, e.g. the DRM scheduler does not get to
> trigger the hardware to execute the work - this is OK because at this
> point we have a big system-wide problem
>   - the work is scheduled but non-execution resource contention
> prevents it from making progress, e.g. VRAM contention and/or a paging
> storm - this is OK because again we have a larger problem here and we
> can't reasonably expect the driver to solve this
>   - the work is executed but execution does not complete due to the
> nature of the work, e.g. a chain of work contains a hostile compute
> shader which does not complete in any reasonable time - this is OK
> because we require TDR; even without a smart compositor detecting
> based on fence waits that the work is unsuitable and should not hold
> up other work, the driver will probably ban the context and lock it
> out anyway
> 
> The first three are general system resource-overload cases, no
> different from the CPU-side equivalent where it's up to the admin to
> impose ulimits to prevent forkbombs or runaway memory usage, or up to
> the user to run fewer Electron apps. The last one is more difficult,
> because we can't solve the halting problem to know ahead of time that
> the user has submitted an infinite workload, so we have to live with
> that as a real hazard and mitigate it where we can (by returning -EIO
> and killing the app from inside Mesa).
> 
> If repurposing dma-fence for non-graphics uses (like general-purpose
> compute or driver-internal tracking for things other than GPU
> workloads) makes it more difficult to guarantee the above properties,
> then I don't want to do it. Maybe the answer is that dma-fence gets
> split into its core infrastructure which can be used for completion
> chains, with actual dma-fence being layered above generic completion
> APIs: other-completion-API can consume fences, but fences _cannot_
> consume non-fence things.
> 
> This does force a split between graphics (GL/Vulkan/display) workloads
> and compute (CL/oneAPI/HSA/CUDA), which I get is really difficult to
> resolve in the driver. But the two are hard split anyway: graphics
> requires upfront and explicit buffer management, in return dangling
> the carrot that you can pipeline your workloads and expect completion
> in reasonable time. General-purpose compute lets you go far more YOLO
> on resource access, including full userptr SVM, but the flipside is
> that your execution time might be measured in weeks; as a result you
> don't get to do execution pipelining because even if you could, it's
> not a big enough win relative to your execution time to be worth the
> extra driver and system complexity. I don't think there's a reasonable
> lowest common denominator between the two that we can try to reuse a
> generic model for both, because you make too many compromises to try
> to fit conflicting interests.
> 
> In the pre-syncobj days, we did look at what we called 'empty fences'
> or 'future fences' with the ChromeOS team: a synchronisation object
> which wasn't backed by a promise of completion as dma-fence is, but
> instead by the meta-promise (from userspace) of a promise of
> completion. Ultimately it never became a real thing for the same
> reason that swsync isn't either; it needed so much special-case
> handling and so many disclaimers and opt-ins everywhere that by the
> end, we weren't sure why we were trying to shoehorn it into dma-fence
> apart from dma-fence already existing - but by removing all its
> guarantees, we also removed all its usefulness as a primitive.

New series has a patch which tries to at least somewhat summarize this
entire problem, and why it just doesn't work. Doesn't contain yet the full
proposed solution, but maybe that's best for a follow-up patch. Anyway
probably best if we poke holes at that text there.

Between the preepmt ctx fence in amdgpu and userspace fences or gpu futex
or whatever you want to call it, I do think we can make the compute side
happy. The sad puppy face comes a bit from vulkan, since vulkan would
really like the same execution model, but because it needs to integrate
with the overall dma-fence based compositor stack, it can't.

I think even that is solveable, if we have vulkan-based compositors and a
completely new set of protocols and uapi from client all the way down to
display. That makes it about as bad as a flag day as atomic+modifiers.

Also the only reason why the kms driver can then suddenly import a
userspace fence, while nothing else in the kernel can allow such
dependencies is fairly simple: Framebuffers are pinned, which breaks the
dependency loops in the memory manager, and so avoids all the troubles in
a slightly different form.

And of course we'd need a timeout in case userspace just screwed up
somehow.
-Daniel

> 
> Cheers,
> Daniel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
