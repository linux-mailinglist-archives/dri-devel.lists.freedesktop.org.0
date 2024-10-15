Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE3B99E7AC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 13:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4554310E1C4;
	Tue, 15 Oct 2024 11:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZLNu3DKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D3210E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728993392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L43gPNDG7xDvGFj0dMc2adOftMMUwZUAKrFKWv6HZH0=;
 b=ZLNu3DKo/zu0I7W/v01gOtyi5olnXksiGnFffZuQSYJ2CECCUUd8yffc1JxSEYp2FRU9Vd
 GNKzhzPCLRFXTJB34N6imCphyIAMdUdkqMqoh5cMUgoIHlY0xYp9RMYMVZC63jVx4iZmfk
 e/nsRjVGSYRygIvgJ47ZhEpfDZXJRng=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-mkJTWFFLNbqu_wNhNfXwOQ-1; Tue, 15 Oct 2024 07:56:31 -0400
X-MC-Unique: mkJTWFFLNbqu_wNhNfXwOQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6cbe4a123fdso90193226d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 04:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728993391; x=1729598191;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Uno81CSCxSLdsAaQ7DBWukvQpRV9Jcx0DpQN3QZM+U=;
 b=DasCO4b8Hk/0o0kv+aNHHHql1Pwn4lUQjxIKsj5ytrMJN5XNjyjuBtp7LenswtV7GX
 ifoVDjK/U9n6RnzAsue1TBevSmpsicF/pEnUj4CPfbfqMZt+ES/iGAxkyXIo+PxAB6zW
 JEgw1j2hFA8o3pBtmtkC0LE3q1MIwfUT+OA2nMb3qyt6B2M6if+swFlw77kUpiO7Gu2h
 gU3InpwoIattTpy+uyytLDczI8vsqfASb+WgdPYeOA8qk+GN95FYSlU1oLv5NkzQguM/
 ksjKgS6iECR/DgsBmUtJC4f75xejg6kT5klP6yVQ54DAILVWq2CnJv2FKZljlPrMlOT2
 UYIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3WVwnmSPWTWA+CUut3UcdnO0P7cGQYENiAGCTJmKL8J8pAnpPNdxhneppnnQoB/E/J9f4XhwlJkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA9o6vXNbpco5oGCKcErh83B/dNZOQaxyL1Vq+qB39sSU+qId3
 sTBgmJlnq0OuS69FXvNeRUZn8azJrOYOjhf9QV0YUJ+gblhTmqtrFdqqFqXcAPcLuh+M3rZ0A4u
 4HjbuK2vO77I/vdinNdyMZPYIRtyZRSoC/ZL+BoYf0UsIZYZIprY9UoizmqRp11DOxA==
X-Received: by 2002:a05:6214:4a8b:b0:6cb:fc50:786f with SMTP id
 6a1803df08f44-6cbfc507911mr200036986d6.37.1728993391322; 
 Tue, 15 Oct 2024 04:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFreKp0LnZqYBoo61QnKryeatWuV1HVKgyhyprEznSyOETA0ftk2hKxoaxqyBChkmVday8dfQ==
X-Received: by 2002:a05:6214:4a8b:b0:6cb:fc50:786f with SMTP id
 6a1803df08f44-6cbfc507911mr200036706d6.37.1728993390907; 
 Tue, 15 Oct 2024 04:56:30 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc2298fe5fsm5669006d6.135.2024.10.15.04.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 04:56:30 -0700 (PDT)
Message-ID: <38ec8fa17b8e1ee2f6d409ed0a472f0fcc006fd6.camel@redhat.com>
Subject: Re: [PATCH 4/5] drm/sched: Re-group and rename the entity run-queue
 lock
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Tue, 15 Oct 2024 13:56:28 +0200
In-Reply-To: <20241014104637.83209-5-tursulin@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-5-tursulin@igalia.com>
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

On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Christian suggested to rename the lock and improve the documentation

Let's move it to Annotators:
Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>

(Otherwise some time in the future a Christian Kaiser might start
working on the scheduler on steal the praise ^^)

> of
> what it protects.=C2=A0

So without Christian's name here I'd phrase it as:
"When writing to a drm_sched_entity's run-queue, writers are protected
through the lock drm_sched_entity.rq_lock. This naming, however,
frequently collides with the separate internal lock of struct
drm_sched_rq, resulting in uses like this:

=09spin_lock(&entity->rq_lock);
=09spin_lock(&entity->rq->lock);

Rename drm_sched_entity.rq_lock to improve readability. While at it,
re-order that struct's members to make it more obvious what the lock
protects.

> And to also re-order the structure members so all
> protected by the lock are together in a block.


