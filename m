Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22592848FC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 11:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785346E3EF;
	Tue,  6 Oct 2020 09:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0832C6E098
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 09:09:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t10so12574775wrv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QT4sff31JFxMAWV47tsow6IkRjEC9gwI2+WJTBC/iXU=;
 b=RxzqBtgfi4VNzqUwmnMjLczASgvxj0ZLZ6HeBQYPANTVsMxh8bzbIkhgoJtzqh7Frp
 3lf0hkXfgZ9wWzgz7uoqM15AAZXKGIdVgQnwMRv2VoiHD9szsXW/4dKOmXZD5pqaMdSm
 zTr/42vtFeT9vpGckN2NDpPW6fwr2urFUp0Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=QT4sff31JFxMAWV47tsow6IkRjEC9gwI2+WJTBC/iXU=;
 b=KyrPI44qufFkB5FpzjbvHTe9t57Z60GCPXSDjW2KcFfYYQ4r+FNUrjauAZO0X82wNF
 a92dDABCj17CgsY6AxYQ5meuA45/ysVnR8LCvGvbHKcKd9ecdTSQzTNIT9v7c70TuYED
 LGrthcvra7Q4MvRD+3xfRFiE9hn8mh+cVyWgoJlWTWRlOi02OILWG4IqWSr7x/oPHv0V
 a6aqviDlANOptJdbx4VnkxqgcN8sdPW2NUBYo/99Kvw62Oxy3HomoGYhw1DKvSINB/aO
 gQ9YhD9urZ4bRhby4Br1k/mv0Sc2Acr4InMcyxq9ScdzQ97m3a1XkTeB4n2xhUnuG6Am
 NUUQ==
X-Gm-Message-State: AOAM533RLHIGN+Z6cFrfBfg20JAGhGdYtPLa/ZfUMTBkfkBylmBrgJZc
 jdftfedx5lDXWx81htV/xCFefg==
X-Google-Smtp-Source: ABdhPJzE2U8EydJQd2Px1Cp1VdkD+utuSVnFMnmpFQp2SOvwCJ1IfGbebwpsVnsSKbHGvG+RwViKKA==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr3962523wrj.92.1601975342547; 
 Tue, 06 Oct 2020 02:09:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm2362146wrq.24.2020.10.06.02.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 02:09:01 -0700 (PDT)
Date: Tue, 6 Oct 2020 11:08:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201006090859.GW438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Qais Yousef <qais.yousef@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>, Tim Murray <timmurray@google.com>,
 Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 04:24:38PM -0700, Rob Clark wrote:
> On Mon, Oct 5, 2020 at 8:00 AM Qais Yousef <qais.yousef@arm.com> wrote:
> >
> > +CC Steve and Peter - they might be interested.
> >
> > On 10/02/20 11:07, Rob Clark wrote:
> > > On Fri, Oct 2, 2020 at 4:01 AM Qais Yousef <qais.yousef@arm.com> wrote:
> > > >
> > > > On 09/30/20 14:17, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > The android userspace treats the display pipeline as a realtime problem.
> > > > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > > > that I found.)
> > > > >
> > > > > But this presents a problem with using workqueues for non-blocking
> > > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > > > preempt the worker.  Which is not really the outcome you want.. once
> > > > > the required fences are scheduled, you want to push the atomic commit
> > > > > down to hw ASAP.
> > > >
> > > > For me thees 2 properties
> > > >
> > > >         1. Run ASAP
> > > >         2. Finish the work un-interrupted
> > > >
> > > > Scream the workers need to be SCHED_FIFO by default. CFS can't give you these
> > > > guarantees.
> > >
> > > fwiw, commit_work does sleep/block for some time until fences are
> > > signalled, but then once that happens we want it to run ASAP,
> > > preempting lower priority SCHED_FIFO.
> > >
> > > >
> > > > IMO using sched_set_fifo() for these workers is the right thing.
> > > >
> > >
> > > Possibly, but we still have limited prioritization options (ie. not
> > > enough) to set these from the kernel.  Giving userspace the control,
> > > so it can pick sensible priorities for commit_work and vblank_work,
> > > which fits in with the priorities of the other userspace threads seems
> > > like the sensible thing.
> >
> > The problem is that the kernel can run on all types of systems. It's impossible
> > to pick one value that fits all. Userspace must manage these priorities, and
> > you can still export the TID to help with that.
> >
> > But why do you need several priorities in your pipeline? I would have thought
> > it should execute each stage sequentially and all tasks running at the same RT
> > priority is fine.
> 
> On the kernel side, vblank work should complete during the vblank
> period, making it a harder real time requirement.  So the thinking is
> this should be a higher priority.
> 
> But you are right, if you aren't overcommitted it probably doesn't matter.

