Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E7C1FC52
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 12:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7951C10E901;
	Thu, 30 Oct 2025 11:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rfCkCj1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28FA10E901
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:17:42 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cy1mg3LK0z9spB;
 Thu, 30 Oct 2025 12:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761823059; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udQdI8kZ9HNR1T3YelubgV+z74XJhbul0irKljvsfkw=;
 b=rfCkCj1aKP3gD9fOKRtgCEZm254WNjvqqyYCD1808//A8YhflHFiiKP/HJOpq9yq7jNCyk
 hj7d/rUdifE+Wvb1dA6BhWHH++w6Rp/9RQv02E7vyrnCJQD87ql2VfxV8iNEz7ryyPJEB6
 CdVBDsuHksvbjEZ7QsbTjPA3Fue3uZqqbuNtCh5dKSZNtEZFqiEOS22+l+Dw4Cb4MutmvD
 CpP519yREgx3PQSsNMBmJY1IV9tKJY8+akQB8/CXqqMjO/kZfBn4ZqOTBcmch6fx+WE+oG
 +fZ3LqaV8rbTc8Al9CqQZW/zaCGJvIMlEJqLF+8Da7WYsH5KdeRDJLj7qoC9mg==
Message-ID: <fb2881006f843bd85dd02948c4467c81086effc8.camel@mailbox.org>
Subject: Re: [PATCH v1] drm/sched: fix deadlock in
 drm_sched_entity_kill_jobs_cb
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 30 Oct 2025 12:17:31 +0100
In-Reply-To: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: uxkngmmbxwy4o97th7ytiop6e8nj697p
X-MBO-RS-ID: ca1f3193d85e48195cb
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

On Wed, 2025-10-29 at 10:11 +0100, Pierre-Eric Pelloux-Prayer wrote:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908=C2=A0pointed out

This link should be moved to the tag section at the bottom at a Closes:
tag. Optionally a Reported-by:, too.

> a possible deadlock:
>=20
> [ 1231.611031]=C2=A0 Possible interrupt unsafe locking scenario:
>=20
> [ 1231.611033]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> [ 1231.611034]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> [ 1231.611035]=C2=A0=C2=A0 lock(&xa->xa_lock#17);
> [ 1231.611038]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_disable();
> [ 1231.611039]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> [ 1231.611041]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&xa->xa_lock#17=
);
> [ 1231.611044]=C2=A0=C2=A0 <Interrupt>
> [ 1231.611045]=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> [ 1231.611047]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *** DEADLOCK ***
>=20

The commit message is lacking an explanation as to _how_ and _when_ the
deadlock comes to be. That's a prerequisite for understanding why the
below is the proper fix and solution.

The issue seems to be that you cannot perform certain tasks from within
that work item?

> My initial fix was to replace xa_erase by xa_erase_irq, but Christian
> pointed out that calling dma_fence_add_callback from a callback can
> also deadlock if the signalling fence and the one passed to
> dma_fence_add_callback share the same lock.
>=20
> To fix both issues, the code iterating on dependencies and re-arming them
> is moved out to drm_sched_entity_kill_jobs_work.
>=20
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++--------=
---
> =C2=A01 file changed, 19 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index c8e949f4a568..fe174a4857be 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity =
*entity)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_error);
> =C2=A0
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					=C2=A0 struct dma_fence_cb *cb);
> +
> =C2=A0static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk=
)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job =3D container_of(wrk, typeof(*job), work=
);
> -
> -	drm_sched_fence_scheduled(job->s_fence, NULL);
> -	drm_sched_fence_finished(job->s_fence, -ESRCH);
> -	WARN_ON(job->s_fence->parent);
> -	job->sched->ops->free_job(job);

Can free_job() really not be called from within work item context?


P.
