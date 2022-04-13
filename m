Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858404FF463
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DBE10E2BB;
	Wed, 13 Apr 2022 10:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DC1810E2BB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:05:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE69613D5;
 Wed, 13 Apr 2022 03:04:59 -0700 (PDT)
Received: from [10.57.41.233] (unknown [10.57.41.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FAA53F73B;
 Wed, 13 Apr 2022 03:04:58 -0700 (PDT)
Message-ID: <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
Date: Wed, 13 Apr 2022 11:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 23:15, Dmitry Osipenko wrote:
> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
> mutex when job is released, and thus, that code can sleep. This results
> into "BUG: scheduling while atomic" if locks are contented while job is
> freed. There is no good reason for releasing scheduler's jobs in IRQ
> context, hence use normal context to fix the trouble.
> 
> Cc: stable@vger.kernel.org
> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 6 +++---
>  include/drm/gpu_scheduler.h              | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 191c56064f19..6b25b2f4f5a3 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -190,7 +190,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  }
>  EXPORT_SYMBOL(drm_sched_entity_flush);
>  
> -static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
> +static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>  {
>  	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>  
> @@ -207,8 +207,8 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>  	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>  						 finish_cb);
>  
> -	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
> -	irq_work_queue(&job->work);
> +	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
> +	schedule_work(&job->work);
>  }
>  
>  static struct dma_fence *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0fca8f38bee4..addb135eeea6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -28,7 +28,7 @@
>  #include <linux/dma-fence.h>
>  #include <linux/completion.h>
>  #include <linux/xarray.h>
> -#include <linux/irq_work.h>
> +#include <linux/workqueue.h>
>  
>  #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>  
> @@ -295,7 +295,7 @@ struct drm_sched_job {
>  	 */
>  	union {
>  		struct dma_fence_cb		finish_cb;
> -		struct irq_work 		work;
> +		struct work_struct 		work;
>  	};
>  
>  	uint64_t			id;

