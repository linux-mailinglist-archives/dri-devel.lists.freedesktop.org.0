Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE81CFE30A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCF310E5E8;
	Wed,  7 Jan 2026 14:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oUeDigwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701FF10E5E8;
 Wed,  7 Jan 2026 14:11:23 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dmVMD2ZFkz9tTx;
 Wed,  7 Jan 2026 15:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1767795080; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXEDg6KFArA0ZPoD1xCu5ZaP9Rc9M15nO+tK+6meMyI=;
 b=oUeDigwB51AcoUbtWLhR0RtnsotXwvcRPctb3JRde3x8G0QuUFF1wSsPjaqHCm1Ez5PFuv
 vxO2JBYRW6gJDcXpq8qEMCvkJbR8WUlQay949Z4AK1XpgKxj5trRGAunhEQwQmEI24xonJ
 y+RzPta/oLLX2llT3+97mCUJTIhCKr1qG5Nu8DuL0xByoUwpjNlgjWcHcFzGHX8vb2LdVb
 KSHhdhGcBVRGx1Rfzyv9puq9jdsoKKWDudw7/psdnpQUJSkltbtjCi49wDSr1BiTB4iAB8
 k7KtapBsuTpjE0Ao4rM8gVa52I1OeFIvBiC+5hxYCxWv2reB2mtTRV9bg4V/AQ==
Message-ID: <1e7ae073820d0cbb7f6f615b40e0cf4c6133a062.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Date: Wed, 07 Jan 2026 15:11:15 +0100
In-Reply-To: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f6fdd2613ca69ac727a
X-MBO-RS-META: sojh59kyf69mrk1or6zr7uh5ukk848s9
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

Happy 2026, Tvrtko!


On Wed, 2026-01-07 at 13:44 +0000, Tvrtko Ursulin wrote:
> drm_sched_entity_is_idle() is called when flushing the entity before
> destroying it and currently decides on the idle status based either on
> number of jobs in its queue being zero, or whether the entity is not part
> of any run-queue.
>=20
> If entity is not part of a run-queue it is implied it can have no jobs in
> its queue, from which it follows it is redundant to look at the both and
> we can simplify to only look at the queue.
>=20
> The list_empty() check was added in
> a875f58e237a ("drm/scheduler: stop setting rq to NULL")
> where it replaced the entity->rq check which was added in
> 741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying p=
rocess (V4)").
>=20
> Since for the submit race involving exiting entities, explicit handling
> via entity->stopped was added soon after in
> 62347a33001c ("drm/scheduler: Add stopped flag to drm_sched_entity")
> it indeed looks we are safe to remove the list_empty() check.
>=20
> This mean we can remove the memory barrier as well and fewer memory
> barriers the better.

I am not convinced that this change is worth it.

Not to long ago we discussed that the spsc_queue should be removed and
replaced by some sort of list, with proper locks. Christian has agreed
that this should fly.

The spsc queue has only 1 user in the kernel and it's super hard to
understand how it's supposed to work and when any why barriers and
READ_ONCE's are necessary (that's, of course, also not documented in
the queue).

Until that is done I don't really want to touch any of those memory
barriers..

>=20
> While at it, we add READ_ONCE annotation on the entity->stopped check to
> mark the unlocked read.

This would effectively legalize the lockless access. But it is illegal
and undefined behavior. See drm_sched_fini().

P.


>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 10 ++--------
> =C2=A01 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index bb7e5fc47f99..2ed84504cfd6 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -137,14 +137,8 @@ EXPORT_SYMBOL(drm_sched_entity_modify_sched);
> =C2=A0
> =C2=A0static bool drm_sched_entity_is_idle(struct drm_sched_entity *entit=
y)
> =C2=A0{
> -	rmb(); /* for list_empty to work without lock */
> -
> -	if (list_empty(&entity->list) ||
> -	=C2=A0=C2=A0=C2=A0 spsc_queue_count(&entity->job_queue) =3D=3D 0 ||
> -	=C2=A0=C2=A0=C2=A0 entity->stopped)
> -		return true;
> -
> -	return false;
> +	return spsc_queue_count(&entity->job_queue) =3D=3D 0 ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 READ_ONCE(entity->stopped);
> =C2=A0}
> =C2=A0
> =C2=A0/**