>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 28 ++++++++++++---------=
-
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++------
> =C2=A03 files changed, 23 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index b72cba292839..c013c2b49aa5 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -105,7 +105,7 @@ int drm_sched_entity_init(struct drm_sched_entity
> *entity,
> =C2=A0=09/* We start in an idle state. */
> =C2=A0=09complete_all(&entity->entity_idle);
> =C2=A0
> -=09spin_lock_init(&entity->rq_lock);
> +=09spin_lock_init(&entity->lock);
> =C2=A0=09spsc_queue_init(&entity->job_queue);
> =C2=A0
> =C2=A0=09atomic_set(&entity->fence_seq, 0);
> @@ -133,10 +133,10 @@ void drm_sched_entity_modify_sched(struct
> drm_sched_entity *entity,
> =C2=A0{
> =C2=A0=09WARN_ON(!num_sched_list || !sched_list);
> =C2=A0
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09entity->sched_list =3D sched_list;
> =C2=A0=09entity->num_sched_list =3D num_sched_list;
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_modify_sched);
> =C2=A0
> @@ -244,10 +244,10 @@ static void drm_sched_entity_kill(struct
> drm_sched_entity *entity)
> =C2=A0=09if (!entity->rq)
> =C2=A0=09=09return;
> =C2=A0
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09entity->stopped =3D true;
> =C2=A0=09drm_sched_rq_remove_entity(entity->rq, entity);
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09/* Make sure this entity is not used by the scheduler at the
> moment */
> =C2=A0=09wait_for_completion(&entity->entity_idle);
> @@ -396,9 +396,9 @@ static void drm_sched_entity_wakeup(struct
> dma_fence *f,
> =C2=A0void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 enum drm_sched_priority priority)
> =C2=A0{
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09entity->priority =3D priority;
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_set_priority);
> =C2=A0
> @@ -515,10 +515,10 @@ struct drm_sched_job
> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> =C2=A0
> =C2=A0=09=09next =3D to_drm_sched_job(spsc_queue_peek(&entity-
> >job_queue));
> =C2=A0=09=09if (next) {
> -=09=09=09spin_lock(&entity->rq_lock);
> +=09=09=09spin_lock(&entity->lock);
> =C2=A0=09=09=09drm_sched_rq_update_fifo_locked(entity,
> =C2=A0=09=09=09=09=09=09=09next-
> >submit_ts);
> -=09=09=09spin_unlock(&entity->rq_lock);
> +=09=09=09spin_unlock(&entity->lock);
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> @@ -559,14 +559,14 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0=09if (fence && !dma_fence_is_signaled(fence))
> =C2=A0=09=09return;
> =C2=A0
> -=09spin_lock(&entity->rq_lock);
> +=09spin_lock(&entity->lock);
> =C2=A0=09sched =3D drm_sched_pick_best(entity->sched_list, entity-
> >num_sched_list);
> =C2=A0=09rq =3D sched ? sched->sched_rq[entity->priority] : NULL;
> =C2=A0=09if (rq !=3D entity->rq) {
> =C2=A0=09=09drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0=09=09entity->rq =3D rq;
> =C2=A0=09}
> -=09spin_unlock(&entity->rq_lock);
> +=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09if (entity->num_sched_list =3D=3D 1)
> =C2=A0=09=09entity->sched_list =3D NULL;
> @@ -605,9 +605,9 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0=09=09struct drm_sched_rq *rq;
> =C2=A0
> =C2=A0=09=09/* Add the entity to the run queue */
> -=09=09spin_lock(&entity->rq_lock);
> +=09=09spin_lock(&entity->lock);
> =C2=A0=09=09if (entity->stopped) {
> -=09=09=09spin_unlock(&entity->rq_lock);
> +=09=09=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09=09=09DRM_ERROR("Trying to push to a killed
> entity\n");
> =C2=A0=09=09=09return;
> @@ -621,7 +621,7 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> =C2=A0=09=09=09drm_sched_rq_update_fifo_locked(entity,
> submit_ts);
> =C2=A0
> -=09=09spin_unlock(&entity->rq_lock);
> +=09=09spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0=09=09drm_sched_wakeup(sched);
> =C2=A0=09}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 07ee386b8e4b..2670bf9f34b2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -176,7 +176,7 @@ void drm_sched_rq_update_fifo_locked(struct
> drm_sched_entity *entity, ktime_t ts
> =C2=A0=09 * for entity from within concurrent
> drm_sched_entity_select_rq and the
> =C2=A0=09 * other to update the rb tree structure.
> =C2=A0=09 */
> -=09lockdep_assert_held(&entity->rq_lock);
> +=09lockdep_assert_held(&entity->lock);
> =C2=A0
> =C2=A0=09spin_lock(&entity->rq->lock);
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index b6d095074c19..683fff8939e4 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -96,6 +96,14 @@ struct drm_sched_entity {
> =C2=A0=09 */
> =C2=A0=09struct list_head=09=09list;
> =C2=A0

Uh, btw, while reviewing, I just saw that we still have that FIXME
further up:

=09/**
=09 * @rq:
=09 *
=09 * Runqueue on which this entity is currently scheduled.
=09 *
=09 * FIXME: Locking is very unclear for this. Writers are protected by
=09 * @rq_lock, but readers are generally lockless and seem to just race
=09 * with not even a READ_ONCE.
=09 */
=09struct drm_sched_rq=09=09*rq;

At the very least, rq_lock should be renamed here, too. AFAICS the
series doesn't solve the FIXME, so we keep it, agreed?


> +=09/**
> +=09 * @lock:
> +=09 *
> +=09 * Lock protecting the run-queue (@rq) to which this entity
> belongs,
> +=09 * @priority and the list of schedulers (@sched_list,
> @num_sched_list).
> +=09 */
> +=09spinlock_t=09=09=09lock;
> +
> =C2=A0=09/**
> =C2=A0=09 * @rq:
> =C2=A0=09 *
> @@ -140,13 +148,6 @@ struct drm_sched_entity {
> =C2=A0=09 */

I think this comment here above also uses the term "rq_lock". While
you're fixing it, maybe also do a quick grep for "rq_lock" in case I
overlooked it somewhere else. I stopped drinking coffee today, so...


Thx,
P.

> =C2=A0=09enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 priority;
> =C2=A0
> -=09/**
> -=09 * @rq_lock:
> -=09 *
> -=09 * Lock to modify the runqueue to which this entity belongs.
> -=09 */
> -=09spinlock_t=09=09=09rq_lock;
> -
> =C2=A0=09/**
> =C2=A0=09 * @job_queue: the list of jobs of this entity.
> =C2=A0=09 */

