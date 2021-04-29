Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A70E36E957
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 13:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86B36EE1A;
	Thu, 29 Apr 2021 11:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCBC6EE20
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 11:08:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d11so8614273wrw.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZAaotAMMYnhNHkdhATxf4w36dSwjHSP06XA94KNSxCI=;
 b=LKDDdz1NxNuOY1oEzLaNb5oN66Rck/pGPt09rSvHNo6RwuAGRR/X417VYIhOa+q1Ci
 7V1aL5NcnuNW3ezaL/P9e34RWHyAunTS0jV31Lr3P/0YXfXjBEWg+IkGRXxWB50VM4mE
 YhHaKjp87GcEbyfRcUObo2aCVPmJbsVX/c3hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZAaotAMMYnhNHkdhATxf4w36dSwjHSP06XA94KNSxCI=;
 b=MiV3OEKpUv/mkXEFgSWakvzw97pXFnblAbApQAzmHBWgc5GQ1jWd5L9ydbhnz9wrkT
 LY2Szx6uzQXd5oZFTB37xctX5WeEf3JEUWaSQwNb3KcNgjCH9dC2zmlyiEGtUXngBNNS
 48j74m3PkgabmKHv9jH3JAWLpW5eBnbLhmb2QXsgmiwzhnChIDbS7msIyUvWRJNpmgPq
 UTyfBM7C5OPBfhgdCaWV1pGraPQVi5EJzwpc7T64IS3jJci4a8v7BqUr8HKcFphFpSbL
 xQIDKwFExjMsEKQDYDQshXZnMOyQJS7JEeN5oxz06WbG7SOUiMMX8IMrlRis5Dj77afF
 OZ0A==
X-Gm-Message-State: AOAM533ulgLpP25VEJRX2Ghh2orBFfublXUlS3QGVPdhsMSBQsLNy47n
 X0bMbFW1zMDkh7Wz6kP4sx2D/qsWmyyErQ==
X-Google-Smtp-Source: ABdhPJyn3Dk9W0aawu6ayWq+xJyK1fdxRtB/58Xw4jTulILakd6P4LFn42v4FMpQ9z6vF9tSqNDBkw==
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr21632843wrt.377.1619694480380; 
 Thu, 29 Apr 2021 04:08:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t10sm7214482wmf.16.2021.04.29.04.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 04:07:59 -0700 (PDT)
Date: Thu, 29 Apr 2021 13:07:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIqTjSV7013gej31@phenom.ffwll.local>
References: <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
 <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
 <YIlTYjNv5RI5GuiN@phenom.ffwll.local>
 <YIlUWdxyXGQgHFj+@phenom.ffwll.local>
 <72f21ab9-9376-b366-2b69-94ea65e332c1@gmail.com>
 <YIlkgRDQDe+E558E@phenom.ffwll.local>
 <f6ec3ce6-2efe-cd76-4a54-aba6c8d0cc4c@gmail.com>
 <YIlykcjDV9ckeyyG@phenom.ffwll.local>
 <2999127d-d1d9-ea39-d32b-a607fd8408d3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2999127d-d1d9-ea39-d32b-a607fd8408d3@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 04:45:01PM +0200, Christian K=F6nig wrote:
> Am 28.04.21 um 16:34 schrieb Daniel Vetter:
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
> > > > > > > > > > > =

> > > > > > > > > > > > > Ok. So that would only make the following use cas=
es broken for now:
> > > > > > > > > > > > > =

> > > > > > > > > > > > > - amd render -> external gpu
> > > > > > > > > > > > > - amd video encode -> network device
> > > > > > > > > > > > FWIW, "only" breaking amd render -> external gpu wi=
ll make us pretty
> > > > > > > > > > > > unhappy
> > > > > > > > > > > I concur. I have quite a few users with a multi-GPU s=
etup involving
> > > > > > > > > > > AMD hardware.
> > > > > > > > > > > =

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
> > > > > > > > > =

> > > > > > > > > E.g. even if the hw loses the bit to put the ringbuffer o=
utside of the
> > > > > > > > > userspace gpu vm, if you have pagetables I'm seriously ho=
ping you have r/o
> > > > > > > > > pte flags. Otherwise the entire "share address space with=
 cpu side,
> > > > > > > > > seamlessly" thing is out of the window.
> > > > > > > > > =

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
> > > > > > > > > =

> > > > > > > > > At least I think you'd have to work extra hard to create =
a gpu which
> > > > > > > > > cannot possibly be intercepted by the kernel, even when i=
t's designed to
> > > > > > > > > support userspace direct submit only.
> > > > > > > > > =

> > > > > > > > > Or are your hw engineers more creative here and we're scr=
ewed?
> > > > > > > > The upcomming hardware generation will have this hardware s=
cheduler as a
> > > > > > > > must have, but there are certain ways we can still stick to=
 the old
> > > > > > > > approach:
> > > > > > > > =

