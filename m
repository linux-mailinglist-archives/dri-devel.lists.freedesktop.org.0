Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29839B33C0F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 11:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B58310E24B;
	Mon, 25 Aug 2025 09:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="v99IffJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EB510E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:59:40 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c9R956NFTz9ttv;
 Mon, 25 Aug 2025 11:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756115977; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJrsYOAjBc+eqWfEB5DjkVBoHupgCiPZuDEsfAygBwA=;
 b=v99IffJKR4yyNfPDa3U9IG+FNIUecHGkTHyG/gJDQTah6Ao1tplrfW02K/G1A8VwvjYETT
 Rs99Rl2IwrVArQ+uzRnQPZsQtO6LBdjOPSBSsXFWoPRihn6mwfbLKwIfjw9e7LANwdobbL
 1h70+lvIj+3WIT93w4T82g8dOPMKzwguNVIlr/yjgLcDByUAIPQomERbxo8AoRH2UQ9g8W
 3bKNqp7GmPS9o+ILsqko/Y55U8umbrjL5MPN2YfxOOI5IJ/c/vRw19ACHhva4gLjTJ1LFn
 FGivVNfmSnP3QO6hXaKeMZHU/UzuPTjnbhxcR24POadMdLb0w86vnlpzqj995g==
Message-ID: <6097374385ec38e1f2ba8a7ce40db51ad97e36db.camel@mailbox.org>
Subject: Re: [PATCH v1] drm/sched: Fix racy access to
 drm_sched_entity.dependency
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Date: Mon, 25 Aug 2025 11:59:31 +0200
In-Reply-To: <414070cb-a4d8-4603-a17a-a25a6787034a@damsy.net>
References: <20250625143722.55272-1-pierre-eric.pelloux-prayer@amd.com>
 <1d24d974-cf92-47cc-ab53-5d205ce9945a@igalia.com>
 <53f324f2-a6f7-4cbc-8d37-d4307df703bd@damsy.net>
 <42d6fc40-5095-40b8-9484-b8c744d9daf5@igalia.com>
 <0c6b40e9-e2ec-404e-b0df-e9c324a6f55d@damsy.net>
 <414070cb-a4d8-4603-a17a-a25a6787034a@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: eb90bc50de4c3eb1290
X-MBO-RS-META: 5e47f9g6ieawku1c7ddw9t896ynipczb
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

On Wed, 2025-08-20 at 11:06 +0200, Pierre-Eric Pelloux-Prayer wrote:
>=20
>=20
> Le 21/07/2025 =C3=A0 17:18, Pierre-Eric Pelloux-Prayer a =C3=A9crit=C2=A0=
:
> >=20
> >=20
> > Le 26/06/2025 =C3=A0 16:05, Tvrtko Ursulin a =C3=A9crit=C2=A0:
> > >=20
> > > On 26/06/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
> > > > Hi,
> > > >=20
> > > > Le 26/06/2025 =C3=A0 10:41, Tvrtko Ursulin a =C3=A9crit=C2=A0:
> > > > >=20
> > > > > On 25/06/2025 15:37, Pierre-Eric Pelloux-Prayer wrote:
> > > > > > The drm_sched_job_unschedulable trace point can access
> > > > > > entity->dependency after it was cleared by the callback
> > > > > > installed in drm_sched_entity_add_dependency_cb, causing:
> > > > > >=20
> > > > > > BUG: kernel NULL pointer dereference, address: 0000000000000020
> > > > > > Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
> > > > > > RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x7=
0/0xd0 [gpu_sched]
> > > > > >=20
> > > > > > To fix this we either need to take a reference of the fence bef=
ore
> > > > > > setting up the callbacks, or move the trace_drm_sched_job_unsch=
edulable
> > > > > > calls into drm_sched_entity_add_dependency_cb where they can be
> > > > > > done earlier. The former option is the more correct one because=
 with
> > > > > > the latter we might emit the event and still be able to schedul=
e the
> > > > > > job if the fence is signaled in-between. Despite that, I've
> > > > > > implemented the latter, since it's a bit simpler and the extra =
event
> > > > > > is not a deal breaker for tools anyway.
> > > > > >=20
> > > > > > Fixes: 76d97c870f29 (drm/sched: Trace dependencies for GPU jobs=
)
> > > > > >=20
> > > > > > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-=
 prayer@amd.com>
