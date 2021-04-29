Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64336E968
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 13:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7659E6EE2A;
	Thu, 29 Apr 2021 11:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403EA6EE2A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 11:12:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so6445598wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3gJT26rHxGP2Kndi6EvtROLQPC/e9aeTHbneXMisIX0=;
 b=JJG13WxDle3tRUlmPh1pSsIwFjC1aOy/LyvIIXWJG5fZqlU+M9H0j+1RhbZoLpkoxu
 e2/V5O4FaaPm4rp53jJc7lPVK1EdCaYzf3nytjD+xiWiPJNcyK9KBEvIUeM615UirNmJ
 KG7O0nbDjvN9K9XdT17m6I3kmvtWQQJaLHGT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3gJT26rHxGP2Kndi6EvtROLQPC/e9aeTHbneXMisIX0=;
 b=kDaK+wXFArF23ka+RTm0IJo+76K4/DU7o3HXE7P9cM06MDPdP2mK69dC4x8sJHaMNW
 DaOVBEBNyRyZzmvEz+ZRscTmVhcGoiTQt5bMmqG7urR8Ef5/kLi0R2EH51/nnTWro8LL
 l9al0qtzTPqU2Kc0o903TQpLB6lIcWbpIqxvKXlCzlb1rE10Y1+wJ1eM8oAkSQpjDaBe
 jfp591/mOHuvcIo0dz6uUnkh+c/iYlioccTfQ8D4UYSf+/SvpDw4Z1j8sPJ78Msk0anB
 gcdSLZVpDjMXTUt4wnGB910SCwj6+rg6Okz007YsbBqhFOoPLtSHd3xIFOhNJ+LppSUG
 +E9A==
X-Gm-Message-State: AOAM533TTsOZWRMJxYeWoGvWiRFZGnMIBlRu4WnkdQmHkP+XFaau1kko
 IdIMucZspxP37mh5dK/aNlwM7w==
X-Google-Smtp-Source: ABdhPJximms8Pksu+1/XDejlLQ8Fmempva8Llqhm4eOoOI1tYGYTN2LIW/KWXYedkCNzagP5y8Fxfw==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr9887716wmi.86.1619694761858; 
 Thu, 29 Apr 2021 04:12:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y11sm3431757wmi.41.2021.04.29.04.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 04:12:41 -0700 (PDT)
Date: Thu, 29 Apr 2021 13:12:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIqUp6WpkbHJltZm@phenom.ffwll.local>
References: <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
 <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
 <YIlTYjNv5RI5GuiN@phenom.ffwll.local>
 <YIlUWdxyXGQgHFj+@phenom.ffwll.local>
 <72f21ab9-9376-b366-2b69-94ea65e332c1@gmail.com>
 <YIlkgRDQDe+E558E@phenom.ffwll.local>
 <f6ec3ce6-2efe-cd76-4a54-aba6c8d0cc4c@gmail.com>
 <YIlykcjDV9ckeyyG@phenom.ffwll.local>
 <CADnq5_MJgq40-YscW8bDmUkb_WyuZOXPtdm2ErEyvmnv=2pBHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MJgq40-YscW8bDmUkb_WyuZOXPtdm2ErEyvmnv=2pBHQ@mail.gmail.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 04:39:24PM -0400, Alex Deucher wrote:
> On Wed, Apr 28, 2021 at 10:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Apr 28, 2021 at 03:37:49PM +0200, Christian K=F6nig wrote:
> > > Am 28.04.21 um 15:34 schrieb Daniel Vetter:
> > > > On Wed, Apr 28, 2021 at 03:11:27PM +0200, Christian K=F6nig wrote:
> > > > > Am 28.04.21 um 14:26 schrieb Daniel Vetter:
> > > > > > On Wed, Apr 28, 2021 at 02:21:54PM +0200, Daniel Vetter wrote:
> > > > > > > On Wed, Apr 28, 2021 at 12:31:09PM +0200, Christian K=F6nig w=
rote:
> > > > > > > > Am 28.04.21 um 12:05 schrieb Daniel Vetter:
> > > > > > > > > On Tue, Apr 27, 2021 at 02:01:20PM -0400, Alex Deucher wr=
ote:
> > > > > > > > > > On Tue, Apr 27, 2021 at 1:35 PM Simon Ser <contact@emer=
sion.fr> wrote:
> > > > > > > > > > > On Tuesday, April 27th, 2021 at 7:31 PM, Lucas Stach =
<l.stach@pengutronix.de> wrote:
> > > > > > > > > > >
> > > > > > > > > > > > > Ok. So that would only make the following use cas=
es broken for now:
> > > > > > > > > > > > >
> > > > > > > > > > > > > - amd render -> external gpu
> > > > > > > > > > > > > - amd video encode -> network device
> > > > > > > > > > > > FWIW, "only" breaking amd render -> external gpu wi=
ll make us pretty
> > > > > > > > > > > > unhappy
> > > > > > > > > > > I concur. I have quite a few users with a multi-GPU s=
etup involving
> > > > > > > > > > > AMD hardware.
> > > > > > > > > > >
> > > > > > > > > > > Note, if this brokenness can't be avoided, I'd prefer=
 a to get a clear
