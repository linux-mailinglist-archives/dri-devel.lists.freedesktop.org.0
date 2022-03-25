Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C94E70EF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 11:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3847810EB65;
	Fri, 25 Mar 2022 10:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD710EB65
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:13:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m30so10205913wrb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=W9yiDcs2xq89D8bBdi8YII9B/thS43VC5jakhczl+VM=;
 b=SPZkSAWtoSjkxQqHoXP8wLmfxhqezv+leritFQeGncOLeeLBWjuRqw+wLrdaJRhJ3w
 PX7jPlkrVwx2BUsIL9NYba5tXkRICeOXy4rbzhYriEapH0GpVjkBp0AxLP16j7XEVaT/
 RDtA9dGnLahB+Vmd12nff+v5Gjlb5pNUkH7lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W9yiDcs2xq89D8bBdi8YII9B/thS43VC5jakhczl+VM=;
 b=sHieFPetXej8w1Ky1CE92H+5a2SGRvYYb6VbqXg+YAwevUOitQJ443N6rUoe6Swhy/
 NKwI2QEcAgmfNx0UwLQ4maKKrd+uN/O+WdAi66FT2AZHb14tFt0OYMKIHOBXN0q8RT6Y
 cWonawVf4nDY3EQNr5GZF2XbgWh3VDFM0qyGnHFcTQiWEka1eTp+cw/NCxAEK2kMindF
 xYFkTVTyve0hZJUnf7MhfParoIPbdOMzsmNJ+wPRAmkk6aqUs4BcgCGRxesKy6+M5s/U
 Npe8mgy7W19BpWwe0ju6NrMf8v6MUy5QB1rQcFFNqbh4hkq5rPqxBf/PuEEltvCcXi7G
 hmLg==
X-Gm-Message-State: AOAM5325IWIIrEqUmtu30eP8CX8fCn+k1RH441ZTCInkHngKHpfg8Xb5
 tc41kfrPZoD+Tm4A4A54oSYfVA==
X-Google-Smtp-Source: ABdhPJxJsIapLKDRWOW55VXgkBRTDSR7/GC05YvkU9YzG+ojWvqnYk/ydS2ikgwV+Y1Uo/+LhBN/Dw==
X-Received: by 2002:adf:f949:0:b0:203:e87d:1d38 with SMTP id
 q9-20020adff949000000b00203e87d1d38mr8397904wrr.137.1648203201007; 
 Fri, 25 Mar 2022 03:13:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm5667247wrb.8.2022.03.25.03.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 03:13:20 -0700 (PDT)
