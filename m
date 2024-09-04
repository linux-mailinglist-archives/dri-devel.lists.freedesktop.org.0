Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778EE96B71D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F9410E0B9;
	Wed,  4 Sep 2024 09:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="E3SzJNmU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD3610E0B9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:43:25 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-374c180d123so2155174f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725443004; x=1726047804; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FLzi17UQU0AJMbgJwiPhnE5zR3Ae/PuDtOOwJ+Ypoyo=;
 b=E3SzJNmURm6ZGlm9Z/539uIfNgCDp2YGo8XccKz4zvg4LchrIjiGWf5e+B4u0+1zSR
 qjejM7EW+uVnJWkPaIAz7Txar3JwZiEf4To5diYKRZFNbaMWa5MU/bGgZL4Urp8OsO43
 ASnDpBS51IiKtzxLOg+CcO90iClT79nOQ4r+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725443004; x=1726047804;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FLzi17UQU0AJMbgJwiPhnE5zR3Ae/PuDtOOwJ+Ypoyo=;
 b=sPxA1V21pW+Zr4OM6s3JDcqtmOBnKPNAOkgTfaO4YidiP37/C84LyfiOvfsfLcJlIU
 N8Bg1msETTgbnDATbxjaLHJHLXf2mWAUFSu14zaSHUH7ZLHRciAWASHUTkD1eAZDOUih
 MOGpTxa3h0HvyI32mawtVMNrG4d0W9hdlNyQpRZ7AZBddS0euScrIeqX+Y1X25Voeee/
 xRRD886WeUeMYQmavNZUFBEeRcOitdY8psK+MOB/8qGUfsZANH3q1NonxlSONvBlxPxZ
 RRfymRfRbWEuqx8FGpaNYjrzqLheN0YG79IZWdMapL0JK3b026kouKrKUSa+EFB8GXLU
 cfXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBl84wHb9rpNhZ5GKKqPY12etASVYhf81X1BJmh1z/JmcfwWvK3gV4sirFVTPncWqHbHcgvHAjavY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm/39sssSceLXF54G3Hvn4lsA6aIoQK1vHkYD9ibem4fwhci8m
 asnwVqfkgXINLj8BMXwPIVBP9/0Rdr3ylmt7ger+FOSpNpPjYUVVnBo7+5gJ5Tk=
X-Google-Smtp-Source: AGHT+IHEDjese8/PXEN3yEO3omRIFDoAxH79JCV+mjgnzuZwdvTRzdKkfxjITeh2ZghF8abA6WzaTA==
X-Received: by 2002:adf:f2d1:0:b0:374:c3f7:6af1 with SMTP id
 ffacd0b85a97d-374c3f76cd2mr7042390f8f.15.1725443003556; 
 Wed, 04 Sep 2024 02:43:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6f9b584sm197033775e9.16.2024.09.04.02.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:43:23 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:43:21 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
