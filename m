Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B14E99D1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C933B10E29A;
	Mon, 28 Mar 2022 14:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF64C10E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:36:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so19593077wrc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=v/hbcKwqx1gvBKjVXl56S5be+OnNXrcnFIQY2VQf+GQ=;
 b=P3s83mzPAy1oHFyyIJNDomqrIFEN+HTK2X/xxvM6jHZRRhY1ia7LMcyS1CUq2WRLIt
 5SoYJ0xl/ZAWRBo9MGjmVgpPNSAyN2Cue489qnIcE9rOOsVfG8KpauNpaa5c3+CHpQSK
 gw9dIkAY9rZoEPI7OMXBY9dnJLfptFfKQMVcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=v/hbcKwqx1gvBKjVXl56S5be+OnNXrcnFIQY2VQf+GQ=;
 b=XacCfsvE5/9kiv7ygsu4hAVREUEeoyIioliphCtxQPklxRCpeyPrbfshp8JoHA7W6r
 mVyLBfgUOk+JRP5vNJ+U4ZdQmGGNus+myr+GF6U7UIj+jLDNks9G41m7r9WvIXTV9LLJ
 zt0bW0+j90vcVaRNAdU+GPk6/+rGMaV2HYHQVvl6tTLx1sDh/O4ChLPojoNn/GgcQVuo
 0U6+kPOTKho8npu/QkUwo4qjOu5XLNSiaY7ZMFYt6PMfw/nHgx8mL6NW1doVDO6aunT0
 xq97eZjoSV127JgUvOt1FtdKwBLenTc99S09645YCNk1Poin5RSShmoGvWlfnjMbSwG5
 VSPA==
X-Gm-Message-State: AOAM531AfTbAexz15ifOwxKi/oEwieo7tOhxgCeIDSu3jjV5hm85qhJw
 6OsxkrqgHzAQuZWrv6EOmKW2LQ==
X-Google-Smtp-Source: ABdhPJy2uVCV4k6lowv1jCTyfpTR0BZIIfD37/lbvSmV0qb6ifIlu4g+nMA4zLZtNKGFclvcpohivw==
X-Received: by 2002:a5d:6d8a:0:b0:204:909:2d9a with SMTP id
 l10-20020a5d6d8a000000b0020409092d9amr25002730wrs.435.1648478210133; 
 Mon, 28 Mar 2022 07:36:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0038b7c4c0803sm16778890wms.30.2022.03.28.07.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:36:49 -0700 (PDT)
Date: Mon, 28 Mar 2022 16:36:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v4 4/8] dmabuf: heaps: export system_heap buffers with GPU
 cgroup charging
Message-ID: <YkHH/0Use7F30UUE@phenom.ffwll.local>
Mail-Followup-To: "T.J. Mercier" <tjmercier@google.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>,
 kaleshsingh@google.com, Kenny.Ho@amd.com, mkoutny@suse.com,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-5-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220328035951.1817417-5-tjmercier@google.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 Tejun Heo <tj@kernel.org>, skhan@linuxfoundation.org, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, mkoutny@suse.com,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 03:59:43AM +0000, T.J. Mercier wrote:
> From: Hridya Valsaraju <hridya@google.com>
> 
> All DMA heaps now register a new GPU cgroup device upon creation, and the
> system_heap now exports buffers associated with its GPU cgroup device for
> tracking purposes.
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> 
> ---
> v3 changes
> Use more common dual author commit message format per John Stultz.
> 
> v2 changes
> Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> heap to a single dma-buf function for all heaps per Daniel Vetter and
> Christian König.

Apologies for being out of the loop quite a bit. I scrolled through this
all and I think it looks good to get going.

The only thing I have is whether we should move the cgroup controllers out
of dma-buf heaps, since that's rather android centric. E.g.
- a system gpucg_device which is used by all the various single page
  allocators (dma-buf heap but also shmem helpers and really anything
  else)
- same for cma, again both for dma-buf heaps and also for the gem cma
  helpers in drm

