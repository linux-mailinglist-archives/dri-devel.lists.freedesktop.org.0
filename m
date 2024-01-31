Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD2844118
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 14:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A128310FA1C;
	Wed, 31 Jan 2024 13:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B410FA1C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 13:54:47 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-55eed368b0bso1892516a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 05:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706709226; x=1707314026; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ahOd0DsEgD/5LLUjuJjav5ZXUjQod+q+9a1w7vEMGKU=;
 b=aj8YnJySYCaDKiUBN3tsliEXf/yUIb3b9xtocJ9+bel0WbZeXcLRiYtTYeoGVWYrus
 asIwbxuGFHHwKXI6Uqd5dItH5AKuLFhQtkxLK3cGXYybf6X0amztrkRRKxlQeDYo43RB
 u19tDzoFfCNWPfj1zhvqOQ8BPYRVhOwEaz4/zfpTPxvel8vz3KXAFttIuqjQatniXdL6
 MOFOLx0tRlsrRxNh9kbSsIQmi8lYUIvEEV50B5pWr3XmgmGVCz1B/+pVgEj1YIcY7tZ/
 ZMINepwnpBfKVd18ExkMq+0pfjTR/XyNepta6QsCLZv2nA6xVPa4I21Tmq7MR7iaPUti
 Ur3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706709226; x=1707314026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahOd0DsEgD/5LLUjuJjav5ZXUjQod+q+9a1w7vEMGKU=;
 b=bgkT+DoU/YqAbyWcTmDuGuZawDCDsnivthtKT9p0lr9CJeCadfzNCvbTWD2oCBgcBF
 Hgj3OhHWApTr/xC1lrmbiJbHisp7UR30oWV26JkEaXE3HOkJj+jWleGj+y/62aiEnJqs
 gU126/5eXjVCvoy6mBnyW31NBpuaIEgcAOmb0sv3XM5BbueluLJG/Y6rGvRE9CCmErGt
 5I3YGpcLpmQtaMGGuEeCMJPIB519M9fG+rzvSryvRD1PtNF7QkGOV0DJCUgkHppFZJU3
 UiSUONjE4L1H1w06vTNvIRFzZC9bJLmoye/jXSNjYCctj/UlEicuYjzD9Nd5yUwwcAI4
 bZ5Q==
X-Gm-Message-State: AOJu0YwEIqnI9QV/mVPx7COg9MIDr6LRBKF0CgfkBDdr/nEENRLhkOMI
 /G0CGbCkyRi0nMTeyW1bgfsmNCTP8V0BcDQLR5H3QUjIoqTZ68pUTVGsXh0LbNw=
X-Google-Smtp-Source: AGHT+IF/HhYD9uEpTmG0foPvY+xCTXKvk5obu0HsU61MTSjfgdbYBqyNsdDIta+ap8fzjTNneV6ulw==
X-Received: by 2002:a05:6402:26ce:b0:55f:992a:6214 with SMTP id
 x14-20020a05640226ce00b0055f992a6214mr544647edd.4.1706709226169; 
 Wed, 31 Jan 2024 05:53:46 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWUqIoHU49HCTb1rUovxV2gzF0kNXugLnZJeOYtS/NemWRrh0sE6nRlMpUq+1mJOwWQ4reR3QOaR4C3hI6SS4Kh4wZKVlDJ6uoiKBDU6GaEZZwuVqTSlfqoRX1FVckX34fLfeEqodIdgfqNacwxzO+JYfyzbocr4Tf59DtEwj01giG3YFJYFmtUtcG6AP90iDOC5tTEc867KA+4Emd3CN1m+cq3Dcnp1bMhe39oHkOf2V0jc4Bm3Bv6PK49WOdh4e/icTK6ccAzVCAvXM8v/flwcNq8frmo+e6JZeNhUY6YN1hwSWBx+UtwP0rMZbbaqwrgKeKmjD2tJSVyvIRoB22IZqQSA0oS+sFhSdh38PdbvFu5BAMPHZv/GJMNZp30c6wZ1ADFFk8hz9MQ3y+PNePEmHaVS9CRINxdCNihRo6E4sgFvNybrmAmsC9H269+TZOeVrhCndoEuH72nqlo1ERZTy5ElrRbIMG8cczjx3VcSNQBRpAh1bFq1MgJiK5+nY1mN/UQhps5E330KFEiv7gJSnXi/jK8jB8We7h/tnrp/0t23yaFt41Svs574zOCgtjvdO0u52EcTzEez9PatHNpm5lOxC8qYzIzcVI0R91u1nCmwKpYslmUYln4R7MnjewahTR+IYHmByVBXx0FTdOFqHCMcWcrlN39J5yYs1np2PrPxYyI3DIW1gi3OCDgZNdD5rVHlFc75iXOjasBH7eahPDFLcVx0p6BqqJ2mLLk4NTcoZIP85Zu5wI7g8IBiqrZJcWYGgNwTRryHRWokBw5XBe1BnY+ib53YyThWi+SlQrwBSm9ItKEaslSYUzPrVjWnl0hURKIOdO4Q1NPXPTGQdvnNoeFf6lkeqho5K0m8d5bIh8SAM9gkGTnBDlRsusQAZ8M5GG+Da2YhJoKqVc8P0u+gvHUcFdFxRqRfZjFVyBvK4UT6BKw+xELIa0Q+7Tc6t
 togPTrIj/XhTaCr9NEbPyyavGfIsDRv+PD
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com.
 [81.231.61.187]) by smtp.gmail.com with ESMTPSA id
 ec37-20020a0564020d6500b0055f8adf1d6esm465420edb.47.2024.01.31.05.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 05:53:45 -0800 (PST)
