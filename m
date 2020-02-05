Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC48D153232
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 14:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0F76E99F;
	Wed,  5 Feb 2020 13:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C11F6E99C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 13:47:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1C5D31B;
 Wed,  5 Feb 2020 05:47:57 -0800 (PST)
Received: from [10.1.195.32] (e112269-lin.cambridge.arm.com [10.1.195.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C34533F68E;
 Wed,  5 Feb 2020 05:47:56 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/panfrost: Propagate panfrost_fence_create()
 errors to the scheduler
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20200204143504.135388-1-boris.brezillon@collabora.com>
 <20200204143504.135388-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <184d57ff-9193-ce08-c248-5c1de801fa6a@arm.com>
Date: Wed, 5 Feb 2020 13:47:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204143504.135388-2-boris.brezillon@collabora.com>
Content-Language: en-US
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
Cc: Icecream95 <ixn@keemail.me>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/02/2020 14:35, Boris Brezillon wrote:
> ->job_run() can return an ERR_PTR() if somethings fails. Let's
> propagate the error returned by panfrost_fence_create() instead of
> returning NULL.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

In your previous posting[1] you also handled the case where
job->base.s_fence->finished.error is non-zero. Is there a good reason to
drop that?

[1] https://patchwork.kernel.org/patch/11267153/

But this change on its own stands, so:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index b0716e49eeca..242147b36d8e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -349,7 +349,7 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
>  
>  	fence = panfrost_fence_create(pfdev, slot);
>  	if (IS_ERR(fence))
> -		return NULL;
> +		return fence;
>  
>  	if (job->done_fence)
>  		dma_fence_put(job->done_fence);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
