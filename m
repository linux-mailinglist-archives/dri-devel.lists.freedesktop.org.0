Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE006B08A4C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 12:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729588FBD;
	Thu, 17 Jul 2025 10:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YVJ6eRz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF88B10E7F1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 10:08:29 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bjTCG6Rvqz9slH;
 Thu, 17 Jul 2025 12:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752746906; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkniIW6itQEmHyxZdcli4mu4iJB8BDUCEml3Ox9YEw0=;
 b=YVJ6eRz9KShz8+M0hohyJXFbl+K5tKsdKOPKoDzuUW7pOBmFoz9NigjkQe00rYsGTaj4k9
 2Ef4lzjzxmf/gIkO2tgJ1PEgSfqo4hBL3hZKL2VjOlS+tk6sozbPUw5YOMqNx29DAbAt0Y
 PzCDOPlwBiy5mqqGhfQ4ppZRi0gs6MKSiQCv18tHEwbfNnY4Ljnav+fcsJpDyBm0vWXsxn
 29DbU7jMh7HNbO/Psu8gfz2eELaNKXC4LgfLnCnVSk41/8t5cMj7K8NosODoSLt66aIctD
 SIV6iPhOxhrRsrllzLV+ZrvmdrKY74TXPaGqvcEDAZU5MB8YGhCMg84OMIKBPA==
Message-ID: <1cf711f37fdb9d5f13b8aa51a2d4993221fcf2e0.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, phasta@kernel.org,
 dakr@kernel.org,  matthew.brost@intel.com
Date: Thu, 17 Jul 2025 12:08:23 +0200
In-Reply-To: <20250717084453.921097-1-lincao12@amd.com>
References: <20250717084453.921097-1-lincao12@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: hoyko6aij4epdu1h1r851d1ghf8y9fhw
X-MBO-RS-ID: d5711be0d4f96444cf2
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

On Thu, 2025-07-17 at 16:44 +0800, Lin.Cao wrote:
> When application A submits jobs and application B submits a job with
> a
> dependency on A's fence, the normal flow wakes up the scheduler after
> processing each job. However, the optimization in
> drm_sched_entity_add_dependency_cb() uses a callback that only clears
> dependencies without waking up the scheduler.
>=20
> When application A is killed before its jobs can run, the callback
> gets
> triggered but only clears the dependency without waking up the
> scheduler,
> causing the scheduler to enter sleep state and application B to hang.
>=20
> Remove the optimization by deleting drm_sched_entity_clear_dep() and
> its
> usage, ensuring the scheduler is always woken up when dependencies
> are
> cleared.
>=20
> Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")
> Cc: stable@vger.kernel.org=C2=A0# v4.6+
>=20
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Applied to drm-misc-fixes, thank you.

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 21 ++-------------------
> =C2=A01 file changed, 2 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index e671aa241720..ac678de7fe5e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct
> drm_sched_entity *entity)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_destroy);
> =C2=A0
> -/* drm_sched_entity_clear_dep - callback to clear the entities
> dependency */
> -static void drm_sched_entity_clear_dep(struct dma_fence *f,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence_cb *cb)
> -{
> -	struct drm_sched_entity *entity =3D
> -		container_of(cb, struct drm_sched_entity, cb);
> -
> -	entity->dependency =3D NULL;
> -	dma_fence_put(f);
> -}
> -
> =C2=A0/*
> =C2=A0 * drm_sched_entity_wakeup - callback to clear the entity's
> dependency and
> =C2=A0 * wake up the scheduler
> @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct
> dma_fence *f,
> =C2=A0	struct drm_sched_entity *entity =3D
> =C2=A0		container_of(cb, struct drm_sched_entity, cb);
> =C2=A0
> -	drm_sched_entity_clear_dep(f, cb);
> +	entity->dependency =3D NULL;
> +	dma_fence_put(f);
> =C2=A0	drm_sched_wakeup(entity->rq->sched);
> =C2=A0}
> =C2=A0
> @@ -429,13 +419,6 @@ static bool
> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> =C2=A0		fence =3D dma_fence_get(&s_fence->scheduled);
> =C2=A0		dma_fence_put(entity->dependency);
> =C2=A0		entity->dependency =3D fence;
> -		if (!dma_fence_add_callback(fence, &entity->cb,
> -					=C2=A0=C2=A0=C2=A0
> drm_sched_entity_clear_dep))
> -			return true;
> -
> -		/* Ignore it when it is already scheduled */
> -		dma_fence_put(fence);
> -		return false;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!dma_fence_add_callback(entity->dependency, &entity->cb,

