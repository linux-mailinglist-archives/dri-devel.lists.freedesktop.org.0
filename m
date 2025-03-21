Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94FA6C218
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 19:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CE610E812;
	Fri, 21 Mar 2025 18:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oQjKCoI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7907010E812;
 Fri, 21 Mar 2025 18:05:33 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZK9N739Wjz9sp3;
 Fri, 21 Mar 2025 19:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1742580327; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhjGm48vMwQTMI5P3SgQeCHevkL8b6DjBTSn9MX1c18=;
 b=oQjKCoI8QzekHFBV2QngbP6Zcu59HUCM0ef6J5Ws/BvgqORuryxWSGOCiXFUefJOYfLc0+
 4mC3a2WqLfqFQ6M/zth3IUp7vNkgiu+q17PVe1QAw9sWfaepl5Ua9JBPKb2lUI7vE34NJD
 vPf3PlJ1iNm1nsZjm/SRtfahwhdt06Pui6rIi8NU6w8XxZz7gk5J7H17PyKoAgBEe/QAuJ
 BNlKkGfILpW/Z/9JB3u4Wm2yLHT6tAQI9KaXxtWoFo6Du+2qp1pqIDIrOWRWVEXdG/3aFf
 97Cxjv88TLGf9FteBFRR9ZDc3s1YYSMZigu6X+mwzLIyBfLgK8s5AFBqTV0AeQ==
Message-ID: <e9db9144a38161982b9f310c4543e1effe7afe17.camel@mailbox.org>
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tvrtko.ursulin@igalia.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org,  amd-gfx@lists.freedesktop.org
Date: Fri, 21 Mar 2025 19:05:25 +0100
In-Reply-To: <20250321155852.15162-1-christian.koenig@amd.com>
References: <20250321155852.15162-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 7a0497b0011efcb6586
X-MBO-RS-META: sbiie5kuzx7xz7tkzpojwz8auao33gcr
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

For drm/sched Danilo & I think that changelogs shouldn't be in the
commit message anymore. The Link: applied by the DRM tools will be
sufficient to find the history in the archives if necessary.

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

Fine by me, but out of curiousity about the xarray: you mentioned
xa_reserve() might work, too?


P.

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

