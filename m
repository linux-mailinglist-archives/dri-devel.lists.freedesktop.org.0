Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE83B5C15
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 12:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4E06E413;
	Mon, 28 Jun 2021 10:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE7906E413
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 10:05:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0CD1FB;
 Mon, 28 Jun 2021 03:05:01 -0700 (PDT)
Received: from [10.57.89.43] (unknown [10.57.89.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31E123F694;
 Mon, 28 Jun 2021 03:05:00 -0700 (PDT)
Subject: Re: [PATCH v4 13/14] drm/panfrost: Kill in-flight jobs on FD close
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210628074210.2695399-1-boris.brezillon@collabora.com>
 <20210628074210.2695399-14-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6bd1b6b9-077a-1ea8-7ca1-b061f77979c4@arm.com>
Date: Mon, 28 Jun 2021 11:04:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628074210.2695399-14-boris.brezillon@collabora.com>
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
> If the process who submitted these jobs decided to close the FD before
> the jobs are done it probably means it doesn't care about the result.
> 
> v4:
> * Don't disable/restore irqs when taking the job_lock (not needed since
>   this lock is never taken from an interrupt context)
> 
> v3:
> * Set fence error to ECANCELED when a TERMINATED exception is received
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 42 +++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index b0f4857ca084..979108dbc323 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -499,14 +499,21 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  
>  		if (status & JOB_INT_MASK_ERR(j)) {
>  			u32 js_status = job_read(pfdev, JS_STATUS(j));
> +			const char *exception_name = panfrost_exception_name(js_status);
>  
>  			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
>  
> -			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
> -				j,
> -				panfrost_exception_name(js_status),
> -				job_read(pfdev, JS_HEAD_LO(j)),
> -				job_read(pfdev, JS_TAIL_LO(j)));
> +			if (js_status < DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT) {

I can see what your trying to do here, but the code isn't very readable
(it's not clear what JOB_CONFIG_FAULT has to do with the decision).

I think there's two options here:

 1. (In Midgard) Bits 7:6 are the "exception class" and are 0 for
"non-fault status codes". So we could rewrite it as ((js_status & 0xC0)
== 0) - or even better with appropriate macros.

 2. Provide a macro definition for DRM_PANFROST_MAX_NON_FAULT_CODE which
(at least currently) just happens to equal JOB_CONFIG_FAULT - 1 and use
that instead.

(1) is nice, but sadly Bifrost doesn't define things in terms of
exception class any more and the exception type is described as just an
8-bit enumeration. Of course we're entirely relying on any new non-fault
status codes being ordered nicely, and option 1 and 2 are actually
exactly the same check.

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
>  
>  			/* If we need a reset, signal it to the timeout
>  			 * handler, otherwise, update the fence error field and
> @@ -515,7 +522,16 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  			if (panfrost_exception_needs_reset(pfdev, js_status)) {
>  				drm_sched_fault(&pfdev->js->queue[j].sched);
>  			} else {
> -				dma_fence_set_error(pfdev->jobs[j]->done_fence, -EINVAL);
> +				int error = 0;
> +
> +				if (js_status == DRM_PANFROST_EXCEPTION_TERMINATED)
> +					error = -ECANCELED;
> +				else if (js_status >= DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT)

As above.

> +					error = -EINVAL;
> +
> +				if (error)
> +					dma_fence_set_error(pfdev->jobs[j]->done_fence, error);
> +
>  				status |= JOB_INT_MASK_DONE(j);
>  			}
>  		}
> @@ -681,10 +697,24 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
>  
>  void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>  {
> +	struct panfrost_device *pfdev = panfrost_priv->pfdev;
>  	int i;
>  
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
>  		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> +
> +	/* Kill in-flight jobs */
> +	spin_lock(&pfdev->js->job_lock);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> +		struct panfrost_job *job = pfdev->jobs[i];
> +
> +		if (!job || job->base.entity != entity)
> +			continue;
> +
> +		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
> +	}
> +	spin_unlock(&pfdev->js->job_lock);
>  }
>  
>  int panfrost_job_is_idle(struct panfrost_device *pfdev)
> 