Date: Wed, 31 Jan 2024 14:53:43 +0100
From: Joakim Bech <joakim.bech@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
Message-ID: <20240131135343.rj6xlch6zcev2v47@pop-os.localdomain>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240112092014.23999-4-yong.wu@mediatek.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Pavel Machek <pavel@ucw.cz>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 05:20:10PM +0800, Yong Wu wrote:
> Add "struct restricted_heap_ops". For the restricted memory, totally there
> are two steps:
> a) memory_alloc: Allocate the buffer in kernel;
> b) memory_restrict: Restrict/Protect/Secure that buffer.
> The memory_alloc is mandatory while memory_restrict is optinal since it may
>
s/optinal/optional/

> be part of memory_alloc.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
>  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
> index fd7c82abd42e..8c266a0f6192 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -12,10 +12,44 @@
>  
>  #include "restricted_heap.h"
>  
> +static int
> +restricted_heap_memory_allocate(struct restricted_heap *heap, struct restricted_buffer *buf)
> +{
> +	const struct restricted_heap_ops *ops = heap->ops;
> +	int ret;
> +
> +	ret = ops->memory_alloc(heap, buf);
> +	if (ret)
> +		return ret;
> +
> +	if (ops->memory_restrict) {
> +		ret = ops->memory_restrict(heap, buf);
> +		if (ret)
> +			goto memory_free;
> +	}
> +	return 0;
> +
> +memory_free:
> +	ops->memory_free(heap, buf);
> +	return ret;
> +}
> +
> +static void
> +restricted_heap_memory_free(struct restricted_heap *heap, struct restricted_buffer *buf)
> +{
> +	const struct restricted_heap_ops *ops = heap->ops;
> +
> +	if (ops->memory_unrestrict)
> +		ops->memory_unrestrict(heap, buf);
> +
> +	ops->memory_free(heap, buf);
> +}
> +
>  static struct dma_buf *
>  restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
>  			 unsigned long fd_flags, unsigned long heap_flags)
>  {
> +	struct restricted_heap *restricted_heap = dma_heap_get_drvdata(heap);
>  	struct restricted_buffer *restricted_buf;
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  	struct dma_buf *dmabuf;
> @@ -28,6 +62,9 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
>  	restricted_buf->size = ALIGN(size, PAGE_SIZE);
>  	restricted_buf->heap = heap;
>  
> +	ret = restricted_heap_memory_allocate(restricted_heap, restricted_buf);
>
Can we guarantee that "restricted_heap" here isn't NULL (i.e., heap->priv). If
not perhaps we should consider adding a check for NULL in the
restricted_heap_memory_allocate() function?

> +	if (ret)
> +		goto err_free_buf;
>  	exp_info.exp_name = dma_heap_get_name(heap);
>  	exp_info.size = restricted_buf->size;
>  	exp_info.flags = fd_flags;
> @@ -36,11 +73,13 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
>  	dmabuf = dma_buf_export(&exp_info);
>  	if (IS_ERR(dmabuf)) {
>  		ret = PTR_ERR(dmabuf);
> -		goto err_free_buf;
> +		goto err_free_restricted_mem;
>  	}
>  
>  	return dmabuf;
>  
> +err_free_restricted_mem:
> +	restricted_heap_memory_free(restricted_heap, restricted_buf);
>  err_free_buf:
>  	kfree(restricted_buf);
>  	return ERR_PTR(ret);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
> index 443028f6ba3b..ddeaf9805708 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -15,6 +15,18 @@ struct restricted_buffer {
>  
>  struct restricted_heap {
>  	const char		*name;
> +
> +	const struct restricted_heap_ops *ops;
> +};
> +
> +struct restricted_heap_ops {
>
This have the same name as used for the dma_heap_ops in the file
restricted_heap.c, this might be a little bit confusing, or?

> +	int	(*heap_init)(struct restricted_heap *heap);
> +
> +	int	(*memory_alloc)(struct restricted_heap *heap, struct restricted_buffer *buf);
> +	void	(*memory_free)(struct restricted_heap *heap, struct restricted_buffer *buf);
> +
> +	int	(*memory_restrict)(struct restricted_heap *heap, struct restricted_buffer *buf);
> +	void	(*memory_unrestrict)(struct restricted_heap *heap, struct restricted_buffer *buf);
>
Is the prefix "memory_" superfluous here in these ops?

Also related to a comment on the prior patch. The name here is "heap" for
restricted_heap, but below you use rstrd_heap. It's the same struct, so I would
advise to use the same name to avoid confusion when reading the code. As
mentioned before, I think the name "rheap" would be a good choice.

>  };
>  
>  int restricted_heap_add(struct restricted_heap *rstrd_heap);
> -- 
> 2.25.1
> 

-- 
// Regards
Joakim
