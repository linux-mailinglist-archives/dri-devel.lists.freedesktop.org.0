Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64426B990E0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD95A10E054;
	Wed, 24 Sep 2025 09:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yXCx/zmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5352210E054;
 Wed, 24 Sep 2025 09:15:32 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWrmK2964z9tNG;
 Wed, 24 Sep 2025 11:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758705329; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wz9VSiw84Gb9ITat48zhk6mySy+psZM1pGMpz6jS1aE=;
 b=yXCx/zmWJci5OWqCsQ4EHyrBGXg0DvCSFIxERngjDcjrVHwUd1zFaZeYNSGT6bymCVeEO5
 Sc96eZpsgG5NAxiHdKinIl2HirI6WxVfNWm6e/oGCmU5LdO2EC0F6qwXmTd+ZH8QDn6wkJ
 MT3gX0K9lv3Uj8KI2IYUhoQ5HqqOSdVuzy8ZkTPRtQB9pFt7Hjjw8H70PQXNqT8ukxuOJc
 1SrAKqV1NoxQ9VTo/wsZJSkDEnaQFuqt1oDOkgzZXTkrgyzZVdPjLAujc1oqOQJpDVuK0t
 0zZgYfvkYxgHcJx+aNYeFMwoLxjij3TGL0rSPJ+0J2cv2rH+/Opra8obsKKYBw==
Message-ID: <6cbf38c0035feec1cfba3a2040556e6e0a1f024f.camel@mailbox.org>
Subject: Re: [RFC v8 08/12] drm/sched: Remove idle entity from tree
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Date: Wed, 24 Sep 2025 11:15:24 +0200
In-Reply-To: <2e18f226-068c-4986-b203-144b6bdb0a7f@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-9-tvrtko.ursulin@igalia.com>
 <2f17fb5d359c1ddaf8253454bf0f0d318c90bc8d.camel@mailbox.org>
 <2e18f226-068c-4986-b203-144b6bdb0a7f@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: btxiddx7p9k3b3ws5duydtw7i58ugn1o
X-MBO-RS-ID: 4eba195b4b6f19efa7a
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

On Thu, 2025-09-11 at 16:06 +0100, Tvrtko Ursulin wrote:
>=20
> On 11/09/2025 15:32, Philipp Stanner wrote:
> > On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> > > There is no need to keep entities with no jobs in the tree so lets re=
move
> > > it once the last job is consumed. This keeps the tree smaller which i=
s
> > > nicer and more efficient as entities are removed and re-added on ever=
y
> > > popped job.
> >=20
> > This reads suspiciously as if it could be an independent patch, not
> > necessarily tied to this series. I see it depends on the _pop()
> > function you added.
> >=20
> > I think you'd want to make it a bit more obvious that this is not so
> > much a general improvement as it is a preparation for followup work. Or
> > could it be made generic for the current in-tree scheduler?
>=20
> Both is true. There is currently no reason idle entities _need_ to be in=
=20
> the tree. Removing them would improve O(log n) on the rbtree. But also=
=20
> fair scheduler relies on it, see below...
>=20
> > > Apart from that, the upcoming fair scheduling algorithm will rely on =
the
> > > tree only containing runnable entities.
>=20
> ... ^^^ here.

Yes, I saw that.

I wanted to stress where I'm coming from: generic code improvements
should ideally be posted as separate patches, because that makes it
easier to review and quicker to merge (and easier to revert should a
problem be detected before the subsequent CFS series is merged)

So, can you submit this patch separately without too much effort? :)

>=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_rq.c | 28 +++++++++++++++=
++-----------
> > > =C2=A0=C2=A01 file changed, 17 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/s=
cheduler/sched_rq.c
> > > index 16d57461765e..67804815ca0d 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_rq.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> > > @@ -19,6 +19,9 @@ drm_sched_entity_compare_before(struct rb_node *a, =
const struct rb_node *b)
> > > =C2=A0=C2=A0static void drm_sched_rq_remove_fifo_locked(struct drm_sc=
hed_entity *entity,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> > > =C2=A0=C2=A0{
> > > +	lockdep_assert_held(&entity->lock);
> > > +	lockdep_assert_held(&rq->lock);
> >=20
> > The callers of drm_sched_rq_remove_fifo_locked() already have some
> > lockdep asserts, have you seen them? Are those here redundant /
> > additional?
> >=20
> > And are they strictly related to this patch?
>=20
> Yes, drm_sched_rq_pop_entity() is the new caller, which needs to take
> both locks on its own. So IMO makes sense to add the asserts.
>=20
> > Maybe you want to investigate the other lockdep assertions and, if
> > there's room for improvement, address that in a dedicated patch.
>=20
> They look okay to me. Are you seeing something is off?

No, they do look correct. It's just that we have a bit of redundancy
then, but that's probably a good thing for robustness.

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > +
> > > =C2=A0=C2=A0	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> > > =C2=A0=C2=A0		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_roo=
t);
> > > =C2=A0=C2=A0		RB_CLEAR_NODE(&entity->rb_tree_node);
> > > @@ -158,24 +161,27 @@ void drm_sched_rq_pop_entity(struct drm_sched_e=
ntity *entity)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct drm_sched_job *next_job;
> > > =C2=A0=C2=A0	struct drm_sched_rq *rq;
> > > -	ktime_t ts;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * Update the entity's location in the min heap accordin=
g to
> > > =C2=A0=C2=A0	 * the timestamp of the next job, if any.
> > > =C2=A0=C2=A0	 */
> > > +	spin_lock(&entity->lock);
> > > +	rq =3D entity->rq;
> > > +	spin_lock(&rq->lock);
> > > =C2=A0=C2=A0	next_job =3D drm_sched_entity_queue_peek(entity);
> > > -	if (!next_job)
> > > -		return;
> > > +	if (next_job) {
> > > +		ktime_t ts;
> > > =C2=A0=20
> > > -	spin_lock(&entity->lock);
> > > -	rq =3D entity->rq;
> > > -	spin_lock(&rq->lock);
> > > -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > -		ts =3D next_job->submit_ts;
> > > -	else
> > > -		ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> > > -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > +			ts =3D next_job->submit_ts;
> > > +		else
> > > +			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> > > +
> > > +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > +	} else {
> > > +		drm_sched_rq_remove_fifo_locked(entity, rq);
> > > +	}
> > > =C2=A0=C2=A0	spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0	spin_unlock(&entity->lock);
> > > =C2=A0=C2=A0}
> >=20
>=20

