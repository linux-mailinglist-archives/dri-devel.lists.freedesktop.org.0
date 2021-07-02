Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CED3BA5FE
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 00:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1231689D61;
	Fri,  2 Jul 2021 22:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7389D61
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 22:33:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n33so34745wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dgD+MKLy0Imr7Sh6j7DJmoB3fgFsrD3dMP7ZKANLyHM=;
 b=BwpVbx4r128t4MpqBdLZfliYOPaL6eG4NMBHUqEA6QIU4cfSvpj3dDuVO+1fXhTd6P
 XN9l53wtcSk+VpeBsJGMDVuvT6MJZftIvfQisZtQzUCil8YUxQzvSFdej5X7jfj35vrt
 0d0Aq/dHLMJGLa+lqAoYAs4sMXTFBj5kHNyH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dgD+MKLy0Imr7Sh6j7DJmoB3fgFsrD3dMP7ZKANLyHM=;
 b=dBtB2MO6nCDmSw96okI366jY5GjAvq/WzFbJNBp4fEElOES11GqqVZcV20e4PrN1in
 rdPu68X5obp1DzXowb9Y77Q82YHy9dR+pPIjdIUriPdW1Jwm1PUxx9cJUBSKtEdAj/8y
 qYz+sr6SyIPZ8y6tjJcz1oPzYJ4xaTQhVRdZxzhl87St4a9nvSE6VQXPZ/3U5Es9lJcm
 M7Ud6Wuvy+ahrrKXRL5WnLhfdUuyCcF7wTObWbZMbkwPPG4XLF5z8U8Pi/5ObcJFLrXG
 m4N/umk62PQsYZsRFVEfe6BkZYmoNU2H/NAqNVF7vAUU3I0QHznhO0OavKgsKL4YikH/
 Iy0A==
X-Gm-Message-State: AOAM531TIbgRw6kRzotMHv8cdLvleBnDSQepXEyyUKxeNAGcjq3Y8yhA
 d6Mb31RrWdW1fQOyg3Td10HmFA==
X-Google-Smtp-Source: ABdhPJxrXvqVGISTbXhHZQfcvQzJQwg3phqBLs2TscVqP6qqwKrzMtjmwIFUWEDK+SziDdRf2/wj9w==
X-Received: by 2002:a05:600c:4b98:: with SMTP id
 e24mr1748675wmp.61.1625265216474; 
 Fri, 02 Jul 2021 15:33:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p187sm4448114wmp.28.2021.07.02.15.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 15:33:36 -0700 (PDT)
Date: Sat, 3 Jul 2021 00:33:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] dma-buf: fix dma_resv_test_signaled test_all
 handling v2
Message-ID: <YN+UPtSLhr1kfTAB@phenom.ffwll.local>
References: <20210702111642.17259-1-christian.koenig@amd.com>
 <20210702111642.17259-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702111642.17259-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 01:16:40PM +0200, Christian König wrote:
> As the name implies if testing all fences is requested we
> should indeed test all fences and not skip the exclusive
> one because we see shared ones.
> 
> v2: fix logic once more
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 4ab02b6c387a..18dd5a6ca06c 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -618,25 +618,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
>   */
>  bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>  {
> -	unsigned int seq, shared_count;
> +	struct dma_fence *fence;
> +	unsigned int seq;
>  	int ret;
>  
>  	rcu_read_lock();
>  retry:
>  	ret = true;
> -	shared_count = 0;
>  	seq = read_seqcount_begin(&obj->seq);
>  
>  	if (test_all) {
>  		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
> -		unsigned int i;
> -
> -		if (fobj)
> -			shared_count = fobj->shared_count;
> +		unsigned int i, shared_count;
>  
> +		shared_count = fobj ? fobj->shared_count : 0;
>  		for (i = 0; i < shared_count; ++i) {
> -			struct dma_fence *fence;
> -
>  			fence = rcu_dereference(fobj->shared[i]);
>  			ret = dma_resv_test_signaled_single(fence);
>  			if (ret < 0)
> @@ -644,24 +640,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>  			else if (!ret)
>  				break;
>  		}
> -
> -		if (read_seqcount_retry(&obj->seq, seq))
> -			goto retry;
>  	}
>  
> -	if (!shared_count) {
> -		struct dma_fence *fence_excl = dma_resv_excl_fence(obj);
> -
> -		if (fence_excl) {
> -			ret = dma_resv_test_signaled_single(fence_excl);
> -			if (ret < 0)
> -				goto retry;
> +	fence = dma_resv_excl_fence(obj);
> +	if (ret && fence) {
> +		ret = dma_resv_test_signaled_single(fence);
> +		if (ret < 0)
> +			goto retry;
>  
> -			if (read_seqcount_retry(&obj->seq, seq))
> -				goto retry;
> -		}
>  	}
>  
> +	if (read_seqcount_retry(&obj->seq, seq))
> +		goto retry;
> +
>  	rcu_read_unlock();
>  	return ret;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
