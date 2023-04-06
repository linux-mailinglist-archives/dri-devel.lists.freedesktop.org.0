Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E216F6D9331
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8901C10E235;
	Thu,  6 Apr 2023 09:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A80010E235
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:49:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-947a47eb908so67370066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680774538;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aDwrP3AJyNgCVfwTeR5DD8c7qrP0LtIWfiov4Z3AarM=;
 b=cstLYe7M4RoxLG29+q0M6d7Lm5hfQEeU3UG61zxe8QVyXdYljKPBzpCJHnzcKEABSa
 0OGVHekcbqLxOesJvFlIiwjJUmbcLSzV5nbaivV08Rpxv/E7QBYqBKdIP/LorG1wgfHc
 udnXrNomIhQJLByUElhfl7ovERpDrSY54m02E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680774538;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aDwrP3AJyNgCVfwTeR5DD8c7qrP0LtIWfiov4Z3AarM=;
 b=vlJrsaqa4DwKzTtyJKlCNyZdMv4zhOzobHSATpqD4QB/U+ke5iOg+UH4/RjVnoj396
 9k7+O2kSJDaUI/gHztsXjaTUuEM1f+1P4vAhzKo+1CJLZ26kkLJwPUo4Dp9r3WgwFVyE
 W/wEWAS3l19oz8DVSMQOaq3E6337kVzvPi8r7bxjR7xWqC2gvaKWLQE8LWRZCYCd8jl9
 CVcBdWN7MBfi3f9lOAgAvYttnrQAiawbQSMdcFYZoYOOHBLFX9MWy25MOopHbSgdWUt7
 dlQMhDDYMnwR1OB3yAyFxf9y7eqLlqKUoK0MYo7wQKl3E1DvTmf6rm5BDDhoRQ/SN+iV
 pLEA==
X-Gm-Message-State: AAQBX9eRn8svYOzjmOw8+BnSoPqA8eNBLMjMlqk3PJCl5CsAa3DzdHQ8
 YLWYczsmOvwY93GsXto0bKRo8AGBscqNqSpLkaU=
X-Google-Smtp-Source: AKy350Z0g0Bo4tFTGxtpF07AEU8bHqYdbH9guA26p5+I5RST2ZBfr8PxxEqR2cMj6wyMxRMTmvQ+Hg==
X-Received: by 2002:a17:906:2216:b0:947:bff2:1c2d with SMTP id
 s22-20020a170906221600b00947bff21c2dmr5909987ejs.3.1680774538287; 
 Thu, 06 Apr 2023 02:48:58 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 qb19-20020a1709077e9300b00948da767832sm581534ejc.152.2023.04.06.02.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:48:57 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:48:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Message-ID: <ZC6Vh2gG91zXUKJW@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, asahi@lists.linux.dev
References: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
 <6b3433ee-0712-f789-51ee-3047ead9bb79@amd.com>
 <cfbaceae-6d40-a8b3-e449-6473be234d2d@asahilina.net>
 <180bd178-e3c0-85e3-785e-fc8a216cf65e@amd.com>
 <df226249-734e-cb9e-8bc0-1eff625277e0@asahilina.net>
 <4ea53272-6324-96e6-ab29-82bccb624683@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ea53272-6324-96e6-ab29-82bccb624683@asahilina.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 asahi@lists.linux.dev,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 06:27:27PM +0900, Asahi Lina wrote:
> On 06/04/2023 18.15, Asahi Lina wrote:
> > On 06/04/2023 18.06, Christian König wrote:
> > > Am 06.04.23 um 10:49 schrieb Asahi Lina:
> > > > On 06/04/2023 17.29, Christian König wrote:
> > > > > Am 05.04.23 um 18:34 schrieb Asahi Lina:
> > > > > > A signaled scheduler fence can outlive its scheduler, since fences are
> > > > > > independently reference counted.
> > > > > 
> > > > > Well that is actually not correct. Schedulers are supposed to stay
> > > > > around until the hw they have been driving is no longer present.
> > > > 
> > > > But the fences can outlive that. You can GPU render into an imported
> > > > buffer, which attaches a fence to it. Then the GPU goes away but the
> > > > fence is still attached to the buffer. Then you oops when you cat that
> > > > debugfs file...
> > > 
> > > No, exactly that's the point you wouldn't ops.
> > > 
> > > > 
> > > > My use case does this way more often (since schedulers are tied to
> > > > UAPI objects), which is how I found this, but as far as I can tell
> > > > this is already broken for all drivers on unplug/unbind/anything else
> > > > that would destroy the schedulers with fences potentially referenced
> > > > on separate scanout devices or at any other DMA-BUF consumer.
> > > 
> > > Even if a GPU is hot plugged the data structures for it should only go
> > > away with the last reference, since the scheduler fence is referencing
> > > the hw fence and the hw fence in turn is referencing the driver this
> > > shouldn't happen.
> > 
> > So those fences can potentially keep half the driver data structures
> > alive just for existing in a signaled state? That doesn't seem sensible
> > (and it definitely doesn't work for our use case where schedulers can be
> > created and destroyed freely, it could lead to way too much junk
> > sticking around in memory).

