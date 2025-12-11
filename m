Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA5FCB5E7C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F5C10E2C8;
	Thu, 11 Dec 2025 12:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yWtC62ae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0895410E2C8;
 Thu, 11 Dec 2025 12:40:50 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dRsdB0hpNz9skt;
 Thu, 11 Dec 2025 13:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765456846; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UC2Z49FZnU/1sUK06FrnNxR34ENf2BMnNcELQfGYUHU=;
 b=yWtC62aefzJVjhIVf7KH2BaJ+oIPR9KB2QwhfN/Wqhco81A7VY2hmg4nCtAj82mnCu+ZIt
 JpBbRvBpgjgwcpwmevLNIFJVZmzFUp5+mz1GqeKUgB8enEyoVoXNR3VL2nfSje7e8oily3
 0fISYxHod0H866s3zizfkqDbKsMK2Gj4ZospC3lr9n2bEFHfVdbwbSwZGaCIKW4BmrFENJ
 7B+/X3BfeiK+VWzzEvJCMXp5gHAx/D3o+p7pLBp2fnutAzgb+5rdgXN/3unX9RcS8bV3A0
 s9ScYFaxadKskowOd82ExA99vNiiyvs3q3GwE0NdxbChKqRtzJm04idp4/VpUw==
Message-ID: <49ccd3784e1ebc54e3a4fb70b2a961418a4ba231.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, Lucas
 Stach <l.stach@pengutronix.de>
Date: Thu, 11 Dec 2025 13:40:42 +0100
In-Reply-To: <e4830223-23a4-45cd-940e-2dbad1036704@amd.com>
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
 <cbf77a87f928cbeb3f05579a58919a44f3a40593.camel@mailbox.org>
 <e4830223-23a4-45cd-940e-2dbad1036704@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 13665f335a8b93a19d6
X-MBO-RS-META: aziyzrorfawwkcw1f4tz5581ibk5ijz1
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

On Thu, 2025-12-11 at 12:55 +0100, Christian K=C3=B6nig wrote:
> On 12/11/25 12:32, Philipp Stanner wrote:
> > On Wed, 2025-12-10 at 09:08 -0800, Matthew Brost wrote:
> > > On Wed, Dec 10, 2025 at 02:06:15PM +0100, Philipp Stanner wrote:
> > > > On Wed, 2025-12-10 at 13:47 +0100, Christian K=C3=B6nig wrote:
> > > > > On 12/10/25 10:58, Philipp Stanner wrote:
> > > > > > On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
> > > > > > > On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian K=C3=B6ni=
g wrote:
> ...
> > > > > >=20
> > > > > > I can tell you how I design it in our Rust jobqueue:
> > > > > > Drivers create jobs, and in submit_job() the pass ownership ove=
r the
> > > > > > job to the jobqueue =E2=80=93 IOW after pushing a job, a driver=
 can't access it
> > > > > > anymore. In the run_job() callback, the jobqueue either passes =
the job
> > > > > > back by value (ownership) or borrows the job to the driver so t=
hat it
> > > > > > can be copied (this is done so that the JQ can hypothetically d=
o
> > > > > > resubmits).
> > > > > >=20
> > > > > > This way there is no need for refcounting (in Rust / jobqueue).
> > > > > >=20
> > >=20
> > > See below. If you need to resubmit for any reason, where will the
> > > information for resubmission be stored? Likewise, if you want to drop
> > > additional references on fence signaling, how are you going to retrie=
ve
> > > that?
> >=20
> > Well yes, as I just stated, it is, unfortunately, always necessary to
> > have a list of running jobs. The jobs inside of it don't need to be
> > shared with the driver, though.
> Actually the initially implementation of the scheduler didn't had a list =
of running jobs.
>=20
> The original idea was that you just call run_job() which returns a refere=
nce to the HW fence and then the scheduler installs a callback to this HW f=
ence which wakes up the scheduler again to push the next job.
>=20
> The idea of the scheduler being responsible to track what's in flight on =
the HW came much later and to be honest is actually not a functionality the=
 scheduler actually needs.

