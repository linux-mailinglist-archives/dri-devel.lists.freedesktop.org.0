Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFEF36D9A5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 16:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCC76E0E8;
	Wed, 28 Apr 2021 14:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73696E0EA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:35:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h4so54280763wrt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=haLp70xnLqNhMUJbPRDrb78LFL/5gXA/9T5h3oLeWM0=;
 b=f7qx5f+CmP8GqEBbBYbFn3ayOqEyRtnZYCA9z6h+AnmQTb+IQH0HD3rgli2nv/F9E1
 9UeFUnjXoIXrNnIg9TIFhNU5uCF65KxXumteHmK8K5rDBd1pC0NC3V5Mbyi2CGHUepXJ
 nKrl56iKYj0rZ7tQ2gtahiB2K/QwscaXvMN38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=haLp70xnLqNhMUJbPRDrb78LFL/5gXA/9T5h3oLeWM0=;
 b=By9j6a18KROgu78DijVCVzG16yzSYf9WWCg4iBl+1FpfwmZ3mlen06F+Xn6/qMB0xN
 eeC3q+qr0gWwn4dXyBE+7/zMn315m8rEkBhOZ/cJ23M4L1tDiSgH/FD5U1XjM7GxqoKK
 H7FIuppi6+e4h39vpSGTRKZGujo9hcw8OlgNWdgE7996AGdF8CrhCbPvEyqxzXWNAXOm
 m1QX8w1D9zLCgBy8uRt8I1dN4Y77yFXOJdKl5j0NkmEQ9JTNN8IS8+BgDBt7LsSyyvyU
 87kAHRIbAgE5XgCOS1qhQRB0Zl2XG5chPI9VJVZNZBTFsq2K18galVomoUDnbgYgkMFO
 OMng==
X-Gm-Message-State: AOAM533bQRr6UNCvMhLTrsIECS8n1gvzR9PdFZF21/Ff0mKyykylC2yH
 6oML6Yc2squovB1y9/H4zzSZWA==
X-Google-Smtp-Source: ABdhPJyVnUngOABBMBNZFWAXqBnipo5Y2/J5/sRUlVLrYPvXxu3s5u/dfkYw9IGIDEI+9MINEWOAKg==
X-Received: by 2002:adf:d223:: with SMTP id k3mr2964389wrh.99.1619620500449;
 Wed, 28 Apr 2021 07:35:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t17sm3886252wmq.12.2021.04.28.07.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:34:59 -0700 (PDT)
Date: Wed, 28 Apr 2021 16:34:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIlykcjDV9ckeyyG@phenom.ffwll.local>
References: <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
 <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
 <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
 <YIlTYjNv5RI5GuiN@phenom.ffwll.local>
 <YIlUWdxyXGQgHFj+@phenom.ffwll.local>
 <72f21ab9-9376-b366-2b69-94ea65e332c1@gmail.com>
 <YIlkgRDQDe+E558E@phenom.ffwll.local>
 <f6ec3ce6-2efe-cd76-4a54-aba6c8d0cc4c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6ec3ce6-2efe-cd76-4a54-aba6c8d0cc4c@gmail.com>
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

On Wed, Apr 28, 2021 at 03:37:49PM +0200, Christian K=F6nig wrote:
> Am 28.04.21 um 15:34 schrieb Daniel Vetter:
> > On Wed, Apr 28, 2021 at 03:11:27PM +0200, Christian K=F6nig wrote:
> > > Am 28.04.21 um 14:26 schrieb Daniel Vetter:
> > > > On Wed, Apr 28, 2021 at 02:21:54PM +0200, Daniel Vetter wrote:
> > > > > On Wed, Apr 28, 2021 at 12:31:09PM +0200, Christian K=F6nig wrote:
> > > > > > Am 28.04.21 um 12:05 schrieb Daniel Vetter:
> > > > > > > On Tue, Apr 27, 2021 at 02:01:20PM -0400, Alex Deucher wrote:
> > > > > > > > On Tue, Apr 27, 2021 at 1:35 PM Simon Ser <contact@emersion=
.fr> wrote:
> > > > > > > > > On Tuesday, April 27th, 2021 at 7:31 PM, Lucas Stach <l.s=
tach@pengutronix.de> wrote:
> > > > > > > > > =

> > > > > > > > > > > Ok. So that would only make the following use cases b=
roken for now:
> > > > > > > > > > > =

> > > > > > > > > > > - amd render -> external gpu
> > > > > > > > > > > - amd video encode -> network device
> > > > > > > > > > FWIW, "only" breaking amd render -> external gpu will m=
ake us pretty
> > > > > > > > > > unhappy
> > > > > > > > > I concur. I have quite a few users with a multi-GPU setup=
 involving
> > > > > > > > > AMD hardware.
> > > > > > > > > =

> > > > > > > > > Note, if this brokenness can't be avoided, I'd prefer a t=
o get a clear
> > > > > > > > > error, and not bad results on screen because nothing is s=
ynchronized
> > > > > > > > > anymore.
> > > > > > > > It's an upcoming requirement for windows[1], so you are lik=
ely to
> > > > > > > > start seeing this across all GPU vendors that support windo=
ws.  I
> > > > > > > > think the timing depends on how quickly the legacy hardware=
 support
