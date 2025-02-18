Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD22FA3949D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A538510E220;
	Tue, 18 Feb 2025 08:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="dqJ98oWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD54710E220;
 Tue, 18 Feb 2025 08:12:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YxshJ1ZC1z9sQ5;
 Tue, 18 Feb 2025 09:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739866352; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcSSxDsrp6otc1LEc8iYZUQx2CUZkqdggGWwZMWo5dc=;
 b=dqJ98oWSf52IAbpEYY8h6hfJHeXSCE2kMm5QwYQEjWDywY/mKnaxPSW1exRp6DMpDKvrwm
 VvuOFxJU8Tx3manO41CBFUcWkDPYgF0JkBbKbJHcwFunMuK3umgzN4Jc4H7V52pUtNmudm
 kM2vO9D3RU7rrdo9ljegCmujT/iTdfMfPeN9aZlfbbEuC25u3N8IEG3RoTXJAD0hTs8rYn
 eoGF1VG5J9QMW0PXE403zQUt39DGt/zEU2Qpzw2cGoOfbuSy6OaA3rU8Yes2XHvR3gLWSs
 jIdgxZVfRsdEHNO+Y5me6mCB8d2SxHLLjcg99LPN4s81eGdNqYUfMpB6Fzs3TA==
Message-ID: <6801ab8b629efd519449827a0d609c407e59f655.camel@mailbox.org>
Subject: Re: [PATCH 1/6] drm/sched: Add internal job peek/pop API
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, phasta@kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>
Date: Tue, 18 Feb 2025 09:12:27 +0100
In-Reply-To: <Z65swe1XPG016e0V@lstrano-desk.jf.intel.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
 <20250207145104.60455-2-tvrtko.ursulin@igalia.com>
 <73ffd26bdd66ec25c01f820366a63f9ceedad2c8.camel@mailbox.org>
 <8ce06914-f8ec-4b28-9cc2-6ff9d9fe47db@igalia.com>
 <30be58cb90e95af0d9404082ea5c63eb8f7e9dad.camel@mailbox.org>
 <54da7c5c-a66c-4410-880c-2efebbb66214@igalia.com>
 <504eb5a31ae600b9c95dad015e7090cf0736f0a7.camel@mailbox.org>
 <Z65swe1XPG016e0V@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: ae0bbd85b99ee2bb4d5
X-MBO-RS-META: q9f8fksrqx9wr5sy67fg7xo1doygxnnw
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