As far as I understand GPU driver design so far it's unavoidable to
have at the very least a list of finished fences in the scheduler, so
you can signal them once the hardware fences signal.

And at the very least once you have to do resubmissions you need to
remember which jobs / fences are in flight.

Unless it were possible to use the hardware_fence for everything.


>=20
> > Jobqueue could do resubmits through help with that list, by running the
> > desired jobs again. While run_job() executes, jobs are loaned to the
> > driver, who only needs them temporarily, not permanently.
> >=20
> > One could have that loaning in C, too, but would not be able to enforce
> > it.
> >=20
> > >=20
> > > > > > Maybe the core of the problem is not so much the lack of refcou=
nting,
> > > > > > but the lack of ownership rules. Why even would the driver need=
 the job
> > > > > > still after it got pushed? It should be fire-and-forget.
> > > > >=20
> > > > > Yeah, that sounds sane to me as well and is exactly how it was in=
itially designed in the drm_scheduler as well.
> > > > >=20
> > > > > The job is basically just the information the driver needs for th=
e submission which it gives to the scheduler on push, and the scheduler giv=
es back to the driver on pop.
> > > > >=20
> > > > > The full execution time is represented by the scheduler fence and=
 not the job. And the scheduler fence is reference counted exactly because =
of the reasons Mathew brought up here.
> > > >=20
> > > > Would be interesting to hear where Xe would still need the job. If =
only
> > > > the backend_ops give a driver access to a job again after it got
> > > > pushed, then it should be safe.
> > > >=20
> > >=20
> > > Xe needs a subset of the job after submission to handle tasks like
> > > resubmission after a device reset.
> > >=20
> >=20
> > the job or the jobS?
> >=20
> > Because you get the job that caused the timeout by the scheduler,
> > through timedout_job().
> >=20
> > And the rest you need will soonish be obtainable through the new
> > iterator. So what else do you need?
> >=20
> >=20
> > > =C2=A0It=E2=80=99s questionable whether we need
> > > this, as it shouldn=E2=80=99t happen in practice=E2=80=94only individ=
ual queues should
> > > fail with a working KMD and hardware. It likely doesn=E2=80=99t work =
anyway if
> > > queues have interdependencies. This is really an opportunistic approa=
ch.
> > >=20
> > > However, we absolutely need this for VF migration resubmission. Again=
,
> > > this requires only a very small subset of driver job information. I
> > > believe it=E2=80=99s just the starting point in the ring, batch addre=
ss(es), and
> > > a pointer to the driver-side queue object.
> >=20
> > In Rust, I borrow the job to the driver. So if it really needs
> > something about it permanently, it can copy it into some object with a
> > decoupled life-time.
> > Or maybe have the job-struct's generic data-field contain something
> > refcounted, IDK.
> >=20
> >=20
> >=20
> > >=20
> > > We also build a reference-counting model around jobs, where the final
> > > put releases other objects and runtime power management references. T=
his
> > > assumes that the job=E2=80=99s final put means the scheduler fence is=
 signaled.
> > > Again, this is really just a small subset of information we need here=
.
> > >=20
> > > So if we add hooks to store the subset of information Xe needs for
> > > everything above in the scheduler fence and a non-IRQ, pausable callb=
ack
> > > (i.e., won=E2=80=99t execute when the scheduler is stopped, like free=
_job), this
> > > could be made to work. We really don=E2=80=99t need about 90% of the =
information
> > > in the job and certainly nothing in the base object.
> > >=20
> > > This would be major surgery, though. I suspect most drivers have a
> > > subset of information in the job that needs to stick around until it
> > > signals, so this means surgery across 11 drivers.
> >=20
> > Not sure if that's worth it. My hope would more be that interested
> > users with firmware scheduling can switch to jobqueue and start over
> > with a fresh, clean design with proper memory life times.
>=20
> That sounds reasonable to me. I was more than once at the point of wantin=
g to nuke the scheduler and starting from scratch again.
>=20

