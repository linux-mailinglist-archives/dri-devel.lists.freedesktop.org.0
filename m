Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2760D986E9E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DCD10EB06;
	Thu, 26 Sep 2024 08:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FxWS3k+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE71710EB06
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727338691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ve5Ra3/aIru4oDwkyvdf3f2MzOAHWwI1r+VGHG3bK8o=;
 b=FxWS3k+zNN6of9verLfk52tvFAp52qyTqqQW4cSrz2q6PLrI4YYNRa0WpoECSaElK70VmC
 p0ICQzDd9fyZRENXssKMKrbept3T07xTd8Jh3vJzn3vn5zxwFSc4PYHHtzn3aNG6+q03gX
 iXp46KMPkoUHVPB0QtLSmB5sgku29pQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-m6tZZ2L_NrOehNyFInhn8Q-1; Thu, 26 Sep 2024 04:18:09 -0400
X-MC-Unique: m6tZZ2L_NrOehNyFInhn8Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374c90d24e3so381608f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727338688; x=1727943488;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DccLXcOI6pFlXQmAjJQoc7QpiZio5D6THMmCqnyD/aU=;
 b=bT4u5E83p3l55f0k9bkdVW8s05r/EPeISTibmvHb54hCu/pN0eJL4+J8l+xDbeVNIf
 vydSD9mAbqvc6pD3o8Jq8hHipJLUS+o5CLxyG4N9LU3CZ9/R2bu9inZ0932Xk1YRONuQ
 waS/FW8ZVqrBbzr7D2EQvB7o374YeD54BEu20kDKZvd1L0rQ6B8ZprWh3KJfvv5LwCh7
 Saoz5+mycfiHu5BIbn1OdDFmaXwz2fonE3+AE5eV2eyjr9kof0wJLoZb94TJhIQDKKwh
 yfQbySNodmAf9AmLO3jYGpSdL07tkGVDR1dOkZxUkCkCQl/tLWj7f3nSkiBCCwIMFuu1
 ph6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKdbLbBljGfw9S9stoiV+QGK/I2xXhCrhdaezOx0LHwXALAGqPaUv2OwjuxHBP7YY91gFESTf/DYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjfwoaI4spoPM1pMgdad6HOJiFN3Dwss/MWMgJ/6fUa/OwCRBU
 8/J6tjxhu9foWqz8Tw9vu0owt795SyhWe9Gt9Hqxr9pvdvfzBeqToiqNVlVH4lB61lmGcexknfB
 OXD9OSrZ5wtVgELoV7pSddUT9FBZT4gWQChom7wIYYq1uqmJkjOgeslyR1cIHDEjDew==
X-Received: by 2002:a05:6000:2a88:b0:37c:c4c0:9b78 with SMTP id
 ffacd0b85a97d-37cc4c09c4dmr5734533f8f.48.1727338688254; 
 Thu, 26 Sep 2024 01:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdUvNFDNgjJN1IFB145tpazQRP9PYmVvXgM4aUuxRMfCIEIlADqiOxqvItdNypVUy4tY4wOA==
X-Received: by 2002:a05:6000:2a88:b0:37c:c4c0:9b78 with SMTP id
 ffacd0b85a97d-37cc4c09c4dmr5734489f8f.48.1727338687736; 
 Thu, 26 Sep 2024 01:18:07 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dee:bc00:37ec:5f5c:23da:fb5f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2c139esm5772591f8f.27.2024.09.26.01.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:18:07 -0700 (PDT)
Message-ID: <9ce9169b453a5cce8e276b88defb1995a6006a15.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sched: Further optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 26 Sep 2024 10:18:06 +0200
In-Reply-To: <657ad50f-5458-4477-a348-5869c0282e35@gmail.com>
References: <20240913160559.49054-9-tursulin@igalia.com>
 <20240916173007.118-1-tursulin@igalia.com>
 <478b066b-af6c-43a2-9e0e-a19344893bc0@gmail.com>
 <dfec609d-bbf8-4b6e-ad26-84e869694acc@igalia.com>
 <2ad66742-f572-4edc-957c-fcbd8c5a5917@igalia.com>
 <657ad50f-5458-4477-a348-5869c0282e35@gmail.com>
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

