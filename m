Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E82C8EB96
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 15:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110E310E77E;
	Thu, 27 Nov 2025 14:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bDkmatkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E272E10E7D8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764252823; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y9yY78YWpYWcAoPCjRk6JEtcOPQAEjCKlyF3lT9VI3IzkJqZu/tefRx0K+Ctne9ra3vrKrx6lvmzZ1rSscuGrugic70+IjdlGZfvoO2OfFWp3znovBsDEyrG4knZvBLh9ZFzlh3iAUJcb/IKKZJ0OTyHJ8cvcOZAg9KyBVHY/Ow=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764252823;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6nBAkeIMkLVFacGcEQeBS4H0IgcYZZHP6xjmwpDO6YE=; 
 b=Qb32B3seMFFWKTAM1FIWrLPs/uc19dYUkIbfsrF7sXcBjm+8kZAO+ClXFzqT5EgqhbwQjzgc4P7zudK2UrX0zOK0/8Sqh2xlFNESdswAcpo+ua31t/Vyds6mapCatiyniNhCe6ANUEihHZlvUN6EmyzUz5AwnhdiVJbrS/RjdUA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764252822; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=6nBAkeIMkLVFacGcEQeBS4H0IgcYZZHP6xjmwpDO6YE=;
 b=bDkmatkgO+K3Cax7ewHnog6gz5q5oY8+6a01oUBToAUzqLCLEi+FUlaW6yHVb0rR
 D74IulvY19DGupQ3anR8LTwqsTKm4i/yKT3SeKvVfHfvt7HYCOM1VLYBVayNbcrumeG
 KTO1S/L10dOQOtHI8agEClCvZisUgTv9XYGPVPwE=
Received: by mx.zohomail.com with SMTPS id 1764252820952471.0341912814464;
 Thu, 27 Nov 2025 06:13:40 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC WIP 3/3] rust/drm: Add initial jobqueue sceleton
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <30d48cd600c1aab81d5495c13930af926ecc2380.camel@mailbox.org>
Date: Thu, 27 Nov 2025 11:13:26 -0300
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Peter Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8525DF22-3F12-4709-A9F5-A831AE9D3B57@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-5-phasta@kernel.org>
 <EBE34576-438E-4B87-89B9-A729260158F2@collabora.com>
 <30d48cd600c1aab81d5495c13930af926ecc2380.camel@mailbox.org>
To: phasta@kernel.org
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



