Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613A47D8A5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E37A10E2B8;
	Wed, 22 Dec 2021 21:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B708010E2B8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:21:15 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id bm14so13542636edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UOyNk6zHot8QJ2cJj1ziXQ3UAlzgLdXMmKFvUQzRJ6s=;
 b=I1ZLCqeUseVSQW/GgASZaPFuH/1JrRTu7shw7XShZKIhdJmmDlR3gDxh0fdD9uquQR
 x64PtNAVCHc5jM8/4w3rSqLFuZYuc22woVMM6VaUBU1Ung2cQ5+FtLY7w+fDIesoC5gA
 dwuGiruGn33XTKgqhWzf7T4mErCD0n3vpPW6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UOyNk6zHot8QJ2cJj1ziXQ3UAlzgLdXMmKFvUQzRJ6s=;
 b=yUBeVpEjSRoUSOC3RlNWb3MIXOTk5Wq3nHPIk/8378W10JJdEYQY1y1fzhlj9+4IJa
 eBLPlZ46xybf+89G1eQ22A058PLESECdl82G3psibrC5eSU9gky1nU+3xmEvdxD7Xqp1
 SMcSeEBM3cyuWVbuYVlDCDznrgV0nXnZjxUVYy6vrVRDv5yXqbhsniKjwoLxkpzoWaPu
 ayKQKB74pmucOsikS9re5N2K43Vrl4yv56O2HItY46mxEO8hx1g97sMX32YueibRu1BM
 J+ccmoY7SwQq/eZ8pVz1Vrfl9GYqQ9k5qHR6NhpuNWAFPyIX+shTHFoIlZiOOmnlN/sZ
 pxow==
X-Gm-Message-State: AOAM530N3/DOaj1wd29ptXlaRNKTJFWlFtpA6BLflTmuOBco33UIwLKW
 +oW7PNCuoGS3TLO5djU0Y2+Zvw==
X-Google-Smtp-Source: ABdhPJyIVxXQ4Ca2/Cnk62TAAxp7H1zzuGUjDQtNGiMuNW3/Ir6dsDSolAiY+ly2PBzTCNa4kdfmRQ==
X-Received: by 2002:a05:6402:1914:: with SMTP id
 e20mr4559319edz.96.1640208074237; 
 Wed, 22 Dec 2021 13:21:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hq9sm1063167ejc.57.2021.12.22.13.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:21:13 -0800 (PST)
Date: Wed, 22 Dec 2021 22:21:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 04/24] dma-buf: add dma_resv_get_singleton v2
Message-ID: <YcOWyHzY22ZCCvef@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-5-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:33:51PM +0100, Christian König wrote:
> Add a function to simplify getting a single fence for all the fences in
> the dma_resv object.
> 
> v2: fix ref leak in error handling
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   |  2 ++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 480c305554a1..694716a3d66d 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -34,6 +34,7 @@
>   */
>  
>  #include <linux/dma-resv.h>
> +#include <linux/dma-fence-array.h>
>  #include <linux/export.h>
>  #include <linux/mm.h>
>  #include <linux/sched/mm.h>
> @@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>  
> +/**
> + * dma_resv_get_singleton - Get a single fence for all the fences
> + * @obj: the reservation object
> + * @write: true if we should return all fences
> + * @fence: the resulting fence
> + *
> + * Get a single fence representing all the fences inside the resv object.
> + * Returns either 0 for success or -ENOMEM.
> + *
> + * Warning: This can't be used like this when adding the fence back to the resv
> + * object since that can lead to stack corruption when finalizing the
> + * dma_fence_array.

Uh I don't get this one? I thought the only problem with nested fences is
the signalling recursion, which we work around with the irq_work?

Also if there's really an issue with dma_fence_array fences, then that
warning should be on the dma_resv kerneldoc, not somewhere hidden like
this. And finally I really don't see what can go wrong, sure we'll end up
with the same fence once in the dma_resv_list and then once more in the
fence array. But they're all refcounted, so really shouldn't matter.

The code itself looks correct, but me not understanding what even goes
wrong here freaks me out a bit.

I guess something to figure out next year, I kinda hoped I could squeeze a
review in before I disappear :-/
-Daniel

> + */
> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +			   struct dma_fence **fence)
> +{
> +	struct dma_fence_array *array;
> +	struct dma_fence **fences;
> +	unsigned count;
> +	int r;
> +
> +	r = dma_resv_get_fences(obj, write, &count, &fences);
> +        if (r)
> +		return r;
> +
> +	if (count == 0) {
> +		*fence = NULL;
> +		return 0;
> +	}
> +
> +	if (count == 1) {
> +		*fence = fences[0];
> +		kfree(fences);
> +		return 0;
> +	}
> +
> +	array = dma_fence_array_create(count, fences,
> +				       dma_fence_context_alloc(1),
> +				       1, false);
> +	if (!array) {
> +		while (count--)
> +			dma_fence_put(fences[count]);
> +		kfree(fences);
> +		return -ENOMEM;
> +	}
> +
> +	*fence = &array->base;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
> +
>  /**
>   * dma_resv_wait_timeout - Wait on reservation's objects
>   * shared and/or exclusive fences.
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index fa2002939b19..cdfbbda6f600 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>  int dma_resv_get_fences(struct dma_resv *obj, bool write,
>  			unsigned int *num_fences, struct dma_fence ***fences);
> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +			   struct dma_fence **fence);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>  long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>  			   unsigned long timeout);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
