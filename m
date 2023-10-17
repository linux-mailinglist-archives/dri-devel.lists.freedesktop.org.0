Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C67CBC69
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161AF88F94;
	Tue, 17 Oct 2023 07:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F5C10E27E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:37:15 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c506d1798eso9242881fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697528234; x=1698133034; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=004qh3k4NFILhFdfUztufEWvSL5y8mHzh2lznCTfPd0=;
 b=KpLHRRlIeyMrw0Hx4oIQTGGYkaZIWB/XKnXN0dOHBv4QaTBVMMUrcNi/UUBG0iG5cO
 eeuUukFszLqqcto+gv9aLxYx9bxikkwTLiATrMmhK56jWvTY79n8rXMegSITNMVn5Nk9
 BGeA37wRZH2JpWgeHvBhnVGv6f8XfP21Deros=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697528234; x=1698133034;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=004qh3k4NFILhFdfUztufEWvSL5y8mHzh2lznCTfPd0=;
 b=UkAEShK898F0u8nCzMCaKlQ45MLbKyNxSIJzphYovd3/GKFokp0WbKOIUs/N0c3GUq
 NTfJD0152rCV/qVv5+pMwwrvWBDXzmM3zhJ6BCTvXLPOxUUGrLOhCHRpdMFl2vfCkL0Q
 YMGYAyy9VT2lQaFO+9iWVPB8RL4ktMXLBEjOswxY/l06rNCMGku3OloQf87ENvIJ13Re
 FV/PzdyxJrRf65rqXUyXwQ8DsUsUtgb5nVeiNCLyvojaNagL0Yd0wYnycNha9/OwOhRo
 /vlNkvUF4gQP17PO+1BzmDpRQlpuxCBm7BfWjiH6p2o3biEx9Lvscsjw6LdxpXaNpGFy
 BFhA==
X-Gm-Message-State: AOJu0Yy5F8JAuEkv/4asPSn+JO7zpiKXFOErpcLATx3OHiVSx2ILcg9k
 xO7/VPvZOJZawcf22yWAgOBmRQ==
X-Google-Smtp-Source: AGHT+IG0Oqmm4U/RX9VqqLugpjJIOIET0AUryeLp/jRvG0DPpnM8ZnrXljxrZWu2JkdnMjX9TvK/hw==
X-Received: by 2002:a05:651c:386:b0:2c5:2d06:cade with SMTP id
 e6-20020a05651c038600b002c52d06cademr913052ljp.2.1697528233784; 
 Tue, 17 Oct 2023 00:37:13 -0700 (PDT)
Received: from dvetter-linux.ger.corp.intel.com
 (198.red-81-39-42.dynamicip.rima-tde.net. [81.39.42.198])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05600c1d9700b00402ff8d6086sm1109879wms.18.2023.10.17.00.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 00:37:13 -0700 (PDT)
Date: Tue, 17 Oct 2023 09:37:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ray Strode <halfline@gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZS45pPw8N4h2CE1z@dvetter-linux.ger.corp.intel.com>
References: <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com>
 <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
 <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
 <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
 <ZSkQxEL4596_pQW1@phenom.ffwll.local>
 <CAA_UwzLo+PHpVf2BtUC486_b+CUkt+Wm0RPJXhGkGmZzUAxDAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA_UwzLo+PHpVf2BtUC486_b+CUkt+Wm0RPJXhGkGmZzUAxDAQ@mail.gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 6.3.8-200.fc38.x86_64 
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

