Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6FA2802B3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 17:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6C86E8AE;
	Thu,  1 Oct 2020 15:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB9A6E8AE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 15:26:07 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 185so5944389oie.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qeiaTsO7c1keaxzsMiXnIexJPkXRFvvWYuhNwlUAnXk=;
 b=NxVn9ALRqf8yCnkX4pPQfE7CZOlkyITto6hJuRkpOfetrPy2MKiNsCW96J99ewnt33
 0dVAPEAfaoZwuq+3yYWqDWYWufyYvqdqqSpNv7RpSL/Hlfc3Rg3jtyxjZeLm8KOqKGF1
 4fL0svk40G2NzpImY+tl/rnGckM9MYkIM0AFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qeiaTsO7c1keaxzsMiXnIexJPkXRFvvWYuhNwlUAnXk=;
 b=RsUukPYnzhOX8j0ql7UZaUuwPffECkYdC7GNCRlOQH7Q5Cle5cwLNbkwcTYpSRxxtZ
 Pn4wADICbcOuG/MXgnbFijssOzHlscNcDG+5z6hEBRkxgqlzxLtIt6GciUvmWvKW+8UP
 rv8nI7lQt8x54dwbE8CufYn8sZHcnJdMPbctZ5dj77PjpMG3xRlHZDs6SesGwtvQtO4s
 eKiVi7/0vjTQvIHP1SCQG/HXdD0A3xOncMsdgTyq7FfNWwprZFxcU0ZhIkEvMxNMG8IN
 NP9dPq/UsqjRShrQKW6iiYl4W0PIUqYIRWvq+TS/MEceqzYn4Yn/selE6skvm3+Zzcop
 o2mA==
X-Gm-Message-State: AOAM530KDNNMTPpuZY2fDqmXyibcKdsVe5r6MYc2eKavJb1trs1vjx4c
 0ZxbG01JUemFN4qcRa5J2Q88YqV4ccmWh6L6L4ODHA==
X-Google-Smtp-Source: ABdhPJz+2wKWjvqnBlbQPqQkli65OPYTCk+uOZV9wexfBZJFtTgu+lOuX5lXJOHUc/SmGhRNrpeUMojZ7e4tdjBCbaA=
X-Received: by 2002:aca:eb49:: with SMTP id j70mr286415oih.101.1601565966665; 
 Thu, 01 Oct 2020 08:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
In-Reply-To: <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 1 Oct 2020 17:25:55 +0200
Message-ID: <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Oct 1, 2020 at 12:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Sep 30, 2020 at 11:16 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
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
> > > update loop.  And the last patch exposes the task id to userspace as
> > > a CRTC property, so that userspace can adjust the priority and sched
> > > policy to fit it's needs.
> > >
> > >
> > > v2: Drop client cap and in-kernel setting of priority/policy in
> > >     favor of exposing the kworker tid to userspace so that user-
> > >     space can set priority/policy.
> >
> > Yeah I think this looks more reasonable. Still a bit irky interface,
> > so I'd like to get some kworker/rt ack on this. Other opens:
> > - needs userspace, the usual drill
>
> fwiw, right now the userspace is "modetest + chrt".. *probably* the
> userspace will become a standalone helper or daemon, mostly because
> the chrome gpu-process sandbox does not allow setting SCHED_FIFO.  I'm
> still entertaining the possibility of switching between rt and cfs
> depending on what is in the foreground (ie. only do rt for android
> apps).
>
> > - we need this also for vblank workers, otherwise this wont work for
> > drivers needing those because of another priority inversion.
>
> I have a thought on that, see below..

Hm, not seeing anything about vblank worker below?

> > - we probably want some indication of whether this actually does
> > something useful, not all drivers use atomic commit helpers. Not sure
> > how to do that.
>
> I'm leaning towards converting the other drivers over to use the
> per-crtc kwork, and then dropping the 'commit_work` from atomic state.
> I can add a patch to that, but figured I could postpone that churn
> until there is some by-in on this whole idea.

i915 has its own commit code, it's not even using the current commit
helpers (nor the commit_work). Not sure how much other fun there is.

> > - not sure whether the vfunc is an awesome idea, I'd frankly just
> > open-code this inline. We have similar special cases already for e.g.
> > dpms (and in multiple places), this isn't the worst.
>
> I could introduce a "PID" property type.  This would be useful if we
> wanted to also expose the vblank workers.

Hm right, but I think we need at most 2 for commit thread and vblank
thread (at least with the current design). So open-coded if with two
if (prop == crtc_worker_pid_prop || prop  ==
crtc_vblank_worker_pid_prop) doesn't seem too horrible to me.
Otherwise people start creating really funny stuff in their drivers
with this backend, and I don't want to spend all the time making sure
they don't abuse this :-)

> > - still feeling we could at least change the default to highpriority niceness.
>
> AFAIU this would still be preempted by something that is SCHED_FIFO.
> Also, with cfs/SCHED_NORMAL, you can still be preempted by lower
> priority things that haven't had a chance to run for a while.

i915 uses highprio workqueue, so I guess to avoid regressions we need
that (it's also not using the commit helpers right now, but no reason
not to afaics, stuff simply happened in parallel back then.

> > - there's still the problem that commit works can overlap, and a
> > single worker can't do that anymore. So rolling that out for everyone
> > as-is feels a bit risky.
>
> That is why it is per-CRTC..  I'm not sure there is a need to overlap
> work for a single CRTC?
>
> We could OFC make this a driver knob, and keep the old 'commit_work'
> option, but that doesn't really feel like the right direction

drm_atomic_helper_commit_hw_done is what unblocks the next worker on
the same set of crtc. It's before we do all the buffer cleanup, which
has a full vblank stall beforehand. Most drivers also have the same
vblank stall in their next commit, plus generally the fb cleanup is
cheap, but neither is a requirement. So yeah you can get overlapping
commit work on the same crtc, and that was kinda intentional. Maybe
was overkill, I guess minimally just something that needs to be in the
commit message.
-Daniel

>
> BR,
> -R
>
> > Cheers, Daniel
> >
> > >
> > > Rob Clark (3):
> > >   drm/crtc: Introduce per-crtc kworker
> > >   drm/atomic: Use kthread worker for nonblocking commits
> > >   drm: Expose CRTC's kworker task id
> > >
> > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
> > >  drivers/gpu/drm/drm_crtc.c          | 14 +++++++++++++
> > >  drivers/gpu/drm/drm_mode_config.c   | 14 +++++++++++++
> > >  drivers/gpu/drm/drm_mode_object.c   |  4 ++++
> > >  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
> > >  include/drm/drm_crtc.h              |  8 ++++++++
> > >  include/drm/drm_mode_config.h       |  9 +++++++++
> > >  include/drm/drm_property.h          |  9 +++++++++
> > >  8 files changed, 98 insertions(+), 4 deletions(-)
> > >
> > > --
> > > 2.26.2
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
