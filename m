Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E486BC1C91
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3206610E1AC;
	Tue,  7 Oct 2025 14:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dz+luGCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561E910E1AC;
 Tue,  7 Oct 2025 14:45:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 70FF461608;
 Tue,  7 Oct 2025 14:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BADC4CEF9;
 Tue,  7 Oct 2025 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759848308;
 bh=stqZpe7AXYgm3Xi9RQkXPgRZUpHQuqJD3/Q7tWQN9eQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dz+luGCkU/q7b+lUovIWBdPR6tp/x+UDkUmG1jefOKvxEYtdIl3qRNaScxmSSqK9p
 /51G8JFeKYKPgzKEqefazI902TXbDeLL5/rHn2H4hcOxFEFAPzULk2sxfNCxPl4+4g
 kDBGqJFG9mSFeLZ4+jN+IALwMo2PcsWTv+efNHfzbnKjdkZdwlnjzAsckncdGFIMOc
 AvjNYcLoefyrOZnGZp+56QBDpVCduXAHGFf4XQu5o36cjizefLxp0YEOBn4Ady7ZXo
 00Ao3rdCyrF/afuMMwn0LIuQPkUNO5KZtY30UrgQHhZaMKpZHBpFDkqQSgbWgVXHnG
 740xO3o8jfHag==
Message-ID: <aa7dedae-8f31-49f9-ad73-009cb8550b93@kernel.org>
Date: Tue, 7 Oct 2025 16:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 00/21] DRM scheduling cgroup controller
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Leo Liu <Leo.Liu@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Rob Clark <robdclark@gmail.com>, Tejun Heo <tj@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqunf@netflix.com>,
 =?UTF-8?B?R3LDqWdvaXJlIFDDqWFu?= <gpean@netflix.com>,
 Simona Vetter <simona@ffwll.ch>, airlied@gmail.com
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
 <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
 <4453e5989b38e99588efd53af674b69016b2c420.camel@mailbox.org>
 <20250930121229.4f265e0c@fedora> <DD62YFG2CJ36.1NFKRTR2ZKD6V@kernel.org>
 <20250930135736.02b69c65@fedora>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930135736.02b69c65@fedora>
Content-Type: text/plain; charset=UTF-8
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

On 9/30/25 1:57 PM, Boris Brezillon wrote:
> Can you remind me what the problem is? I thought the lifetime issue was
> coming from the fact the drm_sched ownership model was lax enough that
> the job could be owned by both drm_gpu_scheduler and drm_sched_entity
> at the same time.

I don't think that's (directly) a thing from the perspective of the drm_sched
design. A job should be either in the entity queue for the pending_list of the
scheduler.

However, different drivers do implement their own lifetime (and ownership) model
on top of that, because they ultimately have to deal with jobs being either tied
to the entity or the scheduler lifetime, which is everything else but strait
forward in error cases and tear down paths.

And the fundamental problem why drivers implement their own rules on top of this
is because it is hard to deal with jobs being tied to entirely different
lifetime model depending on their state.

So, what I'm saying is that from the perspective of the component itself it's
probably fine, but for the application in drivers it's the root cause for a lot
of the hacks we see on top of the scheduler in drivers.

Some of those hacks even make their way into the scheduler [1].

[1]
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/scheduler/sched_main.c#L1439

>> Instead, I think the new Jobqueue should always own and always dispatch jobs
>> directly and provide some "control API" to be instructed by an external
>> component (orchestrator) on top of it when and to which ring to dispatch jobs.
> 
> Feels to me that we're getting back to a model where the JobQueue needs
> to know about the upper-layer in charge of the scheduling. I mean, it
> can work, but you're adding some complexity back to JobQueue, which I
> was expecting to be a simple FIFO with a dep-tracking logic.

Yes, the Jobqueue would need an interface to the orchestrator. I rather have the
complexity encapsulated in the Jobqueue, rather than pushing the complexity to
drivers by having a more complex lifetime and ownership model that leaks into
drivers as mentioned above.

> I have a hard time seeing how it can fully integrate in this
> orchestrator model. We can hook ourselves in the JobQueue::run_job()
> and schedule the group for execution when we queue a job to the
> ringbuf, but the group scheduler would still be something on the side.

Can you please expand a bit more on the group model?

My understanding is that you have a limited number of firmware rings (R) and
each of those rings has N slots, where N is the number of queue types supported
by the GPU.

So, you need something that can schedule "groups" of queues over all available
firmware rings, because it would be pointless to schedule each individual queue
independently, as a firmware ring has slots for each of those. Is that correct?
