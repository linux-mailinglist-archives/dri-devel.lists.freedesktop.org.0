Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18542275BC5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4F56E943;
	Wed, 23 Sep 2020 15:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2445F6E943
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:25:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k18so466044wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=AZ0TNN/4mlEawbq5kme4KBtAcxVTJOsazW2quN2exhk=;
 b=knEE8ZNEPhd02dhjiafNZIh6Ilcs2hRJuBBFe+Sx2gKj6V+tziP1ZYabkfgXV17TW+
 NUMy2UFrZwlfmV+sdZoLINzvMUyTG87xDRqw6gwbhA534sM/HHF/4rwqLNdrpC+7QaoX
 qU2N+vvwVpZazeSc6YeUX68W22fba8Lj2eA+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AZ0TNN/4mlEawbq5kme4KBtAcxVTJOsazW2quN2exhk=;
 b=GKy1uYFHgW5MRUdiJJ5U2eNVVLmUs/Mt2aa81akvyoLHlw6aMM5peDzdA3nM/0p7bz
 X4U/u12yny3FCajxHucD9BthBxyysRIP8AYvrRs/Btf4KzEz8QQFU3fCj9cZwmQakNtd
 Bj6dYoiqokNPESoczh5iB5c4pAmYTESiT/KScqy3ayrUIoOr609SIUdyroNa4zxPTwFV
 WGJE8sB0m3rJt7AtJ3uXnfdrlKmfrqaoM4R6Ca3yRgJuPaiSQRNhsLBw0+re28ow2lhy
 +jqVwHqg4go8PpEVtJAmh6d90kvMxKy3fwhTo5C/OyX/RnVFY8V/FSQMIrFN+696TK5+
 Xs8A==
X-Gm-Message-State: AOAM532Cn07obnAVGQU5uXWnrlngrapmgThbLw4b8CSBW6uIKnhjxQcs
 ctOmFKTfyBfxvNfZePEOmwtbGiXr8FJj476I
X-Google-Smtp-Source: ABdhPJwhaHjfJRQ0ck6dLHaDnam+iSpD5QCMjr6WsmrCc91FeiuFw1E8N+Fhyjg1fYBV6n1qNiQ1Mg==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr75865wma.41.1600874748672;
 Wed, 23 Sep 2020 08:25:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h76sm178488wme.10.2020.09.23.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:25:47 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:25:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200923152545.GQ438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Tim Murray <timmurray@google.com>, Tejun Heo <tj@kernel.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
 <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
 <CAKMK7uEqDD-oDAQKyA9DQbxkCgEjC5yyjvKR7d8T0Gj0SqEZ4A@mail.gmail.com>
 <CAF6AEGtYAn+W8HxP7SXtxPr5FsEB1hYGU91WrHCtwX89UmUR5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtYAn+W8HxP7SXtxPr5FsEB1hYGU91WrHCtwX89UmUR5w@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tim Murray <timmurray@google.com>,
 Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 07:48:10AM -0700, Rob Clark wrote:
