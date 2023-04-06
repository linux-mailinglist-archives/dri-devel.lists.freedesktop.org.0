Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BA6D96C8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 14:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963D10E19F;
	Thu,  6 Apr 2023 12:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D89510E19F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 12:09:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso130412166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 05:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680782965;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qxwIvLbuaEmD2gn/h0N3dqz+zjp2+5fxd2V7QfP3pVo=;
 b=VC1EPgM8d5GwtAzQhlb4h7HeMNHJ/sKJtKc1nyAt7IJqQubxEYCDaDbBalrjghmEV1
 00CiKCgkzMnK4hhq9vl63yyK/mgyc0aU69CRCfq0AQs6WbhuQAAR49gLjEeFN27no4pB
 XYZaX5WXpi8ImgTgwSRQEpwqXfz6dPV2rYQG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680782965;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qxwIvLbuaEmD2gn/h0N3dqz+zjp2+5fxd2V7QfP3pVo=;
 b=2Ph78W2q1HRqf3P0Yc+1uzdPyi1L2xO8k0uFTAIzo2VeZ6B70mbEjLraCht7O0raZ3
 +1YalZi76N48s09UdAmYEzYaKSAsGfO0nnEiLURXAesNq2VdRaeY9EIIFChzww7qLZDP
 Pm4uZ7kb1MlE47Hr5nAwtfSfE414i6TG+YWcgDZnVkgVxeex6AAukbsNylWI4OqBdqGv
 llUeO4Snf8nRGnCvER0gDrFjMsXyxW0Nt8TuSkA9vj2aMBD2Ko4IP0SOSggCyspSUVhQ
 NVFw2Ybn40WL4Wz8dwIvt6uzPQ7nbBeMK5NSdEjcdxyjG0RgmGP7ZoOqtzbSWPQka+CM
 Us7g==
X-Gm-Message-State: AAQBX9cBahFp0kgCsqH1Wnldhuv4/Fr90QliMjCTscowucruatQKk7/X
 ZkIsksdzp2gl51Zgoruk04v5Ow==
X-Google-Smtp-Source: AKy350bgp9m5wAlN/ve5aFiUGc41tihpV+khzEinMGkwvw/cGx/RgfVnZydDbJZJSoS9niPbeXFQgQ==
X-Received: by 2002:a05:6402:4413:b0:502:465:28d4 with SMTP id
 y19-20020a056402441300b00502046528d4mr7027369eda.1.1680782965648; 
 Thu, 06 Apr 2023 05:09:25 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 lf11-20020a170907174b00b0092b546b57casm721280ejc.195.2023.04.06.05.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 05:09:25 -0700 (PDT)
