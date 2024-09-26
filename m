Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8436986EA5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1594410E880;
	Thu, 26 Sep 2024 08:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C40rc3bg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D59F10E880
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727338840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pKvwenh0woNnLPD/h0l01iPltGOPY2muw7FpSsr2GY=;
 b=C40rc3bg+UWwO+k+oUjTWTkHc4g0ilM60MjVac5YipVawwT2e4oexxF5ZNGzVWPywUY1ex
 sgJx6NL0+O54On7d6YPHxsL98Rbx7rx8PObF338xAw4gvOW9wFYo/2tdp7ewR5HDYtZtg0
 SJI7yJRVcxJbj2eR/JOYorYSQvbMDZ4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-bPU0_s6zN56RRzUjgDFdrw-1; Thu, 26 Sep 2024 04:20:39 -0400
X-MC-Unique: bPU0_s6zN56RRzUjgDFdrw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2f760dce28bso4206081fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727338837; x=1727943637;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C3Ar14HEYaqvJ8vlXGk/v/mS37iAA7X7HYJWIOo4KbI=;
 b=dCS8PgbF6TmmAedA8LwebYw28hMiaHCaZ/4fW5on8/BJDA8g6iNy2mLufZZ14MWiXI
 JFBJEwBTigBNdCOw2/614u2J3A0xvJeGlp42cnbI2EcOUmtNnvUF88qgZ0Lkk90QDF2t
 yKyVXKGo2MfDbO4p3NOjsP/Vf55mODJ+x940Zc9icD7HcdwQXp/NmHBErvyzRMpLGyXY
 aNoQqoLWpzONcx6cqYmTNDzM0/qh93jq2OQ++RDt+Kev04GPc6y7MYRShs6XAi/Oju+K
 w2t4xcQLHK/virYjILCnm3KKW514kWK86oij8UMLRVYFNylBL3DoalY8TIRy20oGkvZn
 rBVQ==
X-Gm-Message-State: AOJu0YzZ0lqUd0id+5cR8hPyTOTpDKnRg5bN4GDHfiCfep6AKzxgpbXp
 nUcdaG+6KJBFi1BU3eJVb8y9xasd0Jn9cvhupo0Y0eWf0mUiMX5TA0suBrJqlkBb8EdGbPOWAhu
 66x6mfms+lO5xpl5hLKCN9zr006W7zCdheOu6soV2FsAfLyDMxsqxasL3OfHMJ5Mi2Q==
X-Received: by 2002:a2e:a552:0:b0:2f1:a509:ce66 with SMTP id
 38308e7fff4ca-2f914cac713mr30858911fa.5.1727338836943; 
 Thu, 26 Sep 2024 01:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxX14brQlaa3aAjNHAJ6RaB25YfzL6fBEoQKWe8mj8w4dZIWQVaUFxaTJxWAdHwDtFO/jNBw==
X-Received: by 2002:a2e:a552:0:b0:2f1:a509:ce66 with SMTP id
 38308e7fff4ca-2f914cac713mr30858651fa.5.1727338836394; 
 Thu, 26 Sep 2024 01:20:36 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dee:bc00:37ec:5f5c:23da:fb5f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a09a3fsm40026375e9.25.2024.09.26.01.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:20:36 -0700 (PDT)
Message-ID: <04559921fd8c3eb7692ffacd8018d9d523f92c91.camel@redhat.com>
Subject: Re: [PATCH v3] drm/scheduler: Improve documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Date: Thu, 26 Sep 2024 10:20:35 +0200
In-Reply-To: <ZvKOY4xJWBFLBmMH@phenom.ffwll.local>
References: <20240917144732.2758572-1-shuicheng.lin@intel.com>
 <DM4PR11MB54568532CCCCE21AA2833334EA6E2@DM4PR11MB5456.namprd11.prod.outlook.com>
 <ZvKOY4xJWBFLBmMH@phenom.ffwll.local>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-09-24 at 12:03 +0200, Simona Vetter wrote:
> On Sun, Sep 22, 2024 at 05:29:36PM +0000, Lin, Shuicheng wrote:
> > Hi all,
> > I am not familiar with the process yet. To get it merged, should I
> > add more mail-list or how to notify the maintainers?
> > Thanks in advance for your guide.
>=20
> drm/sched is a bit undermaintained, things unfortunately fall through
> cracks. I've picked this up and merged it to drm-misc-next, thanks a
> lot.
> -Sima

Thx!

Feel free to ping Danilo and me in the future. We might be unavailable
at times individually, but in generally will take care of that.

P.

