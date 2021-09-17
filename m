Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B911D40FA99
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3D36EC86;
	Fri, 17 Sep 2021 14:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11036EC86
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:43:24 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c21so30665838edj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=l3KbKSGPjgb2NQ1xQIuBnrBhc4uBXqtRTi8wbPC0ga0=;
 b=HrmJwuQJWlLgUqqIYXW5uFcRxT3fwUlDFOeKT5h+YmE4hgSUbgngIgakGyqza0Ak/E
 N4WcCcZSbwU0I41a3Ee2uCq5lKNlsfxQlS4bk5jnbz8Uc8/WLP7VJVhqqPU7+DDR27nr
 bHZcaJvnM2c/q5KiP8xgBisXFCU0o+BPQMbXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l3KbKSGPjgb2NQ1xQIuBnrBhc4uBXqtRTi8wbPC0ga0=;
 b=re0skV9hFtChH6xfhvYKCjoU4/YLnfV13gfC186sWnZXQ9dNPlXFFdVw+ss5pNlbQt
 fX5jvfQImc2z4iuGcgccUkMLz1QoWQohxVbSIUsVkJuwzBa6opgiy7nPqyNGk0efjr94
 9CNORDb220U1rdqvLm43jBINaKebHFZZOtqgbUHXBgHw2uYOpjKO2MITS0SPe5mSBXOX
 SeBGewX6Hozd9U9BZ6VX/tBlayxZ9EZlUqUSO/9rjlz/UB8E0Sb01rtnRXiygx/MT2bF
 fDKFaV3O/SS5Z3hM6M/CIGFHRd4Le/1s1Kxo0vfjnTaBvrAn2fcy1F+e4iwE3xtGoqHs
 B/+Q==
X-Gm-Message-State: AOAM533DQAJRBGkutPl+w9uSvSq1FoLo7k5xPupx+L36UoQmPjLcsBmu
 OVMChDZQclO5ipsMtckWVgHtPTg5VTcUuA==
X-Google-Smtp-Source: ABdhPJxVPzhZbOficXc6bDadxPa26AhAtQKrydrKlHVpMgqpF2mtB0UweCcZ1SJVG9txF/t6ofoM/g==
X-Received: by 2002:a17:906:9ad0:: with SMTP id
 ah16mr13185322ejc.43.1631889802760; 
 Fri, 17 Sep 2021 07:43:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f2sm2273109eje.109.2021.09.17.07.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:43:22 -0700 (PDT)
Date: Fri, 17 Sep 2021 16:43:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Message-ID: <YUSpiHK7Dd1pF/Mq@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-6-christian.koenig@amd.com>
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

On Fri, Sep 17, 2021 at 02:34:52PM +0200, Christian König wrote:
> This makes the function much simpler since the complex
> retry logic is now handled elsewhere.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 68 ++++++--------------------------------
>  1 file changed, 10 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 9b90bd9ac018..c7db553ab115 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -569,74 +569,26 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>  			   unsigned long timeout)
>  {
>  	long ret = timeout ? timeout : 1;
> -	unsigned int seq, shared_count;
> +	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
> -	int i;
>  
> -retry:
> -	shared_count = 0;
> -	seq = read_seqcount_begin(&obj->seq);
>  	rcu_read_lock();

I missed this in my previous conversion reviews, but pls move the
rcu_read_lock into the iterator. That should simplify the flow in all of
these quite a bit more, and since the iter_next_unlocked grabs a full
reference for the iteration body we really don't need that protected by
rcu.

We can't toss rcu protection for dma_resv anytime soon (if ever), but we
can at least make it an implementation detail.

> -	i = -1;
> -
> -	fence = dma_resv_excl_fence(obj);
> -	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> -		if (!dma_fence_get_rcu(fence))
> -			goto unlock_retry;
> +	dma_resv_iter_begin(&cursor, obj, wait_all);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		rcu_read_unlock();
>  
> -		if (dma_fence_is_signaled(fence)) {
> -			dma_fence_put(fence);
> -			fence = NULL;
> +		ret = dma_fence_wait_timeout(fence, intr, ret);
> +		if (ret <= 0) {
> +			dma_resv_iter_end(&cursor);
> +			return ret;
>  		}
>  
> -	} else {
> -		fence = NULL;
> -	}
> -
> -	if (wait_all) {
> -		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
> -
> -		if (fobj)
> -			shared_count = fobj->shared_count;
> -
> -		for (i = 0; !fence && i < shared_count; ++i) {
> -			struct dma_fence *lfence;
> -
> -			lfence = rcu_dereference(fobj->shared[i]);
> -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				     &lfence->flags))
> -				continue;
> -
> -			if (!dma_fence_get_rcu(lfence))
> -				goto unlock_retry;
> -
> -			if (dma_fence_is_signaled(lfence)) {
> -				dma_fence_put(lfence);
> -				continue;
> -			}
> -
> -			fence = lfence;
> -			break;
> -		}
> +		rcu_read_lock();
>  	}
> -
> +	dma_resv_iter_end(&cursor);
>  	rcu_read_unlock();
> -	if (fence) {
> -		if (read_seqcount_retry(&obj->seq, seq)) {
> -			dma_fence_put(fence);
> -			goto retry;
> -		}
>  
> -		ret = dma_fence_wait_timeout(fence, intr, ret);
> -		dma_fence_put(fence);
> -		if (ret > 0 && wait_all && (i + 1 < shared_count))
> -			goto retry;
> -	}
>  	return ret;
> -
> -unlock_retry:
> -	rcu_read_unlock();
> -	goto retry;

I think we still have the same semantics, and it's so much tidier.

With the rcu_read_unlock stuff into iterators (also applies to previous
two patches):

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  }
>  EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
