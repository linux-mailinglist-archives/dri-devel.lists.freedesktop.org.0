Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C6B439A2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11B010E9C2;
	Thu,  4 Sep 2025 11:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cnQTmwcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B42910E9C2;
 Thu,  4 Sep 2025 11:12:18 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHcJG2tj1z9tfj;
 Thu,  4 Sep 2025 13:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756984334; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgFBwRT9dIgvy3AOVDN4aP5Af2uJGAVza9uOG2VbXEY=;
 b=cnQTmwcdlWm+TBO80LPk6LJaHAodVcEWyFx+5bX7lkb23KmvvO5aE1iHSW06b5/6E+NoVv
 aslS3RmQQB0iIqfKs68jR8wtZCN8PKLk5q/GwYKvjCGy0oWOGyovTTtqbwIO+uJqfAV49t
 7AA7S8u9T3/cF8Sdym5iN7Q/sEVixnXpETjn7qj9PJgrdEo/YFpIJsU8B7Rvo9rjd1XLdS
 iQWbUunYm5vC5IZpEnujZah1GVgVbw1zSGoDhLpfclkxw7fi/kcjZ0Ccw71TSrM/+9EUX7
 +hu9zHv4JMvjUKblgATraio0dcBFt6rdLIvZOYBO0kcLyzHB/QsneTfY5EoTBA==
Message-ID: <b35506de99be38f560709660b10667ca9f386181.camel@mailbox.org>
Subject: Re: [PATCH v2] Revert "drm/nouveau: Remove waitque for sched teardown"
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 04 Sep 2025 13:12:10 +0200
In-Reply-To: <3407fd9d-68e0-4c45-9761-98ede450bb25@amd.com>
References: <20250901083107.10206-2-phasta@kernel.org>
 <3407fd9d-68e0-4c45-9761-98ede450bb25@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: a4ascgdpn1w3bydypredr54rs7bd1c3w
X-MBO-RS-ID: 90a219ffd1067569ea5
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

On Thu, 2025-09-04 at 12:27 +0200, Christian K=C3=B6nig wrote:
> On 01.09.25 10:31, Philipp Stanner wrote:
> > This reverts:
> >=20
> > commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> > commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teard=
own")
> >=20
> > from the drm/sched teardown leak fix series:
> >=20
> > https://lore.kernel.org/dri-devel/20250710125412.128476-2-phasta@kernel=
.org/
> >=20
> > The aforementioned series removed a blocking waitqueue from
> > nouveau_sched_fini(). It was mistakenly assumed that this waitqueue onl=
y
> > prevents jobs from leaking, which the series fixed.
> >=20
> > The waitqueue, however, also guarantees that all VM_BIND related jobs
> > are finished in order, cleaning up mappings in the GPU's MMU. These job=
s
> > must be executed sequentially. Without the waitqueue, this is no longer
> > guaranteed, because entity and scheduler teardown can race with each
> > other.
>=20
> That sounds like exactly the kind of issues I tried to catch with the rec=
ent dma_fence changes.

Link? :)

>=20
> Going to keep working on that and potentially using this here as blueprin=
t for something it should catch.

This is more like a nouveau-specific issue. The problem is that
unmapping mappings in the GPU's MMU must be done in a specific order,
and all the unmappings must be performed, not canceled.

For EXEC jobs, it's perfectly fine to cancel pending jobs, remove the
waitqueue and just rush through drm_sched_fini().

I don't know the issue you're describing, but I don't think a feature
in dma_fence could help with that specific Nouveau problem. dma_fence
can't force the driver to submit jobs in a specific order or to wait
until they're all completed.

