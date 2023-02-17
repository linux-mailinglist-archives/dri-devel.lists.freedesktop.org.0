Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342369AE7D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 15:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19210F018;
	Fri, 17 Feb 2023 14:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31CF10F016;
 Fri, 17 Feb 2023 14:55:11 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1718a49f834so1056591fac.8; 
 Fri, 17 Feb 2023 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gNw+yfL+IyYUcv+PFO4T1PKkSM22hsxN4ZBBg/aGDAo=;
 b=jCgcHYPrmPRM1YFuWVoicSjZUcyq1JcGEK+twOGeW3VTB34978mPpP1ROIKHAfuOTF
 A5FSd3X5o2QLV0unOaQ6Nd6TFjNPGdfXsucIKQSRKEVV0gBMP2amlVXA22fpTga3lg33
 SwHEm/RaAxhpJl39hKeug83+mzQi9qLFFLR3pR4lqKpt3e32H/ArsaODqoRoZr+Jc0+c
 KDi0P/f0j8D1d+hWBqXjZUmriMUhJ9c+f13TBBrHSrQdlEeVEaloPGhX/VtJ+dYYwCjb
 XzNHguh6NkpSDWGEBmkmPhkSIWMzF+/FhRuyny/jyfWy7JKu6RSZHvCLwRzObCsg+FZn
 JL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gNw+yfL+IyYUcv+PFO4T1PKkSM22hsxN4ZBBg/aGDAo=;
 b=rFRww06AIol8sPc5Q9qzC4nTpfLjvsJ938ywPzVjoLfBI7gJZ5RJ68fe/IRhPzkT8m
 Y9oQgnlSFxG8wICa15nY8H8JpO7suZ808fjv0RGKMS2SGFDTEmUM+7nd8tHBjuLL/qrW
 C05jSO4BATJIC6u4/eqFu3FzTFcTfL+rV914b3S6GNi9nTePKfyHooJQDQ9BEi2vUEAJ
 cJjK8Nnu1XgOb8ZdiXG5aDOC3N95ufWgNcZzFdZrPHXTu4rn8oE1S5FkgxZDiXAG2a8k
 lz5Fq+MFWw+OeHJQB4q3CX6bLRmKXxx1m45ofgPLrM9oHKKtWv7XohYqQYuS74qmwfch
 zq7Q==
X-Gm-Message-State: AO0yUKWqb+ncUYPW9VT9YI5VuW9jfMVDx6YVt4ynmx2bMR6/RXEJDTKa
 hybQoARzvkwbKTi/4LbWJYrzxGYhHpNyoFbrmUU=
X-Google-Smtp-Source: AK7set/dRZKFJ8avNgbCM1YUaXf2YRkPBGGSIwg3LHZBn+MMwdZWP+Wm8VsGOQOzOgONjkGuu+vRxkbE7xC9WIyXDG4=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr498416oac.58.1676645710753; Fri, 17 Feb
 2023 06:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
In-Reply-To: <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 17 Feb 2023 06:55:30 -0800
Message-ID: <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 4:56 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 16/02/2023 18:19, Rodrigo Vivi wrote:
> > On Tue, Feb 14, 2023 at 11:14:00AM -0800, Rob Clark wrote:
> >> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> >> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>
> >>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>
> >>> In i915 we have this concept of "wait boosting" where we give a priority boost
> >>> for instance to fences which are actively waited upon from userspace. This has
> >>> it's pros and cons and can certainly be discussed at lenght. However fact is
> >>> some workloads really like it.
> >>>
> >>> Problem is that with the arrival of drm syncobj and a new userspace waiting
> >>> entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
> >>> this mini series really (really) quickly to see if some discussion can be had.
> >>>
> >>> It adds a concept of "wait count" to dma fence, which is incremented for every
> >>> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> >>> dma_fence_add_callback but from explicit/userspace wait paths).
> >>
> >> I was thinking about a similar thing, but in the context of dma_fence
> >> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> >> between "housekeeping" poll()ers that don't want to trigger boost but
> >> simply know when to do cleanup, and waiters who are waiting with some
> >> urgency.  I think we could use EPOLLPRI for this purpose.
> >>
> >> Not sure how that translates to waits via the syncobj.  But I think we
> >> want to let userspace give some hint about urgent vs housekeeping
> >> waits.
> >
> > Should the hint be on the waits, or should the hints be on the executed
> > context?
> >
> > In the end we need some way to quickly ramp-up the frequency to avoid
> > the execution bubbles.
> >
> > waitboost is trying to guess that, but in some cases it guess wrong
> > and waste power.
>
> Do we have a list of workloads which shows who benefits and who loses
> from the current implementation of waitboost?
> > btw, this is something that other drivers might need:
> >
> > https://gitlab.freedesktop.org/drm/amd/-/issues/1500#note_825883
> > Cc: Alex Deucher <alexander.deucher@amd.com>
>
> I have several issues with the context hint if it would directly
> influence frequency selection in the "more power" direction.
>
> First of all, assume a context hint would replace the waitboost. Which
> applications would need to set it to restore the lost performance and
> how would they set it?
>
> Then I don't even think userspace necessarily knows. Think of a layer
> like OpenCL. It doesn't really know in advance the profile of
> submissions vs waits. It depends on the CPU vs GPU speed, so hardware
> generation, and the actual size of the workload which can be influenced
> by the application (or user) and not the library.
>
> The approach also lends itself well for the "arms race" where every
> application can say "Me me me, I am the most important workload there is!".

