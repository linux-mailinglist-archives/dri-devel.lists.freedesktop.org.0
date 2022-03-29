Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC354EA999
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448FB10E7BE;
	Tue, 29 Mar 2022 08:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B211510E7BD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:48:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w21so19167628wra.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wV/zkilnqdFrqQKJ4JOwa7kKyc//0tE3STDLU5WF3qc=;
 b=OuYZ6vtK2M4DG2+DY+jnQFbxcz0dEGjyJBrIsInABVbuKV6BbWRnxDKLkJhGe5zpXH
 pKheIMnEHKkyxXVBQqelEiZ84T+5Ca3CBm79FPwSqf+PZS/RGXSCcWAQEku77RIduFES
 oiqkvSp4a8hIY02oPqa0uAhYyFvXdWttnvMdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wV/zkilnqdFrqQKJ4JOwa7kKyc//0tE3STDLU5WF3qc=;
 b=tjD9FQw7VFBFkWT3Dv1sJexspTjuy/aOY/4afJ84pHgMwKIOKbcA1e7HZBKYw71L/f
 raTUfPg5kydYkO9EzPcv12kxgHBtk7QMN6KH+ZEbLScfkVatazl1KVSQy9lDBeh0BG4k
 TdE96sn3sG25NnQKXAduXlUc4KvsGeqi3qznRV3c1js+eX9ZbUd65GF3mYdXLVoyreCX
 YpuK9yXkYzfySQbmymT8M79yZdtcCvjjISkDK+/h2PkxtNiB4Xp1Zr5yR/GgBTBRIbhv
 vtWywa0ATQl9ewlD/77VD4evNdOQA60ww3+6b9nfWJFjt+RSxt5SH4eFtOZOXqRihRBa
 fhiw==
X-Gm-Message-State: AOAM530/CNTgUBPf74f5Kec2gy+3hrJ55/B+1E4NNYgQFzux6P1Pjmvr
 UwxMvnR3WexOnTgw9aq5GoJkvw==
X-Google-Smtp-Source: ABdhPJzsef3n0+iH0vZE1Z/Q44owreRxus91uDLsKNCtdrlcsyprP/STCZVm2Q3lBDi6MKJ5/4vGyA==
X-Received: by 2002:a5d:59a2:0:b0:204:20d9:a5b9 with SMTP id
 p2-20020a5d59a2000000b0020420d9a5b9mr28725261wrr.560.1648543692293; 
 Tue, 29 Mar 2022 01:48:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a05600018af00b002057c72d45fsm17762974wri.77.2022.03.29.01.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:48:11 -0700 (PDT)
Date: Tue, 29 Mar 2022 10:48:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] dma-buf: handle empty dma_fence_arrays gracefully
Message-ID: <YkLHypwNnLd+qA4H@phenom.ffwll.local>
References: <20220329070001.134180-1-christian.koenig@amd.com>
 <20220329070001.134180-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220329070001.134180-2-christian.koenig@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 09:00:01AM +0200, Christian König wrote:
> A bug inside the new sync-file merge code created empty dma_fence_array instances.
> 
> Warn about that and handle those without crashing.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence-array.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 52b85d292383..5c8a7084577b 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>  	struct dma_fence_array *array;
>  	size_t size = sizeof(*array);
>  
> +	WARN_ON(!num_fences || !fences);

WARN_ON and then dying randomly is kinda not nice, I'd wrap this in an

if (WARN_ON)
	return NULL;

with that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	/* Allocate the callback structures behind the array. */
>  	size += num_fences * sizeof(struct dma_fence_array_cb);
>  	array = kzalloc(size, GFP_KERNEL);
> @@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
>  	if (!array)
>  		return head;
>  
> +	if (!array->num_fences)
> +		return NULL;
> +
>  	return array->fences[0];
>  }
>  EXPORT_SYMBOL(dma_fence_array_first);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
