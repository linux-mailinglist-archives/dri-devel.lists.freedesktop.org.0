Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B52842EC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 01:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE8F6E19A;
	Mon,  5 Oct 2020 23:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767C16E19A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 23:24:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l11so1095829wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4NRONSdRMIFMg/yFae8Tzub/i2XPIDxljZHbVPWFJ4=;
 b=coDqz+AuKV/KAAJQkvCh2JfexrYWRrxWjCZPFmAH03LD1TdHaKdWWEw4zlkLMCt7Af
 iDGyRxY3KcH6NR4ykxKYlEwPNcN/I7K/tID1Jt18Z/XYJxmYiEmwtJXEP8ZcHI2AtBjs
 SR4cAg1dNQNzS3QRBfaRJQaHPXSqcv+NDcvI42yFpG3wum3RXITLInyICbUIrSRQGAOK
 iNHRtnQKs8UBW7P5ePdhjJdR82YuqOcwq+KfCFaLGUE9sNdHe4ghLCmgnS9G/rViXyu9
 dcp8Z/EbqgkP65vCD5khqCsb0MdQw9mZx6eSwI2Lu8zTW7avWN+DIV3IPyhfl5gwUDDQ
 WJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4NRONSdRMIFMg/yFae8Tzub/i2XPIDxljZHbVPWFJ4=;
 b=bBDhjEK2wxPHkGykSx8pacghb8z7cP49lzWjDwC6c2HXajl4dgyYCIDYH24vL33fvS
 lEbTkyQQjmr1+qrb31mCNvVqzriCjmDlYUSE5vT8RjK24TJec8teCpcl5M5vSRHr/rKU
 si8YRjEm67bRyC9+0yHmAGnzXZueZTKyjDXWGCB/dc5y9Cv2jcBN+lDK5if9GA3aLNwH
 rmjbXHPIWE96cYu/jy3DhJkp7qdfXHlkSLcI30Y3XGHkUaxiU6hyR72QmFFgXX2QZB8z
 PbLOoN5D9vkz7siZvcp8EL1Lt86+6TJgz13ZG6upRhEudFmTi6gw8mdtvPjXr37SkAvt
 HF+g==
X-Gm-Message-State: AOAM532xSAN2Oq+r1CCcM5+6RW1bHyZyUBQyPU/wCkZE+UQvJBGcmyW6
 t+yEprd+hDzjnrlSxYf3V2s2BIDVRRjefhLuL04=
X-Google-Smtp-Source: ABdhPJwY+laQLkmmKNZUEiUUzBPw01vxMp5szUus2zvhrQy+SOGQ2yLkVciB+1RikcAOnopXYFEj6Gm2JjvVqP0rTmk=
X-Received: by 2002:a1c:6488:: with SMTP id y130mr1628560wmb.94.1601940289773; 
 Mon, 05 Oct 2020 16:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
In-Reply-To: <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 Oct 2020 16:24:38 -0700
Message-ID: <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
To: Qais Yousef <qais.yousef@arm.com>
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

On Mon, Oct 5, 2020 at 8:00 AM Qais Yousef <qais.yousef@arm.com> wrote:
>
> +CC Steve and Peter - they might be interested.
>
> On 10/02/20 11:07, Rob Clark wrote:
> > On Fri, Oct 2, 2020 at 4:01 AM Qais Yousef <qais.yousef@arm.com> wrote:
> > >
> > > On 09/30/20 14:17, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > The android userspace treats the display pipeline as a realtime problem.
> > > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > > that I found.)
> > > >
> > > > But this presents a problem with using workqueues for non-blocking
> > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > > preempt the worker.  Which is not really the outcome you want.. once
> > > > the required fences are scheduled, you want to push the atomic commit
> > > > down to hw ASAP.
> > >
> > > For me thees 2 properties
> > >
> > >         1. Run ASAP
> > >         2. Finish the work un-interrupted
> > >
> > > Scream the workers need to be SCHED_FIFO by default. CFS can't give you these
> > > guarantees.
> >
> > fwiw, commit_work does sleep/block for some time until fences are
> > signalled, but then once that happens we want it to run ASAP,
> > preempting lower priority SCHED_FIFO.
> >
> > >
> > > IMO using sched_set_fifo() for these workers is the right thing.
> > >
> >
> > Possibly, but we still have limited prioritization options (ie. not
> > enough) to set these from the kernel.  Giving userspace the control,
> > so it can pick sensible priorities for commit_work and vblank_work,
> > which fits in with the priorities of the other userspace threads seems
> > like the sensible thing.
>
> The problem is that the kernel can run on all types of systems. It's impossible
> to pick one value that fits all. Userspace must manage these priorities, and
> you can still export the TID to help with that.
>
> But why do you need several priorities in your pipeline? I would have thought
> it should execute each stage sequentially and all tasks running at the same RT
> priority is fine.

