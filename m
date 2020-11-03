Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E82A41AF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3696E8BD;
	Tue,  3 Nov 2020 10:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BAB6E8BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:25:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e2so12218941wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EU2/yY5S2s0CiZ9+Hw/Y8jvCxXS0h+NLq85Rji51kyc=;
 b=YBLz3tPcPcTq7HRWdzF/sfPbWAL/gFX0bWKk+07lCf/MrqKd6NFQPwMnpe/qMqgvsc
 i5p+v9CgrwxvPiT/GkgdzwNCKHgtlDb04lMtZHzqRjUaFD/EtTxDtYJ0pFNGqJhUq4EF
 goOXZGNnZzmwFtYT2zQae8Js5R970kfs0EcTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EU2/yY5S2s0CiZ9+Hw/Y8jvCxXS0h+NLq85Rji51kyc=;
 b=fBiL8lke24EEj4znpRUg2hj+hJeDQxzgsiE1RmHk2wplmA0KjYiurhUvjzagK7oNmH
 mxeAojbWx6Zzdm323Rsy0c3LCffRu5/GZ1nvx58yAbUtdWCaTwm4jzYpHC00r3jLxkkG
 D2mIhnYPtzfwf7Izr+309uPIZ9W8PqOJMocTmD+5RiicEX7SWmt+zDsFw5jX+e0q6792
 Sm1QXcjK9TQei9JqUxvYNdx4gBraPgrViLfgCDCaGmNFbKwx6lJTcsUchnA1hKxfVwko
 bjoz8XZ554sFyju5snsVgF5lHkIxUZXSY9Ey73PL5t7btCFTUg7zpX9O5IhNwPNY+eED
 9SDQ==
X-Gm-Message-State: AOAM532dqBXwycTVAAaMwdFBYzvSL79lPlewteS2enMKl+05kTkDCs+J
 dNXqZUbwRiWx2bs8bg4ppx69cw==
X-Google-Smtp-Source: ABdhPJxbiTdwqjYh8KuiI6NDdpI25up6BKYgA2DslS9JTJ64nNoO6RvNhKb/OBIQVutduORG8/ET9Q==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr2754379wmf.121.1604399143152; 
 Tue, 03 Nov 2020 02:25:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 130sm2654524wmd.18.2020.11.03.02.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:25:42 -0800 (PST)
Date: Tue, 3 Nov 2020 11:25:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3] drm/panfrost: Move the GPU reset bits outside the
 timeout handler
