Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A73D032F4
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E06410E351;
	Thu,  8 Jan 2026 13:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JUCJGNNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DA210E351;
 Thu,  8 Jan 2026 13:55:07 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dn5y00Ffmz9v9m;
 Thu,  8 Jan 2026 14:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1767880504; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmDsS9StOht21uosdvqs1ebD2zyyFUsG1f/z5gshT3I=;
 b=JUCJGNNh0XPX67g76kj8P5bUBsF0v/0AJc6KIyRaF8guuQdokqcA851cFNc5Isx3LdL2D2
 xS0muQJ55/Oys1PQI+0jxJGfNdxAEN1xdP5E9Fj2MgKrXihAUpt/7k2f65JWSkQZbFGCBn
 U/ptp6f9BhmF+PgbyhmH7rn+DluAw0KESqaMdLvwiFf938SuZI9w7saGOw+h2WUDO+Xxef
 r0bADnrYqkxfGb6WTbvivxsl4NQ2p56Yl/Heqm2yrg9zuyrnJVbyNSFPZTOH7KkTd5JUPC
 3j3b9ahDiv1/5PB8YZ02D/mkwT79g6ATL0u9TBYr1GJ2YjaMsbJP2IuPb2fMaw==
Message-ID: <a763700944ed4ccfe2f36ae805e4a348dd3fd10f.camel@mailbox.org>
Subject: Re: [RFC 3/3] drm/sched: Disallow initializing entities with no
 schedulers
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Thu, 08 Jan 2026 14:54:59 +0100
In-Reply-To: <20260107124351.94738-4-tvrtko.ursulin@igalia.com>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
 <20260107124351.94738-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c67a8dd21f83f3fc05c
X-MBO-RS-META: g3yrxs5wfri6whijk63n1qkojdr98mct
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

What's the merge plan for this series? Christian?

On Wed, 2026-01-07 at 12:43 +0000, Tvrtko Ursulin wrote:
> Since we have removed the case where amdgpu was initializing entitites
> with either no schedulers on the list, or with a single NULL scheduler,
> and there appears no other drivers which rely on this, we can simplify th=
e
> scheduler by explictly rejecting that early.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 13 ++++---------
> =C2=A01 file changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index fe174a4857be..bb7e5fc47f99 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -61,32 +61,27 @@ int drm_sched_entity_init(struct drm_sched_entity *en=
tity,
> =C2=A0			=C2=A0 unsigned int num_sched_list,
> =C2=A0			=C2=A0 atomic_t *guilty)
> =C2=A0{
> -	if (!(entity && sched_list && (num_sched_list =3D=3D 0 || sched_list[0]=
)))
> +	if (!entity || !sched_list || !num_sched_list || !sched_list[0])

I personally am a fan of checking integers explicitly against a number,
which would make the diff a bit more straightforward, too. But I accept
that like that is common kernel practice.

> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	memset(entity, 0, sizeof(struct drm_sched_entity));
> =C2=A0	INIT_LIST_HEAD(&entity->list);
> =C2=A0	entity->rq =3D NULL;
> =C2=A0	entity->guilty =3D guilty;
> -	entity->num_sched_list =3D num_sched_list;
> =C2=A0	entity->priority =3D priority;
> =C2=A0	entity->last_user =3D current->group_leader;
> -	/*
> -	 * It's perfectly valid to initialize an entity without having a valid
> -	 * scheduler attached. It's just not valid to use the scheduler before =
it
> -	 * is initialized itself.
> -	 */
> +	entity->num_sched_list =3D num_sched_list;

Why do you move that line downwards? Just leave it where it was?
num_sched_list isn't changed or anything, so I don't see a logical
connection to the line below so that grouping would make sense.

With that:
Acked-by: Philipp Stanner <phasta@kernel.org>


P.

> =C2=A0	entity->sched_list =3D num_sched_list > 1 ? sched_list : NULL;
> =C2=A0	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> =C2=A0	RB_CLEAR_NODE(&entity->rb_tree_node);
> =C2=A0
> -	if (num_sched_list && !sched_list[0]->sched_rq) {
> +	if (!sched_list[0]->sched_rq) {
> =C2=A0		/* Since every entry covered by num_sched_list
> =C2=A0		 * should be non-NULL and therefore we warn drivers
> =C2=A0		 * not to do this and to fix their DRM calling order.
> =C2=A0		 */
> =C2=A0		pr_warn("%s: called with uninitialized scheduler\n", __func__);
> -	} else if (num_sched_list) {
> +	} else {
> =C2=A0		/* The "priority" of an entity cannot exceed the number of run-qu=
eues of a
> =C2=A0		 * scheduler. Protect against num_rqs being 0, by converting to s=
igned. Choose
> =C2=A0		 * the lowest priority available.