Otherwise this will only work on non-upstream android where gpu drivers
allocate everything from dma-buf heap. If you use something like the x86
android project with mesa drivers, then driver-internal buffers will be
allocated through gem and not through dma-buf heaps. Or at least I think
that's how it works.

But also meh, we can fix this fairly easily later on by adding these
standard gpucg_dev somwehere with a bit of kerneldoc.

Anyway has my all my ack, but don't count this as my in-depth review :-)
-Daniel

> ---
>  drivers/dma-buf/dma-heap.c          | 27 +++++++++++++++++++++++++++
>  drivers/dma-buf/heaps/system_heap.c |  3 +++
>  include/linux/dma-heap.h            | 11 +++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 8f5848aa144f..885072427775 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/cdev.h>
> +#include <linux/cgroup_gpu.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/dma-buf.h>
> @@ -31,6 +32,7 @@
>   * @heap_devt		heap device node
>   * @list		list head connecting to list of heaps
>   * @heap_cdev		heap char device
> + * @gpucg_dev		gpu cgroup device for memory accounting
>   *
>   * Represents a heap of memory from which buffers can be made.
>   */
> @@ -41,6 +43,9 @@ struct dma_heap {
>  	dev_t heap_devt;
>  	struct list_head list;
>  	struct cdev heap_cdev;
> +#ifdef CONFIG_CGROUP_GPU
> +	struct gpucg_device gpucg_dev;
> +#endif
>  };
>  
>  static LIST_HEAD(heap_list);
> @@ -216,6 +221,26 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>  	return heap->name;
>  }
>  
> +#ifdef CONFIG_CGROUP_GPU
> +/**
> + * dma_heap_get_gpucg_dev() - get struct gpucg_device for the heap.
> + * @heap: DMA-Heap to get the gpucg_device struct for.
> + *
> + * Returns:
> + * The gpucg_device struct for the heap. NULL if the GPU cgroup controller is
> + * not enabled.
> + */
> +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
> +{
> +	return &heap->gpucg_dev;
> +}
> +#else /* CONFIG_CGROUP_GPU */
> +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
> +{
> +	return NULL;
> +}
> +#endif /* CONFIG_CGROUP_GPU */
> +
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  {
>  	struct dma_heap *heap, *h, *err_ret;
> @@ -288,6 +313,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	list_add(&heap->list, &heap_list);
>  	mutex_unlock(&heap_list_lock);
>  
> +	gpucg_register_device(dma_heap_get_gpucg_dev(heap), exp_info->name);
> +
>  	return heap;
>  
>  err2:
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index ab7fd896d2c4..752a05c3cfe2 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -395,6 +395,9 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	exp_info.ops = &system_heap_buf_ops;
>  	exp_info.size = buffer->len;
>  	exp_info.flags = fd_flags;
> +#ifdef CONFIG_CGROUP_GPU
> +	exp_info.gpucg_dev = dma_heap_get_gpucg_dev(heap);
> +#endif
>  	exp_info.priv = buffer;
>  	dmabuf = dma_buf_export(&exp_info);
>  	if (IS_ERR(dmabuf)) {
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 0c05561cad6e..e447a61d054e 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -10,6 +10,7 @@
>  #define _DMA_HEAPS_H
>  
>  #include <linux/cdev.h>
> +#include <linux/cgroup_gpu.h>
>  #include <linux/types.h>
>  
>  struct dma_heap;
> @@ -59,6 +60,16 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
>   */
>  const char *dma_heap_get_name(struct dma_heap *heap);
>  
> +/**
> + * dma_heap_get_gpucg_dev() - get a pointer to the struct gpucg_device for the
> + * heap.
> + * @heap: DMA-Heap to retrieve gpucg_device for.
> + *
> + * Returns:
> + * The gpucg_device struct for the heap.
> + */
> +struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap);
> +
>  /**
>   * dma_heap_add - adds a heap to dmabuf heaps
>   * @exp_info:		information needed to register this heap
> -- 
> 2.35.1.1021.g381101b075-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
