Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAACD79D175
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 14:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0343410E25F;
	Tue, 12 Sep 2023 12:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228DE10E40B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694523373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+oYNFFHMBlFm+6kDdqZGy0XeJscfTu0yR7jOWVod7Kc=;
 b=D66CmgVaJirVpU9OfsE+EwLVyjOa2YzpRa1tV6pupNOwLAM/yZ+racLv5AFA1seihRg9Iq
 Ga4PTRFC86XoJaF/yXKxc3NtP/Yv0Hmb+5SK5/uXY3riWvmAzPWutHuXFvsyXxOUCQnIz9
 b0SjbwJWlgZ/rLAx9GMsr/TiY4aMgPU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-qgzxnMa2PraV5iX5G8XVXQ-1; Tue, 12 Sep 2023 08:56:11 -0400
X-MC-Unique: qgzxnMa2PraV5iX5G8XVXQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-978a991c3f5so385351566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 05:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694523369; x=1695128169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oYNFFHMBlFm+6kDdqZGy0XeJscfTu0yR7jOWVod7Kc=;
 b=auxXygaPwq2PjIPErWWPCV5Ig7QpwC2SBNntyIZu5DdadGxG2je6zGqb79pjjZTogG
 262YyqaChTX5KySFIVVg/JhoGmLoPNxtlQhPIuuJzFumVY8aorO2u7EPEnmd3nnUUcJl
 hzLeYHUZY6gF60XGTV3CWM8P8Aj/ZoB4EBwm/tSGYjeug0B6Dh9DpIwVWljQnry9rD+t
 vU/BGckuPsTIoVAkxGZnvEr+BT0U/EgGGexglCCxmr+JpOzVp/l+yfdgXWYmREb4ehyy
 VAYUQSc7ZitNGT8C6XmiiVWi9QOFqHNedf2Spe3PZfznkxWScOa9g0IMFmjGbXpFFmVI
 4oNA==
X-Gm-Message-State: AOJu0YyV914x3/eMjnOLaH3IxSF0V1tTHqjteqoQGBHgVGNofWkUpU8/
 lZxsooBpi9zDxXlYhl+4Is6LuVLN1apWlIWAJ83X+b1uA5KkLsLhTqJDiqCO4EzqIUq9NxdQgr0
 XJMuzghFAHSwPx5rpR8V/+5V5psrthOKU82vq
X-Received: by 2002:a17:906:18a9:b0:9aa:e07:d421 with SMTP id
 c9-20020a17090618a900b009aa0e07d421mr9001893ejf.43.1694523369543; 
 Tue, 12 Sep 2023 05:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFimnJfL1fH26SfDL3A/xE5HrTmKvjbt3mnWI1n3FgwWISvzSwPMyb29Yvm5h1lu64/nOSAcg==
X-Received: by 2002:a17:906:18a9:b0:9aa:e07:d421 with SMTP id
 c9-20020a17090618a900b009aa0e07d421mr9001876ejf.43.1694523369152; 
 Tue, 12 Sep 2023 05:56:09 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a17090695c300b0099bc8bd9066sm6860069ejy.150.2023.09.12.05.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 05:56:08 -0700 (PDT)
Date: Tue, 12 Sep 2023 14:56:06 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZQBf5vFhRGrNBINj@pollux>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
 <20230912121357.4cc10dec@collabora.com> <ZQBBgsrohAqIAppA@pollux>
 <20230912141818.10827d1d@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230912141818.10827d1d@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 02:18:18PM +0200, Boris Brezillon wrote:
> On Tue, 12 Sep 2023 12:46:26 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > > I'm a bit worried that leaving this single vs multi-threaded wq
> > > decision to drivers is going to cause unnecessary pain, because what
> > > was previously a granted in term of run/cleanup execution order (thanks
> > > to the kthread+static-drm_sched_main-workflow approach) is now subject
> > > to the wq ordering guarantees, which depend on the wq type picked by
> > > the driver.  
> > 
> > Not sure if this ends up to be much different. The only thing I could think of
> > is that IIRC with the kthread implementation cleanup was always preferred over
> > run.
> 
> Given the sequence in drm_sched_main(), I'd say that cleanup and run
> operations are naturally interleaved when both are available, but I
> might be wrong.

From drm_sched_main():

	wait_event_interruptible(sched->wake_up_worker,
				 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
				 (!drm_sched_blocked(sched) &&
				  (entity = drm_sched_select_entity(sched))) ||
				 kthread_should_stop());

	if (cleanup_job)
		sched->ops->free_job(cleanup_job);

	if (!entity)
		continue;

