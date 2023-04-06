Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667096D9CDF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5734710E05B;
	Thu,  6 Apr 2023 15:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F277210E05B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:59:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-502aa0f24daso168841a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680796776;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AplaefBCy4jgU0hSoDn8uiF5723L/p4wjvwrPGw0IfA=;
 b=gGKuB4DXICi8Qyrsr/iB5D2crNbj234tTQQX25ZKovI11TOejRxqtHRV9XZSwmjbsm
 dyCTMAPlbXxtY2BjIa33zif3zSmqA/s3H/rScTKe9O96zoPrBkuZURo9TcM/hokdgXKK
 ZLYF17+DF5Y6/cYDuwrWaCJ0PdcZI3b16iG2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796776;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AplaefBCy4jgU0hSoDn8uiF5723L/p4wjvwrPGw0IfA=;
 b=pRc1gQfGzjvUgDs8/oKKx1Zp5TSU/60a6zIjKjKP/AXwsJrqwW2eMeqpWj1MSMj46N
 0n3plX4z/XJid0xYhnL6aqMugo4qJdmlmSe0wFStDsLg/ghqoJ1Rv1RuNwECIggX2WLD
 8jEkjdHT9BwrZ+XksUgJbE81xIWbZMn8+rP0ekPUuIoGCUhAtl0ULjzW2RV38rGd12Sa
 DIcS7760L9VQzFMznN9tBkRIstmzd7NhKbii/ygjvI8NeA+W60vZ1/SnI/XivQCMwXlM
 YexmtfH68+tk83oXJDtLbbonZfLpaFi8QcDMw3AGzvOZEsRpahYvJ/5ITq2CShRgWXfB
 zB8g==
X-Gm-Message-State: AAQBX9eC+7RCtFLOWqouxA0+g9iX/lRThqVC4LW6ri+QxRGgvmrKFK4f
 Zz2d/wO2txxyaKLteQXrTrDIhw==
X-Google-Smtp-Source: AKy350YHIgePAu2+ro+fzbAXMA/CtM0AI/WX/4aNshApMGbl7AMOGARvO0Mww9K50QkZRokT46Ekag==
X-Received: by 2002:a05:6402:27ce:b0:502:c397:adc8 with SMTP id
 c14-20020a05640227ce00b00502c397adc8mr63407ede.1.1680796776024; 
 Thu, 06 Apr 2023 08:59:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 i11-20020a50870b000000b004bd6e3ed196sm892265edb.86.2023.04.06.08.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:59:35 -0700 (PDT)
Date: Thu, 6 Apr 2023 17:59:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Message-ID: <ZC7sZfn9XJpqN7ni@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, yuq825@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
 <31f03135-40e4-a6ad-37e0-3b434a37922d@amd.com>
 <9ac69b11802331f9e024ab837b85214c4243e3fd.camel@pengutronix.de>
 <cdc29af8-8c04-cf46-1872-3feab954bc55@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdc29af8-8c04-cf46-1872-3feab954bc55@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com, lina@asahilina.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 yuq825@gmail.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 05:33:18PM +0200, Christian König wrote:
