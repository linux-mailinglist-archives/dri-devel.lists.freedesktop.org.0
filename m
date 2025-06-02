Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5FACAD36
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5D610E4F9;
	Mon,  2 Jun 2025 11:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Nuy+wV5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B8010E4F9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 11:28:39 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b9s6X2GNHz9spJ;
 Mon,  2 Jun 2025 13:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748863716; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nr8qXtPIgbMMdXUGn/RWMazMygXo495Zeik7yKT8EyY=;
 b=Nuy+wV5KpNAobQOWCOOmNX3L+95dmYfC6nA38zzGHGSxDHWYgyOGfPp7hquMCmjbkaIvml
 602nhle+ALj4kSGO/FZfN8iLzkjz95oztiJ9igJUPuD7eIM5UprPuqXu0mTzvpf5JxFqTn
 ZoC+UItGkRuDSfBL61lU8oKKlLQG8MhmVDr2E5QvEc7QVbgKXgZpZlJHK9OIgc8J2Ckg6A
 /bW/4DBMRjQUxhXL5IN2HH+jXz1rF6Mm2Mc6pagi5aFhm4qFkpbZ/Xnd+DZhLOx2g79g9N
 cErfdlprwyxBg/15pguVaVFXygA3U/bW35gM0ak53gXMMQAqWAAxj9vOCtC8EQ==
Message-ID: <d47a1e33a0579deb13a0327cc20f43a414e90f57.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched/tests: Use one lock for fence context
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 02 Jun 2025 13:28:32 +0200
In-Reply-To: <20250527101029.56491-2-phasta@kernel.org>
References: <20250527101029.56491-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: nfifcbut9b44xbk655tqfxkkct9ccyku
X-MBO-RS-ID: 613d9d97a584c2ad33c
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

On Tue, 2025-05-27 at 12:10 +0200, Philipp Stanner wrote:
> There is no need for separate locks for single jobs and the entire
> scheduler. The dma_fence context can be protected by the scheduler
> lock,
> allowing for removing the jobs' locks. This simplifies things and
> reduces the likelyhood of deadlocks etc.
>=20
> Replace the jobs' locks with the mock scheduler lock.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-next

P.

> ---
> Changes in v2:
> =C2=A0 - Make commit message more neutral by stating it's about
> simplifying
> =C2=A0=C2=A0=C2=A0 the code. (Tvrtko)
> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 5 ++---
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h=C2=A0=C2=A0=C2=A0 | 1=
 -
> =C2=A02 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..17023276f4b0 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -64,7 +64,7 @@ static void drm_mock_sched_job_complete(struct
> drm_mock_sched_job *job)
> =C2=A0
> =C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_DONE;
> =C2=A0	list_move_tail(&job->link, &sched->done_list);
> -	dma_fence_signal(&job->hw_fence);
> +	dma_fence_signal_locked(&job->hw_fence);
> =C2=A0	complete(&job->done);
> =C2=A0}
> =C2=A0
> @@ -123,7 +123,6 @@ drm_mock_sched_job_new(struct kunit *test,
> =C2=A0	job->test =3D test;
> =C2=A0
> =C2=A0	init_completion(&job->done);
> -	spin_lock_init(&job->lock);
> =C2=A0	INIT_LIST_HEAD(&job->link);
> =C2=A0	hrtimer_setup(&job->timer, drm_mock_sched_job_signal_timer,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLOCK_MONOTONIC, HRTIMER_MODE_ABS)=
;
> @@ -169,7 +168,7 @@ static struct dma_fence
> *mock_sched_run_job(struct drm_sched_job *sched_job)
> =C2=A0
> =C2=A0	dma_fence_init(&job->hw_fence,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_mock_sched_hw_fence_ops=
,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &job->lock,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sched->lock,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched->hw_timeline.context,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc_return(&sched-
> >hw_timeline.next_seqno));
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 27caf8285fb7..fbba38137f0c 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -106,7 +106,6 @@ struct drm_mock_sched_job {
> =C2=A0	unsigned int		duration_us;
> =C2=A0	ktime_t			finish_at;
> =C2=A0
> -	spinlock_t		lock;
> =C2=A0	struct dma_fence	hw_fence;
> =C2=A0
> =C2=A0	struct kunit		*test;