> On Mon, Sep 21, 2020 at 11:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Sep 21, 2020 at 5:16 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Sep 21, 2020 at 2:21 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Sat, Sep 19, 2020 at 12:37:23PM -0700, Rob Clark wrote:
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
> > > > >
> > > > > But the decision of whether commit_work should be RT or not really
> > > > > depends on what userspace is doing.  For a pure CFS userspace display
> > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > > >
> > > > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > > > > used to avoid serializing commits when userspace is using a per-CRTC
> > > > > update loop.
> > > > >
> > > > > A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> > > > > priority commit work.
> > > > >
> > > > > A potential issue is that since 616d91b68cd ("sched: Remove
> > > > > sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> > > > > meaning that commit_work() ends up running at the same priority level
> > > > > as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> > > > > use of vblank-work at this point.  And if it could be arranged that
> > > > > vblank-work is scheduled before signaling out-fences and/or sending
> > > > > pageflip events, it could probably work ok to use a single priority
> > > > > level for both commit-work and vblank-work.
> > > >
> > > > The part I don't like about this is that it all feels rather hacked
> > > > together, and if we add more stuff (or there's some different thing in the
> > > > system that also needs rt scheduling) then it doesn't compose.
> > >
> > > The ideal thing would be that userspace is in control of the
> > > priorities.. the setclientcap approach seemed like a reasonable way to
> > > give the drm-master a way to opt in.
> > >
> > > I suppose instead userspace could use sched_setscheduler().. but that
> > > would require userspace to be root, and would require some way to find
> > > the tid.
> >
> > Userspace already needs that for the SCHED_FIFO for surface-flinger.
> > Or is the problem that CAP_SYS_NICE is only good for your own
> > processes?
> 
> tbh, I'm not completely sure offhand what gives surfaceflinger
> permission to set itself SCHED_FIFO
> 
> (But on CrOS there are a few more pieces to the puzzle)
> 
> > Other question I have for this is whether there's any recommendations
> > for naming the kthreads (since I guess that name is what becomes the
> > uapi for userspace to control this)?
> >
> > Otherwise I think "userspace calls sched_setscheduler on the right
> > kthreads" sounds like a good interface, since it lets userspace decide
> > how it all needs to fit together and compose. Anything we hard-code in
> > an ioctl is kinda lost cause. And we can choose the default values to
> > work reasonably well when the compositor runs at normal priority
> > (lowest niceness or something like that for the commit work).
> 
> I don't really like the naming convention approach.. what is to stop
> some unrelated process to name it's thread the same thing to get a
> SCHED_FIFO boost..
> 
> But we can stick with my idea to expose the thread id as a read-only
> CRTC property, for userspace to find the things to call
> sched_setscheduler() on.  If for whatever reason the drm master is not
> privileged (or is running in a sandbox, etc), a small helper that has
> the necessary permissions could open the drm device to find the CRTC
> thread-ids and call sched_setscheduler()..

Hm thread ids don't translate too well across PID namespaces I think ...
So that's another can of worms. And pidfd doesn't really work as a
property.

I also thought kernel threads can be distinguished from others, so
userspace shouldn't be able to sneak in and get elevated by accident.
-Daniel

> 
> BR,
> -R
> 
> > -Daniel
> >
> > > Is there some way we could arrange for the per-crtc kthread's to be
> > > owned by the drm master?  That would solve the "must be root" issue.
> > > And since the target audience is an atomic userspace, I suppose we
> > > could expose the tid as a read-only property on the crtc?
> > >
> > > BR,
> > > -R
> > >
> > > > So question to rt/worker folks: What's the best way to let userspace set
> > > > the scheduling mode and priorities of things the kernel does on its
> > > > behalf? Surely we're not the first ones where if userspace runs with some
> > > > rt priority it'll starve out the kernel workers that it needs. Hardcoding
> > > > something behind a subsystem ioctl (which just means every time userspace
> > > > changes what it does, we need a new such flag or mode) can't be the right
> > > > thing.
> > > >
> > > > Peter, Tejun?
> > > >
> > > > Thanks, Daniel
> > > >
> > > > >
> > > > > Rob Clark (3):
> > > > >   drm/crtc: Introduce per-crtc kworker
> > > > >   drm/atomic: Use kthread worker for nonblocking commits
> > > > >   drm: Add a client-cap to set scheduling mode
> > > > >
> > > > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
> > > > >  drivers/gpu/drm/drm_auth.c          |  4 ++++
> > > > >  drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
> > > > >  include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
> > > > >  include/drm/drm_crtc.h              | 10 ++++++++
> > > > >  include/uapi/drm/drm.h              | 13 ++++++++++
> > > > >  7 files changed, 117 insertions(+), 4 deletions(-)
> > > > >
> > > > > --
> > > > > 2.26.2
> > > > >
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
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
