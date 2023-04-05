Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3C56D7D66
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1878310E94C;
	Wed,  5 Apr 2023 13:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16C110E94C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:09:13 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-947a47eb908so54254366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680700151;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hh/EUUesv9YdYBxmhpizIihG/m7Kq38TZVKWN8dz1rQ=;
 b=fFDVOtEuLHbxxlyCHnXOOwLZ2UuvdWRNt9ZrU9bUH6ac/Ike0353dUeAYTfy8yjIdS
 CiOqSAHOKNwvS5yR4jt2/+D5bD+83ADJtpRT16aiwbnBX63xjpziMuw0Dd+siiGlr7Gw
 QJ4f9qgWxdWGKCqBHDEOjW54rR2eo9Q5TXelQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680700151;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hh/EUUesv9YdYBxmhpizIihG/m7Kq38TZVKWN8dz1rQ=;
 b=06TjZPKrDoIRiJ3+vpfHKeoHr/4LXBuw9H14+CN6LCVMkPNCRDrGfzJ3aoNs/oUYC+
 RzqRw3jyZ4ETn4oLjricvV43GbbvihPVBeDaFPDoteImYCWJWaUXgiQU3CLEoIN3KRvA
 ICn4Wiwkt+RqWwYhW6Y+htDZ7lb5MN+fy5KhUIQpmiMq6rSItX+dntZSwdq+HXs6Xg9i
 rWSSgoRhctsTMY3Rbws9wghiHIWHE6Aq9wGNgoW/2mDumvUmoGmFK+cbv8bcekZM63Tt
 WZ3a1Kz5+CaxGRljTBwEirFNX0FrzRV/3JV2w8xqNBOiaAVAnNjryXMjTby3PISidjh8
 VKbA==
X-Gm-Message-State: AAQBX9dN1g2NOj3SRCfCPPfELwGZlYq5xbmsv3kIJxNfkrjoUFKfKUg8
 f1iXCBWW3aAh6M49ZMocat0UOw==
X-Google-Smtp-Source: AKy350ZxBuu5avX6O2MZ+6SlIDtfJ9tcHXNSN4YQGge4GsqLesezbQlGxjTteyBy3EP2YFZqxg/Tgw==
X-Received: by 2002:a17:906:5195:b0:92c:fc0:b229 with SMTP id
 y21-20020a170906519500b0092c0fc0b229mr2599351ejk.0.1680700151445; 
 Wed, 05 Apr 2023 06:09:11 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 cw1-20020a170906c78100b0093de5b42856sm7322803ejb.119.2023.04.05.06.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:09:10 -0700 (PDT)
Date: Wed, 5 Apr 2023 15:09:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZC1y9ON07yTYNTz6@phenom.ffwll.local>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
 <ZCx/C4cOwPcPQZ0R@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCx/C4cOwPcPQZ0R@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: robdclark@chromium.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 07:48:27PM +0000, Matthew Brost wrote:
