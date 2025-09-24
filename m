Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F351B98BEE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 10:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD1410E225;
	Wed, 24 Sep 2025 08:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="mkPVqYRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49A810E225;
 Wed, 24 Sep 2025 08:07:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cWqFt4Xzzz9spD;
 Wed, 24 Sep 2025 10:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758701250; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpbx2g4fwOvBCm9wRMiBVJxjBVr+1dqUOSGFP89hzJg=;
 b=mkPVqYRjofrsPKX/VbWOP/L4TY4z2CYgA7j4LczN91Eln4qMFqedA6iXjslJ7psVPIhIt4
 SfHLZGEmuzkcUP10FsufmRGWkvpkl7VK2B2B3ybkIG7PI0XkO+XuUcn5/uwpuk3Dqpkvem
 cnS8flqRT/cTeShZ+VXOAasUM4YJAcIDn0/w25UpeqRrDEF7enH7r3m6uLYPUS2+BJN7og
 eM1+7UsLVL4xRMmMNfSq6sMEq+C15KKtrE47TK5La1EYfMT7Il8hapl+aePOhG7wl+8edz
 Kd3dThOiap+wrFeJCChFTuhCHcBJ28gfwazVFWmGKQjlA+6qksHZ6GS1JekDOQ==
Message-ID: <02de25f098de192445018e3179e885c34d2474b3.camel@mailbox.org>
Subject: Re: [RFC v8 06/12] drm/sched: Free all finished jobs at once
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Date: Wed, 24 Sep 2025 10:07:26 +0200
In-Reply-To: <20250903101820.63032-7-tvrtko.ursulin@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: xjk9q89un6px4bi9mpc4xfmcyf3g7eg8
X-MBO-RS-ID: c4c453220e313c89162
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

On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> To implement fair scheduling we will need as accurate as possible view
> into per entity GPU time utilisation. Because sched fence execution time
> are only adjusted for accuracy in the free worker we need to process
> completed jobs as soon as possible so the metric is most up to date when
> view from the submission side of things.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Looks like a good patch to me.

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 13 ++-----------
> =C2=A01 file changed, 2 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 97bec2f86502..9411676e772a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -906,7 +906,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sch=
ed)
> =C2=A0 * drm_sched_get_finished_job - fetch the next finished job to be d=
estroyed
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> - * @have_more: are there more finished jobs on the list
> =C2=A0 *
> =C2=A0 * Informs the caller through @have_more whether there are more fin=
ished jobs
> =C2=A0 * besides the returned one.
> @@ -915,7 +914,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sch=
ed)
> =C2=A0 * ready for it to be destroyed.
> =C2=A0 */
> =C2=A0static struct drm_sched_job *
> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_m=
ore)
> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job, *next;
> =C2=A0
> @@ -930,7 +929,6 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *=
sched, bool *have_more)
> =C2=A0		/* cancel this job's TO timer */
> =C2=A0		cancel_delayed_work(&sched->work_tdr);
> =C2=A0
> -		*have_more =3D false;

That have_more mechanism was introduced by you Tvrtko, in
36caa026b28a4, to avoid a double-lock. AFAICS this patch does not
revert the advantage of that older improvement.

So if you think that's fine there are no objections from my side.

The only thing I am wondering about is whether
drm_sched_free_job_work() might be running unnecessarily often after
this patch. It's kicked off through drm_sched_job_done() at various
places. But I tend to think that investigating optimizations there can
be left for future work, considering that it's running in a workqueue.
But please share your opinion on that if you have one


P.

> =C2=A0		next =3D list_first_entry_or_null(&sched->pending_list,
> =C2=A0						typeof(*next), list);
> =C2=A0		if (next) {
> @@ -940,8 +938,6 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *=
sched, bool *have_more)
> =C2=A0				next->s_fence->scheduled.timestamp =3D
> =C2=A0					dma_fence_timestamp(&job->s_fence->finished);
> =C2=A0
> -			*have_more =3D dma_fence_is_signaled(&next->s_fence->finished);
> -
> =C2=A0			/* start TO timer for next job */
> =C2=A0			drm_sched_start_timeout(sched);
> =C2=A0		}
> @@ -1000,14 +996,9 @@ static void drm_sched_free_job_work(struct work_str=
uct *w)
> =C2=A0	struct drm_gpu_scheduler *sched =3D
> =C2=A0		container_of(w, struct drm_gpu_scheduler, work_free_job);
> =C2=A0	struct drm_sched_job *job;
> -	bool have_more;
> =C2=A0
> -	job =3D drm_sched_get_finished_job(sched, &have_more);
> -	if (job) {
> +	while ((job =3D drm_sched_get_finished_job(sched)))
> =C2=A0		sched->ops->free_job(job);
> -		if (have_more)
> -			drm_sched_run_free_queue(sched);
> -	}
> =C2=A0
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}