> > > > > > > > sticks around for each vendor.
> > > > > > > Yeah but hw scheduling doesn't mean the hw has to be construc=
ted to not
> > > > > > > support isolating the ringbuffer at all.
> > > > > > > =

> > > > > > > E.g. even if the hw loses the bit to put the ringbuffer outsi=
de of the
> > > > > > > userspace gpu vm, if you have pagetables I'm seriously hoping=
 you have r/o
> > > > > > > pte flags. Otherwise the entire "share address space with cpu=
 side,
> > > > > > > seamlessly" thing is out of the window.
> > > > > > > =

> > > > > > > And with that r/o bit on the ringbuffer you can once more for=
ce submit
> > > > > > > through kernel space, and all the legacy dma_fence based stuf=
f keeps
> > > > > > > working. And we don't have to invent some horrendous userspac=
e fence based
> > > > > > > implicit sync mechanism in the kernel, but can instead do thi=
s transition
> > > > > > > properly with drm_syncobj timeline explicit sync and protocol=
 reving.
> > > > > > > =

> > > > > > > At least I think you'd have to work extra hard to create a gp=
u which
> > > > > > > cannot possibly be intercepted by the kernel, even when it's =
designed to
> > > > > > > support userspace direct submit only.
> > > > > > > =

> > > > > > > Or are your hw engineers more creative here and we're screwed?
> > > > > > The upcomming hardware generation will have this hardware sched=
uler as a
> > > > > > must have, but there are certain ways we can still stick to the=
 old
> > > > > > approach:
> > > > > > =

> > > > > > 1. The new hardware scheduler currently still supports kernel q=
ueues which
> > > > > > essentially is the same as the old hardware ring buffer.
> > > > > > =

> > > > > > 2. Mapping the top level ring buffer into the VM at least parti=
ally solves
> > > > > > the problem. This way you can't manipulate the ring buffer cont=
ent, but the
> > > > > > location for the fence must still be writeable.
> > > > > Yeah allowing userspace to lie about completion fences in this mo=
del is
> > > > > ok. Though I haven't thought through full consequences of that, b=
ut I
> > > > > think it's not any worse than userspace lying about which buffers=
/address
> > > > > it uses in the current model - we rely on hw vm ptes to catch tha=
t stuff.
> > > > > =

> > > > > Also it might be good to switch to a non-recoverable ctx model fo=
r these.
> > > > > That's already what we do in i915 (opt-in, but all current umd us=
e that
> > > > > mode). So any hang/watchdog just kills the entire ctx and you don=
't have
> > > > > to worry about userspace doing something funny with it's ringbuff=
er.
> > > > > Simplifies everything.
> > > > > =

> > > > > Also ofc userspace fencing still disallowed, but since userspace =
would
> > > > > queu up all writes to its ringbuffer through the drm/scheduler, w=
e'd
> > > > > handle dependencies through that still. Not great, but workable.
> > > > > =

> > > > > Thinking about this, not even mapping the ringbuffer r/o is requi=
red, it's
> > > > > just that we must queue things throug the kernel to resolve depen=
dencies
> > > > > and everything without breaking dma_fence. If userspace lies, tdr=
 will
> > > > > shoot it and the kernel stops running that context entirely.
> > > Thinking more about that approach I don't think that it will work cor=
rectly.
> > > =

> > > See we not only need to write the fence as signal that an IB is submi=
tted,
> > > but also adjust a bunch of privileged hardware registers.
> > > =

> > > When userspace could do that from its IBs as well then there is nothi=
ng
> > > blocking it from reprogramming the page table base address for exampl=
e.
> > > =

> > > We could do those writes with the CPU as well, but that would be a hu=
ge
> > > performance drop because of the additional latency.
> > That's not what I'm suggesting. I'm suggesting you have the queue and
> > everything in userspace, like in wondows. Fences are exactly handled li=
ke
> > on windows too. The difference is:
> > =

> > - All new additions to the ringbuffer are done through a kernel ioctl
> >    call, using the drm/scheduler to resolve dependencies.
> > =

> > - Memory management is also done like today int that ioctl.
> > =

> > - TDR makes sure that if userspace abuses the contract (which it can, b=
ut
> >    it can do that already today because there's also no command parser =
to
> >    e.g. stop gpu semaphores) the entire context is shot and terminally
> >    killed. Userspace has to then set up a new one. This isn't how amdgpu
> >    recovery works right now, but i915 supports it and I think it's also=
 the
> >    better model for userspace error recovery anyway.
> > =

> > So from hw pov this will look _exactly_ like windows, except we never p=
age
> > fault.
> > =

> >  From sw pov this will look _exactly_ like current kernel ringbuf model,
> > with exactly same dma_fence semantics. If userspace lies, does something
> > stupid or otherwise breaks the uapi contract, vm ptes stop invalid acce=
ss
> > and tdr kills it if it takes too long.
> > =

> > Where do you need priviledge IB writes or anything like that?
> =

> For writing the fence value and setting up the priority and VM registers.

I'm confused. How does this work on windows then with pure userspace
submit? Windows userspace sets its priorties and vm registers itself from
userspace?
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
