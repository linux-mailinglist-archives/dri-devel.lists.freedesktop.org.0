Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E422273B50
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 08:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A576E0AF;
	Tue, 22 Sep 2020 06:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E696E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:59:04 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a2so14663366otr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Io98OQKBfXmad/V5Q3HChdQn8Hkya8lVT+DVztPEK0M=;
 b=AioUavmhttbZsg6L2SE47l6JcfE1MR6+gVCAomNSCMju2+GLeB86QrlTrNzvB58hXI
 ApyMtZS7ES4NFw4Cc8d8FSab11HKf+kHAt3c4T5/PeZAsJOaLyT3rP3DpjPjDdyC1l+J
 EBifR3byk3XmU5t68/AW++nBzxFAG903BNxlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Io98OQKBfXmad/V5Q3HChdQn8Hkya8lVT+DVztPEK0M=;
 b=TXCSw321MVZCLRqY64Xh5FpjgbURRs+BGvRq8uEx/c3bHOxP7zHPiNS587Ljta9ZqH
 sKl0phyZjrPDMAaqzVLxsb3Ql+qC54n2rZ0DyEsjE3Cm2tmY0kOBWhhF2vzYQFcpbsFh
 Zpeu2rUQGrrIZluerz/zudOU/lDAf7Ha6NYC/LPm/bp0r45aDWt5TyaU2wCdvRXbhhlR
 Tq87FCelKdizDuMDBwWNVMnfjkJ9fCNObQfSiAhEpY+o6rAHSzMpfTWNrht01nKe/9+e
 G6eYxN2b6znvDDJ7okJEMH6Zr8Hbrev7YV25P9j/upC0osEiWoj+WPTgekLjSUEGDUZZ
 6ghQ==
X-Gm-Message-State: AOAM531rx9DPACE0C0rvs2CfR3J+CYeS6wWwqrxUcN1xRYKwys/dcTPc
 InBbUj/38B9Wb2++nORc4xchGV1iVQAKvfUwOzekTA==
X-Google-Smtp-Source: ABdhPJzqEo4sG1xO1og6aPPmhSOuPNObimtE6YLwGcDblat5DcM+OlaSQ6ZplmhgNPIDy5laHiAIjZKXC4wvkIlbe28=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr1852217otj.303.1600757943823; 
 Mon, 21 Sep 2020 23:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
 <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
In-Reply-To: <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Sep 2020 08:58:52 +0200
Message-ID: <CAKMK7uEqDD-oDAQKyA9DQbxkCgEjC5yyjvKR7d8T0Gj0SqEZ4A@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 5:16 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Sep 21, 2020 at 2:21 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sat, Sep 19, 2020 at 12:37:23PM -0700, Rob Clark wrote:
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
> > >
> > > But the decision of whether commit_work should be RT or not really
> > > depends on what userspace is doing.  For a pure CFS userspace display
> > > pipeline, commit_work() should remain SCHED_NORMAL.
> > >
> > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > > used to avoid serializing commits when userspace is using a per-CRTC
> > > update loop.
> > >
> > > A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> > > priority commit work.
> > >
> > > A potential issue is that since 616d91b68cd ("sched: Remove
> > > sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> > > meaning that commit_work() ends up running at the same priority level
> > > as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> > > use of vblank-work at this point.  And if it could be arranged that
> > > vblank-work is scheduled before signaling out-fences and/or sending
> > > pageflip events, it could probably work ok to use a single priority
> > > level for both commit-work and vblank-work.
> >
> > The part I don't like about this is that it all feels rather hacked
> > together, and if we add more stuff (or there's some different thing in the
> > system that also needs rt scheduling) then it doesn't compose.
>
> The ideal thing would be that userspace is in control of the
> priorities.. the setclientcap approach seemed like a reasonable way to
> give the drm-master a way to opt in.
>
> I suppose instead userspace could use sched_setscheduler().. but that
> would require userspace to be root, and would require some way to find
> the tid.

Userspace already needs that for the SCHED_FIFO for surface-flinger.
Or is the problem that CAP_SYS_NICE is only good for your own
processes?

Other question I have for this is whether there's any recommendations
for naming the kthreads (since I guess that name is what becomes the
uapi for userspace to control this)?

Otherwise I think "userspace calls sched_setscheduler on the right
kthreads" sounds like a good interface, since it lets userspace decide
how it all needs to fit together and compose. Anything we hard-code in
an ioctl is kinda lost cause. And we can choose the default values to
work reasonably well when the compositor runs at normal priority
(lowest niceness or something like that for the commit work).
-Daniel

> Is there some way we could arrange for the per-crtc kthread's to be
> owned by the drm master?  That would solve the "must be root" issue.
> And since the target audience is an atomic userspace, I suppose we
> could expose the tid as a read-only property on the crtc?
>
> BR,
> -R
>
> > So question to rt/worker folks: What's the best way to let userspace set
> > the scheduling mode and priorities of things the kernel does on its
> > behalf? Surely we're not the first ones where if userspace runs with some
> > rt priority it'll starve out the kernel workers that it needs. Hardcoding
> > something behind a subsystem ioctl (which just means every time userspace
> > changes what it does, we need a new such flag or mode) can't be the right
> > thing.
> >
> > Peter, Tejun?
> >
> > Thanks, Daniel
> >
> > >
> > > Rob Clark (3):
> > >   drm/crtc: Introduce per-crtc kworker
> > >   drm/atomic: Use kthread worker for nonblocking commits
> > >   drm: Add a client-cap to set scheduling mode
> > >
> > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
> > >  drivers/gpu/drm/drm_auth.c          |  4 ++++
> > >  drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
> > >  include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
> > >  include/drm/drm_crtc.h              | 10 ++++++++
> > >  include/uapi/drm/drm.h              | 13 ++++++++++
> > >  7 files changed, 117 insertions(+), 4 deletions(-)
> > >
> > > --
> > > 2.26.2
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
