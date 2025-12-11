Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D984ACB5A4C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 12:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B8B10E7AF;
	Thu, 11 Dec 2025 11:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="eDlFrsin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD75410E718;
 Thu, 11 Dec 2025 11:32:32 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dRr6N5rv0z9tKQ;
 Thu, 11 Dec 2025 12:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765452748; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=za2Gr2xRXEjAgvc35RI8Fdt5InnusYfk5Hv6LAxePYY=;
 b=eDlFrsinXMvJbghQ6UGtnefFdLyKPzv9T2tlrXdX6n2BbmNKYd6bWtfGpPot70qtkrKpzu
 +Ve3tPQALxTX+l+rbQZ5DsGsdVQcdoI6QObMqNlyIzgsn6p7iWsG5jWqjgXlKeMi5w63Pr
 avybpTXnWQXGrMdlZB+9TbnEs6cfQX8/aXEHXnQEkylOF2e0bR2UEZ6SxrxxxM2Mj0/4Wr
 JwB4DgfRD802cjs06SY7GsqgYPVcIqnTF5P9ZnAGLb2mzm6xu+5ajiO2F0EHsPmHS+NbK3
 eaoLIHPHUPJP0gHPidLSZ+rxdkTpkh3iaJnJbTko9wkoI0rkTZVGofoyQ3442w==
Message-ID: <cbf77a87f928cbeb3f05579a58919a44f3a40593.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, phasta@kernel.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, Lucas
 Stach <l.stach@pengutronix.de>
Date: Thu, 11 Dec 2025 12:32:24 +0100
In-Reply-To: <aTmpFgeDsyq0a9vK@lstrano-desk.jf.intel.com>
References: <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
 <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
 <8ceb06b4-5f56-471d-91f6-a6ea6733e9a8@amd.com>
 <b0e9af12b924e09c0006f0a3068aca3e4ea6fc30.camel@mailbox.org>
 <aTmpFgeDsyq0a9vK@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f92ec2ac802ac78df98
X-MBO-RS-META: t4spyeac76yfmp83zuh67uhcoxttixrd
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

On Wed, 2025-12-10 at 09:08 -0800, Matthew Brost wrote:
> On Wed, Dec 10, 2025 at 02:06:15PM +0100, Philipp Stanner wrote:
> > On Wed, 2025-12-10 at 13:47 +0100, Christian K=C3=B6nig wrote:
> > > On 12/10/25 10:58, Philipp Stanner wrote:
> > > > On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
> > > > > On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian K=C3=B6nig wr=
ote:
> > > ..
> > > > > > > > My educated guess is that drm_sched_stop() inserted the job=
 back into the pending list, but I still have no idea how it is possible th=
at free_job is running after the scheduler is stopped.
> > > > >=20
> > > > > I believe I found your problem, referencing amdgpu/amdgpu_device.=
c here.
> > > > >=20
> > > > > 6718=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (job)
> > > > > 6719=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ti =3D amdgpu_vm_get_task_info_pasid(adev, job->pasid);
> > >=20
> > > WTF! There it is! Thanks a lot for pointing that out!
>=20
> No problem.
>=20
> >=20
> > scripts/decode_stacktrace.sh should be able to find the exact location
> > of a UAF. Requires manual debugging with the kernel build tree at
> > hands, though. So that's difficult in CIs.
> >=20
>=20
> I wasn't aware of this. Usually I do below after rebuilding kernel with
> debug symbols.
>=20
> gdb <offending_file.o>
> list *(<last stack trace line>)
>=20
> Here I just saw 'last stack trace line' was at the very end of
> amdgpu_device_gpu_recover and happend to spot this.
>=20
> > >=20
> > > > >=20
> > > > >=20

[=E2=80=A6]

> > > >=20
> > > > I can tell you how I design it in our Rust jobqueue:
> > > > Drivers create jobs, and in submit_job() the pass ownership over th=
e
> > > > job to the jobqueue =E2=80=93 IOW after pushing a job, a driver can=
't access it
> > > > anymore. In the run_job() callback, the jobqueue either passes the =
job
> > > > back by value (ownership) or borrows the job to the driver so that =
it
> > > > can be copied (this is done so that the JQ can hypothetically do
> > > > resubmits).
> > > >=20
> > > > This way there is no need for refcounting (in Rust / jobqueue).
> > > >=20
>=20
> See below. If you need to resubmit for any reason, where will the
> information for resubmission be stored? Likewise, if you want to drop
> additional references on fence signaling, how are you going to retrieve
> that?

