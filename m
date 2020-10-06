Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F1285963
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29956E8A0;
	Wed,  7 Oct 2020 07:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4694C899BE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 10:59:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74ECC1435;
 Tue,  6 Oct 2020 03:59:25 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21C013F66B;
 Tue,  6 Oct 2020 03:59:24 -0700 (PDT)
Date: Tue, 6 Oct 2020 11:59:21 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/20 16:24, Rob Clark wrote:

[...]

> > RT planning and partitioning is not easy task for sure. You might want to
> > consider using affinities too to get stronger guarantees for some tasks and
> > prevent cross-talking.
> 
> There is some cgroup stuff that is pinning SF and some other stuff to
> the small cores, fwiw.. I think the reasoning is that they shouldn't
> be doing anything heavy enough to need the big cores.

Ah, so you're on big.LITTLE type of system. I have done some work which enables
biasing RT tasks towards big cores and control the default boost value if you
have util_clamp and schedutil enabled. You can use util_clamp in general to
help with DVFS related response time delays.

I haven't done any work to try our best to pick a small core first but fallback
to big if there's no other alternative.

It'd be interesting to know how often you end up on a big core if you remove
the affinity. The RT scheduler picks the first cpu in the lowest priority mask.
So it should have this bias towards picking smaller cores first if they're
in the lower priority mask (ie: not running higher priority RT tasks).

So unless you absolutely don't want any RT tasks on a big cores, it'd be worth
removing this affinity and check the percentage of time you spend on little
cores. This should help with your worst case scenario as you make more cpus
available.

> > > run ASAP once fences are signalled, and vblank_work to run at a
> > > slightly higher priority still.  But the correct choice for priorities
> > > here depends on what userspace is using, it all needs to fit together
> > > properly.
> >
> > By userspace here I think you mean none display pipeline related RT tasks that
> > you need to coexit with and could still disrupt your pipeline?
> 
> I mean, commit_work should be higher priority than the other (display
> related) RT tasks.  But the kernel doesn't know what those priorities
> are.

So if you set commit_work to sched_set_fifo(), it'd be at a reasonably high
priority (50) by default. Which means you just need to manage your SF
priorities without having to change commit_work priority itself?

> 
> > Using RT on Gerneral Purpose System is hard for sure. One of the major
> > challenge is that there's no admin that has full view of the system to do
> > proper RT planning.
> >
> > We need proper RT balancer daemon that helps partitioning the system for
> > multiple RT apps on these systems..
> >
> > >
> > > >
> > > > I do appreciate that maybe some of these tasks have varying requirements during
> > > > their life time. e.g: they have RT property during specific critical section
> > > > but otherwise are CFS tasks. I think the UI thread in Android behaves like
> > > > that.
> > > >
> > > > It's worth IMO trying that approach I pointed out earlier to see if making RT
> > > > try to pick an idle CPU rather than preempt CFS helps. Not sure if it'd be
> > > > accepted but IMHO it's a better direction to consider and discuss.
> > >
> > > The problem I was seeing was actually the opposite..  commit_work
> > > becomes runnable (fences signalled) but doesn't get a chance to run
> > > because a SCHED_FIFO SF thread is running.  (Maybe I misunderstood and
> > > you're approach would help this case too?)
> >
> > Ah okay. Sorry I got it the wrong way around for some reason. I thought this
> > task is preempting other CFS-based pipelined tasks.
> >
> > So your system seems to be overcomitted. Is SF short for SufraceFlinger? Under
> > what scenarios do you have many SurfaceFlinger tasks? On Android I remember
> > seeing they have priority of 1 or 2.
> 
> yeah, SF==SurfaceFlinger, and yeah, 1 and 2..
> 
> > sched_set_fifo() will use priority 50. If you set all your pipeline tasks
> > to this priority, what happens?
> 
> I think this would work.. drm/msm doesn't use vblank work, so I
> wouldn't really have problems with commit_work preempting vblank_work.
> But I think the best option (and to handle the case if android changes
> the RT priorties around in the future) is to let userspace set the
> priorities.

I don't really mind. But it seems better for me if we know that two kernel
threads need to have a specific relative priorities to each others then to
handle this in the kernel properly. Userspace will only need then to worry
about managing its *own* priorities relative to that.

Just seen Peter suggesting in another email to use SCHED_DEADLINE for vblank
work. Which I think achieves the above if commit_work uses sched_set_fifo().

> 
> > >
> > > > Or maybe you can wrap userspace pipeline critical section lock such that any
> > > > task holding it will automatically be promoted to SCHED_FIFO and then demoted
> > > > to CFS once it releases it.
> > >
> > > The SCHED_DEADLINE + token passing approach that the lwn article
> > > mentioned sounds interesting, if that eventually becomes possible.
> > > But doesn't really help today..
> >
> > We were present in the room with Alessio when he gave that talk :-)
> >
> > You might have seen Valentin's talk in LPC where he's trying to get
> > proxy-execution into shape. Which is a pre-requisite to enable using of
> > SCHED_DEADLINE for these scenarios. IIRC it should allow all dependent tasks to
> > run from the context of the deadline task during the display pipeline critical
> > section.
> >
> > By the way, do you have issues with SoftIrqs delaying your RT tasks execution
> > time?
> 
> I don't *think* so, but I'm not 100% sure if they are showing up in

If you ever get a chance to run a high network throughput test, it might help
to see if softirqs are affecting you. I know Android has issues with this under
some circumstances.

> traces.  So far it seems like SF stomping on commit_work.  (There is
> the added complication that there are some chrome gpu-process tasks in
> between SF and the display, including CrGpuMain (which really doesn't
> want to be SCHED_FIFO when executing gl commands on behalf of
> something unrelated to the compositor.. the deadline approach, IIUC,
> might be the better option eventually for this?)

If you meant sched_deadline + token approach, then yeah I think it'd be better.
But as you said, we can't do this yet :/

But as Peter pointed out, this doesn't mean you can't use SCHED_DEADLINE at all
if it does make sense.

Thanks

--
Qais Yousef
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
