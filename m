Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB351986E97
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C3910EB00;
	Thu, 26 Sep 2024 08:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TXAdXX+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781B10E042
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727338563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkE98gTtDfNr5GfMuftp4G9EJP69laL9HOqoZTWYEH4=;
 b=TXAdXX+vL9n2KTUnXB3Y3bWrFaBU/K8mCbydHea0u7cK6UGrX7kXVWSmi4XdUnraO0drv5
 V19+SWXkP6fCbiqih4tIkOSy+477zf6rJ2NkaEoF6unH4eALtebzdod0WbRNd/u2bjXxfB
 ibnTIm/YqWOT3sukN1azltUl8cuaZ3E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-202F5-_WPlynyzStyytGfA-1; Thu, 26 Sep 2024 04:16:01 -0400
X-MC-Unique: 202F5-_WPlynyzStyytGfA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42e611963c2so4460825e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727338560; x=1727943360;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q+PB1bX63yvpVUwHd1p8kcnlGkK65hhrsf8Uv72pc7E=;
 b=JARKw4FC4+SBmyauyvi/zfYIsqwclSqiSqo4UFj8VRgCSZNKpoy1pJuDLweL3Aurw9
 inq/kjymMMwq3cbTocGp0TJrxA1YmvT8K5nZbAYWYbyT0N/9OO4bUX+gOGEyE1NvAMVo
 lRklM7p253zz0SvJHbmNUSGSTRDu79fyaz0MJ3/PFc0gg77Fx1sVzfwseUNf3tXly18b
 ddwQTpO87bAg180jPAH17wiQuTV4t35i6WwcNb5Kipvro7R7Ph71/HNPGp8ViMQN4mRv
 DeMc/mBnVA+I+pYDRjbT7Iz0VlWLT/NKAVbywJUjb4GS5yVhZptg47zoGZx+ScQThmja
 ER2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxUDGGI1upqkqYVLhwrcGHobRIEqm0ZGv3l6+4VjyTRWbJyx7XFJpUwCMl66gS3nSfKP84xR+58zM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2bY4/PyyxrLenICdqYG+PvaU5eNm2so2OQTilj6ys8vGC139I
 0e4z+59edxN9UyeLNDclTjEdBBw1HEVihiiZAtX3bVzoj9ac5xJlxhEVD4sFzPN6OhZ/jrf5iLI
 6t3h+DXzQYC/Cs9RdP22iQEkmCW972JkZre8ojYJ3Pq9BQf9oi1fk+aTM7VbhrAegOA==
X-Received: by 2002:a05:600c:1d28:b0:42c:cd7c:a196 with SMTP id
 5b1f17b1804b1-42e9611d114mr43907465e9.17.1727338559964; 
 Thu, 26 Sep 2024 01:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwymqbtplHXtGKps6e8X68XchcCU8AuujFE6kob4eddrzwCgTX6kD4e43/wdKG6NNCah1n6g==
X-Received: by 2002:a05:600c:1d28:b0:42c:cd7c:a196 with SMTP id
 5b1f17b1804b1-42e9611d114mr43907165e9.17.1727338559472; 
 Thu, 26 Sep 2024 01:15:59 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dee:bc00:37ec:5f5c:23da:fb5f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969ddb64sm40042255e9.8.2024.09.26.01.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:15:59 -0700 (PDT)
Message-ID: <a5dd98b71891ea0392d61e24cde8b35051035780.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sched: Further optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 26 Sep 2024 10:15:58 +0200
In-Reply-To: <1650ecb9-ac8a-4199-8693-77c73a95bbbd@igalia.com>
References: <20240913160559.49054-9-tursulin@igalia.com>
 <20240916173007.118-1-tursulin@igalia.com>
 <1650ecb9-ac8a-4199-8693-77c73a95bbbd@igalia.com>
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

On Mon, 2024-09-23 at 15:35 +0100, Tvrtko Ursulin wrote:
>=20
> Ping Christian and Philipp - reasonably happy with v2? I think it's
> the=20
> only unreviewed patch from the series.

Howdy,

sry for the delay, I had been traveling.

I have a few nits below regarding the commit message. Besides, I'm OK
with that, thx for your work :)

