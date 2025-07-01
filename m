Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A342AAEFAD3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 15:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A79810E5AD;
	Tue,  1 Jul 2025 13:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="D3AZFk3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46110E5AD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 13:38:06 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bWkcW3HwMz9sdP;
 Tue,  1 Jul 2025 15:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751377083; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fG49IWnqi5Qsh1rud8FkyB6EdwDzoRE72QFqV2fypms=;
 b=D3AZFk3DVTfhK+H1H2QGWIOeLwgkwC9uMyQOlY/FuZjuHgmyZ21Qfl1aaFq78zji03a0kj
 EN4R2CDw5UETHXl2O+UZhuZDHHaugwhF93+rFeMZisSmwE7MBRLeszahZ/+StspN88PfFD
 D9kIbpuGie/c807dDjyd4c+XCuj9JSV2AnKlnk3Sdsz6jjTy/551ie9HuTH7g/QTEc1GeC
 ic2zVfo7hqzsbX49rZuT+RFXj7AsYRQH5dLuYqZhc0V4bcMyQ5L1EyfkNsY/ChapOZcfwq
 YK8wpj2t/VXLaUdavwXeHANGp6xdU3h4kXnK22OaLWBZTbIfYvOK0dPkiAzYag==
Message-ID: <4d41dfaf0b48166c41a476f128d59785ddaeeb5f.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Jul 2025 15:37:56 +0200
In-Reply-To: <20250605134154.191764-2-phasta@kernel.org>
References: <20250605134154.191764-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: d448f7998a01351db5f
X-MBO-RS-META: 89rnnf8ig8imhwy68phfjgr1x37xts95
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

On Thu, 2025-06-05 at 15:41 +0200, Philipp Stanner wrote:
> Since the drm_mock_scheduler does not have real users in userspace,
> nor
> does it have real hardware or firmware rings, it's not necessary to
> signal timedout fences nor free jobs - from a functional standpoint.
>=20
> The unit tests, however, serve as a reference implementation and a
> first
> example for new scheduler users. Therefore, they should approximate
> the
> canonical usage as much as possible.
>=20
> Make sure timed out hardware fences get signaled with the appropriate
> error code.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Pushed that one to drm-misc-next

P.

> ---
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 26
> ++++++++++++++++++-
> =C2=A01 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 7f947ab9d322..49d067fecd67 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -200,12 +200,36 @@ static struct dma_fence
> *mock_sched_run_job(struct drm_sched_job *sched_job)
> =C2=A0	return &job->hw_fence;
> =C2=A0}
> =C2=A0
> +/*
> + * Normally, drivers would take appropriate measures in this
> callback, such as
> + * killing the entity the faulty job is associated with, resetting
> the hardware
> + * and / or resubmitting non-faulty jobs.
> + *
> + * For the mock scheduler, there are no hardware rings to be
> resetted nor jobs
> + * to be resubmitted. Thus, this function merely ensures that
> + *=C2=A0=C2=A0 a) timedout fences get signaled properly and removed from=
 the
> pending list
> + *=C2=A0=C2=A0 b) the mock scheduler framework gets informed about the t=
imeout
> via a flag
> + *=C2=A0=C2=A0 c) The drm_sched_job, not longer needed, gets freed
> + */
> =C2=A0static enum drm_gpu_sched_stat
> =C2=A0mock_sched_timedout_job(struct drm_sched_job *sched_job)
> =C2=A0{
> +	struct drm_mock_scheduler *sched =3D
> drm_sched_to_mock_sched(sched_job->sched);
> =C2=A0	struct drm_mock_sched_job *job =3D
> drm_sched_job_to_mock_job(sched_job);
> +	unsigned long flags;
> =C2=A0
> -	job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +	spin_lock_irqsave(&sched->lock, flags);
> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +		list_del(&job->link);
> +		job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
> +		dma_fence_signal_locked(&job->hw_fence);
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	dma_fence_put(&job->hw_fence);
> +	drm_sched_job_cleanup(sched_job);
> +	/* Mock job itself is freed by the kunit framework. */
> =C2=A0
> =C2=A0	return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}

