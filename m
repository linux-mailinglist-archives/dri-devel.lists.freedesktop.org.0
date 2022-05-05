Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E48651C20A
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 16:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B68A10E394;
	Thu,  5 May 2022 14:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA07510E394
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:12:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a1so5371371edt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kVsswnf/g59OO+feN+eGWTWREjJsADfr8vABwXR+jN4=;
 b=ZZRqDlkh+V4KBi+3tRnCE0GMMIm1yJpg+6UqpoQkS3iFsXMmV9oVHtaBRHe7BIycp7
 PShUzCunCfi4WVfEzwzm1DSQDXkk2zHmRar6Q+0QzzZLIS4tnL78zRT/5tWaNoU4CPAh
 ecD4HXZGVhhCEYhe2g8YhFPmNhhXv3BO7+7qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kVsswnf/g59OO+feN+eGWTWREjJsADfr8vABwXR+jN4=;
 b=ZNA7h97gmdS7lFTybmaIPUdoOcHYfsfk09WZpI1s1X4X5QTJfxBOgatV8mb1x3yvPN
 qINn5PDg4RsfMko2GeTwV16Yt4sUeRfzvgKH5uhxoCdMlFlmDeM+2bOqsF4whpzDSUR5
 A0MfVBHLsLxk/QADFGvsXOefV9ohKV61TdlAgCvANpyLPYZ2Fk13i5yLmYe6dtNn7oLZ
 gFeq4Y9JqGGYgzApSO6RPZXbzu3C8Rya38OROOEabV9mvRODMk18v2dba56B4jJradei
 B0hAtECQG4iOskTZNt8a1QQ1V8pNnYTWzKWd5kVMs6wrcqUEd5oPC2fZoBMg85jfqgXN
 4QQA==
X-Gm-Message-State: AOAM531A1VSeDYp/14nf3+5Bwso+atK20FcVRPaYk9gm1UwQw07WYhlM
 U79PUFxXBvSZ+tZ2qXKjDeEh4Q==
X-Google-Smtp-Source: ABdhPJxVh60ePw25wH48SbQ34nxQxHULwVw3a2tw5BFeqHYSaXgGwxHkGLPXE6s3ptQolxtfQhAi2A==
X-Received: by 2002:a05:6402:3552:b0:427:e36a:e839 with SMTP id
 f18-20020a056402355200b00427e36ae839mr15398404edd.351.1651759963197; 
 Thu, 05 May 2022 07:12:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a1709070b1900b006f3ef214e5esm775164ejl.196.2022.05.05.07.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 07:12:42 -0700 (PDT)
Date: Thu, 5 May 2022 16:12:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 5/5] drm: use dma_fence_unwrap_merge() in drm_syncobj
Message-ID: <YnPbWNumTafUUEk9@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
 <20220504122256.1654-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-5-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 02:22:56PM +0200, Christian König wrote:
> The unwrap merge function is now intended for this use case.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yeah this starts to make sense now as refactor.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_syncobj.c | 57 +++++------------------------------
>  1 file changed, 7 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 7e48dcd1bee4..bbad9e4696e7 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -184,6 +184,7 @@
>   */
>  
>  #include <linux/anon_inodes.h>
> +#include <linux/dma-fence-unwrap.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
>  #include <linux/sched/signal.h>
> @@ -853,57 +854,12 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  					&args->handle);
>  }
>  
> -
> -/*
> - * Try to flatten a dma_fence_chain into a dma_fence_array so that it can be
> - * added as timeline fence to a chain again.
> - */
> -static int drm_syncobj_flatten_chain(struct dma_fence **f)
> -{
> -	struct dma_fence_chain *chain = to_dma_fence_chain(*f);
> -	struct dma_fence *tmp, **fences;
> -	struct dma_fence_array *array;
> -	unsigned int count;
> -
> -	if (!chain)
> -		return 0;
> -
> -	count = 0;
> -	dma_fence_chain_for_each(tmp, &chain->base)
> -		++count;
> -
> -	fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
> -	if (!fences)
> -		return -ENOMEM;
> -
> -	count = 0;
> -	dma_fence_chain_for_each(tmp, &chain->base)
> -		fences[count++] = dma_fence_get(tmp);
> -
> -	array = dma_fence_array_create(count, fences,
> -				       dma_fence_context_alloc(1),
> -				       1, false);
> -	if (!array)
> -		goto free_fences;
> -
> -	dma_fence_put(*f);
> -	*f = &array->base;
> -	return 0;
> -
> -free_fences:
> -	while (count--)
> -		dma_fence_put(fences[count]);
> -
> -	kfree(fences);
> -	return -ENOMEM;
> -}
> -
>  static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>  					    struct drm_syncobj_transfer *args)
>  {
>  	struct drm_syncobj *timeline_syncobj = NULL;
> +	struct dma_fence *fence, *tmp;
>  	struct dma_fence_chain *chain;
> -	struct dma_fence *fence;
>  	int ret;
>  
>  	timeline_syncobj = drm_syncobj_find(file_private, args->dst_handle);
> @@ -912,13 +868,14 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>  	}
>  	ret = drm_syncobj_find_fence(file_private, args->src_handle,
>  				     args->src_point, args->flags,
> -				     &fence);
> +				     &tmp);
>  	if (ret)
>  		goto err_put_timeline;
>  
> -	ret = drm_syncobj_flatten_chain(&fence);
> -	if (ret)
> -		goto err_free_fence;
> +	fence = dma_fence_unwrap_merge(tmp);
> +	dma_fence_put(tmp);
> +	if (!fence)
> +		goto err_put_timeline;
>  
>  	chain = dma_fence_chain_alloc();
>  	if (!chain) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