If cleanup_job is not NULL the rest shouldn't be evaluated I guess. Hence entity
would be NULL and we'd loop until there are no more cleanup_jobs if I don't miss
anything here.

> 
> > With a single threaded wq this should be a bit more balanced.
> 
> With a single threaded wq, it's less clear, because each work
> reschedules itself for further processing, but it's likely to be more
> or less interleaved. Anyway, I'm not too worried about cleanup taking
> precedence on run or the other way around, because the limited amount
> of HW slots (size of the ring-buffer) will regulate that.

Yeah, that's what I meant, with to work items rescheduling themselves it starts
to be interleaved. Which I'm not worried about as well.

> 
> > 
> > With a multi-threaded wq it's still the same, but run and cleanup can run
> > concurrently,
> 
> What I'm worried about is that ^. I'm not saying it's fundamentally
> unsafe, but I'm saying drm_sched hasn't been designed with this
> concurrency in mind, and I fear we'll face subtle bugs if we go from
> kthread to multi-threaded-wq+run-and-cleanup-split-in-2-work-items.
> 

Yeah, so what we get with that is that job_run() of job A and job_free() of job
B can run in parallel. Unless drivers do weird things there, I'm not seeing an
issue with that as well at a first glance.

> > which has the nice side effect that free_job() gets out of the
> > fence signaling path. At least as long as the workqueue has max_active > 1.
> 
> Oh, yeah, I don't deny using a multi-threaded workqueue has some
> benefits, just saying it might be trickier than it sounds.
> 
> > Which is one reason why I'm using a multi-threaded wq in Nouveau.
> 
> Note that I'm using a multi-threaded workqueue internally at the moment
> to deal with all sort of interactions with the FW (Mali HW only has a
> limited amount of scheduling slots, and we need to rotate entities
> having jobs to execute so every one gets a chance to run on the GPU),
> but this has been designed this way from the ground up, unlike
> drm_sched_main() operations, which were mostly thought as a fixed
> sequential set of operations. That's not to say it's impossible to get
> right, but I fear we'll face weird/unexpected behavior if we go from
> completely-serialized to multi-threaded-with-pseudo-random-processing
> order.

From a per job perspective it's still all sequential and besides fence
dependencies, which are still resolved, I don't see where jobs could have cross
dependencies that make this racy. But agree that it's probably worth to think
through it a bit more.

> 
> > 
> > That latter seems a bit subtile, we probably need to document this aspect of
> > under which conditions free_job() is or is not within the fence signaling path.
> 
> Well, I'm not even sure it can be clearly defined when the driver is
> using the submit_wq for its own work items (which can be done since we
> pass an optional submit_wq when calling drm_sched_init()). Sure, having
> max_active >= 2 should be enough to guarantee that the free_job work
> won't block the run_job one when these are the 2 only works being
> queued, but what if you have many other work items being queued by the
> driver to this wq, and some of those try to acquire resv locks? Could
> this prevent execution of the run_job() callback, thus preventing
> signaling of fences? I'm genuinely asking, don't know enough about the
> cmwq implementation to tell what's happening when work items are
> blocked (might be that the worker pool is extended to unblock the
> situation).

Yes, I think so. If max_active would be 2 and you have two jobs running on this
workqueue already waiting on allocations then the 3rd job signaling the fence
the allocation is blocked by would be stuck and we'd have a deadlock I guess.

But that's where I start to see the driver being responsible not to pass a
workqueue to the driver where it queues up other work, either at all, or that
interferes with fence signaling paths.

So, I guess the message here would be something like: free_job() must be
considered to be in the fence signaling path, unless the submit_wq is a
multi-threaded workqueue with max_active > 1 *dedicated* to the DRM scheduler.
Otherwise it's the drivers full resposibility to make sure it doesn't violate
the rules.

> 
> Anyway, documenting when free_job() is in the dma signalling path should
> be doable (single-threaded wq), but at this point, are we not better
> off considering anything called from the submit_wq as being part of the
> dma signalling path, so we can accommodate with both cases. And if
> there is cleanup processing that require taking dma_resv locks, I'd be
> tempted to queue that to a driver-specific wq (which is what I'm doing
> right now), just to be safe.
> 

It's not only the dma-resv lock, it's any lock under which allocations may be
performed.

