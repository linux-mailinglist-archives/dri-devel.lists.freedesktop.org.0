Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B3CBDD5CC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8C310E28F;
	Wed, 15 Oct 2025 08:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wJ1zg8H5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D19310E28F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:23:39 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmkcl3mhRz9v4J;
 Wed, 15 Oct 2025 10:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760516615; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHiVoSsyj9cJczkrkdWQYwExBECiP6R68HUfdL8uQAg=;
 b=wJ1zg8H58liLmhazLES6znhBXZjAsoENQu04Q8Mul/GBmcdC8kUqI8OUhMnjWEYdK6KzXJ
 esxtdBbnXSOn0Kpdv01GY7qATjZe3sUfOKKZgj/N7f6xH1WpGFBjtyhU9c3IRXLCuzatJe
 gVB7H6aIJ0hxG+071d7IptIPsVGwSRvGY+/VFX68kLECGElqnMAXBz/9dV/Rpc0MHcFaxt
 CYXD9s0e4a9z6qG59Tjq9tvKKFbUZoYrsKrBSIIVZIICjWHDHdk2aXwzIk8s7H0L/SB5I2
 TSd75Wxh9D/CO2Yv84ObBQbHU+8szWci3UryzWyAMantul+oqWtmqHG7dwz6Pg==
Message-ID: <c53ba5989296ba1360e7c6a2b7901ac1e671bff1.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com, dakr@kernel.org, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 15 Oct 2025 10:23:33 +0200
In-Reply-To: <20251014142430.2470-1-christian.koenig@amd.com>
References: <20251014142430.2470-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 227db169c696b9b6601
X-MBO-RS-META: zg4ja4r9ghfpg1tqzofzu631ng9eujn4
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

On Tue, 2025-10-14 at 16:24 +0200, Christian K=C3=B6nig wrote:
> From: David Rosca <david.rosca@amd.com>
>=20
> The DRM scheduler tracks who last uses an entity and when that process
> is killed blocks all further submissions to that entity.
>=20
> The problem is that we didn't tracked who initialy created an entity, so

s/tracked/track

> when an process accidentially leaked its file descriptor to a child and

s/an/a

> that child got killed we killed the parents entities.

s/parents/parent's

>=20
> Avoid that and instead initialize the entities last user on entity
> creation.
>=20
> Signed-off-by: David Rosca <david.rosca@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 5a4697f636f2..3e2f83dc3f24 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *enti=
ty,
> =C2=A0	entity->guilty =3D guilty;
> =C2=A0	entity->num_sched_list =3D num_sched_list;
> =C2=A0	entity->priority =3D priority;
> +	entity->last_user =3D current->group_leader;
> =C2=A0	/*
> =C2=A0	 * It's perfectly valid to initialize an entity without having a v=
alid
> =C2=A0	 * scheduler attached. It's just not valid to use the scheduler be=
fore it
> @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *=
entity, long timeout)
> =C2=A0
> =C2=A0	/* For a killed process disallow further enqueueing of jobs. */
> =C2=A0	last_user =3D cmpxchg(&entity->last_user, current->group_leader, N=
ULL);
> -	if ((!last_user || last_user =3D=3D current->group_leader) &&
> +	if (last_user =3D=3D current->group_leader &&

It's not super clear from the commit message why the NULL check is
being removed. Previously entities could have been killed if there was
no last user. That's not desired anymore. Why?


P.

> =C2=A0	=C2=A0=C2=A0=C2=A0 (current->flags & PF_EXITING) && (current->exit=
_code =3D=3D SIGKILL))
> =C2=A0		drm_sched_entity_kill(entity);
> =C2=A0

