Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6CF392B9B
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0416B6EE5A;
	Thu, 27 May 2021 10:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7906EE5A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:19:35 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id b9so7146018ejc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2oaoMdwwqHyP1VY0M5lR7eWpfGhljXFbqm6gfD5iOQ4=;
 b=Dvr2IQ/DkNYG8WO88xqCVheHRbe3y4RyKjH9QTM2UJn+LRI0+IyHnAnvb0Hp4jKMJV
 i0cstXs+rBo1OSafSCKb2VSJSW7H+OPl28aZ4aUN9FFmV7Z4tv2y/HA5eUVktp6DzBCd
 FdGWAvkzRo8pup9KAToMAyzrALsCOf6b80BI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2oaoMdwwqHyP1VY0M5lR7eWpfGhljXFbqm6gfD5iOQ4=;
 b=b5mo9pA5xMiPFseAQYeaF+L1tMG80q0snnZ/oGgpAwLMxfwpCSMZbNBLiI4ioQtu1H
 GTMV3vDAuga/IKZFENI7o3iWxbju7UKyC/X7I3SrP2I4wEw79QUCqsjWahzCMHKLXNRH
 5xIT4nuf1K5id/pwIp+wxYSSzn8L5p0KcRle6TXd2VyKcIMBhNAgvvn+YdjhBOpqCzmH
 YeyVfPNLwA+CarawpKo8Knk5keaefCNRC6ippFwSUp+iRiuexLt03k0VRiAn5LoTd7w4
 LQXi8sNT2g7gFMvXG1/WF1O+2UrN78Jho7TOuGJ8wkrJGscLJFzrLDs03v+EnvBlXuBb
 6vug==
X-Gm-Message-State: AOAM531QsgGvDxoI/wqrR6kh/wM8N0jHCGyFoi17YD/Dk9qqsPkd1jL0
 xma4kH9vNjReeHM3zHF4lBWm5A==
X-Google-Smtp-Source: ABdhPJzFvyM2b+Iasn/r/iv8/FTO5Gu/Utk82F9yjlh41oULFq7Y82EGUcPeTH5iOnwWjNVdlThk8g==
X-Received: by 2002:a17:906:ac1:: with SMTP id
 z1mr3040224ejf.463.1622110773722; 
 Thu, 27 May 2021 03:19:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ju17sm767590ejc.72.2021.05.27.03.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:19:32 -0700 (PDT)
Date: Thu, 27 May 2021 12:19:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
Message-ID: <YK9yM3/62iSucORU@phenom.ffwll.local>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAOFGe95TZRw=ZpSwOKpwcxkxP_JRmEXpJn_26OS2ZPH0Mp5Kyg@mail.gmail.com>
 <CAPj87rOoVtc5dC12bBU+j6tdxHLh8fWGsPiemThBrY-=TjMx7Q@mail.gmail.com>
 <179ac18a598.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179ac18a598.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 11:32:49PM -0500, Jason Ekstrand wrote:
