Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691A1281A90
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 20:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EA76E9B1;
	Fri,  2 Oct 2020 18:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69EA6E9B1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 18:07:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x23so2517963wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 11:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hSw4ifTPDKB9srZ+U67ZO/LueWH5csX6p0YvSIY7bw4=;
 b=EP9fHx1d+5jerIa7x/a+X14ezvJYWlpIVbSv8tiDS9m2JdPrZ+hy7IzHYkddOwIMXC
 w86tDBeDM3S0cR7MGYiG0nX+053dzrbZ6riSNPgLNvtEF81xUWUHgu/503rkiriMLn8H
 9Nl/5cZlwOSmApOWI3l5mmv4wSu6xZ8S1l5FY/t5dMqcGHHPCFIer+WM3X6gdIrp2sb7
 MkZhklFHTVv2ccuASamoNTsl8b4lRqz3n5HHitdQjxJOzjWlDdG/euiAibspUUALMTX1
 kDTCxG0DxXU8EAS3NZtgO+n8YWP2enHjrkSI68iI1Vk3QFT5LCigCyqhm0kv7ObH6lv3
 Uvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hSw4ifTPDKB9srZ+U67ZO/LueWH5csX6p0YvSIY7bw4=;
 b=BjxuWwQ5HbwtdHoW59UvZOMn9Tq1Wfi9q7Uo2qyb5fjJpXXgziEJU0KuEHoQMFkSDI
 P3urfsIm6KQiCgZVBYPhrcXQioReIIhntrCmOD2al8c2OvETkZoG+eqNX7eM+olUN+Eb
 vpMdJKpI7nN7IvZbWGscn2INsktbFnn2pTyekrlxvfd2DbHVxZpTNnjn29o/DVF2nwIw
 BBEfSS7ZG31ZHp6T2rAnhdsoaTu7KQgkzl/mMt+Z8paDthlRWK1zqGDBchn81IY/efr8
 FeyobgiCv1XgiiMB4bhxXdvVXFDnNAv8qK8rHLu95FtAwvGGBZSZxbAyZHGFVRp7XJKn
 /leg==
X-Gm-Message-State: AOAM531m67uC8tDBreBXabRU5En8XnGqf7DJH8X7/wtOvs7alAqkkrXL
 SGWCQnngkqElxL8gl+ignrPPgVrJYwmLHGlI8qUsnAQZxl7sFA==
X-Google-Smtp-Source: ABdhPJyP1LQpe+YH7ZxDToEmMVacKwIGtROp49R6KVi2qQDPZ/YJnQTRwD8tLQ4BFmYVf1qKb1A4rDYlAl+eLBGLPfU=
X-Received: by 2002:a7b:c345:: with SMTP id l5mr4122885wmj.123.1601662077497; 
 Fri, 02 Oct 2020 11:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
In-Reply-To: <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 2 Oct 2020 11:07:45 -0700
Message-ID: <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 2, 2020 at 4:01 AM Qais Yousef <qais.yousef@arm.com> wrote:
>
> On 09/30/20 14:17, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The android userspace treats the display pipeline as a realtime problem.
> > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > that I found.)
> >
> > But this presents a problem with using workqueues for non-blocking
> > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > preempt the worker.  Which is not really the outcome you want.. once
> > the required fences are scheduled, you want to push the atomic commit
> > down to hw ASAP.
>
> For me thees 2 properties
>
>         1. Run ASAP
>         2. Finish the work un-interrupted
>
> Scream the workers need to be SCHED_FIFO by default. CFS can't give you these
> guarantees.

fwiw, commit_work does sleep/block for some time until fences are
signalled, but then once that happens we want it to run ASAP,
preempting lower priority SCHED_FIFO.

>
> IMO using sched_set_fifo() for these workers is the right thing.
>

Possibly, but we still have limited prioritization options (ie. not
enough) to set these from the kernel.  Giving userspace the control,
so it can pick sensible priorities for commit_work and vblank_work,
which fits in with the priorities of the other userspace threads seems
like the sensible thing.

> >
> > But the decision of whether commit_work should be RT or not really
> > depends on what userspace is doing.  For a pure CFS userspace display
> > pipeline, commit_work() should remain SCHED_NORMAL.
>
> I'm not sure I agree with this. I think it's better to characterize tasks based
> on their properties/requirements rather than what the rest of the userspace is
> using.

I mean, the issue is that userspace is already using a few different
rt priority levels for different SF threads.  We want commit_work to
run ASAP once fences are signalled, and vblank_work to run at a
slightly higher priority still.  But the correct choice for priorities
here depends on what userspace is using, it all needs to fit together
properly.

>
> I do appreciate that maybe some of these tasks have varying requirements during
> their life time. e.g: they have RT property during specific critical section
> but otherwise are CFS tasks. I think the UI thread in Android behaves like
> that.
>
> It's worth IMO trying that approach I pointed out earlier to see if making RT
> try to pick an idle CPU rather than preempt CFS helps. Not sure if it'd be
> accepted but IMHO it's a better direction to consider and discuss.

The problem I was seeing was actually the opposite..  commit_work
becomes runnable (fences signalled) but doesn't get a chance to run
because a SCHED_FIFO SF thread is running.  (Maybe I misunderstood and
you're approach would help this case too?)

> Or maybe you can wrap userspace pipeline critical section lock such that any
> task holding it will automatically be promoted to SCHED_FIFO and then demoted
> to CFS once it releases it.

The SCHED_DEADLINE + token passing approach that the lwn article
mentioned sounds interesting, if that eventually becomes possible.
But doesn't really help today..

BR,
-R

> Haven't worked with display pipelines before, so hopefully this makes sense :-)
>
> Thanks
>
> --
> Qais Yousef
>
> >
> > To handle this, convert non-blocking commit_work() to use per-CRTC
> > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > used to avoid serializing commits when userspace is using a per-CRTC
> > update loop.  And the last patch exposes the task id to userspace as
> > a CRTC property, so that userspace can adjust the priority and sched
> > policy to fit it's needs.
> >
> >
> > v2: Drop client cap and in-kernel setting of priority/policy in
> >     favor of exposing the kworker tid to userspace so that user-
> >     space can set priority/policy.
> >
> > Rob Clark (3):
> >   drm/crtc: Introduce per-crtc kworker
> >   drm/atomic: Use kthread worker for nonblocking commits
> >   drm: Expose CRTC's kworker task id
> >
> >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
> >  drivers/gpu/drm/drm_crtc.c          | 14 +++++++++++++
> >  drivers/gpu/drm/drm_mode_config.c   | 14 +++++++++++++
> >  drivers/gpu/drm/drm_mode_object.c   |  4 ++++
> >  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
> >  include/drm/drm_crtc.h              |  8 ++++++++
> >  include/drm/drm_mode_config.h       |  9 +++++++++
> >  include/drm/drm_property.h          |  9 +++++++++
> >  8 files changed, 98 insertions(+), 4 deletions(-)
> >
> > --
> > 2.26.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