Message-ID: <Ztgrue4tHXrKK01v@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <090ae980-a944-4c00-a26e-d95434414417@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 04, 2024 at 09:49:44AM +0200, Christian König wrote:
> Am 03.09.24 um 23:11 schrieb Simona Vetter:
> > On Tue, Sep 03, 2024 at 03:46:43PM +0200, Christian König wrote:
> > > Hi Steven,
> > > 
> > > Am 29.08.24 um 15:37 schrieb Steven Price:
> > > > Hi Christian,
> > > > 
> > > > Mihail should be able to give more definitive answers, but I think I can
> > > > answer your questions.
> > > > 
> > > > On 29/08/2024 10:40, Christian König wrote:
> > > > > Am 28.08.24 um 19:25 schrieb Mihail Atanassov:
> > > > > > Hello all,
> > > > > > 
> > > > > > This series implements a mechanism to expose Mali CSF GPUs' queue
> > > > > > ringbuffers directly to userspace, along with paraphernalia to allow
> > > > > > userspace to control job synchronisation between the CPU and GPU.
> > > > > > 
> > > > > > The goal of these changes is to allow userspace to control work
> > > > > > submission to the FW/HW directly without kernel intervention in the
> > > > > > common case, thereby reducing context switching overhead. It also allows
> > > > > > for greater flexibility in the way work is enqueued in the ringbufs.
> > > > > > For example, the current kernel submit path only supports indirect
> > > > > > calls, which is inefficient for small command buffers. Userspace can
> > > > > > also skip unnecessary sync operations.
> > > > > Question is how do you guarantee forward progress for fence signaling?
> > > > A timeout. Although looking at it I think it's probably set too high
> > > > currently:
> > > > 
> > > > > +#define JOB_TIMEOUT_MS				5000
> > > > But basically the XGS queue is a DRM scheduler just like a normal GPU
> > > > queue and the jobs have a timeout. If the timeout is hit then any fences
> > > > will be signalled (with an error).
> > > Mhm, that is unfortunately exactly what I feared.
> > > 
> > > > > E.g. when are fences created and published? How do they signal?
> > > > > 
> > > > > How are dependencies handled? How can the kernel suspend an userspace
> > > > > queue?
> > > > The actual userspace queue can be suspended. This is actually a
> > > > combination of firmware and kernel driver, and this functionality is
> > > > already present without the user submission. The firmware will multiplex
> > > > multiple 'groups' onto the hardware, and if there are too many for the
> > > > firmware then the kernel multiplexes the extra groups onto the ones the
> > > > firmware supports.
> > > How do you guarantee forward progress and that resuming of suspended queues
> > > doesn't end up in a circle dependency?
> > > 
> > > > I haven't studied Mihail's series in detail yet, but if I understand
> > > > correctly, the XGS queues are handled separately and are not suspended
> > > > when the hardware queues are suspended. I guess this might be an area
> > > > for improvement and might explain the currently very high timeout (to
> > > > deal with the case where the actual GPU work has been suspended).
> > > > 
> > > > > How does memory management work in this case?
> > > > I'm not entirely sure what you mean here. If you are referring to the
> > > > potential memory issues with signalling path then this should be handled
> > > > by the timeout - although I haven't studied the code to check for bugs here.
> > > You might have misunderstood my question (and I might misunderstand the
> > > code), but on first glance it strongly sounds like the current approach will
> > > be NAKed.
> > > 
> > > > The actual new XGS queues don't allocate/free memory during the queue
> > > > execution - so it's just the memory usage related to fences (and the
> > > > other work which could be blocked on the fence).
> > > But the kernel and the hardware could suspend the queues, right?
> > > 
> > > > In terms of memory management for the GPU work itself, this is handled
> > > > the same as before. The VM_BIND mechanism allows dependencies to be
> > > > created between syncobjs and VM operations, with XGS these can then be
> > > > tied to GPU HW events.
> > > I don't know the details, but that again strongly sounds like that won't
> > > work.
> > > 
> > > What you need is to somehow guarantee that work doesn't run into memory
> > > management deadlocks which are resolved by timeouts.
> > > 
> > > Please read up here on why that stuff isn't allowed: https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
> > panthor doesn't yet have a shrinker, so all memory is pinned, which means
> > memory management easy mode.
> 
> Ok, that at least makes things work for the moment.
> 
> > But also this means there might be an uapi design bug in here, and we
> > really don't want to commit to that. My stance is that panthor should gain
> > a proper shrinker first, which means there will be some changes here too.
> > And then we can properly evaluate this. As-is it's a bit too much on the
> > toy end of things.
> 
> I wouldn't say toy end, it looks rather fleshed out to me.
> 
> But I agree that the people who design the UAPI needs to be aware of the
> restrictions.

The thing is, if you have pinned memory there are no restrictions on
userspace sync, you can do whatever you want. And then you can still bake
that into a dma_fence and it will not deadlock (as long as there's a
timeout and forward progress guarantee) because it cannot ever get back
into a memory management fence because there are none.

