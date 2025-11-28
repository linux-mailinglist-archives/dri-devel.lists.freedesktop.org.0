Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5FC91913
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A3F10E0C0;
	Fri, 28 Nov 2025 10:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bIpqP9Sv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB55A10E0C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:07:35 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dHprN4zg5z9t4w;
 Fri, 28 Nov 2025 11:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764324452; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ao3dym2cnmwiQbncjKoZ+6HHsO1m7DXPk0Uc7sZ1HkU=;
 b=bIpqP9Svow4YDTuI5EbFGuUonumKjSdSCUMlgB0ok+0DX4D1Ofhs9udd+OpgITt3g4VHF7
 3SU7IkLbyvmqm6gV6TAWBoWvbE87hs/8p0t7QRaOkgb2bG7AL0e6pclwVn1NWWLcVyitMX
 Pr//bmgVhruifytripxSks/jGZ1FKlwGa89jVNizv3yebSWZfZH39+Op1BMtZHDI5JPmFs
 ra2UwX52giZLpmXZcvErSwHElvae3j5XV1ETSTPEyDXI0s1y1IPT3yFXpgUIUXiHnFi0PF
 Uz3MJ2mBH+H8/TYYfZd+NUUHlSPmOx4YptP9el9d5ItvC7MTFa3mlbkqOr0sdg==
Message-ID: <94278c46a48207c3f71cd127daa82d69d7d869c2.camel@mailbox.org>
Subject: Re: [RFC WIP 3/3] rust/drm: Add initial jobqueue sceleton
From: Philipp Stanner <phasta@mailbox.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, phasta@kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,  Alexandre Courbot
 <acourbot@nvidia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter
 Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Fri, 28 Nov 2025 11:07:26 +0100
In-Reply-To: <8525DF22-3F12-4709-A9F5-A831AE9D3B57@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-5-phasta@kernel.org>
 <EBE34576-438E-4B87-89B9-A729260158F2@collabora.com>
 <30d48cd600c1aab81d5495c13930af926ecc2380.camel@mailbox.org>
 <8525DF22-3F12-4709-A9F5-A831AE9D3B57@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e5ed864ae3eca1fbbf0
X-MBO-RS-META: yok8k9w19qwnsrh8whno7icjbptoth66
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

