Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99067C58CA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 18:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC6710E529;
	Wed, 11 Oct 2023 16:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC65E10E529
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:04:01 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so47485385ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697040241; x=1697645041;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/JdPIzkZRw+UEDCwPct/StXsx1OeuztdzUWh/BOTJXs=;
 b=FGz3P1PqjDjw3USmDdcKE8sCLOtEeTLLk/QqToWWko7/ixzBbxy/SoxGpOK9jz+M4/
 GGNKviAvok9hRQJPFsxlhJoFHJDXbIhH5U7saGnEAOQQbjCarJ+CvGWlwt3MhVI/7Bkr
 8PwrAXg1BjpQFUBfLxx0KnvGci1jxo04k55fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697040241; x=1697645041;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JdPIzkZRw+UEDCwPct/StXsx1OeuztdzUWh/BOTJXs=;
 b=Ebki/smbFYEsOwrfaudXLiWLTiONxv1P5TYOPVZzIUBWe6ByAF0lv81XjQtE+hCuDV
 FGvXynmbddJECdzoyliLMYv4D8zC//jlyzcIrNO2PEE275AXdjN7LeSBKYYeL9pjTY1W
 7nyN3C0dvp9pEXba47dTPhl7jusEfvuwMA6V6SFKkur+apeEivSAYrlf5DmSDldev5NY
 j23Ag4r2fzRBMYTc6uM1P5XN3hat2xCcK5nQ/HTZlmj1Ae9SPFFFZDvaSiOXZHEDo+ph
 2uh/LQn6fgbYpvLWzZ3jVFGrqgHvacdEhc/36BAqthqB/UI6uAd5fuqHXjytlXoHSEDf
 PKrw==
X-Gm-Message-State: AOJu0YyxlqkpyuiK/zk+4AAVgsvF/YrAYEO1AOxWoNCXgfTym4Oo3Di4
 AWhb/DZ44rhnYOAEd0CwolYRfA==
X-Google-Smtp-Source: AGHT+IGqjWqrCIqSHnONJ5fjKcFYrHjY07tSyis9X/kZiXSoJrS/q64lZQJ+lrnayGHRVg3N8XWShA==
X-Received: by 2002:a17:903:2289:b0:1c6:28f6:9545 with SMTP id
 b9-20020a170903228900b001c628f69545mr21755725plh.45.1697040241156; 
 Wed, 11 Oct 2023 09:04:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 jw14-20020a170903278e00b001adf6b21c77sm9908plb.107.2023.10.11.09.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 09:04:00 -0700 (PDT)
Date: Wed, 11 Oct 2023 09:03:58 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] dma-buf: Fix NULL pointer dereference in
 dma_fence_enable_sw_signaling()
Message-ID: <202310110903.FE533CBCD@keescook>
References: <ZSarP0/+hG8/87//@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSarP0/+hG8/87//@work>
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org,
 Arvind Yadav <Arvind.Yadav@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 08:03:43AM -0600, Gustavo A. R. Silva wrote:
> Currently, a NULL pointer dereference will happen in function
> `dma_fence_enable_sw_signaling()` (at line 615), in case `chain`
> is not allocated in `mock_chain()` and this function returns
> `NULL` (at line 86). See below:
> 
> drivers/dma-buf/st-dma-fence-chain.c:
>  86         chain = mock_chain(NULL, f, 1);
>  87         if (!chain)
>  88                 err = -ENOMEM;
>  89
>  90         dma_fence_enable_sw_signaling(chain);

Instead of the larger patch, should line 88 here just do a "return
-ENOMEM" instead?

-Kees

> 
> drivers/dma-buf/dma-fence.c:
>  611 void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>  612 {
>  613         unsigned long flags;
>  614
>  615         spin_lock_irqsave(fence->lock, flags);
> 			       ^^^^^^^^^^^
> 				    |
> 			  NULL pointer reference
> 			  if fence == NULL
> 
>  616         __dma_fence_enable_signaling(fence);
>  617         spin_unlock_irqrestore(fence->lock, flags);
>  618 }
> 
> Fix this by adding a NULL check before dereferencing `fence` in
> `dma_fence_enable_sw_signaling()`. This will prevent any other NULL
> pointer dereference when the `fence` passed as an argument is `NULL`.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: d62c43a953ce ("dma-buf: Enable signaling on fence for selftests")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/dma-buf/dma-fence.c | 9 ++++++++-
>  include/linux/dma-fence.h   | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 8aa8f8cb7071..4d2f13560d0f 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -607,14 +607,21 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   * This will request for sw signaling to be enabled, to make the fence
>   * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
>   * internally.
> + *
> + * Returns 0 on success and a negative error value when @fence is NULL.
>   */
> -void dma_fence_enable_sw_signaling(struct dma_fence *fence)
> +int dma_fence_enable_sw_signaling(struct dma_fence *fence)
>  {
>  	unsigned long flags;
>  
> +	if (!fence)
> +		return -EINVAL;
> +
>  	spin_lock_irqsave(fence->lock, flags);
>  	__dma_fence_enable_signaling(fence);
>  	spin_unlock_irqrestore(fence->lock, flags);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>  
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index ebe78bd3d121..1e4025e925e6 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -399,7 +399,7 @@ int dma_fence_add_callback(struct dma_fence *fence,
>  			   dma_fence_func_t func);
>  bool dma_fence_remove_callback(struct dma_fence *fence,
>  			       struct dma_fence_cb *cb);
> -void dma_fence_enable_sw_signaling(struct dma_fence *fence);
> +int dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
> -- 
> 2.34.1
> 
> 

-- 
Kees Cook