Actually, since the 1950s, you don't want to rewrite software at all
anymore. Yet we again and again end up at that point.

Only works if you *really* get it right. Even with jobqueue that's
already becoming more complicated, because we might have to support
resubmits, which I hoped we could 100% avoid.

drm_sched's primary design mistake is having two job lists with
different life times AND on top of that resubmits.

> > > > > I'm absolutely not against reference counting, what I'm pushing b=
ack is abusing the job object as something it was never designed for while =
we already have an object which implements exactly the needed functionality=
.
> > >=20
> > > Well, oops. Having free_job called after the fence is signaled is how=
 I
> > > arrived at the implementation in Xe. I agree that if we can move driv=
er
> > > info into the scheduler fence, this could work for likely everyone.
>=20
> Ok in that case I'm going to give that a try.
>=20
> > > > > > > > > And my uneducated guess is that it's happening in amdgpu.=
 It seems a
> > > > > > > > > sched_job lives inside an amdgpu_job. Can the latter be f=
reed at other
> > > > > > > > > places than free_job()?
> > > > > > > >=20
> > > > > > > > > >=20
> > > > > >=20
> > > > > > [=E2=80=A6]
> > > > > >=20
> > > > > > > > > > It basically says to the driver that the job lifetime p=
roblems created by the scheduler is the driver problem and need to be worke=
d around there.
> > > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > My POV still mostly is that (with the current design) the=
 driver must
> > > > > > > > > not use jobs after free_job() was invoked. And when that =
happens is
> > > > > > > > > unpredictable.
> > > > > > > > >=20
> > > > > > >=20
> > > > > > > This is somewhat of an absurd statement from my point of view=
. I have a
> > > > > > > valid job pointer, then I call another function (see above fo=
r an
> > > > > > > example of how drm_sched_start/stop is unsafe) and it disappe=
ars behind
> > > > > > > my back.
> > > > > > >=20
> > > > > >=20
> > > > > > The statement is absurd because reality (the code) is absurd. W=
e all
> > > > > > are basically Alice in Wonderland, running as fast as we can ju=
st to
> > > > > > remain on the same spot ^_^
> > > > > >=20
> > > > > > What I am stating is not that this is *good*, but this is what =
it
> > > > > > currently is like. Whether we like it or not.
> > > > > >=20
> > > > > > The misunderstanding you and I might have is that for me jobs h=
aving to
> > > > > > be refcounted is not a reality until it's reflected in code,
> > > > > > documentation and, ideally, drivers.
> > > > > >=20
> > >=20
> > > I agree this part is badly misdesigned. In the timedout job callback,
> > > you=E2=80=99re handed a job, and if you perform certain actions, it c=
an just
> > > disappear=E2=80=94 even all the way back to the caller of timedout_jo=
b. That=E2=80=99s
> > > not great. Then we have this free_guilty mechanism to avoid it
> > > disappearing, but sometimes it still does, which is horrible.
> >=20
> > Who makes it disappear, the driver callback? Because that free_guilty
> > mechanism is what frees jobs in the first place.
>=20
> I think so yes.

The driver must not free the job in timedout_job. That's completely
against the design, be it bad or good. free_job() is the point where
you can free. That's why it's called that.

>=20
> > The more you think about it, the more astonished you become how this
> > could ever have been designed and merged that way. There was no clean
> > design anywhere, neither with APIs, nor life times, nor locking.
>=20
> Yeah, which is exactly the reason why I said I'm not going to maintain th=
at stuff.
>=20
> I mean I still feel guilty that it came this far, but yeah.

You've said so frequently, don't worry too much. I just bring it up out
of surprise because, you know, some design mistakes are unavoidable.
It's just very difficult, GPU resubmits, hangs and all that. But other
things and certain hacks (drm_sched_fini()) are so *obviously* broken
that you wonder..


P.