since there is discussion happening in two places:

https://gitlab.freedesktop.org/drm/intel/-/issues/8014#note_1777433

What I think you might want is a ctx boost_mask which lets an app or
driver disable certain boost signals/classes.  Where fence waits is
one class of boost, but hypothetical other signals like touchscreen
(or other) input events could be another class of boost.  A compute
workload might be interested in fence wait boosts but could care less
about input events.

> The last concern is for me shared with the proposal to expose deadlines
> or high priority waits as explicit uapi knobs. Both come under the "what
> application told us it will do" category vs what it actually does. So I
> think it is slightly weaker than basing decisions of waits.
>
> The current waitboost is a bit detached from that problem because when
> we waitboost for flips we _know_ it is an actual framebuffer in the flip
> chain. When we waitboost for waits we also know someone is waiting. We
> are not trusting userspace telling us this will be a buffer in the flip
> chain or that this is a context which will have a certain duty-cycle.
>
> But yes, even if the input is truthful, latter is still only a
> heuristics because nothing says all waits are important. AFAIU it just
> happened to work well in the past.
>
> I do understand I am effectively arguing for more heuristics, which may
> sound a bit against the common wisdom. This is because in general I
> think the logic to do the right thing, be it in the driver or in the
> firmware, can work best if it has a holistic view. Simply put it needs
> to have more inputs to the decisions it is making.
>
> That is what my series is proposing - adding a common signal of "someone
> in userspace is waiting". What happens with that signal needs not be
> defined (promised) in the uapi contract.
>
> Say you route it to SLPC logic. It doesn't need to do with it what
> legacy i915 is doing today. It just needs to do something which works
> best for majority of workloads. It can even ignore it if that works for it.
>
> Finally, back to the immediate problem is when people replace the OpenCL
> NEO driver with clvk that performance tanks. Because former does waits
> using i915 specific ioctls and so triggers waitboost, latter waits on
> syncobj so no waitboost and performance is bad. What short term solution
> can we come up with? Or we say to not use clvk? I also wonder if other
> Vulkan based stuff is perhaps missing those easy performance gains..
>
> Perhaps strictly speaking Rob's and mine proposal are not mutually
> exclusive. Yes I could piggy back on his with an "immediate deadline for
> waits" idea, but they could also be separate concepts if we concluded
> "someone is waiting" signal is useful to have. Or it takes to long to
> upstream the full deadline idea.

Let me re-spin my series and add the syncobj wait flag and i915 bits
adapted from your patches..  I think the basic idea of deadlines
(which includes "I want it NOW" ;-)) isn't controversial, but the
original idea got caught up in some bikeshed (what about compositors
that wait on fences in userspace to decide which surfaces to update in
the next frame), plus me getting busy and generally not having a good
plan for how to leverage this from VM guests (which is becoming
increasingly important for CrOS).  I think I can build on some ongoing
virtgpu fencing improvement work to solve the latter.  But now that we
have a 2nd use-case for this, it makes sense to respin.

BR,
-R

> Regards,
>
> Tvrtko
>
> >>
> >> Also, on a related topic: https://lwn.net/Articles/868468/
> >>
> >> BR,
> >> -R
> >>
> >>> Individual drivers can then inspect this via dma_fence_wait_count() and decide
> >>> to wait boost the waits on such fences.
> >>>
> >>> Again, quickly put together and smoke tested only - no guarantees whatsoever and
> >>> I will rely on interested parties to test and report if it even works or how
> >>> well.
> >>>
> >>> v2:
> >>>   * Small fixups based on CI feedback:
> >>>      * Handle decrement correctly for already signalled case while adding callback.
> >>>      * Remove i915 assert which was making sure struct i915_request does not grow.
> >>>   * Split out the i915 patch into three separate functional changes.
> >>>
> >>> Tvrtko Ursulin (5):
> >>>    dma-fence: Track explicit waiters
> >>>    drm/syncobj: Mark syncobj waits as external waiters
> >>>    drm/i915: Waitboost external waits
> >>>    drm/i915: Mark waits as explicit
> >>>    drm/i915: Wait boost requests waited upon by others
> >>>
> >>>   drivers/dma-buf/dma-fence.c               | 102 ++++++++++++++++------
> >>>   drivers/gpu/drm/drm_syncobj.c             |   6 +-
> >>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c |   1 -
> >>>   drivers/gpu/drm/i915/i915_request.c       |  13 ++-
> >>>   include/linux/dma-fence.h                 |  14 +++
> >>>   5 files changed, 101 insertions(+), 35 deletions(-)
> >>>
> >>> --
> >>> 2.34.1
> >>>
