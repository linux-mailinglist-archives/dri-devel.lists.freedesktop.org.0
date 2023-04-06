Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A59B6D8F95
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 08:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D610410E114;
	Thu,  6 Apr 2023 06:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75A989190
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 06:37:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-947a47eb908so65168366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 23:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680763046;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ko2mW8NuwLC4Pqij6a0t5WM27xHJK8Wt75JHDmhBP+Q=;
 b=bqHmya4Qjk/WzovNL7Re/PNIA8usuAR17hcUwk/yYPJmK6X+NBZjuIersg8RwTIG6z
 6RkPDBzkbSdqVoXciUf6mpA+GkETzxKasJfkreT/XSnEcTJMmYMQhdm1v0+Sq8JdeAWQ
 b/3pxmjeA/dmeSYi9qvR/V9KELTtaEOmEnceQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680763046;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ko2mW8NuwLC4Pqij6a0t5WM27xHJK8Wt75JHDmhBP+Q=;
 b=Mp46LPj9xJ6/UJfD83nAL3N9yy62J3zOPXkKDEE0rupPpX19as0EyiEwn9RaA+8sr9
 BUV4fPM+q8P2LxigNifiyhuozQv3Y/PWvGIF9YEcdeOa2lL7eYRhjNh1400KAzWhZYVc
 s9GxgUBMGIOfiDAKqJ7x9Rt5vV1Jyws72yvPfYmMuJkjuWVOl16vioFUZhCqBEJ2XUul
 aZ0/MhnFjvIUcMK1TptZQh5EiHGWqTfC9oCj3HcBOW3KsEz0EsDHNDsyxRSYPX0UIslG
 yQ7yyi0jrkUF7ajnxoynOnhkDIij0S8Rh7DQ8YlKzYHWlPruHgrYLm/CfgnjI9DSg/JM
 vEqw==
X-Gm-Message-State: AAQBX9feTie0RBf3As87fmztdBnPO4KhCnJRu3NRiQoilOuhSpJ2bo3x
 E6GK4VgwGWntI1oNln3M70PjzJ62AhrAZ6oRtx8=
X-Google-Smtp-Source: AKy350YPj3wAbu9Gg7FY2HmNT7z60zuIwpFHHTe3b4EkkIy7GihaTpxsqyApPNlxJItw62Ls5rMsyg==
X-Received: by 2002:a17:906:24b:b0:947:8734:a05b with SMTP id
 11-20020a170906024b00b009478734a05bmr5185860ejl.7.1680763045875; 
 Wed, 05 Apr 2023 23:37:25 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 qf11-20020a1709077f0b00b009477c83c3b9sm364082ejc.133.2023.04.05.23.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 23:37:25 -0700 (PDT)
Date: Thu, 6 Apr 2023 08:37:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZC5oo8ljg5DWHjhk@phenom.ffwll.local>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
 <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
 <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
 <CAKMK7uFEGoaOmewGmP4H_ouqZiMKAiaKwEohGCZq5T-UJYMf_w@mail.gmail.com>
 <ZC4pinCurycVe4bi@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZC4pinCurycVe4bi@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 02:08:10AM +0000, Matthew Brost wrote:
