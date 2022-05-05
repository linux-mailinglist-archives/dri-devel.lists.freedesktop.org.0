Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D006351C1ED
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 16:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F7810E32D;
	Thu,  5 May 2022 14:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC48B10E32C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:08:45 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id z2so7392075ejj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=whU2Grj2hTMn+FouYox1YxYi97Wm6FNkZiyqXWhPOUA=;
 b=akAqrBV0UCJt5kdXnjxjtqW6s1hUOqmM7GAnqUSMXQ0HstjvuJunNVAPrkkr06KiEp
 DJ55hQVx91xGIpnqZwDMsZhurjgyj/DdnxyquJzsm3l+mg/RVVRDbc2z3+PiQ55K51I+
 3kLVmDji1r+KdQTkPJWq+pcMiVcWFQfVNDKbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=whU2Grj2hTMn+FouYox1YxYi97Wm6FNkZiyqXWhPOUA=;
 b=I4aF0GB0PHtrjT4LXehPqbp3qvRgJ7NOmsw/ICN/NjqB373sIyGJFC92vXRpZdnO8w
 USqkHHOAC/5rBlvaxjJkfe7QX2CIeuIzwF6SqP/ksSXJdaED1ppaNeUqWM5Unaz3z+jF
 maITRdwgVSrVjXGRPUcWXUBMg0YkYin/Nkz40Z/5jUeAG6YIe3lwO3Vb+x7T4RdPAQlx
 AYbBpnbKFmGbrGMgH71RuLEtccF+evutIz/9p8pifh4XI5qidPe4qiL1xysxST79al+r
 7QCjNj9N6LohK0wQZSQ33cQ2mql3/PPYVpZbzxA61wYuh9jY2v42ivvDCyiQRZ16iMN+
 ddnw==
X-Gm-Message-State: AOAM533q2qVwmLeY+mxH0oJh+0zn4WLzOQ9LBX4scELf3CDGB+orDa7c
 9QRhI970vwE4mX44JEmHXAYdJA==
X-Google-Smtp-Source: ABdhPJyd2lHGirqCzJ7MwmLX+vEXwRdS5/1VGdcqlUfczFM3BID+iBgZf5y/64BdxtG+AXSln2AquA==
X-Received: by 2002:a17:906:c145:b0:6f3:9ea7:1d41 with SMTP id
 dp5-20020a170906c14500b006f39ea71d41mr26269083ejc.269.1651759724417; 
 Thu, 05 May 2022 07:08:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ia12-20020a170907a06c00b006f3ef214e0esm768619ejc.116.2022.05.05.07.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 07:08:43 -0700 (PDT)
Date: Thu, 5 May 2022 16:08:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each
Message-ID: <YnPaapZfMZuwW1h7@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
 <20220504122256.1654-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-3-christian.koenig@amd.com>
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

On Wed, May 04, 2022 at 02:22:54PM +0200, Christian König wrote:
> dma_fence_chain containers cleanup signaled fences automatically, so
> filter those out from arrays as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 23 ++++++++++++++++-------
>  include/linux/dma-fence-unwrap.h   |  4 ++--
>  2 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 711be125428c..7b0b91086ded 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -32,8 +32,13 @@ __dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
>  struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
>  					 struct dma_fence_unwrap *cursor)
>  {
> +	struct dma_fence *tmp;
> +
>  	cursor->chain = dma_fence_get(head);
> -	return __dma_fence_unwrap_array(cursor);
> +	tmp = __dma_fence_unwrap_array(cursor);
> +	if (tmp && dma_fence_is_signaled(tmp))
> +		tmp = dma_fence_unwrap_next(cursor);
> +	return tmp;
>  }
>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
>  
> @@ -48,12 +53,16 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>  {
>  	struct dma_fence *tmp;
>  
> -	++cursor->index;
> -	tmp = dma_fence_array_next(cursor->array, cursor->index);
> -	if (tmp)
> -		return tmp;
> +	do {
> +		++cursor->index;
> +		tmp = dma_fence_array_next(cursor->array, cursor->index);
> +		if (tmp && !dma_fence_is_signaled(tmp))
> +			return tmp;

Don't do need a do {} while here too to first walk through the array
before going to the next one in the chain? Maybe add a testcase for this?

> +
> +		cursor->chain = dma_fence_chain_walk(cursor->chain);
> +		tmp = __dma_fence_unwrap_array(cursor);
> +	} while (tmp && dma_fence_is_signaled(tmp));
>  
> -	cursor->chain = dma_fence_chain_walk(cursor->chain);
> -	return __dma_fence_unwrap_array(cursor);
> +	return tmp;
>  }
>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index e7c219da4ed7..e9d114637294 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -41,8 +41,8 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>   * @head: starting point for the iterator
>   *
>   * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
> - * potential fences in them. If @head is just a normal fence only that one is
> - * returned.
> + * potential none signaled fences in them. If @head is just a normal fence only
> + * that one is returned.

I think I get what you want to say, but it reads garbled. What about
leaving the current text as-is and adding something like

"Note that signalled fences are opportunistically filtered out, which
means the iteration is potentially over no fence at all"

Or something like that? I think smashing this all into one sentence
doesn't work well.

Then please also add this same sentence to unwrap_first/next() for
completeness.
-Daniel

>   */
>  #define dma_fence_unwrap_for_each(fence, cursor, head)			\
>  	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
