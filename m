Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164EBC9D02
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0878810EA73;
	Thu,  9 Oct 2025 15:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4910EA73
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 15:33:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2F091688;
 Thu,  9 Oct 2025 08:33:39 -0700 (PDT)
Received: from [10.1.34.29] (e122027.cambridge.arm.com [10.1.34.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74D473F59E;
 Thu,  9 Oct 2025 08:33:45 -0700 (PDT)
Message-ID: <dba3561f-f130-4f00-8206-c9cc16fce319@arm.com>
Date: Thu, 9 Oct 2025 16:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] drm/panfrost: Don't rework job IRQ enable mask
 in the enable path
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-8-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251007150216.254250-8-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 07/10/2025 16:01, Adrián Larumbe wrote:
> Up until now, panfrost_job_enable_interrupts() would always recalculate the
> same job IRQ enablement mask, which is effectively a constant.
> 
> Replace it with a compile-time constant value, and also in another couple
> places where an equivalent expression was being used.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  4 ++++
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 19 ++++---------------
>  2 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 474b232bb38e..ac7147ed806b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -26,6 +26,10 @@ struct panfrost_perfcnt;
>  
>  #define MAX_PM_DOMAINS 5
>  
> +#define ALL_JS_INT_MASK					\
> +	(GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |		\
> +	 GENMASK(NUM_JOB_SLOTS - 1, 0))
> +
>  enum panfrost_drv_comp_bits {
>  	PANFROST_COMP_BIT_GPU,
>  	PANFROST_COMP_BIT_JOB,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 1b3af5d52081..ff525d3efd76 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -428,17 +428,10 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
>  
>  void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>  {
> -	int j;
> -	u32 irq_mask = 0;
> -
>  	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
>  
> -	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> -		irq_mask |= MK_JS_MASK(j);
> -	}
> -
> -	job_write(pfdev, JOB_INT_CLEAR, irq_mask);
> -	job_write(pfdev, JOB_INT_MASK, irq_mask);
> +	job_write(pfdev, JOB_INT_CLEAR, ALL_JS_INT_MASK);
> +	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
>  }
>  
>  void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
> @@ -757,9 +750,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  		drm_sched_start(&pfdev->js->queue[i].sched, 0);
>  
>  	/* Re-enable job interrupts now that everything has been restarted. */
> -	job_write(pfdev, JOB_INT_MASK,
> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
>  
>  	dma_fence_end_signalling(cookie);
>  }
> @@ -832,9 +823,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
>  
>  	/* Enable interrupts only if we're not about to get suspended */
>  	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
> -		job_write(pfdev, JOB_INT_MASK,
> -			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> -			  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +		job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
>  
>  	return IRQ_HANDLED;
>  }

