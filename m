Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5DB0724F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C016710E76C;
	Wed, 16 Jul 2025 09:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LW6RK0Zj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600D10E76C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bhs1d5YDkz9t4F;
 Wed, 16 Jul 2025 11:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752659877; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9PB+okoslwvOPPVoYXmHY7OWuBWcP9nlkvKKj9rFYU=;
 b=LW6RK0Zjt/KgEhRM7gD2F+HYT7ninEAm8QXSpPYHXLInrjMNcKO1Quuwmbg7eksHhsiu24
 f/JQbmEAO/3Hnid0OV+zjL3elvgOzqOYur5NuakPUtWPUVjicPek/nMWDN8BxyxckUgbar
 yhXnKNYbCfXYMP0Ebt1tEpg2Nr5G6rgvVzu6LyrQrKD3/5QxccuOf6DeBHqjax413qx7dD
 1aqYqMVQMtsK5XlXyNLC11v0np4Vxe46P/VoBaisaz+wqR8/xUSFDapSSKr9HuE2HpFzKC
 1TjucKQEF8LGUaR6rwwO/ydEak1zPA2VBkf6Pp8JZ49X6aahPDwJNlWTBhm3GA==
Message-ID: <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: "cao, lin" <lin.cao@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "phasta@kernel.org" <phasta@kernel.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, 
 "dakr@kernel.org"
 <dakr@kernel.org>, "matthew.brost@intel.com" <matthew.brost@intel.com>
Date: Wed, 16 Jul 2025 11:57:53 +0200
In-Reply-To: <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 3ssxcfez6xocxs66madt3xn4ewxrd6mp
X-MBO-RS-ID: 2b1559834e178d51daf
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

On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
>=20
> [AMD Official Use Only - AMD Internal Distribution Only]
>=20
>=20
>=20
> Hi Philipp,
>=20
>=20
> Thank you for the review. I found that this optimization was
> introduced 9 years ago in commit
> 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu: drop a dummy
> wakeup scheduler").
>=20
>=20
> Given that the=C2=A0codebase has undergone significant changes over these
> 9 years. May I ask if I still need to include the Fixes: tag?

Yes. It's a helpful marker to see where the problem comes from, and it
adds redundancy helping the stable-kernel maintainers in figuring out
to which kernels to backport it to.

If stable can't apply a patch to a very old stable kernel because the
code base changed too much, they'll ping us and we might provide a
dedicated fix.

So like that:

Cc: stable@vger.kernel.org # v4.6+
Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")


P.

>=20
>=20
> Thanks,
> Lin
>=20
>=20
> From: Philipp Stanner <phasta@mailbox.org>
> Sent: Wednesday, July 16, 2025 16:33
> To: cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org
> <dri-devel@lists.freedesktop.org>
> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
> <Emily.Deng@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>;
> phasta@kernel.org <phasta@kernel.org>; dakr@kernel.org
> <dakr@kernel.org>; matthew.brost@intel.com <matthew.brost@intel.com>
> Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang
> when killing dependent jobs
>=20
> =C2=A0
>=20
>=20
> On Tue, 2025-07-15 at 21:50 +0800, Lin.Cao wrote:
> > When application A submits jobs and application B submits a job
> > with
> > a
> > dependency on A's fence, the normal flow wakes up the scheduler
> > after
> > processing each job. However, the optimization in
> > drm_sched_entity_add_dependency_cb() uses a callback that only
> > clears
> > dependencies without waking up the scheduler.
> >=20
> > When application A is killed before its jobs can run, the callback
> > gets
> > triggered but only clears the dependency without waking up the
> > scheduler,
> > causing the scheduler to enter sleep state and application B to
> > hang.
> >=20
> > Remove the optimization by deleting drm_sched_entity_clear_dep()
> > and
> > its
> > usage, ensuring the scheduler is always woken up when dependencies
> > are
> > cleared.
> >=20
> > Signed-off-by: Lin.Cao <lincao12@amd.com>
>=20
> This is, still, a bug fix, so it needs Fixes: and Cc: stable :)
>=20
> Could also include a Suggested-by: Christian
>=20
> P.
>=20
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 21 ++-----------------=
-
> > -
> > =C2=A01 file changed, 2 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index e671aa241720..ac678de7fe5e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct
> > drm_sched_entity *entity)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_sched_entity_destroy);
> > =C2=A0
> > -/* drm_sched_entity_clear_dep - callback to clear the entities
> > dependency */
> > -static void drm_sched_entity_clear_dep(struct dma_fence *f,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fe=
nce_cb *cb)
> > -{
> > -=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity =3D
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 container_of(cb, struct drm_sched_entity, cb);
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0 entity->dependency =3D NULL;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(f);
> > -}
> > -
> > =C2=A0/*
> > =C2=A0 * drm_sched_entity_wakeup - callback to clear the entity's
> > dependency and
> > =C2=A0 * wake up the scheduler
> > @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct
> > dma_fence *f,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity =3D
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 container_of(cb, struct drm_sched_entity, cb);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_clear_dep(f, cb);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 entity->dependency =3D NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_put(f);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_wakeup(entity->rq->sched);
> > =C2=A0}
> > =C2=A0
> > @@ -429,13 +419,6 @@ static bool
> > drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fence =3D dma_fence_get(&s_fence->scheduled);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dma_fence_put(entity->dependency);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 entity->dependency =3D fence;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (!dma_fence_add_callback(fence, &entity->cb,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0
> > drm_sched_entity_clear_dep))
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Ignore it when it is already scheduled */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dma_fence_put(fence);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return false;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dma_fence_add_callback(entity->depe=
ndency, &entity->cb,
>=20

