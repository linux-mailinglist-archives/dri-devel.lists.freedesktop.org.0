Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DFDB3F819
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DACE10E5D4;
	Tue,  2 Sep 2025 08:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rwpOpVzw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6955A10E5D6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:18:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cGJXf0519z9sJ2;
 Tue,  2 Sep 2025 10:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756801106; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6rP7L8rf7rviHy/ptheSNv1+SKNEK1+PoNnzmFAEeY=;
 b=rwpOpVzwWkdh1DCkPE+bDeXSoO53jiGDALVPkVO9meitqvsPoXravDdFwE8EtySO73aHKs
 00+iPOxduJxFC5tGyXE0nCa3IqAxmkuMtp7YklfuLEwRMKZGa8aQUF/flRC8W+0E7yjv2z
 S6/K4DJHcUUKTTb8Bu2rTdVZMg8i5B2+mZhSVUtzSITNvckCfLVPpNoUF3uxTq/X6Qz5b+
 WVmilTup8WbuKI7J3h88kCBuTIOQDiLrOCqqdEpzlQjRtJwuP1y570rGUhXhclpyk1QHy5
 Wy8DzE1dhOZGC91llCcXJROzcx2SSZ8fuuaLPFKzJXrS134nNdEl0GvKvJ8CQA==
Message-ID: <22e70ef7472310ad5147f934044a7ba0e02e02d6.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Fix racy access to
 drm_sched_entity.dependency
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 02 Sep 2025 10:18:21 +0200
In-Reply-To: <b9f7a493-5611-4450-a26a-10b03d1dc313@igalia.com>
References: <20250901124032.1955-1-pierre-eric.pelloux-prayer@amd.com>
 <da59f28c7d8b3d83833aa0494b3b198335cf588f.camel@mailbox.org>
 <b9f7a493-5611-4450-a26a-10b03d1dc313@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1e7d9be332138bc4b68
X-MBO-RS-META: shmzb1xi8nq9so5g49yijb78o1tf98bc
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

On Tue, 2025-09-02 at 08:59 +0100, Tvrtko Ursulin wrote:
>=20
> On 02/09/2025 08:27, Philipp Stanner wrote:
> > On Mon, 2025-09-01 at 14:40 +0200, Pierre-Eric Pelloux-Prayer wrote:
> > > The drm_sched_job_unschedulable trace point can access
> > > entity->dependency after it was cleared by the callback
> > > installed in drm_sched_entity_add_dependency_cb, causing:
> > >=20
> > > BUG: kernel NULL pointer dereference, address: 0000000000000020
> > > [...]
> > > Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
> > > RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/0xd0=
 [gpu_sched]
> > >=20
> > > To fix this we either need to keep a reference to the fence before
> > > setting up the callbacks, or move the trace_drm_sched_job_unschedulab=
le
> > > calls into drm_sched_entity_add_dependency_cb where they can be
> > > done earlier.
> > >=20
> > > Fixes: 76d97c870f29 ("drm/sched: Trace dependencies for GPU jobs")
> > >=20
> > > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >=20
> > Applied to drm-misc-next
>=20
> Shouldn't it have been drm-misc-fixes?

I considered that, but thought not: the fixed commit is only in this rc
(v6.17), and in this case the committer guidelines say it should go to
misc-next:

https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-=
misc.html

Same reason we don't need to +Cc stable.

But correct me if I made a mistake.

P.


>=20
> Regards,
>=20
> Tvrtko
>=20
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++----
> > > =C2=A0=C2=A01 file changed, 7 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index 8867b95ab089..3d06f72531ba 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -391,7 +391,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> > > =C2=A0=C2=A0 * Add a callback to the current dependency of the entity=
 to wake up the
> > > =C2=A0=C2=A0 * scheduler when the entity becomes available.
> > > =C2=A0=C2=A0 */
> > > -static bool drm_sched_entity_add_dependency_cb(struct drm_sched_enti=
ty *entity)
> > > +static bool drm_sched_entity_add_dependency_cb(struct drm_sched_enti=
ty *entity,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job *sche=
d_job)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> > > =C2=A0=C2=A0	struct dma_fence *fence =3D entity->dependency;
> > > @@ -421,6 +422,10 @@ static bool drm_sched_entity_add_dependency_cb(s=
truct drm_sched_entity *entity)
> > > =C2=A0=C2=A0		entity->dependency =3D fence;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > +	if (trace_drm_sched_job_unschedulable_enabled() &&
> > > +	=C2=A0=C2=A0=C2=A0 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &entity->=
dependency->flags))
> > > +		trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
> > > +
> > > =C2=A0=C2=A0	if (!dma_fence_add_callback(entity->dependency, &entity-=
>cb,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 drm_sched_entity_wakeup))
> > > =C2=A0=C2=A0		return true;
> > > @@ -461,10 +466,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(s=
truct drm_sched_entity *entity)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	while ((entity->dependency =3D
> > > =C2=A0=C2=A0			drm_sched_job_dependency(sched_job, entity))) {
> > > -		if (drm_sched_entity_add_dependency_cb(entity)) {
> > > -			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
> > > +		if (drm_sched_entity_add_dependency_cb(entity, sched_job))
> > > =C2=A0=C2=A0			return NULL;
> > > -		}
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* skip jobs from entity that marked guilty */
> >=20
>=20