On Tue, 2024-09-24 at 14:02 +0200, Christian K=C3=B6nig wrote:
> Am 24.09.24 um 11:58 schrieb Tvrtko Ursulin:
> >=20
> > On 24/09/2024 10:45, Tvrtko Ursulin wrote:
> > >=20
> > > On 24/09/2024 09:20, Christian K=C3=B6nig wrote:
> > > > Am 16.09.24 um 19:30 schrieb Tvrtko Ursulin:
> > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > >=20
> > > > > Having removed one re-lock cycle on the entity->lock in a
> > > > > patch titled
> > > > > "drm/sched: Optimise drm_sched_entity_push_job", with only a
> > > > > tiny bit
> > > > > larger refactoring we can do the same optimisation on the rq-
> > > > > >lock.
> > > > > (Currently both drm_sched_rq_add_entity() and
> > > > > drm_sched_rq_update_fifo_locked() take and release the same
> > > > > lock.)
> > > > >=20
> > > > > To achieve this we make drm_sched_rq_update_fifo_locked() and
> > > > > drm_sched_rq_add_entity() expect the rq->lock to be held.
> > > > >=20
> > > > > We also align drm_sched_rq_update_fifo_locked(),
> > > > > drm_sched_rq_add_entity() and
> > > > > drm_sched_rq_remove_fifo_locked() function signatures, by
> > > > > adding rq=20
> > > > > as a
> > > > > parameter to the latter.
> > > > >=20
> > > > > v2:
> > > > > =C2=A0 * Fix after rebase of the series.
> > > > > =C2=A0 * Avoid naming incosistency between
> > > > > drm_sched_rq_add/remove.=20
> > > > > (Christian)
> > > > >=20
> > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > >=20
> > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >=20
> > > Thanks!
> > >=20
> > > Are you okay to pull into drm-misc-next or we should do some more
> > > testing on this?
> > >=20
> > > And/or should I resend the series once more in it's entirety so
> > > this=20
> > > v2 is not a reply-to to the original?
> >=20
> > I have to respin for the drm_sched_wakeup fix that landed.
>=20
> When I should push the series to drm-misc-next then please send it to
> me=20
> once more.
>=20
> On the other hand we should now have to maintainers for that.

Yup, will pick up this responsibilities soonish. Danilo and I have been
on conference recently and I'm out of office soon for a bit, but you
can expect me / us to take over that work soonish in early autumn.