Message-ID: <20201103102540.GB401619@phenom.ffwll.local>
References: <20201103081347.1000139-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103081347.1000139-1-boris.brezillon@collabora.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 09:13:47AM +0100, Boris Brezillon wrote:
> We've fixed many races in panfrost_job_timedout() but some remain.
> Instead of trying to fix it again, let's simplify the logic and move
> the reset bits to a separate work scheduled when one of the queue
> reports a timeout.
> 
> v3:
> - Replace the atomic_cmpxchg() by an atomic_xchg() (Robin Murphy)
> - Add Steven's R-b
> 
> v2:
> - Use atomic_cmpxchg() to conditionally schedule the reset work (Steven Price)
> 
> Fixes: 1a11a88cfd9a ("drm/panfrost: Fix job timeout handling")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Sprinkling the dma_fence annotations over this would be really nice ...
-Daniel

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |   1 -
>  drivers/gpu/drm/panfrost/panfrost_device.h |   6 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 127 ++++++++++++---------
>  3 files changed, 79 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index ea8d31863c50..a83b2ff5837a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -200,7 +200,6 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>  	struct resource *res;
>  
>  	mutex_init(&pfdev->sched_lock);
> -	mutex_init(&pfdev->reset_lock);
>  	INIT_LIST_HEAD(&pfdev->scheduled_jobs);
>  	INIT_LIST_HEAD(&pfdev->as_lru_list);
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 140e004a3790..597cf1459b0a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -106,7 +106,11 @@ struct panfrost_device {
>  	struct panfrost_perfcnt *perfcnt;
>  
>  	struct mutex sched_lock;
> -	struct mutex reset_lock;
> +
> +	struct {
> +		struct work_struct work;
> +		atomic_t pending;
> +	} reset;
>  
>  	struct mutex shrinker_lock;
>  	struct list_head shrinker_list;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 4902bc6624c8..9691d6248f6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -20,6 +20,8 @@
>  #include "panfrost_gpu.h"
>  #include "panfrost_mmu.h"
>  
> +#define JOB_TIMEOUT_MS 500
> +
>  #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
>  #define job_read(dev, reg) readl(dev->iomem + (reg))
>  
> @@ -382,19 +384,37 @@ static bool panfrost_scheduler_stop(struct panfrost_queue_state *queue,
>  			drm_sched_increase_karma(bad);
>  		queue->stopped = true;
>  		stopped = true;
> +
> +		/*
> +		 * Set the timeout to max so the timer doesn't get started
> +		 * when we return from the timeout handler (restored in
> +		 * panfrost_scheduler_start()).
> +		 */
> +		queue->sched.timeout = MAX_SCHEDULE_TIMEOUT;
>  	}
>  	mutex_unlock(&queue->lock);
>  
>  	return stopped;
>  }
>  
> +static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
> +{
> +	if (WARN_ON(!queue->stopped))
> +		return;
> +
> +	mutex_lock(&queue->lock);
> +	/* Restore the original timeout before starting the scheduler. */
> +	queue->sched.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +	drm_sched_start(&queue->sched, true);
> +	queue->stopped = false;
> +	mutex_unlock(&queue->lock);
> +}
> +
>  static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct panfrost_job *job = to_panfrost_job(sched_job);
>  	struct panfrost_device *pfdev = job->pfdev;
>  	int js = panfrost_job_get_slot(job);
> -	unsigned long flags;
> -	int i;
>  
>  	/*
>  	 * If the GPU managed to complete this jobs fence, the timeout is
> @@ -415,56 +435,9 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>  	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
>  		return;
>  
> -	if (!mutex_trylock(&pfdev->reset_lock))
> -		return;
> -
> -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
> -
> -		/*
> -		 * If the queue is still active, make sure we wait for any
> -		 * pending timeouts.
> -		 */
> -		if (!pfdev->js->queue[i].stopped)
> -			cancel_delayed_work_sync(&sched->work_tdr);
> -
> -		/*
> -		 * If the scheduler was not already stopped, there's a tiny
> -		 * chance a timeout has expired just before we stopped it, and
> -		 * drm_sched_stop() does not flush pending works. Let's flush
> -		 * them now so the timeout handler doesn't get called in the
> -		 * middle of a reset.
> -		 */
> -		if (panfrost_scheduler_stop(&pfdev->js->queue[i], NULL))
> -			cancel_delayed_work_sync(&sched->work_tdr);
> -
> -		/*
> -		 * Now that we cancelled the pending timeouts, we can safely
> -		 * reset the stopped state.
> -		 */
> -		pfdev->js->queue[i].stopped = false;
> -	}
> -
> -	spin_lock_irqsave(&pfdev->js->job_lock, flags);
> -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		if (pfdev->jobs[i]) {
> -			pm_runtime_put_noidle(pfdev->dev);
> -			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> -			pfdev->jobs[i] = NULL;
> -		}
> -	}
> -	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
> -
> -	panfrost_device_reset(pfdev);
> -
> -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_resubmit_jobs(&pfdev->js->queue[i].sched);
> -
> -	mutex_unlock(&pfdev->reset_lock);
> -
> -	/* restart scheduler after GPU is usable again */
> -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_start(&pfdev->js->queue[i].sched, true);
> +	/* Schedule a reset if there's no reset in progress. */
> +	if (!atomic_xchg(&pfdev->reset.pending, 1))
> +		schedule_work(&pfdev->reset.work);
>  }
>  
>  static const struct drm_sched_backend_ops panfrost_sched_ops = {
> @@ -531,11 +504,59 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static void panfrost_reset(struct work_struct *work)
> +{
> +	struct panfrost_device *pfdev = container_of(work,
> +						     struct panfrost_device,
> +						     reset.work);
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		/*
> +		 * We want pending timeouts to be handled before we attempt
> +		 * to stop the scheduler. If we don't do that and the timeout
> +		 * handler is in flight, it might have removed the bad job
> +		 * from the list, and we'll lose this job if the reset handler
> +		 * enters the critical section in panfrost_scheduler_stop()
> +		 * before the timeout handler.
> +		 *
> +		 * Timeout is set to max to make sure the timer is not
> +		 * restarted after the cancellation.
> +		 */
> +		pfdev->js->queue[i].sched.timeout = MAX_SCHEDULE_TIMEOUT;
> +		cancel_delayed_work_sync(&pfdev->js->queue[i].sched.work_tdr);
> +		panfrost_scheduler_stop(&pfdev->js->queue[i], NULL);
> +	}
> +
> +	/* All timers have been stopped, we can safely reset the pending state. */
> +	atomic_set(&pfdev->reset.pending, 0);
> +
> +	spin_lock_irqsave(&pfdev->js->job_lock, flags);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		if (pfdev->jobs[i]) {
> +			pm_runtime_put_noidle(pfdev->dev);
> +			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> +			pfdev->jobs[i] = NULL;
> +		}
> +	}
> +	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
> +
> +	panfrost_device_reset(pfdev);
> +
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		drm_sched_resubmit_jobs(&pfdev->js->queue[i].sched);
> +		panfrost_scheduler_start(&pfdev->js->queue[i]);
> +	}
> +}
> +
>  int panfrost_job_init(struct panfrost_device *pfdev)
>  {
>  	struct panfrost_job_slot *js;
>  	int ret, j, irq;
>  
> +	INIT_WORK(&pfdev->reset.work, panfrost_reset);
> +
>  	pfdev->js = js = devm_kzalloc(pfdev->dev, sizeof(*js), GFP_KERNEL);
>  	if (!js)
>  		return -ENOMEM;
> @@ -560,7 +581,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
>  				     &panfrost_sched_ops,
> -				     1, 0, msecs_to_jiffies(500),
> +				     1, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     "pan_js");
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
