Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DCBA3B2C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 08:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41BE10E0BC;
	Wed, 19 Feb 2025 07:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yWnx+iUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1FA10E0BC;
 Wed, 19 Feb 2025 07:47:44 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YyT583prSz9t2V;
 Wed, 19 Feb 2025 08:47:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739951260; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSjaRE288sWV0J4vIY6moqynlNP6KRr+vMOORhpGxe0=;
 b=yWnx+iUTMzwNr0WuU2vhe3D8UNmFX1gzwqL+yrbbrDLeQeql/LE6JQl4+xmiO99Pnhfwi4
 0IF6974dlPXsGdDsMwQy3NemDbIc6G7xnfQiAruWILiQHnH/MRcMtjmS+c2hOYij7qFewL
 KZaAXwTphOxc9PUsDUNkrcNX0UNGsb8MZdQaqc7vk8aebBTPdZh7JTb2Dy7RAbFK6chpSM
 TSxKCl47znOqtQ1VVV1RAWkBNucUp313KI1eE9YhGctSBl+AurUcCTbvz7Xc1DcWVVMe7P
 tVa6Ps3NuhXxzmGvZUp0soL7A0aEiq26tw5qIrv14KWJT8GhXu0v0+Gm7fZqPA==
Message-ID: <7922c25803f54f4723a6f5b55959c37126e2fadb.camel@mailbox.org>
Subject: Re: [PATCH v5 1/6] drm/sched: Add internal job peek/pop API
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>
Date: Wed, 19 Feb 2025 08:47:36 +0100
In-Reply-To: <Z7UG+8nWwOSyILFW@lstrano-desk.jf.intel.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
 <20250214101944.19390-2-tvrtko.ursulin@igalia.com>
 <7244eaa81cfeb6ce959c591c11a97f52f25b5a5d.camel@mailbox.org>
 <0ecf7583-8e7a-45c7-bc4e-5935681effc3@igalia.com>
 <Z7UG+8nWwOSyILFW@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 786d44494bb020f3cc6
X-MBO-RS-META: i8wu47od43ju4ioiqwostiwi49b8gxsx
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

