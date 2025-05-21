Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1AABF174
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 12:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58A810E89E;
	Wed, 21 May 2025 10:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hqJZh2Fp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28A010E912
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eGUuBjf2T+dXYw2MgC/LPb3FuKSF2ONtaVy7uZ5dEvM=; b=hqJZh2Fp/94yukGVa+hvqy8C8f
 B/l11rDtTHTtYYFVBcCrY+lBZspkSWtlCpnQISU3UmN2S1lR61KjCMU3vENAtzqrNnKxYfZS5iRzJ
 MuEOO6vlKLxAPwdBnLuq5W4NTvpYaXFZ6lih7Klh+hhRrRbCOUaj5CoD492cXSlwYHsPM3rC6wooZ
 blooi8k9qCrq5JCtBoJTCDKbvZtlbr2UV6CYY1ZyiYzZX0Pbi8ZTyLk5xRyJ7LOWD2g3nIuRsXzQV
 OUE4XxPv9aj+8SD/49MQvSIlf8lp8EE36nrAYCSNtQGCVcTY8n/Lvqbupyj4w4BRd5afD/cdWLuNE
 kE5nTTTQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uHgcQ-00B99H-VX; Wed, 21 May 2025 12:24:15 +0200
Message-ID: <29124381-6949-4828-9b57-dc2dc0f55107@igalia.com>
Date: Wed, 21 May 2025 11:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched/tests: Use one lock for fence context
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250521100440.110019-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250521100440.110019-2-phasta@kernel.org>
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


On 21/05/2025 11:04, Philipp Stanner wrote:
> When the unit tests were implemented, each scheduler job got its own,
> distinct lock. This is not how dma_fence context locking rules are to be
> implemented. All jobs belonging to the same fence context (in this case:
> scheduler) should share a lock for their dma_fences. This is to comply
> to various dma_fence rules, e.g., ensuring that only one fence gets
> signaled at a time.
> 
> Use the fence context (scheduler) lock for the jobs.

I think for the mock scheduler it works to share the lock, but I don't 
think see that the commit message is correct. Where do you see the 
requirement to share the lock? AFAIK fence->lock is a fence lock, 
nothing more semantically.

And what does "ensuring that only one fence gets signalled at a time" 
mean? You mean signal in seqno order? Even that is not guaranteed in the 
contract due opportunistic signalling.

Regards,

Tvrtko

> Signed-off-by: Philipp Stanner <phasta@kernel.org>
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