Well yes, as I just stated, it is, unfortunately, always necessary to
have a list of running jobs. The jobs inside of it don't need to be
shared with the driver, though.

Jobqueue could do resubmits through help with that list, by running the
desired jobs again. While run_job() executes, jobs are loaned to the
driver, who only needs them temporarily, not permanently.

One could have that loaning in C, too, but would not be able to enforce
it.

>=20
> > > > Maybe the core of the problem is not so much the lack of refcountin=
g,
> > > > but the lack of ownership rules. Why even would the driver need the=
 job
> > > > still after it got pushed? It should be fire-and-forget.
> > >=20
> > > Yeah, that sounds sane to me as well and is exactly how it was initia=
lly designed in the drm_scheduler as well.
> > >=20
> > > The job is basically just the information the driver needs for the su=
bmission which it gives to the scheduler on push, and the scheduler gives b=
ack to the driver on pop.
> > >=20
> > > The full execution time is represented by the scheduler fence and not=
 the job. And the scheduler fence is reference counted exactly because of t=
he reasons Mathew brought up here.
> >=20
> > Would be interesting to hear where Xe would still need the job. If only
> > the backend_ops give a driver access to a job again after it got
> > pushed, then it should be safe.
> >=20
>=20
> Xe needs a subset of the job after submission to handle tasks like
> resubmission after a device reset.
>=20

the job or the jobS?

Because you get the job that caused the timeout by the scheduler,
through timedout_job().

And the rest you need will soonish be obtainable through the new
iterator. So what else do you need?


>  It=E2=80=99s questionable whether we need
> this, as it shouldn=E2=80=99t happen in practice=E2=80=94only individual =
queues should
> fail with a working KMD and hardware. It likely doesn=E2=80=99t work anyw=
ay if
> queues have interdependencies. This is really an opportunistic approach.
>=20
> However, we absolutely need this for VF migration resubmission. Again,
> this requires only a very small subset of driver job information. I
> believe it=E2=80=99s just the starting point in the ring, batch address(e=
s), and
> a pointer to the driver-side queue object.

In Rust, I borrow the job to the driver. So if it really needs
something about it permanently, it can copy it into some object with a
decoupled life-time.
Or maybe have the job-struct's generic data-field contain something
refcounted, IDK.



>=20
> We also build a reference-counting model around jobs, where the final
> put releases other objects and runtime power management references. This
> assumes that the job=E2=80=99s final put means the scheduler fence is sig=
naled.
> Again, this is really just a small subset of information we need here.
>=20
> So if we add hooks to store the subset of information Xe needs for
> everything above in the scheduler fence and a non-IRQ, pausable callback
> (i.e., won=E2=80=99t execute when the scheduler is stopped, like free_job=
), this
> could be made to work. We really don=E2=80=99t need about 90% of the info=
rmation
> in the job and certainly nothing in the base object.
>=20
> This would be major surgery, though. I suspect most drivers have a
> subset of information in the job that needs to stick around until it
> signals, so this means surgery across 11 drivers.

Not sure if that's worth it. My hope would more be that interested
users with firmware scheduling can switch to jobqueue and start over
with a fresh, clean design with proper memory life times.

>=20
> > >=20
> > > I'm absolutely not against reference counting, what I'm pushing back =
is abusing the job object as something it was never designed for while we a=
lready have an object which implements exactly the needed functionality.
>=20
> Well, oops. Having free_job called after the fence is signaled is how I
> arrived at the implementation in Xe. I agree that if we can move driver
> info into the scheduler fence, this could work for likely everyone.
>=20
> > > > > > > And my uneducated guess is that it's happening in amdgpu. It =
seems a
> > > > > > > sched_job lives inside an amdgpu_job. Can the latter be freed=
 at other