On Tue, 2025-02-18 at 14:17 -0800, Matthew Brost wrote:
> On Tue, Feb 18, 2025 at 06:26:15PM +0000, Tvrtko Ursulin wrote:
> >=20
> > On 18/02/2025 12:26, Philipp Stanner wrote:
> > > Thx for the updated version. Overlooked it, I was out on Friday.
> > > See
> > > below
> > >=20
> > > On Fri, 2025-02-14 at 10:19 +0000, Tvrtko Ursulin wrote:
> > > > Idea is to add helpers for peeking and popping jobs from
> > > > entities
> > > > with
> > > > the goal of decoupling the hidden assumption in the code that
> > > > queue_node
> > > > is the first element in struct drm_sched_job.
> > > >=20
> > > > That assumption usually comes in the form of:
> > > >=20
> > > > =C2=A0=C2=A0 while ((job =3D to_drm_sched_job(spsc_queue_pop(&entit=
y-
> > > > > job_queue))))
> > > >=20
> > > > Which breaks if the queue_node is re-positioned due
> > > > to_drm_sched_job
> > > > being implemented with a container_of.
> > > >=20
> > > > This also allows us to remove duplicate definitions of
> > > > to_drm_sched_job.
> > > >=20
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 | =
11 +++---
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h | 46
> > > > ++++++++++++++++++++++
> > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 7 ++--
> > > > =C2=A0=C2=A03 files changed, 54 insertions(+), 10 deletions(-)
> > > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_inte=
rnal.h
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > index 69bcf0e99d57..a171f05ad761 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > @@ -28,11 +28,10 @@
> > > > =C2=A0=C2=A0#include <drm/drm_print.h>
> > > > =C2=A0=C2=A0#include <drm/gpu_scheduler.h>
> > > > +#include "sched_internal.h"
> > > > +
> > > > =C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > > -#define to_drm_sched_job(sched_job)		\
> > > > -		container_of((sched_job), struct
> > > > drm_sched_job,
> > > > queue_node)
> > > > -
> > > > =C2=A0=C2=A0/**
> > > > =C2=A0=C2=A0 * drm_sched_entity_init - Init a context entity used b=
y
> > > > scheduler
> > > > when
> > > > =C2=A0=C2=A0 * submit to HW ring.
> > > > @@ -255,7 +254,7 @@ static void drm_sched_entity_kill(struct
> > > > drm_sched_entity *entity)
> > > > =C2=A0=C2=A0	/* The entity is guaranteed to not be used by the
> > > > scheduler
> > > > */
> > > > =C2=A0=C2=A0	prev =3D rcu_dereference_check(entity->last_scheduled,
> > > > true);
> > > > =C2=A0=C2=A0	dma_fence_get(prev);
> > > > -	while ((job =3D to_drm_sched_job(spsc_queue_pop(&entity-
> > > > > job_queue)))) {
> > > > +	while ((job =3D drm_sched_entity_queue_pop(entity))) {
> > > > =C2=A0=C2=A0		struct drm_sched_fence *s_fence =3D job-
> > > > >s_fence;
> > > > =C2=A0=C2=A0		dma_fence_get(&s_fence->finished);
> > > > @@ -477,7 +476,7 @@ struct drm_sched_job
> > > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0	struct drm_sched_job *sched_job;
> > > > -	sched_job =3D to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > job_queue));
> > > > +	sched_job =3D drm_sched_entity_queue_peek(entity);
> > > > =C2=A0=C2=A0	if (!sched_job)
> > > > =C2=A0=C2=A0		return NULL;
> > > > @@ -513,7 +512,7 @@ struct drm_sched_job
> > > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > > =C2=A0=C2=A0	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO) {
> > > > =C2=A0=C2=A0		struct drm_sched_job *next;
> > > > -		next =3D
> > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > job_queue));
> > > > +		next =3D drm_sched_entity_queue_peek(entity);
> > > > =C2=A0=C2=A0		if (next) {
> > > > =C2=A0=C2=A0			struct drm_sched_rq *rq;
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > new file mode 100644
> > > > index 000000000000..815d384845a3
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > @@ -0,0 +1,46 @@
> > > > +#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > > +#define _DRM_GPU_SCHEDULER_INTERNAL_H_
> > >=20
> > > DRM maintainer tools complain about a potentially missing license
> > > identifier:
> > >=20
> > > -:80: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-
> > > License-Identifier tag in line 1
> > > #80: FILE: drivers/gpu/drm/scheduler/sched_internal.h:1:
> > >=20
> > > The other scheduler files don't have one, either. Still, it might
> > > be
> > > good to add one for new files. So, shall we make it GPL?
> >=20
> > Ha, good question. And it is actually good I forgot to do this for
> > this
> > series (I was doing for unit tests last week, I mean adding SPDX
> > lines)
> > because, as sched_internal.h will take parts of gpu_scheduler.h
> > which is not
> > explicitly GPL, nor the other scheduler source files, apart from
> > MODULE_LICENSE which is "GPL and additional rights", question
> > indeed is what
> > copyright blurb to put there. IANAL so not sure. Surely there is
> > some
> > established practice for cases like this one just I don't know what
> > it is.
> >=20
>=20
> I think GPL or MIT would be the preference given [1]. Also ofc IANAL.
>=20
> Matt
>=20
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3852

Well, I briefly synced with Dave =E2=80=93 since all our scheduler files do
contain the full MIT license header (with AMD's copyright), but no
SPDX, we should probably go for MIT with all SPDX identifiers.


P.


>=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > > Rest of the series looks good.
> > >=20
> > > P.
> > >=20
> > > > +
> > > > +/**
> > > > + * drm_sched_entity_queue_pop - Low level helper for popping
> > > > queued
> > > > jobs
> > > > + *
> > > > + * @entity: scheduler entity
> > > > + *
> > > > + * Low level helper for popping queued jobs.
> > > > + *
> > > > + * Returns: The job dequeued or NULL.
> > > > + */
> > > > +static inline struct drm_sched_job *
> > > > +drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
> > > > +{
> > > > +	struct spsc_node *node;
> > > > +
> > > > +	node =3D spsc_queue_pop(&entity->job_queue);
> > > > +	if (!node)
> > > > +		return NULL;
> > > > +
> > > > +	return container_of(node, struct drm_sched_job,
> > > > queue_node);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_sched_entity_queue_peek - Low level helper for peeking
> > > > at the
> > > > job queue
> > > > + *
> > > > + * @entity: scheduler entity
> > > > + *
> > > > + * Low level helper for peeking at the job queue
> > > > + *
> > > > + * Returns: The job at the head of the queue or NULL.
> > > > + */
> > > > +static inline struct drm_sched_job *
> > > > +drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
> > > > +{
> > > > +	struct spsc_node *node;
> > > > +
> > > > +	node =3D spsc_queue_peek(&entity->job_queue);
> > > > +	if (!node)
> > > > +		return NULL;
> > > > +
> > > > +	return container_of(node, struct drm_sched_job,
> > > > queue_node);
> > > > +}
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 8c36a59afb72..c634993f1346 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -78,6 +78,8 @@
> > > > =C2=A0=C2=A0#include <drm/gpu_scheduler.h>
> > > > =C2=A0=C2=A0#include <drm/spsc_queue.h>
> > > > +#include "sched_internal.h"
> > > > +
> > > > =C2=A0=C2=A0#define CREATE_TRACE_POINTS
> > > > =C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > > @@ -87,9 +89,6 @@ static struct lockdep_map
> > > > drm_sched_lockdep_map =3D {
> > > > =C2=A0=C2=A0};
> > > > =C2=A0=C2=A0#endif
> > > > -#define to_drm_sched_job(sched_job)		\
> > > > -		container_of((sched_job), struct
> > > > drm_sched_job,
> > > > queue_node)
> > > > -
> > > > =C2=A0=C2=A0int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
> > > > =C2=A0=C2=A0/**
> > > > @@ -123,7 +122,7 @@ static bool drm_sched_can_queue(struct
> > > > drm_gpu_scheduler *sched,
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0	struct drm_sched_job *s_job;
> > > > -	s_job =3D to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > job_queue));
> > > > +	s_job =3D drm_sched_entity_queue_peek(entity);
> > > > =C2=A0=C2=A0	if (!s_job)
> > > > =C2=A0=C2=A0		return false;
> > >=20
> >=20

