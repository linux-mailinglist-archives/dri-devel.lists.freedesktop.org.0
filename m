Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D135BBACBD8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A716710E596;
	Tue, 30 Sep 2025 11:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mJeoLlpS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E7310E2AE;
 Tue, 30 Sep 2025 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759233462;
 bh=qBZX0z5CnOtN7+UQ2lvEHHirZ93sseSix/A1K8cdiFc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mJeoLlpS6xMi4xx9XPVrj1slSC3EBhW5J/50vIMfQpudGEZWvZIr/sfcQCNuoQXKL
 ZN76YNOMXYENCdJmsXhZjHuVXocD4Yv+VCe6kU7zNGGHaahVq0up4j9wj958kGv/fm
 cqz/o/FCiw7xYQmEmlCGVN/li8NGMFCKIHFza9waOwa2QuNI0oCQP9pGcDHbEObhU9
 1J2TtCj7pAnntE45uJAR5JBkNEtnNgQEH7KjcvWcEMflfg/xSMmAu7c3mDucT4qiNM
 OZbgWZOYimySVkz8BQR3sd93NttuCTuMJJWWoALkfMez3bUrLmJdw9SWG8hTBRRSM0
 1qdZ4npgF3cbg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 18DA717E00A8;
 Tue, 30 Sep 2025 13:57:41 +0200 (CEST)
Date: Tue, 30 Sep 2025 13:57:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <cgroups@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Leo Liu" <Leo.Liu@amd.com>, =?UTF-8?B?TWE=?=
 =?UTF-8?B?w61yYQ==?= Canal <mcanal@igalia.com>, "Matthew Brost"
 <matthew.brost@intel.com>, Michal =?UTF-8?B?S291dG7DvQ==?=
 <mkoutny@suse.com>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <michel.daenzer@mailbox.org>, "Pierre-Eric Pelloux-Prayer"
 <pierre-eric.pelloux-prayer@amd.com>, "Rob Clark" <robdclark@gmail.com>,
 "Tejun Heo" <tj@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alex Deucher" <alexander.deucher@amd.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Rob Herring" <robh@kernel.org>, "Steven Price"
 <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Boqun Feng" <boqunf@netflix.com>, =?UTF-8?B?R3I=?=
 =?UTF-8?B?w6lnb2lyZSBQw6lhbg==?= <gpean@netflix.com>, "Simona Vetter"
 <simona@ffwll.ch>, <airlied@gmail.com>
Subject: Re: [RFC v8 00/21] DRM scheduling cgroup controller
Message-ID: <20250930135736.02b69c65@fedora>
In-Reply-To: <DD62YFG2CJ36.1NFKRTR2ZKD6V@kernel.org>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
 <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
 <4453e5989b38e99588efd53af674b69016b2c420.camel@mailbox.org>
 <20250930121229.4f265e0c@fedora>
 <DD62YFG2CJ36.1NFKRTR2ZKD6V@kernel.org>
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

On Tue, 30 Sep 2025 12:58:29 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Tue Sep 30, 2025 at 12:12 PM CEST, Boris Brezillon wrote:
> > So, my take on that is that what we want ultimately is to have the
> > functionality provided by drm_sched split into different
> > components that can be used in isolation, or combined to provide
> > advanced scheduling.
> >
> > JobQueue:
> >  - allows you to queue jobs with their deps
> >  - dequeues jobs once their deps are met
> > Not too sure if we want a push or a pull model for the job dequeuing,
> > but the idea is that once the job is dequeued, ownership is passed to
> > the SW entity that dequeued it. Note that I intentionally didn't add
> > the timeout handling here, because dequeueing a job doesn't necessarily
> > mean it's started immediately. If you're dealing with HW queues, you
> > might have to wait for a slot to become available. If you're dealing
> > with something like Mali-CSF, where the amount of FW slots is limited,
> > you want to wait for your execution context to be passed to the FW for
> > scheduling, and the final situation is the full-fledged FW scheduling,
> > where you want things to start as soon as you have space in your FW
> > queue (AKA ring-buffer?).
> >
> > JobHWDispatcher: (not sure about the name, I'm bad at naming things)
> > This object basically pulls ready-jobs from one or multiple JobQueues
> > into its own queue, and wait for a HW slot to become available. If you
> > go for the push model, the job gets pushed to the HW dispatcher queue
> > and waits here until a HW slot becomes available.
> > That's where timeouts should be handled, because the job only becomes
> > active when it gets pushed to a HW slot. I guess if we want a
> > resubmit mechanism, it would have to take place here, but give how
> > tricky this has been, I'd be tempted to leave that to drivers, that is,
> > let them requeue the non-faulty jobs directly to their
> > JobHWDispatcher implementation after a reset.
> >
> > FWExecutionContextScheduler: (again, pick a different name if you want)
> > This scheduler doesn't know about jobs, meaning there's a
> > driver-specific entity that needs to dequeue jobs from the JobQueue
> > and push those to the relevant ringbuffer. Once a FWExecutionContext
> > has something to execute, it becomes a candidate for
> > FWExecutionContextScheduler, which gets to decide which set of
> > FWExecutionContext get a chance to be scheduled by the FW.
> > That one is for Mali-CSF case I described above, and I'm not too sure
> > we want it to be generic, at least not until we have another GPU driver
> > needing the same kind of scheduling. Again, you want to defer the
> > timeout handling to this component, because the timer should only
> > start/resume when the FWExecutionContext gets scheduled, and it should
> > be paused as soon as the context gets evicted.  
> 
> This sounds pretty much like the existing design with the Panthor group
> scheduler layered on top of it, no?

Kinda, but with a way to use each component independently.

> 
> Though, one of the fundamental problems I'd like to get rid of is that job
> ownership is transferred between two components with fundamentally different
> lifetimes (entity and scheduler).

Can you remind me what the problem is? I thought the lifetime issue was
coming from the fact the drm_sched ownership model was lax enough that
the job could be owned by both drm_gpu_scheduler and drm_sched_entity
at the same time.

> 
> Instead, I think the new Jobqueue should always own and always dispatch jobs
> directly and provide some "control API" to be instructed by an external
> component (orchestrator) on top of it when and to which ring to dispatch jobs.

Feels to me that we're getting back to a model where the JobQueue needs
to know about the upper-layer in charge of the scheduling. I mean, it
can work, but you're adding some complexity back to JobQueue, which I
was expecting to be a simple FIFO with a dep-tracking logic.

For instance, I'd be curious to know which component is in charge of the
timeout in your ochestrator-based solution? In Philipp's slides it
seemed that the timeout was dealt with at the JobQueue level, but that
wouldn't work for us, because when we push a job to the ringbuf in
panthor, the group this job is queued to might not be active yet. At
the moment we have hacks to pause/resume the drm_sched timers [1] but
this is racy, so I'm really hoping that the new design will let us
control the timeout at the proper level.

> 
> The group scheduling logic you need for some Mali GPUs can either be implemented
> by hooks into this orchestrator or by a separate component that attaches to the
> same control API of the Jobqueue.

I have a hard time seeing how it can fully integrate in this
orchestrator model. We can hook ourselves in the JobQueue::run_job()
and schedule the group for execution when we queue a job to the
ringbuf, but the group scheduler would still be something on the side.
This is not a big deal, as long as the group scheduler is in charge of
the timeout handling.

[1]https://lore-kernel.gnuweeb.org/dri-devel/CAPj87rP=HEfPDX8dDM_-BptLmt054x+WHZdCBZOtdMX=X4VkjA@mail.gmail.com/T/
