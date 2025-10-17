Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8960ABE69C2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 08:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB3310EB15;
	Fri, 17 Oct 2025 06:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Vff3BTLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7A710EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:18:44 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cnvlh5mCjz9t8V;
 Fri, 17 Oct 2025 08:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760681920; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wv4xwUTolzS06yfc8f5EP4EZp6D9/TeNPRA4m+A34To=;
 b=Vff3BTLDffXB9HCcQlh2W2nIAwTIXPSytK++YftGJzqbvPniCQPCXJNZAWacRlUA9jRZ2T
 iwYnuzmz+dJGHrMiDnLze4S/41N6VnApZbhJmQREYh0mrqPPbfI7pUP1bCHlFMan6j96Wq
 /oC9gkQF0h5fJkJ+uC527ZE0v5ng44SbtgVUyTDo58h+qKGq/ZfxAQ3XJhP/hGHpc/t0ir
 6yuZ0SKUw9dXw157TcMAglATA83LrYL5SD1FKq33MqqaeAnkpXPhgIuGSfHYnJNvLLfz5J
 3ektPAAVVlqRd4FVhCpt4m7xWW1AYvfmPJKujA/Mg5KX3hRJKPCcHkaIiJe6FA==
Message-ID: <f60185e4a4b8622c866965ec30c90edca0c53b40.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, dakr@kernel.org,
 matthew.brost@intel.com,  dri-devel@lists.freedesktop.org
Date: Fri, 17 Oct 2025 08:18:38 +0200
In-Reply-To: <20251015140128.1470-1-christian.koenig@amd.com>
References: <20251015140128.1470-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 597f841eb81db992751
X-MBO-RS-META: r7c7gf6pu1b4799hxd4b815edw7uqob4
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

On Wed, 2025-10-15 at 16:01 +0200, Christian K=C3=B6nig wrote:
> From: David Rosca <david.rosca@amd.com>
>=20
> The DRM scheduler tracks who last uses an entity and when that process
> is killed blocks all further submissions to that entity.
>=20
> The problem is that we didn't track who initially created an entity, so
> when a process accidently leaked its file descriptor to a child and
> that child got killed, we killed the parent's entities.
>=20
> Avoid that and instead initialize the entities last user on entity
> creation. This also allows to drop the extra NULL check.
>=20
> v2: still use cmpxchg
> v3: improve the commit message
>=20
> Signed-off-by: David Rosca <david.rosca@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> CC: stable@vger.kernel.org

Acked-by: Philipp Stanner <phasta@kernel.org>


Fire at will, Christian. Maybe optionally with the commit message nits
twirked in we discussed before.


P.

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
> =C2=A0	=C2=A0=C2=A0=C2=A0 (current->flags & PF_EXITING) && (current->exit=
_code =3D=3D SIGKILL))
> =C2=A0		drm_sched_entity_kill(entity);
> =C2=A0

