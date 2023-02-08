Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB868F8A0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 21:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDC810E2AD;
	Wed,  8 Feb 2023 20:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC7A10E0C4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 20:12:15 +0000 (UTC)
Received: from maud (138-51-94-103-lsn-2.nat.utoronto.ca [138.51.94.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BD2366020A9;
 Wed,  8 Feb 2023 20:12:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675887134;
 bh=wGSjg9/naj5NRjBkg6RsDblzHEt0k6zh5jzeODMqJDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aoH+epNOnqMAhg1YBb7sAvCWX+EFwmq9S8Ds3QEN/7tZw2RAq4W62cH+AbgPbrUUP
 EF2/gn2ZzDWEQrrXeZZJf6IUztEd5hrghd/6h1FnVJVnfPko6VBB+feBC/Iotx4vlq
 n7FbAb1H6L6nOZl1Ep2/9gn20F/wYGqjwRTE65KkEWxD0ObqXjfjALF7tXIeal2fTJ
 XfeMGSRCfdA0RZfif1Ub+d2YnRFhKGY+3FQPJWKMUNx9dSJSiqDkQNgi1mhM6x1vAx
 +emZFgLIKPrYPrw2/JnXnSyF0XgTDkNB3pn5GudLZ/o9sCLqt6ifd49oW6A3bOxt3+
 f+UBbtrP1G6iQ==
Date: Wed, 8 Feb 2023 15:12:08 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Ma??ra Canal <mcanal@igalia.com>
Subject: Re: [PATCH 4/5] drm/panfrost: Use
 drm_sched_job_add_syncobj_dependency()
Message-ID: <Y+QCGAFispvY4L8Z@maud>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-5-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208194817.199932-5-mcanal@igalia.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Christian K??nig <christian.koenig@amd.com>, Melissa Wen <mwen@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R-b, thanks

On Wed, Feb 08, 2023 at 04:48:16PM -0300, Ma??ra Canal wrote:
> As panfrost_copy_in_sync() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in Panfrost in order to simply, using the DRM function.
> 
> Signed-off-by: Ma??ra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index abb0dadd8f63..f49096f53141 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -220,15 +220,8 @@ panfrost_copy_in_sync(struct drm_device *dev,
>  	}
>  
>  	for (i = 0; i < in_fence_count; i++) {
> -		struct dma_fence *fence;
> -
> -		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
> -					     &fence);
> -		if (ret)
> -			goto fail;
> -
> -		ret = drm_sched_job_add_dependency(&job->base, fence);
> -
> +		ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv,
> +							   handles[i], 0);
>  		if (ret)
>  			goto fail;
>  	}
> -- 
> 2.39.1
> 
