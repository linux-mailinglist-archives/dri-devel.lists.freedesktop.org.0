Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1556F58B5
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 15:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042D310E2C3;
	Wed,  3 May 2023 13:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CED10E2C2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 13:11:02 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1puCFv-0004Ff-4J; Wed, 03 May 2023 15:10:51 +0200
Message-ID: <cfd433ef31f172a15876970ed9d72ff3ed10813f.camel@pengutronix.de>
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Boris
 Brezillon <boris.brezillon@collabora.com>
Date: Wed, 03 May 2023 15:10:49 +0200
In-Reply-To: <420b8443-912e-b942-fadf-f80b57998014@amd.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
 <2ff0d221ed6033bd03c30fdd25abd2a41fb06fb2.camel@pengutronix.de>
 <420b8443-912e-b942-fadf-f80b57998014@amd.com>
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

Am Mittwoch, dem 03.05.2023 um 13:40 +0200 schrieb Christian K=C3=B6nig:
> Hi Lucas,
>=20
> Am 03.05.23 um 12:28 schrieb Lucas Stach:
> > Hi Christian,
> >=20
> > Am Mittwoch, dem 03.05.2023 um 10:47 +0200 schrieb Christian K=C3=B6nig=
:
> > > Adding Luben as well.
> > >=20
> > > Am 03.05.23 um 10:16 schrieb Boris Brezillon:
> > > > [SNIP]
> > > > > To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}=
().
> > > > After the discussion I had with Matthew yesterday on IRC, I
> > > > realized there was no clear agreement on this. Matthew uses those 3
> > > > helpers in the Xe driver right now, and given he intends to use a
> > > > multi-threaded wq for its 1:1 schedulers run queue, there's no way =
he
> > > > can get away without calling drm_sched_{start,stop}().
> > > > drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
> > > > wondering if it wouldn't be preferable to add a ::resubmit_job() me=
thod
> > > > or extend the ::run_job() one to support the resubmit semantics, wh=
ich,
> > > > AFAIU, is just about enforcing the job done fence (the one returned=
 by
> > > > ::run_job()) doesn't transition from a signaled to an unsignaled st=
ate.
> > > >=20
> > > > But probably more important than providing a generic helper, we sho=
uld
> > > > document the resubmit semantics (AKA, what should and/or shouldn't =
be
> > > > done with pending jobs when a recovery happens). Because forbidding
> > > > people to use a generic helper function doesn't give any guarantee =
that
> > > > they'll do the right thing when coding their own logic, unless we g=
ive
> > > > clues about what's considered right/wrong, and the current state of=
 the
> > > > doc is pretty unclear in this regard.
> > > I should probably talk about the history of the re-submit feature a b=
it
> > > more.
> > >=20
> > > Basically AMD came up with re-submission as a cheap way of increasing
> > > the reliability of GPU resets. Problem is that it turned into an
> > > absolutely nightmare. We tried for the last 5 years or so to get that
> > > stable and it's still crashing.
> > >=20
> > > The first and most major problem is that the kernel doesn't even has =
the
> > > information if re-submitting jobs is possible or not. For example a j=
ob
> > > which has already been pushed to the hw could have grabbed a binary
> > > semaphore and re-submitting it will just wait forever for the semapho=
re
> > > to be released.
> > >=20
> > I can follow this argument, but concluding that job resubmission is
> > impossible is punishing simple GPUs. On Vivante GPUs we have exactly
> > one job running at a time and all dependencies are visible to the
> > scheduler, as we don't have/use any hardware synchronization mechanism,
> > so all synchronization is piped through kernel visible fences.
> >=20
> > It's reasonably easy for the etnaviv driver to find the guilty job to
> > skip but resubmit all other jobs in the current hardware queue. I'm not
> > really fond of having to make all applications deal with innocent
> > context resets, while we can solve this via resubmission on simple HW.
> >=20
> > I know that more complex hardware and use-cases might still require the
> > kernel driver for this HW to give up and shoot all contexts active at
> > the time of the GPU reset, but that's the price you pay for the
> > hardware being more capable. I don't see why we should also pay that
> > price on really simple HW.
>=20
> You can still re-create the hw state inside your driver to continue work=
=20
> from some point if know that this will work.
>=20
> As I wrote below the scheduler component can even provide help with with=
=20
> that in the form of providing all the unsignaled hw or scheduler fences=
=20
> for example.
>=20
> But what we absolutely should *not* do is to have this re-submission=20
> feature, because that requires re-using the dma_fence objects. In other=
=20
> words this dance with detaching the scheduler fence from the hw fence=20
> and attach a new one is what absolutely doesn't work.
>=20
> > > The second problem is that the dma_fence semantics don't allow to eve=
r
> > > transit the state of a fence from signaled back to unsignaled. This
> > > means that you can't re-use the hw fence and need to allocate a new o=
ne,
> > > but since memory allocation is forbidden inside a reset handler as we=
ll
> > > (YES we need to better document that part) you actually need to keep =
a
> > > bunch of hw fences pre-allocated around to make this work. Amdgpu cho=
ose
> > > to illegally re-use the hw fence instead which only works with quite
> > > extreme hacks.
> > >=20
> > I'm with Boris here. Could you please explain when a fence would be
> > already signaled in a GPU reset scenario and would need to go back to
> > unsignaled, so we are on the same page here?
>=20
> Take a look at how this re-submission feature of the scheduler works.=20
> The approach is basically that you detach the hw fence from the=20
> scheduler fence and then attach a new one.
>=20
Right, but this shouldn't be a problem, as long as the old fence isn't
signaled yet, right? It becomes a problem when the GPU reset and fence
signaling are racing each other, due to insufficient hardware/software
state synchronization.

I'm sure that the necessary synchronization can be hard to get right,
but it's not the act of switching one unsignaled fence to a new one or
reusing the old unsignaled fence that's causing problems, but the
complications of making sure that old fences don't signal after the
timeout detection, right?

To be clear: I'm not asking those questions because I think I know any
better, but because I'm actually not sure and would like to understand
your line of thought and background information when you say "this
dance with detaching the scheduler fence from the hw fence and attach a
new one is what absolutely doesn't work" above.

Driver writers need to understand the limitations of the current
resubmission scheduler code to do better in their driver
implementation, otherwise we just end up with (worse) open-coded
variations of that code in each driver.

Regards,
Lucas
