Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3FBC1F89
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CB10E6D5;
	Tue,  7 Oct 2025 15:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OgWsgG8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B7010E1C2;
 Tue,  7 Oct 2025 15:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759851875;
 bh=tdvi4W0xjX37x+KyKt5JT1k5u+Wzab6OWefO1NyCTMc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OgWsgG8/2zlJTXxDwMQaGCO9N4mZ2PHYuIKJfKDy/qtc5dnikAJwJn7AHudLWcNmr
 qcCbRrqte4yOi/ab4r6sKUP98DIeF5mSYzzKZ8fwZJvZTqZRbVTh1YfIxptw7Vkm5K
 nD6ty+pwCnfAfyR3l5cwMiHD0QVhIjospljKQ1/MUL3z1blLmqIUPT9KnrmKnePkIU
 rBUWDo49xHg5ZYISCSWSzK88XviPtVfpRGjcwf3OTnrzzamwj6e/k/5O1B9BdWTUEj
 x15i9hUBUt92SONWztJfCm1DqkWRZDyqe1faitrUCXS6recp8ClqE386PBCl8Msarj
 ag3zuuzuTuJMA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 49DBC17E10B7;
 Tue,  7 Oct 2025 17:44:34 +0200 (CEST)
Date: Tue, 7 Oct 2025 17:44:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Leo Liu <Leo.Liu@amd.com>, =?UTF-8?B?TWHDrXJh?=
 Canal <mcanal@igalia.com>, Matthew Brost <matthew.brost@intel.com>, Michal
 =?UTF-8?B?S291dG7DvQ==?= <mkoutny@suse.com>, Michel =?UTF-8?B?RMOkbnpl?=
 =?UTF-8?B?cg==?= <michel.daenzer@mailbox.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Rob Clark <robdclark@gmail.com>,
 Tejun Heo <tj@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alex
 Deucher <alexander.deucher@amd.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqunf@netflix.com>,
 =?UTF-8?B?R3LDqWdvaXJlIFDDqWFu?= <gpean@netflix.com>, Simona Vetter
 <simona@ffwll.ch>, airlied@gmail.com
Subject: Re: [RFC v8 00/21] DRM scheduling cgroup controller
Message-ID: <20251007174429.0fc0ad84@fedora>
In-Reply-To: <aa7dedae-8f31-49f9-ad73-009cb8550b93@kernel.org>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
 <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
 <4453e5989b38e99588efd53af674b69016b2c420.camel@mailbox.org>
 <20250930121229.4f265e0c@fedora>
 <DD62YFG2CJ36.1NFKRTR2ZKD6V@kernel.org>
 <20250930135736.02b69c65@fedora>
 <aa7dedae-8f31-49f9-ad73-009cb8550b93@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 7 Oct 2025 16:44:59 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On 9/30/25 1:57 PM, Boris Brezillon wrote:
> > Can you remind me what the problem is? I thought the lifetime issue was
> > coming from the fact the drm_sched ownership model was lax enough that
> > the job could be owned by both drm_gpu_scheduler and drm_sched_entity
> > at the same time.  
> 
> I don't think that's (directly) a thing from the perspective of the drm_sched
> design. A job should be either in the entity queue for the pending_list of the
> scheduler.
> 
> However, different drivers do implement their own lifetime (and ownership) model
> on top of that, because they ultimately have to deal with jobs being either tied
> to the entity or the scheduler lifetime, which is everything else but strait
> forward in error cases and tear down paths.
> 
> And the fundamental problem why drivers implement their own rules on top of this
> is because it is hard to deal with jobs being tied to entirely different
> lifetime model depending on their state.
> 
> So, what I'm saying is that from the perspective of the component itself it's
> probably fine, but for the application in drivers it's the root cause for a lot
> of the hacks we see on top of the scheduler in drivers.
> 
> Some of those hacks even make their way into the scheduler [1].
> 
> [1]
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/scheduler/sched_main.c#L1439
> 
> >> Instead, I think the new Jobqueue should always own and always dispatch jobs
> >> directly and provide some "control API" to be instructed by an external
> >> component (orchestrator) on top of it when and to which ring to dispatch jobs.  
> > 
> > Feels to me that we're getting back to a model where the JobQueue needs
> > to know about the upper-layer in charge of the scheduling. I mean, it
> > can work, but you're adding some complexity back to JobQueue, which I
> > was expecting to be a simple FIFO with a dep-tracking logic.  
> 
> Yes, the Jobqueue would need an interface to the orchestrator. I rather have the
> complexity encapsulated in the Jobqueue, rather than pushing the complexity to
> drivers by having a more complex lifetime and ownership model that leaks into
> drivers as mentioned above.
> 
> > I have a hard time seeing how it can fully integrate in this
> > orchestrator model. We can hook ourselves in the JobQueue::run_job()
> > and schedule the group for execution when we queue a job to the
> > ringbuf, but the group scheduler would still be something on the side.  
> 
> Can you please expand a bit more on the group model?
> 
> My understanding is that you have a limited number of firmware rings (R) and
> each of those rings has N slots, where N is the number of queue types supported
> by the GPU.

Honestly, the naming is a bit confusing, because for us, the ring
buffer is what gets attached to each queue and contains the jobs to be
executed on that queue. But other than this naming issue, that's pretty
much it, yes.

> 
> So, you need something that can schedule "groups" of queues over all available
> firmware rings, because it would be pointless to schedule each individual queue
> independently, as a firmware ring has slots for each of those. Is that correct?

It's not just that it would be pointless, it's not even an option,
because there are inter-queue synchronization mechanisms that only work
if the queues belong to the same group.