> On Tue, Apr 04, 2023 at 09:25:52PM +0200, Daniel Vetter wrote:
> > On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
> > > On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström (Intel) wrote:
> > > > 
> > > > On 4/4/23 15:10, Christian König wrote:
> > > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > > Hi, Christian,
> > > > > > 
> > > > > > On 4/4/23 11:09, Christian König wrote:
> > > > > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > > > 
> > > > > > > > For long-running workloads, drivers either need to open-code
> > > > > > > > completion
> > > > > > > > waits, invent their own synchronization primitives or internally use
> > > > > > > > dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > > > > > without any lockdep annotation all these approaches are error prone.
> > > > > > > > 
> > > > > > > > So since for example the drm scheduler uses dma-fences it is
> > > > > > > > desirable for
> > > > > > > > a driver to be able to use it for throttling and error
> > > > > > > > handling also with
> > > > > > > > internal dma-fences tha do not obey the cros-driver
> > > > > > > > dma-fence protocol.
> > > > > > > > 
> > > > > > > > Introduce long-running completion fences in form of
> > > > > > > > dma-fences, and add
> > > > > > > > lockdep annotation for them. In particular:
> > > > > > > > 
> > > > > > > > * Do not allow waiting under any memory management locks.
> > > > > > > > * Do not allow to attach them to a dma-resv object.
> > > > > > > > * Introduce a new interface for adding callbacks making the
> > > > > > > > helper adding
> > > > > > > >    a callback sign off on that it is aware that the dma-fence may not
> > > > > > > >    complete anytime soon. Typically this will be the
> > > > > > > > scheduler chaining
> > > > > > > >    a new long-running fence on another one.
> > > > > > > 
> > > > > > > Well that's pretty much what I tried before:
> > > > > > > https://lwn.net/Articles/893704/
> > > > > > > 
> > > 
> > > I don't think this quite the same, this explictly enforces that we don't
> > > break the dma-fence rules (in path of memory allocations, exported in
> > > any way), essentially this just SW sync point reusing dma-fence the
> > > infrastructure for signaling / callbacks. I believe your series tried to
> > > export these fences to user space (admittedly I haven't fully read your
> > > series).
> > > 
> > > In this use case we essentially just want to flow control the ring via
> > > the dma-scheduler + maintain a list of pending jobs so the TDR can be
> > > used for cleanup if LR entity encounters an error. To me this seems
> > > perfectly reasonable but I know dma-femce rules are akin to a holy war.
> > > 
> > > If we return NULL in run_job, now we have to be able to sink all jobs
> > > in the backend regardless on ring space, maintain a list of jobs pending
> > > for cleanup after errors, and write a different cleanup path as now the
> > > TDR doesn't work. Seems very, very silly to duplicate all of this code
> > > when the DRM scheduler provides all of this for us. Also if we go this
> > > route, now all drivers are going to invent ways to handle LR jobs /w the
> > > DRM scheduler.
> > > 
> > > This solution is pretty clear, mark the scheduler as LR, and don't
> > > export any fences from the scheduler. If you try to export these fences
> > > a blow up happens.
> > 
> > The problem is if you mix things up. Like for resets you need all the
> > schedulers on an engine/set-of-engines to quiescent or things get
> > potentially hilarious. If you now have a scheduler in forever limbo, the
> > dma_fence guarantees are right out the window.
> > 
> 
> Right, a GT reset on Xe is:
> 
> Stop all schedulers
> Do a reset
> Ban any schedulers which we think caused the GT reset
> Resubmit all schedulers which we think were good
> Restart all schedulers
> 
> None of this flow depends on LR dma-fences, all of this uses the DRM
> sched infrastructure and work very well compared to the i915. Rewriting
> all this with a driver specific implementation is what we are trying to
> avoid.
> 
> Similarly if LR entity hangs on its own (not a GT reset, rather the
> firmware does the reset for us) we use all the DRM scheduler
> infrastructure to handle this. Again this works rather well...

Yeah this is why I don't think duplicating everything that long-running
jobs need makes any sense. iow I agree with you.

> > But the issue you're having is fairly specific if it's just about
> > ringspace. I think the dumbest fix is to just block in submit if you run
> > out of per-ctx ringspace, and call it a day. This notion that somehow the
> 
> How does that not break the dma-fence rules? A job can publish its
> finished fence after ARM, if the finished fence fence waits on ring
> space that may not free up in a reasonable amount of time we now have
> broken the dma-dence rules. My understanding is any dma-fence must only
> on other dma-fence, Christian seems to agree and NAK'd just blocking if
> no space available [1]. IMO this series ensures we don't break dma-fence
> rules by restricting how the finished fence can be used.

Oh I meant in the submit ioctl, _before_ you even call
drm_sched_job_arm(). It's ok to block in there indefinitely.

