Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4C8A82207
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA4A10E336;
	Wed,  9 Apr 2025 10:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="x3lh9W4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAAE10E336;
 Wed,  9 Apr 2025 10:28:47 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZXfLK1PCFz9tLj;
 Wed,  9 Apr 2025 12:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744194521; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpQYzk+s2AU5nFVaWxSMN7KrT/8j3r63dy+crDWPfAk=;
 b=x3lh9W4ObZI0dPOVE48lmW7k7NT61xhY7BNR6XwwTCf6iDtJroCQ4JcKy9pAUe8NbcZWmG
 PFzYi+iXhXJaeoFvFGF/kXj1tDJtYHkMcBLj0ee2uCg/odQV3/PEoPccm9kZ93HD7lsyc8
 L7vHWq2TNXxHZ553Jp+XQ3fyCjnTqfdqdf/pgTSt8nSMqX84NjaTn59CpIXfuBPlR6SS17
 QZnTZyiI2Y6Oq2UeGaL0M6Ha++ylinFvWqtK++z/iCqQJXALbgxT5xPXhPJu479kWZSapg
 fx6F5y086cwMMy2qHTh8TkE3GuaBVlpZF6AfK1SDH9nL/2HKP48Rali8r42QPw==
Message-ID: <867c3abac8a222fa42921a6725e85fe459bc9d5e.camel@mailbox.org>
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tvrtko.ursulin@igalia.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org,  amd-gfx@lists.freedesktop.org
Date: Wed, 09 Apr 2025 12:28:37 +0200
In-Reply-To: <20250321155852.15162-1-christian.koenig@amd.com>
References: <20250321155852.15162-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 3f07f75e1677f71e1a0
X-MBO-RS-META: 1qkrmr8zjbr1gx3it1usrjsxbipnun1s
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

On Fri, 2025-03-21 at 16:58 +0100, Christian K=C3=B6nig wrote:
> Sometimes drivers need to be able to submit multiple jobs which
> depend on
> each other to different schedulers at the same time, but using
> drm_sched_job_add_dependency() can't fail any more after the first
> job is
> initialized.
>=20
> This function preallocate memory for dependency slots so that no
> ENOMEM
> can come later while adding dependencies.
>=20
> v2: rework implementation an documentation
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 44
> ++++++++++++++++++++++++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 43 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 4d4219fbe49d..ee3701f346b2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -852,6 +852,39 @@ void drm_sched_job_arm(struct drm_sched_job
> *job)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_job_arm);
> =C2=A0
> +/**
> + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding
> dependencies
> + * @job: scheduler job where dependencies will be added
> + * @num_deps: number of dependencies to preallocate slots for
> +=C2=A0 *
> + * Sometimes drivers need to be able to submit multiple jobs which
> depend on
> + * each other to different schedulers at the same time, but using
> + * drm_sched_job_add_dependency() can't fail any more after the
> first job is
> + * initialized.
> + *
> + * This function preallocate memory for dependency slots so that no
> ENOMEM can
> + * come later while adding dependencies.
> + *
> + * Return:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
> *job,
> +					=C2=A0=C2=A0=C2=A0 unsigned int num_deps)
> +{
> +	u32 id =3D 0;
> +	int ret;
> +
> +	while (num_deps--) {
> +		ret =3D xa_alloc(&job->dependencies, &id,
> XA_ZERO_ENTRY,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xa_limit_32b, GFP_KERNEL);

I've had some time to re-read the xarray documentation and I think that
this is what xa_reserve() was born for. The Book of Documentation/core-
api/xarray.rst sayeth:

"Sometimes you need to ensure that a subsequent call to xa_store()
will not need to allocate memory.  The xa_reserve() function
will store a reserved entry at the indicated index.  Users of the
normal API will see this entry as containing ``NULL``."

That's far better, this way we don't have to use that more or less
xarray-internal flag.


> +		if (ret !=3D 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
> +
> =C2=A0/**
> =C2=A0 * drm_sched_job_add_dependency - adds the fence as a job dependenc=
y
> =C2=A0 * @job: scheduler job to add the dependencies to
> @@ -878,10 +911,15 @@ int drm_sched_job_add_dependency(struct
> drm_sched_job *job,
> =C2=A0	 * engines involved, rather than the number of BOs.
> =C2=A0	 */
> =C2=A0	xa_for_each(&job->dependencies, index, entry) {
> -		if (entry->context !=3D fence->context)
> +		if (xa_is_zero(entry)) {
> +			/*
> +			 * Reserved entries must not alloc memory,
> but let's
> +			 * use GFP_ATOMIC just to be on the
> defensive side.
> +			*/
> +			xa_store(&job->dependencies, index, fence,
> GFP_ATOMIC);

And regarding this =E2=80=93 it can actually never happen, but you provide
ATOMIC just to be sure?

I think it would be better if we'd just run into an obvious bug here
instead, so like a deadlock with GFP_KERNEL.

That's how we do it with pointers that cannot be NULL, too. If the
impossible were to happen and it were NULL, we'd crash.

P.

> +		} else if (entry->context !=3D fence->context) {
> =C2=A0			continue;
> -
> -		if (dma_fence_is_later(fence, entry)) {
> +		} else if (dma_fence_is_later(fence, entry)) {
> =C2=A0			dma_fence_put(entry);
> =C2=A0			xa_store(&job->dependencies, index, fence,
> GFP_KERNEL);
> =C2=A0		} else {
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb..916e820b27ff 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *owner);
> =C2=A0void drm_sched_job_arm(struct drm_sched_job *job);
> =C2=A0void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
> *job,
> +					=C2=A0=C2=A0=C2=A0 unsigned int num_deps);
> =C2=A0int drm_sched_job_add_dependency(struct drm_sched_job *job,
> =C2=A0				 struct dma_fence *fence);
> =C2=A0int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,