Date: Thu, 6 Apr 2023 14:09:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Message-ID: <ZC62cxVD5xc31FEL@phenom.ffwll.local>
Mail-Followup-To: Lucas Stach <l.stach@pengutronix.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, yuq825@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 12:45:12PM +0200, Lucas Stach wrote:
> Am Donnerstag, dem 06.04.2023 um 10:27 +0200 schrieb Daniel Vetter:
> > On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
> > > 
> > > Am 05.04.23 um 18:09 schrieb Luben Tuikov:
> > > > On 2023-04-05 10:05, Danilo Krummrich wrote:
> > > > > On 4/4/23 06:31, Luben Tuikov wrote:
> > > > > > On 2023-03-28 04:54, Lucas Stach wrote:
> > > > > > > Hi Danilo,
> > > > > > > 
> > > > > > > Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
> > > > > > > > Hi all,
> > > > > > > > 
> > > > > > > > Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
> > > > > > > > tries to track the accumulated time that a job was active on the GPU
> > > > > > > > writing it to the entity through which the job was deployed to the
> > > > > > > > scheduler originally. This is done within drm_sched_get_cleanup_job()
> > > > > > > > which fetches a job from the schedulers pending_list.
> > > > > > > > 
> > > > > > > > Doing this can result in a race condition where the entity is already
> > > > > > > > freed, but the entity's newly added elapsed_ns field is still accessed
> > > > > > > > once the job is fetched from the pending_list.
> > > > > > > > 
> > > > > > > > After drm_sched_entity_destroy() being called it should be safe to free
> > > > > > > > the structure that embeds the entity. However, a job originally handed
> > > > > > > > over to the scheduler by this entity might still reside in the
> > > > > > > > schedulers pending_list for cleanup after drm_sched_entity_destroy()
> > > > > > > > already being called and the entity being freed. Hence, we can run into
> > > > > > > > a UAF.
> > > > > > > > 
> > > > > > > Sorry about that, I clearly didn't properly consider this case.
> > > > > > > 
> > > > > > > > In my case it happened that a job, as explained above, was just picked
> > > > > > > > from the schedulers pending_list after the entity was freed due to the
> > > > > > > > client application exiting. Meanwhile this freed up memory was already
> > > > > > > > allocated for a subsequent client applications job structure again.
> > > > > > > > Hence, the new jobs memory got corrupted. Luckily, I was able to
> > > > > > > > reproduce the same corruption over and over again by just using
> > > > > > > > deqp-runner to run a specific set of VK test cases in parallel.
> > > > > > > > 
> > > > > > > > Fixing this issue doesn't seem to be very straightforward though (unless
> > > > > > > > I miss something), which is why I'm writing this mail instead of sending
> > > > > > > > a fix directly.
> > > > > > > > 
> > > > > > > > Spontaneously, I see three options to fix it:
> > > > > > > > 
> > > > > > > > 1. Rather than embedding the entity into driver specific structures
> > > > > > > > (e.g. tied to file_priv) we could allocate the entity separately and
> > > > > > > > reference count it, such that it's only freed up once all jobs that were
> > > > > > > > deployed through this entity are fetched from the schedulers pending list.
> > > > > > > > 
> > > > > > > My vote is on this or something in similar vain for the long term. I
> > > > > > > have some hope to be able to add a GPU scheduling algorithm with a bit
> > > > > > > more fairness than the current one sometime in the future, which
> > > > > > > requires execution time tracking on the entities.
> > > > > > Danilo,
> > > > > > 
> > > > > > Using kref is preferable, i.e. option 1 above.
> > > > > I think the only real motivation for doing that would be for generically
> > > > > tracking job statistics within the entity a job was deployed through. If
> > > > > we all agree on tracking job statistics this way I am happy to prepare a
> > > > > patch for this option and drop this one:
> > > > > https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
> > > > Hmm, I never thought about "job statistics" when I preferred using kref above.
> > > > The reason kref is attractive is because one doesn't need to worry about
> > > > it--when the last user drops the kref, the release is called to do
> > > > housekeeping. If this never happens, we know that we have a bug to debug.
> > > 
> > > Yeah, reference counting unfortunately have some traps as well. For
> > > example rarely dropping the last reference from interrupt context or
> > > with some unexpected locks help when the cleanup function doesn't expect
> > > that is a good recipe for problems as well.
> > > 
> Fully agreed.
> 
> > > > Regarding the patch above--I did look around the code, and it seems safe,
> > > > as per your analysis, I didn't see any reference to entity after job submission,
> > > > but I'll comment on that thread as well for the record.
> > > 
> > > Reference counting the entities was suggested before. The intentionally
> > > avoided that so far because the entity might be the tip of the iceberg
> > > of stuff you need to keep around.
> > > 
> > > For example for command submission you also need the VM and when you
> > > keep the VM alive you also need to keep the file private alive....
> > 
> > Yeah refcounting looks often like the easy way out to avoid
> > use-after-free issue, until you realize you've just made lifetimes
> > unbounded and have some enourmous leaks: entity keeps vm alive, vm
> > keeps all the bo alives, somehow every crash wastes more memory
> > because vk_device_lost means userspace allocates new stuff for
> > everything.
> > 
> > If possible a lifetime design where lifetimes have hard bounds and you
> > just borrow a reference under a lock (or some other ownership rule) is
> > generally much more solid. But also much harder to design correctly
> > :-/
> > 
> The use we are discussing here is to keep the entity alive as long as
> jobs from that entity are still active on the HW. While there are no
> hard bounds on when a job will get inactive, at least it's not
> unbounded. On a crash/fault the job will be removed from the hardware
> pretty soon.
> 
> Well behaved jobs after a application shutdown might take a little
> longer, but I don't really see the new problem with keeping the entity
> alive? As long as a job is active on the hardware, we can't throw out
> the VM or BOs, no difference whether the entity is kept alive or not.
> 
> Some hardware might have ways to expedite job inactivation by
> deactivating scheduling queues, or just taking a fault, but for some HW
> we'll just have to wait for the job to finish.

