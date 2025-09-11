Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3222DB53566
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D3F10EB51;
	Thu, 11 Sep 2025 14:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jY6hIv5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712E710EB51;
 Thu, 11 Sep 2025 14:32:18 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cN0Pp64NZz9spR;
 Thu, 11 Sep 2025 16:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1757601134; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEgQa5obCBR8UEm8RmOyIfI3uS01fc9cby+jjpCxmak=;
 b=jY6hIv5ruHCUSYrknVnerxYwYEThmFGDAo8Nn0Ctn/BVdcsrBS8jwiuaU3n4WdUsBHFyH/
 w+AASfrrcxZRNcej5V6dWBNyumDuNmupfxPAaNb3Z52L7baLL2U8R9UU9HJfGoh8iKhRVf
 ioAZV973Cvrqm4tcXSbC8cfBfeN81KAqDTvsA7Op5AhQpeDoq7PrUAneGtYLI9fxZhNjPv
 J/SNFtXW7ls9sRUmLORLYmVmZmu5Xv+WsmIUh2WFczVkz/doUBqDapf6m8LbFGKYBZs/R4
 bld4a0vACVo7EjVMFDNrLa+W84YmS/VU7yM6XT51uuWzp/RXT2PanJYXxKVYNg==
Message-ID: <2f17fb5d359c1ddaf8253454bf0f0d318c90bc8d.camel@mailbox.org>
Subject: Re: [RFC v8 08/12] drm/sched: Remove idle entity from tree
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Date: Thu, 11 Sep 2025 16:32:10 +0200
In-Reply-To: <20250903101820.63032-9-tvrtko.ursulin@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-9-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: zfm3d1aoy6f9d9wu9jyjfj1ai7anrso1
X-MBO-RS-ID: a1637beb3f1dd216233
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

On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> There is no need to keep entities with no jobs in the tree so lets remove
> it once the last job is consumed. This keeps the tree smaller which is
> nicer and more efficient as entities are removed and re-added on every
> popped job.

This reads suspiciously as if it could be an independent patch, not
necessarily tied to this series. I see it depends on the _pop()
function you added.

I think you'd want to make it a bit more obvious that this is not so
much a general improvement as it is a preparation for followup work. Or
could it be made generic for the current in-tree scheduler?

>=20
> Apart from that, the upcoming fair scheduling algorithm will rely on the
> tree only containing runnable entities.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c | 28 +++++++++++++++++--------=
---
> =C2=A01 file changed, 17 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sched=
uler/sched_rq.c
> index 16d57461765e..67804815ca0d 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -19,6 +19,9 @@ drm_sched_entity_compare_before(struct rb_node *a, cons=
t struct rb_node *b)
> =C2=A0static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity=
 *entity,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> =C2=A0{
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);

The callers of drm_sched_rq_remove_fifo_locked() already have some
lockdep asserts, have you seen them? Are those here redundant /
additional?

And are they strictly related to this patch?

Maybe you want to investigate the other lockdep assertions and, if
there's room for improvement, address that in a dedicated patch.


P.

> +
> =C2=A0	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> =C2=A0		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> =C2=A0		RB_CLEAR_NODE(&entity->rb_tree_node);
> @@ -158,24 +161,27 @@ void drm_sched_rq_pop_entity(struct drm_sched_entit=
y *entity)
> =C2=A0{
> =C2=A0	struct drm_sched_job *next_job;
> =C2=A0	struct drm_sched_rq *rq;
> -	ktime_t ts;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Update the entity's location in the min heap according to
> =C2=A0	 * the timestamp of the next job, if any.
> =C2=A0	 */
> +	spin_lock(&entity->lock);
> +	rq =3D entity->rq;
> +	spin_lock(&rq->lock);
> =C2=A0	next_job =3D drm_sched_entity_queue_peek(entity);
> -	if (!next_job)
> -		return;
> +	if (next_job) {
> +		ktime_t ts;
> =C2=A0
> -	spin_lock(&entity->lock);
> -	rq =3D entity->rq;
> -	spin_lock(&rq->lock);
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -		ts =3D next_job->submit_ts;
> -	else
> -		ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> +			ts =3D next_job->submit_ts;
> +		else
> +			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> +
> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	} else {
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
> +	}
> =C2=A0	spin_unlock(&rq->lock);
> =C2=A0	spin_unlock(&entity->lock);
> =C2=A0}