vblank work needs to preempt commit work.

Right now we don't have any driver requiring this, but if we e.g. roll out
the gamma table update for i915, then this _has_ to happen in the vblank
period.

Whereas the commit work can happen in there, but it can also be delayed a
bit (until the vblank worker has finished) we will not miss any additional
deadline due to that.

So that's why we have 2 levels. I'm not even sure you can model that with
SCHED_DEADLINE, since essentially we need a few usec of cpu time very
vblank (16ms normally), but thos few usec _must_ be scheduled within a
very specific time slot or we're toast. And that vblank period is only
1-2ms usually.

> > On SMP priorities matter once you've overcomitted the systems. You need to have
> > more RT tasks running than CPUs for priorities to matter. It seems you have
> > a high count of RT tasks in your system?
> >
> > I did some profiles on Android and found that being overcomitted is hard. But
> > that was a while ago.
> >
> > >
> > > > >
> > > > > But the decision of whether commit_work should be RT or not really
> > > > > depends on what userspace is doing.  For a pure CFS userspace display
> > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > >
> > > > I'm not sure I agree with this. I think it's better to characterize tasks based
> > > > on their properties/requirements rather than what the rest of the userspace is
> > > > using.
> > >
> > > I mean, the issue is that userspace is already using a few different
> > > rt priority levels for different SF threads.  We want commit_work to
> >
> > Why are they at different priorities? Different priority levels means that some
> > of them have more urgent deadlines to meet and it's okay to steal execution
> > time from lower priority tasks. Is this the case?
> 
> tbh, I'm not fully aware of the background.  It looks like most of the
> SF threads run at priority=2 (100-2==98), and the main one runs at
> priority=1
> 
> > RT planning and partitioning is not easy task for sure. You might want to
> > consider using affinities too to get stronger guarantees for some tasks and
> > prevent cross-talking.
> 
> There is some cgroup stuff that is pinning SF and some other stuff to
> the small cores, fwiw.. I think the reasoning is that they shouldn't
> be doing anything heavy enough to need the big cores.
> 
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
> traces.  So far it seems like SF stomping on commit_work.  (There is
> the added complication that there are some chrome gpu-process tasks in
> between SF and the display, including CrGpuMain (which really doesn't
> want to be SCHED_FIFO when executing gl commands on behalf of
> something unrelated to the compositor.. the deadline approach, IIUC,
> might be the better option eventually for this?)

deadline has the upshot that it compose much better than SCHED_FIFO:
Everyone just drops their deadline requirements onto the scheduler,
scheduler makes sure it's all obeyed (or rejects your request).

The trouble is we'd need to know how long a commit takes, worst case, on a
given platform. And for that you need to measure stuff, and we kinda can't
spend a few minutes at boot-up going through the combinatorial maze of
atomic commits to make sure we have it all.

So I think in practice letting userspace set the right rt priority/mode is
the only way to go here :-/
-Daniel

> 
> BR,
> -R
> 
> >
> > Thanks
> >
> > --
> > Qais Yousef

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
