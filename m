Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E77ACAA40
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A3410E268;
	Mon,  2 Jun 2025 07:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JAGMVMHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809EC10E268
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zdlCEeVUF00zQmejJCPvNPj1mEF7JVnwwI488w34Yp4=; b=JAGMVMHs5wf6yum9C+K1SKtaS2
 PVIm/YKmwXru4q7WOgDyM2q3z1KJvVTH9ZOnXGPngr7dhXg0NLfvXDv3L47o0aNwCXF/31+qOKXEn
 6A11OGevXgn2w2lPAIrRxIdoR8sDNdDpvIfbO8IsRnFnfCY1mN4ji9i6wRCMn+Qhe0JOlhb7E9GWA
 ryaeRQx+tQdvU73KLpnaURFiYlQ5j+wFrX/ijd8a2S1deagE1/YkeHN7S8S5NKtQHtRNNeJ6Znxa3
 856tsj06ytZqI7Az5lDnps2f7uDjDYBmB/EaDV6AMNVREj3sN1OGddpWUwkXYfdLR9d8w+9ciKeXj
 5UBAxOQw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uM03z-00GCSq-9Y; Mon, 02 Jun 2025 09:58:31 +0200
Message-ID: <9783f727-faad-44bb-b47d-3ba06ef8b82d@igalia.com>
Date: Mon, 2 Jun 2025 08:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched/tests: Use one lock for fence context
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250527101029.56491-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250527101029.56491-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 27/05/2025 11:10, Philipp Stanner wrote:
> There is no need for separate locks for single jobs and the entire
> scheduler. The dma_fence context can be protected by the scheduler lock,
> allowing for removing the jobs' locks. This simplifies things and
> reduces the likelyhood of deadlocks etc.
> 
> Replace the jobs' locks with the mock scheduler lock.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>    - Make commit message more neutral by stating it's about simplifying
>      the code. (Tvrtko)
> ---
>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 5 ++---
>   drivers/gpu/drm/scheduler/tests/sched_tests.h    | 1 -
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..17023276f4b0 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -64,7 +64,7 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
>   
>   	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
>   	list_move_tail(&job->link, &sched->done_list);
> -	dma_fence_signal(&job->hw_fence);
> +	dma_fence_signal_locked(&job->hw_fence);
>   	complete(&job->done);
>   }
>   
> @@ -123,7 +123,6 @@ drm_mock_sched_job_new(struct kunit *test,
>   	job->test = test;
>   
>   	init_completion(&job->done);
> -	spin_lock_init(&job->lock);
>   	INIT_LIST_HEAD(&job->link);
>   	hrtimer_setup(&job->timer, drm_mock_sched_job_signal_timer,
>   		      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> @@ -169,7 +168,7 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
>   
>   	dma_fence_init(&job->hw_fence,
>   		       &drm_mock_sched_hw_fence_ops,
> -		       &job->lock,
> +		       &sched->lock,
>   		       sched->hw_timeline.context,
>   		       atomic_inc_return(&sched->hw_timeline.next_seqno));
>   
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 27caf8285fb7..fbba38137f0c 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -106,7 +106,6 @@ struct drm_mock_sched_job {
>   	unsigned int		duration_us;
>   	ktime_t			finish_at;
>   
> -	spinlock_t		lock;
>   	struct dma_fence	hw_fence;
>   
>   	struct kunit		*test;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