> > > > > > > > > > > error, and not bad results on screen because nothing =
is synchronized
> > > > > > > > > > > anymore.
> > > > > > > > > > It's an upcoming requirement for windows[1], so you are=
 likely to
> > > > > > > > > > start seeing this across all GPU vendors that support w=
indows.  I
> > > > > > > > > > think the timing depends on how quickly the legacy hard=
ware support
> > > > > > > > > > sticks around for each vendor.
> > > > > > > > > Yeah but hw scheduling doesn't mean the hw has to be cons=
tructed to not
> > > > > > > > > support isolating the ringbuffer at all.
> > > > > > > > >
> > > > > > > > > E.g. even if the hw loses the bit to put the ringbuffer o=
utside of the
> > > > > > > > > userspace gpu vm, if you have pagetables I'm seriously ho=
ping you have r/o
> > > > > > > > > pte flags. Otherwise the entire "share address space with=
 cpu side,
> > > > > > > > > seamlessly" thing is out of the window.
> > > > > > > > >
> > > > > > > > > And with that r/o bit on the ringbuffer you can once more=
 force submit
> > > > > > > > > through kernel space, and all the legacy dma_fence based =
stuff keeps
> > > > > > > > > working. And we don't have to invent some horrendous user=
space fence based
> > > > > > > > > implicit sync mechanism in the kernel, but can instead do=
 this transition
> > > > > > > > > properly with drm_syncobj timeline explicit sync and prot=
ocol reving.
> > > > > > > > >
> > > > > > > > > At least I think you'd have to work extra hard to create =
a gpu which
> > > > > > > > > cannot possibly be intercepted by the kernel, even when i=
t's designed to
> > > > > > > > > support userspace direct submit only.
> > > > > > > > >
> > > > > > > > > Or are your hw engineers more creative here and we're scr=
ewed?
> > > > > > > > The upcomming hardware generation will have this hardware s=
cheduler as a
> > > > > > > > must have, but there are certain ways we can still stick to=
 the old
> > > > > > > > approach:
> > > > > > > >
> > > > > > > > 1. The new hardware scheduler currently still supports kern=
el queues which
> > > > > > > > essentially is the same as the old hardware ring buffer.
> > > > > > > >
> > > > > > > > 2. Mapping the top level ring buffer into the VM at least p=
artially solves
> > > > > > > > the problem. This way you can't manipulate the ring buffer =
content, but the
> > > > > > > > location for the fence must still be writeable.
> > > > > > > Yeah allowing userspace to lie about completion fences in thi=
s model is
> > > > > > > ok. Though I haven't thought through full consequences of tha=
t, but I
> > > > > > > think it's not any worse than userspace lying about which buf=
fers/address
> > > > > > > it uses in the current model - we rely on hw vm ptes to catch=
 that stuff.
> > > > > > >
> > > > > > > Also it might be good to switch to a non-recoverable ctx mode=
l for these.
> > > > > > > That's already what we do in i915 (opt-in, but all current um=
d use that
> > > > > > > mode). So any hang/watchdog just kills the entire ctx and you=
 don't have
