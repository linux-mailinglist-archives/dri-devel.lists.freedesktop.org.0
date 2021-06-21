Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD33AECB0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199A189BF1;
	Mon, 21 Jun 2021 15:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 737CF89BF1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:43:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27E0D1042;
 Mon, 21 Jun 2021 08:43:14 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35A783F694;
 Mon, 21 Jun 2021 08:43:13 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] drm/panfrost: Shorten the fence signalling
 section
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-13-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <e6ba5184-e3de-0c00-cd58-a66cea96117d@arm.com>
Date: Mon, 21 Jun 2021 16:43:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621133907.1683899-13-boris.brezillon@collabora.com>
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
> panfrost_reset() does not directly signal fences, but
> panfrost_scheduler_start() does, when calling drm_sched_start().

I have to admit to not fully understanding dma_fence_begin_signalling()
- but I thought the idea was that it should have a relatively wide
length to actually catch locking bugs. Just wrapping drm_sched_start()
looks wrong: i.e. why isn't this code just contained in drm_sched_start()?

The relevant section from the docs reads:

>  * * All code necessary to complete a &dma_fence must be annotated, from the
>  *   point where a fence is accessible to other threads, to the point where
>  *   dma_fence_signal() is called. Un-annotated code can contain deadlock issues,
>  *   and due to the very strict rules and many corner cases it is infeasible to
>  *   catch these just with review or normal stress testing

So it makes sense that we annotate code from when the reset is started
to after the signalling has happened. That way if there are any locks
taken in the reset path which could be blocked waiting for any of the
fences which might be signalled we get moaned at by lockdep.

Steve

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 74b63e1ee6d9..cf6abe0fdf47 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -414,6 +414,7 @@ static bool panfrost_scheduler_stop(struct panfrost_queue_state *queue,
>  static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
>  {
>  	enum panfrost_queue_status old_status;
> +	bool cookie;
>  
>  	mutex_lock(&queue->lock);
>  	old_status = atomic_xchg(&queue->status,
> @@ -423,7 +424,9 @@ static void panfrost_scheduler_start(struct panfrost_queue_state *queue)
>  	/* Restore the original timeout before starting the scheduler. */
>  	queue->sched.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
>  	drm_sched_resubmit_jobs(&queue->sched);
> +	cookie = dma_fence_begin_signalling();
>  	drm_sched_start(&queue->sched, true);
> +	dma_fence_end_signalling(cookie);
>  	old_status = atomic_xchg(&queue->status,
>  				 PANFROST_QUEUE_STATUS_ACTIVE);
>  	if (old_status == PANFROST_QUEUE_STATUS_FAULT_PENDING)
> @@ -566,9 +569,7 @@ static void panfrost_reset(struct work_struct *work)
>  						     reset.work);
>  	unsigned long flags;
>  	unsigned int i;
> -	bool cookie;
>  
> -	cookie = dma_fence_begin_signalling();
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>  		/*
>  		 * We want pending timeouts to be handled before we attempt
> @@ -608,8 +609,6 @@ static void panfrost_reset(struct work_struct *work)
>  
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
>  		panfrost_scheduler_start(&pfdev->js->queue[i]);
> -
> -	dma_fence_end_signalling(cookie);
>  }
>  
>  int panfrost_job_init(struct panfrost_device *pfdev)
> 