Date: Fri, 25 Mar 2022 11:13:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] dma-buf/sync-file: fix warning about fence containers
Message-ID: <Yj2VvjGUJl8kCS8H@phenom.ffwll.local>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <20220311110244.1245-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311110244.1245-2-christian.koenig@amd.com>
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
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 12:02:44PM +0100, Christian König wrote:
> The dma_fence_chain containers can show up in sync_files as well resulting in
> warnings that those can't be added to dma_fence_array containers when merging
> multiple sync_files together.
> 
> Solve this by using the dma_fence_unwrap iterator to deep dive into the
> contained fences and then add those flatten out into a dma_fence_array.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I have no idea why we try to keep fences sorted, but oh well it looks like
the merging is done correctly.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/sync_file.c | 141 +++++++++++++++++++-----------------
>  1 file changed, 73 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 394e6e1e9686..b8dea4ec123b 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2012 Google, Inc.
>   */
>  
> +#include <linux/dma-fence-unwrap.h>
>  #include <linux/export.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
> @@ -172,20 +173,6 @@ static int sync_file_set_fence(struct sync_file *sync_file,
>  	return 0;
>  }
>  
> -static struct dma_fence **get_fences(struct sync_file *sync_file,
> -				     int *num_fences)
> -{
> -	if (dma_fence_is_array(sync_file->fence)) {
> -		struct dma_fence_array *array = to_dma_fence_array(sync_file->fence);
> -
> -		*num_fences = array->num_fences;
> -		return array->fences;
> -	}
> -
> -	*num_fences = 1;
> -	return &sync_file->fence;
> -}
> -
>  static void add_fence(struct dma_fence **fences,
>  		      int *i, struct dma_fence *fence)
>  {
> @@ -210,86 +197,97 @@ static void add_fence(struct dma_fence **fences,
>  static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  					 struct sync_file *b)
>  {
> +	struct dma_fence *a_fence, *b_fence, **fences;
> +	struct dma_fence_unwrap a_iter, b_iter;
> +	unsigned int index, num_fences;
>  	struct sync_file *sync_file;
> -	struct dma_fence **fences = NULL, **nfences, **a_fences, **b_fences;
> -	int i = 0, i_a, i_b, num_fences, a_num_fences, b_num_fences;
>  
>  	sync_file = sync_file_alloc();
>  	if (!sync_file)
>  		return NULL;
>  
> -	a_fences = get_fences(a, &a_num_fences);
> -	b_fences = get_fences(b, &b_num_fences);
> -	if (a_num_fences > INT_MAX - b_num_fences)
> -		goto err;
> +	num_fences = 0;
> +	dma_fence_unwrap_for_each(a_fence, &a_iter, a->fence)
> +		++num_fences;
> +	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
> +		++num_fences;
>  
> -	num_fences = a_num_fences + b_num_fences;
> +	if (num_fences > INT_MAX)
> +		goto err_free_sync_file;
>  
>  	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>  	if (!fences)
> -		goto err;
> +		goto err_free_sync_file;
>  
>  	/*
> -	 * Assume sync_file a and b are both ordered and have no
> -	 * duplicates with the same context.
> +	 * We can't guarantee that fences in both a and b are ordered, but it is
> +	 * still quite likely.
>  	 *
> -	 * If a sync_file can only be created with sync_file_merge
> -	 * and sync_file_create, this is a reasonable assumption.
> +	 * So attempt to order the fences as we pass over them and merge fences
> +	 * with the same context.
>  	 */
> -	for (i_a = i_b = 0; i_a < a_num_fences && i_b < b_num_fences; ) {
> -		struct dma_fence *pt_a = a_fences[i_a];
> -		struct dma_fence *pt_b = b_fences[i_b];
>  
> -		if (pt_a->context < pt_b->context) {
> -			add_fence(fences, &i, pt_a);
> +	index = 0;
> +	for (a_fence = dma_fence_unwrap_first(a->fence, &a_iter),
> +	     b_fence = dma_fence_unwrap_first(b->fence, &b_iter);
> +	     a_fence || b_fence; ) {
> +
> +		if (!b_fence) {
> +			add_fence(fences, &index, a_fence);
> +			a_fence = dma_fence_unwrap_next(&a_iter);
> +
> +		} else if (!a_fence) {
> +			add_fence(fences, &index, b_fence);
> +			b_fence = dma_fence_unwrap_next(&b_iter);
> +
> +		} else if (a_fence->context < b_fence->context) {
> +			add_fence(fences, &index, a_fence);
> +			a_fence = dma_fence_unwrap_next(&a_iter);
>  
> -			i_a++;
> -		} else if (pt_a->context > pt_b->context) {
> -			add_fence(fences, &i, pt_b);
> +		} else if (b_fence->context < a_fence->context) {
> +			add_fence(fences, &index, b_fence);
> +			b_fence = dma_fence_unwrap_next(&b_iter);
> +
> +		} else if (__dma_fence_is_later(a_fence->seqno, b_fence->seqno,
> +						a_fence->ops)) {
> +			add_fence(fences, &index, a_fence);
> +			a_fence = dma_fence_unwrap_next(&a_iter);
> +			b_fence = dma_fence_unwrap_next(&b_iter);
>  
> -			i_b++;
>  		} else {
> -			if (__dma_fence_is_later(pt_a->seqno, pt_b->seqno,
> -						 pt_a->ops))
> -				add_fence(fences, &i, pt_a);
> -			else
> -				add_fence(fences, &i, pt_b);
> -
> -			i_a++;
> -			i_b++;
> +			add_fence(fences, &index, b_fence);
> +			a_fence = dma_fence_unwrap_next(&a_iter);
> +			b_fence = dma_fence_unwrap_next(&b_iter);
>  		}
>  	}
>  
> -	for (; i_a < a_num_fences; i_a++)
> -		add_fence(fences, &i, a_fences[i_a]);
> -
> -	for (; i_b < b_num_fences; i_b++)
> -		add_fence(fences, &i, b_fences[i_b]);
> -
> -	if (i == 0)
> -		fences[i++] = dma_fence_get(a_fences[0]);
> +	if (index == 0)
> +		add_fence(fences, &index, dma_fence_get_stub());
>  
> -	if (num_fences > i) {
> -		nfences = krealloc_array(fences, i, sizeof(*fences), GFP_KERNEL);
> -		if (!nfences)
> -			goto err;
> +	if (num_fences > index) {
> +		struct dma_fence **tmp;
>  
> -		fences = nfences;
> +		/* Keep going even when reducing the size failed */
> +		tmp = krealloc_array(fences, index, sizeof(*fences),
> +				     GFP_KERNEL);
> +		if (tmp)
> +			fences = tmp;
>  	}
>  
> -	if (sync_file_set_fence(sync_file, fences, i) < 0)
> -		goto err;
> +	if (sync_file_set_fence(sync_file, fences, index) < 0)
> +		goto err_put_fences;
>  
>  	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
>  	return sync_file;
>  
> -err:
> -	while (i)
> -		dma_fence_put(fences[--i]);
> +err_put_fences:
> +	while (index)
> +		dma_fence_put(fences[--index]);
>  	kfree(fences);
> +
> +err_free_sync_file:
>  	fput(sync_file->file);
>  	return NULL;
> -
>  }
>  
>  static int sync_file_release(struct inode *inode, struct file *file)
> @@ -398,11 +396,13 @@ static int sync_fill_fence_info(struct dma_fence *fence,
>  static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>  				       unsigned long arg)
>  {
> -	struct sync_file_info info;
>  	struct sync_fence_info *fence_info = NULL;
> -	struct dma_fence **fences;
> +	struct dma_fence_unwrap iter;
> +	struct sync_file_info info;
> +	unsigned int num_fences;
> +	struct dma_fence *fence;
> +	int ret;
>  	__u32 size;
> -	int num_fences, ret, i;
>  
>  	if (copy_from_user(&info, (void __user *)arg, sizeof(info)))
>  		return -EFAULT;
> @@ -410,7 +410,9 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>  	if (info.flags || info.pad)
>  		return -EINVAL;
>  
> -	fences = get_fences(sync_file, &num_fences);
> +	num_fences = 0;
> +	dma_fence_unwrap_for_each(fence, &iter, sync_file->fence)
> +		++num_fences;
>  
>  	/*
>  	 * Passing num_fences = 0 means that userspace doesn't want to
> @@ -433,8 +435,11 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>  	if (!fence_info)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < num_fences; i++) {
> -		int status = sync_fill_fence_info(fences[i], &fence_info[i]);
> +	num_fences = 0;
> +	dma_fence_unwrap_for_each(fence, &iter, sync_file->fence) {
> +		int status;
> +
> +		status = sync_fill_fence_info(fence, &fence_info[num_fences++]);
>  		info.status = info.status <= 0 ? info.status : status;
>  	}
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