> > > > > > > to worry about userspace doing something funny with it's ring=
buffer.
> > > > > > > Simplifies everything.
> > > > > > >
> > > > > > > Also ofc userspace fencing still disallowed, but since usersp=
ace would
> > > > > > > queu up all writes to its ringbuffer through the drm/schedule=
r, we'd
> > > > > > > handle dependencies through that still. Not great, but workab=
le.
> > > > > > >
> > > > > > > Thinking about this, not even mapping the ringbuffer r/o is r=
equired, it's
> > > > > > > just that we must queue things throug the kernel to resolve d=
ependencies
> > > > > > > and everything without breaking dma_fence. If userspace lies,=
 tdr will
> > > > > > > shoot it and the kernel stops running that context entirely.
> > > > > Thinking more about that approach I don't think that it will work=
 correctly.
> > > > >
> > > > > See we not only need to write the fence as signal that an IB is s=
ubmitted,
> > > > > but also adjust a bunch of privileged hardware registers.
> > > > >
> > > > > When userspace could do that from its IBs as well then there is n=
othing
> > > > > blocking it from reprogramming the page table base address for ex=
ample.
> > > > >
> > > > > We could do those writes with the CPU as well, but that would be =
a huge
> > > > > performance drop because of the additional latency.
> > > > That's not what I'm suggesting. I'm suggesting you have the queue a=
nd
> > > > everything in userspace, like in wondows. Fences are exactly handle=
d like
> > > > on windows too. The difference is:
> > > >
> > > > - All new additions to the ringbuffer are done through a kernel ioc=
tl
> > > >    call, using the drm/scheduler to resolve dependencies.
> > > >
> > > > - Memory management is also done like today int that ioctl.
> > > >
> > > > - TDR makes sure that if userspace abuses the contract (which it ca=
n, but
> > > >    it can do that already today because there's also no command par=
ser to
> > > >    e.g. stop gpu semaphores) the entire context is shot and termina=
lly
> > > >    killed. Userspace has to then set up a new one. This isn't how a=
mdgpu
> > > >    recovery works right now, but i915 supports it and I think it's =
also the
> > > >    better model for userspace error recovery anyway.
> > > >
> > > > So from hw pov this will look _exactly_ like windows, except we nev=
er page
> > > > fault.
> > > >
> > > >  From sw pov this will look _exactly_ like current kernel ringbuf m=
odel,
> > > > with exactly same dma_fence semantics. If userspace lies, does some=
thing
> > > > stupid or otherwise breaks the uapi contract, vm ptes stop invalid =
access
> > > > and tdr kills it if it takes too long.
> > > >
> > > > Where do you need priviledge IB writes or anything like that?
> > >
> > > For writing the fence value and setting up the priority and VM regist=
ers.
> >
> > I'm confused. How does this work on windows then with pure userspace
> > submit? Windows userspace sets its priorties and vm registers itself fr=
om
> > userspace?
> =

> When the user allocates usermode queues, the kernel driver sets up a
> queue descriptor in the kernel which defines the location of the queue
> in memory, what priority it has, what page tables it should use, etc.
> User mode can then start writing commands to its queues.  When they
> are ready for the hardware to start executing them, they ring a
> doorbell which signals the scheduler and it maps the queue descriptors
> to HW queue slots and they start executing.  The user only has access
> to it's queues and any buffers it has mapped in it's GPU virtual
> address space.  While the queues are scheduled, the user can keep
> submitting work to them and they will keep executing unless they get
> preempted by the scheduler due to oversubscription or a priority call
> or a request from the kernel driver to preempt, etc.

Yeah, works like with our stuff.

I don't see a problem tbh. It's slightly silly going the detour with the
kernel ioctl, and it's annoying that you still have to use drm/scheduler
to resolve dependencies instead of gpu semaphores and all that. But this
only applies to legacy winsys mode, compute (e.g. vk without winsys) can
use the full power. Just needs a flag or something when setting up the
context.

And best part is that from hw pov this really is indistinguishable from
the full on userspace submit model.

The thing where it gets annoying is when you use one of these new cpu
instructions which do direct submit to hw and pass along the pasid id
behind the scenes. That's truly something you can't intercept anymore in
the kernel and fake the legacy dma_fence world.

But what you're describing here sounds like bog standard stuff, and also
pretty easy to keep working with exactly the current model.

Ofc we'll want to push forward a more modern model that better suits
modern gpus, but I don't see any hard requirement here from the hw side.

Cheers, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
