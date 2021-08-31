Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A343FC95A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E4888427;
	Tue, 31 Aug 2021 14:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF21488427
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:06:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m9so3521783wrb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aUc3eXInjb0FHOaaLzB6UYNRDsZ34fm2dfQ3CE2MII8=;
 b=cHg7ga4URUdh/4HI5khzpVlbzagiMReyKUHPANBkkLwTvkKyU9DuHNTb88sZj4hKpg
 q/1SiUkKvUmlHkyiVlz+08IfYFf0+WJI5D1rU8I0bHmoNZykglQGXreQHatyfIarel4e
 9jz1z3Y3Ln5lDX9hf+mkYGjm8RMGLbCQrrVdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aUc3eXInjb0FHOaaLzB6UYNRDsZ34fm2dfQ3CE2MII8=;
 b=ukz3OuUcPjmIO3vngo6WdsWuMr9Oke8pBXxN1bwgHQ14n8it+/2mnwc+rdJ5BNL5eM
 n701UCO/iHaOUPi8U4OgX3eMsz1SG7XAzZlwwO9WjgHTeyEb0xH6Lbi825q5jlSrAT/2
 Dmtmek423Y+ocQ5oIzrxwyoamYY2Hrq1yAnBCrygpnElp9RHVetA3EzM1HaZa26xE3vH
 5uWqz2EjZxY7YV46QwrQNtvFMG3Otc8QCm3Cld6K/xS+N2PyEwjDpWnsxbqtpfjWJQ9I
 XPsIX5ZlUemJuxvaa+zongfGRHaA8rzeD70/BUl1amAy4kHdlxz8dINYrpL9opmYM/0A
 BQSw==
X-Gm-Message-State: AOAM532oYShigI2L0GFda9x1XrPrp2iwVEV1G4RYtjIIW2uNwhw9n2/U
 nOiIaaekVJNE72JkePfFmKlXWA==
X-Google-Smtp-Source: ABdhPJxh/QuipVt9KKdAfDdY2BiCq3CPbubtx6vn+2660T8RTVZFb8ibrHTsB2ujn52SxuPkLXYuQA==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr31998206wrq.147.1630418817356; 
 Tue, 31 Aug 2021 07:06:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o7sm2487474wmc.46.2021.08.31.07.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 07:06:56 -0700 (PDT)
Date: Tue, 31 Aug 2021 16:06:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] panfrost: Don't cleanup the job if it was successfully
 queued
Message-ID: <YS43f+k0oxt0K2Iy@phenom.ffwll.local>
References: <20210831133556.236984-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831133556.236984-1-boris.brezillon@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Aug 31, 2021 at 03:35:56PM +0200, Boris Brezillon wrote:
> The labels are misleading. Even though they are all prefixed with 'fail_'
> the success case also takes that path, and we should definitely not
> cleanup the job if it's been queued. While at it, let's rename those
> labels so we don't do the same mistake again.
> 
> Fixes: 53516280cc38 ("drm/panfrost: use scheduler dependency tracking")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Oops sorry about that, I thought I've had a t-b from panfrost already?

Anyway this looks good to me:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
