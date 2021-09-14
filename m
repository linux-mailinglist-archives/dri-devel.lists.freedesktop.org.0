Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A240B187
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 16:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFFD89801;
	Tue, 14 Sep 2021 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DDB6E4B5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 14:41:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so2108354wmh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=44j017qD3sUDo3v3Jo63n0OvsjOcxTN9grfRhyGvreo=;
 b=HvWzPlJ1lNiH+I7cbNqS0esV1/j0ZwK78Ktpb3GeDil49CJcwbyVhzodCKBR8uRMoU
 zNvfaCDw8xNMZpyRZgbtbS2CrInpJehbCQwu1g3WCys1zgRcb8uhg2COMtT2yjJ2d2E7
 jB3JpHluwd17nboNza8CsLcKcHEuSrw2zmBgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=44j017qD3sUDo3v3Jo63n0OvsjOcxTN9grfRhyGvreo=;
 b=srD41wp0BAVh2+RRikL0NjJHVTKrePEhEbZLtI5JS7tzZ4FyCASr4CP2W3hGiKQksN
 186elRicYs4/jKEzhQRxKp4WOOAnzHuk0r3erstN7DM1abRezTIW9U/hutrkiuxk8BSL
 8zgm+gRhjZLnlDGx03CX3lUZudUBbidU2SKKo7AwR6A9KKGTtFI2SRrqB/rvnGx6RmFQ
 F77+cNMa6+uASj3BCm+5x9Ko4um9LVsj0duPpGUVJnAD9Wu9Kx1n6gWxlK8RJhgarNrJ
 YNSglPIyU2QjJ970tI7796YkP73YVWkZi2wfHJs3P0P7a4o9vdcn9UOyTQz6QmD2tUpK
 rKmQ==
X-Gm-Message-State: AOAM530Ew+TIHyOLSw3RxhoSZBwtLyHo+8hlNXsgt0ss/a79pDosC+Ck
 Yz4G+vvQw1sBWipAr8N/8fPm8A==
X-Google-Smtp-Source: ABdhPJxw1kPlQ2bQvByKn4Sck2jBa2ebdBzN32JWQDR+zIYLil9m7A+7RB/VuEJGHiGAIWJDxeop5w==
X-Received: by 2002:a1c:a913:: with SMTP id s19mr2597567wme.26.1631630470926; 
 Tue, 14 Sep 2021 07:41:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f25sm1315356wml.38.2021.09.14.07.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:41:10 -0700 (PDT)
Date: Tue, 14 Sep 2021 16:41:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, daniel@ffwll.ch
Subject: Re: [PATCH 01/14] dma-buf: add dma_resv_for_each_fence_unlocked
Message-ID: <YUC0hPE7gx7E+tEx@phenom.ffwll.local>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
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

On Fri, Sep 10, 2021 at 10:26:42AM +0200, Christian König wrote:
> Abstract the complexity of iterating over all the fences
> in a dma_resv object.
> 
> The new loop handles the whole RCU and retry dance and
> returns only fences where we can be sure we grabbed the
> right one.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Bigger picture discussion, picking up from the discussion about maybe
removing rcu for fence protections entirely.

Iirc the main hold-up was that in ttm delayed restore we really want to
take a snapshot of all the fences, even if we can't get at the
dma_resv_lock. I was wondering whether we can't solve this problem
different with something like that:

- demidlayer delayed destroy a bit, ttm core would only guarantee that
  dma_resv_lock is called already (so we don't ahve to handle the delayed
  destroy internally), then call into drivers

- drivers would iterate over the fences currently attached to dma_resv,
  maybe with a deep iterator thing that walks through chain/array fences
  too. The driver then filters out all fences which aren't his own
  pertainined to the device. Driver can do that with the usual ops
  upcasting trickery, ttm cannot do that.

- driver then stuffs all these fences into the local dma_resv, so that we
  have an unshared dma_resv fence list with only the fences that matters,
  and nothing that was added meanwhile

- driver calls the exported ttm function to clean up the mess with the
  unshared dma_resv

Would this work?

I'm simply trying to figure out whether we have any option to get rid of
all this rcu trickery. At least from all the places where we really don't
need it ...

Meanwhile I'll try and do at least a bit of high-level review for your
series here.
-Daniel

> ---
>  drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 84fbe60629e3..213a9b7251ca 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
>  
> +/**
> + * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
> + * @obj: the dma_resv object
> + * @cursor: cursor to record the current position
> + * @all_fences: true returns also the shared fences
> + * @first: if we should start over
> + *
> + * Return all the fences in the dma_resv object which are not yet signaled.
> + * The returned fence has an extra local reference so will stay alive.
> + * If a concurrent modify is detected the whole iterator is started over again.
> + */
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_cursor *cursor,
> +					 bool all_fences, bool first)
> +{
> +	struct dma_fence *fence = NULL;
> +
> +	do {
> +		/* Drop the reference from the previous round */
> +		dma_fence_put(fence);
> +
> +		cursor->is_first = first;
> +		if (first) {
> +			cursor->seq = read_seqcount_begin(&obj->seq);
> +			cursor->index = -1;
> +			cursor->fences = dma_resv_shared_list(obj);
> +			cursor->is_exclusive = true;
> +
> +			fence = dma_resv_excl_fence(obj);
> +			if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +					      &fence->flags))
> +				fence = NULL;
> +		} else {
> +			fence = NULL;
> +		}
> +
> +		if (fence) {
> +			fence = dma_fence_get_rcu(fence);
> +		} else if (all_fences && cursor->fences) {
> +			struct dma_resv_list *fences = cursor->fences;
> +
> +			cursor->is_exclusive = false;
> +			while (++cursor->index < fences->shared_count) {
> +				fence = rcu_dereference(fences->shared[
> +							cursor->index]);
> +				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +					      &fence->flags))
> +					break;
> +			}
> +			if (cursor->index < fences->shared_count)
> +				fence = dma_fence_get_rcu(fence);
> +			else
> +				fence = NULL;
> +		}
> +
> +		/* For the eventually next round */
> +		first = true;
> +	} while (read_seqcount_retry(&obj->seq, cursor->seq));
> +
> +	return fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
> +
>  /**
>   * dma_resv_copy_fences - Copy all fences from src to dst.
>   * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 9100dd3dc21f..f5b91c292ee0 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -149,6 +149,39 @@ struct dma_resv {
>  	struct dma_resv_list __rcu *fence;
>  };
>  
> +/**
> + * struct dma_resv_cursor - current position into the dma_resv fences
> + * @seq: sequence number to check
> + * @index: index into the shared fences
> + * @shared: the shared fences
> + * @is_first: true if this is the first returned fence
> + * @is_exclusive: if the current fence is the exclusive one
> + */
> +struct dma_resv_cursor {
> +	unsigned int seq;
> +	unsigned int index;
> +	struct dma_resv_list *fences;
> +	bool is_first;
> +	bool is_exclusive;
> +};
> +
> +/**
> + * dma_resv_for_each_fence_unlocked - fence iterator
> + * @obj: a dma_resv object pointer
> + * @cursor: a struct dma_resv_cursor pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object without holding the
> + * dma_resv::lock. The RCU read side lock must be hold when using this, but can
> + * be dropped and re-taken as necessary inside the loop. @all_fences controls
> + * if the shared fences are returned as well.
> + */
> +#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
> +	for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
> +	     fence; dma_fence_put(fence),				    \
> +	     fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
> +
>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>  
> @@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> +struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
> +					 struct dma_resv_cursor *cursor,
> +					 bool first, bool all_fences);
>  int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>  			unsigned *pshared_count, struct dma_fence ***pshared);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
