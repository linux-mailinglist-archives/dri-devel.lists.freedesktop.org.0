Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB943A445B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 16:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306146EEA1;
	Fri, 11 Jun 2021 14:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A996E591
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 14:48:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a20so6407151wrc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VVUk7MsKVOM1G242xbw185XkVQ9W//REmCA7qNbJimw=;
 b=fJEZuNNGmx2zlCN2vZEDEUFq55EhxmWys680XwPWxR8jRv8fcNy4M+R+BfLjKVsUEn
 u084fjIlQoe8c5fC+PoMJpuGvCc8PYc1L1xpl3MHkvuXt7GwLhjA83ylnRkmdn1ACVgm
 jR6/NFv7QKND/aOa8nbcfLq4VFPab0CQ2xlSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VVUk7MsKVOM1G242xbw185XkVQ9W//REmCA7qNbJimw=;
 b=GAawh91N055teCxDKJoqcakomMdkI4RetTp6XXhlsfd4EGqHEV1PuYY3MHPoKy5xIr
 p6YwE7XUnB4ZEV3Go5R9XvJG8wpdEY2kNRJs9Zbqz8G9kKv4+8JPzMmA0XfzIe9ja8aH
 CJw0mDA2kt/EOfwaEJeHmzQZ16lHefVl+qRlFRbbu0LlCsFCWaB//iaP8svpfP0TfyJX
 npHyGzmNFUUff95wdzVvh4CKrwoQcEeLEPXoJEJAHRfy3039Ahnt+Kqf/V5h1+1RsW0v
 pwIizTd7U6gIuOao5QUAdOFqjVzUG5Dzc7BBrcPkHTmbN+AUmFkxtHuV/epYn77ksdjE
 mQ4Q==
X-Gm-Message-State: AOAM532tv6OduPyE4pQj13RKG8EsJGR09D46pnu1d62j0UpYmXZQJDr7
 MN/jJCxC9dcxDCaK4khs2PjhJA==
X-Google-Smtp-Source: ABdhPJxpXtK6FRP5F/Bo+mdIDyTcalS6WrzyEZl+FQ36ZRVWsXEYw+ocbVl2lY23/9xQOBb2C8Jd8Q==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr4505452wrr.86.1623422880697;
 Fri, 11 Jun 2021 07:48:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm7381989wrv.89.2021.06.11.07.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 07:48:00 -0700 (PDT)
Date: Fri, 11 Jun 2021 16:47:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/5] dma-buf: fix dma_resv_test_signaled test_all handling
Message-ID: <YMN3nr1mTj09p8lT@phenom.ffwll.local>
References: <20210611120301.10595-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210611120301.10595-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 02:02:57PM +0200, Christian König wrote:
> As the name implies if testing all fences is requested we
> should indeed test all fences and not skip the exclusive
> one because we see shared ones.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Hm I thought we've had the rule that when both fences exist, then
collectively the shared ones must signale no earlier than the exclusive
one.

That's at least the contract we've implemented in dma_resv.h. But I've
also found a bunch of drivers who are a lot more yolo on this.

I think there's a solid case here to just always take all the fences if we
ask for all the shared ones, but if we go that way then I'd say
- clear kerneldoc patch to really hammer this in (currently we're not good
  at all in this regard)
- going through drivers a bit to check for this (I have some of that done
  already in my earlier series, need to respin it and send it out)

But I'm kinda not seeing why this needs to be in this patch series here.
-Daniel

> ---
>  drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43..c66bfdde9454 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -615,25 +615,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
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
> @@ -641,24 +637,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
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
> +	if (fence) {
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