> > > > > > > places than free_job()?
> > > > > >=20
> > > > > > > >=20
> > > >=20
> > > > [=E2=80=A6]
> > > >=20
> > > > > > > > It basically says to the driver that the job lifetime probl=
ems created by the scheduler is the driver problem and need to be worked ar=
ound there.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > My POV still mostly is that (with the current design) the dri=
ver must
> > > > > > > not use jobs after free_job() was invoked. And when that happ=
ens is
> > > > > > > unpredictable.
> > > > > > >=20
> > > > >=20
> > > > > This is somewhat of an absurd statement from my point of view. I =
have a
> > > > > valid job pointer, then I call another function (see above for an
> > > > > example of how drm_sched_start/stop is unsafe) and it disappears =
behind
> > > > > my back.
> > > > >=20
> > > >=20
> > > > The statement is absurd because reality (the code) is absurd. We al=
l
> > > > are basically Alice in Wonderland, running as fast as we can just t=
o
> > > > remain on the same spot ^_^
> > > >=20
> > > > What I am stating is not that this is *good*, but this is what it
> > > > currently is like. Whether we like it or not.
> > > >=20
> > > > The misunderstanding you and I might have is that for me jobs havin=
g to
> > > > be refcounted is not a reality until it's reflected in code,
> > > > documentation and, ideally, drivers.
> > > >=20
>=20
> I agree this part is badly misdesigned. In the timedout job callback,
> you=E2=80=99re handed a job, and if you perform certain actions, it can j=
ust
> disappear=E2=80=94 even all the way back to the caller of timedout_job. T=
hat=E2=80=99s
> not great. Then we have this free_guilty mechanism to avoid it
> disappearing, but sometimes it still does, which is horrible.

Who makes it disappear, the driver callback? Because that free_guilty
mechanism is what frees jobs in the first place.

The more you think about it, the more astonished you become how this
could ever have been designed and merged that way. There was no clean
design anywhere, neither with APIs, nor life times, nor locking.

>=20
> > > > > =C2=A0The safe way to handle this is to take a local reference be=
fore
> > > > > doing anything that could make it disappear. That is much more
> > > > > reasonable than saying, =E2=80=9Cwe have five things you can do i=
n the
> > > > > scheduler, and if you do any of them it isn=E2=80=99t safe to tou=
ch the job
> > > > > afterward.=E2=80=9D
> > > >=20
> > > > Yeah, but that's drm_sched being drm_scheddy. Before I documented i=
t
> > > > there were also these implicit refcounting rules in run_job(), wher=
e
> > > > the driver needs to take the reference for the scheduler for it to =
be
> > > > non-racy.
> > > >=20
>=20
> Yes, agreed. This is my fault for not being more responsible in fixing
> issues rather than just backing away from these really scary parts of
> the code (e.g., drm_sched_stop, drm_sched_start,
> drm_sched_resubmit_jobs, etc.) and doing something sane in Xe by using
> only a subset of the scheduler.

It's a bit like writing C++: no one can ever agree which feature subset
is safe to use.

That's why we want to do a fresh restart for firmware-schedulers, since
they allow us to drastically simplify things. Timeout? Close the ring.
Job-pushing is fire and forget. Resets? Rings aren't shared.

>=20
> > > > It also wasn't documented for a long time that drm_sched (through
> > > > spsc_queue) will explode if you don't use entities with a single
> > > > producer thread.
> > >=20
> > > That is actually documented, but not on the scheduler but rather the =
dma_fence.
> > >=20
>=20
> spsc - "Single producer, Single consumer". So it is in the name.

Ah, NTOTM.

What's obvious for one party is a mystery to someone with a different
mind. I recognized the meaning after months, after work one day.

But don't get me started on that queue=E2=80=A6=E2=80=A6

>=20
> > > And that you can only have a single producer is a requirement inherit=
ed from the dma_fence and not scheduler specific at all.
> >=20
> > What does dma_fence have to do with it? It's about the spsc_queue being
> > racy like mad. You can access and modify dma_fence's in parallel
> > however you want =E2=80=93 they are refcounted and locked.
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > > drm_sched got here because of gross design mistakes, lots of hacks =
for
> > > > few drivers, and, particularly, a strange aversion=C2=B9 against wr=
iting
> > > > documentation. If Xe came, back in the day, to the conclusion that =
job
> > > > lifetimes are fundamentally broken and that the objectively correct=
 way
> > > > to solve this is refcounting, then why wasn't that pushed into
> > > > drm_sched back then?
> > > >=20
> > > > >=20
> > > > > > > To be unfair, we already have strange refcount expectations a=
lready.
> > > > > > > But I sort of agree that there is no objectively good solutio=
n in
> > > > > > > sight.
> > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > Let me respin to my documentation series and upstream tha=
t soonish,
> > > > > > > > > than we can build on top of that.
> > > > > > >=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > P.
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > 2. Move reference counting to the base DRM scheduler jo=
b object, provide a
> > > > > > > > > > =C2=A0=C2=A0 vfunc for the final job put, and document =
usage. Medium invasive.
> > > > > > > >=20
> > > > > > > > I strongly think that reference counting the job object jus=
t because the scheduler needs it is a bad idea.
> > > > > > > >=20
> > > > > > > > With that we are just moving the hot potato from one side o=
f our mouth to the other without really solving the issue.
> > > > > > > >=20
> > > > >=20
> > > > > See above=E2=80=94I can=E2=80=99t say I agree with this assessmen=
t. I think the lack of
> > > > > reference counting is exactly the problem. I don=E2=80=99t really=
 understand the
