Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB36D493C8C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E110E16B;
	Wed, 19 Jan 2022 15:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7F710E18C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:05:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso2747729wmf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=0odyDD4qZWEyKf4dgk5bsg3tKYSY9CGvoUStfcevylA=;
 b=KY4YCZwWueLtUID+/YuRziwAprnxroizrhhiLqgR+VJv0dvAqf6p/e/Z8+2hbD5td3
 M1RXz2Ulz5/UO405poQs0LC2mWECerbCYmm6/PclkyYapoYCKVCVsrH7+qHMc7mD7DNG
 yVv6KCpVaJQuyRwX173l73U/aTdl9LopqeRzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=0odyDD4qZWEyKf4dgk5bsg3tKYSY9CGvoUStfcevylA=;
 b=7qQpG1N708bK4rFz9Mj7p+7UdVho3EORC5s01J3lOznw2LiUu3h/01Fmk3YJRRKTxH
 BqvT7kzvMx4aFlAlVwvCUF0gCNQgwtIai9rlFzwbnP5N9fXuGaAOI7bi0Q21Ur1mCe10
 +I2mlOoA6QSt1q+ZV7Y6sgffnqyAQ1Szo7qCRqT+Cp9ezPIBqk78ectwkymAik6+cyp0
 GgX20iQHstsVKxsvbZQu0MfNbhOi/Lu+7/eWoGVSyPNNbqWwDU1k8GnSxSKxVrcUuoYZ
 Vm7WGVTUYMho0BqlEYLPyHbzTiFZoVwzi6g/rEVGuPXYADL1qXVu5qOq7LLKFlNCYLRi
 qkug==
X-Gm-Message-State: AOAM533IeJtnPW7nVnWrXy/U+iFcyb5lKWYZksM3HsS+kuaXiu0pEHfW
 qKnu43yPrVImqih7PLnjS5voSw==
X-Google-Smtp-Source: ABdhPJxqxOTFLl5T1cf1q2Ex/gbOeL3/4WLRyt3JAUtwMEe4sBmurRyS45VDAxAFnc6SDjv5q4TcRQ==
X-Received: by 2002:adf:fec2:: with SMTP id q2mr29547534wrs.546.1642604721320; 
 Wed, 19 Jan 2022 07:05:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g17sm7645503wmq.9.2022.01.19.07.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:05:20 -0800 (PST)
Date: Wed, 19 Jan 2022 16:05:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Weizhao Ouyang <o451686892@gmail.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Fix mutex locking section
Message-ID: <YegormDmEewox0MF@phenom.ffwll.local>
Mail-Followup-To: Weizhao Ouyang <o451686892@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20220104073545.124244-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104073545.124244-1-o451686892@gmail.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <labbott@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 04, 2022 at 03:35:45PM +0800, Weizhao Ouyang wrote:
> Fix cma_heap_buffer mutex locking critical section to protect vmap_cnt
> and vaddr.
> 
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 0c05b79870f9..83f02bd51dda 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -124,10 +124,11 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>  	struct cma_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
>  
> +	mutex_lock(&buffer->lock);
> +
>  	if (buffer->vmap_cnt)
>  		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);

Since this creates nesting with mm/, but optionally I think it'd be good
to prime lockdep so it knows about this. See e.g. dma_resv_lockdep() in
dma-resv.c, except I don't know offhand what the right lock for
invalidate_kernel_vmap_range is.
-Daniel


>  
> -	mutex_lock(&buffer->lock);
>  	list_for_each_entry(a, &buffer->attachments, list) {
>  		if (!a->mapped)
>  			continue;
> @@ -144,10 +145,11 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>  	struct cma_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
>  
> +	mutex_lock(&buffer->lock);
> +
>  	if (buffer->vmap_cnt)
>  		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
>  
> -	mutex_lock(&buffer->lock);
>  	list_for_each_entry(a, &buffer->attachments, list) {
>  		if (!a->mapped)
>  			continue;
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