> On May 26, 2021 13:15:08 Daniel Stone <daniel@fooishbar.org> wrote:
> 
> > Hey,
> > 
> > On Wed, 26 May 2021 at 16:24, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > On Wed, May 26, 2021 at 6:09 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > > > Typing out the Wayland protocol isn't the hard bit. If we just need to
> > > > copy and sed syncobj to weirdsyncobj, no problem really, and it gives
> > > > us a six-month head start on painful compositor-internal surgery
> > > > whilst we work on common infrastructure to ship userspace fences
> > > > around (mappable dmabuf with the sync bracketing? FD where every
> > > > read() gives you the current value? memfd? other?).
> > > 
> > > I feel like I should elaborate more about timelines.  In my earlier
> > > reply, my commentary about timeline syncobj was mostly focused around
> > > helping people avoid typing.  That's not really the full story,
> > > though, and I hope more context will help.
> > > 
> > > First, let me say that timeline syncobj was designed as a mechanism to
> > > implement VK_KHR_timeline_semaphore without inserting future fences
> > > into the kernel.  It's entirely designed around the needs of Vulkan
> > > drivers, not really as a window-system primitive.  The semantics are
> > > designed around one driver communicating to another that new fences
> > > have been added and it's safe to kick off more rendering.  I'm not
> > > convinced that it's the right object for window-systems and I'm also
> > > not convinced that it's a good idea to try and make a version of it
> > > that's a wrapper around a userspace memory fence.  (I'm going to start
> > > typing UMF for userspace memory fence because it's long to type out.)
> > > 
> > > Why?  Well, the fundamental problem with timelines in general is
> > > trying to figure out when it's about to be done.  But timeline syncobj
> > > solves this for us!  It gives us this fancy super-useful ioctl!
> > > Right?  Uh.... not as well as I'd like.  Let's say we make a timeline
> > > syncobj that's a wrapper around a userspace memory fence.  What do we
> > > do with that ioctl?  As I mentioned above, the kernel doesn't have any
> > > clue when it will be triggered so that ioctl turns into an actual
> > > wait.  That's no good because it creates unnecessary stalls.
> > 
> > Yeah, I'm assuming that UMF will be a separate primitive. No problem.
> > I also think that your submitted/completed thing is a non-problem: at
> > this stage we're just throwing up our hands and admitting that we're
> > letting userspace tie itself in knots, and giving it the tools to tie
> > a sufficiently un-streetwise compositor in knots too. We're already
> > crossing that Rubicon, so let's just embrace it and not try to design
> > it out. Us compositors can handle the scheduling, really.
> 
> Ok, good. I think we're on the same page.
> 
> > 
> > > There's another potential solution here:  Have each UMF be two
> > > timelines: submitted and completed.  At the start of every batch
> > > that's supposed to trigger a UMF, we set the "submitted" side and
> > > then, when it completes, we set the "completed" side.  Ok, great, now
> > > we can get at the "about to be done" with the submitted side,
> > > implement the ioctl, and we're all good, right?  Sadly, no.  There's
> > > no guarantee about how long a "batch" takes.  So there's no universal
> > > timeout the kernel can apply.  Also, if it does time out, the kernel
> > > doesn't know who to blame for the timeout and how to prevent itself
> > > from getting in trouble again.  The compositor does so, in theory,
> > > given the right ioctls, it could detect the -ETIME and kill that
> > > client.  Not a great solution.
> > > 
> > > The best option I've been able to come up with for this is some sort
> > > of client-provided signal.  Something where it says, as part of submit
> > > or somewhere else, "I promise I'll be done soon" where that promise
> > > comes with dire consequences if it's not.  At that point, we can turn
> > > the UMF and a particular wait value into a one-shot fence like a
> > > dma_fence or sync_file, or signal a syncobj on it.  If it ever times
> > > out, we kick their context.  In Vulkan terminology, they get
> > > VK_ERROR_DEVICE_LOST.  There are two important bits here:  First, is
> > > that it's based on a client-provided thing.  With a fully timeline
> > > model and wait-before-signal, we can't infer when something is about
> > > to be done.  Only the client knows when it submitted its last node in
> > > the dependency graph and the whole mess is unblocked.  Second, is that
> > > the dma_fence is created within the client's driver context.  If it's
> > > created compositor-side, the kernel doesn't know who to blame if
> > > things go badly.  If we create it in the client, it's pretty easy to
> > > make context death on -ETIME part of the contract.
> > > 
> > > (Before danvet jumps in here and rants about how UMF -> dma_fence
> > > isn't possible, I haven't forgotten.  I'm pretending, for now, that
> > > we've solved some of those problems.)
> > 
> > Funny how we've come full circle to the original proposal here ...
> > 
> > If we really want a kernel primitive for this - and I think it's a
> > good idea, since can help surface 'badness' in a way which is
> > observable by e.g. session managers in a way analogous to cgroup stats
> > and controls - how about this for a counter-proposal? Client exports a
> > FD for its context/queue and sends it to winsys as part of setup,
> > compositor can ioctl() on that to kill it, which lands in the same
> > zap/zap/zap/zap/ban codepath as GPU hangs do today. It's a bigger
> > hammer than per-sync-point primitives, but you as a client have to
> > accept the social contract that if you want to participate in a
> > session, your context has to be making forward progress and you aren't
> > writing cheques the compositor can't cash.
> 
> The compositor already has that. It can kick the client's Wayland protocol
> connection. Banning the context from the kernel might be nice too but
> kicking it is probably sufficient.
> 
> Side-note to danvet: Do we need a plan for UMF with persistent contexts? My
> gut says that's a very bad idea but this made me think I should say least
> pose the question.

Yeah UMF ctx mode needs to require non-persisten ctx mode too or it just
goes horribly wrong everywhere.

> > I'm also going to pre-emptively agree with other-Dan; I'm extremely
> > wary of anything which tries to make UMF look even a little bit like
> > sync_file. The requirements to support them are so wildly different
> > that I'd almost rather a totally orthogonal interface so that there's
> > no danger of confusing the two. Us sophisticates on this thread can
> > eat the mild annoyance of typing out separate codepaths, but it's much
> > worse for anyone else who may look at a UMF wolf in dma_fence sheep's
> > clothing then only later be substantially more annoyed when they
> > realise that it's not anything like they thought it was.
> > 
> > So let's keep sync_file for what it is, and for UMF since the usage is
> > so radically different, build out whatever we do around making the
> > uAPI as useful as possible for what we want to do with it. The real
> > complexity in handling the difference between UMF and 'real' fences is
> > in how they behave, not in how they look.
> 
> Sounds good.
> 
> > 
> > > Another option is to just stall on the UMF until it's done.  Yeah,
> > > kind-of terrible and high-latency, but it always works and doesn't
> > > involve any complex logic to kill clients.  If a client never gets
> > > around to signaling a fence, it just never repaints.  The compositor
> > > keeps going like nothing's wrong.  Maybe, if the client submits lots
> > > of frames without ever triggering, it'll hit some max queue depth
> > > somewhere and kill it but that's it.  More likely, the client's
> > > vkAcquireNextImage will start timing out and it'll crash.
> > > 
> > > I suspect where we might actually land is some combination of the two
> > > depending on client choice.  If the client wants to be dumb, it gets
> > > the high-latency always-works path.  If the client really wants
> > > lowest-latency VRR, it has to take the smarter path and risk
> > > VK_ERROR_DEVICE_LOST if it misses too far.
> > 
> > We already have to handle unresponsive clients. If your browser
> > livelocks today (say because it's Chrome and you hotunplug your
> > monitor at the wrong time with active media playback in an inactive
> > tab in an inactive window ... hypothetically),
> 
> That's an oddly specific hypothetical...
> 
> > yourr Wayland server
> > notices that it isn't responding to pings, throws up the 'do you want
> > to force-quit?' dialog and kills the client; it's actually really
> > simple logic. So we just hook unsignaled fences up to the same. (And,
> > if we have the context-kill primitive, trigger that on our way out.)
> > 
> > So yeah, we already have all the complexity points to put particular
> > surface trees in limbo (thanks to subsurface sync mode), we already
> > have all the complexity points to separate realised surface trees from
> > pixels on screen, and we already have the complexity points for
> > different parts of the surface trees being rendered at different
> > times. Checking on fence progression is just a little more typing
> > around those interface points which already exist, and zapping clients
> > is utterly trivial.
> 
> 👍
> 
> > 
> > > But the point of all of this is, neither of the above two paths have
> > > anything to do with the compositor calling a "wait for submit" ioctl.
> > > Building a design around that and baking it into protocol is, IMO, a
> > > mistake.  I don't see any valid way to handle this mess without "wait
> > > for sumbit" either not existing or existing only client-side for the
> > > purposes of WSI.
> > 
> > I'm still on the fence (sorry) about a wait-before-submit ioctl. For
> > the sync_file-based timeline syncobjs that we have today, yes it is
> > helpful, and we do already have it, it's just the wrong shape in being
> > sleep rather than epoll.
> 
> I still don't see why we're still talking about timeline syncobj...
> 
> > For UMF, taking it as a given that the kernel really has no visibility
> > at all into syncpoint progress, then the kernel is conceptually a
> > worse place to spin-sleep than userspace is, because why account the
> > CPU burn to a kthread rather than a real PID, and lose
> > latency/efficiency on context switches when you do wake up?
> > 
> > But also, the kernel is conceptually the best place to spin-sleep,
> > because it can fuse waits and do better wakeup quantisation than
> > userspace can. And I'm still hopeful that the IHVs and Windows can
> > both step away from the postmodern 'synchronisation doesn't mean
> > anything anymore, just poll in a lap-burning loop' approach that we've
> > been presented (sorry) with, where we at least get doorbells which
> > allow the kernel to do polling much smarter than quantising timers
> > ('this fence might not have triggered yet, but _something_ happened
> > which might have triggered it so why not check?').
> 
> I think we can and do do something better than just poll on the memory. I'm
> not sure on the details but I've been told that we can set some sort of
> interrupt-like thing on the address so it's not actually a spin. Even
> without that, done hardware has some way that a command buffer can trigger
> an interrupt. If the protocol is to write memory and then trigger an
> interrupt rather than just write memory, that gives us something if a
> doorbell. Not as convenient, maybe, but it'd help with power consumption,
> etc.

Spoiler but the i915 plan is to indeed suck less than cpu spinning on
memory. The icky part is converting this into a protocol that can be used
across processes and stuff like that.
-Daniel

> 
> --Jason
> 
> > On the other other hand, the only winsys case for burning poll in a
> > tight loop is flipping as quickly as possible straight to a VRR
> > display. In that case, you're definitely running on mains power so
> > you're just melting the polar ice caps rather than your lap, and
> > you've got everything fully lit up anyway so the power cost of polling
> > is immaterial. For FRR, the compositor already has a fixed deadline at
> > which it will wake up and make a hard binding decision about which
> > image to present - this includes XR as well. So we don't have to worry
> > about optimising a polling loop, because there isn't one: we wake up
> > once, we check once, and if the client's missed then too bad, try
> > again next frame.
> > 
> > As you can see, much like userspace memory fences, my position on
> > which way to go here is not knowable upfront, and depends on when
> > exactly you observe it. Hopefully someone can come back with an
> > argument compelling enough either way that I have something better to
> > do than to try to pun my way out of having more hands than Ganesh. I
> > don't think it's material to the design or implementation of winsys
> > support though.
> > 
> > Cheers,
> > Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
