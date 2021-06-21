Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6943AEC0F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909A6E1B8;
	Mon, 21 Jun 2021 15:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 964E66E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:10:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EB361042;
 Mon, 21 Jun 2021 08:10:45 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 056503F694;
 Mon, 21 Jun 2021 08:10:43 -0700 (PDT)
Subject: Re: [PATCH v2 06/12] drm/panfrost: Expose a helper to trigger a GPU
 reset
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-7-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <79687781-00f1-9f6d-ce12-192400d980b6@arm.com>
Date: Mon, 21 Jun 2021 16:10:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621133907.1683899-7-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2021 14:39, Boris Brezillon wrote:
> Expose a helper to trigger a GPU reset so we can easily trigger reset
> operations outside the job timeout handler.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h | 8 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 4 +---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 2fe1550da7f8..1c6a3597eba0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -175,4 +175,12 @@ int panfrost_device_suspend(struct device *dev);
>  
>  const char *panfrost_exception_name(u32 exception_code);
>  
> +static inline void
> +panfrost_device_schedule_reset(struct panfrost_device *pfdev)
> +{
> +	/* Schedule a reset if there's no reset in progress. */
> +	if (!atomic_xchg(&pfdev->reset.pending, 1))
> +		schedule_work(&pfdev->reset.work);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 1be80b3dd5d0..be5d3e4a1d0a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -458,9 +458,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>  
> -	/* Schedule a reset if there's no reset in progress. */
> -	if (!atomic_xchg(&pfdev->reset.pending, 1))
> -		schedule_work(&pfdev->reset.work);
> +	panfrost_device_schedule_reset(pfdev);
>  
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> 

