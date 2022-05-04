Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7495199E4
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F76C10F755;
	Wed,  4 May 2022 08:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8F510F70B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:34:27 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t5so865656edw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8jDOSrZSiV6w3X1ACPuL+sxmkqjx+kq4DiVP5x5vSpk=;
 b=lHVgHnZiH13l2dDPKpQ1leUolO7KzDsTUClQyzz9TzStE1wUzencFkWFRHMglTJ6tE
 QXe/xvG8mhCoR+Tzf/8Shde4hhEk4bmSrvmKOCmcPUhZUtlhA2QD0BitHkP84rsYn/UL
 uBbuHWcsFsUflmTY2tmhkbSYQWGTBYeZmzhiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8jDOSrZSiV6w3X1ACPuL+sxmkqjx+kq4DiVP5x5vSpk=;
 b=kf9QcaQBB06zvqPpYxyai0QG9MPqeIGRjHKMJwTdVcQqNw2wBaNHvwaxgDxyhstk50
 hM7oCSg2qhaBh+oWUqAL06PcX/IPv1Nhlkm/h9Ksv7N/4Lk7fTAF3RqLLMQ4aB1hg1uk
 muZDu4688ju+6TiNNBd4wlHRz25oNbCLrmLrxelvQhY5ZLpVpAQ3iWi2l7Yu0Q+KuO1v
 6Q210PTzZA0fKRoEEeDMpm89oj4K8Ofc109dk4Ph5umWt6jhYyScnnpTScNx9+PTl+WB
 BjhhcqJyynA5zrdyxw+OeJUZRHXC1tHlKvT4dJAA5LlH968OxODXL93hD9m3OmurvT5Y
 QSJw==
X-Gm-Message-State: AOAM5303uuUwSwWoJvbL2CZYjqjqaB+VzaTb75AX7XtB5g8acEWvzJFF
 eA8/yY3GNNQPuGjW7n7qgELBeQ==
X-Google-Smtp-Source: ABdhPJy3I5WdqqSY6fWfVm3ogHu0RoLWrwglM1BgTcYvHJKEt5In0vfkQIYGdQIubOsFqewaPJ7rQg==
X-Received: by 2002:a05:6402:1d4c:b0:427:d1f5:3a41 with SMTP id
 dz12-20020a0564021d4c00b00427d1f53a41mr11283912edb.218.1651653266220; 
 Wed, 04 May 2022 01:34:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 en9-20020a056402528900b00425ff691a32sm8622400edb.0.2022.05.04.01.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:34:25 -0700 (PDT)
Date: Wed, 4 May 2022 10:34:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/3] dma-buf/sync_file: cleanup fence merging a bit
Message-ID: <YnI6kPd01lG/q0N2@phenom.ffwll.local>
References: <20220426124637.329764-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426124637.329764-1-christian.koenig@amd.com>
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, daniel.vetter@ffwll.ch,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 02:46:35PM +0200, Christian König wrote:
> krealloc_array() ignores attempts to reduce the array size, so the attempt
> to save memory is completely pointless here.
> 
> Also move testing for the no fence case into sync_file_set_fence(), this
> way we don't even touch the fence array when we don't have any fences.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/sync_file.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 514d213261df..0fe564539166 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -157,9 +157,15 @@ static int sync_file_set_fence(struct sync_file *sync_file,
>  	 * we already own a new reference to the fence. For num_fence > 1
>  	 * we own the reference of the dma_fence_array creation.
>  	 */
> -	if (num_fences == 1) {
> +
> +	if (num_fences == 0) {
> +		sync_file->fence = dma_fence_get_stub();
> +		kfree(fences);
> +
> +	} else if (num_fences == 1) {
>  		sync_file->fence = fences[0];
>  		kfree(fences);
> +
>  	} else {
>  		array = dma_fence_array_create(num_fences, fences,
>  					       dma_fence_context_alloc(1),
> @@ -261,19 +267,6 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  		}
>  	}
>  
> -	if (index == 0)
> -		fences[index++] = dma_fence_get_stub();
> -
> -	if (num_fences > index) {
> -		struct dma_fence **tmp;
> -
> -		/* Keep going even when reducing the size failed */
> -		tmp = krealloc_array(fences, index, sizeof(*fences),
> -				     GFP_KERNEL);
> -		if (tmp)
> -			fences = tmp;
> -	}
> -
>  	if (sync_file_set_fence(sync_file, fences, index) < 0)
>  		goto err_put_fences;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
