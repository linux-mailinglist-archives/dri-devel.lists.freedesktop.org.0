Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21887C8256
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 11:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EFF10E5CB;
	Fri, 13 Oct 2023 09:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C3910E5CB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:41:28 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52f1ece3a76so621561a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 02:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697190087; x=1697794887; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oggjR2uTBtpvDsmUhNPMln72uLRqqWaW7L9EGJjdYvY=;
 b=Ey9Y6Y1sZjA00KQ3xeUXKaJeYjLvdHuofdM7V46dNDSJlWI1GN3G4RiULx0qc35yIn
 xUzxB7RVk75gwlC7T4YOMScxIIqSuOFmV2RTdF1IdN/7Y9MMmjFZvaqGIHXiwY3zoAb9
 v06dxQXTQIliDVPJQUNeO9W6IlIkxbRwib/aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697190087; x=1697794887;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oggjR2uTBtpvDsmUhNPMln72uLRqqWaW7L9EGJjdYvY=;
 b=N+2aqJnhhdT0lWLVbpna2a52vJSnkqG+sjQ8Pn12IN4v2r1/s2NcYKtu1Q9WZ81DG5
 XterTgmraaDXcuIEImqrtGTvfYVg2reyNiDwwawNJFnUEY7tf4d0ddAQaXEx97HaVzWD
 fL/XD2/2UHnU2UMIjMuPfPk0NVZaP1b+VYaWDd3NPSxZOPZt8dyWnAS+EgUz3zw93XrR
 /28KNbLmcV/0U9TVXqcjb9Kd/ym0hPc8JlFqWHtxf0qtHAmNNOygO9tewYLYL8/oVdvx
 J2XlmK8exxG8/5Ly8WbpcVVkgsYlJcHd8kPVOshVoAsK5K29db+a7MxTW+2/lF1Q/ZcT
 HEWw==
X-Gm-Message-State: AOJu0YwOmhb9Hg2U59uOFOzdxm/VN0yDujQ1Hg/tABJdYOximzmkJs/h
 pfcqkXn2kuMcv0OWRbRobbwWQg==
X-Google-Smtp-Source: AGHT+IFMaa7lz326LDAuEN0JaTXeXHA7dibUO6xd/TWJtF2XN21Wl3WpNuQzS971K/XTGOCSR0Cw2w==
X-Received: by 2002:a50:c319:0:b0:53e:408b:5be3 with SMTP id
 a25-20020a50c319000000b0053e408b5be3mr883278edb.1.1697190086768; 
 Fri, 13 Oct 2023 02:41:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a50d513000000b0053e408aec8bsm631119edi.6.2023.10.13.02.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 02:41:26 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:41:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ray Strode <halfline@gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZSkQxEL4596_pQW1@phenom.ffwll.local>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com>
 <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
 <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
 <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 02:19:41PM -0400, Ray Strode wrote:
> Hi,
> 
> On Mon, Oct 09, 2023 at 02:36:17PM +0200, Christian König wrote:
> > > > > To be clear, my take is, if driver code is running in process context
> > > > > and needs to wait for periods of time on the order of or in excess of
> > > > > a typical process time slice it should be sleeping during the waiting.
> > > > > If the operation is at a point where it can be cancelled without side
> > > > > effects, the sleeping should be INTERRUPTIBLE. If it's past the point
> > > > > of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
> > > > > opinion, should kernel code busy block a typical process for dozens of
> > > > > milliseconds while keeping the process RUNNING. I don't think this is
> > > > > a controversial take.
> > > > Exactly that's what I completely disagree on.
> 
> Okay if we can't agree that it's not okay for user space (or the
> kernel running in the context of user space) to busy loop a cpu core
> at 100% utilization throughout and beyond the process's entire
> scheduled time slice then we really are at an impasse. I gotta say i'm
> astonished that this seemingly indefensible behavior is somehow a
> point of contention, but I'm not going to keep arguing about it beyond
> this email.
> 
> I mean we're not talking about scientific computing, or code
> compilation, or seti@home. We're talking about nearly the equivalent
> of `while (1) __asm__ ("nop");`

I don't think anyone said this shouldn't be fixed or improved.

What I'm saying is that the atomic ioctl is not going to make guarantees
that it will not take up to much cpu time (for some extremely vague value
of "too much") to the point that userspace can configure it's compositor
in a way that it _will_ get killed if we _ever_ violate this rule.

