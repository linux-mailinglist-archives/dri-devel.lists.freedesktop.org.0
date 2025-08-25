Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D6B34072
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 15:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1821410E25F;
	Mon, 25 Aug 2025 13:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IcuRpTvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210F010E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 13:13:56 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c9WTF0FkHz9tCT;
 Mon, 25 Aug 2025 15:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756127633; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JH3NDF6p/5eXjkoYcAAQpi+Uhvkn3l8np9GIYi07vUg=;
 b=IcuRpTvhvOpk0HGLV5WWCm8ZQ6j5PATJBeLHwiyCXWvQrYlyVQAjRiNdjSDFBi0aQ6nUGS
 3zkCssThuRjw2xZAFkcunMAkDSS1Di+vy/lR1Qb4DA6cEtIHWy8FquSwpF9ViFR5erNZpy
 TceEAV6JdpGm7kQqYDnEPaMquHro7modne+UpGCoVPhmPSL8JB23SrXq6i7tFFhiuuM2wA
 ASriA8MkjXn+/Ho3K6xQESHK4y5CpyKWivjri7hhKZLm5gEYLSYSYD0L4f0MXbo9GyveOD
 Ysj5mMNZDF0AumB5AdhtcWHcEV3p28WuqRBL/1tac4a8of4/WEK0W1Rb0gW//g==
Message-ID: <9b68898ca34483b52d7f4510747a20bce52751c7.camel@mailbox.org>
Subject: Re: [PATCH v1 2/2] drm/sched: limit sched score update to jobs change
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 25 Aug 2025 15:13:47 +0200
In-Reply-To: <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 6db2928092c34427ff6
X-MBO-RS-META: ggyzgztifobbat95zdyt59uu3hig8uxy
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

On Fri, 2025-08-22 at 15:43 +0200, Pierre-Eric Pelloux-Prayer wrote:
> Currently, the scheduler score is incremented when a job is pushed to an
> entity and when an entity is attached to the scheduler.

It's indeed awkward why attaching is treated equivalently to job
submission.

Can you expand the documentation for drm_sched_init_args a bit so that
it gets clearer what the score is supposed to do?

>=20
> This leads to some bad scheduling decision where the score value is
> largely made of idle entities.
>=20
> For instance, a scenario with 2 schedulers and where 10 entities submit
> a single job, then do nothing, each scheduler will probably end up with
> a score of 5.
> Now, 5 userspace apps exit, so their entities will be dropped.=C2=A0
>=20

"entities will be dropped" =3D=3D "drm_sched_entity_kill() gets called",
right?

> In
> the worst case, these apps' entities where all attached to the same

s/where/were

or better yet: "could be"

> scheduler and we end up with score=3D5 (the 5 remaining entities) and
> score=3D0, despite the 2 schedulers being idle.

Sounds indeed like a (small) problem to me.


> When new entities show up, they will all select the second scheduler
> based on its low score value, instead of alternating between the 2.
>=20
> Some amdgpu rings depended on this feature, but the previous commit
> implemented the same thing in amdgpu directly so it can be safely
> removed from drm/sched.

Can we be that sure that other drivers don't depend on it, though? I
suspect it's likely that it's just amdgpu, but=E2=80=A6



BTW, since you're cleaning up related stuff currently: I saw that it
seems that the only driver that sets &struct drm_sched_init_args.score
is amdgpu. Would be cool if you can take a look whether that's still
needed.


P.

>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 5a550fd76bf0..e6d232a8ec58 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> =C2=A0	if (!list_empty(&entity->list))
> =C2=A0		return;
> =C2=A0
> -	atomic_inc(rq->sched->score);
> =C2=A0	list_add_tail(&entity->list, &rq->entities);
> =C2=A0}
> =C2=A0
> @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *=
rq,
> =C2=A0
> =C2=A0	spin_lock(&rq->lock);
> =C2=A0
> -	atomic_dec(rq->sched->score);
> =C2=A0	list_del_init(&entity->list);
> =C2=A0
> =C2=A0	if (rq->current_entity =3D=3D entity)

