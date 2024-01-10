Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55F8297FD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B9110E75F;
	Wed, 10 Jan 2024 10:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9403310E75F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:50:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2b27a67b7fso63288366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 02:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704883811; x=1705488611; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMG+VgwiuImv+J4aaZoTzNj8WyK0Rb5bzsnLEuXbNa0=;
 b=cvTNFPoZ/sWureKmcskUY1duz9OyMmDjytLfM2zNMH9Svm50wGhWZycn4wiWSDZHYf
 gii+aq2ekuZ1ng6diGEY+LG0SjdJ5aGqJFagIUI17fcefegHYnBh5Xi10qwrm+tgc5Nn
 Mjtz6yLpP/4A+EKmWgrjLT19mK+oRFaYvXuVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704883811; x=1705488611;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMG+VgwiuImv+J4aaZoTzNj8WyK0Rb5bzsnLEuXbNa0=;
 b=NuLunz3Z5MicihvlWZ2wzkLhXgNA5Rpg7uO9VwFVEq9uBCTq9Gn0QCW9vNWwtQAz4c
 Vw/MGfTgHY2SIaWMjFzhUYXkyEXelbYRdVTZs1AIh4UYQP413E8bNiMw2yTm5HA7WfZM
 wXkFGbuBS21OwOFqmmdqHDDJBbJbojlSFfOX6xKypPzHmotzA1ZbneQg3XwAt21Umub4
 BXNQN0KYrW5FWHlqDZGXdxUkYf0nRI+msqRn89pM9FfNnqUPhsAuD1rHImfcvPnHu+tC
 VvSMWMoqCpOXtRcCEFSUJ54aGvA0XqGvNWrQAJ7yOgAtzT9fd2vDsL9wiRsJnQqAZ5wj
 aVBA==
X-Gm-Message-State: AOJu0Yx+x7o7Caj3PWzl9Lb/yO7nrVWduisT2h7ZhCbY4eUuiNucaCBg
 iJ2jHwLNq5QvglKmxbWKILSzXowxIjt3Pg==
X-Google-Smtp-Source: AGHT+IFmGBGjq+Stq8bSSseVf5E1hjSMX8cwJxnKryCkxLuDIS16HaXyqwkrbnPVGgV8P0B6D4RcWg==
X-Received: by 2002:a17:906:c2d9:b0:a2b:d12c:ee48 with SMTP id
 ch25-20020a170906c2d900b00a2bd12cee48mr784942ejb.1.1704883811018; 
 Wed, 10 Jan 2024 02:50:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a1709060c1800b00a19afc16d23sm1964347ejf.104.2024.01.10.02.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 02:50:10 -0800 (PST)
Date: Wed, 10 Jan 2024 11:50:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/gpu: Push gpu lock down past runpm"
Message-ID: <ZZ52YNc-TkeG7PZO@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240109182218.193804-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109182218.193804-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 10:22:17AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This reverts commit abe2023b4cea192ab266b351fd38dc9dbd846df0.
> 
> Changing the locking order means that scheduler/msm_job_run() can race
> with the recovery kthread worker, with the result that the GPU gets an
> extra runpm get when we are trying to power it off.  Leaving the GPU in
> an unrecovered state.

The recovery kthread is supposed to stop all the relevant schedulers,
which should remove any possible race conditions. So unless there's more
going on, or you have your own recovery kthread (don't, reuse the one from
the scheduler with your own work items, that's why you can provide that)
this looks like an incomplete/incorrect explanation ... ?

Slightly confused
-Sima

> 
> I'll need to come up with a different scheme for appeasing lockdep.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c        | 11 +++++------
>  drivers/gpu/drm/msm/msm_ringbuffer.c |  7 +++++--
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 095390774f22..655002b21b0d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -751,12 +751,14 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	struct msm_ringbuffer *ring = submit->ring;
>  	unsigned long flags;
>  
> -	pm_runtime_get_sync(&gpu->pdev->dev);
> +	WARN_ON(!mutex_is_locked(&gpu->lock));
>  
> -	mutex_lock(&gpu->lock);
> +	pm_runtime_get_sync(&gpu->pdev->dev);
>  
>  	msm_gpu_hw_init(gpu);
>  
> +	submit->seqno = submit->hw_fence->seqno;
> +
>  	update_sw_cntrs(gpu);
>  
>  	/*
> @@ -781,11 +783,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	gpu->funcs->submit(gpu, submit);
>  	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
>  
> -	hangcheck_timer_reset(gpu);
> -
> -	mutex_unlock(&gpu->lock);
> -
>  	pm_runtime_put(&gpu->pdev->dev);
> +	hangcheck_timer_reset(gpu);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index e0ed27739449..548f5266a7d3 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -21,8 +21,6 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>  
>  	msm_fence_init(submit->hw_fence, fctx);
>  
> -	submit->seqno = submit->hw_fence->seqno;
> -
>  	mutex_lock(&priv->lru.lock);
>  
>  	for (i = 0; i < submit->nr_bos; i++) {
> @@ -35,8 +33,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>  
>  	mutex_unlock(&priv->lru.lock);
>  
> +	/* TODO move submit path over to using a per-ring lock.. */
> +	mutex_lock(&gpu->lock);
> +
>  	msm_gpu_submit(gpu, submit);
>  
> +	mutex_unlock(&gpu->lock);
> +
>  	return dma_fence_get(submit->hw_fence);
>  }
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