If we merge that uapi we're forever condemned to pinning all memory, which
I don't think is good because sooner or later every serious gpu driver
seems to gain some shrinker support.

> > That aside, I've thought this all through with tons of people, and I do
> > think it's all possible.
> 
> It's certainly possible, we have user queue patches for amdgpu in the
> pipeline as well.
> 
> It's just really really really hard to get right without creating some
> circle dependencies and deadlocks in between.
> 
> If I would get free beer every time somebody came up with a broken dma_fence
> design I would probably end up as alcoholic without spending a single penny.

Yeah that's exactly my fear. It's possible, but even if you understand the
abstract rules and implement the kernel correctly it's really hard to get
the userspace right: There's way too many broken ways, and just about
barely one correct way to implement vulkan winsys dma_fence with userspace
submit.

This is why I called userspace direct submit without a shrinker a toy,
because it makes the userspace trivially easy, and trivially easy to get
wrong. Even if the kernel side looks all great and polished and solid.

If we do already have a shrinker that exposes these issues, then userspace
getting stuff wrong is a userspace bug. If we start out without a
shrinker, and userspace gets it wrong, then ever adding a shrinker is a
kernel regression.

And "you cannot ever add dynamic memory management to this driver" is a
uapi regression situation I don't think we want to get into, because
there's no way out. i915-gem folks managed to pull that trick off too, and
Dave&me where left with no other choice than to flat out revert that uapi
and break userspace.

This is not something I want to make a repeat experience.

So what I think should be done, pretty much carbon copy from the xe plan:

- Prerequisite: Have a shrinker or otherwise dynamic memory management, or
  you just wont hit all the interesting bugs.

- Implement support for long running context that do not have dma_fence
  end-of-batch semantics, with the preempt context fence trick. Since this
  would be the 3rd driver after amdkfd and xe I think it's time for a
  little helper, which would be very little code and lots of documentation
  explaining the concept.

  But if that helper ties in with drm_exec and drm_gpuvm then I think it
  would still be really good as a tiny little library itself and not just
  as a good place to put documentation. Extracting that from xe_lr.c
  should be fairly simple. amdkfd could also be used as inspiration at
  least.

- With this you can start using userspace memory fences, as long as you
  never need to bake them into a dma_fence or syncobj that actually waits
  (instead of waiting until rendering finishes and then handing over a
  signalled dma_fence or something like that).

- Implement userspace submit with this infrastructure.

- Implement support for baking dma_fence with all this, relying on the
  vulkan winsys fence guarantee that all the indefinite fences are
  resolved and queued up, or the application will get a
  VK_ERROR_DEVICE_LOST thrown its way.

  This is really hard, and I don't think anyone's made it happen yet in a
  real prototype with full-fledged userspace memory fences vulkan driver.

- Bonus for adding memory fences to drm_syncobj as future fences, for
  sharing. Could be done anytime you have long running context support.

Alternative plan:
- Implement userspace submit, but _every_ job still goes through a kernel
  drm_sched submission and the context doesn't run without a job. That way
  you can drive userspace-submit only hardware, but with the old
  end-of-batch dma_fence kernel submission model, and also the userspace
  submit thread for future fences that haven't materialized yet in a
  drm_syncobj. This might be a good interim stop-gap for gl/vulkan winsys
  drivers, but people seem a lot more interesting in going full userspace
  submit with userspace memory fences for compute use cases. But could do
  both in parallel.

  Unless you absolutely know what you're doing you cannot use userspace
  memory fences with this. I think the only case I've seen is where you
  submit jobs in multiple engines as an atomic unit (like intel media
  workloads split across engines), or one after the other and sync is
  guaranteed to go only one way (like the run-ahead cs job radeonsi iirc
  has).

tldr; expect pain, I'm sorry.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
