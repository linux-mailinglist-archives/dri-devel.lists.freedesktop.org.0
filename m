Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DD984CF66
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 18:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784910EE86;
	Wed,  7 Feb 2024 17:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ze7Z/NrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BEB10EE86
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 17:10:14 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40fb7427044so2665935e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707325812; x=1707930612; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UPG+Y5UifSfAr1b/3ugQkQKZbhHpDNonzO9dzweV4Ww=;
 b=Ze7Z/NrK1M3bTfe+TRDaB0TUF6GYVHyY8Ug+NTj6dfO+AAPZBv0jt4SR05dFVyJe1s
 E+9lHGSnAeObrGCjALALa/ScGCNQZoSstYdE6ik9u+ZV8mqra+0THJIDA6U4uEpPZnV2
 E+5IOyTZzEAJyk95EJW4T45iqc56kSNyLQn3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707325812; x=1707930612;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UPG+Y5UifSfAr1b/3ugQkQKZbhHpDNonzO9dzweV4Ww=;
 b=EsNS4BHkwiIjPEYcxhMvvoNvHqznKUV8BotLzB0bFMdkfsPt4qoYP/xBfAcsWICIy3
 OEccpnLpMqe2EYRr8TUyPqfkrr4HYlC6NfZIB7RBfqGj/+jUySjp83QRFvnVmfn6VyG+
 FWhKNxyyI4PenShFdgGw1JUuv8OzoCObrtVksJIrpL/5KcqTHeMLyZrzJgBigPwMXD+g
 vVmBCR000KzydaCSC00u33Zyhndb4xXes/CeawA6A/ibO65jDkhO1u12waLewUPbjsn9
 OLFidb6Xr1TlNc7KGmRBS/JNpBfn8UWWDPoRBAiuFtyrZfsp6qA169bAj5eg3efOipCx
 QTBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVygBbtGDZLa1Bt43Sk/hfpj/g147NvkJ7gwFkONN8qyw4ADhvfch0oUNMXbDyssZi3zxSEIavimyJtSr1+3fNdEom+/iVzeNEk8ccj+dfS
X-Gm-Message-State: AOJu0YyeS7WOD2esmxU1TnZ/rWAIgzeyDFfrXsxFAklMS3Zg4q7kMcqY
 PJB4bUFczYmTkzcIMJqDshb/q+AU/Mx+TOgwsvIPN5YAePq9bwIN1QZjg754dWA=
X-Google-Smtp-Source: AGHT+IEsPRfVy9ib6+oPTaqzljo0dzFnfy37G2xZ7RAqfN0oGHicnE8YOdNtlahZH3k+EfqI3cynvg==
X-Received: by 2002:a05:600c:3d8e:b0:40f:e930:9ebe with SMTP id
 bi14-20020a05600c3d8e00b0040fe9309ebemr3771440wmb.0.1707325812247; 
 Wed, 07 Feb 2024 09:10:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU4d78PdJmWpGaxeVM/qVZphJus4y+keSsoOAhdIG4L9XbZi80S4LVlZjttUegahtRfb+WxnirB+rL7E+6dEhFQZdLaQyPdkA85Et84sn/Z8V/ODYhjfY3gJmYMEOdASWS2hdFyUPFRrIZVkyqcw0v85EO8qpTdvza67qAvwxb8v8BF/UDU0yEtj/Fn+NGrXSYKuDi9d7XLMrSSk76P9fgRxH0AWyOIvrR05xWc7FcVAoPrRXBLzq7YxpULr524RIadgKGCNrDuyW8mlrDJUD7xOJeXQD13mpqPdZWEXcQnHr3PlmyY9P7zejXJmXoH7gngc7HcscVY61Kip0O2FNSNaM+3P97i/aa9+TLPtTTFX+vV65/23X6hTg7Onsn7Q9bNaviLS1LE6W6mgxV274yHq6U/3XLMgAU6cMqSzvM0MAghTIXF0LHNbKtFP8+14g1vjHl3lVfjH9rlI5hH9zzOblXyvY+ixmIMPg==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b0041007731a52sm2697105wmq.11.2024.02.07.09.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 09:10:11 -0800 (PST)
Date: Wed, 7 Feb 2024 18:10:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] [PATCH v5 2/6] dma-buf: udmabuf: Implement
 .{begin,end}_access
Message-ID: <ZcO5ccqwTIhSKDfS@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119141402.44262-3-paul@crapouillou.net>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Fri, Jan 19, 2024 at 03:13:58PM +0100, Paul Cercueil wrote:
> Implement .begin_access() and .end_access() callbacks.
> 
> For now these functions will simply sync/flush the CPU cache when
> needed.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> v5: New patch
> ---
>  drivers/dma-buf/udmabuf.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c40645999648..a87d89b58816 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -179,6 +179,31 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
>  	return 0;
>  }
>  
> +static int begin_udmabuf(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt,
> +			 enum dma_data_direction dir)
> +{
> +	struct dma_buf *buf = attach->dmabuf;
> +	struct udmabuf *ubuf = buf->priv;
> +	struct device *dev = ubuf->device->this_device;
> +
> +	dma_sync_sg_for_device(dev, sgt->sgl, sg_nents(sgt->sgl), dir);

So one thing I've just wondered is whether we've made sure that this is
only doing cache coherency maintenance, and not swiotlb bounce buffer
copying. The latter would really not be suitable for dma-buf anymore I
think.

Not sure how to best check for that since it's all in the depths of the
dma-api code, but I guess the best way to really make sure is to disable
CONFIG_SWIOTLB. Otherwise I guess the way to absolutely make sure is to
trace swiotlb_sync_single_for_device/cpu.

It would be kinda neat if dma-buf.c code could make sure you never ever
get an swiotlb entry from a dma_buf_map_attachment call, but I don't think
we can enforce that. There's sg_dma_is_swiotlb, but that won't catch all
implementations, only the generic dma-iommu.c one.

Cheers, Sima

> +	return 0;
> +}
> +
> +static int end_udmabuf(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt,
> +		       enum dma_data_direction dir)
> +{
> +	struct dma_buf *buf = attach->dmabuf;
> +	struct udmabuf *ubuf = buf->priv;
> +	struct device *dev = ubuf->device->this_device;
> +
> +	if (dir != DMA_TO_DEVICE)
> +		dma_sync_sg_for_cpu(dev, sgt->sgl, sg_nents(sgt->sgl), dir);
> +	return 0;
> +}
> +
>  static const struct dma_buf_ops udmabuf_ops = {
>  	.cache_sgt_mapping = true,
>  	.map_dma_buf	   = map_udmabuf,
> @@ -189,6 +214,8 @@ static const struct dma_buf_ops udmabuf_ops = {
>  	.vunmap		   = vunmap_udmabuf,
>  	.begin_cpu_access  = begin_cpu_udmabuf,
>  	.end_cpu_access    = end_cpu_udmabuf,
> +	.begin_access      = begin_udmabuf,
> +	.end_access        = end_udmabuf,
>  };
>  
>  #define SEALS_WANTED (F_SEAL_SHRINK)
> -- 
> 2.43.0
> 
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
