Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F2AB3804
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 15:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA1C10E403;
	Mon, 12 May 2025 13:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pdevtFuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC0B10E403;
 Mon, 12 May 2025 13:03:28 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Zx0Cd2mHQz9slK;
 Mon, 12 May 2025 15:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747055005; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmbiLmg/I6tZpbCS9AbzHazigNFbQR6PMeYULNNusdM=;
 b=pdevtFuqUUgHIOgb6b6pvwirXKY5qOARvPjKsbx9CZqg2o0/XTuR1YZKoRwoFr5DaoEosb
 Fx2/atUQ+T5XH1uG8AJZ7nbT0f+0tNQCzZ18/RqhTOj093VzrM/DueteDqanJ1lQjbzCdm
 MXiu03ZqZU/6srByQbIPXOfy84zRUXmbCEQOygwqV/7xM5SrQoPuHQHh9XT/IhK98/+ec8
 Ea+A+6EXM7VRmtvJ/E1OHxKmVY8owOVThFiE+o4SAWLLtTY8dugTqwMXnwTl9dZdC7TOts
 qdFkZc88rCnQDlpl0yNosxkFEwfg2JEk84L68Q8q8YnGc972dYAc4Upa6FUNtQ==
Message-ID: <0d94533502890e345a08fafc00919041c2f4b80d.camel@mailbox.org>
Subject: Re: [RFC v4 12/16] drm/sched: Remove idle entity from tree
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 12 May 2025 15:03:22 +0200
In-Reply-To: <20250425102034.85133-13-tvrtko.ursulin@igalia.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-13-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 6b4cfff539beb71c7b9
X-MBO-RS-META: ps4nx185b3hyr9sztxdtskcbac4qekwg
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

On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
> There is no need to keep entities with no jobs in the tree so lets
> remove
> it once the last job is consumed. This keeps the tree smaller which
> is
> nicer and more efficient as entities are removed and re-added on
> every
> popped job.

That there is no need to do so doesn't imply that you can't keep them
around. The commit message doesn't make the motivation clear

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c | 24 +++++++++++++-----------
> =C2=A01 file changed, 13 insertions(+), 11 deletions(-)

Since this doesn't simplify the code base, I think the only
justification would be a somewhat decent performance gain. Does this
patch result in that?

Otherwise it's probably better to keep git-blame intact here.

P.

>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c
> b/drivers/gpu/drm/scheduler/sched_rq.c
> index d477a027feb9..2cde89cf25fb 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -149,25 +149,27 @@ void drm_sched_rq_pop_entity(struct
> drm_sched_entity *entity)
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
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -		ts =3D next_job->submit_ts;
> -	else
> -		ts =3D drm_sched_rq_get_rr_deadline(rq);
> +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> +			ts =3D next_job->submit_ts;
> +		else
> +			ts =3D drm_sched_rq_get_rr_deadline(rq);
> =C2=A0
> -	spin_lock(&entity->lock);
> -	rq =3D entity->rq;
> -	spin_lock(&rq->lock);
> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	} else {
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
> +	}
> =C2=A0	spin_unlock(&rq->lock);
> =C2=A0	spin_unlock(&entity->lock);
> =C2=A0}

