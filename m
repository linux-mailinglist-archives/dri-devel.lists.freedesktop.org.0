Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB585336E0
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 08:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE6C10ECE7;
	Wed, 25 May 2022 06:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4D010ECE7;
 Wed, 25 May 2022 06:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653461231; x=1684997231;
 h=message-id:date:mime-version:subject:to:references:from:
 cc:in-reply-to:content-transfer-encoding;
 bh=hMrajMsq1ABx8K+wQuzTjvHRbtaF49g316nxi5tRf4U=;
 b=Wue4U2W8bUwY/rHHGJxVcnq8mHU0CbF+eL5iWCv8dJhyia+ZhplzKeL+
 MuvCq2aFUNoW8UphgjtSXX6t0H/7ixCzAR782K5j7CHfMxgtnje9JfjIb
 d726D/clgxrrTemis/EXNHzlUtpUqYv+pxHc+rrcXBiVMnoq7Tq6pv8rE
 GL+PjMhDjJ5AodRHKqzoOJ6UyS6bCDRBEpYusjtoDxArNs1snl7eSj7cw
 Q+QREMMeb6ixTHdpNX7sqTdCl2vnpPAvIKwVIvNJNawB/6DLF/gTIOmUe
 /dpewPhcPfmZ8dKQVLWBV2WrOEkECGI5IEG229utWjTL8+BQibkOY+IX/ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="273844133"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="273844133"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 23:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="676739027"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 24 May 2022 23:47:10 -0700
Received: from [10.249.136.113] (mnowosia-mobl.ger.corp.intel.com
 [10.249.136.113])
 by linux.intel.com (Postfix) with ESMTP id B87E7580897;
 Tue, 24 May 2022 23:47:08 -0700 (PDT)
Message-ID: <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
Date: Wed, 25 May 2022 09:47:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220209182600.434803-1-christian.koenig@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220209182600.434803-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2022 20:26, Christian König wrote:
> It is illegal to add a dma_fence_chain as timeline point. Flatten out
> the fences into a dma_fence_array instead.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 61 ++++++++++++++++++++++++++++++++---
>   1 file changed, 56 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index c313a5b4549c..7e48dcd1bee4 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -853,12 +853,57 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>   					&args->handle);
>   }
>   
> +
> +/*
> + * Try to flatten a dma_fence_chain into a dma_fence_array so that it can be
> + * added as timeline fence to a chain again.
> + */
> +static int drm_syncobj_flatten_chain(struct dma_fence **f)
> +{
> +	struct dma_fence_chain *chain = to_dma_fence_chain(*f);
> +	struct dma_fence *tmp, **fences;
> +	struct dma_fence_array *array;
> +	unsigned int count;
> +
> +	if (!chain)
> +		return 0;
> +
> +	count = 0;
> +	dma_fence_chain_for_each(tmp, &chain->base)
> +		++count;
> +
> +	fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
> +	if (!fences)
> +		return -ENOMEM;
> +
> +	count = 0;
> +	dma_fence_chain_for_each(tmp, &chain->base)
> +		fences[count++] = dma_fence_get(tmp);
> +
> +	array = dma_fence_array_create(count, fences,
> +				       dma_fence_context_alloc(1),


Hi Christian,


Sorry for the late answer to this.


It appears this commit is trying to remove the warnings added by 
"dma-buf: Warn about dma_fence_chain container rules"

But the context allocation you added just above is breaking some tests. 
In particular igt@syncobj_timeline@transfer-timeline-point

That test transfer points into the timeline at point 3 and expects that 
we'll still on the previous points to complete.


In my opinion we should be reusing the previous context number if there 
is one and only allocate if we don't have a point.

If the application wants to not depend on previous points for wait 
operations, it can reset the syncobj prior to adding a new point.


Cheers,


-Lionel



> +				       1, false);
> +	if (!array)
> +		goto free_fences;
> +
> +	dma_fence_put(*f);
> +	*f = &array->base;
> +	return 0;
> +
> +free_fences:
> +	while (count--)
> +		dma_fence_put(fences[count]);
> +
> +	kfree(fences);
> +	return -ENOMEM;
> +}
> +
>   static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>   					    struct drm_syncobj_transfer *args)
>   {
>   	struct drm_syncobj *timeline_syncobj = NULL;
> -	struct dma_fence *fence;
>   	struct dma_fence_chain *chain;
> +	struct dma_fence *fence;
>   	int ret;
>   
>   	timeline_syncobj = drm_syncobj_find(file_private, args->dst_handle);
> @@ -869,16 +914,22 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>   				     args->src_point, args->flags,
>   				     &fence);
>   	if (ret)
> -		goto err;
> +		goto err_put_timeline;
> +
> +	ret = drm_syncobj_flatten_chain(&fence);
> +	if (ret)
> +		goto err_free_fence;
> +
>   	chain = dma_fence_chain_alloc();
>   	if (!chain) {
>   		ret = -ENOMEM;
> -		goto err1;
> +		goto err_free_fence;
>   	}
> +
>   	drm_syncobj_add_point(timeline_syncobj, chain, fence, args->dst_point);
> -err1:
> +err_free_fence:
>   	dma_fence_put(fence);
> -err:
> +err_put_timeline:
>   	drm_syncobj_put(timeline_syncobj);
>   
>   	return ret;