>=20
> > > > > > > =C2=A0The safe way to handle this is to take a local referenc=
e before
> > > > > > > doing anything that could make it disappear. That is much mor=
e
> > > > > > > reasonable than saying, =E2=80=9Cwe have five things you can =
do in the
> > > > > > > scheduler, and if you do any of them it isn=E2=80=99t safe to=
 touch the job
> > > > > > > afterward.=E2=80=9D
> > > > > >=20
> > > > > > Yeah, but that's drm_sched being drm_scheddy. Before I document=
ed it
> > > > > > there were also these implicit refcounting rules in run_job(), =
where
> > > > > > the driver needs to take the reference for the scheduler for it=
 to be
> > > > > > non-racy.
> > > > > >=20
> > >=20
> > > Yes, agreed. This is my fault for not being more responsible in fixin=
g
> > > issues rather than just backing away from these really scary parts of
> > > the code (e.g., drm_sched_stop, drm_sched_start,
> > > drm_sched_resubmit_jobs, etc.) and doing something sane in Xe by usin=
g
> > > only a subset of the scheduler.
> >=20
> > It's a bit like writing C++: no one can ever agree which feature subset
> > is safe to use.
> >=20
> > That's why we want to do a fresh restart for firmware-schedulers, since
> > they allow us to drastically simplify things. Timeout? Close the ring.
> > Job-pushing is fire and forget. Resets? Rings aren't shared.
>=20
> +1
>=20
> > > > > > It also wasn't documented for a long time that drm_sched (throu=
gh
> > > > > > spsc_queue) will explode if you don't use entities with a singl=
e
> > > > > > producer thread.
> > > > >=20
> > > > > That is actually documented, but not on the scheduler but rather =
the dma_fence.
> > > > >=20
> > >=20
> > > spsc - "Single producer, Single consumer". So it is in the name.
> >=20
> > Ah, NTOTM.
> >=20
> > What's obvious for one party is a mystery to someone with a different
> > mind. I recognized the meaning after months, after work one day.
> >=20
> > But don't get me started on that queue=E2=80=A6=E2=80=A6
> >=20
> > >=20
> > > > > And that you can only have a single producer is a requirement inh=
erited from the dma_fence and not scheduler specific at all.
> > > >=20
> > > > What does dma_fence have to do with it? It's about the spsc_queue b=
eing
> > > > racy like mad. You can access and modify dma_fence's in parallel
> > > > however you want =E2=80=93 they are refcounted and locked.
> > > >=20
> > > >=20
> > > > P.
> > > >=20
> > > > >=20
> > > > > > drm_sched got here because of gross design mistakes, lots of ha=
cks for
> > > > > > few drivers, and, particularly, a strange aversion=C2=B9 agains=
t writing
> > > > > > documentation. If Xe came, back in the day, to the conclusion t=
hat job
> > > > > > lifetimes are fundamentally broken and that the objectively cor=
rect way
> > > > > > to solve this is refcounting, then why wasn't that pushed into
> > > > > > drm_sched back then?
> > > > > >=20
> > > > > > >=20
> > > > > > > > > To be unfair, we already have strange refcount expectatio=
ns already.
> > > > > > > > > But I sort of agree that there is no objectively good sol=
ution in
> > > > > > > > > sight.
> > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > Let me respin to my documentation series and upstream=
 that soonish,
> > > > > > > > > > > than we can build on top of that.
> > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > P.
> > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > 2. Move reference counting to the base DRM schedule=
r job object, provide a
> > > > > > > > > > > > =C2=A0=C2=A0 vfunc for the final job put, and docum=
ent usage. Medium invasive.
> > > > > > > > > >=20
> > > > > > > > > > I strongly think that reference counting the job object=
 just because the scheduler needs it is a bad idea.
