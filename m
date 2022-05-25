Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2340B53403B
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 17:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572810E857;
	Wed, 25 May 2022 15:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5244910E255
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:18:46 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f2so30619452wrc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hz1L99EHsA+Mjk0mhKuLuqrS0ycdn4FgXsH4+Dwo498=;
 b=KjdIWBfJIDfoz7ZSaRk2qCOBHQx90U6e/2lcoqkFLsd3uM6esCJx1+8EVMrQOez8+K
 Egfe+DToEuvaUesG0nVk/Mhy6rNdHOh0bm02vV6lEy0vGSc6N+ojE3P9EbUU8c6nPdFV
 xEaJdHufy7oeuMurfHIHQoTKDTm8jUOOZRz1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hz1L99EHsA+Mjk0mhKuLuqrS0ycdn4FgXsH4+Dwo498=;
 b=EuXVNM7iN/3Z3qjS7PnvBxpm4QTdjHtCp2mr/M67SEs7R/oiunlnEcpewgwdOfn2LQ
 lYVvEN/nXS36ouT52QSl4zqolCjPrHHovtfYFiYIiN2PdutiR0BflxcC9fc9XfdojGJi
 mt7SLWycIEaRbSXJuJ401VzIT/ksOD0R8fLYVbG6wLV0IBGXOMNDF7Q7O6XyzYdpZbpK
 bhYaJ4jpsMwMB9Qx4q1vwsT2axQsUfcQICB1k/7hk8IhyVUnfyLj5fLqoqofk/3pOEEQ
 BdKaKQZUH3Lr8qr7Fi4fzjsBP+w9zbdbhzlSYZabruGwH/gGtLq1t5rjLjte7qKuQUU5
 9cgg==
X-Gm-Message-State: AOAM533ryBArPYqeUqNPo2Ww19lrhGsbU4UPKpu0dXe75B6q3MtKMpz0
 mC2Q+eOKryEJvH1RBtjuWlhvm0ngIvBLvQ==
X-Google-Smtp-Source: ABdhPJzjSWNrzsOHnr2Xjku9V7Y9WQIaS2JAbhRpeSWCiKwCFNlOxPCyG8KdFfvrl8YT5NviT08POQ==
X-Received: by 2002:a05:6000:178d:b0:20f:e7da:6a21 with SMTP id
 e13-20020a056000178d00b0020fe7da6a21mr10518051wrg.689.1653491924879; 
 Wed, 25 May 2022 08:18:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a1c3802000000b003974027722csm1891727wma.47.2022.05.25.08.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 08:18:44 -0700 (PDT)
Date: Wed, 25 May 2022 17:18:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: cleanup dma_fence_chain_walk
Message-ID: <Yo5I0otoyJsHY0dk@phenom.ffwll.local>
References: <20220518085446.31338-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220518085446.31338-1-christian.koenig@amd.com>
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
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 18, 2022 at 10:54:46AM +0200, Christian König wrote:
> Use unrcu_pointer() instead of the manual cast.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

TIL about unrcu_pointer, and also that entire code here freaks me out. But
at least this seems more with what other users of similar xchg and cmpxchg
tricks are doing, so that's nice.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-fence-chain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 06f8ef97c6e8..a0d920576ba6 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -62,8 +62,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
>  			replacement = NULL;
>  		}
>  
> -		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
> -			      prev, replacement);
> +		tmp = unrcu_pointer(cmpxchg(&chain->prev, RCU_INITIALIZER(prev),
> +					     RCU_INITIALIZER(replacement)));
>  		if (tmp == prev)
>  			dma_fence_put(tmp);
>  		else
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