On Thu, 2025-02-13 at 14:05 -0800, Matthew Brost wrote:
> On Wed, Feb 12, 2025 at 01:36:58PM +0100, Philipp Stanner wrote:
> > On Wed, 2025-02-12 at 12:30 +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 12/02/2025 10:40, Philipp Stanner wrote:
> > > > On Wed, 2025-02-12 at 09:32 +0000, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 12/02/2025 09:02, Philipp Stanner wrote:
> > > > > > On Fri, 2025-02-07 at 14:50 +0000, Tvrtko Ursulin wrote:
> > > > > > > Idea is to add helpers for peeking and popping jobs from
> > > > > > > entities
> > > > > > > with
> > > > > > > the goal of decoupling the hidden assumption in the code
> > > > > > > that
> > > > > > > queue_node
> > > > > > > is the first element in struct drm_sched_job.
> > > > > > >=20
> > > > > > > That assumption usually comes in the form of:
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0 while ((job =3D
> > > > > > > to_drm_sched_job(spsc_queue_pop(&entity-
> > > > > > > > job_queue))))
> > > > > > >=20
> > > > > > > Which breaks if the queue_node is re-positioned due
> > > > > > > to_drm_sched_job
> > > > > > > being implemented with a container_of.
> > > > > > >=20
> > > > > > > This also allows us to remove duplicate definitions of
> > > > > > > to_drm_sched_job.
> > > > > > >=20
> > > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > > > > ---
> > > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=
=A0=C2=A0 | 11 +++---
> > > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h =
| 46
> > > > > > > ++++++++++++++++++++++
> > > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++--
> > > > > > > =C2=A0=C2=A0=C2=A03 files changed, 54 insertions(+), 10 delet=
ions(-)
> > > > > > > =C2=A0=C2=A0=C2=A0create mode 100644
> > > > > > > drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > index 69bcf0e99d57..a171f05ad761 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > @@ -28,11 +28,10 @@
> > > > > > > =C2=A0=C2=A0=C2=A0#include <drm/drm_print.h>
> > > > > > > =C2=A0=C2=A0=C2=A0#include <drm/gpu_scheduler.h>
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > +#include "sched_internal.h"
> > > > > > > +
> > > > > > > =C2=A0=C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > -#define to_drm_sched_job(sched_job)		\
> > > > > > > -		container_of((sched_job), struct
> > > > > > > drm_sched_job,
> > > > > > > queue_node)
> > > > > > > -
> > > > > > > =C2=A0=C2=A0=C2=A0/**
> > > > > > > =C2=A0=C2=A0=C2=A0 * drm_sched_entity_init - Init a context e=
ntity used
> > > > > > > by
> > > > > > > scheduler
> > > > > > > when
> > > > > > > =C2=A0=C2=A0=C2=A0 * submit to HW ring.
> > > > > > > @@ -255,7 +254,7 @@ static void
> > > > > > > drm_sched_entity_kill(struct
> > > > > > > drm_sched_entity *entity)
> > > > > > > =C2=A0=C2=A0=C2=A0	/* The entity is guaranteed to not be used=
 by
> > > > > > > the
> > > > > > > scheduler
> > > > > > > */
> > > > > > > =C2=A0=C2=A0=C2=A0	prev =3D rcu_dereference_check(entity-
> > > > > > > >last_scheduled,
> > > > > > > true);
> > > > > > > =C2=A0=C2=A0=C2=A0	dma_fence_get(prev);
> > > > > > > -	while ((job =3D
> > > > > > > to_drm_sched_job(spsc_queue_pop(&entity-
> > > > > > > > job_queue)))) {
> > > > > > > +	while ((job =3D
> > > > > > > drm_sched_entity_queue_pop(entity))) {
> > > > > > > =C2=A0=C2=A0=C2=A0		struct drm_sched_fence *s_fence =3D job-
> > > > > > > > s_fence;
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0		dma_fence_get(&s_fence->finished);
> > > > > > > @@ -477,7 +476,7 @@ struct drm_sched_job
> > > > > > > *drm_sched_entity_pop_job(struct drm_sched_entity
> > > > > > > *entity)
> > > > > > > =C2=A0=C2=A0=C2=A0{
> > > > > > > =C2=A0=C2=A0=C2=A0	struct drm_sched_job *sched_job;
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > -	sched_job =3D
> > > > > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > > > job_queue));
> > > > > > > +	sched_job =3D drm_sched_entity_queue_peek(entity);
> > > > > > > =C2=A0=C2=A0=C2=A0	if (!sched_job)
> > > > > > > =C2=A0=C2=A0=C2=A0		return NULL;
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > @@ -513,7 +512,7 @@ struct drm_sched_job
> > > > > > > *drm_sched_entity_pop_job(struct drm_sched_entity
> > > > > > > *entity)
> > > > > > > =C2=A0=C2=A0=C2=A0	if (drm_sched_policy =3D=3D DRM_SCHED_POLI=
CY_FIFO) {
> > > > > > > =C2=A0=C2=A0=C2=A0		struct drm_sched_job *next;
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > -		next =3D
> > > > > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > > > job_queue));
> > > > > > > +		next =3D
> > > > > > > drm_sched_entity_queue_peek(entity);
> > > > > > > =C2=A0=C2=A0=C2=A0		if (next) {
> > > > > > > =C2=A0=C2=A0=C2=A0			struct drm_sched_rq *rq;
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > > b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..25ac62ac2bf3
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > > @@ -0,0 +1,46 @@
> > > > > > > +#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > > > > > +#define _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * drm_sched_entity_queue_pop - Low level helper for
> > > > > > > popping
> > > > > > > queued
> > > > > > > jobs
> > > > > > > + *
> > > > > > > + * @entity: scheduler entity
> > > > > > > + *
> > > > > > > + * Low level helper for popping queued jobs.
> > > > > > > + *
> > > > > > > + * Returns the job dequeued or NULL.
> > > > > > > + */
> > > > > > > +static inline struct drm_sched_job *
> > > > > > > +drm_sched_entity_queue_pop(struct drm_sched_entity
> > > > > > > *entity)
> > > > > > > +{
> > > > > > > +	struct spsc_node *node;
> > > > > > > +
> > > > > > > +	node =3D spsc_queue_pop(&entity->job_queue);
> > > > > > > +	if (!node)
> > > > > > > +		return NULL;
> > > > > > > +
> > > > > > > +	return container_of(node, struct drm_sched_job,
> > > > > > > queue_node);
> > > > > > > +}
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * drm_sched_entity_queue_peek - Low level helper for
> > > > > > > peeking at
> > > > > > > the
> > > > > > > job queue
> > > > > > > + *
> > > > > > > + * @entity: scheduler entity
> > > > > > > + *
> > > > > > > + * Low level helper for peeking at the job queue
> > > > > > > + *
> > > > > > > + * Returns the job at the head of the queue or NULL.
> > > > > >=20
> > > > > > I would like to (slowly) work towards a unified style
> > > > > > regarding
> > > > > > the
> > > > > > docstrings. They're currently relatively inconsistent in
> > > > > > drm/sched.
> > > > > >=20
> > > > > > I think we should do it that way:
> > > > > >=20
> > > > > > ""
> > > > > > @entity: scheduler entity
> > > > > >=20
> > > > > > Returns: the job at the head of the queue or NULL.
> > > > > >=20
> > > > > > Low level helper for peeking at the the job queue.
> > > > > > ""
> > > > >=20
> > > > > Returns before the description would be yet another new
> > > > > style,
> > > > > no?
> > > > > I's
> > > > > say that if we are churning lets follow
> > > > > Documentation/doc-guide/kernel-doc.rst.
> > > >=20
> > > > Oh yes, you are right =E2=80=93 official guideline demands "Return:=
" at
> > > > the
> > > > end. So let's go for that for contributions.
> > >=20
> > > So you want me to respin or are you okay with doing all scheduler
> > > kernel=20
> > > doc in one patch afterwards?
> >=20
> > Both's OK I guess. It's not a big deal, it's just one letter being
> > replaced. If you find some other nits you'd like to address you
> > could
> > give a v5 with that change?
> >=20
> > Rest of the series looks good to me. Having an ACK by AMD pro forma
> > for
> > merging everything together would be nice, though
> >=20
>=20
> +1. Series looks good to me and all for moving some public DRM
> scheduler
> functions to internal headers. Good from Xe's end too.
>=20
> I would send this to the Xe list to get a CI run though ahead of
> merging.

With "I would" you mean me and/or Tvrtko? :)