On Thu, 2025-11-27 at 11:13 -0300, Daniel Almeida wrote:
>=20
>=20
> > On 25 Nov 2025, at 10:20, Philipp Stanner <phasta@mailbox.org> wrote:
> >=20
> > On Mon, 2025-11-24 at 10:58 -0300, Daniel Almeida wrote:
> > > Hi Phillip,
> > >=20
> > > > On 18 Nov 2025, at 10:25, Philipp Stanner <phasta@kernel.org> wrote=
:
> > > >=20
> > > >=20
> >=20
> > [=E2=80=A6]
> >=20
> > > > +use crate::{
> > > > +=C2=A0=C2=A0=C2=A0 prelude::*,
> > > > +=C2=A0=C2=A0=C2=A0 types::ARef,
> > > > +};
> > > > +use kernel::sync::{Arc, SpinLock, new_spinlock, DmaFence, DmaFence=
Ctx, DmaFenceCb, DmaFenceCbFunc};
> > > > +use kernel::list::*;
> > > > +use kernel::revocable::Revocable;
> > > > +
> > > > +
> > > > +#[pin_data]
> > > > +pub struct Job<T: ?Sized> {
> > > > +=C2=A0=C2=A0=C2=A0 credits: u32,
> > > > +//=C2=A0=C2=A0=C2=A0 dependencies: List, // TODO implement depende=
ncy list
> > >=20
> > > I am assuming that this will be a list of callbacks?
> >=20
> > That's supposed to become the list of DmaFence's which are to be
> > treated as dependencies of this job.
> >=20
> > Only once all fences in this list are signaled the JQ will push that
> > job.
>=20
> Ok, I was approaching this from the current DRM scheduler design, which (=
IIRC)
> uses callbacks to represent dependencies.
>=20

Depending on what "represent" means, it's the same here. A dependency
is some external fence, by definition one that doesn't come from the
same jobqueue / entity. To know when the dependency has been fulfilled,
you have to register one of your own events on the fence to wake
yourself.

>  IOW: if you managed to register a
> callback on a dependency, it means that it hasn=E2=80=99t signaled yet.

Yep.

>=20
> In any case, that was just me trying to understand this better. IMHO, fee=
l free
> to use anything you think it=E2=80=99s best here, like the whole DmaFence=
 struct.

I think what might be confusing a bit is that we're used to drm/sched,
where we have entities and the scheduler instance itself (and
runqueues). Jobqueue is entity and "scheduler" in once piece. So some
functionality that we were used to see in sched_entity is now in
Jobqueue.

>=20

[=E2=80=A6]

> > .
> >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /// Add a [`DmaFence`] or a [`DoneFence`] as th=
is job's dependency. The job
> > > > +=C2=A0=C2=A0=C2=A0 /// will only be executed after that dependency=
 has been finished.
> > > > +=C2=A0=C2=A0=C2=A0 pub fn add_dependency() -> Result {
> > >=20
> > > Which would let us remove this ^
> >=20
> > It would allow for removing this function, but you'd then just have an
> > optional (some jobs have no dependencies) function parameter in
> > DmaFence::submit_job().
>=20
> >=20
> > The current idea looks like this:
> >=20
> > ```
> > let jobq =3D JobQueue::new(=E2=80=A6);
> > let job =3D Job::new(driver_data);
> >=20
> > job.add_dependency(done_fence_of_shader_in_another_context); // optiona=
l
> > job.add_callback(cb_that_will_wake_userspace_or_sth); // optional
> >=20
> > let done_fence =3D jobq.submit_job(job)?;
> > ```
> >=20
> > The JQ eats the job (ownership transfer), so by design you have to set
> > all dependencies and specify everything that shall be done when the job
> > finishes _before_ submitting the job.
> >=20
> > I think an API in this form makes the order of events very obvious to
> > the user?
> >=20
>=20
>=20
> You=E2=80=99d pass a
>=20
> fn submit(=E2=80=A6, dependencies: &[DmaFence], callbacks: &[Callback])
>=20
> This way a user cannot submit a job without being explicit about dependen=
cies
> and callbacks, i.e.: it cannot be forgotten, while still being optional.=
=20

Hm. Yoah.
IDK, IMO semantically it's cleaner to have a job and methods that work
on the job, defining its characteristics and its consequences, and a
function that pushes jobs.

Your idea works obviously, and what you state might be an advantage. As
long as we're an RFC phase I think we can keep my draft for now and
gather more feedback from the others to see. But it's no big deal
either way probably

>=20
> > What happens then behind the scenes is that the JQ registers all the
> > callbacks on the done_fence returned above. I'm not super sure about
> > this design idea; it's certainly optional. However, it has the
> > advantage of freeing the JQ user from dealing with races of done_fence.
> >=20
> > Otherwise one would have to do something like
> >=20
> > ```
> > let done_fence =3D jobq.submit_job(job)?;
> >=20
> > let err =3D done_fence.register_callback(my_drivers_cb);
> > if err.was_race_and_is_already_signaled() {
> > execute_cb_code_myself_now();
> > }
> > ```
> >=20
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Enqueue passed=
 DmaFence into the job's dependency list.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /// Check if there are dependencies for this jo=
b. Register the jobqueue
> > > > +=C2=A0=C2=A0=C2=A0 /// waker if yes.
> > > > +=C2=A0=C2=A0=C2=A0 fn arm_deps() -> Result {
> > >=20
> > > I wonder if =E2=80=9Ccheck_dependencies=E2=80=9D would be a better na=
me? Or something
> > > along these lines.
> >=20
> > ACK.
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TODO: Register Depen=
dencyWaker here if applicable.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +}
> > > > +
> > > > +// Dummy trait for the linked list.
> > > > +trait JobData {
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 fn access_data(&self) -> i32;
> > >=20
> > > Can=E2=80=99t we dereference to the data?
> >=20
> > That's dummy code that only exists because I so far am failing with
> > even getting the basic List to work.
> >=20
> > >=20
> > > > +}
> > > > +
> > > > +#[pin_data]
> > > > +struct EnqueuedJob<T: ?Sized> {
> > > > +=C2=A0=C2=A0=C2=A0 inner: Pin<KBox<Job<T>>>,
> > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > +=C2=A0=C2=A0=C2=A0 links: ListLinksSelfPtr<EnqueuedJob<dyn JobData=
>>,
> > >=20
> > > Why not a KVec? A queue type can hold a KVec of enqueued jobs, and th=
is can
> > > hold an Arc of the queue type.
> >=20
> > My understanding is that KVec is not intended to be the data structure
> > for this?
> >=20
> > KVec is basically like a realloc() in C, an array of same sized
> > elements.
> >=20
> > The JQ, hypothetically, can hold an infinite amount of members in its
> > waiting_list, only the running_list is limited by the credit count.
>=20
> Then I'd pre-allocate or realloc() as needed. You can reuse the empty slo=
ts, so
> there won't be a unbounded growth. realloc() also looks fine, because it =
will
> happen outside of the signaling path.
>=20
> My point is that writing your own data structure adds complexity. Your ca=
ll,
> though.

My impression of the kernel is that it's uncommon to use arrays like
that.

I think your idea is charming because LinkedList is so astoinishingly
complex (from my POV). I'm iterating over DmaFence right now. Once that
is done I want to pick up the List topic and am going to investigate
your proposal.

>=20
> >=20
> >=20
> > > By extension, ensures that the queue does not
> > > die while we have enqueued jobs.
> >=20
> > See below.
> >=20
> > >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 done_fence: ARef<DmaFence<i32>>, // i32 is just=
 dummy data. TODO: allow for replacing with `()`
> > > > +=C2=A0=C2=A0=C2=A0 // The hardware_fence can by definition only be=
 set at an unknown point in
> > > > +=C2=A0=C2=A0=C2=A0 // time.
> > > > +=C2=A0=C2=A0=C2=A0 // TODO: Think about replacing this with a `str=
uct RunningJob` which consumes
> > > > +=C2=A0=C2=A0=C2=A0 // an `EnqueuedJob`.
> > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>, //=
 i32 is dummy data until there's DmaFence
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=
 without data.
> > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: u32,
> > > > +}
> > > > +
> > > > +impl<T> EnqueuedJob<T> {
> > > > +=C2=A0=C2=A0=C2=A0 fn new(inner: Pin<KBox<Job<T>>>, fctx: &Arc<Dma=
FenceCtx>) -> Result<ListArc<Self>> {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let pseudo_data: i32 =
=3D 42;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let done_fence =3D fctx=
.as_arc_borrow().new_fence(pseudo_data)?;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ListArc::pin_init(try_p=
in_init!(Self {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 inner,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 links <- ListLinksSelfPtr::new(),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 done_fence,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 hardware_fence: None,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 nr_of_deps: 0, // TODO implement
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }), GFP_KERNEL)
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +}
> > > > +
> > > > +impl_list_arc_safe! {
> > > > +=C2=A0=C2=A0=C2=A0 impl{T: ?Sized} ListArcSafe<0> for EnqueuedJob<=
T> { untracked; }
> > > > +}
> > > > +
> > > > +impl_list_item! {
> > > > +=C2=A0=C2=A0=C2=A0 impl ListItem<0> for EnqueuedJob<dyn JobData> {=
 using ListLinksSelfPtr { self.links }; }
> > > > +}
> > > > +
> > > > +// Callback item for the hardware fences to wake / progress the jo=
bqueue.
> > > > +struct HwFenceWaker<T> {
> > > > +=C2=A0=C2=A0=C2=A0 jobq: Arc<Revocable<SpinLock<InnerJobqueue>>>,
> > >=20
> > > Instead of a Revocable, why not keep an Arc of InnerJobQueue (which s=
hould
> > > perhaps be called JobQueueInner)?
> > >=20
> > > This way, the user can have this:
> > >=20
> > > struct JobQueue(Arc<JobqueueInner>);
> > >=20
> > > When the user drops the JobQueue, it will schedule whatever teardown
> > > operations,
> > >=20
> >=20
> > What kind of operation would that be? Completing all running_jobs?
> > Completing all waiting_jobs? Completing all running_jobs and canceling
> > all waiting_jobs? etc.
> >=20
>=20
> The same as the current DRM scheduler, i.e.:
>=20
> static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>  =C2=A0 struct dma_fence_cb *cb)
>=20
> My understanding is that the JobQueue will follow a similar pattern?

We have to be careful with being inspired by drm/sched. We can learn
from it and it contains a few good ideas probably, but there's a reason
why we write something new instead of putting Rust abstractions on top
:)

._.

The fundamental design problem spawning most of the other problems is
that drm/sched has two job lists in two data structures, and these two
have different life times: entities and pending_list (in sched itself).
Add GPU resets and teardown order on top and you've got an explosive
cocktail.

Jobqueue now, as stated above, can contain all job lists in itself,
partly thanks to the 1:1 relationship between hardware rings and
jobqueues.

I'm not even entirely sure, but I think that
drm_sched_entity_kill_jobs_work() exists mostly because of another
drastic design mistake: the existence of the free_job() callback. You
cannot call a driver callback from the driver's execution context (same
thread); mostly because of locking issues I think.

It also signals the s_fence, which we don't have in that form, we just
have the done_fence.


I think this shows well why Jobqueue is such a great simplification
compared to drm/sched. We don't have separate entities with separate
life times; we don't have jobs with hybrid ownership (created by the
driver, cleaned up by drm/sched) which make that entity kill mechanism
necessary. All we need to do when JQ gets killed (drop) is:

   1. Signal all still waiting or running jobs' done_fences with an
      error.
   2. Decouple JQ from the hardware_fences and dependency_fences.
   3. Stop / clean up the JQ's resources (so far only a work_item)

And other, quite complicated cleanup work from drm_sched such as
getting the refcounts right or free_job()ing the jobs is done
automatically for us by Rust.


>=20
> >=20
> > >=20

[=E2=80=A6]

>=20
> >=20
> >=20
> > > > +impl Drop for Jobqueue {
> > > > +=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The hardware fences =
might outlive the jobqueue. So hw_fence callbacks
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // could very well stil=
l call into job queue code, resulting in
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // data UAF or, should =
the jobqueue code be unloaded, even code UAF.
> > >=20
> > > Not if they reference JobQueueInner as I proposed above.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Thus, the jobqueue n=
eeds to be cleanly decoupled from the hardware
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // fences when it drops=
, in other words, it needs to deregister all its
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // hw_fence callbacks.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // This, however, could=
 easily deadlock when a hw_fence signals:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Step=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 Jobqueue step=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 hw_fence ste=
p
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // --------------------=
----------------------------------------------
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 1=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 JQ starts drop=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 fen=
ce signals
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 JQ lock taken=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 fence lock taken
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 3=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 Tries to take fence lock=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 Tries to take JQ lock
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 4=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ***DEADLOCK***=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ***=
DEADLOCK***
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to prevent =
deadlock, we first have to revoke access to the
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // JQ so that all fence=
 callbacks can't try to take the lock anymore,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // and then deregister =
all JQ callbacks.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.inner.revoke();
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let guard =3D self.inne=
r.lock();
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for job in self.inner.w=
aiting_jobs {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 job.deregister_dep_fences();
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for job in self.inner.r=
unning_jobs {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 job.deregister_hw_fence();
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > >=20
> > > Under my proposal above, you can also wait on dependencies if you wan=
t: the
> > > drop() thread will not be blocked.
> >=20
> > Maybe (I'd have to look deeper into the idea)
> >=20
> > But what for? When someone drops his jobqueue, one would like to think
> > that he doesn't care about all pending jobs anymore anyways. So the
> > main thing you need to guarantee is that userspace gets unblocked by
> > signaling all fences.
>=20
> I was basically trying to recreate this:
>=20
> static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>  =C2=A0 struct dma_fence_cb *cb)
> {
>  struct drm_sched_job *job =3D container_of(cb, struct drm_sched_job,
>  finish_cb);
>  unsigned long index;
>=20
>  dma_fence_put(f);
>=20
>  /* Wait for all dependencies to avoid data corruptions */
>  xa_for_each(&job->dependencies, index, f) {

We decouple also from the jobs' dependencies in drop(). As for other
parties which have jobs inside of this JQ as dependencies: they will
get unblocked by the done_fences getting signaled with -ECANCELED.

What we could think about is whether something like

jq.wait_to_become_idle(timeout);

could make sense. In drm/sched, such a proposal was mostly rejected
because all drivers have their own solutions for that currently AFAIK
(Nouveau has a waitqueue, but I think Nouveau actually doesn't care
about what happens to pending userspace jobs when drm_sched_fini() is
reached anyways, the waitqueue exists for page table cleanup work).

Also, Christian pointed out that it could block SIGKILL when the
hardware is really slow. But an interruptible / timeoutable version
could make sense, I think?

It'll depend a bit on when a Rust driver really drop()s its JQ. In
principle, the driver should signal all hw_fences before drop()ing it.


>=20
> >=20
> >=20
> > Note that we had very similar discussions when solving the memory leaks
> > in drm_sched_fini(). The TL;DR of those discussions was:
> >=20
> > * Refcounting drm_sched so that it can outlive drm_sched_fini() means
> > =C2=A0 that it will continue calling into the driver with the driver
> > =C2=A0 callbacks -> UAF
> > * Waiting could cause you to block SIGKILL
> > * The sanest way to go was deemed to be to signal everything in the
> > =C2=A0 pending_list synchronously. Once you've done this, you know for =
sure
> > =C2=A0 that everything is done and clean.
> >=20
> >=20
> > AFAICS, your proposal might still have the problem of JQ continuously
> > calling into driver code?
>=20
> You=E2=80=99re basically calling wait() and signal(), but not run(). On t=
op of
> that, I don=E2=80=99t think the callbacks can actually reach the driver w=
ithout
> taking an extra refcount on some driver structure (iow:=C2=A0 we should r=
equire the
> callbacks to be =E2=80=99static). So, IIUC, no, this would not call into =
the
> driver.

Rust's safety guarantees are limited AFAIU because the language doesn't
understand that 'static stuff can be unloaded in the kernel.

So if the driver got unloaded but the JQ lived on, JQ might at least
call an unloaded TEXT segment=C2=A0/ unloaded code. Or am I mistaken?


Anyways, I believe that synchronous solutions are always to be
preferred, because they just are simpler, provide a fix synchronization
point and it's easier for programmers to wrap their head around them.

IMO we should only make that async if it's necessary. But currently,
drop() would wait just for an RCU grace period (the revoke()) and then
signal all done_fences. As far as I understand the dma_fence contract,
no one must register anything blocking on dma_fences, so that should be
fine.

But correct me if I'm wrong. dma_fences are very complicated..


Greetings,
P.