Shouldn't the scheduler's timed_out/tdr logic take care of these? It's
probably not good to block in something like the close(drmfd) or process
exit() for these, but it's all dma_fence underneath and those _must_
singal in finite time no matter what. So shouldn't be a deadlock problem,
but might still be a "userspace really doesn't like a big stall there"
problem.
-Daniel

> Regards,
> Lucas
> 
> > > Additional to that we have some ugly inter dependencies between tearing
> > > down an application (potential with a KILL signal from the OOM killer)
> > > and backward compatibility for some applications which render something
> > > and quit before the rendering is completed in the hardware.
> > 
> > Yeah I think that part would also be good to sort out once&for all in
> > drm/sched, because i915 has/had the same struggle.
> > -Daniel
> > 
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > 
> > > > Regards,
> > > > Luben
> > > > 
> > > > > Christian mentioned amdgpu tried something similar to what Lucas tried
> > > > > running into similar trouble, backed off and implemented it in another
> > > > > way - a driver specific way I guess?
> > > > > 
> > > > > > Lucas, can you shed some light on,
> > > > > > 
> > > > > > 1. In what way the current FIFO scheduling is unfair, and
> > > > > > 2. shed some details on this "scheduling algorithm with a bit
> > > > > > more fairness than the current one"?
> > > > > > 
> > > > > > Regards,
> > > > > > Luben
> > > > > > 
> > > > > > > > 2. Somehow make sure drm_sched_entity_destroy() does block until all
> > > > > > > > jobs deployed through this entity were fetched from the schedulers
> > > > > > > > pending list. Though, I'm pretty sure that this is not really desirable.
> > > > > > > > 
> > > > > > > > 3. Just revert the change and let drivers implement tracking of GPU
> > > > > > > > active times themselves.
> > > > > > > > 
> > > > > > > Given that we are already pretty late in the release cycle and etnaviv
> > > > > > > being the only driver so far making use of the scheduler elapsed time
> > > > > > > tracking I think the right short term solution is to either move the
> > > > > > > tracking into etnaviv or just revert the change for now. I'll have a
> > > > > > > look at this.
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Lucas
> > > > > > > 
> > > > > > > > In the case of just reverting the change I'd propose to also set a jobs
> > > > > > > > entity pointer to NULL  once the job was taken from the entity, such
> > > > > > > > that in case of a future issue we fail where the actual issue resides
> > > > > > > > and to make it more obvious that the field shouldn't be used anymore
> > > > > > > > after the job was taken from the entity.
> > > > > > > > 
> > > > > > > > I'm happy to implement the solution we agree on. However, it might also
> > > > > > > > make sense to revert the change until we have a solution in place. I'm
> > > > > > > > also happy to send a revert with a proper description of the problem.
> > > > > > > > Please let me know what you think.
> > > > > > > > 
> > > > > > > > - Danilo
> > > > > > > > 
> > > 
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