> Am 06.04.23 um 17:24 schrieb Lucas Stach:
> > Am Donnerstag, dem 06.04.2023 um 16:21 +0200 schrieb Christian König:
> > > Am 06.04.23 um 12:45 schrieb Lucas Stach:
> > > > Am Donnerstag, dem 06.04.2023 um 10:27 +0200 schrieb Daniel Vetter:
> > > > > On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
> > > > > > Am 05.04.23 um 18:09 schrieb Luben Tuikov:
> > > > > > > On 2023-04-05 10:05, Danilo Krummrich wrote:
> > > > > > > > On 4/4/23 06:31, Luben Tuikov wrote:
> > > > > > > > > On 2023-03-28 04:54, Lucas Stach wrote:
> > > > > > > > > > Hi Danilo,
> > > > > > > > > > 
> > > > > > > > > > Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
> > > > > > > > > > > Hi all,
> > > > > > > > > > > 
> > > > > > > > > > > Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
> > > > > > > > > > > tries to track the accumulated time that a job was active on the GPU
> > > > > > > > > > > writing it to the entity through which the job was deployed to the
> > > > > > > > > > > scheduler originally. This is done within drm_sched_get_cleanup_job()
> > > > > > > > > > > which fetches a job from the schedulers pending_list.
> > > > > > > > > > > 
> > > > > > > > > > > Doing this can result in a race condition where the entity is already
> > > > > > > > > > > freed, but the entity's newly added elapsed_ns field is still accessed
> > > > > > > > > > > once the job is fetched from the pending_list.
> > > > > > > > > > > 
> > > > > > > > > > > After drm_sched_entity_destroy() being called it should be safe to free
> > > > > > > > > > > the structure that embeds the entity. However, a job originally handed
> > > > > > > > > > > over to the scheduler by this entity might still reside in the
> > > > > > > > > > > schedulers pending_list for cleanup after drm_sched_entity_destroy()
> > > > > > > > > > > already being called and the entity being freed. Hence, we can run into
> > > > > > > > > > > a UAF.
> > > > > > > > > > > 
> > > > > > > > > > Sorry about that, I clearly didn't properly consider this case.
> > > > > > > > > > 
> > > > > > > > > > > In my case it happened that a job, as explained above, was just picked
> > > > > > > > > > > from the schedulers pending_list after the entity was freed due to the
> > > > > > > > > > > client application exiting. Meanwhile this freed up memory was already
> > > > > > > > > > > allocated for a subsequent client applications job structure again.
> > > > > > > > > > > Hence, the new jobs memory got corrupted. Luckily, I was able to
> > > > > > > > > > > reproduce the same corruption over and over again by just using
> > > > > > > > > > > deqp-runner to run a specific set of VK test cases in parallel.
> > > > > > > > > > > 
> > > > > > > > > > > Fixing this issue doesn't seem to be very straightforward though (unless
> > > > > > > > > > > I miss something), which is why I'm writing this mail instead of sending
> > > > > > > > > > > a fix directly.
> > > > > > > > > > > 
> > > > > > > > > > > Spontaneously, I see three options to fix it:
> > > > > > > > > > > 
> > > > > > > > > > > 1. Rather than embedding the entity into driver specific structures
> > > > > > > > > > > (e.g. tied to file_priv) we could allocate the entity separately and
> > > > > > > > > > > reference count it, such that it's only freed up once all jobs that were
> > > > > > > > > > > deployed through this entity are fetched from the schedulers pending list.
> > > > > > > > > > > 
> > > > > > > > > > My vote is on this or something in similar vain for the long term. I
> > > > > > > > > > have some hope to be able to add a GPU scheduling algorithm with a bit
> > > > > > > > > > more fairness than the current one sometime in the future, which
> > > > > > > > > > requires execution time tracking on the entities.
> > > > > > > > > Danilo,
> > > > > > > > > 
> > > > > > > > > Using kref is preferable, i.e. option 1 above.
> > > > > > > > I think the only real motivation for doing that would be for generically
> > > > > > > > tracking job statistics within the entity a job was deployed through. If
> > > > > > > > we all agree on tracking job statistics this way I am happy to prepare a
> > > > > > > > patch for this option and drop this one:
> > > > > > > > https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
> > > > > > > Hmm, I never thought about "job statistics" when I preferred using kref above.
> > > > > > > The reason kref is attractive is because one doesn't need to worry about
> > > > > > > it--when the last user drops the kref, the release is called to do
> > > > > > > housekeeping. If this never happens, we know that we have a bug to debug.
> > > > > > Yeah, reference counting unfortunately have some traps as well. For
> > > > > > example rarely dropping the last reference from interrupt context or
> > > > > > with some unexpected locks help when the cleanup function doesn't expect
> > > > > > that is a good recipe for problems as well.
> > > > > > 
> > > > Fully agreed.
> > > > 
> > > > > > > Regarding the patch above--I did look around the code, and it seems safe,
> > > > > > > as per your analysis, I didn't see any reference to entity after job submission,
> > > > > > > but I'll comment on that thread as well for the record.
> > > > > > Reference counting the entities was suggested before. The intentionally
> > > > > > avoided that so far because the entity might be the tip of the iceberg
> > > > > > of stuff you need to keep around.
> > > > > > 
> > > > > > For example for command submission you also need the VM and when you
> > > > > > keep the VM alive you also need to keep the file private alive....
> > > > > Yeah refcounting looks often like the easy way out to avoid
> > > > > use-after-free issue, until you realize you've just made lifetimes
> > > > > unbounded and have some enourmous leaks: entity keeps vm alive, vm
> > > > > keeps all the bo alives, somehow every crash wastes more memory
> > > > > because vk_device_lost means userspace allocates new stuff for
> > > > > everything.
> > > > > 
> > > > > If possible a lifetime design where lifetimes have hard bounds and you
> > > > > just borrow a reference under a lock (or some other ownership rule) is
> > > > > generally much more solid. But also much harder to design correctly
> > > > > :-/
> > > > > 
> > > > The use we are discussing here is to keep the entity alive as long as
> > > > jobs from that entity are still active on the HW. While there are no
> > > > hard bounds on when a job will get inactive, at least it's not
> > > > unbounded. On a crash/fault the job will be removed from the hardware
> > > > pretty soon.
> > > > 
> > > > Well behaved jobs after a application shutdown might take a little
> > > > longer, but I don't really see the new problem with keeping the entity
> > > > alive? As long as a job is active on the hardware, we can't throw out
> > > > the VM or BOs, no difference whether the entity is kept alive or not.
> > > Exactly that's the problem. VM & BOs are dropped as soon as the process
> > > is destroyed, we *don't* wait for the hw to finish before doing so.
> > > 
> > > Just the backing store managed by all the house keeping objects isn't
> > > freed until the hw is idle preventing a crash or accessing freed memory.
> > > 
> > > This behavior is rather important for the OOM killer since we need to be
> > > able to tear down the process as fast as possible in that case.
> > > 
> > Are you talking about the dropping of pending jobs in
> > drm_sched_entity_kill? I'm certainly not trying to change that in any
> > way. Those aren't put onto the hardware yet, so we can always safely
> > drop them and do so as fast as possible.
> > 
> > What I'm concerned about are the jobs that are already scheduled on the
> > HW. At least with Vivante hardware there is no race free way to get rid
> > of jobs once they are put on the ring. So whatever the scheduler or DRM
> > core is doing, we have to hold on to the BOs and GPU memory management
> > structures to keep the hardware from operating on freed memory.
> > 
> > That's already a lot of memory, so I don't really see the issue with
> > keeping the entity around in a quiescent state until all the currently
> > queued jobs have left the HW.
> > 
> > > Changing that is possible, but that's quite a huge change I'm not really
> > > willing to do just for tracking the time spend.
> > > 
> > Yea, it's a big change and whether it's a good idea really depends on
> > what we a gaining from it. You seem to see quite low value in "just
> > tracking the time spent" and that might be true, but it also forces all
> > drivers that want to implement fdinfo to roll their own time tracking.
> > I would rather see more of this moved to the scheduler and thus shared
> > between drivers.
> 
> That's generally a good idea, but if that means that we need to restructure
> the whole entity handling then I would object. That's simply not worth it
> when we can implement it differently.
> 
> What we could do is to keep the submitted fences around in the entity.
> Similar to the tracking amdgpu does, see struct amdgpu_ctx_entity.
> 
> This way the entity doesn't needs to stay around after it delivered the job
> to the hw.

I've done a _very_ cursory look, but from that the design seems to be that
we only keep something very small around to avoid oopsing (just
drm_sched_entity) and the overall gpu ctx goes away synchronously (more or
less) when userspace destroys it.

And then the actual fdinfo reporting or any reporting is a pure pull model
where you come from drm_file -> gpu ctx -> amdgpu_ctx_entity and have
borrowed references by holding enough locks.

The push model, where the scheduler job actively pushes the stats all the
way to the userspace/uapi ctx object is imo impossible to get right.
i915-gem tried a few times, and solutions start with sprinkling rcu
everywhere and only get worse. Imo absolute no-go.

If I understand this right then yes I think extracting the
amgpu_ctx_entity split into a bit of helper. Might want to extract the
context xarray and lookup too and put it into drm_file, including the
amdgpu_ctx_mgr->lock and iterating over stats for fdinfo maybe too to make
this really worth it.

Of all the failed attempts I've seen for exposing ctx stats this (amdgpu
push model) is imo the only solid one.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
