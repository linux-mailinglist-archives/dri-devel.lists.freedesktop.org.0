Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155D3C39E67
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B9010E868;
	Thu,  6 Nov 2025 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="qovKgCVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36D510E868
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 09:50:52 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d2HWF6KsWz9tQY;
 Thu,  6 Nov 2025 10:50:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762422649; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8sLIsn41o2aLlhzZn+I7H/kW8FSsCLuLR2IghUfYRI=;
 b=qovKgCVVqfBQFCQ1I+nTvI0zAyLQdFAHMqy7g7j2Hq7liQJfJO+3/vTEWDyMzuLQVB3eL1
 n/gPs8Uzk4Gj6rkZnezyxbjh6M4hQH0gtnCIEjaNRXMOq6vR+Omx8X6SGSTk7OYEnNO4nj
 Y4rSygg6M0w79FI14Q2Sv1pi5XO8zrtjpNuERa1CjN11PB/jySRp3/KhrxVeNNuoKDiZp2
 xne5CgBLjziJNVbS0OQB5MPcZkmV8CEInH3W856Qa3DJHUa6xuWKIev3ro5vdOWfPoHd4D
 ywc7AbFY/1inTAZIOA4WMXvBO3roCO28v3WpUBxuZVVfDFgBIp2ahp63/JQuJA==
Message-ID: <7317df627873853cfd2b91e5d2452ca1a9433a42.camel@mailbox.org>
Subject: Re: [PATCH v3 4/4] drm/sched: limit sched score update to jobs change
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 06 Nov 2025 10:50:43 +0100
In-Reply-To: <20251106093933.18859-4-pierre-eric.pelloux-prayer@amd.com>
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
 <20251106093933.18859-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8514c36133ca0e4e967
X-MBO-RS-META: yajwoktwpu53ojiixzwcxhidqxp35h51
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

nit: s/limit/Limit

On Thu, 2025-11-06 at 10:39 +0100, Pierre-Eric Pelloux-Prayer wrote:
> Currently, the scheduler score is incremented when a job is pushed to an
> entity and when an entity is attached to the scheduler.
>=20
> This leads to some bad scheduling decision where the score value is
> largely made of idle entities.
>=20
> For instance, a scenario with 2 schedulers and where 10 entities submit
> a single job, then do nothing, each scheduler will probably end up with
> a score of 5.
> Now, 5 userspace apps exit, so their entities will be dropped. In

s/Now,/Now, let's imagine

> the worst case, these apps' entities where all attached to the same

s/where/were

> scheduler and we end up with score=3D5 (the 5 remaining entities) and
> score=3D0, despite the 2 schedulers being idle.
> When new entities show up, they will all select the second scheduler
> based on its low score value, instead of alternating between the 2.
>=20
> Some amdgpu rings depended on this feature, but the previous commit
> implemented the same thing in amdgpu directly so it can be safely
> removed from drm/sched.
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

With the commit message fixed up a little bit:

Acked-by: Philipp Stanner <phasta@kernel.org

Apply how you want :)


P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index c39f0245e3a9..8a3d99a86090 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> =C2=A0	if (!list_empty(&entity->list))
> =C2=A0		return;
> =C2=A0
> -	atomic_inc(rq->sched->score);
> =C2=A0	list_add_tail(&entity->list, &rq->entities);
> =C2=A0}
> =C2=A0
> @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *=
rq,
> =C2=A0
> =C2=A0	spin_lock(&rq->lock);
> =C2=A0
> -	atomic_dec(rq->sched->score);
> =C2=A0	list_del_init(&entity->list);
> =C2=A0
> =C2=A0	if (rq->current_entity =3D=3D entity)

