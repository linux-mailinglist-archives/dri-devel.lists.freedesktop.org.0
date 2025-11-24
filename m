Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54CC80E1F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 14:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D5010E23F;
	Mon, 24 Nov 2025 13:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZWaaGI05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B77210E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763992699; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LFQevnWTTuwYP7I73N75RoQDk5bKnfZVE8BJ9tWasIHq2POGp0z+Qz02J1vO8OvEPdOk/Et/mntXGedR4OjUstAgagG9XdItdli5qQiFofPKUnCSKbmpNzZU3OQ2QuY4jMw8Ov0TtbEBuzpQkQS/a+JPNNzjsFLRl5e+uIh2MSA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763992699;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=v0HpScnDKLS/JWg2rjXzrDHf3Lv5ooD9uMQMEOiyib4=; 
 b=QzUGzrB43NWQZ67s/RbHWKk43HAvm9BPGsNmaxrsjEqK0MrfUuSK56SqxbVOpZerjaihwYZz80hqqWeKKIEMNDJRpIS70dc4kmpQqIM6uKFaf8PMhaclzEQgTEU4t98r/8jwRMynVwu1dQ19wQGKKc4asq57iLe7khsT4ZkGAtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763992699; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=v0HpScnDKLS/JWg2rjXzrDHf3Lv5ooD9uMQMEOiyib4=;
 b=ZWaaGI059xuflUaKJQvlcciO153FGhPY3GBN6ePQLTkbvPUn450hrRqX2MMbP+tt
 aWOpo1Ho5eh8ozSnNMvw8ZHmlwbn3CDvCWZfjTaF28dPB8o9Ipr/T8Nm6RAlNyEsGO/
 dB2QbModq8IEv3PmZZ8sFAoi2WHyaDcJb2B2qOgk=
Received: by mx.zohomail.com with SMTPS id 1763992696644205.88471331621827;
 Mon, 24 Nov 2025 05:58:16 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC WIP 3/3] rust/drm: Add initial jobqueue sceleton
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251118132520.266179-5-phasta@kernel.org>
Date: Mon, 24 Nov 2025 10:58:01 -0300
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Peter Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EBE34576-438E-4B87-89B9-A729260158F2@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-5-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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

Hi Phillip,

