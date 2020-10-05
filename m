Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EEC284737
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846F46E408;
	Tue,  6 Oct 2020 07:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 730DE6E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:00:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE17113E;
 Mon,  5 Oct 2020 08:00:28 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5771D3F70D;
 Mon,  5 Oct 2020 08:00:27 -0700 (PDT)
Date: Mon, 5 Oct 2020 16:00:25 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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

+CC Steve and Peter - they might be interested.

On 10/02/20 11:07, Rob Clark wrote:
> On Fri, Oct 2, 2020 at 4:01 AM Qais Yousef <qais.yousef@arm.com> wrote:
> >
> > On 09/30/20 14:17, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The android userspace treats the display pipeline as a realtime problem.
> > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > that I found.)
> > >
> > > But this presents a problem with using workqueues for non-blocking
> > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > preempt the worker.  Which is not really the outcome you want.. once
> > > the required fences are scheduled, you want to push the atomic commit
> > > down to hw ASAP.
> >
> > For me thees 2 properties
> >
> >         1. Run ASAP
> >         2. Finish the work un-interrupted
> >
> > Scream the workers need to be SCHED_FIFO by default. CFS can't give you these
> > guarantees.
> 
> fwiw, commit_work does sleep/block for some time until fences are
> signalled, but then once that happens we want it to run ASAP,
> preempting lower priority SCHED_FIFO.
> 
> >
> > IMO using sched_set_fifo() for these workers is the right thing.
> >
> 
> Possibly, but we still have limited prioritization options (ie. not
> enough) to set these from the kernel.  Giving userspace the control,
> so it can pick sensible priorities for commit_work and vblank_work,
> which fits in with the priorities of the other userspace threads seems
> like the sensible thing.

The problem is that the kernel can run on all types of systems. It's impossible
to pick one value that fits all. Userspace must manage these priorities, and
you can still export the TID to help with that.

But why do you need several priorities in your pipeline? I would have thought
it should execute each stage sequentially and all tasks running at the same RT
priority is fine.

On SMP priorities matter once you've overcomitted the systems. You need to have
more RT tasks running than CPUs for priorities to matter. It seems you have
a high count of RT tasks in your system?

I did some profiles on Android and found that being overcomitted is hard. But
that was a while ago.

> 
> > >
> > > But the decision of whether commit_work should be RT or not really
> > > depends on what userspace is doing.  For a pure CFS userspace display
> > > pipeline, commit_work() should remain SCHED_NORMAL.
> >
> > I'm not sure I agree with this. I think it's better to characterize tasks based
> > on their properties/requirements rather than what the rest of the userspace is
> > using.
> 
> I mean, the issue is that userspace is already using a few different
> rt priority levels for different SF threads.  We want commit_work to

Why are they at different priorities? Different priority levels means that some
of them have more urgent deadlines to meet and it's okay to steal execution
time from lower priority tasks. Is this the case?

RT planning and partitioning is not easy task for sure. You might want to
consider using affinities too to get stronger guarantees for some tasks and
prevent cross-talking.

> run ASAP once fences are signalled, and vblank_work to run at a
> slightly higher priority still.  But the correct choice for priorities
> here depends on what userspace is using, it all needs to fit together
> properly.

By userspace here I think you mean none display pipeline related RT tasks that
you need to coexit with and could still disrupt your pipeline?

Using RT on Gerneral Purpose System is hard for sure. One of the major
challenge is that there's no admin that has full view of the system to do
proper RT planning.

We need proper RT balancer daemon that helps partitioning the system for
multiple RT apps on these systems..

> 
> >
> > I do appreciate that maybe some of these tasks have varying requirements during
> > their life time. e.g: they have RT property during specific critical section
> > but otherwise are CFS tasks. I think the UI thread in Android behaves like
> > that.
> >
> > It's worth IMO trying that approach I pointed out earlier to see if making RT
> > try to pick an idle CPU rather than preempt CFS helps. Not sure if it'd be
> > accepted but IMHO it's a better direction to consider and discuss.
> 
> The problem I was seeing was actually the opposite..  commit_work
> becomes runnable (fences signalled) but doesn't get a chance to run
> because a SCHED_FIFO SF thread is running.  (Maybe I misunderstood and
> you're approach would help this case too?)

Ah okay. Sorry I got it the wrong way around for some reason. I thought this
task is preempting other CFS-based pipelined tasks.

So your system seems to be overcomitted. Is SF short for SufraceFlinger? Under
what scenarios do you have many SurfaceFlinger tasks? On Android I remember
seeing they have priority of 1 or 2.

sched_set_fifo() will use priority 50. If you set all your pipeline tasks
to this priority, what happens?

> 
> > Or maybe you can wrap userspace pipeline critical section lock such that any
> > task holding it will automatically be promoted to SCHED_FIFO and then demoted
> > to CFS once it releases it.
> 
> The SCHED_DEADLINE + token passing approach that the lwn article
> mentioned sounds interesting, if that eventually becomes possible.
> But doesn't really help today..

We were present in the room with Alessio when he gave that talk :-)

You might have seen Valentin's talk in LPC where he's trying to get
proxy-execution into shape. Which is a pre-requisite to enable using of
SCHED_DEADLINE for these scenarios. IIRC it should allow all dependent tasks to
run from the context of the deadline task during the display pipeline critical
section.

By the way, do you have issues with SoftIrqs delaying your RT tasks execution
time?

Thanks

--
Qais Yousef
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
