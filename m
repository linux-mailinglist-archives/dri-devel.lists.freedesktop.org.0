Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25714E52F5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E7810E6DB;
	Wed, 23 Mar 2022 13:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C0310E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:22:05 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id qx21so2757455ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=l+1fp5Or9NGgTzSThmUALq6yPKXxdpqHP2QdwrJdAo0=;
 b=Yf2JS59+NhbHCjLE9Y4tEhd3k92P7PrN6SHNz0/g/qZNuMDTDmEgo2W9lrUvAKE+bl
 VlrQ1vduYx28iWr1CW9he97IrIh5lCOwHYU4QdgNiaBMr/ClyEfWFrGuj1/tv+IUsdH2
 hoXxM7xBcTRVNS+TphaGoNyz8G6t2mvdlVGHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l+1fp5Or9NGgTzSThmUALq6yPKXxdpqHP2QdwrJdAo0=;
 b=qWBcCmcsm5A0EHIQEK2nLqivohiv20DeDVUxXFzoWg17FTfCfkZNc2otkMgk3Uwwyq
 g1Evm/vtM/4TUT9G485oLwjQsTy8KKr+JaU1kek3a/XuckBcvjdAZiTUkSAnhgtcRNlS
 Ue2pB4b3JmbBoj+sifF7HAY3nNmUr9VIVViln2JU/FRGGm2zB2uF9RVeOmXoTAVNQMfl
 BNCYIoWXQpGDo3T9V4SbRdl7xUtoJWNGgHpfkxAEm5k2suqPHrP2BZJOlMIXZlA91XBD
 Tl9cQc53UFoyrGsy4dYXJF3OwiU9ibM0grm+i2m2TP/lByLgD24cEcNCk5Vm1MvMVmxG
 yXEA==
X-Gm-Message-State: AOAM531YBlapghha2SXsmSvsTtrPnCjGBvVcYHvoW/g+Zusk/wDx++Tb
 kCi+hiUVsh4GDmnuZXLWjjwcLw==
X-Google-Smtp-Source: ABdhPJzrt4ulR2R6Mr81vt0b860rgmEcRf+dE4TvtYYJrPltu2t2sG4EBomF9g8Mx89gBVF/fzI0zw==
X-Received: by 2002:a17:906:c18c:b0:6d5:8518:e567 with SMTP id
 g12-20020a170906c18c00b006d58518e567mr31199507ejz.37.1648041723649; 
 Wed, 23 Mar 2022 06:22:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056402015400b00418f9574a36sm9630743edu.73.2022.03.23.06.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:22:03 -0700 (PDT)
Date: Wed, 23 Mar 2022 14:22:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting
 the fence
Message-ID: <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-4-christian.koenig@amd.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, daniel.vetter@ffwll.ch,
 Gal Pressman <galpress@amazon.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Maor Gottlieb <maorg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 02:58:37PM +0100, Christian König wrote:
> Use dma_resv_wait() instead of extracting the exclusive fence and
> waiting on it manually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>

Jason, can you ack this for merging through drm trees please?

Thanks, Daniel

> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Maor Gottlieb <maorg@nvidia.com>
> Cc: Gal Pressman <galpress@amazon.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/infiniband/core/umem_dmabuf.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index f0760741f281..d32cd7538835 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -16,7 +16,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  {
>  	struct sg_table *sgt;
>  	struct scatterlist *sg;
> -	struct dma_fence *fence;
>  	unsigned long start, end, cur = 0;
>  	unsigned int nmap = 0;
>  	int i;
> @@ -68,11 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  	 * may be not up-to-date. Wait for the exporter to finish
>  	 * the migration.
>  	 */
> -	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
> -	if (fence)
> -		return dma_fence_wait(fence, false);
> -
> -	return 0;
> +	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
> +				     false, MAX_SCHEDULE_TIMEOUT);
>  }
>  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
