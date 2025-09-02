Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47392B3F551
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B4D10E595;
	Tue,  2 Sep 2025 06:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jXBo7p4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE1210E5A2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:21:32 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cGFxj4xgTz9tcV;
 Tue,  2 Sep 2025 08:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756794089; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDU8VIQ6SobHvzSlfhP+Kl00GVG7uP7EX/bvCh9vkOQ=;
 b=jXBo7p4qp33hbbcf3p18oyC1hZ2sAcHGykqGpJwqK4+OXVlVnaif30ej2h2EjfiW0zTqPC
 arTWtWGIsYOPYVXBNBMQBin4BcfEykvVIY1uFu5Bk0u3oV2vnoV+G3La+D5hokty1Vybyq
 e4zB1ABK2Bp9QgnQGj5BOM82xb1JrB434pr8HeQi+ciJIW8YEe5QLVSRuaHN4Fis4rbHY6
 pGEWvqGWze6NyGC4kMnSQkp1sTLm01QnY7XeWSw5ym/GJ2fw3CWo6Af2xLAyDeVAR5EUgF
 UEHdXM6Xw+pFkHW1waYsaG5nSP/ytT6nBLsz8DK0oPKSU5D7VPblg4MFs0NkKA==
Message-ID: <d2cda90644e717a781b98a90b85b1464cbd0b11e.camel@mailbox.org>
Subject: Re: [PATCH v1 2/2] drm/sched: limit sched score update to jobs change
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, phasta@kernel.org, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 02 Sep 2025 08:21:25 +0200
In-Reply-To: <b1a8f459-93dd-4b6c-b29e-c68fba19f6fc@damsy.net>
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
 <9b68898ca34483b52d7f4510747a20bce52751c7.camel@mailbox.org>
 <b1a8f459-93dd-4b6c-b29e-c68fba19f6fc@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8d19b804591be1ca437
X-MBO-RS-META: x7qorwjpbq8ntcegqsedzanb697ym7mr
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

On Mon, 2025-09-01 at 15:14 +0200, Pierre-Eric Pelloux-Prayer wrote:
>=20
>=20
> Le 25/08/2025 =C3=A0 15:13, Philipp Stanner a =C3=A9crit=C2=A0:
> > On Fri, 2025-08-22 at 15:43 +0200, Pierre-Eric Pelloux-Prayer wrote:
> > > Currently, the scheduler score is incremented when a job is pushed to=
 an
> > > entity and when an entity is attached to the scheduler.
> >=20
> > It's indeed awkward why attaching is treated equivalently to job
> > submission.
> >=20
> > Can you expand the documentation for drm_sched_init_args a bit so that
> > it gets clearer what the score is supposed to do?
>=20
>=20
> drm_sched_init_args.score is the feature allowing multiple schedulers to =
share a=20
> score so I suppose you meant drm_gpu_scheduler.score?

I mean both.

struct drm_sched_init_args has a @score which is passed by the driver
during init and will then be stored in drm_gpu_scheduler.score

The docu should be improved for both.

>=20
> The doc currently says "score to help loadbalancer pick a idle sched" whi=
ch is a=20
> bit vague. It could be modified to become:
>=20
> =C2=A0=C2=A0 @score: holds the number of yet-to-be-completed jobs pushed =
to each scheduler.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It's used wh=
en load balancing between different schedulers.

"to each scheduler" reads a bit as if each scheduler has an individual
score. Is it used that way, though? I think it's a pointer because all
schedulers share this atomic. Thus, it "holds the total number of yet-
to-be-completed jobs for all schedulers sharing this atomic", right?

>=20
> What do you think?
>=20
> >=20
> > >=20
> > > This leads to some bad scheduling decision where the score value is
> > > largely made of idle entities.
> > >=20
> > > For instance, a scenario with 2 schedulers and where 10 entities subm=
it
> > > a single job, then do nothing, each scheduler will probably end up wi=
th
> > > a score of 5.
> > > Now, 5 userspace apps exit, so their entities will be dropped.
> > >=20
> >=20
> > "entities will be dropped" =3D=3D "drm_sched_entity_kill() gets called"=
,
> > right?
>=20
> Yes.

then nit: better say "their entities will be killed" instead of
dropped.

>=20
> > > In
> > > the worst case, these apps' entities where all attached to the same
> >=20
> > s/where/were
> >=20
> > or better yet: "could be"
>=20
> Will fix, thanks.
>=20
> >=20
> > > scheduler and we end up with score=3D5 (the 5 remaining entities) and
> > > score=3D0, despite the 2 schedulers being idle.
> >=20
> > Sounds indeed like a (small) problem to me.
> >=20
> >=20
> > > When new entities show up, they will all select the second scheduler
> > > based on its low score value, instead of alternating between the 2.
> > >=20
> > > Some amdgpu rings depended on this feature, but the previous commit
> > > implemented the same thing in amdgpu directly so it can be safely
> > > removed from drm/sched.
> >=20
> > Can we be that sure that other drivers don't depend on it, though? I
> > suspect it's likely that it's just amdgpu, but=E2=80=A6
> >=20
>=20
> Aside from the new "rocket" as pointed out by Tvrtko, amdgpu is the only =
driver=20
> passing more than one schedulers to entities so they're the only ones tha=
t could=20
> be affected.
>=20
> I verified amdgpu and Tvrtko pinged the rocket maintainers in the other t=
hread.

Very good! Then let's give those guys a few days to jump into the
discussion.

>=20
> >=20
> >=20
> > BTW, since you're cleaning up related stuff currently: I saw that it
> > seems that the only driver that sets &struct drm_sched_init_args.score
> > is amdgpu. Would be cool if you can take a look whether that's still
> > needed.
>=20
> It cannot really be removed yet as it's useful when a single hardware blo=
ck is=20
> exposed through different schedulers (so pushing jobs to one of the sched=
ulers=20
> should increase the load of the underlying hw).

OK.


Thx
P.

>=20
> Thanks,
> Pierre-Eric
>=20
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c | 2 --
> > > =C2=A0=C2=A01 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index 5a550fd76bf0..e6d232a8ec58 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq =
*rq,
> > > =C2=A0=C2=A0	if (!list_empty(&entity->list))
> > > =C2=A0=C2=A0		return;
> > > =C2=A0=20
> > > -	atomic_inc(rq->sched->score);
> > > =C2=A0=C2=A0	list_add_tail(&entity->list, &rq->entities);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_=
rq *rq,
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_lock(&rq->lock);
> > > =C2=A0=20
> > > -	atomic_dec(rq->sched->score);
> > > =C2=A0=C2=A0	list_del_init(&entity->list);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (rq->current_entity =3D=3D entity)

