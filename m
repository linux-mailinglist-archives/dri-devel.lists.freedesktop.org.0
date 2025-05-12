Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199CBAB37DD
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6325E10E3D8;
	Mon, 12 May 2025 12:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="e0lnN0sM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE85E10E3D8;
 Mon, 12 May 2025 12:54:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Zx00m5cXZz9sVN;
 Mon, 12 May 2025 14:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747054440; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUMHVdcBT6hONN53sipPKqMSJcL1ARCfFYJs9UxsjDs=;
 b=e0lnN0sMs53rEjAyEVEg5ljoPrDqODxmcDlh+akh0uSHsF+TPMDYFjM/a8PIbjG1SMxp/C
 n6yKBgzkcpn0BscSEsrKLuOMIssiV6vUcIcUtkZnw5rTJ5KSgSc6kU19yeuiDp6Q+wL/JV
 oBYwSmLsgh1aJ6fcoTqeJDxSRSAoAVqJxw4mnirHfCHqZ5BlWFqin1JaiI+urDlJScqMYV
 KouSDoTEj+5WBXBPFrFTGpDfO32hKKiA8sYBThnkXpBDE/j2yM3ACZxnzRsgbFoDV6TRGo
 sQlVSaMi9omA3s5Q9MFwhBYYvToKLS/XdM16JDLNS/CZRrH0kObb1zgJJvRDNQ==
Message-ID: <207366049668e3df24ac81cd9f2e07bc1a2358ad.camel@mailbox.org>
Subject: Re: [RFC v4 05/16] drm/sched: Consolidate drm_sched_job_timedout
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 12 May 2025 14:53:58 +0200
In-Reply-To: <20250425102034.85133-6-tvrtko.ursulin@igalia.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 836d991e4c9fce4efaf
X-MBO-RS-META: co8ab7gq1w6rt6cqgf5539eqnd7d4r7y
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
> Reduce to one spin_unlock for hopefully a little bit clearer flow in
> the
> function. It may appear that there is a behavioural change with the
> drm_sched_start_timeout_unlocked() now not being called if there were
> initially no jobs on the pending list, and then some appeared after
> unlock, however if the code would rely on the TDR handler restarting
> itself then it would fail to do that if the job arrived on the
> pending
> list after the check.
>=20
> Also fix one stale comment while touching the function.

Same here, that's a good candidate for a separate patch / series.

P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 37 +++++++++++++----------=
-
> --
> =C2=A01 file changed, 18 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index a45b02fd2af3..a26cc11c8ade 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -516,38 +516,37 @@ static void drm_sched_job_begin(struct
> drm_sched_job *s_job)
> =C2=A0
> =C2=A0static void drm_sched_job_timedout(struct work_struct *work)
> =C2=A0{
> -	struct drm_gpu_scheduler *sched;
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(work, struct drm_gpu_scheduler,
> work_tdr.work);
> +	enum drm_gpu_sched_stat status;
> =C2=A0	struct drm_sched_job *job;
> -	enum drm_gpu_sched_stat status =3D DRM_GPU_SCHED_STAT_NOMINAL;
> -
> -	sched =3D container_of(work, struct drm_gpu_scheduler,
> work_tdr.work);
> =C2=A0
> =C2=A0	/* Protects against concurrent deletion in
> drm_sched_get_finished_job */
> =C2=A0	spin_lock(&sched->job_list_lock);
> =C2=A0	job =3D list_first_entry_or_null(&sched->pending_list,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job, list=
);
> -
> =C2=A0	if (job) {
> =C2=A0		/*
> =C2=A0		 * Remove the bad job so it cannot be freed by
> concurrent
> -		 * drm_sched_cleanup_jobs. It will be reinserted
> back after sched->thread
> -		 * is parked at which point it's safe.
> +		 * drm_sched_get_finished_job. It will be reinserted
> back after
> +		 * scheduler worker is stopped at which point it's
> safe.
> =C2=A0		 */
> =C2=A0		list_del_init(&job->list);
> -		spin_unlock(&sched->job_list_lock);
> +	}
> +	spin_unlock(&sched->job_list_lock);
> =C2=A0
> -		status =3D job->sched->ops->timedout_job(job);
> +	if (!job)
> +		return;
> =C2=A0
> -		/*
> -		 * Guilty job did complete and hence needs to be
> manually removed
> -		 * See drm_sched_stop doc.
> -		 */
> -		if (sched->free_guilty) {
> -			job->sched->ops->free_job(job);
> -			sched->free_guilty =3D false;
> -		}
> -	} else {
> -		spin_unlock(&sched->job_list_lock);
> +	status =3D job->sched->ops->timedout_job(job);
> +
> +	/*
> +	 * Guilty job did complete and hence needs to be manually
> removed. See
> +	 * documentation for drm_sched_stop.
> +	 */
> +	if (sched->free_guilty) {
> +		job->sched->ops->free_job(job);
> +		sched->free_guilty =3D false;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (status !=3D DRM_GPU_SCHED_STAT_ENODEV)