Regards,
P.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > >=20
> > > > > ---
> > > > > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++--
> > > > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 29=20
> > > > > ++++++++++++------------
> > > > > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > > > =C2=A0 3 files changed, 26 insertions(+), 18 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c=20
> > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > index d982cebc6bee..8ace1f1ea66b 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > @@ -515,9 +515,14 @@ struct drm_sched_job=20
> > > > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 next =3D=
=20
> > > > > to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (next) =
{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct drm_sched_rq *rq;
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 spin_lock(&entity->lock);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_sched_rq_update_fifo_locked(entity,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 rq =3D entity->rq;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spin_lock(&rq->lock);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_sched_rq_update_fifo_locked(entity, rq,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 next->submit_ts);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spin_unlock(&rq->lock);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 spin_unlock(&entity->lock);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > @@ -618,11 +623,14 @@ void drm_sched_entity_push_job(struct=20
> > > > > drm_sched_job *sched_job)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched =3D =
rq->sched;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc=
(sched->score);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&rq->lock);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_=
rq_add_entity(rq, entity);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sc=
hed_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_sched_rq_update_fifo_locked(entity,
> > > > > submit_ts);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_sched_rq_update_fifo_locked(entity, rq,
> > > > > submit_ts);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&rq->lock=
);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unloc=
k(&entity->lock);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_=
wakeup(sched, entity);
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c=20
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 18a952f73ecb..5c83fb92bb89 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -153,17 +153,18 @@ static __always_inline bool=20
> > > > > drm_sched_entity_compare_before(struct rb_node *a,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ktime_before(ent_a->oldest_=
job_waiting,=20
> > > > > ent_b->oldest_job_waiting);
> > > > > =C2=A0 }
> > > > > -static inline void drm_sched_rq_remove_fifo_locked(struct=20
> > > > > drm_sched_entity *entity)
> > > > > +static void drm_sched_rq_remove_fifo_locked(struct=20
> > > > > drm_sched_entity *entity,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 struct drm_sched_rq *rq)
> > > > > =C2=A0 {
> > > > > -=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq =3D entity->rq;
> > > > > -
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!RB_EMPTY_NODE(&entity->rb_tre=
e_node)) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rb_erase_c=
ached(&entity->rb_tree_node, &rq-
> > > > > >rb_tree_root);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RB_CLEAR_N=
ODE(&entity->rb_tree_node);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0 }
> > > > > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > > > > *entity, ktime_t ts)
> > > > > +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > > > > *entity,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_=
rq *rq,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t ts)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Both locks need to be grab=
bed, one to protect from=20
> > > > > entity->rq change
> > > > > @@ -171,17 +172,14 @@ void
> > > > > drm_sched_rq_update_fifo_locked(struct=20
> > > > > drm_sched_entity *entity, ktime_t ts
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * other to update the rb tre=
e structure.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lockdep_assert_held(&entity->lock)=
;
> > > > > +=C2=A0=C2=A0=C2=A0 lockdep_assert_held(&rq->lock);
> > > > > -=C2=A0=C2=A0=C2=A0 spin_lock(&entity->rq->lock);
> > > > > -
> > > > > -=C2=A0=C2=A0=C2=A0 drm_sched_rq_remove_fifo_locked(entity);
> > > > > +=C2=A0=C2=A0=C2=A0 drm_sched_rq_remove_fifo_locked(entity, rq);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->oldest_job_waiting =3D ts;
> > > > > -=C2=A0=C2=A0=C2=A0 rb_add_cached(&entity->rb_tree_node, &entity-=
>rq-
> > > > > >rb_tree_root,
> > > > > +=C2=A0=C2=A0=C2=A0 rb_add_cached(&entity->rb_tree_node, &rq->rb_=
tree_root,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
> > > > > -
> > > > > -=C2=A0=C2=A0=C2=A0 spin_unlock(&entity->rq->lock);
> > > > > =C2=A0 }
> > > > > =C2=A0 /**
> > > > > @@ -213,15 +211,14 @@ static void drm_sched_rq_init(struct=20
> > > > > drm_gpu_scheduler *sched,
> > > > > =C2=A0 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *enti=
ty)
> > > > > =C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0 lockdep_assert_held(&entity->lock);
> > > > > +=C2=A0=C2=A0=C2=A0 lockdep_assert_held(&rq->lock);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!list_empty(&entity->list))
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > > -=C2=A0=C2=A0=C2=A0 spin_lock(&rq->lock);
> > > > > -
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc(rq->sched->score);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_add_tail(&entity->list, &rq->=
entities);
> > > > > -
> > > > > -=C2=A0=C2=A0=C2=A0 spin_unlock(&rq->lock);
> > > > > =C2=A0 }
> > > > > =C2=A0 /**
> > > > > @@ -235,6 +232,8 @@ void drm_sched_rq_add_entity(struct=20
> > > > > drm_sched_rq *rq,
> > > > > =C2=A0 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity)
> > > > > =C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0 lockdep_assert_held(&entity->lock);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (list_empty(&entity->list))
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > > @@ -247,7 +246,7 @@ void drm_sched_rq_remove_entity(struct=20
> > > > > drm_sched_rq *rq,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->curren=
t_entity =3D NULL;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_policy =3D=3D DRM_SC=
HED_POLICY_FIFO)
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_rq_remove_f=
ifo_locked(entity);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_rq_remove_f=
ifo_locked(entity, rq);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&rq->lock);
> > > > > =C2=A0 }
> > > > > diff --git a/include/drm/gpu_scheduler.h
> > > > > b/include/drm/gpu_scheduler.h
> > > > > index 80198e6cf537..b21806d5a8eb 100644
> > > > > --- a/include/drm/gpu_scheduler.h
> > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > @@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct=20
> > > > > drm_sched_rq *rq,
> > > > > =C2=A0 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity);
> > > > > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > > > > *entity, ktime_t ts);
> > > > > +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > > > > *entity,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_=
rq *rq, ktime_t ts);
> > > > > =C2=A0 int drm_sched_entity_init(struct drm_sched_entity *entity,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum drm_sched_priority priority,
> > > >=20
>=20

