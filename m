Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6AF3B5B37
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3966E6E3AC;
	Mon, 28 Jun 2021 09:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B26089F9F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:26:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C7881FB;
 Mon, 28 Jun 2021 02:26:42 -0700 (PDT)
Received: from [10.57.89.43] (unknown [10.57.89.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C38E3F694;
 Mon, 28 Jun 2021 02:26:41 -0700 (PDT)
Subject: Re: [PATCH v4 07/14] drm/panfrost: Use a threaded IRQ for job
 interrupts
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210628074210.2695399-1-boris.brezillon@collabora.com>
 <20210628074210.2695399-8-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ba0b5a88-d853-ee66-4ec5-58781e2469fe@arm.com>
Date: Mon, 28 Jun 2021 10:26:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628074210.2695399-8-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2021 08:42, Boris Brezillon wrote:
> This should avoid switching to interrupt context when the GPU is under
> heavy use.
> 
> v3:
> * Don't take the job_lock in panfrost_job_handle_irq()
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

I thought I'd already reviewed this one, but anyway:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 53 ++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index be8f68f63974..e0c479e67304 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -470,19 +470,12 @@ static const struct drm_sched_backend_ops panfrost_sched_ops = {
>  	.free_job = panfrost_job_free
>  };
>  
> -static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
> +static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  {
> -	struct panfrost_device *pfdev = data;
> -	u32 status = job_read(pfdev, JOB_INT_STAT);
>  	int j;
>  
>  	dev_dbg(pfdev->dev, "jobslot irq status=%x\n", status);
>  
> -	if (!status)
> -		return IRQ_NONE;
> -
> -	pm_runtime_mark_last_busy(pfdev->dev);
> -
>  	for (j = 0; status; j++) {
>  		u32 mask = MK_JS_MASK(j);
>  
> @@ -519,7 +512,6 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  		if (status & JOB_INT_MASK_DONE(j)) {
>  			struct panfrost_job *job;
>  
> -			spin_lock(&pfdev->js->job_lock);
>  			job = pfdev->jobs[j];
>  			/* Only NULL if job timeout occurred */
>  			if (job) {
> @@ -531,21 +523,49 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  				dma_fence_signal_locked(job->done_fence);
>  				pm_runtime_put_autosuspend(pfdev->dev);
>  			}
> -			spin_unlock(&pfdev->js->job_lock);
>  		}
>  
>  		status &= ~mask;
>  	}
> +}
>  
> +static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
> +{
> +	struct panfrost_device *pfdev = data;
> +	u32 status = job_read(pfdev, JOB_INT_RAWSTAT);
> +
> +	while (status) {
> +		pm_runtime_mark_last_busy(pfdev->dev);
> +
> +		spin_lock(&pfdev->js->job_lock);
> +		panfrost_job_handle_irq(pfdev, status);
> +		spin_unlock(&pfdev->js->job_lock);
> +		status = job_read(pfdev, JOB_INT_RAWSTAT);
> +	}
> +
> +	job_write(pfdev, JOB_INT_MASK,
> +		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> +		  GENMASK(NUM_JOB_SLOTS - 1, 0));
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
> +{
> +	struct panfrost_device *pfdev = data;
> +	u32 status = job_read(pfdev, JOB_INT_STAT);
> +
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	job_write(pfdev, JOB_INT_MASK, 0);
> +	return IRQ_WAKE_THREAD;
> +}
> +
>  static void panfrost_reset(struct work_struct *work)
>  {
>  	struct panfrost_device *pfdev = container_of(work,
>  						     struct panfrost_device,
>  						     reset.work);
> -	unsigned long flags;
>  	unsigned int i;
>  	bool cookie;
>  
> @@ -575,7 +595,7 @@ static void panfrost_reset(struct work_struct *work)
>  	/* All timers have been stopped, we can safely reset the pending state. */
>  	atomic_set(&pfdev->reset.pending, 0);
>  
> -	spin_lock_irqsave(&pfdev->js->job_lock, flags);
> +	spin_lock(&pfdev->js->job_lock);
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>  		if (pfdev->jobs[i]) {
>  			pm_runtime_put_noidle(pfdev->dev);
> @@ -583,7 +603,7 @@ static void panfrost_reset(struct work_struct *work)
>  			pfdev->jobs[i] = NULL;
>  		}
>  	}
> -	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
> +	spin_unlock(&pfdev->js->job_lock);
>  
>  	panfrost_device_reset(pfdev);
>  
> @@ -610,8 +630,11 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  	if (irq <= 0)
>  		return -ENODEV;
>  
> -	ret = devm_request_irq(pfdev->dev, irq, panfrost_job_irq_handler,
> -			       IRQF_SHARED, KBUILD_MODNAME "-job", pfdev);
> +	ret = devm_request_threaded_irq(pfdev->dev, irq,
> +					panfrost_job_irq_handler,
> +					panfrost_job_irq_handler_thread,
> +					IRQF_SHARED, KBUILD_MODNAME "-job",
> +					pfdev);
>  	if (ret) {
>  		dev_err(pfdev->dev, "failed to request job irq");
>  		return ret;
> 