> On Wed, Apr 05, 2023 at 12:12:27PM +0200, Daniel Vetter wrote:
> > On Wed, 5 Apr 2023 at 11:57, Christian König <christian.koenig@amd.com> wrote:
> > >
> > > Am 05.04.23 um 11:07 schrieb Daniel Vetter:
> > > > [SNIP]
> > > >> I would approach it from the complete other side. This component here is a
> > > >> tool to decide what job should run next.
> > > >>
> > > >> How that is then signaled and run should not be part of the scheduler, but
> > > >> another more higher level component.
> > > >>
> > > >> This way you also don't have a problem with not using DMA-fences as
> > > >> dependencies as well as constrains for running more jobs.
> > > > I think we're talking about two things here and mixing them up.
> > > >
> > > > For the dependencies I agree with you, and imo that higher level tool
> > > > should probably just be an on-demand submit thread in userspace for the
> > > > rare case where the kernel would need to sort out a dependency otherwise
> > > > (due to running out of ringspace in the per-ctx ringbuffer).
> > > >
> > > > The other thing is the message passing stuff, and this is what I was
> > > > talking about above. This has nothing to do with handling dependencies,
> > > > but with talking to the gpu fw. Here the intel design issue is that the fw
> > > > only provides a single queue, and it's in-order. Which means it
> > > > fundamentally has the stalling issue you describe as a point against a
> > > > message passing design. And fundamentally we need to be able to talk to
> > > > the fw in the scheduler ->run_job callback.
> > > >
> > > > The proposal here for the message passing part is that since it has the
> > > > stalling issue already anyway, and the scheduler needs to be involved
> > > > anyway, it makes sense to integrated this (as an optional thing, only for
> > > > drivers which have this kind of fw interface) into the scheduler.
> > > > Otherwise you just end up with two layers for no reason and more ping-pong
> > > > delay because the ->run_job needs to kick off the subordinate driver layer
> > > > first. Note that for this case the optional message passing support in the
> > > > drm/scheduler actually makes things better, because it allows you to cut
> > > > out one layer.
> > > >
> > > > Of course if a driver with better fw interface uses this message passing
> > > > support, then that's bad. Hence the big warning in the kerneldoc.
> > >
> > > Well what I wanted to say is that if you design the dependency handling
> > > / scheduler properly you don't need the message passing through it.
> > >
> > > For example if the GPU scheduler component uses a work item to do it's
> > > handling instead of a kthread you could also let the driver specify the
> > > work queue where this work item is executed on.
> > >
> > > When you design it like this the driver specifies the thread context of
> > > execution for it's job. In other words it can specify a single threaded
> > > firmware work queue as well.
> > >
> > > When you then have other messages which needs to be passed to the
> > > firmware you can also use the same single threaded workqueue for this.
> > >
> > > Drivers which have a different firmware interface would just use one of
> > > the system work queues instead.
> > >
> > > This approach basically decouples the GPU scheduler component from the
> > > message passing functionality.
> > 
> > Hm I guess we've been talking past each another big time, because
> > that's really what I thought was under discussions? Essentially the
> > current rfc, but implementing with some polish.
> >
> 
> I think Daniel pretty much nailed it here (thanks), to recap:
> 
> 1. I want the messages in the same worker so run_job / free_job /
> process_msg execution is mutual exclusive and also so during reset paths
> if the worker is stopped all the entry points can't be entered.
> 
> If this is a NAK, then another worker is fine I guess. A lock between
> run_job / free_job + process_msg should solve the exclusion issue and the
> reset paths can also stop this new worker too. That being said I'd
> rather leave this as is but will not fight this point.
> 
> 2. process_msg is just used to communicate with the firmware using the
> same queue as submission. Waiting for space in this queue is the only
> place this function can block (same as submission), well actually we
> have the concept a preempt time slice but that sleeps for 10 ms by
> default. Also preempt is only used in LR entities so I don't think it is
> relavent in this case either.
> 
> 3. Agree this is in the dma-fence signaling path (if process_msg is in
> the submission worker) so we can't block indefinitely or an unreasonable
> period of time (i.e. we must obey dma-fence rules).

Just to hammer this in: Not just process_msg is in the dma_fence signaling
path, but the entire fw queue where everything is being funneled through,
including whatever the fw is doing to process these.

Yes this is terrible and blew up a few times already :-/

But also, probably something that the docs really need to hammer in, to
make sure people don't look at this and thinkg "hey this seems to be the
recommended way to do this on linux". We don't want hw people to build
more of these designs, they're an absolute pain to deal with with Linux'
dma_fence signalling and gpu job scheduling rules.

It's just that if you're stuck with such fw, then integrating the flow
into drm/sched instead of having an extra layer of workers seems the
better of two pretty bad solutions.
-Daniel

 
> 4. Agree the documentation for thw usage of the messaging interface
> needs to be clear.
> 
> 5. Agree that my code could alway use polishing.
> 
> Lets close on #1 then can I get on general Ack on this part of the RFC
> and apply the polish in the full review process?
> 
> Matt
> 
> > iow I agree with you (I think at least).
> > -Daniel
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
