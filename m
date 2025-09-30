Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E840BAC6C0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FBF10E2A0;
	Tue, 30 Sep 2025 10:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UB6dAFZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FBC10E2A0;
 Tue, 30 Sep 2025 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759227157;
 bh=selF6cQUt8AkH+XXIHxUXrITKjtyIFNRSNbHA/pvUYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UB6dAFZfeSuSlKqjCvZtLjLgst96rz9LTXz06KaG+CFO1VlqutR5M15gMk5Qre65K
 +XbFWJT+IflNhDvsdLctPtzpulTBCt6Fcq0HkAg7zlTi2GruW8EuqgvGR99fuP5UlR
 BBCwzEKINjc9EQp+IczrDeYyL/e7E4CCNzmynsShgnQ1WX6vpucDsC8hLLfos0sOSK
 W0dbW9vAq2dF14F9fjsLVGWy2rtZ7yHteL/bkOzwtvMgGIpDZ7pYmRPucKidqQMjj0
 LC3WDtvcfL2hLpRZroP8ODQkjfMwElb5P1KmhplhJX8EigodbtfBEvYdEWycyj+uD6
 DFoYwuPaU8PuQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EBD4D17E129E;
 Tue, 30 Sep 2025 12:12:35 +0200 (CEST)
Date: Tue, 30 Sep 2025 12:12:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin 
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
Message-ID: <20250930121229.4f265e0c@fedora>
In-Reply-To: <4453e5989b38e99588efd53af674b69016b2c420.camel@mailbox.org>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
 <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
 <4453e5989b38e99588efd53af674b69016b2c420.camel@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hi all,

On Tue, 30 Sep 2025 11:00:00 +0200
Philipp Stanner <phasta@mailbox.org> wrote:

> +Cc Sima, Dave
>=20
> On Mon, 2025-09-29 at 16:07 +0200, Danilo Krummrich wrote:
> > On Wed Sep 3, 2025 at 5:23 PM CEST, Tvrtko Ursulin wrote: =20
> > > This is another respin of this old work^1 which since v7 is a total r=
ewrite and
> > > completely changes how the control is done. =20
> >=20
> > I only got some of the patches of the series, can you please send all o=
f them
> > for subsequent submissions? You may also want to consider resending if =
you're
> > not getting a lot of feedback due to that. :)
> >  =20
> > > On the userspace interface side of things it is the same as before. W=
e have
> > > drm.weight as an interface, taking integers from 1 to 10000, the same=
 as CPU and
> > > IO cgroup controllers. =20
> >=20
> > In general, I think it would be good to get GPU vendors to speak up to =
what kind
> > of interfaces they're heading to with firmware schedulers and potential=
 firmware
> > APIs to control scheduling; especially given that this will be a uAPI.
> >=20
> > (Adding a couple of folks to Cc.)
> >=20
> > Having that said, I think the basic drm.weight interface is fine and sh=
ould work
> > in any case; i.e. with the existing DRM GPU scheduler in both modes, the
> > upcoming DRM Jobqueue efforts and should be generic enough to work with
> > potential firmware interfaces we may see in the future.
> >=20
> > Philipp should be talking about the DRM Jobqueue component at XDC (prob=
ably just
> > in this moment).
> >=20
> > --
> >=20
> > Some more thoughts on the DRM Jobqueue and scheduling:
> >=20
> > The idea behind the DRM Jobqueue is to be, as the name suggests, a comp=
onent
> > that receives jobs from userspace, handles the dependencies (i.e. dma f=
ences),
> > and executes the job, e.g. by writing to a firmware managed software ri=
ng.
> >=20
> > It basically does what the GPU scheduler does in 1:1 entity-scheduler m=
ode,
> > just without all the additional complexity of moving job ownership from=
 one
> > component to another (i.e. from entity to scheduler, etc.).
> >=20
> > With just that, there is no scheduling outside the GPU's firmware sched=
uler of
> > course. However, additional scheduler capabilities, e.g. to support har=
dware
> > rings, or manage firmware schedulers that only support a limited number=
 of
> > software rings (like some Mali GPUs), can be layered on top of that:
> >=20
> > In contrast to the existing GPU scheduler, the idea would be to keep le=
tting the
> > DRM Jobqueue handle jobs submitted by userspace from end to end (i.e. l=
et the
> > push to the hardware (or software) ring buffer), but have an additional
> > component, whose only purpose is to orchestrate the DRM Jobqueues, by m=
anaging
> > when they are allowed to push to a ring and which ring they should push=
 to.
> >=20
> > This way we get rid of one of the issue that the existing GPU scheduler=
 moves
> > job ownership between components of different lifetimes (entity and sch=
eduler),
> > which is one of the fundamental hassles to deal with. =20
>=20
>=20
> So just a few minutes ago I had a long chat with Sima.
>=20
> Sima (and I, too, I think) thinks that the very few GPUs that have a
> reasonably low limit of firmware rings should just resource-limit
> userspace users once the limit of firmware rings is reached.
>=20
> Basically like with VRAM.
>=20
> Apparently Sima had suggested that to Panthor in the past? But Panthor
> still seems to have implemented yet another scheduler mechanism on top
> of the 1:1 entity-scheduler drm_sched setup?
>=20
> @Boris: Why was that done?

So, the primary reason was that the layer of scheduling we have doesn't
operate at the job or queue level, but at an higher level called group,
which is basically a collection of queues that have close interactions
(a group is backing a VkQueue, and in Mali, a VkQueue has a vertex
suqueue, a fragment subqueue and a compute subqueue). There's also some
fairness involved in our scheduling, where we rotate the priority of
groups over time so it's not always the same group that gets to execute
its workload. I tried to build a mental model of Sima's suggestion at
the time, but I never got to reconcile the job level scheduling
(forcing a limit on the amount of jobs that can be queued per-subqueue)
with the group level scheduling here, and it also didn't seem like
having this extra layer of scheduling was a big deal, because
ultimately, it doesn't get in the way of the single-entity scheduling
provided by drm_sched, it's just something on top.

The other reason being that, even if we find a way to reconcile the two
scheduling models (job vs group) based on some resource-limiting
algorithm, it would get in the way of usermode queues, because then the
job delimitation is blurry. Indeed, in that case you no longer
manipulate jobs, but execution contexts, that have to be scheduled
in/out to introduce some kind of fairness, at which point the resource
becomes GPU time, and you're back to the timeslice-based scheduling we
have right now.

>=20
> So far I tend to prefer Sima's proposal because I'm currently very
> unsure how we could deal with shared firmware rings =E2=80=93 because the=
n we'd
> need to resubmit jobs, and the currently intended Rust ownership model
> would then be at danger, because the Jobqueue would need a:
> pending_list.

So, my take on that is that what we want ultimately is to have the
functionality provided by drm_sched split into different
components that can be used in isolation, or combined to provide
advanced scheduling.

JobQueue:
 - allows you to queue jobs with their deps
 - dequeues jobs once their deps are met
Not too sure if we want a push or a pull model for the job dequeuing,
but the idea is that once the job is dequeued, ownership is passed to
the SW entity that dequeued it. Note that I intentionally didn't add
the timeout handling here, because dequeueing a job doesn't necessarily
mean it's started immediately. If you're dealing with HW queues, you
might have to wait for a slot to become available. If you're dealing
with something like Mali-CSF, where the amount of FW slots is limited,
you want to wait for your execution context to be passed to the FW for
scheduling, and the final situation is the full-fledged FW scheduling,
where you want things to start as soon as you have space in your FW
queue (AKA ring-buffer?).

JobHWDispatcher: (not sure about the name, I'm bad at naming things)
This object basically pulls ready-jobs from one or multiple JobQueues
into its own queue, and wait for a HW slot to become available. If you
go for the push model, the job gets pushed to the HW dispatcher queue
and waits here until a HW slot becomes available.
That's where timeouts should be handled, because the job only becomes
active when it gets pushed to a HW slot. I guess if we want a
resubmit mechanism, it would have to take place here, but give how
tricky this has been, I'd be tempted to leave that to drivers, that is,
let them requeue the non-faulty jobs directly to their
JobHWDispatcher implementation after a reset.

FWExecutionContextScheduler: (again, pick a different name if you want)
This scheduler doesn't know about jobs, meaning there's a
driver-specific entity that needs to dequeue jobs from the JobQueue
and push those to the relevant ringbuffer. Once a FWExecutionContext
has something to execute, it becomes a candidate for
FWExecutionContextScheduler, which gets to decide which set of
FWExecutionContext get a chance to be scheduled by the FW.
That one is for Mali-CSF case I described above, and I'm not too sure
we want it to be generic, at least not until we have another GPU driver
needing the same kind of scheduling. Again, you want to defer the
timeout handling to this component, because the timer should only
start/resume when the FWExecutionContext gets scheduled, and it should
be paused as soon as the context gets evicted.

TLDR; I think the main problem we had with drm_sched is that it had
this clear drm_sched_entity/drm_gpu_scheduler separation, but those two
components where tightly tied together, with no way to use
drm_sched_entity alone for instance, and this led to the weird
lifetime/ownership issues that the rust effort made more apparent. If we
get to design something new, I think we should try hard to get a clear
isolation between each of these components so they can be used alone or
combined, with a clear job ownership model.

Regards,

Boris
