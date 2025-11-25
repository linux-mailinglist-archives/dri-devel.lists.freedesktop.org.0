Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21668C8527A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ABC10E3BD;
	Tue, 25 Nov 2025 13:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XFNayzlL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B9B10E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:21:00 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dG3Gx2nvQz9t2t;
 Tue, 25 Nov 2025 14:20:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764076857; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilSlMQEULSwICZFlGiuc3EYoxMvwHCOfzrHzSRTMUJA=;
 b=XFNayzlLKqf/lGQuukZCnaMv7g0zCupomGSG7esrfkFYvD7iN5PWH2PDZgK2v4GpHExTq4
 S+kCEXQxzC80/488GKLGiEkoKXfo9VAsVAnEV3oPEAqxPHmdRUCrY2bFV0rP6xRRKx/lTq
 /MpmvYjItZjnbVpN8tRk6M7Fkx3ZNql1fEOoguGEWO4smUlpKlrZoEP3VuDtGPo5hAPFg5
 Wpi5S8T1JYF2+u4dwxwPF1veSiYl2vrLK6I9P1Q7cagq2HIITdeSVkaa6vFqvKLRnsum1B
 iNeubbM3OejlnPiaiDRlFt0D19cN76zPcYKMEs8xprVquU8Ccc8OKIINAmbB+g==
Message-ID: <30d48cd600c1aab81d5495c13930af926ecc2380.camel@mailbox.org>
Subject: Re: [RFC WIP 3/3] rust/drm: Add initial jobqueue sceleton
From: Philipp Stanner <phasta@mailbox.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,  Alexandre Courbot
 <acourbot@nvidia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter
 Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Tue, 25 Nov 2025 14:20:52 +0100
In-Reply-To: <EBE34576-438E-4B87-89B9-A729260158F2@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-5-phasta@kernel.org>
 <EBE34576-438E-4B87-89B9-A729260158F2@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 83068b9e12947127776
X-MBO-RS-META: 3muiiyrsnoh7ti84gs9cftbjcoubi4ik
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-11-24 at 10:58 -0300, Daniel Almeida wrote:
> Hi Phillip,
>=20
> > On 18 Nov 2025, at 10:25, Philipp Stanner <phasta@kernel.org> wrote:
> >=20
> >=20

[=E2=80=A6]

> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 prelude::*,
> > +=C2=A0=C2=A0=C2=A0 types::ARef,
> > +};
> > +use kernel::sync::{Arc, SpinLock, new_spinlock, DmaFence, DmaFenceCtx,=
 DmaFenceCb, DmaFenceCbFunc};