> > kernel is supposed to provide a bottomless queue of anything userspace
> > submits simply doesn't hold up in reality (as much as userspace standards
> > committees would like it to), and as long as it doesn't have a real-world
> > perf impact it doesn't really matter why we end up blocking in the submit
> > ioctl. It might also be a simple memory allocation that hits a snag in
> > page reclaim.
> > 
> > > > > > > And the reasons why it was rejected haven't changed.
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > 
> > > > > > Yes, TBH this was mostly to get discussion going how we'd best
> > > > > > tackle this problem while being able to reuse the scheduler for
> > > > > > long-running workloads.
> > > > > > 
> > > > > > I couldn't see any clear decision on your series, though, but one
> > > > > > main difference I see is that this is intended for driver-internal
> > > > > > use only. (I'm counting using the drm_scheduler as a helper for
> > > > > > driver-private use). This is by no means a way to try tackle the
> > > > > > indefinite fence problem.
> > > > > 
> > > > > Well this was just my latest try to tackle this, but essentially the
> > > > > problems are the same as with your approach: When we express such
> > > > > operations as dma_fence there is always the change that we leak that
> > > > > somewhere.
> > > > > 
> > > > > My approach of adding a flag noting that this operation is dangerous and
> > > > > can't be synced with something memory management depends on tried to
> > > > > contain this as much as possible, but Daniel still pretty clearly
> > > > > rejected it (for good reasons I think).
> > > > > 
> > > > > > 
> > > > > > We could ofc invent a completely different data-type that abstracts
> > > > > > the synchronization the scheduler needs in the long-running case, or
> > > > > > each driver could hack something up, like sleeping in the
> > > > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > > > should still be annotated in one way or annotated one way or another
> > > > > > (and probably in a similar way across drivers) to make sure we don't
> > > > > > do anything bad.
> > > > > > 
> > > > > >  So any suggestions as to what would be the better solution here
> > > > > > would be appreciated.
> > > > > 
> > > > > Mhm, do we really the the GPU scheduler for that?
> > > > > 
> > > 
> > > I think we need to solve this within the DRM scheduler one way or
> > > another.
> > 
> > Yeah so if we conclude that the queue really must be bottomless then I
> > agree drm-sched should help out sort out the mess. Because I'm guessing
> > that every driver will have this issue. But that's a big if.
> > 
> > I guess if we teach the drm scheduler that some jobs are fairly endless
> > then maybe it wouldn't be too far-fetched to also teach it to wait for a
> > previous one to finish (but not with the dma_fence that preempts, which we
> > put into the dma_resv for memory management, but some other struct
> > completion). The scheduler already has a concept of not stuffing too much
> > stuff into the same queue after all, so this should fit?
> 
> See above, exact same situation as spinning on flow controling the ring,
> this IMO absolutely breaks the dma-fence rules. IMO the correct solution
> is to have a DRM that doesn't export dma-fences, this is exactly what
> this series does as if we try to, boom lockdep / warn on blow up.

I dont think it's impossible to do this correctly, but definitely very,
very hard. Which is why neither Christian nor me like the idea :-)

Essentially you'd have to make sure that any indefinite way will still
react to drm_sched_job, so that you're not holding up a gt reset or
anything like that, but only ever hold up forward progress for this
specific scheduler/drm_sched_entity. Which you can do as long (and again,
another hugely tricky detail) you still obey the preempt-ctx dma_fence and
manage to preempt the underlying long-running ctx even when the drm/sched
is stuck waiting for an indefinite fence (like waiting for ringspace or
something like that).

So I don't think it's impossible, but very far away from "a good idea" :-)

Hence to proposal to bail out of this entire mess by throwing EWOULDBLCK
back to userspace directly from the ioctl function, where you still can do
that without breaking any dma_fence rules. Or if it's not a case that
matters in practice, simply block in the ioctl handler instead of
returning EWOULDBLCK.
-Daniel

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/525461/?series=114772&rev=2
> 
> > -Daniel
> > 
> > 
> > > > > I mean in the 1 to 1 case  you basically just need a component which
> > > > > collects the dependencies as dma_fence and if all of them are fulfilled
> > > > > schedules a work item.
> > > > > 
> > > > > As long as the work item itself doesn't produce a dma_fence it can then
> > > > > still just wait for other none dma_fence dependencies.
> > > > > 
> > > > > Then the work function could submit the work and wait for the result.
> > > > > 
> > > > > The work item would then pretty much represent what you want, you can
> > > > > wait for it to finish and pass it along as long running dependency.
> > > > > 
> > > > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > > > basically it.
> > > > > 
> > > > This very much sounds like a i915_sw_fence for the dependency tracking and
> > > > dma_fence_work for the actual work although it's completion fence is a
> > > > dma_fence.
> > > >
> > > 
> > > Agree this does sound to i915ish as stated below one of mandates in Xe
> > > was to use the DRM scheduler. Beyond that as someone who a submission
> > > backend in the i915 and Xe, I love how the DRM scheduler works (single
> > > entry point), it makes everything so much easier.
> > > 
> > > Matt
> > > 
> > > > Although that goes against the whole idea of a condition for merging the xe
> > > > driver would be that we implement some sort of minimal scaffolding for
> > > > long-running workloads in the drm scheduler, and the thinking behind that is
> > > > to avoid implementing intel-specific solutions like those...
> > > > 
> > > > Thanks,
> > > > 
> > > > Thomas
> > > > 
> > > > 
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > 
> > > > > > Thomas
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
