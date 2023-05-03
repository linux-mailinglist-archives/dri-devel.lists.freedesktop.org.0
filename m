Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E006F562D
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 12:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BEE10E255;
	Wed,  3 May 2023 10:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798F10E255
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 10:28:51 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pu9iw-0007Y0-9D; Wed, 03 May 2023 12:28:38 +0200
Message-ID: <2ff0d221ed6033bd03c30fdd25abd2a41fb06fb2.camel@pengutronix.de>
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Boris
 Brezillon <boris.brezillon@collabora.com>
Date: Wed, 03 May 2023 12:28:35 +0200
In-Reply-To: <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Am Mittwoch, dem 03.05.2023 um 10:47 +0200 schrieb Christian K=C3=B6nig:
> Adding Luben as well.
>=20
> Am 03.05.23 um 10:16 schrieb Boris Brezillon:
> > [SNIP]
> > > To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().
> > After the discussion I had with Matthew yesterday on IRC, I
> > realized there was no clear agreement on this. Matthew uses those 3
> > helpers in the Xe driver right now, and given he intends to use a
> > multi-threaded wq for its 1:1 schedulers run queue, there's no way he
> > can get away without calling drm_sched_{start,stop}().
> > drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
> > wondering if it wouldn't be preferable to add a ::resubmit_job() method
> > or extend the ::run_job() one to support the resubmit semantics, which,
> > AFAIU, is just about enforcing the job done fence (the one returned by
> > ::run_job()) doesn't transition from a signaled to an unsignaled state.
> >=20
> > But probably more important than providing a generic helper, we should
> > document the resubmit semantics (AKA, what should and/or shouldn't be
> > done with pending jobs when a recovery happens). Because forbidding
> > people to use a generic helper function doesn't give any guarantee that
> > they'll do the right thing when coding their own logic, unless we give
> > clues about what's considered right/wrong, and the current state of the
> > doc is pretty unclear in this regard.
>=20
> I should probably talk about the history of the re-submit feature a bit=
=20
> more.
>=20
> Basically AMD came up with re-submission as a cheap way of increasing=20
> the reliability of GPU resets. Problem is that it turned into an=20
> absolutely nightmare. We tried for the last 5 years or so to get that=20
> stable and it's still crashing.
>=20
> The first and most major problem is that the kernel doesn't even has the=
=20
> information if re-submitting jobs is possible or not. For example a job=
=20
> which has already been pushed to the hw could have grabbed a binary=20
> semaphore and re-submitting it will just wait forever for the semaphore=
=20
> to be released.
>=20
I can follow this argument, but concluding that job resubmission is
impossible is punishing simple GPUs. On Vivante GPUs we have exactly
one job running at a time and all dependencies are visible to the
scheduler, as we don't have/use any hardware synchronization mechanism,
so all synchronization is piped through kernel visible fences.

It's reasonably easy for the etnaviv driver to find the guilty job to
skip but resubmit all other jobs in the current hardware queue. I'm not
really fond of having to make all applications deal with innocent
context resets, while we can solve this via resubmission on simple HW.=C2=
=A0

I know that more complex hardware and use-cases might still require the
kernel driver for this HW to give up and shoot all contexts active at
the time of the GPU reset, but that's the price you pay for the
hardware being more capable. I don't see why we should also pay that
price on really simple HW.

> The second problem is that the dma_fence semantics don't allow to ever=
=20
> transit the state of a fence from signaled back to unsignaled. This=20
> means that you can't re-use the hw fence and need to allocate a new one,=
=20
> but since memory allocation is forbidden inside a reset handler as well=
=20
> (YES we need to better document that part) you actually need to keep a=
=20
> bunch of hw fences pre-allocated around to make this work. Amdgpu choose=
=20
> to illegally re-use the hw fence instead which only works with quite=20
> extreme hacks.
>=20
I'm with Boris here. Could you please explain when a fence would be
already signaled in a GPU reset scenario and would need to go back to
unsignaled, so we are on the same page here?

Also the no memory allocation policy really needs some documentation.
Currently etnaviv may allocate a bunch of memory to create the
devcoredump before resetting the GPU and I don't believe etnaviv is the
only driver doing such a thing. The allocations are set up in a way to
just give up if there is memory pressure, as getting the GPU back in
working order is obviously more important than writing GPU state data
for post mortem analysis, but I also don't see where else this
allocation could be done.

> The third problem is that the lifetime of the job object was actually=20
> defined very well before we tried to use re-submission. Basically it's=
=20
> just an intermediate state used between the IOCTL and pushing things to=
=20
> the hw, introducing this re-submit feature completely messed that up and=
=20
> cause quite a number of use after free errors in the past which are=20
> again only solved by quite some hacks.
>=20
Isn't it still well-defined? The job object lives until it's parent
fence signaled. Pulling a unsignaled parent fence and attaching a new
one is not a problem.

Regards,
Lucas

> What we should do in the GPU scheduler instead is the follow:
>=20
> 1. Don't support re-submission at all!
>  =C2=A0=C2=A0=C2=A0 Instead we can provide help to drivers to query which=
 fences=20
> (scheduler or hw) are still not signaled yet.
>  =C2=A0=C2=A0=C2=A0 This can then be used to re-create hw state if (and o=
nly if!) the=20
> driver knows what it's doing and can actually guarantee that this will wo=
rk.
>  =C2=A0=C2=A0=C2=A0 E.g. the case for XE where the kernel driver knows th=
e contexts=20
> which were not running at the time and can re-create their queues.
>=20
> 2. We can provide both a wq to use for single threaded application as=20
> well as start/stop semantics.
>  =C2=A0=C2=A0=C2=A0 It's just that the start/stop semantics should never =
touch what was=20
> already submitted, but rather just make sure that we don't get any new=
=20
> submissions.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Regards,
> >=20
> > Boris
>=20