@Tvrtko, if you provide a v5, can you +Cc Xe?

Thx
P.

>=20
> Matt=20
>=20
> > P.
> >=20
> >=20
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > > > =C2=A0 Or even consider sending a patch
> > > > > which churns everything at once.
> > > > >=20
> > > > > Regards,
> > > > >=20
> > > > > Tvrtko
> > > > >=20
> > > > > > > + */
> > > > > > > +static inline struct drm_sched_job *
> > > > > > > +drm_sched_entity_queue_peek(struct drm_sched_entity
> > > > > > > *entity)
> > > > > > > +{
> > > > > > > +	struct spsc_node *node;
> > > > > > > +
> > > > > > > +	node =3D spsc_queue_peek(&entity->job_queue);
> > > > > > > +	if (!node)
> > > > > > > +		return NULL;
> > > > > > > +
> > > > > > > +	return container_of(node, struct drm_sched_job,
> > > > > > > queue_node);
> > > > > > > +}
> > > > > > > +
> > > > > > > +#endif
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index a48be16ab84f..9f614a775c49 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -78,6 +78,8 @@
> > > > > > > =C2=A0=C2=A0=C2=A0#include <drm/gpu_scheduler.h>
> > > > > > > =C2=A0=C2=A0=C2=A0#include <drm/spsc_queue.h>
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > +#include "sched_internal.h"
> > > > > > > +
> > > > > > > =C2=A0=C2=A0=C2=A0#define CREATE_TRACE_POINTS
> > > > > > > =C2=A0=C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > @@ -87,9 +89,6 @@ static struct lockdep_map
> > > > > > > drm_sched_lockdep_map
> > > > > > > =3D {
> > > > > > > =C2=A0=C2=A0=C2=A0};
> > > > > > > =C2=A0=C2=A0=C2=A0#endif
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > -#define to_drm_sched_job(sched_job)		\
> > > > > > > -		container_of((sched_job), struct
> > > > > > > drm_sched_job,
> > > > > > > queue_node)
> > > > > > > -
> > > > > > > =C2=A0=C2=A0=C2=A0int drm_sched_policy =3D DRM_SCHED_POLICY_F=
IFO;
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0/**
> > > > > > > @@ -123,7 +122,7 @@ static bool
> > > > > > > drm_sched_can_queue(struct
> > > > > > > drm_gpu_scheduler *sched,
> > > > > > > =C2=A0=C2=A0=C2=A0{
> > > > > > > =C2=A0=C2=A0=C2=A0	struct drm_sched_job *s_job;
> > > > > > > =C2=A0=C2=A0=20
> > > > > > > -	s_job =3D
> > > > > > > to_drm_sched_job(spsc_queue_peek(&entity-
> > > > > > > > job_queue));
> > > > > > > +	s_job =3D drm_sched_entity_queue_peek(entity);
> > > > > > > =C2=A0=C2=A0=C2=A0	if (!s_job)
> > > > > > > =C2=A0=C2=A0=C2=A0		return false;
> > > > > > > =C2=A0=C2=A0=20
> > > > > >=20
> > > > >=20
> > > >=20
> > >=20
> >=20

