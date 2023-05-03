Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74496F5533
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 11:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE9910E030;
	Wed,  3 May 2023 09:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DCC10E030
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 09:49:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B442C66056CE;
 Wed,  3 May 2023 10:49:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683107371;
 bh=7VIjyuWzXiJWg90ZojWHhBuKxhpApW+cCqW1NmwccYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E1qe25nYPv9M+mCQ0FH9LHwMadZHTvUIQWXBMXKo3ngMFH/cNHpvbcQCeOK/BQ07F
 vMMNfCm1zET21kHSZfql7nvuw6GA7dQxBMo4q/vr/fU5IWgfrZhIhfnSUnD+etM0Zj
 SRV8U9jsyHgAy/K77K6G0i6NIFgkkujS7XA/a4y5LNd83evhzWrhTAQNiLRsc/a0Z9
 bnuFP1h7EysUVgpRtEjSydEWuJkPC+W/fT49i7pVju2mILokxi/dqmfOdW+Z9eTXTN
 9tRP4PbMBad7bwl7laO4qmUgD8kmlLWzPBWl/tmswO9wSZZuoMczonYk3lGeaZ/tZj
 ZSXESJDdcmtbw==
Date: Wed, 3 May 2023 11:49:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Message-ID: <20230503114927.62114875@collabora.com>
In-Reply-To: <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 May 2023 10:47:43 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Adding Luben as well.
>=20
> Am 03.05.23 um 10:16 schrieb Boris Brezillon:
> > [SNIP] =20
> >> To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}(). =
=20
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
> >
> > But probably more important than providing a generic helper, we should
> > document the resubmit semantics (AKA, what should and/or shouldn't be
> > done with pending jobs when a recovery happens). Because forbidding
> > people to use a generic helper function doesn't give any guarantee that
> > they'll do the right thing when coding their own logic, unless we give
> > clues about what's considered right/wrong, and the current state of the
> > doc is pretty unclear in this regard. =20
>=20
> I should probably talk about the history of the re-submit feature a bit=20
> more.
>=20
> Basically AMD came up with re-submission as a cheap way of increasing=20
> the reliability of GPU resets. Problem is that it turned into an=20
> absolutely nightmare. We tried for the last 5 years or so to get that=20
> stable and it's still crashing.
>=20
> The first and most major problem is that the kernel doesn't even has the=
=20
> information if re-submitting jobs is possible or not. For example a job=20
> which has already been pushed to the hw could have grabbed a binary=20
> semaphore and re-submitting it will just wait forever for the semaphore=20
> to be released.

That's a valid point. Definitely something worth pointing out in the
doc IMHO.

>=20
> The second problem is that the dma_fence semantics don't allow to ever=20
> transit the state of a fence from signaled back to unsignaled. This=20
> means that you can't re-use the hw fence and need to allocate a new one,=
=20
> but since memory allocation is forbidden inside a reset handler as well=20
> (YES we need to better document that part) you actually need to keep a=20
> bunch of hw fences pre-allocated around to make this work. Amdgpu choose=
=20
> to illegally re-use the hw fence instead which only works with quite=20
> extreme hacks.

Hm, maybe I'm missing something, but I don't really see why we'd ever go
from signaled to unsignaled in the first place. If the parent fence is
signaled by the time we reach the resubmit function (because the GPU
keeps executing stuff after we called drm_sched_stop() and before we
actually shut it down), the ::run_job() hook would just return a
signaled fence at re-submission time, and the actual re-submission can
be skipped. If the job hasn't finished before the reset, the fence
should still be unsignaled, so no unsignaled -> signaled state
transition AFAICT.

>=20
> The third problem is that the lifetime of the job object was actually=20
> defined very well before we tried to use re-submission. Basically it's=20
> just an intermediate state used between the IOCTL and pushing things to=20
> the hw, introducing this re-submit feature completely messed that up and=
=20
> cause quite a number of use after free errors in the past which are=20
> again only solved by quite some hacks.

It's not clear to me what the resubmit logic has to do with that,
but I trust you.

>=20
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

Okay, that basically means any queue that had in-flight jobs at
recovery time becomes unusable after that point, because skipping one
job might put you in an inconsistent state.

>=20
> 2. We can provide both a wq to use for single threaded application as=20
> well as start/stop semantics.

There's no risk calling stop+start even in the single-threaded wq
case, and the overhead should be negligible. If we want to keep things
simple, let's just say drivers should always call those :-).

>  =C2=A0=C2=A0=C2=A0 It's just that the start/stop semantics should never =
touch what was=20
> already submitted, but rather just make sure that we don't get any new=20
> submissions.

So, something like that:

1. Call drm_sched_stop()
2. Iterate over all pending jobs, and flag the entity as dirty and/or
   kill it if any of the jobs were unfinished when the GPU was reset
3. Call drm_sched_start()
