Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E67B6D942F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 12:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30EE10EB58;
	Thu,  6 Apr 2023 10:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93D010EB57
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 10:32:51 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso129028966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680777170;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N+yMEjfXIx1xlHJdVsDNE68Lm5ZvsF+BSCROvzRygIU=;
 b=N/0749FBxhYydGjzKN1gnWoPdXFLmf2M/mMrqhOUCucM94BquGPnetjBNPdWCfFUVk
 xkjXmlh1X837TkbsYYsmELouUbCkf8Ju4HPbJj7Xc+Qb79xMEL4J2hrZThH7Po1jr5bX
 AWB2kY9uAz3S+V6t2s+ZDblgA4IemovAxX//4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680777170;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+yMEjfXIx1xlHJdVsDNE68Lm5ZvsF+BSCROvzRygIU=;
 b=S5A8b6Yvo1I/NEGRepvMk8U0MyhxrD978OzemSYgiFWGdKeNrXSTEQZ+Be0aHzrt43
 a/lIonkmWVHJ8mmiL7Oy8OE1TNFPOMC+CjDv7lRMl/RMocHEF9jqqHPqF/N7mVLUkTI/
 FUjsAqN3JtU0IetS0TR8nqqWI9OiyeCon4QOmMGMIZyhEIOkG5nffy99uihztOsj0WnC
 7skNSgL6cJhk4pvTS/Ss438sGx/K0AHtNRvJbmyi9gIiA8w6UXmepxrY9axsQe1X/8EG
 0vWPMkU+abWOQoCrJ3IO9gvutl/6Wr90MlXwd+Sxgkf89+9DIkDjnHWNiCXwBphDYFF5
 9kKg==
X-Gm-Message-State: AAQBX9emZvTfAdA5u/WmMS5tqhRpr1JCdtzlZobyQDWpTlleA0LH1TLi
 XMUptXnTKcsvf6xlzkAtB1hElw==
X-Google-Smtp-Source: AKy350YDa8hgrI+PP9bPEdYxLwxqRQJhO58hXGznAMAdLrN1arrmWHfnyldU1JL7Q65A1RxIa1DXEg==
X-Received: by 2002:a17:906:13:b0:8f0:ba09:4abe with SMTP id
 19-20020a170906001300b008f0ba094abemr5522793eja.2.1680777170105; 
 Thu, 06 Apr 2023 03:32:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u1-20020a1709064ac100b008e09deb6610sm617122ejt.200.2023.04.06.03.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:32:49 -0700 (PDT)
Date: Thu, 6 Apr 2023 12:32:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZC6fz8IeOIabg10u@phenom.ffwll.local>
References: <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
 <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
 <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
 <CAKMK7uFEGoaOmewGmP4H_ouqZiMKAiaKwEohGCZq5T-UJYMf_w@mail.gmail.com>
 <ZC4pinCurycVe4bi@DUT025-TGLU.fm.intel.com>
 <ZC5oo8ljg5DWHjhk@phenom.ffwll.local>
 <cf04d0a6-3485-a1aa-8514-a0ecb4266f03@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf04d0a6-3485-a1aa-8514-a0ecb4266f03@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 12:14:36PM +0200, Christian König wrote:
> Am 06.04.23 um 08:37 schrieb Daniel Vetter:
> > On Thu, Apr 06, 2023 at 02:08:10AM +0000, Matthew Brost wrote:
> > > On Wed, Apr 05, 2023 at 12:12:27PM +0200, Daniel Vetter wrote:
> > > > On Wed, 5 Apr 2023 at 11:57, Christian König <christian.koenig@amd.com> wrote:
> > > > > Am 05.04.23 um 11:07 schrieb Daniel Vetter:
> > > > > > [SNIP]
> > > > > > > I would approach it from the complete other side. This component here is a
> > > > > > > tool to decide what job should run next.
> > > > > > > 
> > > > > > > How that is then signaled and run should not be part of the scheduler, but
> > > > > > > another more higher level component.
> > > > > > > 
> > > > > > > This way you also don't have a problem with not using DMA-fences as
> > > > > > > dependencies as well as constrains for running more jobs.
> > > > > > I think we're talking about two things here and mixing them up.
> > > > > > 
> > > > > > For the dependencies I agree with you, and imo that higher level tool
> > > > > > should probably just be an on-demand submit thread in userspace for the
> > > > > > rare case where the kernel would need to sort out a dependency otherwise
> > > > > > (due to running out of ringspace in the per-ctx ringbuffer).
> > > > > > 
> > > > > > The other thing is the message passing stuff, and this is what I was
> > > > > > talking about above. This has nothing to do with handling dependencies,
> > > > > > but with talking to the gpu fw. Here the intel design issue is that the fw
> > > > > > only provides a single queue, and it's in-order. Which means it
> > > > > > fundamentally has the stalling issue you describe as a point against a
> > > > > > message passing design. And fundamentally we need to be able to talk to
> > > > > > the fw in the scheduler ->run_job callback.
> > > > > > 
> > > > > > The proposal here for the message passing part is that since it has the
> > > > > > stalling issue already anyway, and the scheduler needs to be involved
> > > > > > anyway, it makes sense to integrated this (as an optional thing, only for
> > > > > > drivers which have this kind of fw interface) into the scheduler.
> > > > > > Otherwise you just end up with two layers for no reason and more ping-pong
> > > > > > delay because the ->run_job needs to kick off the subordinate driver layer
> > > > > > first. Note that for this case the optional message passing support in the
> > > > > > drm/scheduler actually makes things better, because it allows you to cut
> > > > > > out one layer.
> > > > > > 
> > > > > > Of course if a driver with better fw interface uses this message passing
> > > > > > support, then that's bad. Hence the big warning in the kerneldoc.
> > > > > Well what I wanted to say is that if you design the dependency handling
> > > > > / scheduler properly you don't need the message passing through it.
> > > > > 
> > > > > For example if the GPU scheduler component uses a work item to do it's
> > > > > handling instead of a kthread you could also let the driver specify the
> > > > > work queue where this work item is executed on.
> > > > > 
> > > > > When you design it like this the driver specifies the thread context of
> > > > > execution for it's job. In other words it can specify a single threaded
> > > > > firmware work queue as well.
> > > > > 
> > > > > When you then have other messages which needs to be passed to the
> > > > > firmware you can also use the same single threaded workqueue for this.
> > > > > 
> > > > > Drivers which have a different firmware interface would just use one of
> > > > > the system work queues instead.
> > > > > 
> > > > > This approach basically decouples the GPU scheduler component from the
> > > > > message passing functionality.
> > > > Hm I guess we've been talking past each another big time, because
> > > > that's really what I thought was under discussions? Essentially the
> > > > current rfc, but implementing with some polish.
> > > > 
> > > I think Daniel pretty much nailed it here (thanks), to recap:
> > > 
> > > 1. I want the messages in the same worker so run_job / free_job /
> > > process_msg execution is mutual exclusive and also so during reset paths
> > > if the worker is stopped all the entry points can't be entered.
> > > 
> > > If this is a NAK, then another worker is fine I guess. A lock between
> > > run_job / free_job + process_msg should solve the exclusion issue and the
> > > reset paths can also stop this new worker too. That being said I'd
> > > rather leave this as is but will not fight this point.
> > > 
> > > 2. process_msg is just used to communicate with the firmware using the
> > > same queue as submission. Waiting for space in this queue is the only
> > > place this function can block (same as submission), well actually we
> > > have the concept a preempt time slice but that sleeps for 10 ms by
> > > default. Also preempt is only used in LR entities so I don't think it is
> > > relavent in this case either.
> > > 
> > > 3. Agree this is in the dma-fence signaling path (if process_msg is in
> > > the submission worker) so we can't block indefinitely or an unreasonable
> > > period of time (i.e. we must obey dma-fence rules).
> > Just to hammer this in: Not just process_msg is in the dma_fence signaling
> > path, but the entire fw queue where everything is being funneled through,
> > including whatever the fw is doing to process these.
> > 
> > Yes this is terrible and blew up a few times already :-/
> > 
> > But also, probably something that the docs really need to hammer in, to
> > make sure people don't look at this and thinkg "hey this seems to be the
> > recommended way to do this on linux". We don't want hw people to build
> > more of these designs, they're an absolute pain to deal with with Linux'
> > dma_fence signalling and gpu job scheduling rules.
> > 
> > It's just that if you're stuck with such fw, then integrating the flow
> > into drm/sched instead of having an extra layer of workers seems the
> > better of two pretty bad solutions.
> 
> Yeah and if you have such fw limitations, make sure that you use something
> which is understood by lockdep to feed into it.
> 
> In other words, either locks or work item/queue and not some message passing
> functionality through the scheduler.
> 
> As far as I can see the approach with the work item/queue should fit your
> needs here.

dma_fence signalling annotations would also make the scheduler thread
suitable to catch issues with lockdep, just to make double-sure it can
catch issues.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > 4. Agree the documentation for thw usage of the messaging interface
> > > needs to be clear.
> > > 
> > > 5. Agree that my code could alway use polishing.
> > > 
> > > Lets close on #1 then can I get on general Ack on this part of the RFC
> > > and apply the polish in the full review process?
> > > 
> > > Matt
> > > 
> > > > iow I agree with you (I think at least).
> > > > -Daniel
> > > > -- 
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
