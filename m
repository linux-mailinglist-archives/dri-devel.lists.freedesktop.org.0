Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC147D8AC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8211510E2CB;
	Wed, 22 Dec 2021 21:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A51610E2CB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:23:03 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y22so13633221edq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7uCwVgIdUNyS2+Vf8fBeHDqgyCKmyllVBt9AhJderrQ=;
 b=OFb4TBFRFmRtLgziqM2CU3Xz/keCLRPRbJxJLqSIzPw5DsjC77+SED3+wEqweXZu/r
 7f53W11o9hzg3gdkyNlw+8upEFr7t4TQVmqHZcqTjXzUvqpX8nW36zyW9isb3N8Jp7d4
 rznjmDEjh0Xj8pBPNSJvAmLkVwdGzapOlXhC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7uCwVgIdUNyS2+Vf8fBeHDqgyCKmyllVBt9AhJderrQ=;
 b=kz0WaOu9cbrcGuTJL7svGCddn7pTIaJyD5RNvFc5YuH20IPsBo6iYJXgfiXLc2dKdE
 ljhIO8NEUBuAci5JC/8+M11hJJvTiTN0KZC7I0lLg7bPKLd+SG2rilTbOPQlYgcKLSbk
 VDymbTxMm6loRwYTHlpSrglmH946bH5B3dt52aE+jnRRQFHrrw9jTQoJ99m34pHfyqpB
 AO4CtG2FiQdHDMVIzHevr3ADXAYuS48BlfcHruxCnPja+KVkMnzaO0Cm7G4aBCpzTl3P
 mk8DEHlMBH/OdrMAr0QoEyiYKYiYb53CQlWucZPW4wA33kaYiaTP6KnaM36p5sE1F/ZT
 9fqA==
X-Gm-Message-State: AOAM531mz3UmyRK1AP814yvetcOEm+1SJh2HBkBs883Ny1iaDJEJyMDU
 T1aFt1KCAEGoSDQjt2IsN7h5lg==
X-Google-Smtp-Source: ABdhPJzmRP8AML3qliy2Op5iUsEArD0nhe3n5SG1dTwdhl3Xs7qcVR7f3Ddt4pQqd/BGaE2rQkP+2A==
X-Received: by 2002:a17:907:1629:: with SMTP id
 hb41mr4114530ejc.328.1640208182181; 
 Wed, 22 Dec 2021 13:23:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id jt4sm1061781ejb.105.2021.12.22.13.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:23:01 -0800 (PST)
Date: Wed, 22 Dec 2021 22:23:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 05/24] RDMA: use dma_resv_wait() instead of extracting
 the fence
Message-ID: <YcOXNNxN4WajDN4L@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-6-christian.koenig@amd.com>
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

On Tue, Dec 07, 2021 at 01:33:52PM +0100, Christian König wrote:
> Use dma_resv_wait() instead of extracting the exclusive fence and
> waiting on it manually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

No rdma lists nor maintainers on cc, so no chances to get the ack you need
to merge this through drm-misc-next.


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

I think a wrapper for dma_resv_wait() without timeout would be neat, which
we lack. Either way:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
