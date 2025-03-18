Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AFA6740C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E14710E47D;
	Tue, 18 Mar 2025 12:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WuOctZ8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0510E47D;
 Tue, 18 Mar 2025 12:39:50 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZHBHg2VWbz9slk;
 Tue, 18 Mar 2025 13:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1742301583; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbLwlyp//0FgL1BxNsdOB3rHgeezcM1MYxCdodzkzdg=;
 b=WuOctZ8yzyNgFEw/5l/A9QdjPgUAdUXPPNZ7QaY8rDY6r352OijC0qZaH3fSXQUZnshK9Z
 oBduxenJssO/gele+kyLQzKBhRb4er3rdAry96RR9g3H4QgCCc2kcOM0nq/cbSyCASpmp3
 DVB+fGCt+zLnG1ue7LQ9DZ8xTW6kR1UHAzYr2sSTqFH/ZykFxuYtRacAGjcCutZRN92hWu
 eeI95gsOrwwjfnRBpxTrydqXB0f8HOPs0CxLcxMXTt/2YjgZWSb9sUB2OsiunGRrNj9N7r
 cAwNIXf4CNDSdglN1iDZi4PW2S4iq/VuwBSgxwdF0Wghg4ByeLf8mN38mq6H2Q==
Message-ID: <769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org>
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tvrtko.ursulin@igalia.com, dri-devel@lists.freedesktop.org,
 dakr@kernel.org,  amd-gfx@lists.freedesktop.org
Date: Tue, 18 Mar 2025 13:39:40 +0100
In-Reply-To: <20250318120313.19099-2-christian.koenig@amd.com>
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 9sskiuboqqpxtbcpize8z89n3wogfcos
X-MBO-RS-ID: 2b3f3164c62587a795f
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

On Tue, 2025-03-18 at 13:03 +0100, Christian K=C3=B6nig wrote:
> The problem is that drivers sometimes need to add dependencies
> without
> allocating any memory.
>=20
> Add a function which preallocates slots by inserting signaled stub
> fences
> into the dependency array.

I think I get what you're doing here, but it would certainly be helpful
to provide some more justification in the commit message a la: "Some
drivers have to [...]. With drm_sched_job_add_dependency() that's not
possible because [...]"

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 41
> ++++++++++++++++++++++++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 40 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 4d4219fbe49d..2085eea89513 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -852,6 +852,38 @@ void drm_sched_job_arm(struct drm_sched_job
> *job)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_job_arm);
> =C2=A0
> +/**
> + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding
> dependencies
> + * @job: scheduler job where dependencies will be added
> + * @num_deps: number of dependencies to preallocate slots for
> + *
> + * Preallocate memory so that no ENOMEM can come later while adding
> + * dependencies.

Similarly, should have a sentence that clarifies for when this is
needed.

> + *
> + * Return:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
> *job,
> +					=C2=A0=C2=A0=C2=A0 unsigned int num_deps)
> +{
> +	struct dma_fence *fence;
> +	u32 id =3D 0;
> +	int ret;
> +
> +	while (num_deps--) {
> +		fence =3D dma_fence_get_stub();
> +		ret =3D xa_alloc(&job->dependencies, &id, fence,
> xa_limit_32b,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);

So this would fill the xarr with already signaled fences which then
later will be replaced with unsignaled fences?

Help me out here: would it also work to add NULL instead of that stub-
fence?


> +		if (ret !=3D 0) {

btw. style should be consistent with the while() above where you ommit
'> 0'.

I personally prefer having the comparison operators, but implicitly
checking for 0 is well established in the kernel, so I guess both is
OK.

> +			dma_fence_put(fence);
> +			return ret;
> +		}
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
> @@ -878,10 +910,12 @@ int drm_sched_job_add_dependency(struct
> drm_sched_job *job,
> =C2=A0	 * engines involved, rather than the number of BOs.
> =C2=A0	 */
> =C2=A0	xa_for_each(&job->dependencies, index, entry) {
> -		if (entry->context !=3D fence->context)
> +		bool signaled =3D dma_fence_is_signaled(entry);
> +
> +		if (!signaled && entry->context !=3D fence->context)
> =C2=A0			continue;
> =C2=A0
> -		if (dma_fence_is_later(fence, entry)) {
> +		if (signaled || dma_fence_is_later(fence, entry)) {
> =C2=A0			dma_fence_put(entry);
> =C2=A0			xa_store(&job->dependencies, index, fence,
> GFP_KERNEL);
> =C2=A0		} else {
> @@ -890,7 +924,8 @@ int drm_sched_job_add_dependency(struct
> drm_sched_job *job,
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> -	ret =3D xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> GFP_KERNEL);
> +	ret =3D xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);

Would leave that unchanged for git-blame.


Thx
P.

> =C2=A0	if (ret !=3D 0)
> =C2=A0		dma_fence_put(fence);
> =C2=A0
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

