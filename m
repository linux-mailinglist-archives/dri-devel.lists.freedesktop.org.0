Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D423FD3FC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 08:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9734C6E06D;
	Wed,  1 Sep 2021 06:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EEC6E06D;
 Wed,  1 Sep 2021 06:50:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g18so2756858wrc.11;
 Tue, 31 Aug 2021 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mtfydqR20tpaXs1lG6XWMZrLZrEt0a+YB+oBSPUyY1s=;
 b=VQX9niGHaKLWfNuuhiDLAW5t//EqZKvJsx/ziL8DVgVajip9llyBLl9n15pSQQXjWu
 JGmD82KOXFZrbTVhkp//VNu2xxQtcpQAuNGeToA1gRylo5N9gl4TAFTMBk+yu5dkajyH
 Ps0fhfGh3z68kwBKrsqCQHpM+lmpA39N2EtzFjcFsEnuriuNZBI+XzWbHlTcf0as3fIG
 eJAraK8h6wrywEN4uAaWVp8rz6IWoLUrgXGPhG8SWE+/FgAXU1QOTCt+simG1el3Dn4l
 UF0QsDGbszCPsWWKSULPx8Bmdar5eoa0Ea0nkItb6SyA+FuDXfiWq08zEfVy6eS42Jun
 TQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mtfydqR20tpaXs1lG6XWMZrLZrEt0a+YB+oBSPUyY1s=;
 b=rSoMUi+gyqvwbIV1frYGcDtvy/h3OU92V05BirznIpyAMiL6Aj3Uaw3yvR6AZIjKZV
 yMKG5yb/b+qmHCcWDaadAyzLf2e3fEWU/xWwarTo5757YtPdLo12HVbQLtk0Ko6rLkz0
 LzgDae+kLBEyhZ47q4nkNf769QMnS2Hk5RAaMoN6MUL3pU4ar/TuRyDqkFFuG6cRThnQ
 7BkS44RSdGlKa/zwkPlMVreL1fKUsQn+u4Cq8nhh9AFHRHeM2fwhYb4eUmlWDJWRxRkU
 yyJu5gPc7EmaHqtHs+81EkNIxZWCgr+evQgdbBueDB8eEMAsmfixSXvSmPosSEl8IWu0
 /1og==
X-Gm-Message-State: AOAM533J98Mi6rOV8EU/T6PZo/uCYJX2TUhbQgetVjUzmRm+TbeZlAkD
 3yemdLmPt+78LQsQ2ujCiQ4orOZLkpy1kU/2
X-Google-Smtp-Source: ABdhPJzL9tfa1ZRe3t/yH1nXI4RG0HGyljMoTS6GIsMpvShq6YZLZ48tphUlcJRRk46ySQZdPE6G7Q==
X-Received: by 2002:adf:c149:: with SMTP id w9mr20108060wre.127.1630479040090; 
 Tue, 31 Aug 2021 23:50:40 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id l35sm2233454wms.40.2021.08.31.23.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 23:50:38 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <28709f7f-8a48-40ad-87bb-c2f0dd89da38@gmail.com>
Date: Wed, 1 Sep 2021 08:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 01.09.21 um 02:46 schrieb Monk Liu:
> issue:
> in cleanup_job the cancle_delayed_work will cancel a TO timer
> even the its corresponding job is still running.
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
> v4:
> remove the kthread_should_park() checking in cleanup_job routine,
> we should cleanup the signaled job asap
>
> TODO:
> 1)introduce pause/resume scheduler in job_timeout to serial the handling
> of scheduler and job_timeout.
> 2)drop the bad job's del and insert in scheduler due to above serialization
> (no race issue anymore with the serialization)
>
> tested-by: jingwen <jingwen.chen@@amd.com>
> Signed-off-by: Monk Liu <Monk.Liu@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 26 +++++++++-----------------
>   1 file changed, 9 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a2a9536..3e0bbc7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
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
> -		return NULL;
> -
>   	spin_lock(&sched->job_list_lock);
>   
>   	job = list_first_entry_or_null(&sched->pending_list,
> @@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
> +
> +		/* cancel this job's TO timer */
> +		cancel_delayed_work(&sched->work_tdr);
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
> @@ -791,11 +786,8 @@ static int drm_sched_main(void *param)
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

