Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC30751C123
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5248110E0A3;
	Thu,  5 May 2022 13:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ED410E0A3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:44:40 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ba17so5270475edb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=v+VSD0WXo/Ce0B1o6X0LvfKWoHTwZAqIOF5ploz5VzI=;
 b=hcDBBRRg5QPUwNBDCVYWy3H3fwcNY2LRCyqjB9RiCyGRIGk41LYlaL4EIPxM15kXG9
 Ht+YCERZhkJZk05AujCIFm2HPIO73F+Qvp7oTr7sAtF8NImxhWwCMzcgQ3uvro4IUxUt
 FhORcgexsj4z8+VB8HRfdAUiwMukLeMt+NWvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v+VSD0WXo/Ce0B1o6X0LvfKWoHTwZAqIOF5ploz5VzI=;
 b=lYWFipeFdSoMF6EmFhJJVobsJyFOA/1rVqfnoNrvKr/0WJhUGAeO/w+pR2P35W67bK
 kRRHnIoMyFhK95bcTTjmGpeJ/k0o685S9Hj3lvnylJgMcC8a6sXVOlwahzFAmLJE6vCL
 LRhOcf5Bz6hFNvHJjQuDUb/6DX61hgmfzL9gdpaIogEki2HRGeqy3lRvn5S4dBypOv09
 uxzJ9uW3sYnwtGBBhfsiW6Dx2qb6wWiNZX5JZxntohiQO74fAWBmXFAfEflPiyeC7uJG
 byj5gXZgfmxKdTgKSSD2Z7m6CbUXfxxazodcSz0iArYhoY71s1zq2ZqY1JabnJxbiwSC
 52Rw==
X-Gm-Message-State: AOAM533P8rwwrqFZ166qWpV/FSxCjI2VbFUgpCE0oP1SLlwZIXlYct3v
 h8s6yv5uLkryV2a9z90MXn+qDg==
X-Google-Smtp-Source: ABdhPJyP8cx9126bFIpJibfyv7g6n69rpQabIp4uwZs2KOxqVhMhAZvxNhO7n/FoNKidpmAN7rtpbA==
X-Received: by 2002:a05:6402:cb6:b0:425:f2e0:3644 with SMTP id
 cn22-20020a0564020cb600b00425f2e03644mr29618286edb.301.1651758278650; 
 Thu, 05 May 2022 06:44:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a1709066ad600b006f3ef214dcbsm780909ejs.49.2022.05.05.06.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:44:38 -0700 (PDT)
Date: Thu, 5 May 2022 15:44:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/5] dma-buf: cleanup dma_fence_unwrap implementation
Message-ID: <YnPUxGO3HfeDAf1B@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
 <20220504122256.1654-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-2-christian.koenig@amd.com>
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

On Wed, May 04, 2022 at 02:22:53PM +0200, Christian König wrote:
> Move the code from the inline functions into exported functions.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Didn't check you didn't slip in a typo or so :-)

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/Makefile           |  2 +-
>  drivers/dma-buf/dma-fence-unwrap.c | 59 ++++++++++++++++++++++++++++++
>  include/linux/dma-fence-unwrap.h   | 52 ++------------------------
>  3 files changed, 64 insertions(+), 49 deletions(-)
>  create mode 100644 drivers/dma-buf/dma-fence-unwrap.c
> 
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 4c9eb53ba3f8..70ec901edf2c 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-resv.o
> +	 dma-fence-unwrap.o dma-resv.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>  obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> new file mode 100644
> index 000000000000..711be125428c
> --- /dev/null
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dma-fence-util: misc functions for dma_fence objects
> + *
> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
> + * Authors:
> + *	Christian König <christian.koenig@amd.com>
> + */
> +
> +#include <linux/dma-fence.h>
> +#include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-chain.h>
> +#include <linux/dma-fence-unwrap.h>
> +
> +/* Internal helper to start new array iteration, don't use directly */
> +static struct dma_fence *
> +__dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
> +{
> +	cursor->array = dma_fence_chain_contained(cursor->chain);
> +	cursor->index = 0;
> +	return dma_fence_array_first(cursor->array);
> +}
> +
> +/**
> + * dma_fence_unwrap_first - return the first fence from fence containers
> + * @head: the entrypoint into the containers
> + * @cursor: current position inside the containers
> + *
> + * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
> + * first fence.
> + */
> +struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
> +					 struct dma_fence_unwrap *cursor)
> +{
> +	cursor->chain = dma_fence_get(head);
> +	return __dma_fence_unwrap_array(cursor);
> +}
> +EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
> +
> +/**
> + * dma_fence_unwrap_next - return the next fence from a fence containers
> + * @cursor: current position inside the containers
> + *
> + * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
> + * the next fence from them.
> + */
> +struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
> +{
> +	struct dma_fence *tmp;
> +
> +	++cursor->index;
> +	tmp = dma_fence_array_next(cursor->array, cursor->index);
> +	if (tmp)
> +		return tmp;
> +
> +	cursor->chain = dma_fence_chain_walk(cursor->chain);
> +	return __dma_fence_unwrap_array(cursor);
> +}
> +EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index 77e335a1bcac..e7c219da4ed7 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * fence-chain: chain fences together in a timeline
> - *
>   * Copyright (C) 2022 Advanced Micro Devices, Inc.
>   * Authors:
>   *	Christian König <christian.koenig@amd.com>
> @@ -10,8 +8,7 @@
>  #ifndef __LINUX_DMA_FENCE_UNWRAP_H
>  #define __LINUX_DMA_FENCE_UNWRAP_H
>  
> -#include <linux/dma-fence-chain.h>
> -#include <linux/dma-fence-array.h>
> +struct dma_fence;
>  
>  /**
>   * struct dma_fence_unwrap - cursor into the container structure
> @@ -33,50 +30,9 @@ struct dma_fence_unwrap {
>  	unsigned int index;
>  };
>  
> -/* Internal helper to start new array iteration, don't use directly */
> -static inline struct dma_fence *
> -__dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
> -{
> -	cursor->array = dma_fence_chain_contained(cursor->chain);
> -	cursor->index = 0;
> -	return dma_fence_array_first(cursor->array);
> -}
> -
> -/**
> - * dma_fence_unwrap_first - return the first fence from fence containers
> - * @head: the entrypoint into the containers
> - * @cursor: current position inside the containers
> - *
> - * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
> - * first fence.
> - */
> -static inline struct dma_fence *
> -dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
> -{
> -	cursor->chain = dma_fence_get(head);
> -	return __dma_fence_unwrap_array(cursor);
> -}
> -
> -/**
> - * dma_fence_unwrap_next - return the next fence from a fence containers
> - * @cursor: current position inside the containers
> - *
> - * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
> - * the next fence from them.
> - */
> -static inline struct dma_fence *
> -dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
> -{
> -	struct dma_fence *tmp;
> -
> -	++cursor->index;
> -	tmp = dma_fence_array_next(cursor->array, cursor->index);
> -	if (tmp)
> -		return tmp;
> -
> -	cursor->chain = dma_fence_chain_walk(cursor->chain);
> -	return __dma_fence_unwrap_array(cursor);
> -}
> +struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
> +					 struct dma_fence_unwrap *cursor);
> +struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>  
>  /**
>   * dma_fence_unwrap_for_each - iterate over all fences in containers
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
