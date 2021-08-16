Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC63ED1BE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 12:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95D589C1B;
	Mon, 16 Aug 2021 10:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650D489875;
 Mon, 16 Aug 2021 10:14:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r7so22870319wrs.0;
 Mon, 16 Aug 2021 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HEiM/mHMC+8fZgGgGDrXO50KgFWhokpC7aZfIza5YoU=;
 b=Alj3JYG7a9UTx5Tj/BtzO+qKDd1xCGe0XdfEAcw9Dau4ACK96PX+Djr/axmyQgoX6R
 Qvw1P5WoBQ0Zu4439v4+F5DLDdDCoS2adFB2fGQ/+RfPhE2BPUKvDB4iS3xNV2DWhqEh
 ciwDM/15gCMos0rxTHUU6AcIchpqLSHjNOy5QZYERvtL+zHfGLZUj6qzXSLnKRpwB4Sf
 7DBTcFZ2h1usxN7rpOQU3MhNGARGMuAB3Eih9eKDGUQtDk5r0DupKGA+6vrFRuR4zMyE
 PeKoORolAUgrtvZWdokZqasLxdrn1iIAAu5M4MglS+0i19PVVSOYx7NsLHTJWAXq0rJS
 vE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HEiM/mHMC+8fZgGgGDrXO50KgFWhokpC7aZfIza5YoU=;
 b=p/QrrMVdQOx8qUjHyYoRUmSmSTOueqV2ERETkrpF2oYrMyChRQaqqvvcVLCZjhYkBz
 OgplBD8dNlsseQOXveyffEZPtnMkP1pwjjKlIhbe9WeKJK/PfQtgHihip73fMABQ9NP/
 t1kETFObu4JLIlB0f4tYfHbhEumtkw1Gk7pCukqaPhpIT99Oel4e3teaAGVaNnxU6Yw2
 8OmOzH6QCYNLYKeXdVPhBhDqR/tEHcCO1zrtnMLLifNn51p15Ivf249E6YsKL6P5Akm5
 JA017QBMURTaxztDe9vpFi9B+72U952evU/jXqwMk4Pd7GYJ7GXGR8//+9yeVnObo6rE
 HW8g==
X-Gm-Message-State: AOAM531AcLyJWjSWAAX2cqSZrc4HIeV1g+09Nh+AINcUdj7D+FM193UJ
 Wn8FRYWOARjUvl0H23nfM5s=
X-Google-Smtp-Source: ABdhPJxcowAPKRR0W2f+L+GI0ijJFGD6kVXHxpnQwMe320KTJy2VjSNfp1hksoEJaUJeNnRTKuOYPw==
X-Received: by 2002:adf:9084:: with SMTP id i4mr17980571wri.23.1629108876990; 
 Mon, 16 Aug 2021 03:14:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605?
 ([2a02:908:1252:fb60:7d83:fd8:eb16:8605])
 by smtp.gmail.com with ESMTPSA id q22sm10646849wmj.32.2021.08.16.03.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 03:14:36 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] drm/scheduler: Add fence deadline support
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Steven Price <steven.price@arm.com>, Roy Sun <Roy.Sun@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>
References: <20210807183804.459850-1-robdclark@gmail.com>
 <20210807183804.459850-5-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e28020c5-3da3-c721-96df-9a115f105bf7@gmail.com>
Date: Mon, 16 Aug 2021 12:14:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807183804.459850-5-robdclark@gmail.com>
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

Am 07.08.21 um 20:37 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> As the finished fence is the one that is exposed to userspace, and
> therefore the one that other operations, like atomic update, would
> block on, we need to propagate the deadline from from the finished
> fence to the actual hw fence.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
>   include/drm/gpu_scheduler.h             |  6 ++++++
>   3 files changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 69de2c76731f..f389dca44185 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>   	dma_fence_put(&fence->scheduled);
>   }
>   
> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> +						  ktime_t deadline)
> +{
> +	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fence->lock, flags);
> +
> +	/* If we already have an earlier deadline, keep it: */
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> +	    ktime_before(fence->deadline, deadline)) {
> +		spin_unlock_irqrestore(&fence->lock, flags);
> +		return;
> +	}
> +
> +	fence->deadline = deadline;
> +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> +
> +	spin_unlock_irqrestore(&fence->lock, flags);
> +
> +	if (fence->parent)
> +		dma_fence_set_deadline(fence->parent, deadline);
> +}
> +
>   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>   	.get_driver_name = drm_sched_fence_get_driver_name,
>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>   	.get_driver_name = drm_sched_fence_get_driver_name,
>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
>   	.release = drm_sched_fence_release_finished,
> +	.set_deadline = drm_sched_fence_set_deadline_finished,
>   };
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a2a953693b45..3ab0900d3596 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -818,6 +818,9 @@ static int drm_sched_main(void *param)
>   
>   		if (!IS_ERR_OR_NULL(fence)) {
>   			s_fence->parent = dma_fence_get(fence);
> +			if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> +				     &s_fence->finished.flags))
> +				dma_fence_set_deadline(fence, s_fence->deadline);

Maybe move this into a dma_sched_fence_set_parent() function.

Apart from that looks good to me.

Regards,
Christian.

>   			r = dma_fence_add_callback(fence, &sched_job->cb,
>   						   drm_sched_job_done_cb);
>   			if (r == -ENOENT)
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d18af49fd009..0f08ade614ae 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -144,6 +144,12 @@ struct drm_sched_fence {
>            */
>   	struct dma_fence		finished;
>   
> +	/**
> +	 * @deadline: deadline set on &drm_sched_fence.finished which
> +	 * potentially needs to be propagated to &drm_sched_fence.parent
> +	 */
> +	ktime_t				deadline;
> +
>           /**
>            * @parent: the fence returned by &drm_sched_backend_ops.run_job
>            * when scheduling the job on hardware. We signal the

