Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C3D1ED3E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E5510E128;
	Wed, 14 Jan 2026 12:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Dm2TZgAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB3C10E128
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:40:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4drm1F5T3Cz9v3Z;
 Wed, 14 Jan 2026 13:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1768394434; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYwk5I7lCjtpTJxINlVPUjkdn63pKMy0eMV22ROGxik=;
 b=Dm2TZgAR7SeAtIzgfB4iUY8y+nae71U4SBJLnH4xKBERkjFeAOQ4Vbbh8cw4dAjtdIotE2
 pOk82rr3hoT9fx9YP1lHVY2YqsSca0+hHU4umkuTbpILHEu1IAHzMKrR2eqXCmI53hIYfr
 +TzXAyV+VSJEJtjTkiS5rCWl2oSMtkcfl899ctRCxN+EQX2nuD1Rs54GluqxHmDKK/gHhy
 hqVUqmtmUtPiP5fQhy/rfIi3lYcpr/p/ZPkk1FUbZzkx+UmiUTB5U6Tgg1IqZK3mQwczrm
 hqQJfXFIRZFpsQteyldJs3an+dC3DdV/Lo+I0ibDBzjNCRfCvY6Fs/GdP34eOQ==
Message-ID: <6afa04f1f5f0908216e9b2bdca26cdd5954ddf69.camel@mailbox.org>
Subject: Re: [PATCH 10/10] drm/sched: use inline locks for the
 drm-sched-fence v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, tursulin@ursulin.net, matthew.brost@intel.com, 
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 14 Jan 2026 13:40:28 +0100
In-Reply-To: <b9c8ec64-ed96-4eaf-9e30-a98dfdd26b5a@gmail.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-11-christian.koenig@amd.com>
 <c8c362d73d4f2cff9be685184186a6f3368939f1.camel@mailbox.org>
 <b9c8ec64-ed96-4eaf-9e30-a98dfdd26b5a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 19447328edda3a80dec
X-MBO-RS-META: uoerzmctcnsz5dy4t6i8okrcdaps8uxf
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

On Wed, 2026-01-14 at 12:30 +0100, Christian K=C3=B6nig wrote:
> On 1/13/26 17:12, Philipp Stanner wrote:
> > On Tue, 2026-01-13 at 16:16 +0100, Christian K=C3=B6nig wrote:
> > > Using the inline lock is now the recommended way for dma_fence implem=
entations.
> > >=20
> > > For the scheduler fence use the inline lock for the scheduled fence p=
art
> > > and then the lock from the scheduled fence as external lock for the f=
inished fence.
> > >=20
> > > This way there is no functional difference, except for saving the spa=
ce
> > > for the separate lock.
> > >=20
> > > v2: re-work the patch to avoid any functional difference
> >=20
> > *cough cough*
> >=20
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_fence.c | 6 +++---
> > > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ----
> > > =C2=A02 files changed, 3 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/dr=
m/scheduler/sched_fence.c
> > > index 724d77694246..112677231f9a 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(str=
uct drm_sched_entity *entity,
> > > =C2=A0
> > > =C2=A0	fence->owner =3D owner;
> > > =C2=A0	fence->drm_client_id =3D drm_client_id;
> > > -	spin_lock_init(&fence->lock);
> > > =C2=A0
> > > =C2=A0	return fence;
> > > =C2=A0}
> > > @@ -230,9 +229,10 @@ void drm_sched_fence_init(struct drm_sched_fence=
 *fence,
> > > =C2=A0	fence->sched =3D entity->rq->sched;
> > > =C2=A0	seq =3D atomic_inc_return(&entity->fence_seq);
> > > =C2=A0	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_schedul=
ed,
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_c=
ontext, seq);
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, entity->fence_context, =
seq);
> > > =C2=A0	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished=
,
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_c=
ontext + 1, seq);
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_spinlock(&fence->sc=
heduled),
> >=20
> > I think while you are correct that this is no functional difference, it
> > is still a bad idea which violates the entire idea of your series:
> >=20
> > All fences are now independent from each other and the fence context =
=E2=80=93
> > except for those two.
> >=20
> > Some fences are more equal than others ;)
>=20
> Yeah, I was going back and forth once more if I should keep this patch at=
 all or just drop it.
>=20
> > By implementing this, you would also show to people browsing the code
> > that it can be a good idea or can be done to have fences share locks.
> > Do you want that?
>=20
> Good question. For almost all cases we don't want this, but once more the=
 scheduler is special.
>=20
> In the scheduler we have two fences in one, the scheduled one and the fin=
ished one.
>=20
> So here it technically makes sense to have this construct to be defensive=
.
>=20
> But on the other hand it has no practical value because it still doesn't =
allow us to unload the scheduler module. We would need a much wider rework =
for being able to do that.
>=20
> So maybe I should just really drop this patch or at least keep it back un=
til we had time to figure out what the next steps are.
>=20
> > As far as I have learned from you and our discussions, that would be a
> > very bombastic violation of the sacred "dma-fence-rules".
>=20
> Well using the inline fence is "only" a strong recommendation. It's not a=
s heavy as the signaling rules because when you mess up those you can easil=
y kill the whole system.
>=20
> > I believe it's definitely worth sacrificing some bytes so that those
> > two fences get fully decoupled. Who will have it on their radar that
> > they are special? Think about future reworks.
>=20
> This doesn't even save any bytes, my thinking was more that this is the m=
ore defensive approach should anybody use the spinlock pointer from the sch=
eduler fence to do some locking.
>=20

Using the scheduler's internal locks is not legal (anymore). With the
sched_fence it's a bit special though because that is the
synchronization object for the driver, actually. So I don't know
either.

I would say either separate the locks, or drop the patch as you
suggest.


P.

> > Besides that, no objections from my side.
>=20
> Thanks,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->fence_context + 1, se=
q);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0module_init(drm_sched_fence_slab_init);
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index 78e07c2507c7..ad3704685163 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -297,10 +297,6 @@ struct drm_sched_fence {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * belongs to.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0	struct drm_gpu_scheduler	*sched;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @lock: the lock u=
sed by the scheduled and the finished fences.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > -	spinlock_t			lock;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @owner: job =
owner for debugging
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >=20
>=20