> > > > > > > > > >=20
> > > > > > > > > > With that we are just moving the hot potato from one si=
de of our mouth to the other without really solving the issue.
> > > > > > > > > >=20
> > > > > > >=20
> > > > > > > See above=E2=80=94I can=E2=80=99t say I agree with this asses=
sment. I think the lack of
> > > > > > > reference counting is exactly the problem. I don=E2=80=99t re=
ally understand the
> > > > > > > pushback on a very well-understood concept (reference countin=
g) in
> > > > > > > Linux. I would sign up to fix the entire subsystem if we go t=
his route.
> > > > > > >=20
> > > > > > > > > > If a driver like XE needs that for some reason than tha=
t is perfectly fine.
> > > > > > > > >=20
> > > > > > > > > Nouveau doesn't need it either.
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > > > 3. Move job (driver) side tracking to the scheduler=
 fence and let it
> > > > > > > > > > > > =C2=A0=C2=A0 control the lifetime. Very invasive.
> > > > > > > > > >=20
> > > > > > > > > > Thinking about it more that is actually not so much of =
a problem.
> > > > > > > > > >=20
> > > > > > > > > > Let me try to code something together by the end of nex=
t week or so.
> > > > > > > > >=20
> > > > > > > > > The hero Gotham needs :)
> > > > > > > > >=20
> > > > > > >=20
> > > > > > > Are you sure about this one? I think unless the problems arou=
nd
> > > > > > > drm_sched_start/stop and free_guilty are fixed, my feeling is=
 this
> > > > > > > entire thing is still badly broken for anyone who wants to us=
e those.
> > > > > > >=20
> > > > > > > To sum up this whole email: I strongly disagree with option #=
3, but if
> > > > > > > that is the consensus, I will, of course, support the effort.
> > > > > >=20
> > > > > >=20
> > > > > > I would like to discuss those topics with Danilo, too, who retu=
rns from
> > > > > > LPC soonish. Also to get some more insights into Nouveau and ou=
r use-
> > > > > > cases.
> > > > > >=20
> > > > > > My suggestion is that we pick the conversation up again soonish=
.
> > > > > > Christmas is around the corner, and I suppose we can't fix this=
 all up
> > > > > > in 2025 anyways, so we might want to give it a fresh re-spin in=
 '26.
> > > > >=20
> > > > > Since we finally found the root cause I'm all in postponing that =
till next year.
> > > > >=20
> > >=20
> > > Ok, glad we found the root cause. I=E2=80=99m not as opposed to optio=
n #3 as
> > > stated=E2=80=94this was a bit of angry typing=E2=80=94but if we go in=
 that direction, we
> > > really need clear rules, for example:
> > >=20
> > > - A job cannot be referenced driver-side after the initial
> > > =C2=A0 drm_sched_entity_push_job call, aside from a single run_job ca=
llback.
> >=20
> > That's what the current code and documentation demand, yes.
> >=20
> > > =C2=A0 Maybe run_job is actually replaced by a scheduler fence input?
> >=20
> > fence input?
>=20
> ops->schedule(job) ?
>=20
> > > - Drivers can attach information to the scheduler fence and control i=
ts
> > > =C2=A0 lifetime.
> > > - Drivers can iterate over pending scheduler fences when the schedule=
r
> > > =C2=A0 is stopped.
> >=20
> > That sounds as if we're about to make a mistake with the job-iterator.
> >=20
> > > - Drivers receive a pausable callback in a non-IRQ context when the
> > > =C2=A0 scheduler fence signals.
> > >=20
> > > etc...
> > >=20
> > > Again, this is a pretty major change. I personally wouldn=E2=80=99t f=
eel
> > > comfortable hacking 11 drivers=E2=80=9410 of which aren=E2=80=99t min=
e=E2=80=94to do something
> > > like this. Refcounting the job would be less invasive and would make =
the
> > > existing hairball of code safe.
> >=20
> > See my firmware-scheduler comment above. The issue is that getting
> > systems with lax rules back under control in hindsight is 10x as
> > expensive as carefully designing strict rules from the get-go.
> >=20
> > My experience so far is that a maintainer's primary job is actually
> > keeping APIs consistent and forcing people to document everything
> > properly.
>=20
> I would rather say that a maintainers job is to reject bad ideas and push=
 for good ones.
>=20
> Christian.
>=20
> >=20
> >=20
> > P.

