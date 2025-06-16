Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071EADADDB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0B210E32D;
	Mon, 16 Jun 2025 10:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kRG+UUUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF13A10E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HIamhGj5Ow+LQrKkxI4Twb1fxMLUTEDZJDogvvERshc=; b=kRG+UUUep/2YeJA40ygPO/KdUe
 Q59kDn2qNpwDKjghBq4oF/SptfPTv4xmntDW8K0rFJewlPv6+I+R6ksDYry8WZzoI3C1rhYeazFTE
 lSTp6ZnrLSrhBT13gjnzcWUXDl0GyGGdi6YbUAfx4YXaZG9rfiLVHTi0WPiOhVVv5qAu9PbHLJsT+
 jBzjbOuuHBVOD447x2BKjsHFaaKXe3PYwy+SkEXvbMcIns2sIfGKZb4YkXzaSEj1DL+1d1TX5b+6E
 prh220AdrnzHPUpK/m42+uc/7Ok1MiJdbA3nj/5Kan2GNe7YcAyY2ND1uBFqV3tyvQdaMX0rwLHqn
 u1F+elqQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uR7XA-0044qa-2x; Mon, 16 Jun 2025 12:57:48 +0200
Message-ID: <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com>
Date: Mon, 16 Jun 2025 11:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better role
 model
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250605134154.191764-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250605134154.191764-2-phasta@kernel.org>
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


On 05/06/2025 14:41, Philipp Stanner wrote:
> Since the drm_mock_scheduler does not have real users in userspace, nor
> does it have real hardware or firmware rings, it's not necessary to
> signal timedout fences nor free jobs - from a functional standpoint.
> 
> The unit tests, however, serve as a reference implementation and a first
> example for new scheduler users. Therefore, they should approximate the
> canonical usage as much as possible.
> 
> Make sure timed out hardware fences get signaled with the appropriate
> error code.

Code looks fine, but currently nothing is broken and I disagree with the 
goal that the _mock_^1 components should be role models. The idea is to 
implement as little in the mock components as it is required to exercise 
the tested functionality.

As the motivation for this patch, ie. things which start depending on 
adding this functionality, only appear in one upcoming series, and as 
mentioned in 
https://lore.kernel.org/dri-devel/18cd6b1f-8872-4a16-9ceb-50fd1ecfea39@igalia.com/, 
I think it makes most sense to stick with that philosophy and fold this 
patch into the respective series.

Also, there are various ways drivers use the scheduler API. Trying to 
make the mock scheduler a reference driver implementation would only be 
able to make it a reference for one possible use.

Regards,

Tvrtko

1)
mock
adjective
not authentic or real, but without the intention to deceive.
"a mock-Georgian red brick house"

> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 26 ++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 7f947ab9d322..49d067fecd67 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -200,12 +200,36 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
>   	return &job->hw_fence;
>   }
>   
> +/*
> + * Normally, drivers would take appropriate measures in this callback, such as
> + * killing the entity the faulty job is associated with, resetting the hardware
> + * and / or resubmitting non-faulty jobs.
> + *
> + * For the mock scheduler, there are no hardware rings to be resetted nor jobs
> + * to be resubmitted. Thus, this function merely ensures that
> + *   a) timedout fences get signaled properly and removed from the pending list
> + *   b) the mock scheduler framework gets informed about the timeout via a flag
> + *   c) The drm_sched_job, not longer needed, gets freed
> + */
>   static enum drm_gpu_sched_stat
>   mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   {
> +	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(sched_job->sched);
>   	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
> +	unsigned long flags;
>   
> -	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +	spin_lock_irqsave(&sched->lock, flags);
> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +		list_del(&job->link);
> +		job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
> +		dma_fence_signal_locked(&job->hw_fence);
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	dma_fence_put(&job->hw_fence);
> +	drm_sched_job_cleanup(sched_job);
> +	/* Mock job itself is freed by the kunit framework. */
>   
>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }

