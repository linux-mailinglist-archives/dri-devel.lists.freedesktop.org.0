Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD1D1A1EB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0543A10E35C;
	Tue, 13 Jan 2026 16:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JuCT79Bt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9F610E35C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:12:49 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4drDmZ0SPKz9v6q;
 Tue, 13 Jan 2026 17:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1768320766; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++IIcqlaEoZJM3Hz9MWIsx4ZrGB8G0F7rnOpzvTBjso=;
 b=JuCT79Bt5OOXlRqEjCLsCW2Z2Cq9sIWlixajjrDh0F+hDqoBTQjU6tiM/jelLGlFstRBE7
 9u/Vhke7s4RyZZD6eu25dHg5/lKZEjI0o6WF2e6Bf7JiQFbWbu/ss+NZ0ICV2CNJ92IjSt
 SqN6lF3wAlWEBuk3svemYvWKvYQcafbT+vJ6RoBCZc+o2O1gtidRnqHgMqpRyKN6McTCer
 ix9YxTMa+x4J0Do6gn9GI8ir8TwZ63Kt40BydlS5bE6JYWltOBwxMfBpBti9Uf5gYE4GJJ
 Ycp71bjzuMmWhj66DB6ugXJDO1c4Z02yZnmQPyYYEas5kvznP0ZMy3N5ruX0ag==
Message-ID: <c8c362d73d4f2cff9be685184186a6f3368939f1.camel@mailbox.org>
Subject: Re: [PATCH 10/10] drm/sched: use inline locks for the
 drm-sched-fence v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tursulin@ursulin.net, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Tue, 13 Jan 2026 17:12:42 +0100
In-Reply-To: <20260113152125.47380-11-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-11-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1ec9d3404e01e591d37
X-MBO-RS-META: zku5yur77qa4jwpt5is53pctgzetbqac
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

On Tue, 2026-01-13 at 16:16 +0100, Christian K=C3=B6nig wrote:
> Using the inline lock is now the recommended way for dma_fence implementa=
tions.
>=20
> For the scheduler fence use the inline lock for the scheduled fence part
> and then the lock from the scheduled fence as external lock for the finis=
hed fence.
>=20
> This way there is no functional difference, except for saving the space
> for the separate lock.
>=20
> v2: re-work the patch to avoid any functional difference

*cough cough*

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c | 6 +++---
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ----
> =C2=A02 files changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/sc=
heduler/sched_fence.c
> index 724d77694246..112677231f9a 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct =
drm_sched_entity *entity,
> =C2=A0
> =C2=A0	fence->owner =3D owner;
> =C2=A0	fence->drm_client_id =3D drm_client_id;
> -	spin_lock_init(&fence->lock);
> =C2=A0
> =C2=A0	return fence;
> =C2=A0}
> @@ -230,9 +229,10 @@ void drm_sched_fence_init(struct drm_sched_fence *fe=
nce,
> =C2=A0	fence->sched =3D entity->rq->sched;
> =C2=A0	seq =3D atomic_inc_return(&entity->fence_seq);
> =C2=A0	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_conte=
xt, seq);
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, entity->fence_context, seq)=
;
> =C2=A0	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_conte=
xt + 1, seq);
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_spinlock(&fence->schedu=
led),

I think while you are correct that this is no functional difference, it
is still a bad idea which violates the entire idea of your series:

All fences are now independent from each other and the fence context =E2=80=
=93
except for those two.

Some fences are more equal than others ;)

By implementing this, you would also show to people browsing the code
that it can be a good idea or can be done to have fences share locks.
Do you want that?

As far as I have learned from you and our discussions, that would be a
very bombastic violation of the sacred "dma-fence-rules".

I believe it's definitely worth sacrificing some bytes so that those
two fences get fully decoupled. Who will have it on their radar that
they are special? Think about future reworks.


Besides that, no objections from my side.


P.

> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity->fence_context + 1, seq);
> =C2=A0}
> =C2=A0
> =C2=A0module_init(drm_sched_fence_slab_init);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 78e07c2507c7..ad3704685163 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -297,10 +297,6 @@ struct drm_sched_fence {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * belongs to.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0	struct drm_gpu_scheduler	*sched;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @lock: the lock used =
by the scheduled and the finished fences.
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -	spinlock_t			lock;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @owner: job owne=
r for debugging
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */

