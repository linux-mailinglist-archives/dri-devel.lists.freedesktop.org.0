Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F23AEC6C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519FD6E1E0;
	Mon, 21 Jun 2021 15:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F96E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:31:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C85611042;
 Mon, 21 Jun 2021 08:31:46 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2CFF3F694;
 Mon, 21 Jun 2021 08:31:45 -0700 (PDT)
Subject: Re: [PATCH v2 10/12] drm/panfrost: Kill in-flight jobs on FD close
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-11-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b1ba7e11-a6f8-8fc8-0b8b-ed4eb6e9a3ce@arm.com>
Date: Mon, 21 Jun 2021 16:31:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621133907.1683899-11-boris.brezillon@collabora.com>
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
> If the process who submitted these jobs decided to close the FD before
> the jobs are done it probably means it doesn't care about the result.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 33 +++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index aedc604d331c..a51fa0a81367 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -494,14 +494,22 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  		if (status & JOB_INT_MASK_ERR(j)) {
>  			enum panfrost_queue_status old_status;
>  			u32 js_status = job_read(pfdev, JS_STATUS(j));
> +			int error = panfrost_exception_to_error(js_status);
> +			const char *exception_name = panfrost_exception_name(js_status);

NIT: I'm not sure if it's worth it, but it feels like a function which
returns both the name and error-code would make sense. E.g. making
struct panfrost_exception_info public.

>  
>  			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
>  
> -			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
> -				j,
> -				panfrost_exception_name(js_status),
> -				job_read(pfdev, JS_HEAD_LO(j)),
> -				job_read(pfdev, JS_TAIL_LO(j)));
> +			if (!error) {
> +				dev_dbg(pfdev->dev, "js interrupt, js=%d, status=%s, head=0x%x, tail=0x%x",
> +					j, exception_name,
> +					job_read(pfdev, JS_HEAD_LO(j)),
> +					job_read(pfdev, JS_TAIL_LO(j)));
> +			} else {
> +				dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
> +					j, exception_name,
> +					job_read(pfdev, JS_HEAD_LO(j)),
> +					job_read(pfdev, JS_TAIL_LO(j)));
> +			}

Again here you're going to have issues with TERMINATED - dev_err() is
probably too chatty, so just changing panfrost_exception_to_error() to
return an error value is going to cause problems here.

Steve

>  
>  			/* If we need a reset, signal it to the reset handler,
>  			 * otherwise, update the fence error field and signal
> @@ -688,10 +696,25 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
>  
>  void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>  {
> +	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> +	unsigned long flags;
>  	int i;
>  
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
>  		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> +
> +	/* Kill in-flight jobs */
> +	spin_lock_irqsave(&pfdev->js->job_lock, flags);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> +		struct panfrost_job *job = pfdev->jobs[i];
> +
> +		if (!job || job->base.entity != entity)
> +			continue;
> +
> +		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
> +	}
> +	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
>  }
>  
>  int panfrost_job_is_idle(struct panfrost_device *pfdev)
> 

