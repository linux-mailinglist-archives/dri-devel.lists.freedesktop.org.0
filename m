Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88851A325E8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 13:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E176810E87F;
	Wed, 12 Feb 2025 12:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="i3dwNdn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F06210E880;
 Wed, 12 Feb 2025 12:37:05 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YtHrF5WXNz9t8M;
 Wed, 12 Feb 2025 13:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739363821; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XAhqjCsfrFyMiWu91ziTmeg1m9k36DN3vWisreVPwU=;
 b=i3dwNdn03qwpdmv//cFu0iFqPBI2G+A9gf1c+RiBFoQNG8Twwjek4DhRW6AHYNOkYdRzx8
 fKcN6kUBoPjYZxMjoCBkRLrNtxgPnUgUwGG5qjTnXGn2MOHGRclQ8n279ug7lKi44iZ1Jg
 fs0hAs+30rrAJ1LxhtlahYn8ayviWfYoF6eJnul7RqPNpMFf6ISZcmLoTPRWY5EEcvvQz6
 AaKUgNBZAru1P4mRv11HX3PK8gc6OKz2S77fHMKnGayH2MxFVzFziTtIRpO73QY0GIVzVN
 TH4oLVBQ3qNIh6uZaU/OyBgxERiOEzsROOI9m3CUaeevyF7qYkudfX3r+XIQbw==
Message-ID: <504eb5a31ae600b9c95dad015e7090cf0736f0a7.camel@mailbox.org>
Subject: Re: [PATCH 1/6] drm/sched: Add internal job peek/pop API
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Wed, 12 Feb 2025 13:36:58 +0100
In-Reply-To: <54da7c5c-a66c-4410-880c-2efebbb66214@igalia.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
 <20250207145104.60455-2-tvrtko.ursulin@igalia.com>
 <73ffd26bdd66ec25c01f820366a63f9ceedad2c8.camel@mailbox.org>
 <8ce06914-f8ec-4b28-9cc2-6ff9d9fe47db@igalia.com>
 <30be58cb90e95af0d9404082ea5c63eb8f7e9dad.camel@mailbox.org>
 <54da7c5c-a66c-4410-880c-2efebbb66214@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: aswces5c5bdqo3yf8mhd1kqtfu8u49z5
X-MBO-RS-ID: 28ef507eb6ea89b4a7e
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