Gr=C3=BC=C3=9Fe
P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Revert all patches related to the waitqueue removal.
> >=20
> > Fixes: bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Changes in v2:
> > =C2=A0 - Don't revert commit 89b2675198ab ("drm/nouveau: Make fence con=
tainer helper usable driver-wide")
> > =C2=A0 - Add Fixes-tag
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 15 -----------
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.h |=C2=A0 1 -
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c | 35 ++++++++++----------=
-----
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.h |=C2=A0 9 ++++---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c=C2=A0 |=C2=A0 8 +++---
> > =C2=A05 files changed, 24 insertions(+), 44 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/=
nouveau/nouveau_fence.c
> > index 9f345a008717..869d4335c0f4 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -240,21 +240,6 @@ nouveau_fence_emit(struct nouveau_fence *fence)
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > -void
> > -nouveau_fence_cancel(struct nouveau_fence *fence)
> > -{
> > -	struct nouveau_fence_chan *fctx =3D nouveau_fctx(fence);
> > -	unsigned long flags;
> > -
> > -	spin_lock_irqsave(&fctx->lock, flags);
> > -	if (!dma_fence_is_signaled_locked(&fence->base)) {
> > -		dma_fence_set_error(&fence->base, -ECANCELED);
> > -		if (nouveau_fence_signal(fence))
> > -			nvif_event_block(&fctx->event);
> > -	}
> > -	spin_unlock_irqrestore(&fctx->lock, flags);
> > -}
> > -
> > =C2=A0bool
> > =C2=A0nouveau_fence_done(struct nouveau_fence *fence)
> > =C2=A0{
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/=
nouveau/nouveau_fence.h
> > index 9957a919bd38..183dd43ecfff 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > @@ -29,7 +29,6 @@ void nouveau_fence_unref(struct nouveau_fence **);
> > =C2=A0
> > =C2=A0int=C2=A0 nouveau_fence_emit(struct nouveau_fence *);
> > =C2=A0bool nouveau_fence_done(struct nouveau_fence *);
> > -void nouveau_fence_cancel(struct nouveau_fence *fence);
> > =C2=A0int=C2=A0 nouveau_fence_wait(struct nouveau_fence *, bool lazy, b=
ool intr);
> > =C2=A0int=C2=A0 nouveau_fence_sync(struct nouveau_bo *, struct nouveau_=
channel *, bool exclusive, bool intr);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/=
nouveau/nouveau_sched.c
> > index 0cc0bc9f9952..e60f7892f5ce 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -11,7 +11,6 @@
> > =C2=A0#include "nouveau_exec.h"
> > =C2=A0#include "nouveau_abi16.h"
> > =C2=A0#include "nouveau_sched.h"
> > -#include "nouveau_chan.h"
> > =C2=A0
> > =C2=A0#define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
> > =C2=A0
> > @@ -122,9 +121,11 @@ nouveau_job_done(struct nouveau_job *job)
> > =C2=A0{
> > =C2=A0	struct nouveau_sched *sched =3D job->sched;
> > =C2=A0
> > -	spin_lock(&sched->job_list.lock);
> > +	spin_lock(&sched->job.list.lock);
> > =C2=A0	list_del(&job->entry);
> > -	spin_unlock(&sched->job_list.lock);
> > +	spin_unlock(&sched->job.list.lock);
> > +
> > +	wake_up(&sched->job.wq);
> > =C2=A0}
> > =C2=A0
> > =C2=A0void
> > @@ -305,9 +306,9 @@ nouveau_job_submit(struct nouveau_job *job)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/* Submit was successful; add the job to the schedulers job list=
. */
> > -	spin_lock(&sched->job_list.lock);
> > -	list_add(&job->entry, &sched->job_list.head);
> > -	spin_unlock(&sched->job_list.lock);
> > +	spin_lock(&sched->job.list.lock);
> > +	list_add(&job->entry, &sched->job.list.head);
> > +	spin_unlock(&sched->job.list.lock);
> > =C2=A0
> > =C2=A0	drm_sched_job_arm(&job->base);
> > =C2=A0	job->done_fence =3D dma_fence_get(&job->base.s_fence->finished);
> > @@ -392,23 +393,10 @@ nouveau_sched_free_job(struct drm_sched_job *sche=
d_job)
> > =C2=A0	nouveau_job_fini(job);
> > =C2=A0}
> > =C2=A0
> > -static void
> > -nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
> > -{
> > -	struct nouveau_fence *fence;
> > -	struct nouveau_job *job;
> > -
> > -	job =3D to_nouveau_job(sched_job);
> > -	fence =3D to_nouveau_fence(job->done_fence);
> > -
> > -	nouveau_fence_cancel(fence);
> > -}
> > -
> > =C2=A0static const struct drm_sched_backend_ops nouveau_sched_ops =3D {
> > =C2=A0	.run_job =3D nouveau_sched_run_job,
> > =C2=A0	.timedout_job =3D nouveau_sched_timedout_job,
> > =C2=A0	.free_job =3D nouveau_sched_free_job,
> > -	.cancel_job =3D nouveau_sched_cancel_job,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static int
> > @@ -458,8 +446,9 @@ nouveau_sched_init(struct nouveau_sched *sched, str=
uct nouveau_drm *drm,
> > =C2=A0		goto fail_sched;
> > =C2=A0
> > =C2=A0	mutex_init(&sched->mutex);
> > -	spin_lock_init(&sched->job_list.lock);
> > -	INIT_LIST_HEAD(&sched->job_list.head);
> > +	spin_lock_init(&sched->job.list.lock);
> > +	INIT_LIST_HEAD(&sched->job.list.head);
> > +	init_waitqueue_head(&sched->job.wq);
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0
> > @@ -493,12 +482,16 @@ nouveau_sched_create(struct nouveau_sched **psche=
d, struct nouveau_drm *drm,
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +
> > =C2=A0static void
> > =C2=A0nouveau_sched_fini(struct nouveau_sched *sched)
> > =C2=A0{
> > =C2=A0	struct drm_gpu_scheduler *drm_sched =3D &sched->base;
> > =C2=A0	struct drm_sched_entity *entity =3D &sched->entity;
> > =C2=A0
> > +	rmb(); /* for list_empty to work without lock */
> > +	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
> > +
> > =C2=A0	drm_sched_entity_fini(entity);
> > =C2=A0	drm_sched_fini(drm_sched);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/=
nouveau/nouveau_sched.h
> > index b98c3f0bef30..20cd1da8db73 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > @@ -103,9 +103,12 @@ struct nouveau_sched {
> > =C2=A0	struct mutex mutex;
> > =C2=A0
> > =C2=A0	struct {
> > -		struct list_head head;
> > -		spinlock_t lock;
> > -	} job_list;
> > +		struct {
> > +			struct list_head head;
> > +			spinlock_t lock;
> > +		} list;
> > +		struct wait_queue_head wq;
> > +	} job;
> > =C2=A0};
> > =C2=A0
> > =C2=A0int nouveau_sched_create(struct nouveau_sched **psched, struct no=
uveau_drm *drm,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.c
> > index d94a85509176..79eefdfd08a2 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job,=
 u64 addr, u64 range)
> > =C2=A0	u64 end =3D addr + range;
> > =C2=A0
> > =C2=A0again:
> > -	spin_lock(&sched->job_list.lock);
> > -	list_for_each_entry(__job, &sched->job_list.head, entry) {
> > +	spin_lock(&sched->job.list.lock);
> > +	list_for_each_entry(__job, &sched->job.list.head, entry) {
> > =C2=A0		struct nouveau_uvmm_bind_job *bind_job =3D to_uvmm_bind_job(__j=
ob);
> > =C2=A0
> > =C2=A0		list_for_each_op(op, &bind_job->ops) {
> > @@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job,=
 u64 addr, u64 range)
> > =C2=A0
> > =C2=A0				if (!(end <=3D op_addr || addr >=3D op_end)) {
> > =C2=A0					nouveau_uvmm_bind_job_get(bind_job);
> > -					spin_unlock(&sched->job_list.lock);
> > +					spin_unlock(&sched->job.list.lock);
> > =C2=A0					wait_for_completion(&bind_job->complete);
> > =C2=A0					nouveau_uvmm_bind_job_put(bind_job);
> > =C2=A0					goto again;
> > @@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job,=
 u64 addr, u64 range)
> > =C2=A0			}
> > =C2=A0		}
> > =C2=A0	}
> > -	spin_unlock(&sched->job_list.lock);
> > +	spin_unlock(&sched->job.list.lock);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int
>=20