> On 25 Nov 2025, at 10:20, Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> On Mon, 2025-11-24 at 10:58 -0300, Daniel Almeida wrote:
>> Hi Phillip,
>>=20
>>> On 18 Nov 2025, at 10:25, Philipp Stanner <phasta@kernel.org> wrote:
>>>=20
>>>=20
>=20
> [=E2=80=A6]
>=20
>>> +use crate::{
>>> +    prelude::*,
>>> +    types::ARef,
>>> +};
>>> +use kernel::sync::{Arc, SpinLock, new_spinlock, DmaFence, =
DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
>>> +use kernel::list::*;
>>> +use kernel::revocable::Revocable;
>>> +
>>> +
>>> +#[pin_data]
>>> +pub struct Job<T: ?Sized> {
>>> +    credits: u32,
>>> +//    dependencies: List, // TODO implement dependency list
>>=20
>> I am assuming that this will be a list of callbacks?
>=20
> That's supposed to become the list of DmaFence's which are to be
> treated as dependencies of this job.
>=20
> Only once all fences in this list are signaled the JQ will push that
> job.

Ok, I was approaching this from the current DRM scheduler design, which =
(IIRC)
uses callbacks to represent dependencies. IOW: if you managed to =
register a
callback on a dependency, it means that it hasn=E2=80=99t signaled yet.

In any case, that was just me trying to understand this better. IMHO, =
feel free
to use anything you think it=E2=80=99s best here, like the whole =
DmaFence struct.

>=20
>>=20
>>> +    #[pin]
>>> +    data: T,
>>> +}
>>> +
>>> +impl<T> Job<T> {
>>> +    /// Create a new job that can be submitted to [`Jobqueue`].
>>> +    ///
>>> +    /// Jobs contain driver data that will later be made available =
to the driver's
>>> +    /// run_job() callback in which the job gets pushed to the GPU.
>>> +    pub fn new(credits: u32, data: impl PinInit<T>) -> =
Result<Pin<KBox<Self>>> {
>>> +        let job =3D pin_init!(Self {
>>> +            credits,
>>> +            data <- data,
>>> +        });
>>> +
>>> +        KBox::pin_init(job, GFP_KERNEL)
>>> +    }
>>> +
>>> +    /// Add a callback to the job. When the job gets submitted, all =
added callbacks will be
>>> +    /// registered on the [`DmaFence`] the jobqueue returns for =
that job.
>>> +    pub fn add_callback() -> Result {
>>=20
>> Can=E2=80=99t we take all the callbacks at submission time?
>=20
> To clarify the terminology, a "callback" here would be callbacks which
> the JQ shall register on the done_fence returned by
> DmaFence::submit_job()

Ack.

> .
>=20
>>> +        Ok(())
>>> +    }
>>> +
>>> +    /// Add a [`DmaFence`] or a [`DoneFence`] as this job's =
dependency. The job
>>> +    /// will only be executed after that dependency has been =
finished.
>>> +    pub fn add_dependency() -> Result {
>>=20
>> Which would let us remove this ^
>=20
> It would allow for removing this function, but you'd then just have an
> optional (some jobs have no dependencies) function parameter in
> DmaFence::submit_job().

>=20
> The current idea looks like this:
>=20
> ```
> let jobq =3D JobQueue::new(=E2=80=A6);
> let job =3D Job::new(driver_data);
>=20
> job.add_dependency(done_fence_of_shader_in_another_context); // =
optional
> job.add_callback(cb_that_will_wake_userspace_or_sth); // optional
>=20
> let done_fence =3D jobq.submit_job(job)?;
> ```
>=20
> The JQ eats the job (ownership transfer), so by design you have to set
> all dependencies and specify everything that shall be done when the =
job
> finishes _before_ submitting the job.
>=20
> I think an API in this form makes the order of events very obvious to
> the user?
>=20


You=E2=80=99d pass a

fn submit(=E2=80=A6, dependencies: &[DmaFence], callbacks: &[Callback])

This way a user cannot submit a job without being explicit about =
dependencies
and callbacks, i.e.: it cannot be forgotten, while still being optional.=20=


> What happens then behind the scenes is that the JQ registers all the
> callbacks on the done_fence returned above. I'm not super sure about
> this design idea; it's certainly optional. However, it has the
> advantage of freeing the JQ user from dealing with races of =
done_fence.
>=20
> Otherwise one would have to do something like
>=20
> ```
> let done_fence =3D jobq.submit_job(job)?;
>=20
> let err =3D done_fence.register_callback(my_drivers_cb);
> if err.was_race_and_is_already_signaled() {
> execute_cb_code_myself_now();
> }
> ```
>=20
>=20
>>=20
>>> +        // TODO: Enqueue passed DmaFence into the job's dependency =
list.
>>> +        Ok(())
>>> +    }
>>> +
>>> +    /// Check if there are dependencies for this job. Register the =
jobqueue
>>> +    /// waker if yes.
>>> +    fn arm_deps() -> Result {
>>=20
>> I wonder if =E2=80=9Ccheck_dependencies=E2=80=9D would be a better =
name? Or something
>> along these lines.
>=20
> ACK.
>=20
>>=20
>>> +        // TODO: Register DependencyWaker here if applicable.
>>> +        Ok(())
>>> +    }
>>> +}
>>> +
>>> +// Dummy trait for the linked list.
>>> +trait JobData {
>>=20
>>> +    fn access_data(&self) -> i32;
>>=20
>> Can=E2=80=99t we dereference to the data?
>=20
> That's dummy code that only exists because I so far am failing with
> even getting the basic List to work.
>=20
>>=20
>>> +}
>>> +
>>> +#[pin_data]
>>> +struct EnqueuedJob<T: ?Sized> {
>>> +    inner: Pin<KBox<Job<T>>>,
>>> +    #[pin]
>>> +    links: ListLinksSelfPtr<EnqueuedJob<dyn JobData>>,
>>=20
>> Why not a KVec? A queue type can hold a KVec of enqueued jobs, and =
this can
>> hold an Arc of the queue type.
>=20
> My understanding is that KVec is not intended to be the data structure
> for this?
>=20
> KVec is basically like a realloc() in C, an array of same sized
> elements.
>=20
> The JQ, hypothetically, can hold an infinite amount of members in its
> waiting_list, only the running_list is limited by the credit count.

Then I'd pre-allocate or realloc() as needed. You can reuse the empty =
slots, so
there won't be a unbounded growth. realloc() also looks fine, because it =
will
happen outside of the signaling path.

My point is that writing your own data structure adds complexity. Your =
call,
though.

>=20
>=20
>> By extension, ensures that the queue does not
>> die while we have enqueued jobs.
>=20
> See below.
>=20
>>=20
>>=20
>>> +    done_fence: ARef<DmaFence<i32>>, // i32 is just dummy data. =
TODO: allow for replacing with `()`
>>> +    // The hardware_fence can by definition only be set at an =
unknown point in
>>> +    // time.
>>> +    // TODO: Think about replacing this with a `struct RunningJob` =
which consumes
>>> +    // an `EnqueuedJob`.
>>> +    hardware_fence: Option<ARef<DmaFence<i32>>>, // i32 is dummy =
data until there's DmaFence
>>> +                                                 // without data.
>>> +    nr_of_deps: u32,
>>> +}
>>> +
>>> +impl<T> EnqueuedJob<T> {
>>> +    fn new(inner: Pin<KBox<Job<T>>>, fctx: &Arc<DmaFenceCtx>) -> =
Result<ListArc<Self>> {
>>> +        let pseudo_data: i32 =3D 42;
>>> +        let done_fence =3D =
fctx.as_arc_borrow().new_fence(pseudo_data)?;
>>> +
>>> +        ListArc::pin_init(try_pin_init!(Self {
>>> +            inner,
>>> +            links <- ListLinksSelfPtr::new(),
>>> +            done_fence,
>>> +            hardware_fence: None,
>>> +            nr_of_deps: 0, // TODO implement
>>> +        }), GFP_KERNEL)
>>> +    }
>>> +}
>>> +
>>> +impl_list_arc_safe! {
>>> +    impl{T: ?Sized} ListArcSafe<0> for EnqueuedJob<T> { untracked; =
}
>>> +}
>>> +
>>> +impl_list_item! {
>>> +    impl ListItem<0> for EnqueuedJob<dyn JobData> { using =
ListLinksSelfPtr { self.links }; }
>>> +}
>>> +
>>> +// Callback item for the hardware fences to wake / progress the =
jobqueue.
>>> +struct HwFenceWaker<T> {
>>> +    jobq: Arc<Revocable<SpinLock<InnerJobqueue>>>,
>>=20
>> Instead of a Revocable, why not keep an Arc of InnerJobQueue (which =
should
>> perhaps be called JobQueueInner)?
>>=20
>> This way, the user can have this:
>>=20
>> struct JobQueue(Arc<JobqueueInner>);
>>=20
>> When the user drops the JobQueue, it will schedule whatever teardown
>> operations,
>>=20
>=20
> What kind of operation would that be? Completing all running_jobs?
> Completing all waiting_jobs? Completing all running_jobs and canceling
> all waiting_jobs? etc.
>=20

The same as the current DRM scheduler, i.e.:

static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
					  struct dma_fence_cb *cb)

My understanding is that the JobQueue will follow a similar pattern?

>=20
>> but the inner queue will not go out of scope, guaranteeing that
>> there is no UAF at least at this level.
>>=20
>> You can create circular references to keep the JobQueueInner alive =
for as long
>> as the teardown operation is taking place:
>>=20
>> struct SomeStructUsedForCleanup {
>>   Arc<JobQueueInner> queue;
>>   // ... more stuff
>> }
>>=20
>> struct JobQueueInner {
>>  KVec<Arc<SomeStructUsedForCleanup>> cleanups;
>> }
>>=20
>> Given this cycle, both the queue and whatever structs you need for =
cleanup will
>> remain alive indefinitely. At some point, once whatever cleanup =
completes, you
>> can break the cycle:
>>=20
>> impl Drop for SomeStructUsedForCleanup {
>>   fn drop(...) {
>>     self.queue.cleanups.remove(self)
>>   }
>> }
>>=20
>> Once all the cleanups complete, the JobQueueInner will drop.
>=20
> Whether your design approach has advantages depends on the above
> question of what "cleanup" means to you?
>=20
>>=20
>> Note that I'd expect this struct I =E2=80=9Cinvented" to be a =
DmaFenceCb representing a
>> pending dependency or a job that is already on the ring.
>>=20
>>> +    job: ListArc<EnqueuedJob<T>>,
>>> +}
>>>=20
>=20
> [=E2=80=A6]
>=20
>>> +    fn update_capacity(&mut self, cost: u32) {
>>> +        self.capacity -=3D cost;
>>> +    }
>>> +
>>> +
>>> +    // Called by the hw_fence callbacks, dependency callbacks, and =
submit_job().
>>> +    // TODO: does submit_job() ever have to call it?
>>=20
>> Hm, yeah, I=E2=80=99d say so.
>=20
> Yup. That comment is a relict.
>=20
>>=20
>>> +    fn start_submit_worker(&mut self) {
>>> +        if self.submit_worker_active {
>>> +            return;
>>> +        }
>>> +
>>> +        // TODO run submit work item
>>> +
>>> +        self.submit_worker_active =3D true;
>>> +    }
>>>=20
>=20
> [=E2=80=A6]
>=20
>>> +    /// Submit a job to the jobqueue.
>>> +    ///
>>> +    /// The jobqueue takes ownership over the job and later passes =
it back to the
>>> +    /// driver by reference through the driver's run_job callback. =
Jobs are
>>> +    /// passed back by reference instead of by value partially to =
allow for later
>>> +    /// adding a job resubmission mechanism to be added to =
[`Jobqueue`].
>>> +    ///
>>> +    /// Jobs get run and their done_fences get signalled in =
submission order.
>>> +    ///
>>> +    /// Returns the "done_fence" on success, which gets signalled =
once the
>>> +    /// hardware has completed the job and once the jobqueue is =
done with a job.
>>> +    pub fn submit_job<U>(&self, job: Pin<KBox<Job<U>>>) -> =
Result<ARef<DmaFence<i32>>> {
>>> +        let job_cost =3D job.credits;
>>> +        // TODO: It would be nice if the done_fence's seqno =
actually matches the
>>> +        // submission order. To do that, however, we'd need to =
protect job
>>> +        // creation with InnerJobqueue's spinlock. Is that worth =
it?
>>=20
>> Can you guarantee that the seqno will not go backwards?
>=20
> As pointed out in the other thread, that could currently happen if a
> driver calls submit_job() with >1 thread.
>=20
> IOW, *done_fence* seqnos could end up being enqueued like this
>=20
> 42 43 45 44 46
>=20
> By taking the lock that could be prevented. However, that's only a
> virtual or tiny win, because jobs could then actually be submitted in
> an order not desired by the driver, but with correct done_fence seqno
> order.
>=20
> JQ executes jobs in the order they were submitted to. The fundamental
> question is really: should the JQ care and what should it do if a
> driver spams submit_job() asynchronously?
>=20
> I tend to think that there is not really much we can do about that.

Ack

>=20
>=20
>>> +impl Drop for Jobqueue {
>>> +    fn drop(&mut self) {
>>> +        // The hardware fences might outlive the jobqueue. So =
hw_fence callbacks
>>> +        // could very well still call into job queue code, =
resulting in
>>> +        // data UAF or, should the jobqueue code be unloaded, even =
code UAF.
>>=20
>> Not if they reference JobQueueInner as I proposed above.
>>=20
>>> +        //
>>> +        // Thus, the jobqueue needs to be cleanly decoupled from =
the hardware
>>> +        // fences when it drops, in other words, it needs to =
deregister all its
>>> +        // hw_fence callbacks.
>>> +        //
>>> +        // This, however, could easily deadlock when a hw_fence =
signals:
>>> +        //
>>> +        // Step     |   Jobqueue step               |   hw_fence =
step
>>> +        // =
------------------------------------------------------------------
>>> +        // 1        |   JQ starts drop              |   fence =
signals
>>> +        // 2        |   JQ lock taken               |   fence lock =
taken
>>> +        // 3        |   Tries to take fence lock    |   Tries to =
take JQ lock
>>> +        // 4        |   ***DEADLOCK***              |   =
***DEADLOCK***
>>> +        //
>>> +        // In order to prevent deadlock, we first have to revoke =
access to the
>>> +        // JQ so that all fence callbacks can't try to take the =
lock anymore,
>>> +        // and then deregister all JQ callbacks.
>>> +        self.inner.revoke();
>>> +
>>> +        /*
>>> +        let guard =3D self.inner.lock();
>>> +        for job in self.inner.waiting_jobs {
>>> +            job.deregister_dep_fences();
>>> +        }
>>> +        for job in self.inner.running_jobs {
>>> +            job.deregister_hw_fence();
>>> +        }
>>> +        */
>>=20
>> Under my proposal above, you can also wait on dependencies if you =
want: the
>> drop() thread will not be blocked.
>=20
> Maybe (I'd have to look deeper into the idea)
>=20
> But what for? When someone drops his jobqueue, one would like to think
> that he doesn't care about all pending jobs anymore anyways. So the
> main thing you need to guarantee is that userspace gets unblocked by
> signaling all fences.

I was basically trying to recreate this:

static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
					  struct dma_fence_cb *cb)
{
	struct drm_sched_job *job =3D container_of(cb, struct =
drm_sched_job,
						 finish_cb);
	unsigned long index;

	dma_fence_put(f);

	/* Wait for all dependencies to avoid data corruptions */
	xa_for_each(&job->dependencies, index, f) {

>=20
>=20
> Note that we had very similar discussions when solving the memory =
leaks
> in drm_sched_fini(). The TL;DR of those discussions was:
>=20
> * Refcounting drm_sched so that it can outlive drm_sched_fini() means
>   that it will continue calling into the driver with the driver
>   callbacks -> UAF
> * Waiting could cause you to block SIGKILL
> * The sanest way to go was deemed to be to signal everything in the
>   pending_list synchronously. Once you've done this, you know for sure
>   that everything is done and clean.
>=20
>=20
> AFAICS, your proposal might still have the problem of JQ continuously
> calling into driver code?

You=E2=80=99re basically calling wait() and signal(), but not run(). On =
top of
that, I don=E2=80=99t think the callbacks can actually reach the driver =
without
taking an extra refcount on some driver structure (iow:  we should =
require the
callbacks to be =E2=80=99static). So, IIUC, no, this would not call into =
the
driver.



>=20
> I think the proposed solution is very clean: when you drop, decouple =
JQ
> and driver by 100%, stop everything, tear everything down. At least
> that's what drm_sched_fini() should have been from the beginning.
>=20
>=20
> P.
>=20

Sure, I am not saying what I proposed is superior. It's just an =
alternative
approach that you should consider. I also agree that revoking the queue =
looks
clean, but again, my question is how do you then wait asynchronously =
like
drm_sched_entity_kill_jobs_cb does, if that=E2=80=99s needed at all.



=E2=80=94 Daniel=
