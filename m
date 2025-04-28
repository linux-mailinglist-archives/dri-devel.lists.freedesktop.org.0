Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279FEA9E7D2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 07:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE20010E185;
	Mon, 28 Apr 2025 05:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LAgdQ1bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916B910E185
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 05:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1k1pJaFY2vinDCz5f7Qz2btimtbywPDOiib+3gnfllI=; b=LAgdQ1bnXSMyDAxS7iTYI+rFG7
 uSrK+4xNrjzdLVXGbG0oGIIXbSwtkauqbXLgKMA0bE2HqNeleytvugMeStMP1eiact6BhS8PX8X3W
 5RQnRxKgYwgKYEHq1j544SVcAQzgViFWrh+unmkLL7j/kT1q/quNNt6lvzkw2Mx5XkFcMWQ0rrNAX
 7ZiQag80/jQVq7NuXmuKQ5DWQScTUwTRAlyg3ToKacwRqcX+vm8lvQd5wawaKr3Ndn9mhki5TjvYx
 L1fZ3Li+frukEoOl3UiBBTawTzrg/l4gyEyGQZZwkt+ovdQcTkkYq2PGm+EVVWR7IsaOygzQnPkJA
 QGSIdhMw==;
Received: from [159.147.214.238] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u9HJM-009dAc-4Q; Mon, 28 Apr 2025 07:45:48 +0200
Message-ID: <ace509ac67221d5a3e7215ea132c8155179850e4.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Add job to pending list if the reset was skipped
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 stable@vger.kernel.org, Daivik Bhatia <dtgs1208@gmail.com>
Date: Mon, 28 Apr 2025 07:45:37 +0200
In-Reply-To: <20250427202907.94415-2-mcanal@igalia.com>
References: <20250427202907.94415-2-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maira,

Looks good to me, but don't we need to do the same in
v3d_csd_job_timedout?

Iago

El dom, 27-04-2025 a las 17:28 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> When a CL/CSD job times out, we check if the GPU has made any
> progress
> since the last timeout. If so, instead of resetting the hardware, we
> skip
> the reset and let the timer get rearmed. This gives long-running jobs
> a
> chance to complete.
>=20
> However, when `timedout_job()` is called, the job in question is
> removed
> from the pending list, which means it won't be automatically freed
> through
> `free_job()`. Consequently, when we skip the reset and keep the job
> running, the job won't be freed when it finally completes.
>=20
> This situation leads to a memory leak, as exposed in [1].
>=20
> Similarly to commit 704d3d60fec4 ("drm/etnaviv: don't block scheduler
> when
> GPU is still active"), this patch ensures the job is put back on the
> pending list when extending the timeout.
>=20
> Cc: stable@vger.kernel.org=C2=A0# 6.0
> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/12227=C2=A0[1]
> Reported-by: Daivik Bhatia <dtgs1208@gmail.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c | 18 +++++++++++-------
> =C2=A01 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index b3be08b0ca91..a98dcf9d75b1 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -734,11 +734,6 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d,
> struct drm_sched_job *sched_job)
> =C2=A0	return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}
> =C2=A0
> -/* If the current address or return address have changed, then the
> GPU
> - * has probably made progress and we should delay the reset.=C2=A0 This
> - * could fail if the GPU got in an infinite loop in the CL, but that
> - * is pretty unlikely outside of an i-g-t testcase.
> - */
> =C2=A0static enum drm_gpu_sched_stat
> =C2=A0v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue
> q,
> =C2=A0		=C2=A0=C2=A0=C2=A0 u32 *timedout_ctca, u32 *timedout_ctra)
> @@ -748,9 +743,16 @@ v3d_cl_job_timedout(struct drm_sched_job
> *sched_job, enum v3d_queue q,
> =C2=A0	u32 ctca =3D V3D_CORE_READ(0, V3D_CLE_CTNCA(q));
> =C2=A0	u32 ctra =3D V3D_CORE_READ(0, V3D_CLE_CTNRA(q));
> =C2=A0
> +	/* If the current address or return address have changed,
> then the GPU
> +	 * has probably made progress and we should delay the reset.
> This
> +	 * could fail if the GPU got in an infinite loop in the CL,
> but that
> +	 * is pretty unlikely outside of an i-g-t testcase.
> +	 */
> =C2=A0	if (*timedout_ctca !=3D ctca || *timedout_ctra !=3D ctra) {
> =C2=A0		*timedout_ctca =3D ctca;
> =C2=A0		*timedout_ctra =3D ctra;
> +
> +		list_add(&sched_job->list, &sched_job->sched-
> >pending_list);
> =C2=A0		return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0	}
> =C2=A0
> @@ -790,11 +792,13 @@ v3d_csd_job_timedout(struct drm_sched_job
> *sched_job)
> =C2=A0	struct v3d_dev *v3d =3D job->base.v3d;
> =C2=A0	u32 batches =3D V3D_CORE_READ(0, V3D_CSD_CURRENT_CFG4(v3d-
> >ver));
> =C2=A0
> -	/* If we've made progress, skip reset and let the timer get
> -	 * rearmed.
> +	/* If we've made progress, skip reset, add the job to the
> pending
> +	 * list, and let the timer get rearmed.
> =C2=A0	 */
> =C2=A0	if (job->timedout_batches !=3D batches) {
> =C2=A0		job->timedout_batches =3D batches;
> +
> +		list_add(&sched_job->list, &sched_job->sched-
> >pending_list);
> =C2=A0		return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0	}
> =C2=A0