> > +use kernel::list::*;
> > +use kernel::revocable::Revocable;
> > +
> > +
> > +#[pin_data]
> > +pub struct Job<T: ?Sized> {
> > +=C2=A0=C2=A0=C2=A0 credits: u32,
> > +//=C2=A0=C2=A0=C2=A0 dependencies: List, // TODO implement dependency =
list
>=20
> I am assuming that this will be a list of callbacks?

That's supposed to become the list of DmaFence's which are to be
treated as dependencies of this job.

Only once all fences in this list are signaled the JQ will push that
job.

>=20
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 data: T,
> > +}
> > +
> > +impl<T> Job<T> {
> > +=C2=A0=C2=A0=C2=A0 /// Create a new job that can be submitted to [`Job=
queue`].
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Jobs contain driver data that will later be mad=
e available to the driver's
> > +=C2=A0=C2=A0=C2=A0 /// run_job() callback in which the job gets pushed=
 to the GPU.
> > +=C2=A0=C2=A0=C2=A0 pub fn new(credits: u32, data: impl PinInit<T>) -> =
Result<Pin<KBox<Self>>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let job =3D pin_init!(Self =
{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cre=
dits,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a <- data,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KBox::pin_init(job, GFP_KER=
NEL)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Add a callback to the job. When the job gets su=
bmitted, all added callbacks will be
> > +=C2=A0=C2=A0=C2=A0 /// registered on the [`DmaFence`] the jobqueue ret=
urns for that job.
> > +=C2=A0=C2=A0=C2=A0 pub fn add_callback() -> Result {
>=20
> Can=E2=80=99t we take all the callbacks at submission time?

To clarify the terminology, a "callback" here would be callbacks which
the JQ shall register on the done_fence returned by
DmaFence::submit_job().

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Add a [`DmaFence`] or a [`DoneFence`] as this j=
ob's dependency. The job
> > +=C2=A0=C2=A0=C2=A0 /// will only be executed after that dependency has=
 been finished.
> > +=C2=A0=C2=A0=C2=A0 pub fn add_dependency() -> Result {
>=20
> Which would let us remove this ^

It would allow for removing this function, but you'd then just have an
optional (some jobs have no dependencies) function parameter in
DmaFence::submit_job().

The current idea looks like this:

```
let jobq =3D JobQueue::new(=E2=80=A6);
let job =3D Job::new(driver_data);

job.add_dependency(done_fence_of_shader_in_another_context); // optional
job.add_callback(cb_that_will_wake_userspace_or_sth); // optional

let done_fence =3D jobq.submit_job(job)?;
```

The JQ eats the job (ownership transfer), so by design you have to set
all dependencies and specify everything that shall be done when the job
finishes _before_ submitting the job.

I think an API in this form makes the order of events very obvious to
the user?


What happens then behind the scenes is that the JQ registers all the
callbacks on the done_fence returned above. I'm not super sure about
this design idea; it's certainly optional. However, it has the
advantage of freeing the JQ user from dealing with races of done_fence.

Otherwise one would have to do something like

```
let done_fence =3D jobq.submit_job(job)?;

let err =3D done_fence.register_callback(my_drivers_cb);
if err.was_race_and_is_already_signaled() {
execute_cb_code_myself_now();
}
```


>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Enqueue passed Dma=
Fence into the job's dependency list.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Check if there are dependencies for this job. R=
egister the jobqueue
> > +=C2=A0=C2=A0=C2=A0 /// waker if yes.
> > +=C2=A0=C2=A0=C2=A0 fn arm_deps() -> Result {
>=20
> I wonder if =E2=80=9Ccheck_dependencies=E2=80=9D would be a better name? =
Or something
> along these lines.

ACK.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Register Dependenc=
yWaker here if applicable.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +// Dummy trait for the linked list.
> > +trait JobData {
>=20
> > +=C2=A0=C2=A0=C2=A0 fn access_data(&self) -> i32;
>=20
> Can=E2=80=99t we dereference to the data?

That's dummy code that only exists because I so far am failing with
even getting the basic List to work.

>=20
> > +}
> > +
> > +#[pin_data]
> > +struct EnqueuedJob<T: ?Sized> {
> > +=C2=A0=C2=A0=C2=A0 inner: Pin<KBox<Job<T>>>,
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 links: ListLinksSelfPtr<EnqueuedJob<dyn JobData>>,
>=20
> Why not a KVec? A queue type can hold a KVec of enqueued jobs, and this c=
an
> hold an Arc of the queue type.

My understanding is that KVec is not intended to be the data structure
for this?

KVec is basically like a realloc() in C, an array of same sized
elements.

The JQ, hypothetically, can hold an infinite amount of members in its
waiting_list, only the running_list is limited by the credit count.


>  By extension, ensures that the queue does not
> die while we have enqueued jobs.

See below.

>=20
>=20
> > +=C2=A0=C2=A0=C2=A0 done_fence: ARef<DmaFence<i32>>, // i32 is just dum=
my data. TODO: allow for replacing with `()`
> > +=C2=A0=C2=A0=C2=A0 // The hardware_fence can by definition only be set=
 at an unknown point in
> > +=C2=A0=C2=A0=C2=A0 // time.
> > +=C2=A0=C2=A0=C2=A0 // TODO: Think about replacing this with a `struct =
RunningJob` which consumes
> > +=C2=A0=C2=A0=C2=A0 // an `EnqueuedJob`.
> > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>, // i32=
 is dummy data until there's DmaFence
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // wi=
thout data.
> > +=C2=A0=C2=A0=C2=A0 nr_of_deps: u32,
> > +}
> > +
> > +impl<T> EnqueuedJob<T> {
> > +=C2=A0=C2=A0=C2=A0 fn new(inner: Pin<KBox<Job<T>>>, fctx: &Arc<DmaFenc=
eCtx>) -> Result<ListArc<Self>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let pseudo_data: i32 =3D 42=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let done_fence =3D fctx.as_=
arc_borrow().new_fence(pseudo_data)?;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ListArc::pin_init(try_pin_i=
nit!(Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inn=
er,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lin=
ks <- ListLinksSelfPtr::new(),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 don=
e_fence,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 har=
dware_fence: None,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr_=
of_deps: 0, // TODO implement
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }), GFP_KERNEL)
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +impl_list_arc_safe! {
> > +=C2=A0=C2=A0=C2=A0 impl{T: ?Sized} ListArcSafe<0> for EnqueuedJob<T> {=
 untracked; }
> > +}
> > +
> > +impl_list_item! {
> > +=C2=A0=C2=A0=C2=A0 impl ListItem<0> for EnqueuedJob<dyn JobData> { usi=
ng ListLinksSelfPtr { self.links }; }
> > +}
> > +
> > +// Callback item for the hardware fences to wake / progress the jobque=
ue.
> > +struct HwFenceWaker<T> {
> > +=C2=A0=C2=A0=C2=A0 jobq: Arc<Revocable<SpinLock<InnerJobqueue>>>,
>=20
> Instead of a Revocable, why not keep an Arc of InnerJobQueue (which shoul=
d
> perhaps be called JobQueueInner)?
>=20
> This way, the user can have this:
>=20
> struct JobQueue(Arc<JobqueueInner>);
>=20
> When the user drops the JobQueue, it will schedule whatever teardown
> operations,
>=20

What kind of operation would that be? Completing all running_jobs?
Completing all waiting_jobs? Completing all running_jobs and canceling
all waiting_jobs? etc.


>  but the inner queue will not go out of scope, guaranteeing that
> there is no UAF at least at this level.
>=20
> You can create circular references to keep the JobQueueInner alive for as=
 long
> as the teardown operation is taking place:
>=20
> struct SomeStructUsedForCleanup {
> =C2=A0 Arc<JobQueueInner> queue;
> =C2=A0 // ... more stuff
> }
>=20
> struct JobQueueInner {
> =C2=A0KVec<Arc<SomeStructUsedForCleanup>> cleanups;
> }
>=20
> Given this cycle, both the queue and whatever structs you need for cleanu=
p will
> remain alive indefinitely. At some point, once whatever cleanup completes=
, you
> can break the cycle:
>=20
> impl Drop for SomeStructUsedForCleanup {
> =C2=A0 fn drop(...) {
> =C2=A0=C2=A0=C2=A0 self.queue.cleanups.remove(self)
> =C2=A0 }
> }
>=20
> Once all the cleanups complete, the JobQueueInner will drop.

Whether your design approach has advantages depends on the above
question of what "cleanup" means to you?

>=20
> Note that I'd expect this struct I =E2=80=9Cinvented" to be a DmaFenceCb =
representing a
> pending dependency or a job that is already on the ring.
>=20
> > +=C2=A0=C2=A0=C2=A0 job: ListArc<EnqueuedJob<T>>,
> > +}
> >=20

[=E2=80=A6]

> > +=C2=A0=C2=A0=C2=A0 fn update_capacity(&mut self, cost: u32) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.capacity -=3D cost;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +
> > +=C2=A0=C2=A0=C2=A0 // Called by the hw_fence callbacks, dependency cal=
lbacks, and submit_job().
> > +=C2=A0=C2=A0=C2=A0 // TODO: does submit_job() ever have to call it?
>=20
> Hm, yeah, I=E2=80=99d say so.

Yup. That comment is a relict.

>=20
> > +=C2=A0=C2=A0=C2=A0 fn start_submit_worker(&mut self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.submit_worker_activ=
e {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO run submit work ite=
m
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.submit_worker_active =
=3D true;
> > +=C2=A0=C2=A0=C2=A0 }
> >=20

[=E2=80=A6]

> > +=C2=A0=C2=A0=C2=A0 /// Submit a job to the jobqueue.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// The jobqueue takes ownership over the job and l=
ater passes it back to the
> > +=C2=A0=C2=A0=C2=A0 /// driver by reference through the driver's run_jo=
b callback. Jobs are
> > +=C2=A0=C2=A0=C2=A0 /// passed back by reference instead of by value pa=
rtially to allow for later
> > +=C2=A0=C2=A0=C2=A0 /// adding a job resubmission mechanism to be added=
 to [`Jobqueue`].
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Jobs get run and their done_fences get signalle=
d in submission order.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Returns the "done_fence" on success, which gets=
 signalled once the
> > +=C2=A0=C2=A0=C2=A0 /// hardware has completed the job and once the job=
queue is done with a job.
> > +=C2=A0=C2=A0=C2=A0 pub fn submit_job<U>(&self, job: Pin<KBox<Job<U>>>)=
 -> Result<ARef<DmaFence<i32>>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let job_cost =3D job.credit=
s;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: It would be nice i=
f the done_fence's seqno actually matches the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // submission order. To do =
that, however, we'd need to protect job
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // creation with InnerJobqu=
eue's spinlock. Is that worth it?
>=20
> Can you guarantee that the seqno will not go backwards?

As pointed out in the other thread, that could currently happen if a
driver calls submit_job() with >1 thread.

IOW, *done_fence* seqnos could end up being enqueued like this

42 43 45 44 46

By taking the lock that could be prevented. However, that's only a
virtual or tiny win, because jobs could then actually be submitted in
an order not desired by the driver, but with correct done_fence seqno
order.

JQ executes jobs in the order they were submitted to. The fundamental
question is really: should the JQ care and what should it do if a
driver spams submit_job() asynchronously?

I tend to think that there is not really much we can do about that.


> > +impl Drop for Jobqueue {
> > +=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The hardware fences migh=
t outlive the jobqueue. So hw_fence callbacks
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // could very well still ca=
ll into job queue code, resulting in
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // data UAF or, should the =
jobqueue code be unloaded, even code UAF.
>=20
> Not if they reference JobQueueInner as I proposed above.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Thus, the jobqueue needs=
 to be cleanly decoupled from the hardware
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // fences when it drops, in=
 other words, it needs to deregister all its
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // hw_fence callbacks.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // This, however, could eas=
ily deadlock when a hw_fence signals:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Step=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 Jobqueue step=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 hw_fence step
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ------------------------=
------------------------------------------
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 1=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 JQ starts drop=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 fence =
signals
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 JQ lock taken=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
fence lock taken
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 3=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 Tries to take fence lock=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 Tries to take JQ lock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 4=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ***DEADLOCK***=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ***DEA=
DLOCK***
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to prevent dead=
lock, we first have to revoke access to the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // JQ so that all fence cal=
lbacks can't try to take the lock anymore,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // and then deregister all =
JQ callbacks.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.inner.revoke();
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let guard =3D self.inner.lo=
ck();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for job in self.inner.waiti=
ng_jobs {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job=
.deregister_dep_fences();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for job in self.inner.runni=
ng_jobs {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job=
.deregister_hw_fence();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
> Under my proposal above, you can also wait on dependencies if you want: t=
he
> drop() thread will not be blocked.

Maybe (I'd have to look deeper into the idea)

But what for? When someone drops his jobqueue, one would like to think
that he doesn't care about all pending jobs anymore anyways. So the
main thing you need to guarantee is that userspace gets unblocked by
signaling all fences.


Note that we had very similar discussions when solving the memory leaks
in drm_sched_fini(). The TL;DR of those discussions was:

 * Refcounting drm_sched so that it can outlive drm_sched_fini() means
   that it will continue calling into the driver with the driver
   callbacks -> UAF
 * Waiting could cause you to block SIGKILL
 * The sanest way to go was deemed to be to signal everything in the
   pending_list synchronously. Once you've done this, you know for sure
   that everything is done and clean.


AFAICS, your proposal might still have the problem of JQ continuously
calling into driver code?

I think the proposed solution is very clean: when you drop, decouple JQ
and driver by 100%, stop everything, tear everything down. At least
that's what drm_sched_fini() should have been from the beginning.


P.