>=20
> >=20
> > Best Regards
> > Shuicheng
> >=20
> > > -----Original Message-----
> > > From: Lin, Shuicheng <shuicheng.lin@intel.com>
> > > Sent: Tuesday, September 17, 2024 7:48 AM
> > > To: dri-devel@lists.freedesktop.org
> > > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Philipp Stanner
> > > <pstanner@redhat.com>
> > > Subject: [PATCH v3] drm/scheduler: Improve documentation
> > >=20
> > > Function drm_sched_entity_push_job() doesn't have a return value,
> > > remove the
> > > return value description for it.
> > > Correct several other typo errors.
> > >=20
> > > v2 (Philipp):
> > > - more correction with related comments.
> > >=20
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Reviewed-by: Philipp Stanner <pstanner@redhat.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++------
> > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 4 ++=
--
> > > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++------
> > > =C2=A0include/linux/dma-resv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
> > > =C2=A04 files changed, 15 insertions(+), 17 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index 58c8161289fe..ffa3e765f5db 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -51,7 +51,7 @@
> > > =C2=A0 * drm_sched_entity_set_priority(). For changing the set of
> > > schedulers
> > > =C2=A0 * @sched_list at runtime see drm_sched_entity_modify_sched().
> > > =C2=A0 *
> > > - * An entity is cleaned up by callind drm_sched_entity_fini().
> > > See also
> > > + * An entity is cleaned up by calling drm_sched_entity_fini().
> > > See also
> > > =C2=A0 * drm_sched_entity_destroy().
> > > =C2=A0 *
> > > =C2=A0 * Returns 0 on success or a negative error code on failure.
> > > @@ -370,8 +370,8 @@ static void drm_sched_entity_clear_dep(struct
> > > dma_fence *f,=C2=A0 }
> > >=20
> > > =C2=A0/*
> > > - * drm_sched_entity_clear_dep - callback to clear the entities
> > > dependency and
> > > - * wake up scheduler
> > > + * drm_sched_entity_wakeup - callback to clear the entity's
> > > dependency
> > > + and
> > > + * wake up the scheduler
> > > =C2=A0 */
> > > =C2=A0static void drm_sched_entity_wakeup(struct dma_fence *f,
> > > =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0 struct dma_fence_cb *cb)
> > > @@ -389,7 +389,7 @@ static void drm_sched_entity_wakeup(struct
> > > dma_fence
> > > *f,
> > > =C2=A0 * @entity: scheduler entity
> > > =C2=A0 * @priority: scheduler priority
> > > =C2=A0 *
> > > - * Update the priority of runqueus used for the entity.
> > > + * Update the priority of runqueues used for the entity.
> > > =C2=A0 */
> > > =C2=A0void drm_sched_entity_set_priority(struct drm_sched_entity
> > > *entity,
> > > =C2=A0=09=09=09=09=C2=A0=C2=A0 enum drm_sched_priority
> > > priority) @@ -574,8
> > > +574,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity
> > > *entity)
> > > =C2=A0 * fence sequence number this function should be called with
> > > drm_sched_job_arm()
> > > =C2=A0 * under common lock for the struct drm_sched_entity that was
> > > set up for
> > > =C2=A0 * @sched_job in drm_sched_job_init().
> > > - *
> > > - * Returns 0 for success, negative error code otherwise.
> > > =C2=A0 */
> > > =C2=A0void drm_sched_entity_push_job(struct drm_sched_job *sched_job)=
=C2=A0
> > > { diff --git
> > > a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index ab53ab486fe6..cadf1662bc01 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -41,7 +41,7 @@
> > > =C2=A0 * 4. Entities themselves maintain a queue of jobs that will be
> > > scheduled on
> > > =C2=A0 *=C2=A0=C2=A0=C2=A0 the hardware.
> > > =C2=A0 *
> > > - * The jobs in a entity are always scheduled in the order that
> > > they were pushed.
> > > + * The jobs in an entity are always scheduled in the order in
> > > which they were
> > > pushed.
> > > =C2=A0 *
> > > =C2=A0 * Note that once a job was taken from the entities queue and
> > > pushed to the
> > > =C2=A0 * hardware, i.e. the pending queue, the entity must not be
> > > referenced anymore
> > > @@ -1339,7 +1339,7 @@ void drm_sched_fini(struct
> > > drm_gpu_scheduler
> > > *sched)
> > > =C2=A0=09=09list_for_each_entry(s_entity, &rq->entities,
> > > list)
> > > =C2=A0=09=09=09/*
> > > =C2=A0=09=09=09 * Prevents reinsertion and marks
> > > job_queue as idle,
> > > -=09=09=09 * it will removed from rq in
> > > drm_sched_entity_fini
> > > +=09=09=09 * it will be removed from the rq in
> > > drm_sched_entity_fini()
> > > =C2=A0=09=09=09 * eventually
> > > =C2=A0=09=09=09 */
> > > =C2=A0=09=09=09s_entity->stopped =3D true;
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h index
> > > fe8edb917360..ef23113451e4 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -33,11 +33,11 @@
> > > =C2=A0#define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> > >=20
> > > =C2=A0/**
> > > - * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
> > > + * DRM_SCHED_FENCE_DONT_PIPELINE - Prevent dependency pipelining
> > > =C2=A0 *
> > > =C2=A0 * Setting this flag on a scheduler fence prevents pipelining o=
f
> > > jobs depending
> > > =C2=A0 * on this fence. In other words we always insert a full CPU
> > > round trip before
> > > - * dependen jobs are pushed to the hw queue.
> > > + * dependent jobs are pushed to the hw queue.
> > > =C2=A0 */
> > > =C2=A0#define DRM_SCHED_FENCE_DONT_PIPELINE=09DMA_FENCE_FLAG_USER_BIT=
S
> > >=20
> > > @@ -71,7 +71,7 @@ enum drm_sched_priority {
> > > =C2=A0=09DRM_SCHED_PRIORITY_COUNT
> > > =C2=A0};
> > >=20
> > > -/* Used to chose between FIFO and RR jobs scheduling */
> > > +/* Used to choose between FIFO and RR job-scheduling */
> > > =C2=A0extern int drm_sched_policy;
> > >=20
> > > =C2=A0#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0=C2=A0 0
> > > @@ -198,7 +198,7 @@ struct drm_sched_entity {
> > > =C2=A0=09 *
> > > =C2=A0=09 * Points to the finished fence of the last scheduled
> > > job. Only written
> > > =C2=A0=09 * by the scheduler thread, can be accessed locklessly
> > > from
> > > -=09 * drm_sched_job_arm() iff the queue is empty.
> > > +=09 * drm_sched_job_arm() if the queue is empty.
> > > =C2=A0=09 */
> > > =C2=A0=09struct dma_fence __rcu=09=09*last_scheduled;
> > >=20
> > > @@ -247,7 +247,7 @@ struct drm_sched_entity {
> > > =C2=A0 * @sched: the scheduler to which this rq belongs to.
> > > =C2=A0 * @entities: list of the entities to be scheduled.
> > > =C2=A0 * @current_entity: the entity which is to be scheduled.
> > > - * @rb_tree_root: root of time based priory queue of entities
> > > for FIFO scheduling
> > > + * @rb_tree_root: root of time based priority queue of entities
> > > for
> > > + FIFO scheduling
> > > =C2=A0 *
> > > =C2=A0 * Run queue is a set of entities scheduling command submission=
s
> > > for
> > > =C2=A0 * one specific ring. It implements the scheduling policy that
> > > selects @@ -321,7
> > > +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> > > dma_fence
> > > *f);
> > > =C2=A0 * @s_fence: contains the fences for the scheduling of job.
> > > =C2=A0 * @finish_cb: the callback for the finished fence.
> > > =C2=A0 * @credits: the number of credits this job contributes to the
> > > scheduler
> > > - * @work: Helper to reschdeule job kill to different context.
> > > + * @work: Helper to reschedule job kill to different context.
> > > =C2=A0 * @id: a unique id assigned to each job scheduled on the
> > > scheduler.
> > > =C2=A0 * @karma: increment on every hang caused by this job. If this
> > > exceeds the hang
> > > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 limit of the=
 scheduler then the job is marked guilty
> > > and will not
> > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > > index
> > > 8d0e34dad446..c5ab6fd9ebe8 100644
> > > --- a/include/linux/dma-resv.h
> > > +++ b/include/linux/dma-resv.h
> > > @@ -105,10 +105,10 @@ enum dma_resv_usage {
> > > =C2=A0=09 * This should be used by submissions which don't want
> > > to participate in
> > > =C2=A0=09 * any implicit synchronization.
> > > =C2=A0=09 *
> > > -=09 * The most common case are preemption fences, page
> > > table updates,
> > > TLB
> > > -=09 * flushes as well as explicit synced user submissions.
> > > +=09 * The most common cases are preemption fences, page
> > > table updates,
> > > TLB
> > > +=09 * flushes as well as explicitly synced user
> > > submissions.
> > > =C2=A0=09 *
> > > -=09 * Explicit synced user user submissions can be promoted
> > > to
> > > +=09 * Explicitly synced user submissions can be promoted to
> > > =C2=A0=09 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed
> > > using
> > > =C2=A0=09 * dma_buf_import_sync_file() when implicit
> > > synchronization should
> > > =C2=A0=09 * become necessary after initial adding of the fence.
> > > --
> > > 2.25.1
> >=20
>=20