On Fri, Oct 13, 2023 at 10:04:02AM -0400, Ray Strode wrote:
> Hi
> 
> On Fri, Oct 13, 2023 at 5:41 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > I mean we're not talking about scientific computing, or code
> > > compilation, or seti@home. We're talking about nearly the equivalent
> > > of `while (1) __asm__ ("nop");`
> >
> > I don't think anyone said this shouldn't be fixed or improved.
> 
> Yea but we apparently disagree that it would be an improvement to stop
> discrediting user space for driver problems.
> You see, to me, there are two problems 1) The behavior itself is not
> nice and should be fixed 2) The blame/accounting/attribution for a
> driver problem is getting directed to user space. I think both issues
> should be fixed. One brought the other issue to light, but both
> problems, in my mind, are legitimate and should be addressed. You
> think fixing the second problem is some tactic to paper over the first
> problem. Christian thinks the second problem isn't a problem at all
> but the correct design.  So none of us are completely aligned and I
> don't see anyone changing their mind anytime soon.
> 
> > What I'm saying is that the atomic ioctl is not going to make guarantees
> > that it will not take up to much cpu time (for some extremely vague value
> > of "too much") to the point that userspace can configure it's compositor
> > in a way that it _will_ get killed if we _ever_ violate this rule.
> yea I find that strange, all kernel tasks have a certain implied
> baseline responsibility to be good citizens to the system.
> And how user space is configured seems nearly immaterial.
> 
> But we're talking in circles.
> 
> > Fixing the worst offenders I don't think will see any pushback at all.
> Yea we all agree fixing this one busy loop is a problem but we don't
> agree on where the cpu time blame should go.
> 
> > > But *this* feels like duct tape: You've already said there's no
> > > guarantee the problem won't also happen during preliminary computation
> > > during non-blocking commits or via other drm entry points. So it
> > > really does seem like a fix that won't age well. I won't be surprised
> > > if in ~3 years (or whatever) in some RHEL release there's a customer
> > > bug leading to the real-time thread getting blocklisted for obscure
> > > server display hardware because it's causing the session to tank on a
> > > production machine.
> >
> > Yes the atomic ioctl makes no guarantees across drivers and hw platforms
> > of guaranteed "we will never violate, you can kill your compositor if you
> > do" cpu bound limits. We'll try to not suck too badly, and we'll try to
> > focus on fixing the suck where it upsets the people the most.
> >
> > But there is fundamentally no hard real time guarantee in atomic. At least
> > not with the current uapi.
> 
> So in your mind mutter should get out of the real-time thread business entirely?

Yes. At least the hard-real time "the kernel kills your process if you
fail" business. Because desktop drawing just isn't hard real-time, nothing
disastrous happens if we miss a deadline.

Of course special setups where everything is very controlled might be
different.

> > The problem isn't about wasting cpu time. It's about you having set up the
> > system in a way so that mutter gets killed if we ever waste too much cpu
> > time, ever.
> 
> mutter is not set up in a way to kill itself if the driver wastes too
> much cpu time,
> ever. mutter is set up in a way to kill itself if it, itself, wastes
> too much cpu time, ever.
> The fact that the kernel is killing it when a kernel driver is wasting
> cpu time is the
> bug that led to the patch in the first place!
> 
> > The latter is flat out not a guarantee the kernel currently makes, and I
> > see no practical feasible way to make that happen. And pretending we do
> > make this guarantee will just result in frustrated users filling bugs that
> > they desktop session died and developers closing them as "too hard to
> > fix".
> 
> I think all three of us agree busy loops are not nice (though maybe we
> aren't completely aligned on severity). And I'll certainly concede
> that fixing all the busy loops can be hard. Some of the cpu-bound code
> paths may even be doing legitimate computation.  I still assert that
> if the uapi calls into driver code that might potentially be doing
> something slow where it can't sleep, it should be doing it on a
> workqueue or thread. That seems orthogonal to fixing all the places
> where the drivers aren't acting nicely.

Again no, because underlying this your requirement boils down to hard real
time.

And we just cannot guarantee that with atomic kms. Best effort,
absolutely. Guaranteed to never fail, no way.

> > Maybe as a bit more useful outcome of this entire discussion: Could you
> > sign up to write a documentation patch for the atomic ioctl that adds a
> > paragraph stating extremely clearly that this ioctl does not make hard
> > real time guarantees, but only best effort soft realtime, and even then
> > priority of the effort is focused entirely on the !ALLOW_MODESET case,
> > because that is the one users care about the most.
> 
> I don't think I'm the best positioned to write such documentation. I
> still think what the kernel is doing is wrong here and I don't even
> fully grok what you mean by best effort.

It's the difference between hard real time and soft real time. atomic kms
is a soft real time system, not hard real time.

You've set up mutter in a hard real time way, and that just doesn't work.

I guess I can type up some patch when I'm back from XDC, but if the
difference between soft and hard real time isn't clear, then yeah you
don't understand the point I've been trying to make in this thread.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