> > > > > > ---
> > > > > > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++=
++----
> > > > > > =C2=A0 1 file changed, 12 insertions(+), 4 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers=
/gpu/ drm/scheduler/sched_entity.c
> > > > > > index 5635b3a826d8..a23b204cac5c 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > @@ -401,7 +401,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority=
);
> > > > > > =C2=A0=C2=A0 * Add a callback to the current dependency of the =
entity to wake up the
> > > > > > =C2=A0=C2=A0 * scheduler when the entity becomes available.
> > > > > > =C2=A0=C2=A0 */
> > > > > > -static bool drm_sched_entity_add_dependency_cb(struct drm_sche=
d_entity *entity)
> > > > > > +static bool drm_sched_entity_add_dependency_cb(struct drm_sche=
d_entity *entity,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job *sched_job)
> > > > > > =C2=A0 {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpu_scheduler *sched =
=3D entity->rq->sched;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *fence =3D enti=
ty->dependency;
> > > > > > @@ -429,6 +430,11 @@ static bool drm_sched_entity_add_dependenc=
y_cb(struct drm_sched_entity=20
> > > > > > *entity)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence =
=3D dma_fence_get(&s_fence->scheduled);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fenc=
e_put(entity->dependency);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->=
dependency =3D fence;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (trace_drm_sched=
_job_unschedulable_enabled() &&
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 !dma_fence_is_signaled(fence))
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 trace_drm_sched_job_unschedulable(sched_job, fence);
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dma=
_fence_add_callback(fence, &entity->cb,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 drm_sched_entity_clear_dep))
> > > > >=20
> > > > > Would placing it here be simpler, like this:
> > > > >=20
> > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > @@ -430,8 +430,10 @@ static bool drm_sched_entity_add_dependency_=
cb(struct drm_sched_entity=20
> > > > > *entity)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(entity->dependency);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->dependency =3D fence;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dma_fence_add_callback(fence, &entit=
y->cb,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_clear_dep))
> > > > > + drm_sched_entity_clear_dep)) {
> > > >=20
> > > > At this point, the callback has been installed which means it can b=
e called.
> > > > And when it's called it will drop the reference we had of entity- =
=C2=A0>dependency / fence.
> > > >=20
> > > > So unless I'm mistaken, the trace event below might still dereferen=
ce freed memory.
> > >=20
> > > Bah sorry, I got confused.
> > >=20
> > > You just need to fix the formatting of the fixes tag:
> > >=20
> > > 76d97c870f29 ("drm/sched: Trace dependencies for GPU jobs")
> >=20
> > Do I need to send a v2 just to amend the commit message or can it be fi=
xed up by the maintainer=20
> > pushing the patch to the right git tree?
> >=20
> > Pierre-Eric
>=20
> ping?
>=20
> Should this go through drm-misc-fixes as it's a fix for a commit that lan=
ded during this release cycle?

Sry, I was afk a while.

This problem is now already in 6.17-rc2, so the fix must go to drm-
misc-fixes. There is now a merge conflict, I think caused by
15f77764e90a713ee3916ca424757688e4f565b9

Can you rebase on drm-misc-fixes (master should also work) and submit a
v2 with Tvrtko's suggestion for the Fixes: tag?


Thx
P.



>=20
> Thanks,
> Pierre-Eric
>=20
>=20
> >=20
> > >=20
> > > With that:
> > >=20
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >=20
> >=20
> >=20
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > >=20
> > > > Pierre-Eric
> > > >=20
> > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace=
_drm_sched_job_unschedulable(sched_job, fence);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return true;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Ignore it when it is already scheduled=
 */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(fence);
> > > > >=20
> > > > > Both sched_job and fence references are held on this path (effect=
ively for sched_job), so it is=20
> > > > > safe from that point of view. Makes the "is signaled" check not n=
eeded because=20
> > > > > dma_fence_add_callback() told us so. And trace_drm_sched_job_unsc=
hedulable_enabled() is then not=20
> > > > > needed too.
> > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return true;
> > > > > > @@ -438,6 +444,10 @@ static bool drm_sched_entity_add_dependenc=
y_cb(struct drm_sched_entity=20
> > > > > > *entity)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return f=
alse;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > +=C2=A0=C2=A0=C2=A0 if (trace_drm_sched_job_unschedulable_enabl=
ed() &&
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !dma_fence_is_signa=
led(entity->dependency))
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_drm_sched_job=
_unschedulable(sched_job, entity- >dependency);
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dma_fence_add_callback(enti=
ty->dependency, &entity->cb,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_e=
ntity_wakeup))
> > > > >=20
> > > > > For this path the same thing, since entity->dependency reference =
is also held (taken in=20
> > > > > drm_sched_job_dependency() and released two lines below this hunk=
).
> > > > >=20
> > > > > Regards,
> > > > >=20
> > > > > Tvrtko
> > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return t=
rue;
> > > > > > @@ -478,10 +488,8 @@ struct drm_sched_job *drm_sched_entity_pop=
_job(struct drm_sched_entity=20
> > > > > > *entity)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while ((entity->dependency =3D
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 drm_sched_job_dependency(sched_job, entity))) {
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_entit=
y_add_dependency_cb(entity)) {
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 trace_drm_sched_job_unschedulable(sched_job, entity- >dependency);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_entit=
y_add_dependency_cb(entity, sched_job))
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return NULL;
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* skip jobs from entity that ma=
rked guilty */

