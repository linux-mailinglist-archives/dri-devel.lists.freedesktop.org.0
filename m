Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6DFD21844
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 23:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB5F10E22E;
	Wed, 14 Jan 2026 22:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c7dgPg5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DD410E067;
 Wed, 14 Jan 2026 22:13:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77CF86000A;
 Wed, 14 Jan 2026 22:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90761C4CEF7;
 Wed, 14 Jan 2026 22:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768428795;
 bh=xeTlDJFA/oc4rEjjPKZBVexQL+Lj5Uf/PxukPaEFXdA=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=c7dgPg5AoyfVu6/86FUmy5+k+lrV7WmkHnR2LvKYPMFpZYonQztG725pVcpvGdjAR
 ayyrExaibEdZ4NFO5OSgRjR0bGbqplI38wStyRalWz8wR6yLL6vkZ2oVIblxPPfj9l
 jRP3Q9hAbOLsdzQR5ZXwK8NfCRrl1S6h7fsaaFFtfUlAPlD9qNqX9Ni6oN9mW/BSjz
 mE/v0Paeb6o4MPP1Vf/OshKJqAtCRH4zEX4OuvY5ydoIKD4E/x7U+HKBa2K1u1UaZy
 JKSz8UNkGbm0Ad0BPuQG/2axj5CxBwhJk5FWMEOJ5W3KprzsCVbiLpB2QFNqq5VJ0W
 DM6YusCbHZqBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 23:13:11 +0100
Message-Id: <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 09/28] drm/sched: Add fair scheduling policy
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>, "Pierre-Eric Pelloux-Prayer"
 <pierre-eric.pelloux-prayer@amd.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
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

On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sched=
uler/sched_rq.c
> index 2d1f579d8352..2fde309d02a6 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -16,6 +16,35 @@ drm_sched_entity_compare_before(struct rb_node *a, con=
st struct rb_node *b)
>  	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
>  }
> =20
> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
> +{
> +	enum drm_sched_priority prio =3D DRM_SCHED_PRIORITY_INVALID;
> +	struct rb_node *rb;
> +
> +	lockdep_assert_held(&rq->lock);
> +
> +	rb =3D rb_first_cached(&rq->rb_tree_root);
> +	if (rb) {
> +		struct drm_sched_entity *entity =3D
> +			rb_entry(rb, typeof(*entity), rb_tree_node);
> +
> +		/*
> +		 * The normal locking order is entity then run-queue so taking
> +		 * the entity lock here would be a locking inversion for the
> +		 * case when the current head of the run-queue is different from
> +		 * the one we already have locked. The unlocked read is fine
> +		 * though, because if the priority had just changed it is no big
> +		 * deal for our algorithm, but just a transient reachable only
> +		 * by drivers with userspace dynamic priority changes API. Equal
> +		 * in effect to the priority change becoming visible a few
> +		 * instructions later.
> +		 */
> +		prio =3D READ_ONCE(entity->priority);

I still think that we should address the root cause of the lock inversion
problem instead.

I previously mentioned that I can take a look at this beginning of this yea=
r,
which I can do soon.

In the meantime, can you please explain what's the problem with this specif=
ic
case? This function is only ever called from drm_sched_rq_remove_fifo_locke=
d()
and drm_sched_rq_update_fifo_locked(), which already seem to hold both lock=
s.

> +	}
> +
> +	rq->head_prio =3D prio;
> +}
> +
>  static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *ent=
ity,
>  					    struct drm_sched_rq *rq)
>  {
> @@ -25,6 +54,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_=
sched_entity *entity,
>  	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>  		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>  		RB_CLEAR_NODE(&entity->rb_tree_node);
> +		drm_sched_rq_update_prio(rq);
>  	}
>  }
> =20
> @@ -46,6 +76,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_=
sched_entity *entity,
> =20
>  	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>  		      drm_sched_entity_compare_before);
> +	drm_sched_rq_update_prio(rq);
>  }
