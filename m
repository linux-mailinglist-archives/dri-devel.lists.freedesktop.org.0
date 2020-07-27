Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F722EA17
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 12:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD6F89812;
	Mon, 27 Jul 2020 10:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D380B89D46
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:33:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f7so14357778wrw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bp6uPhq8Td50m/QVbazzycqVQS9Vblt2hLy6wVK8dW8=;
 b=SJHrg99+vGfbab57L7UdmSd/pGK823VctI12nhCPFOr+5GmU//4zl5vEsfn8zfX/vV
 qt3hobr+jgDCAg5MdnBMV0nAEY56XWwKDedpRpFwB14zlcAtbmPiotp1Y4aU4171Ez03
 Qu/PYee0BM6PBk+ezr25LOx1up1ct466XXA1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Bp6uPhq8Td50m/QVbazzycqVQS9Vblt2hLy6wVK8dW8=;
 b=ZIUnVyMG2Ul0dbnrIJ6s/Z8x8zG6H2bWqwqB70Os0/MpQUaUgAmHWM57wNAz6I3PSb
 lCbpkk8b1g30carAE0OcolUyG3xkG2BtJKBAmXbMt4nbo7ly/9duTwviJMGcQ1zKAzy/
 up3LiLq9QPOwD1bN7GvVDBlhVgnKyCiYWXdgD9kz+/D3+9J2OOjcuNGMBvIUZHRG9Jv8
 q0eu1YzQ+hnm3ARsI5phF5ZvWX9pou8EFOqjsk/KdwtbJBeK1V/06PHwVR1HMxykEGV6
 3fGpDsWR175r7j2CwKbBgvAiz5luMj572QGZ9V3PyT5URumwXwsN0CaEb8DkYj3hDZks
 d7KA==
X-Gm-Message-State: AOAM531v37hBrvJ9iJRdzDtTZUfGQEUc6RTheiXVx2PVdx1+xa91bIXa
 vA8Q2hdH/43ooSCyiVH/M3U7ow==
X-Google-Smtp-Source: ABdhPJw4ZkhN2VuqVSgEP8hgcS77O8oJSeL3Qre7Wb03kvDLQWqrlaQw6ghc6AiPiTbZD7LpESuyVQ==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr21040589wrs.132.1595846026409; 
 Mon, 27 Jul 2020 03:33:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h23sm16668156wmb.3.2020.07.27.03.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:33:45 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:33:43 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [RFC][PATCH] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20200727103343.GT6419@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 linux-media@vger.kernel.org
References: <20200725032633.125006-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725032633.125006-1-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 Laura Abbott <labbott@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 25, 2020 at 03:26:33AM +0000, John Stultz wrote:
> Add proper refcounting on the dma_heap structure.
> While existing heaps are built-in, we may eventually
> have heaps loaded from modules, and we'll need to be
> able to properly handle the references to the heaps

Uh I kinda want to wait until we cross that bridge ... this entire vendor
heaps thing still sounds very much like vendor trees hacking around
instead of having upstream drivers using upstream infrastructure.
-Daniel

> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c | 31 +++++++++++++++++++++++++++----
>  include/linux/dma-heap.h   |  6 ++++++
>  2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index afd22c9dbdcf..90c3720acc1c 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -40,6 +40,8 @@ struct dma_heap {
>  	dev_t heap_devt;
>  	struct list_head list;
>  	struct cdev heap_cdev;
> +	int minor;
> +	struct kref refcount;
>  };
>  
>  static LIST_HEAD(heap_list);
> @@ -190,11 +192,31 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  	return heap->priv;
>  }
>  
> +static void dma_heap_release(struct kref *ref)
> +{
> +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> +
> +	/* Remove heap from the list */
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
> +
> +	device_destroy(dma_heap_class, heap->heap_devt);
> +	cdev_del(&heap->heap_cdev);
> +	xa_erase(&dma_heap_minors, heap->minor);
> +
> +	kfree(heap);
> +}
> +
> +void dma_heap_put(struct dma_heap *h)
> +{
> +	kref_put(&h->refcount, dma_heap_release);
> +}
> +
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  {
>  	struct dma_heap *heap, *h, *err_ret;
>  	struct device *dev_ret;
> -	unsigned int minor;
>  	int ret;
>  
>  	if (!exp_info->name || !strcmp(exp_info->name, "")) {
> @@ -223,12 +245,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	if (!heap)
>  		return ERR_PTR(-ENOMEM);
>  
> +	kref_init(&heap->refcount);
>  	heap->name = exp_info->name;
>  	heap->ops = exp_info->ops;
>  	heap->priv = exp_info->priv;
>  
>  	/* Find unused minor number */
> -	ret = xa_alloc(&dma_heap_minors, &minor, heap,
> +	ret = xa_alloc(&dma_heap_minors, &heap->minor, heap,
>  		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
>  	if (ret < 0) {
>  		pr_err("dma_heap: Unable to get minor number for heap\n");
> @@ -237,7 +260,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	}
>  
>  	/* Create device */
> -	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), minor);
> +	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), heap->minor);
>  
>  	cdev_init(&heap->heap_cdev, &dma_heap_fops);
>  	ret = cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
> @@ -267,7 +290,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  err2:
>  	cdev_del(&heap->heap_cdev);
>  err1:
> -	xa_erase(&dma_heap_minors, minor);
> +	xa_erase(&dma_heap_minors, heap->minor);
>  err0:
>  	kfree(heap);
>  	return err_ret;
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 454e354d1ffb..c1572f29cfac 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -56,4 +56,10 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
>   */
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>  
> +/**
> + * dma_heap_put - drops a reference to a dmabuf heaps, potentially freeing it
> + * @heap:		heap pointer
> + */
> +void dma_heap_put(struct dma_heap *heap);
> +
>  #endif /* _DMA_HEAPS_H */
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