We should of course try to do as good as job as possible, but that's not
what you're asking for. You're asking for a hard real-time guarantee with
the implication if we ever break it, it's a regression, and the kernel has
to bend over backwards with tricks like in your patch to make it work.

It's that hard real time guarantee of "the kernel will _never_ violate
this cpu time bound" that people are objecting against. Fixing the worst
offenders I don't think will see any pushback at all.

> > > The key point here is that the patch puts the work into the background just
> > > to avoid that it is accounted to the thread issuing it, and that in turn is
> > > not valid as far as I can see.
> >
> > Yeah it's that aspect I'm really worried about, because we essentially
> > start to support some gurantees that a) most drivers can't uphold without
> > a huge amount of work, some of the DC state recomputations are _really_
> > expensive b) without actually making the semantics clear, it's just
> > duct-tape.
> 
> If DC plane state computation (or whatever) is really taking 50ms or
> 200ms, then it probably should be done in chunks so it doesn't get
> preempted at an inopportune point? Look, this is not my wheelhouse,
> this is your wheelhouse, and I don't want to keep debating forever. It
> seems there is a discrepancy between our understandings of implied
> acceptable behavior.
> 
> > Yes compositors want to run kms in real-time, and yes that results in fun
> > if you try to strictly account for cpu time spent. Especially if your
> > policy is to just nuke the real time thread instead of demoting it to
> > SCHED_NORMAL for a time.
> 
> So I ended up going with this suggestion for blocking modesets:
> 
> https://gitlab.gnome.org/GNOME/mutter/-/commit/5d3e31a49968fc0da04e98c0f9d624ea5095c9e0
> 
> But *this* feels like duct tape: You've already said there's no
> guarantee the problem won't also happen during preliminary computation
> during non-blocking commits or via other drm entry points. So it
> really does seem like a fix that won't age well. I won't be surprised
> if in ~3 years (or whatever) in some RHEL release there's a customer
> bug leading to the real-time thread getting blocklisted for obscure
> server display hardware because it's causing the session to tank on a
> production machine.

Yes the atomic ioctl makes no guarantees across drivers and hw platforms
of guaranteed "we will never violate, you can kill your compositor if you
do" cpu bound limits. We'll try to not suck too badly, and we'll try to
focus on fixing the suck where it upsets the people the most.

But there is fundamentally no hard real time guarantee in atomic. At least
not with the current uapi.

> > I think if we want more than hacks here we need to answer two questions:
> > - which parts of the kms api are real time
> > - what exactly do we guarantee with that
> 
> imo, this isn't just about real-time versus non-real-time. It's no
> more acceptable for non-real-time mutter to be using 100% CPU doing
> busywaits than it is for real-time mutter to be using 100% cpu doing
> busywaits.

The problem isn't about wasting cpu time. It's about you having set up the
system in a way so that mutter gets killed if we ever waste too much cpu
time, ever. Which moves this from a soft real time "we'll try really hard
to not suck" to a hard real time "there will be obvious functional
regression reports if we even violate this once" guarantee.

The former is absolutely fine, and within the practical limit of writing
kms drivers is hard and and takes a lot of time, we'll do the best we can.

The latter is flat out not a guarantee the kernel currently makes, and I
see no practical feasible way to make that happen. And pretending we do
make this guarantee will just result in frustrated users filling bugs that
they desktop session died and developers closing them as "too hard to
fix".
 
> Also, both you and Christian have suggested using the non-blocking
> modeset api with a fence fd to poll on is equivalent to the blocking
> api flushing the commit_tail work before returning from the ioctl, but
> that's not actually true. I think we all now agree the EBUSY problem
> you mentioned as an issue with my proposed patch wasn't actually a
> problem for blocking commits, but that very same issue is a problem
> with the non-blocking commits that then block on a fence fd, right? I
> guess we'd need to block on a fence fd from the prior non-blocking
> commit first before starting the blocking commit (or something)

Yeah there's a bunch of issues around the current nonblocking modeset uapi
semantics that make it not so useful. There was a long irc discussion last
few days about all the various aspects, it's quite tricky.

Maybe as a bit more useful outcome of this entire discussion: Could you
sign up to write a documentation patch for the atomic ioctl that adds a
paragraph stating extremely clearly that this ioctl does not make hard
real time guarantees, but only best effort soft realtime, and even then
priority of the effort is focused entirely on the !ALLOW_MODESET case,
because that is the one users care about the most.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
