Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88DAB37ED
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570D710E3F7;
	Mon, 12 May 2025 12:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lkh8e8+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3210E3E4;
 Mon, 12 May 2025 12:56:35 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Zx03h1Yfbz9sp7;
 Mon, 12 May 2025 14:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747054592; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+vn4wBMniz8+qAb8MtHnhUqqpqc5Vfhr524jiNGzEI=;
 b=lkh8e8+Q7iGf7w8HqMI8KpZX4uuUEgD72suYXT9bz3aBoQ3ydB8csPDwPRIZgt8Ffd7t8A
 15MZRIwleG3p6xI7Benke9tZdKD+pr8U6fgkJZ5Q00+8azLX4nfuue0eG/ujUCeKPb4f5U
 yKe+qCMcuP0O2++Faxi3tFWXx1y+Riuxjurv21WV8sRKNLRJq0AF8pSovUsg4s8qTYj0df
 aJ0Hk+TA36gnoYibxYDRasuAUOOPilBsQxbb1SYmtREc4uUXo3PxOs8kRFpDMkqTd4+cLZ
 maql/H41jH5BSBCJWyn2AhVFRTwtXhofeVaSRg35ZjD8yN0YOwGW2fHdFRpqrg==
Message-ID: <be814eed623a1b99f7ec5246fbe177213d763fdf.camel@mailbox.org>
Subject: Re: [RFC v4 10/16] drm/sched: Free all finished jobs at once
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 12 May 2025 14:56:29 +0200
In-Reply-To: <20250425102034.85133-11-tvrtko.ursulin@igalia.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-11-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 9c8ffe5342edfec0478
X-MBO-RS-META: 55b58w93fomsa57rmjzbxwhjukbku44g
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

On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
> To implement fair scheduling we will need as accurate as possible
> view
> into per entity GPU time utilisation. Because sched fence execution
> time
> are only adjusted for accuracy in the free worker we need to process
> completed jobs as soon as possible so the metric is most up to date
> when
> view from the submission side of things.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 15 ++-------------
> =C2=A01 file changed, 2 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 8950c7705f57..22428a1569dd 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -865,13 +865,12 @@ drm_sched_select_entity(struct
> drm_gpu_scheduler *sched)
> =C2=A0 * drm_sched_get_finished_job - fetch the next finished job to be
> destroyed
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> - * @have_more: are there more finished jobs on the list
> =C2=A0 *
> =C2=A0 * Returns the next finished job from the pending list (if there is
> one)
> =C2=A0 * ready for it to be destroyed.
> =C2=A0 */
> =C2=A0static struct drm_sched_job *
> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool
> *have_more)
> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job, *next;
> =C2=A0
> @@ -886,7 +885,6 @@ drm_sched_get_finished_job(struct
> drm_gpu_scheduler *sched, bool *have_more)
> =C2=A0		/* cancel this job's TO timer */
> =C2=A0		cancel_delayed_work(&sched->work_tdr);
> =C2=A0
> -		*have_more =3D false;
> =C2=A0		next =3D list_first_entry_or_null(&sched-
> >pending_list,
> =C2=A0						typeof(*next),
> list);
> =C2=A0		if (next) {
> @@ -896,10 +894,6 @@ drm_sched_get_finished_job(struct
> drm_gpu_scheduler *sched, bool *have_more)
> =C2=A0				next->s_fence->scheduled.timestamp =3D
> =C2=A0					dma_fence_timestamp(&job-
> >s_fence->finished);
> =C2=A0
> -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> >finished.flags))
> -				*have_more =3D true;
> -
> =C2=A0			/* start TO timer for next job */
> =C2=A0			drm_sched_start_timeout(sched);
> =C2=A0		}
> @@ -958,14 +952,9 @@ static void drm_sched_free_job_work(struct
> work_struct *w)
> =C2=A0	struct drm_gpu_scheduler *sched =3D
> =C2=A0		container_of(w, struct drm_gpu_scheduler,
> work_free_job);
> =C2=A0	struct drm_sched_job *job;
> -	bool have_more;
> =C2=A0
> -	job =3D drm_sched_get_finished_job(sched, &have_more);
> -	if (job) {
> +	while ((job =3D drm_sched_get_finished_job(sched)))
> =C2=A0		sched->ops->free_job(job);
> -		if (have_more)
> -			__drm_sched_run_free_queue(sched);
> -	}

Are there any have_more users left after that?

Removing here what was added before IMO makes it more questionable
adding that improvement in the first place.

P.

> =C2=A0
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}