On Wed, 2025-02-12 at 12:30 +0000, Tvrtko Ursulin wrote:
>=20
> On 12/02/2025 10:40, Philipp Stanner wrote:
> > On Wed, 2025-02-12 at 09:32 +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 12/02/2025 09:02, Philipp Stanner wrote:
> > > > On Fri, 2025-02-07 at 14:50 +0000, Tvrtko Ursulin wrote:
> > > > > Idea is to add helpers for peeking and popping jobs from
> > > > > entities
> > > > > with
> > > > > the goal of decoupling the hidden assumption in the code that
> > > > > queue_node
> > > > > is the first element in struct drm_sched_job.
> > > > >=20
> > > > > That assumption usually comes in the form of:
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0 while ((job =3D to_drm_sched_job(spsc_queue_po=
p(&entity-
> > > > > > job_queue))))
> > > > >=20
> > > > > Which breaks if the queue_node is re-positioned due
> > > > > to_drm_sched_job
> > > > > being implemented with a container_of.
> > > > >=20
> > > > > This also allows us to remove duplicate definitions of
> > > > > to_drm_sched_job.
> > > > >=20
> > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > > ---
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=
=C2=A0 | 11 +++---
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h | 46
> > > > > ++++++++++++++++++++++
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 7 ++--
> > > > > =C2=A0=C2=A0=C2=A03 files changed, 54 insertions(+), 10 deletions=
(-)
> > > > > =C2=A0=C2=A0=C2=A0create mode 100644
> > > > > drivers/gpu/drm/scheduler/sched_internal.h
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > index 69bcf0e99d57..a171f05ad761 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > @@ -28,11 +28,10 @@
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/drm_print.h>
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/gpu_scheduler.h>
> > > > > =C2=A0=C2=A0=20
> > > > > +#include "sched_internal.h"
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > > > =C2=A0=C2=A0=20
> > > > > -#define to_drm_sched_job(sched_job)		\
> > > > > -		container_of((sched_job), struct
> > > > > drm_sched_job,
> > > > > queue_node)
> > > > > -
> > > > > =C2=A0=C2=A0=C2=A0/**
> > > > > =C2=A0=C2=A0=C2=A0 * drm_sched_entity_init - Init a context entit=
y used by
> > > > > scheduler
> > > > > when
> > > > > =C2=A0=C2=A0=C2=A0 * submit to HW ring.
> > > > > @@ -255,7 +254,7 @@ static void drm_sched_entity_kill(struct
> > > > > drm_sched_entity *entity)
> > > > > =C2=A0=C2=A0=C2=A0	/* The entity is guaranteed to not be used by =
the
> > > > > scheduler
> > > > > */
> > > > > =C2=A0=C2=A0=C2=A0	prev =3D rcu_dereference_check(entity->last_sc=
heduled,
> > > > > true);
> > > > > =C2=A0=C2=A0=C2=A0	dma_fence_get(prev);
> > > > > -	while ((job =3D
> > > > > to_drm_sched_job(spsc_queue_pop(&entity-
> > > > > > job_queue)))) {
> > > > > +	while ((job =3D drm_sched_entity_queue_pop(entity))) {
> > > > > =C2=A0=C2=A0=C2=A0		struct drm_sched_fence *s_fence =3D job-
> > > > > >s_fence;
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0		dma_fence_get(&s_fence->finished);
> > > > > @@ -477,7 +476,7 @@ struct drm_sched_job
> > > > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > > > =C2=A0=C2=A0=C2=A0{
> > > > > =C2=A0=C2=A0=C2=A0	struct drm_sched_job *sched_job;
> > > > > =C2=A0=C2=A0=20
> > > > > -	sched_job =3D
> > > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > job_queue));
> > > > > +	sched_job =3D drm_sched_entity_queue_peek(entity);
> > > > > =C2=A0=C2=A0=C2=A0	if (!sched_job)
> > > > > =C2=A0=C2=A0=C2=A0		return NULL;
> > > > > =C2=A0=C2=A0=20
> > > > > @@ -513,7 +512,7 @@ struct drm_sched_job
> > > > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > > > =C2=A0=C2=A0=C2=A0	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_F=
IFO) {
> > > > > =C2=A0=C2=A0=C2=A0		struct drm_sched_job *next;
> > > > > =C2=A0=C2=A0=20
> > > > > -		next =3D
> > > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > job_queue));
> > > > > +		next =3D drm_sched_entity_queue_peek(entity);
> > > > > =C2=A0=C2=A0=C2=A0		if (next) {
> > > > > =C2=A0=C2=A0=C2=A0			struct drm_sched_rq *rq;
> > > > > =C2=A0=C2=A0=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > new file mode 100644
> > > > > index 000000000000..25ac62ac2bf3
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > @@ -0,0 +1,46 @@
> > > > > +#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > > > +#define _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > > > +
> > > > > +/**
> > > > > + * drm_sched_entity_queue_pop - Low level helper for popping
> > > > > queued
> > > > > jobs
> > > > > + *
> > > > > + * @entity: scheduler entity
> > > > > + *
> > > > > + * Low level helper for popping queued jobs.
> > > > > + *
> > > > > + * Returns the job dequeued or NULL.
> > > > > + */
> > > > > +static inline struct drm_sched_job *
> > > > > +drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
> > > > > +{
> > > > > +	struct spsc_node *node;
> > > > > +
> > > > > +	node =3D spsc_queue_pop(&entity->job_queue);
> > > > > +	if (!node)
> > > > > +		return NULL;
> > > > > +
> > > > > +	return container_of(node, struct drm_sched_job,
> > > > > queue_node);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_sched_entity_queue_peek - Low level helper for
> > > > > peeking at
> > > > > the
> > > > > job queue
> > > > > + *
> > > > > + * @entity: scheduler entity
> > > > > + *
> > > > > + * Low level helper for peeking at the job queue
> > > > > + *
> > > > > + * Returns the job at the head of the queue or NULL.
> > > >=20
> > > > I would like to (slowly) work towards a unified style regarding
> > > > the
> > > > docstrings. They're currently relatively inconsistent in
> > > > drm/sched.
> > > >=20
> > > > I think we should do it that way:
> > > >=20
> > > > ""
> > > > @entity: scheduler entity
> > > >=20
> > > > Returns: the job at the head of the queue or NULL.
> > > >=20
> > > > Low level helper for peeking at the the job queue.
> > > > ""
> > >=20
> > > Returns before the description would be yet another new style,
> > > no?
> > > I's
> > > say that if we are churning lets follow
> > > Documentation/doc-guide/kernel-doc.rst.
> >=20
> > Oh yes, you are right =E2=80=93 official guideline demands "Return:" at=
 the
> > end. So let's go for that for contributions.
>=20
> So you want me to respin or are you okay with doing all scheduler
> kernel=20
> doc in one patch afterwards?

Both's OK I guess. It's not a big deal, it's just one letter being
replaced. If you find some other nits you'd like to address you could
give a v5 with that change?

Rest of the series looks good to me. Having an ACK by AMD pro forma for
merging everything together would be nice, though

P.


>=20
> Regards,
>=20
> Tvrtko
>=20
> > > =C2=A0 Or even consider sending a patch
> > > which churns everything at once.
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > > > + */
> > > > > +static inline struct drm_sched_job *
> > > > > +drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
> > > > > +{
> > > > > +	struct spsc_node *node;
> > > > > +
> > > > > +	node =3D spsc_queue_peek(&entity->job_queue);
> > > > > +	if (!node)
> > > > > +		return NULL;
> > > > > +
> > > > > +	return container_of(node, struct drm_sched_job,
> > > > > queue_node);
> > > > > +}
> > > > > +
> > > > > +#endif
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index a48be16ab84f..9f614a775c49 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -78,6 +78,8 @@
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/gpu_scheduler.h>
> > > > > =C2=A0=C2=A0=C2=A0#include <drm/spsc_queue.h>
> > > > > =C2=A0=C2=A0=20
> > > > > +#include "sched_internal.h"
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0#define CREATE_TRACE_POINTS
> > > > > =C2=A0=C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > > > =C2=A0=C2=A0=20
> > > > > @@ -87,9 +89,6 @@ static struct lockdep_map
> > > > > drm_sched_lockdep_map
> > > > > =3D {
> > > > > =C2=A0=C2=A0=C2=A0};
> > > > > =C2=A0=C2=A0=C2=A0#endif
> > > > > =C2=A0=C2=A0=20
> > > > > -#define to_drm_sched_job(sched_job)		\
> > > > > -		container_of((sched_job), struct
> > > > > drm_sched_job,
> > > > > queue_node)
> > > > > -
> > > > > =C2=A0=C2=A0=C2=A0int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0/**
> > > > > @@ -123,7 +122,7 @@ static bool drm_sched_can_queue(struct
> > > > > drm_gpu_scheduler *sched,
> > > > > =C2=A0=C2=A0=C2=A0{
> > > > > =C2=A0=C2=A0=C2=A0	struct drm_sched_job *s_job;
> > > > > =C2=A0=C2=A0=20
> > > > > -	s_job =3D to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > job_queue));
> > > > > +	s_job =3D drm_sched_entity_queue_peek(entity);
> > > > > =C2=A0=C2=A0=C2=A0	if (!s_job)
> > > > > =C2=A0=C2=A0=C2=A0		return false;
> > > > > =C2=A0=C2=A0=20
> > > >=20
> > >=20
> >=20
>=20

