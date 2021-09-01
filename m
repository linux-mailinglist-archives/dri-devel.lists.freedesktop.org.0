Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683473FD8C0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 13:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EF46E198;
	Wed,  1 Sep 2021 11:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFD486E198
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 11:30:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A160B1042;
 Wed,  1 Sep 2021 04:30:01 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97C243F766;
 Wed,  1 Sep 2021 04:30:00 -0700 (PDT)
Subject: Re: [PATCH] panfrost: Don't cleanup the job if it was successfully
 queued
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20210831133556.236984-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <74446d0b-f4db-ecd5-f6b7-84748abe3399@arm.com>
Date: Wed, 1 Sep 2021 12:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831133556.236984-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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

On 31/08/2021 14:35, Boris Brezillon wrote:
> The labels are misleading. Even though they are all prefixed with 'fail_'
> the success case also takes that path, and we should definitely not
> cleanup the job if it's been queued. While at it, let's rename those
> labels so we don't do the same mistake again.
> 
> Fixes: 53516280cc38 ("drm/panfrost: use scheduler dependency tracking")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

And also unlike last time...

Tested-by: Steven Price <steven.price@arm.com>

Thanks for the clean up - I should have actually tested the previous
patch, but from the diff (and the previous label names) it was obviously
correct™! But it of course blows up pretty quickly without this change.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 16212b6b202e..077cbbfa506b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -253,7 +253,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	job = kzalloc(sizeof(*job), GFP_KERNEL);
>  	if (!job) {
>  		ret = -ENOMEM;
> -		goto fail_out_sync;
> +		goto out_put_syncout;
>  	}
>  
>  	kref_init(&job->refcount);
> @@ -270,29 +270,30 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  				 &job->file_priv->sched_entity[slot],
>  				 NULL);
>  	if (ret)
> -		goto fail_job_put;
> +		goto out_put_job;
>  
>  	ret = panfrost_copy_in_sync(dev, file, args, job);
>  	if (ret)
> -		goto fail_job;
> +		goto out_cleanup_job;
>  
>  	ret = panfrost_lookup_bos(dev, file, args, job);
>  	if (ret)
> -		goto fail_job;
> +		goto out_cleanup_job;
>  
>  	ret = panfrost_job_push(job);
>  	if (ret)
> -		goto fail_job;
> +		goto out_cleanup_job;
>  
>  	/* Update the return sync object for the job */
>  	if (sync_out)
>  		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
>  
> -fail_job:
> -	drm_sched_job_cleanup(&job->base);
> -fail_job_put:
> +out_cleanup_job:
> +	if (ret)
> +		drm_sched_job_cleanup(&job->base);
> +out_put_job:
>  	panfrost_job_put(job);
> -fail_out_sync:
> +out_put_syncout:
>  	if (sync_out)
>  		drm_syncobj_put(sync_out);
>  
> 

