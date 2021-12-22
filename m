Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A347D8E9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384AB10E23F;
	Wed, 22 Dec 2021 21:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19CA10E23F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:43:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z29so13694456edl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rGFC189p0/EoAKk+SmDLGFHPVcyFlSei8zEewkFJCeM=;
 b=Ji3RtVGcSaXXziXVZvdyWjy5OJnrLNDeKC0x5OT9/UGktaxejOUmlXezGaOy4t4wOV
 9q8q6zw5UVHab8o7RzaGML1+u0p76ecrdjvF35UDmPrd1O4IR3yeAqeqF4GMnQq/uLdo
 fmWTSdnwOKFNHbgIXtF3vjRpFEgSvZNVz0DTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rGFC189p0/EoAKk+SmDLGFHPVcyFlSei8zEewkFJCeM=;
 b=CpDq8gZVfKOFh5da2ubALIG0BhdveXHgMYqfEcVV9C6e4g0Pkz6qdx2aHWS6tgP8ks
 SKstgzA96sOieavWmDf9vsPqD64hnI81s1C8pLBi/l9zw167pDzodd5AZuPAmRy/88V3
 R5TVpGyqOJYOP8182yLJJcgqLof4SeVdCps06/nudLGntJ/BkyIMNJUuWVt4cgFqd8Sb
 Jjo4/KkHmSewHNBfB49fLkRqvLMpRkck/oXuEhL1t5WFZoUDPKMovoPd3TWKqU+G+9T7
 qHlqVS/S64gDXbj1DOVgtIi0JMLzp3+WMZ4pOt0WP/g6Gj4s0N5m22w7vxdCV+qR41Y+
 cFmw==
X-Gm-Message-State: AOAM532vfoznEDQXUKHoIgRcvLC90O//oJHZx7wFAU9Bc9hmtA/jdN+F
 mkICqoN9YW0idquHLvo/NTcq3A==
X-Google-Smtp-Source: ABdhPJyxT8KQWM8hWC2wsRK03dqYPtFEF4zFxsnHzxRKmkHsJr22wE0SHz/Id4iluMcIzDpRPDM8YQ==
X-Received: by 2002:a05:6402:3490:: with SMTP id
 v16mr2838442edc.398.1640209411476; 
 Wed, 22 Dec 2021 13:43:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p4sm1083242eju.98.2021.12.22.13.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:43:30 -0800 (PST)
Date: Wed, 22 Dec 2021 22:43:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 13/24] dma-buf: drop the DAG approach for the dma_resv
 object
Message-ID: <YcOcASxfAApIpbrf@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-14-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-14-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:34:00PM +0100, Christian König wrote:
> So far we had the approach of using a directed acyclic
> graph with the dma_resv obj.
> 
> This turned out to have many downsides, especially it means
> that every single driver and user of this interface needs
> to be aware of this restriction when adding fences. If the
> rules for the DAG are not followed then we end up with
> potential hard to debug memory corruption, information
> leaks or even elephant big security holes because we allow
> userspace to access freed up memory.
> 
> Since we already took a step back from that by always
> looking at all fences we now go a step further and stop
> dropping the shared fences when a new exclusive one is
> added.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 9acceabc9399..ecb2ff606bac 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c

No doc update at all!

I checked, we're not that shitty with docs, Minimally the DOC: section
header and also the struct dma_resv kerneldoc. Also there's maybe more
references and stuff I've missed on a quick look, please check for them
(e.g. dma_buf.resv kerneldoc is rather important to keep correct too).

Code itself does what it says in the commit message, but we really need
the most accurate docs we can get for this stuff, or the confusion will
persist :-/

Cheers, Daniel

> @@ -383,29 +383,16 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  {
>  	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
> -	struct dma_resv_list *old;
> -	u32 i = 0;
>  
>  	dma_resv_assert_held(obj);
>  
> -	old = dma_resv_shared_list(obj);
> -	if (old)
> -		i = old->shared_count;
> -
>  	dma_fence_get(fence);
>  
>  	write_seqcount_begin(&obj->seq);
>  	/* write_seqcount_begin provides the necessary memory barrier */
>  	RCU_INIT_POINTER(obj->fence_excl, fence);
> -	if (old)
> -		old->shared_count = 0;
>  	write_seqcount_end(&obj->seq);
>  
> -	/* inplace update, no shared fences */
> -	while (i--)
> -		dma_fence_put(rcu_dereference_protected(old->shared[i],
> -						dma_resv_held(obj)));
> -
>  	dma_fence_put(old_fence);
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