On the kernel side, vblank work should complete during the vblank
period, making it a harder real time requirement.  So the thinking is
this should be a higher priority.

But you are right, if you aren't overcommitted it probably doesn't matter.

> On SMP priorities matter once you've overcomitted the systems. You need to have
> more RT tasks running than CPUs for priorities to matter. It seems you have
> a high count of RT tasks in your system?
>
> I did some profiles on Android and found that being overcomitted is hard. But
> that was a while ago.
>
> >
> > > >
> > > > But the decision of whether commit_work should be RT or not really
> > > > depends on what userspace is doing.  For a pure CFS userspace display
> > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > >
> > > I'm not sure I agree with this. I think it's better to characterize tasks based
> > > on their properties/requirements rather than what the rest of the userspace is
> > > using.
> >
> > I mean, the issue is that userspace is already using a few different
> > rt priority levels for different SF threads.  We want commit_work to
>
> Why are they at different priorities? Different priority levels means that some
> of them have more urgent deadlines to meet and it's okay to steal execution
> time from lower priority tasks. Is this the case?

tbh, I'm not fully aware of the background.  It looks like most of the
SF threads run at priority=2 (100-2==98), and the main one runs at
priority=1

> RT planning and partitioning is not easy task for sure. You might want to
> consider using affinities too to get stronger guarantees for some tasks and
> prevent cross-talking.

There is some cgroup stuff that is pinning SF and some other stuff to
the small cores, fwiw.. I think the reasoning is that they shouldn't
be doing anything heavy enough to need the big cores.

> > run ASAP once fences are signalled, and vblank_work to run at a
> > slightly higher priority still.  But the correct choice for priorities
> > here depends on what userspace is using, it all needs to fit together
> > properly.
>
> By userspace here I think you mean none display pipeline related RT tasks that
> you need to coexit with and could still disrupt your pipeline?

I mean, commit_work should be higher priority than the other (display
related) RT tasks.  But the kernel doesn't know what those priorities
are.

> Using RT on Gerneral Purpose System is hard for sure. One of the major
> challenge is that there's no admin that has full view of the system to do
> proper RT planning.
>
> We need proper RT balancer daemon that helps partitioning the system for
> multiple RT apps on these systems..
>
> >
> > >
> > > I do appreciate that maybe some of these tasks have varying requirements during
> > > their life time. e.g: they have RT property during specific critical section
> > > but otherwise are CFS tasks. I think the UI thread in Android behaves like
> > > that.
> > >
> > > It's worth IMO trying that approach I pointed out earlier to see if making RT
> > > try to pick an idle CPU rather than preempt CFS helps. Not sure if it'd be
> > > accepted but IMHO it's a better direction to consider and discuss.
> >
> > The problem I was seeing was actually the opposite..  commit_work
> > becomes runnable (fences signalled) but doesn't get a chance to run
> > because a SCHED_FIFO SF thread is running.  (Maybe I misunderstood and
> > you're approach would help this case too?)
>
> Ah okay. Sorry I got it the wrong way around for some reason. I thought this
> task is preempting other CFS-based pipelined tasks.
>
> So your system seems to be overcomitted. Is SF short for SufraceFlinger? Under
> what scenarios do you have many SurfaceFlinger tasks? On Android I remember
> seeing they have priority of 1 or 2.

yeah, SF==SurfaceFlinger, and yeah, 1 and 2..

> sched_set_fifo() will use priority 50. If you set all your pipeline tasks
> to this priority, what happens?

I think this would work.. drm/msm doesn't use vblank work, so I
wouldn't really have problems with commit_work preempting vblank_work.
But I think the best option (and to handle the case if android changes
the RT priorties around in the future) is to let userspace set the
priorities.

> >
> > > Or maybe you can wrap userspace pipeline critical section lock such that any
> > > task holding it will automatically be promoted to SCHED_FIFO and then demoted
> > > to CFS once it releases it.
> >
> > The SCHED_DEADLINE + token passing approach that the lwn article
> > mentioned sounds interesting, if that eventually becomes possible.
> > But doesn't really help today..
>
> We were present in the room with Alessio when he gave that talk :-)
>
> You might have seen Valentin's talk in LPC where he's trying to get
> proxy-execution into shape. Which is a pre-requisite to enable using of
> SCHED_DEADLINE for these scenarios. IIRC it should allow all dependent tasks to
> run from the context of the deadline task during the display pipeline critical
> section.
>
> By the way, do you have issues with SoftIrqs delaying your RT tasks execution
> time?

I don't *think* so, but I'm not 100% sure if they are showing up in
traces.  So far it seems like SF stomping on commit_work.  (There is
the added complication that there are some chrome gpu-process tasks in
between SF and the display, including CrGpuMain (which really doesn't
want to be SCHED_FIFO when executing gl commands on behalf of
something unrelated to the compositor.. the deadline approach, IIUC,
might be the better option eventually for this?)

BR,
-R

>
> Thanks
>
> --
> Qais Yousef
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