> > > > > pushback on a very well-understood concept (reference counting) i=
n
> > > > > Linux. I would sign up to fix the entire subsystem if we go this =
route.
> > > > >=20
> > > > > > > > If a driver like XE needs that for some reason than that is=
 perfectly fine.
> > > > > > >=20
> > > > > > > Nouveau doesn't need it either.
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > > > 3. Move job (driver) side tracking to the scheduler fen=
ce and let it
> > > > > > > > > > =C2=A0=C2=A0 control the lifetime. Very invasive.
> > > > > > > >=20
> > > > > > > > Thinking about it more that is actually not so much of a pr=
oblem.
> > > > > > > >=20
> > > > > > > > Let me try to code something together by the end of next we=
ek or so.
> > > > > > >=20
> > > > > > > The hero Gotham needs :)
> > > > > > >=20
> > > > >=20
> > > > > Are you sure about this one? I think unless the problems around
> > > > > drm_sched_start/stop and free_guilty are fixed, my feeling is thi=
s
> > > > > entire thing is still badly broken for anyone who wants to use th=
ose.
> > > > >=20
> > > > > To sum up this whole email: I strongly disagree with option #3, b=
ut if
> > > > > that is the consensus, I will, of course, support the effort.
> > > >=20
> > > >=20
> > > > I would like to discuss those topics with Danilo, too, who returns =
from
> > > > LPC soonish. Also to get some more insights into Nouveau and our us=
e-
> > > > cases.
> > > >=20
> > > > My suggestion is that we pick the conversation up again soonish.
> > > > Christmas is around the corner, and I suppose we can't fix this all=
 up
> > > > in 2025 anyways, so we might want to give it a fresh re-spin in '26=
.
> > >=20
> > > Since we finally found the root cause I'm all in postponing that till=
 next year.
> > >=20
>=20
> Ok, glad we found the root cause. I=E2=80=99m not as opposed to option #3=
 as
> stated=E2=80=94this was a bit of angry typing=E2=80=94but if we go in tha=
t direction, we
> really need clear rules, for example:
>=20
> - A job cannot be referenced driver-side after the initial
> =C2=A0 drm_sched_entity_push_job call, aside from a single run_job callba=
ck.

That's what the current code and documentation demand, yes.

> =C2=A0 Maybe run_job is actually replaced by a scheduler fence input?

fence input?

> - Drivers can attach information to the scheduler fence and control its
> =C2=A0 lifetime.
> - Drivers can iterate over pending scheduler fences when the scheduler
> =C2=A0 is stopped.

That sounds as if we're about to make a mistake with the job-iterator.

> - Drivers receive a pausable callback in a non-IRQ context when the
> =C2=A0 scheduler fence signals.
>=20
> etc...
>=20
> Again, this is a pretty major change. I personally wouldn=E2=80=99t feel
> comfortable hacking 11 drivers=E2=80=9410 of which aren=E2=80=99t mine=E2=
=80=94to do something
> like this. Refcounting the job would be less invasive and would make the
> existing hairball of code safe.

See my firmware-scheduler comment above. The issue is that getting
systems with lax rules back under control in hindsight is 10x as
expensive as carefully designing strict rules from the get-go.

My experience so far is that a maintainer's primary job is actually
keeping APIs consistent and forcing people to document everything
properly.


P.

>=20
> Matt
>=20
> > > Christian.
> > >=20
> > > >=20
> > > >=20
> > > > Greetings,
> > > > P.
> > > >=20
> > > >=20
> > > >=20
> > > > [=C2=B9] The strangest aversion in drm_sched, however, is the one a=
gainst
> > > > locking. Locks were only taken when *absolutely* necessary. It's as=
 if
> > > > the entire code was designed by some gamers who want to show their
> > > > youtube subscribers that they can get 1fps more by changing RAM tim=
ings
> > > > in the bios.
> > > > drm_sched might be the component in the kernel using the most
> > > > synchronization mechanisms: Spinlocks, RCU, atomic integers, atomic
> > > > instructions, refcounting, READ_ONCE(), just accessing locklessly=
=E2=80=A6 even
> > > > Paul McKenney would get wide eyes here. The only thing we're still
> > > > missing is seqlocks and rw_locks, but maybe we can add those /s
> > > >=20
> > > > That's likely sth we can't get repaired at all anymore.
> > >=20
> >=20

