Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8BBC0DAD4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1487C10E46B;
	Mon, 27 Oct 2025 12:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bvnrc8GI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67E910E47C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:50:35 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwCzD20qkz9t55;
 Mon, 27 Oct 2025 13:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761569432; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2I23fNm6Em+ctcxbQMJZKQTH8OTHmjmStiPodBpgGs=;
 b=bvnrc8GIxDY0DiOz7djBKG2iILJBXISfM3GS+Zy4gm/Rto4icOyGMsA/LpMkukPbthdsAY
 NK/IHVQCUfJnxQ1ZUdYP2P9u1fkxK38wdOb+VkIIkZ2N9MdhacBfZPonOOOO4MR7aHcNk4
 ef7mYf008NLUGDJa/e6/xPma7bLQuNvNA/UZqwLeg/a494AIU8NXRzFZ4hXZzuexCiEZ1J
 MCUQyFQbQBFn0GZet8wWBvBbGuvjtKQPi9/T34m9V6j5BYZPRb/fiNnn4BjhjED2wWyvaU
 pAOrTe0W3ALs9GjUmSftFdDyTuflsp/2NNVN9Ozp1+JkBC0wcBHAMhaOz09EFg==
Message-ID: <19a92d6d0ee730074139a36c38cc2fe16c72c588.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix race in drm_sched_entity_select_rq()
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 27 Oct 2025 13:50:28 +0100
In-Reply-To: <26eef700-7997-42e5-b0b9-c03361e05814@igalia.com>
References: <20251022063402.87318-2-phasta@kernel.org>
 <26eef700-7997-42e5-b0b9-c03361e05814@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: g5fne6skcrqj8jyzt6atkcpbxyy5t5cu
X-MBO-RS-ID: 5e63914fdaa7d966411
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

On Wed, 2025-10-22 at 08:16 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/10/2025 07:34, Philipp Stanner wrote:
> > In a past bug fix it was forgotten that entity access must be protected
> > by the entity lock. That's a data race and potentially UB.
> >=20
> > Move the spin_unlock() to the appropriate position.
> >=20
> > Cc: stable@vger.kernel.org=C2=A0# v5.13+
> > Fixes: ac4eb83ab255 ("drm/sched: select new rq even if there is only on=
e v3")
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
> > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 5a4697f636f2..aa222166de58 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -552,10 +552,11 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> > =C2=A0=C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> > =C2=A0=C2=A0		entity->rq =3D rq;
> > =C2=A0=C2=A0	}
> > -	spin_unlock(&entity->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (entity->num_sched_list =3D=3D 1)
> > =C2=A0=C2=A0		entity->sched_list =3D NULL;
> > +
> > +	spin_unlock(&entity->lock);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
>=20
> Agreed, unlock at the end is correct.
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Applied to drm-misc-fixes.

Thx
P.


>=20
> Luckily only amdgpu calls drm_sched_entity_modify_sched(), and I am not=
=20
> sure if with hypothetical multi-threaded submit it could be possible to=
=20
> hit it or not.
>=20
> One thread would have to clear the sched_list, while another would have=
=20
> to have passed the !sched_list at the beginning of the function, and the=
=20
> job_queue count and last_scheduled completed guards. Which would mean
> job has to get completed between the unlock and clearing the pointer.
>=20
> Also, take a look at this when you can please:
>=20
> https://lore.kernel.org/dri-devel/20240719094730.55301-1-tursulin@igalia.=
com/
>=20
> This would also have fixed this issue by removing clearing of=20
> entity->sched_list. Latter being just a hack to work around the issue of=
=20
> confused container ownership rules.
>=20
> Regards,
>=20
> Tvrtko
>=20

