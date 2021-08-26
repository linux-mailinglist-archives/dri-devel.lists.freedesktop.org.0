Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304EE3F8511
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 12:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638366E5BD;
	Thu, 26 Aug 2021 10:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AAD6E5BB;
 Thu, 26 Aug 2021 10:09:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i3so1472221wmq.3;
 Thu, 26 Aug 2021 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uZ1qLJeTicecrqtFuYf9FwbLo4cM1INmqJXkTjbct+Q=;
 b=SlUYhCA+OE1h3gNwlvKLRcvkwxGaL8pWz8A85e26nzuM6f7RRvCtgKNGRw5GPug0C5
 3DSfBXJZGxVTrVAvkfDCi1V+7/C+cMYZtcVuDV0jpxQPXXWHjDdaV3yg+aV7WbcwS/8e
 tSOlRZgfWQry/w5bqK5z/G0KprDPNxZmzBUymT0GsY7k1V06J2U1XAX0DEbaGD0mNKm/
 jhk+kXKWMBWaH/G2QlBii6Xxe2aq+5WAT/cewVcLZ9CH4Sc4qBizoV4EBNfCbJZCocNh
 MNB5v9cSzSvIFWB/WvGBjj7eEARpHqDDqCZKWNGWfw/rC45HRRMuAkcWtMFRaROKiZoU
 PPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uZ1qLJeTicecrqtFuYf9FwbLo4cM1INmqJXkTjbct+Q=;
 b=rNJmNqlybewI7B3g3GU0Nj6zUi5Wtvs1Wk25cAzKlhOn6Ijc7uQUn4PMNBnE1YzbbY
 2jEGsdewlew7bg9mYTG4Ul6snKSeQyMbLOMtiNwLPTVVK/1yrq4ZnrrYLsUS4AEYoSSU
 IGkdz+40jMRRQzmGyq/B/0YOspp+uLFYWdF4IbjVFIq0LdXo1jyvmPg31RPhGGSWX2LA
 phNIG+1xZK7oN4xwxSWOY4gZHsmhUHPbgHu55/Yc0U4ElcAKChNItPXTNcYotV3VJtRj
 IgmIop1cU7+b0O7b59a/ICFQ43I0L1uTohd1Wykx9mNd3cucDGaOavBZ50uQ+9CiiOtY
 nW8Q==
X-Gm-Message-State: AOAM530T8CQi4TWrFHGGb261GHIfj/+80HjkwPTZcSkmp55CCbGZAOPU
 8rOpOMVFdKfX8BXl4nKkm8NrTVZCYDs=
X-Google-Smtp-Source: ABdhPJw1kHR8AKMC9dLqd2C2sY3XL0UgaEy2sIOxCJP1tLJIHxfWpj/E50ildXDoBgXl8ycDfJWcpQ==
X-Received: by 2002:a05:600c:4fcc:: with SMTP id
 o12mr2860683wmq.0.1629972553284; 
 Thu, 26 Aug 2021 03:09:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f034:47d2:6ee4:c70f?
 ([2a02:908:1252:fb60:f034:47d2:6ee4:c70f])
 by smtp.gmail.com with ESMTPSA id q17sm2632014wrr.91.2021.08.26.03.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 03:09:12 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e000dc1a-8fe8-ea69-e16b-bf0b64d773f2@gmail.com>
Date: Thu, 26 Aug 2021 12:09:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Am 26.08.21 um 06:55 schrieb Monk Liu:
> issue:
> in cleanup_job the cancle_delayed_work will cancel a TO timer
> even the its corresponding job is still running.

Yeah, that makes a lot more sense.

>
> fix:
> do not cancel the timer in cleanup_job, instead do the cancelling
> only when the heading job is signaled, and if there is a "next" job
> we start_timeout again.
>
> v2:
> further cleanup the logic, and do the TDR timer cancelling if the signaled job
> is the last one in its scheduler.
>
> v3:
> change the issue description
> remove the cancel_delayed_work in the begining of the cleanup_job
> recover the implement of drm_sched_job_begin.
>
> TODO:
> 1)introduce pause/resume scheduler in job_timeout to serial the handling
> of scheduler and job_timeout.
> 2)drop the bad job's del and insert in scheduler due to above serialization
> (no race issue anymore with the serialization)
>
> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a2a9536..ecf8140 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   {
>   	struct drm_sched_job *job, *next;
>   
> -	/*
> -	 * Don't destroy jobs while the timeout worker is running  OR thread
> -	 * is being parked and hence assumed to not touch pending_list
> -	 */
> -	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> -	    !cancel_delayed_work(&sched->work_tdr)) ||
> -	    kthread_should_park())
> +	if (kthread_should_park())
>   		return NULL;
>   
>   	spin_lock(&sched->job_list_lock);
> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
> +
> +		/* cancel this job's TO timer */
> +		cancel_delayed_work(&sched->work_tdr);

I'm not sure if the work_tdr is initialized when a maximum timeout is 
specified. Please double check.

BTW: Can we please drop the "tdr" naming from the scheduler? That is 
just a timeout functionality and not related to recovery in any way.

We even do not start hardware recovery in a lot of cases now (when wave 
kill is successfully).

Regards,
Christian.

>   		/* make the scheduled timestamp more accurate */
>   		next = list_first_entry_or_null(&sched->pending_list,
>   						typeof(*next), list);
> -		if (next)
> +
> +		if (next) {
>   			next->s_fence->scheduled.timestamp =
>   				job->s_fence->finished.timestamp;
> -
> +			/* start TO timer for next job */
> +			drm_sched_start_timeout(sched);
> +		}
>   	} else {
>   		job = NULL;
> -		/* queue timeout for next job */
> -		drm_sched_start_timeout(sched);
>   	}
>   
>   	spin_unlock(&sched->job_list_lock);
> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>   					  (entity = drm_sched_select_entity(sched))) ||
>   					 kthread_should_stop());
>   
> -		if (cleanup_job) {
> +		if (cleanup_job)
>   			sched->ops->free_job(cleanup_job);
> -			/* queue timeout for next job */
> -			drm_sched_start_timeout(sched);
> -		}
>   
>   		if (!entity)
>   			continue;