> On 18 Nov 2025, at 10:25, Philipp Stanner <phasta@kernel.org> wrote:
>=20
> DRM jobqueue is intended to become a load balancer, dependency manager
> and timeout handler for GPU drivers with firmware scheduling.
>=20
> The presented code shall give the reader an overview over the intended
> architecture, notably over the API functions, DmaFence callbacks, job
> lists and job control flow.
>=20
> This code compiles (with warnings) but is incomplete. Notable missing
> features are:
> - Actually registering the fence callbacks
> - workqueue
> - timeout handling
> - actually calling the driver callback for job submissions
>=20
> Moreover, the implementation of the waiting_jobs and running_jobs =
lists
> is currently not operational because I've got trouble with getting it =
to
> work with generic Job data. Verifyable by commenting in the push_job()
> call in the submit_job() function.
>=20
> Some WIP code is commented out, but is probably worth reading
> nevertheless since it completes the picture.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> rust/kernel/drm/jq.rs  | 398 +++++++++++++++++++++++++++++++++++++++++
> rust/kernel/drm/mod.rs |   2 +
> 2 files changed, 400 insertions(+)
> create mode 100644 rust/kernel/drm/jq.rs
>=20
> diff --git a/rust/kernel/drm/jq.rs b/rust/kernel/drm/jq.rs
> new file mode 100644
> index 000000000000..b3f7ab4655cf
> --- /dev/null
> +++ b/rust/kernel/drm/jq.rs
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2025 Red Hat Inc.:
> +//   - Philipp Stanner <pstanner@redhat.com>
> +//   - Danilo Krummrich <dakr@redhat.com>
> +//   - David Airlie <airlied@redhat.com>
> +
> +//! DrmJobqueue. A load balancer, dependency manager and timeout =
handler for
> +//! GPU job submissions.
> +
> +use crate::{
> +    prelude::*,
> +    types::ARef,
> +};
> +use kernel::sync::{Arc, SpinLock, new_spinlock, DmaFence, =
DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
> +use kernel::list::*;
> +use kernel::revocable::Revocable;
> +
> +
> +#[pin_data]
> +pub struct Job<T: ?Sized> {
> +    credits: u32,
> +//    dependencies: List, // TODO implement dependency list

I am assuming that this will be a list of callbacks?

> +    #[pin]
> +    data: T,
> +}
> +
> +impl<T> Job<T> {
> +    /// Create a new job that can be submitted to [`Jobqueue`].
> +    ///
> +    /// Jobs contain driver data that will later be made available to =
the driver's
> +    /// run_job() callback in which the job gets pushed to the GPU.
> +    pub fn new(credits: u32, data: impl PinInit<T>) -> =
Result<Pin<KBox<Self>>> {
> +        let job =3D pin_init!(Self {
> +            credits,
> +            data <- data,
> +        });
> +
> +        KBox::pin_init(job, GFP_KERNEL)
> +    }
> +
> +    /// Add a callback to the job. When the job gets submitted, all =
added callbacks will be
> +    /// registered on the [`DmaFence`] the jobqueue returns for that =
job.
> +    pub fn add_callback() -> Result {

Can=E2=80=99t we take all the callbacks at submission time?
> +        Ok(())
> +    }
> +
> +    /// Add a [`DmaFence`] or a [`DoneFence`] as this job's =
dependency. The job
> +    /// will only be executed after that dependency has been =
finished.
> +    pub fn add_dependency() -> Result {

Which would let us remove this ^

> +        // TODO: Enqueue passed DmaFence into the job's dependency =
list.
> +        Ok(())
> +    }
> +
> +    /// Check if there are dependencies for this job. Register the =
jobqueue
> +    /// waker if yes.
> +    fn arm_deps() -> Result {

I wonder if =E2=80=9Ccheck_dependencies=E2=80=9D would be a better name? =
Or something
along these lines.

> +        // TODO: Register DependencyWaker here if applicable.
> +        Ok(())
> +    }
> +}
> +
> +// Dummy trait for the linked list.
> +trait JobData {

> +    fn access_data(&self) -> i32;

Can=E2=80=99t we dereference to the data?

> +}
> +
> +#[pin_data]
> +struct EnqueuedJob<T: ?Sized> {
> +    inner: Pin<KBox<Job<T>>>,
> +    #[pin]
> +    links: ListLinksSelfPtr<EnqueuedJob<dyn JobData>>,

Why not a KVec? A queue type can hold a KVec of enqueued jobs, and this =
can
hold an Arc of the queue type. By extension, ensures that the queue does =
not
die while we have enqueued jobs.


> +    done_fence: ARef<DmaFence<i32>>, // i32 is just dummy data. TODO: =
allow for replacing with `()`
> +    // The hardware_fence can by definition only be set at an unknown =
point in
> +    // time.
> +    // TODO: Think about replacing this with a `struct RunningJob` =
which consumes
> +    // an `EnqueuedJob`.
> +    hardware_fence: Option<ARef<DmaFence<i32>>>, // i32 is dummy data =
until there's DmaFence
> +                                                 // without data.
> +    nr_of_deps: u32,
> +}
> +
> +impl<T> EnqueuedJob<T> {
> +    fn new(inner: Pin<KBox<Job<T>>>, fctx: &Arc<DmaFenceCtx>) -> =
Result<ListArc<Self>> {
> +        let pseudo_data: i32 =3D 42;
> +        let done_fence =3D =
fctx.as_arc_borrow().new_fence(pseudo_data)?;
> +
> +        ListArc::pin_init(try_pin_init!(Self {
> +            inner,
> +            links <- ListLinksSelfPtr::new(),
> +            done_fence,
> +            hardware_fence: None,
> +            nr_of_deps: 0, // TODO implement
> +        }), GFP_KERNEL)
> +    }
> +}
> +
> +impl_list_arc_safe! {
> +    impl{T: ?Sized} ListArcSafe<0> for EnqueuedJob<T> { untracked; }
> +}
> +
> +impl_list_item! {
> +    impl ListItem<0> for EnqueuedJob<dyn JobData> { using =
ListLinksSelfPtr { self.links }; }
> +}
> +
> +// Callback item for the hardware fences to wake / progress the =
jobqueue.
> +struct HwFenceWaker<T> {
> +    jobq: Arc<Revocable<SpinLock<InnerJobqueue>>>,

Instead of a Revocable, why not keep an Arc of InnerJobQueue (which =
should
perhaps be called JobQueueInner)?

This way, the user can have this:

struct JobQueue(Arc<JobqueueInner>);

When the user drops the JobQueue, it will schedule whatever teardown
operations, but the inner queue will not go out of scope, guaranteeing =
that
there is no UAF at least at this level.

You can create circular references to keep the JobQueueInner alive for =
as long
as the teardown operation is taking place:

struct SomeStructUsedForCleanup {
  Arc<JobQueueInner> queue;
  // ... more stuff
}

struct JobQueueInner {
 KVec<Arc<SomeStructUsedForCleanup>> cleanups;
}

Given this cycle, both the queue and whatever structs you need for =
cleanup will
remain alive indefinitely. At some point, once whatever cleanup =
completes, you
can break the cycle:

impl Drop for SomeStructUsedForCleanup {
  fn drop(...) {
    self.queue.cleanups.remove(self)
  }
}

Once all the cleanups complete, the JobQueueInner will drop.

Note that I'd expect this struct I =E2=80=9Cinvented" to be a DmaFenceCb =
representing a
pending dependency or a job that is already on the ring.

> +    job: ListArc<EnqueuedJob<T>>,
> +}
> +
> +impl<T> DmaFenceCbFunc for HwFenceWaker<T> {
> +     fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
> +         // This prevents against deadlock. See Jobqueue's drop() for =
details.
> +         let jq_guard =3D cb.data.jobq.try_access();
> +         if jq_guard.is_none() {
> +             return;
> +         }
> +         let jq_guard =3D jq_guard.unwrap();
> +
> +         // Take Jobqueue lock.
> +         let jq =3D jq_guard.lock();
> +         // Remove job from running list.
> +         //let _ =3D unsafe { cb.data.job.remove() };
> +         // Signal done_fence.
> +         // TODO: It's more robust if the JQ makes sure that fences =
get signalled
> +         // in order, even if the driver should signal them =
chaotically.
> +         let _ =3D cb.data.job.done_fence.signal();
> +         // Run more ready jobs if there's capacity.
> +         //jq.start_submit_worker();
> +     }
> +}
> +
> +// Callback item for the dependency fences to wake / progress the =
jobqueue.
> +struct DependencyWaker<T> {
> +    jobq: Arc<Revocable<SpinLock<InnerJobqueue>>>,
> +    job: ListArc<EnqueuedJob<T>>,
> +}
> +
> +impl<T> DmaFenceCbFunc for DependencyWaker<T> {
> +    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
> +        // This prevents against deadlock. See Jobqueue's drop() for =
details.
> +        let jq_guard =3D cb.data.jobq.try_access();
> +        if jq_guard.is_none() {
> +            return;
> +        }
> +        let jq_guard =3D jq_guard.unwrap();
> +
> +        // Take Jobqueue lock.
> +        let jq =3D jq_guard.lock();
> +
> +        // TODO: Lock Contention
> +        //
> +        // Alright, so the Jobqueue is currently designed around a =
big central
> +        // lock, which also protects the jobs. submit_job(), the JQ's =
cb on the
> +        // hw_fences and its cbs on the (external) dependency fences =
compete for
> +        // the lock. The first two should ever only run sequentially, =
so likely
> +        // aren't a problem.
> +        //
> +        // Dependency callbacks, however, could be registered and =
then signalled
> +        // by the thousands and then all compete for the lock =
possibly for nothing.
> +        //
> +        // That can likely be improved. Maybe by just making the =
nr_of_deps
> +        // counter atomic?
> +
> +        // Decrement dep counter.
> +        // cb.data.job.nr_of_deps -=3D 1; // TODO needs to be =
DerefMut
> +        // If counter =3D=3D 0, a new job somewhere in the queue just =
got ready.
> +        // Check if it was the head job and if yes, run all jobs =
possible.
> +        if cb.data.job.nr_of_deps =3D=3D 0 {
> +//            jq.start_submit_worker();
> +        }
> +    }
> +}
> +
> +struct InnerJobqueue {
> +    capacity: u32,
> +    waiting_jobs: List<EnqueuedJob<dyn JobData>>,
> +    running_jobs: List<EnqueuedJob<dyn JobData>>,
> +    submit_worker_active: bool,
> +}
> +
> +impl InnerJobqueue {
> +    fn new(capacity: u32) -> Self {
> +        let waiting_jobs =3D List::<EnqueuedJob<dyn JobData>>::new();
> +        let running_jobs =3D List::<EnqueuedJob<dyn JobData>>::new();
> +
> +        Self {
> +            capacity,
> +            waiting_jobs,
> +            running_jobs,
> +            submit_worker_active: false,
> +        }
> +    }
> +
> +    fn has_waiting_jobs(&self) -> bool {
> +        !self.waiting_jobs.is_empty()
> +    }
> +
> +    fn has_capacity_left(&self, cost: u32) -> bool {
> +        let cost =3D cost as i64;
> +        let capacity =3D self.capacity as i64;
> +
> +        if capacity - cost >=3D 0 {
> +            return true;
> +        }
> +
> +        false
> +    }
> +
> +    fn update_capacity(&mut self, cost: u32) {
> +        self.capacity -=3D cost;
> +    }
> +
> +
> +    // Called by the hw_fence callbacks, dependency callbacks, and =
submit_job().
> +    // TODO: does submit_job() ever have to call it?

Hm, yeah, I=E2=80=99d say so.

> +    fn start_submit_worker(&mut self) {
> +        if self.submit_worker_active {
> +            return;
> +        }
> +
> +        // TODO run submit work item
> +
> +        self.submit_worker_active =3D true;
> +    }
> +
> +    /*
> +
> +    /// Push a job immediately.
> +    ///
> +    /// Returns true if the job ran immediately, false otherwise.
> +    fn run_job(&mut self, job: &EnqueuedJob) -> bool {
> +        // TODO remove job from waiting list.
> +
> +        // TODO Call the driver's run_job() callback.
> +        let hardware_fence =3D run_job(&job);
> +        job.hardware_fence =3D Some(hardware_fence);
> +
> +        // TODO check whether hardware_fence raced and is already =
signalled.
> +
> +        self.running_jobs.push_back(job);
> +
> +        // TODO Register HwFenceWaker on the hw_fence.
> +    }
> +
> +    // Submits all ready jobs as long as there's capacity.
> +    fn run_all_ready_jobs(&mut self) {
> +        for job in self.waiting_jobs.reverse() {
> +            if job.nr_of_deps > 0 {
> +                return;
> +            }
> +
> +            if self.has_capacity_left(job.credits) {
> +                if !self.run_job(&job) {
> +                    // run_job() didn't run the job immediately =
(because the
> +                    // hw_fence did not race). Subtract the credits.
> +                    self.update_capacity(job.credits);
> +                }
> +            } else {
> +                return;
> +            }
> +        }
> +    }
> +    */
> +}
> +
> +//#[pin_data]
> +pub struct Jobqueue {
> +    inner: Arc<Revocable<SpinLock<InnerJobqueue>>>,
> +    fctx: Arc<DmaFenceCtx>, // TODO currently has a separate lock =
shared with fences
> +//    #[pin]
> +//    data: T,
> +}
> +
> +impl Jobqueue {
> +    /// Create a new [`Jobqueue`] with `capacity` space for jobs. =
`run_job` is
> +    /// your driver's callback which the jobqueue will call to push a =
submitted
> +    /// job to the hardware.
> +    pub fn new<T, V>(capacity: u32, _run_job: fn(&Pin<KBox<Job<T>>>) =
-> ARef<DmaFence<V>>) -> Result<Self> {
> +        let inner =3D =
Arc::pin_init(Revocable::new(new_spinlock!(InnerJobqueue::new(capacity))),=
 GFP_KERNEL)?;
> +        let fctx =3D DmaFenceCtx::new()?;
> +
> +        Ok (Self {
> +            inner,
> +            fctx,
> +        })
> +    }
> +
> +    /// Submit a job to the jobqueue.
> +    ///
> +    /// The jobqueue takes ownership over the job and later passes it =
back to the
> +    /// driver by reference through the driver's run_job callback. =
Jobs are
> +    /// passed back by reference instead of by value partially to =
allow for later
> +    /// adding a job resubmission mechanism to be added to =
[`Jobqueue`].
> +    ///
> +    /// Jobs get run and their done_fences get signalled in =
submission order.
> +    ///
> +    /// Returns the "done_fence" on success, which gets signalled =
once the
> +    /// hardware has completed the job and once the jobqueue is done =
with a job.
> +    pub fn submit_job<U>(&self, job: Pin<KBox<Job<U>>>) -> =
Result<ARef<DmaFence<i32>>> {
> +        let job_cost =3D job.credits;
> +        // TODO: It would be nice if the done_fence's seqno actually =
matches the
> +        // submission order. To do that, however, we'd need to =
protect job
> +        // creation with InnerJobqueue's spinlock. Is that worth it?

Can you guarantee that the seqno will not go backwards?

> +        let enq =3D EnqueuedJob::new(job, &self.fctx)?;
> +        let done_fence =3D enq.done_fence.clone(); // Get the fence =
for the user.
> +
> +        // TODO register job's callbacks on done_fence.
> +
> +        let guard =3D self.inner.try_access();
> +        if guard.is_none() {
> +            // Can never happen. JQ gets only revoked when it drops.
> +            return Err(ENODEV);
> +        }
> +        let jobq =3D guard.unwrap();
> +
> +        let jobq =3D jobq.lock();
> +
> +        // Check if there are dependencies and, if yes, register =
rewake
> +        // callbacks on their fences. Must be done under the JQ =
lock's protection
> +        // since the callbacks will access JQ data.
> +        //job.arm_deps();
> +        //jobq.waiting_jobs.push_back(job);
> +
> +        if jobq.has_waiting_jobs() {
> +            // Jobs waiting means that there is either currently no =
capacity
> +            // for more jobs, or the jobqueue is blocked by a job =
with
> +            // unfullfilled dependencies. Either the hardware fences' =
callbacks
> +            // or those of the dependency fences will pull in more =
jobs once
> +            // there is capacity.
> +            return Ok(done_fence);
> +        } else if !jobq.submit_worker_active && =
jobq.has_capacity_left(job_cost) {
> +            // This is the first waiting job. No one (i.e., no =
hw_fence) has
> +            // woken the worker yet, but there is space. Awake it =
manually.
> +            //jobq.start_submit_worker();
> +        }
> +
> +        // If there was no capacity for the job, the callbacks =
registered on the
> +        // already running jobs' hardware fences will check if =
there's space for
> +        // the next job, guaranteeing progress.
> +        //
> +        // If no jobs were running, there was by definition still =
space and the
> +        // job will get pushed by the worker.
> +        //
> +        // If a job couldn't be pushed because there were unfinished =
dependencies,
> +        // then the hardware fences' callbacks mentioned above will =
detect that
> +        // and not yet push the job.
> +        //
> +        // Each dependency's fence has its own callback which checks:
> +        //   a) whether all other callbacks are fullfilled and if =
yes:
> +        //   b) whether there is now enough credits available.
> +        //
> +        // If a) and b) are fullfilled, the job gets pushed.
> +        //
> +        // If there are no jobs currently running, credits must be =
available by
> +        // definition.
> +
> +        Ok(done_fence)
> +
> +    }
> +}
> +
> +impl Drop for Jobqueue {
> +    fn drop(&mut self) {
> +        // The hardware fences might outlive the jobqueue. So =
hw_fence callbacks
> +        // could very well still call into job queue code, resulting =
in
> +        // data UAF or, should the jobqueue code be unloaded, even =
code UAF.

Not if they reference JobQueueInner as I proposed above.

> +        //
> +        // Thus, the jobqueue needs to be cleanly decoupled from the =
hardware
> +        // fences when it drops, in other words, it needs to =
deregister all its
> +        // hw_fence callbacks.
> +        //
> +        // This, however, could easily deadlock when a hw_fence =
signals:
> +        //
> +        // Step     |   Jobqueue step               |   hw_fence step
> +        // =
------------------------------------------------------------------
> +        // 1        |   JQ starts drop              |   fence signals
> +        // 2        |   JQ lock taken               |   fence lock =
taken
> +        // 3        |   Tries to take fence lock    |   Tries to take =
JQ lock
> +        // 4        |   ***DEADLOCK***              |   =
***DEADLOCK***
> +        //
> +        // In order to prevent deadlock, we first have to revoke =
access to the
> +        // JQ so that all fence callbacks can't try to take the lock =
anymore,
> +        // and then deregister all JQ callbacks.
> +        self.inner.revoke();
> +
> +        /*
> +        let guard =3D self.inner.lock();
> +        for job in self.inner.waiting_jobs {
> +            job.deregister_dep_fences();
> +        }
> +        for job in self.inner.running_jobs {
> +            job.deregister_hw_fence();
> +        }
> +        */

Under my proposal above, you can also wait on dependencies if you want: =
the
drop() thread will not be blocked.

> +    }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 1b82b6945edf..803bed36231b 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -7,12 +7,14 @@
> pub mod file;
> pub mod gem;
> pub mod ioctl;
> +pub mod jq;
>=20
> pub use self::device::Device;
> pub use self::driver::Driver;
> pub use self::driver::DriverInfo;
> pub use self::driver::Registration;
> pub use self::file::File;
> +pub use self::jq::Jobqueue;
>=20
> pub(crate) mod private {
>     pub trait Sealed {}
> --=20
> 2.49.0
>=20
>=20

=E2=80=94 Daniel