This is why the split betwen the hw fence and the public sched fence.
Because once the hw fence stuff is sorted it should all be able to go
away, without the public fence keeping everything alive.

> > > > > E.g. the reference was scheduler_fence->hw_fence->driver->scheduler.
> > > > 
> > > > It's up to drivers not to mess that up, since the HW fence has the
> > > > same requirements that it can outlive other driver objects, just like
> > > > any other fence. That's not something the scheduler has to be
> > > > concerned with, it's a driver correctness issue.
> > > > 
> > > > Of course, in C you have to get it right yourself, while with correct
> > > > Rust abstractions will cause your code to fail to compile if you do it
> > > > wrong ^^
> > > > 
> > > > In my particular case, the hw_fence is a very dumb object that has no
> > > > references to anything, only an ID and a pending op count. Jobs hold
> > > > references to it and decrement it until it signals, not the other way
> > > > around. So that object can live forever regardless of whether the rest
> > > > of the device is gone.
> > > 
> > > That is then certainly a bug. This won't work that way, and the timelime
> > > name is just the tip of the iceberg here.
> > > 
> > > The fence reference count needs to keep both the scheduler and driver
> > > alive. Otherwise you could for example unload the module and immediately
> > > ops because your fence_ops go away.
> > 
> > Yes, I realized the module issue after writing the email. But that's the
> > *only* thing it needs to hold a reference to! Which is much more
> > sensible than keeping a huge chunk of UAPI-adjacent data structures
> > alive for a signaled fence that for all we know might stick around
> > forever attached to some buffer.
> > 
> > > > > Your use case is now completely different to that and this won't work
> > > > > any more.
> > > > > 
> > > > > This here might just be the first case where that breaks.
> > > > 
> > > > This bug already exists, it's just a lot rarer for existing use
> > > > cases... but either way Xe is doing the same thing I am, so I'm not
> > > > the only one here either.
> > > 
> > > No it doesn't. You just have implemented the references differently than
> > > they are supposed to be.
> > > 
> > > Fixing this one occasion here would mitigate that immediate ops, but
> > > doesn't fix the fundamental problem.
> > 
> > Honestly, at this point I'm starting to doubt whether we want to use
> > drm_scheduler at all, because it clearly wasn't designed for our use
> > case and every time I try to fix something your answer has been "you're
> > using it wrong", and at the same time the practically nonexistent
> > documentation makes it impossible to know how it was actually designed
> > to be used.
> 
> Also, requiring that the hw_fence keep the scheduler alive (which is
> documented nowhere) is a completely ridiculous lifetime requirement and
> layering violation across multiple subsystems. I have no idea how I'd make
> Rust abstractions uphold that requirement safely without doing something
> silly like having abstraction-specific hw_fence wrappers, and then you run
> into deadlocks due to the scheduler potentially being dropped from the
> job_done callback when the fence reference is dropped and just... no,
> please. This is terrible. If you don't want me to fix it we'll have to find
> another way because I can't work with this.

So generally the hw fence keeps the underlying gpu ctx alive, and the gpu
context keeps the gpu vm alive. Pretty much has to, or your gpu starts
executing stuff that's freed.

Now for fw scheduler gpu ctx isn't just drm_sched_entity, but also
drm_scheduler. Plus whatever driver stuff you have lying around for a ctx.
Plus ofc a reference to the vm, which might in turn keep a ton of gem_bo
alive.

Still I'm not seeing where the fundamental issue is in this refcount
scheme, or where it's silly? Mapping this all to Rust correctly is a
challenge for sure, and also untangling the assumption that drm_scheduler
is suddenly a lot more dynamic object (see my other reply), but
fundamentally calling this all silly and terrible I don't understand ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
