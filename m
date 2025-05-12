Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DFBAB3092
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 09:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530CE10E2EB;
	Mon, 12 May 2025 07:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="o9JJ+kUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E32910E2EB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:32:58 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZwrtG0ClFz9spx;
 Mon, 12 May 2025 09:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747035174; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znH0XG7Kmtp8lN5ws28mSnlA5VbiwL23iVss3nnn1Jo=;
 b=o9JJ+kUZU8PHH7UBOjwTrtK7Q4hIMyITCfkHKi1P67T3dhBxYRgHrj3CiPP2O5FzMLRDfi
 xFR+lYeWEZfpcy/CTnhOt7we6AGH+1E1D/7Rg1FusaptD7//2Zelbxdsp/40CPOzIDxcK+
 bdbvM+cyzW75afo5bwYE2XZrhd9byRjVozdk18Vpeljj3XkDqWr1RTHxe4cacS+cFaA8T6
 FtobJHQFty09Lep4xmvQRep48Xku6D/fquC5XAsToNM9+VEOuHp0ASG9vd6PyvMxHfnR8v
 6cb6Wvr0Q1a1HDKaeHvsjCRxp7dfpNqQXbKhtoyt7wnrrNG/huvOul8dK78Ung==
Message-ID: <7d1d03702f4dffd68b18afa4f5ef242b4042188f.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
From: Philipp Stanner <phasta@mailbox.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Date: Mon, 12 May 2025 09:32:49 +0200
In-Reply-To: <20250509212936.490048-1-robdclark@gmail.com>
References: <20250509212936.490048-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 2eac22a50541d63a9ad
X-MBO-RS-META: fagip3zimdb6a6bhbm8so988516ptigt
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

Hi,

On Fri, 2025-05-09 at 14:29 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> The fence can outlive the sched, so it is not safe to dereference the
> sched in drm_sched_fence_get_timeline_name()

Thx for the fix. Looks correct to me. Some nits

>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>

This is clearly a bug. So please provide a Fixes: tag and +Cc the
stable kernel.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c |=C2=A0 3 ++-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
> =C2=A02 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
> b/drivers/gpu/drm/scheduler/sched_fence.c
> index e971528504a5..4e529c3ba6d4 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -92,7 +92,7 @@ static const char
> *drm_sched_fence_get_driver_name(struct dma_fence *fence)
> =C2=A0static const char *drm_sched_fence_get_timeline_name(struct
> dma_fence *f)
> =C2=A0{
> =C2=A0	struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return fence->name;

Adding an empty line while we're here already would be neat.

> =C2=A0}
> =C2=A0
> =C2=A0static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence
> *fence,
> =C2=A0	unsigned seq;
> =C2=A0
> =C2=A0	fence->sched =3D entity->rq->sched;
> +	fence->name=C2=A0 =3D fence->sched->name;
> =C2=A0	seq =3D atomic_inc_return(&entity->fence_seq);
> =C2=A0	dma_fence_init(&fence->scheduled,
> &drm_sched_fence_ops_scheduled,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_=
context, seq);
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 0ae108f6fcaf..d830ffe083f1 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -295,6 +295,9 @@ struct drm_sched_fence {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @sched: the sche=
duler instance to which the job having
> this struct
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * belongs to.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Some care must be tak=
en as to where the sched is derefed,
> as the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * fence can outlive the=
 sched.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */

Just briefly hinting at the lifetime is enough here. Every developer
understands what that implicates.

"Might have a lifetime shorter than the owning &struct drm_sched_fence"


Thx
P.

> =C2=A0	struct drm_gpu_scheduler	*sched;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> @@ -305,6 +308,14 @@ struct drm_sched_fence {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @owner: job owne=
r for debugging
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0	void				*owner;
> +
> +	/**
> +	 * @name: the timeline name
> +	 *
> +	 * This comes from the @sched, but since the fence can
> outlive the
> +	 * sched, we need to keep our own copy.
> +	 */
> +	const char			*name;
> =C2=A0};
> =C2=A0
> =C2=A0struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);

