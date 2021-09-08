Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF6B403EC3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 20:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDAB6E233;
	Wed,  8 Sep 2021 18:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF426E233
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 18:00:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mf2so5875285ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=FjMddd6JdOMGv2zR5AkGsbruNkJ2WJnwA4ML9l26Ntg=;
 b=h/thbqp2AXqJm3KuoLxS0MSVyghbMdZNZ/SPfJhS9SJxQyIJ5pOzbsxhd9UaZRnI+p
 CFEgz3jRmxulMN0CaBwFdvDuG5mUqyVt6fkEYzZu0uQdWzeVmGOHUWiKormP/Y7dzgE9
 IcdgIY4Sk8Ft31k9qe+0u+W8UuXN4aP8Upn1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=FjMddd6JdOMGv2zR5AkGsbruNkJ2WJnwA4ML9l26Ntg=;
 b=x/II7hko+QXV/OZIYRdliXanFDznw/1kDep+iorO7ENrG99RkPazxqODBaMvxaXk+d
 OpNndt+l1dkuFbP7irEytaQJi8Cxub7YDzScaYq4pSn0lu2QMFWgeBx31AkcqL26/6Ul
 oVnaYZDytjP/MsQJH6pEU77Tx8kZOna+GVjfW1A92kSog4yy7hrruTZrfQtLRBx1rARI
 bYomh+SW0JsnvPjrfBaDRxIAo94hvg/xxV76dVJV/h4XE/stULrwJW1IyrFvLfr4pXwL
 eAc9MIFa06HWZAZjvjZs5vyxLFkWNRNf7Q5TDhaM4iJB9IvNvvpUqbOpNCA0nL4Ot+Pm
 bXZw==
X-Gm-Message-State: AOAM531ungxrBN/lfOa7iHxrsL4MbR9KawbEEqYikWrLvbOZ/dyjXdr4
 vXsY2zVgfEBfFhHkeXP+aC+i7g==
X-Google-Smtp-Source: ABdhPJxP00rpn4vKC4uI/DzFIyL0W94TxWGPF415ddLUFQDIRK8wcdXlFBHgzxiBag6dfD3mpal/Dw==
X-Received: by 2002:a17:907:9617:: with SMTP id
 gb23mr1126172ejc.175.1631124045783; 
 Wed, 08 Sep 2021 11:00:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z8sm1411638ejd.94.2021.09.08.11.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:00:45 -0700 (PDT)
Date: Wed, 8 Sep 2021 20:00:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/9] dma-buf/fence-array: Add fence deadline support
Message-ID: <YTj6S1yVvBPAZ9RJ@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903184806.1680887-7-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 11:47:57AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/dma-buf/dma-fence-array.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index d3fbd950be94..8d194b09ee3d 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -119,12 +119,23 @@ static void dma_fence_array_release(struct dma_fence *fence)
>  	dma_fence_free(fence);
>  }
>  
> +static void dma_fence_array_set_deadline(struct dma_fence *fence,
> +					 ktime_t deadline)
> +{
> +	struct dma_fence_array *array = to_dma_fence_array(fence);
> +	unsigned i;
> +
> +	for (i = 0; i < array->num_fences; ++i)
> +		dma_fence_set_deadline(array->fences[i], deadline);

Hm I wonder whether this can go wrong, and whether we need Christian's
massive fence iterator that I've seen flying around. If you nest these
things too much it could all go wrong I think. I looked at other users
which inspect dma_fence_array and none of them have a risk for unbounded
recursion.

Maybe check with Christian.
-Daniel


> +}
> +
>  const struct dma_fence_ops dma_fence_array_ops = {
>  	.get_driver_name = dma_fence_array_get_driver_name,
>  	.get_timeline_name = dma_fence_array_get_timeline_name,
>  	.enable_signaling = dma_fence_array_enable_signaling,
>  	.signaled = dma_fence_array_signaled,
>  	.release = dma_fence_array_release,
> +	.set_deadline = dma_fence_array_set_deadline,
>  };
>  EXPORT_SYMBOL(dma_fence_array_ops);
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