> > > > > > > > 1. The new hardware scheduler currently still supports kern=
el queues which
> > > > > > > > essentially is the same as the old hardware ring buffer.
> > > > > > > > =

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
> > > > > > > =

> > > > > > > Also it might be good to switch to a non-recoverable ctx mode=
l for these.
> > > > > > > That's already what we do in i915 (opt-in, but all current um=
d use that
> > > > > > > mode). So any hang/watchdog just kills the entire ctx and you=
 don't have
> > > > > > > to worry about userspace doing something funny with it's ring=
buffer.
> > > > > > > Simplifies everything.
> > > > > > > =

> > > > > > > Also ofc userspace fencing still disallowed, but since usersp=
ace would
> > > > > > > queu up all writes to its ringbuffer through the drm/schedule=
r, we'd
> > > > > > > handle dependencies through that still. Not great, but workab=
le.
> > > > > > > =

> > > > > > > Thinking about this, not even mapping the ringbuffer r/o is r=
equired, it's
> > > > > > > just that we must queue things throug the kernel to resolve d=
ependencies
> > > > > > > and everything without breaking dma_fence. If userspace lies,=
 tdr will
> > > > > > > shoot it and the kernel stops running that context entirely.
> > > > > Thinking more about that approach I don't think that it will work=
 correctly.
> > > > > =

> > > > > See we not only need to write the fence as signal that an IB is s=
ubmitted,
> > > > > but also adjust a bunch of privileged hardware registers.
> > > > > =

> > > > > When userspace could do that from its IBs as well then there is n=
othing
> > > > > blocking it from reprogramming the page table base address for ex=
ample.
> > > > > =

> > > > > We could do those writes with the CPU as well, but that would be =
a huge
> > > > > performance drop because of the additional latency.
> > > > That's not what I'm suggesting. I'm suggesting you have the queue a=
nd
> > > > everything in userspace, like in wondows. Fences are exactly handle=
d like
> > > > on windows too. The difference is:
> > > > =

> > > > - All new additions to the ringbuffer are done through a kernel ioc=
tl
> > > >     call, using the drm/scheduler to resolve dependencies.
> > > > =

> > > > - Memory management is also done like today int that ioctl.
> > > > =

> > > > - TDR makes sure that if userspace abuses the contract (which it ca=
n, but
> > > >     it can do that already today because there's also no command pa=
rser to
> > > >     e.g. stop gpu semaphores) the entire context is shot and termin=
ally
> > > >     killed. Userspace has to then set up a new one. This isn't how =
amdgpu
> > > >     recovery works right now, but i915 supports it and I think it's=
 also the
> > > >     better model for userspace error recovery anyway.
> > > > =

> > > > So from hw pov this will look _exactly_ like windows, except we nev=
er page
> > > > fault.
> > > > =

> > > >   From sw pov this will look _exactly_ like current kernel ringbuf =
model,
> > > > with exactly same dma_fence semantics. If userspace lies, does some=
thing
> > > > stupid or otherwise breaks the uapi contract, vm ptes stop invalid =
access
> > > > and tdr kills it if it takes too long.
> > > > =

> > > > Where do you need priviledge IB writes or anything like that?
> > > For writing the fence value and setting up the priority and VM regist=
ers.
> > I'm confused. How does this work on windows then with pure userspace
> > submit? Windows userspace sets its priorties and vm registers itself fr=
om
> > userspace?
> =

> The priorities and VM registers are setup from the hw scheduler on window=
s,
> but this comes with preemption again.

The thing is, if the hw scheduler preempts your stuff a bit occasionally,
what's the problem? Essentially it just looks like each context is it's
own queue that can make forward progress.

Also, I'm assuming there's some way in the windows model to make sure that
unpriviledged userspace can't change the vm registers and priorities
itself. Those work the same in both worlds.

> And just letting the kernel write to the ring buffer hast the same proble=
ms
> as userspace fences. E.g. userspace could just overwrite the command which
> write the fence value with NOPs.
> =

> In other words we certainly need some kind of protection for the ring
> buffer, e.g. setting it readonly and making sure that it can always write
> the fence and is never preempted by the HW scheduler. But that protection
> breaks our neck at different places again.

My point is: You don't need protection. With the current cs ioctl
userspace can already do all kinds of nasty stuff and break itself. gpu
pagetables and TDR make sure nothing bad happens.

So imo you don't actually need to protected anything in the ring, as long
as you don't bother supporting recoverable TDR. You just declare the
entire ring shot and ask userspace to set up a new one.

> That solution could maybe work, but it is certainly not something we have
> tested.

Again, you can run the entire hw like on windows. The only thing you add
on top is that new stuff gets added to the userspace ring through the
kernel, so that the kernel can make sure all the resulting dma_fence are
still properly ordered, wont deadlock and will complete in due time (using
TDR). Also, the entire memory management works like now, but from a hw
point of view that's also not different. It just means that page faults
are never fixed, but the response is always that there's really no page
present at that slot.

I'm really not seeing the fundamental problem, nor why exactly you need a
completely different hw model here.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