>=20
> Regards,
>=20
> Tvrtko
>=20
> On 16/09/2024 18:30, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >=20
> > Having removed one re-lock cycle on the entity->lock in a patch
> > titled
> > "drm/sched: Optimise drm_sched_entity_push_job",=C2=A0
> > with only a tiny bit
> > larger refactoring we can do the same optimisation=C2=A0

Well, the commit message does not state which optimization that is. One
would have to look for the previous patch, which you apparently cannot
provide a commit ID for yet because it's not in Big Boss's branch.

In this case I am for including a sentence about what is being
optimized also because

> > on the rq->lock.
> > (Currently both drm_sched_rq_add_entity() and
> > drm_sched_rq_update_fifo_locked() take and release the same lock.)
> >=20
> > To achieve this we make drm_sched_rq_update_fifo_locked() and

it's not clear what the "this" that's being achieved is.

> > drm_sched_rq_add_entity() expect the rq->lock to be held.
> >=20
> > We also align drm_sched_rq_update_fifo_locked(),
> > drm_sched_rq_add_entity() and
> > drm_sched_rq_remove_fifo_locked() function signatures, by adding rq
> > as a
> > parameter to the latter.
> >=20
> > v2:
> > =C2=A0 * Fix after rebase of the series.
> > =C2=A0 * Avoid naming incosistency between drm_sched_rq_add/remove.
> > (Christian)
> >=20
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Philipp Stanner <pstanner@redhat.com>

> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++--
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 29 ++++++++=
++++-------
> > -----
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > =C2=A0 3 files changed, 26 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index d982cebc6bee..8ace1f1ea66b 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -515,9 +515,14 @@ struct drm_sched_job
> > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > =C2=A0=20
> > =C2=A0=C2=A0=09=09next =3D to_drm_sched_job(spsc_queue_peek(&entity-
> > >job_queue));
> > =C2=A0=C2=A0=09=09if (next) {
> > +=09=09=09struct drm_sched_rq *rq;
> > +
> > =C2=A0=C2=A0=09=09=09spin_lock(&entity->lock);
> > -=09=09=09drm_sched_rq_update_fifo_locked(entity,
> > +=09=09=09rq =3D entity->rq;
> > +=09=09=09spin_lock(&rq->lock);
> > +=09=09=09drm_sched_rq_update_fifo_locked(entity,
> > rq,
> > =C2=A0=C2=A0=09=09=09=09=09=09=09next-
> > >submit_ts);
> > +=09=09=09spin_unlock(&rq->lock);
> > =C2=A0=C2=A0=09=09=09spin_unlock(&entity->lock);
> > =C2=A0=C2=A0=09=09}
> > =C2=A0=C2=A0=09}
> > @@ -618,11 +623,14 @@ void drm_sched_entity_push_job(struct
> > drm_sched_job *sched_job)
> > =C2=A0=C2=A0=09=09sched =3D rq->sched;
> > =C2=A0=20
> > =C2=A0=C2=A0=09=09atomic_inc(sched->score);
> > +
> > +=09=09spin_lock(&rq->lock);
> > =C2=A0=C2=A0=09=09drm_sched_rq_add_entity(rq, entity);
> > =C2=A0=20
> > =C2=A0=C2=A0=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > -=09=09=09drm_sched_rq_update_fifo_locked(entity,
> > submit_ts);
> > +=09=09=09drm_sched_rq_update_fifo_locked(entity,
> > rq, submit_ts);
> > =C2=A0=20
> > +=09=09spin_unlock(&rq->lock);
> > =C2=A0=C2=A0=09=09spin_unlock(&entity->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0=09=09drm_sched_wakeup(sched, entity);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 18a952f73ecb..5c83fb92bb89 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -153,17 +153,18 @@ static __always_inline bool
> > drm_sched_entity_compare_before(struct rb_node *a,
> > =C2=A0=C2=A0=09return ktime_before(ent_a->oldest_job_waiting, ent_b-
> > >oldest_job_waiting);
> > =C2=A0 }
> > =C2=A0=20
> > -static inline void drm_sched_rq_remove_fifo_locked(struct
> > drm_sched_entity *entity)
> > +static void drm_sched_rq_remove_fifo_locked(struct

I think the commit message should contain a short sentence about why
you removed the inline.

AKA "As we're at it, remove the inline function specifier from
drm_sched_rq_remove_fifo_locked() because XYZ"


P.

> > drm_sched_entity *entity,
> > +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 struct drm_sched_rq
> > *rq)
> > =C2=A0 {
> > -=09struct drm_sched_rq *rq =3D entity->rq;
> > -
> > =C2=A0=C2=A0=09if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> > =C2=A0=C2=A0=09=09rb_erase_cached(&entity->rb_tree_node, &rq-
> > >rb_tree_root);
> > =C2=A0=C2=A0=09=09RB_CLEAR_NODE(&entity->rb_tree_node);
> > =C2=A0=C2=A0=09}
> > =C2=A0 }
> > =C2=A0=20
> > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > *entity, ktime_t ts)
> > +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > *entity,
> > +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> > +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t ts)
> > =C2=A0 {
> > =C2=A0=C2=A0=09/*
> > =C2=A0=C2=A0=09 * Both locks need to be grabbed, one to protect from
> > entity->rq change
> > @@ -171,17 +172,14 @@ void drm_sched_rq_update_fifo_locked(struct
> > drm_sched_entity *entity, ktime_t ts
> > =C2=A0=C2=A0=09 * other to update the rb tree structure.
> > =C2=A0=C2=A0=09 */
> > =C2=A0=C2=A0=09lockdep_assert_held(&entity->lock);
> > +=09lockdep_assert_held(&rq->lock);
> > =C2=A0=20
> > -=09spin_lock(&entity->rq->lock);
> > -
> > -=09drm_sched_rq_remove_fifo_locked(entity);
> > +=09drm_sched_rq_remove_fifo_locked(entity, rq);
> > =C2=A0=20
> > =C2=A0=C2=A0=09entity->oldest_job_waiting =3D ts;
> > =C2=A0=20
> > -=09rb_add_cached(&entity->rb_tree_node, &entity->rq-
> > >rb_tree_root,
> > +=09rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > =C2=A0=C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compa=
re_before);
> > -
> > -=09spin_unlock(&entity->rq->lock);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -213,15 +211,14 @@ static void drm_sched_rq_init(struct
> > drm_gpu_scheduler *sched,
> > =C2=A0 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > =C2=A0=C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *=
entity)
> > =C2=A0 {
> > +=09lockdep_assert_held(&entity->lock);
> > +=09lockdep_assert_held(&rq->lock);
> > +
> > =C2=A0=C2=A0=09if (!list_empty(&entity->list))
> > =C2=A0=C2=A0=09=09return;
> > =C2=A0=20
> > -=09spin_lock(&rq->lock);
> > -
> > =C2=A0=C2=A0=09atomic_inc(rq->sched->score);
> > =C2=A0=C2=A0=09list_add_tail(&entity->list, &rq->entities);
> > -
> > -=09spin_unlock(&rq->lock);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -235,6 +232,8 @@ void drm_sched_rq_add_entity(struct
> > drm_sched_rq *rq,
> > =C2=A0 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > =C2=A0=C2=A0=09=09=09=09struct drm_sched_entity *entity)
> > =C2=A0 {
> > +=09lockdep_assert_held(&entity->lock);
> > +
> > =C2=A0=C2=A0=09if (list_empty(&entity->list))
> > =C2=A0=C2=A0=09=09return;
> > =C2=A0=20
> > @@ -247,7 +246,7 @@ void drm_sched_rq_remove_entity(struct
> > drm_sched_rq *rq,
> > =C2=A0=C2=A0=09=09rq->current_entity =3D NULL;
> > =C2=A0=20
> > =C2=A0=C2=A0=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > -=09=09drm_sched_rq_remove_fifo_locked(entity);
> > +=09=09drm_sched_rq_remove_fifo_locked(entity, rq);
> > =C2=A0=20
> > =C2=A0=C2=A0=09spin_unlock(&rq->lock);
> > =C2=A0 }
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 80198e6cf537..b21806d5a8eb 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct
> > drm_sched_rq *rq,
> > =C2=A0 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > =C2=A0=C2=A0=09=09=09=09struct drm_sched_entity *entity);
> > =C2=A0=20
> > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > *entity, ktime_t ts);
> > +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > *entity,
> > +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> > ktime_t ts);
> > =C2=A0=20
> > =C2=A0 int drm_sched_entity_init(struct drm_sched_entity *entity,
> > =C2=A0=C2=A0=09=09=09=C2=A0 enum drm_sched_priority priority,
>=20

