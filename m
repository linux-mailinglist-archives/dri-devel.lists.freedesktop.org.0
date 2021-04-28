Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019E36D736
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 14:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD3E6EB17;
	Wed, 28 Apr 2021 12:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AF589895
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:26:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m9so50090962wrx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=S9fEPkpv39qnzNTkbss82YYRcZ3m/9ykZvObsN+i3z4=;
 b=DxGwQ5pwORfxz6UYWg9sIzDN9k1wBuxULd43+DuWZir5G1Tc6E1bRa00eW7R9W9Qna
 tuxbD9NdxINbMfl9nfPPpSpWjP8jYIcrTn8n4dQism1wYewOK3tYnaG6AeZA+7AS/t0B
 KMFrJZJigCsu+EC+5iTDKogrJrFjhYKZSm5w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S9fEPkpv39qnzNTkbss82YYRcZ3m/9ykZvObsN+i3z4=;
 b=DNZUHG20/knDr3OnOkkV6tFRjkn3SZ+e9UEM9aGlAVIy4xZ45hNGctJS9IBvm7TMRq
 MAmZw1soqklNwPkGD58Ff17ElOOhxflK/RMsDsuzDpKU8+4AEJHOKN/7txrtSGm962Vv
 blteqiraV694FFdjdaARAeQTXHgnzKklcE4oVQwwwhp7IAByjqVrjWdKg07TdQXm0M05
 T396rDPeczXGqzbHFEak/pu9fRBAyLUA2tOYPWMVPNTET5J8epJ2tixIXHpsdG1GY3Ou
 V8BAacH40KeoNODVC5H0Jl2NM2TvbcWsLM3+5yFYR6/P4M/4F7xafUe5oYcGDhPs7fA1
 kVLw==
X-Gm-Message-State: AOAM530qVPpCShtL5g7Pzt4Id/O1HAg1WAROmWMC7Hq8ESI14roHzfFz
 qwj0pp+qyK2dm70H1VXryAiJfQ==
X-Google-Smtp-Source: ABdhPJyj8ppP+T9T+9LqFlmScKBZ3crukvErixVPhCF4D7SBFUBd//RTL7Q/jkLShAVpfFZo+i7svQ==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr832018wrs.264.1619612763503;
 Wed, 28 Apr 2021 05:26:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u6sm3555353wml.6.2021.04.28.05.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:26:02 -0700 (PDT)
Date: Wed, 28 Apr 2021 14:26:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YIlUWdxyXGQgHFj+@phenom.ffwll.local>
References: <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
 <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
 <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
 <YIlTYjNv5RI5GuiN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIlTYjNv5RI5GuiN@phenom.ffwll.local>
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

On Wed, Apr 28, 2021 at 02:21:54PM +0200, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 12:31:09PM +0200, Christian K=F6nig wrote:
> > Am 28.04.21 um 12:05 schrieb Daniel Vetter:
> > > On Tue, Apr 27, 2021 at 02:01:20PM -0400, Alex Deucher wrote:
> > > > On Tue, Apr 27, 2021 at 1:35 PM Simon Ser <contact@emersion.fr> wro=
te:
> > > > > On Tuesday, April 27th, 2021 at 7:31 PM, Lucas Stach <l.stach@pen=
gutronix.de> wrote:
> > > > > =

> > > > > > > Ok. So that would only make the following use cases broken fo=
r now:
> > > > > > > =

> > > > > > > - amd render -> external gpu
> > > > > > > - amd video encode -> network device
> > > > > > FWIW, "only" breaking amd render -> external gpu will make us p=
retty
> > > > > > unhappy
> > > > > I concur. I have quite a few users with a multi-GPU setup involvi=
ng
> > > > > AMD hardware.
> > > > > =

> > > > > Note, if this brokenness can't be avoided, I'd prefer a to get a =
clear
> > > > > error, and not bad results on screen because nothing is synchroni=
zed
> > > > > anymore.
> > > > It's an upcoming requirement for windows[1], so you are likely to
> > > > start seeing this across all GPU vendors that support windows.  I
> > > > think the timing depends on how quickly the legacy hardware support
> > > > sticks around for each vendor.
> > > Yeah but hw scheduling doesn't mean the hw has to be constructed to n=
ot
> > > support isolating the ringbuffer at all.
> > > =

> > > E.g. even if the hw loses the bit to put the ringbuffer outside of the
> > > userspace gpu vm, if you have pagetables I'm seriously hoping you hav=
e r/o
> > > pte flags. Otherwise the entire "share address space with cpu side,
> > > seamlessly" thing is out of the window.
> > > =

> > > And with that r/o bit on the ringbuffer you can once more force submit
> > > through kernel space, and all the legacy dma_fence based stuff keeps
> > > working. And we don't have to invent some horrendous userspace fence =
based
> > > implicit sync mechanism in the kernel, but can instead do this transi=
tion
> > > properly with drm_syncobj timeline explicit sync and protocol reving.
> > > =

> > > At least I think you'd have to work extra hard to create a gpu which
> > > cannot possibly be intercepted by the kernel, even when it's designed=
 to
> > > support userspace direct submit only.
> > > =

> > > Or are your hw engineers more creative here and we're screwed?
> > =

> > The upcomming hardware generation will have this hardware scheduler as a
> > must have, but there are certain ways we can still stick to the old
> > approach:
> > =

> > 1. The new hardware scheduler currently still supports kernel queues wh=
ich
> > essentially is the same as the old hardware ring buffer.
> > =

> > 2. Mapping the top level ring buffer into the VM at least partially sol=
ves
> > the problem. This way you can't manipulate the ring buffer content, but=
 the
> > location for the fence must still be writeable.
> =

> Yeah allowing userspace to lie about completion fences in this model is
> ok. Though I haven't thought through full consequences of that, but I
> think it's not any worse than userspace lying about which buffers/address
> it uses in the current model - we rely on hw vm ptes to catch that stuff.
> =

> Also it might be good to switch to a non-recoverable ctx model for these.
> That's already what we do in i915 (opt-in, but all current umd use that
> mode). So any hang/watchdog just kills the entire ctx and you don't have
> to worry about userspace doing something funny with it's ringbuffer.
> Simplifies everything.
> =

> Also ofc userspace fencing still disallowed, but since userspace would
> queu up all writes to its ringbuffer through the drm/scheduler, we'd
> handle dependencies through that still. Not great, but workable.
> =

> Thinking about this, not even mapping the ringbuffer r/o is required, it's
> just that we must queue things throug the kernel to resolve dependencies
> and everything without breaking dma_fence. If userspace lies, tdr will
> shoot it and the kernel stops running that context entirely.
> =

> So I think even if we have hw with 100% userspace submit model only we
> should be still fine. It's ofc silly, because instead of using userspace
> fences and gpu semaphores the hw scheduler understands we still take the
> detour through drm/scheduler, but at least it's not a break-the-world
> event.

Also no page fault support, userptr invalidates still stall until
end-of-batch instead of just preempting it, and all that too. But I mean
there needs to be some motivation to fix this and roll out explicit sync
:-)
-Daniel

> =

> Or do I miss something here?
> =

> > For now and the next hardware we are save to support the old submission
> > model, but the functionality of kernel queues will sooner or later go a=
way
> > if it is only for Linux.
> > =

> > So we need to work on something which works in the long term and get us=
 away
> > from this implicit sync.
> =

> Yeah I think we have pretty clear consensus on that goal, just no one yet
> volunteered to get going with the winsys/wayland work to plumb drm_syncobj
> through, and the kernel/mesa work to make that optionally a userspace
> fence underneath. And it's for a sure a lot of work.
> -Daniel
> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
