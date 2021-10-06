Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B74239DD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 10:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1246ED0E;
	Wed,  6 Oct 2021 08:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C186ED16;
 Wed,  6 Oct 2021 08:40:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="312152283"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="312152283"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:40:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="484062092"
Received: from ccronin-mobl.ger.corp.intel.com (HELO [10.213.247.242])
 ([10.213.247.242])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:40:46 -0700
Subject: Re: [PATCH 02/28] dma-buf: add dma_resv_for_each_fence v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-3-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <fc9ac0dd-a069-7f34-d94d-ae6cd70d307f@linux.intel.com>
Date: Wed, 6 Oct 2021 09:40:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005113742.1101-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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


On 05/10/2021 12:37, Christian König wrote:
> A simpler version of the iterator to be used when the dma_resv object is
> locked.
> 
> v2: fix index check here as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 49 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   | 19 +++++++++++++++
>   2 files changed, 68 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 3cbcf66a137e..231bae173ef1 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -423,6 +423,55 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
>   }
>   EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>   
> +/**
> + * dma_resv_iter_first - first fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return all the fences in the dma_resv object while holding the
> + * &dma_resv.lock.
> + */
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
> +{
> +	struct dma_fence *fence;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->index = 0;
> +	cursor->fences = dma_resv_shared_list(cursor->obj);
> +
> +	fence = dma_resv_excl_fence(cursor->obj);
> +	if (!fence)
> +		fence = dma_resv_iter_next(cursor);

"Is restarted" probably does not matter hugely for the locked iterator 
but I think if it hits this path (no exclusive fence, returns first 
shared) then it will show it as false. Which is not consistent with the 
unlocked iterator.

Bonus points if you make a debug build assert that makes querying "is 
restarted" warn when used with the locked iterator.

> +
> +	cursor->is_restarted = true;
> +	return fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_first);
> +
> +/**
> + * dma_resv_iter_next - next fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return all the fences in the dma_resv object while holding the
> + * &dma_resv.lock.

You probably want to replace "all the fences" with first and next, 
respectively, in here and in dma_resv_iter_first kerneldoc.

> + */
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
> +{
> +	unsigned int idx;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->is_restarted = false;
> +	if (!cursor->all_fences || !cursor->fences ||
> +	    cursor->index >= cursor->fences->shared_count)
> +		return NULL;

Theoretically you could store the shared count in the cursor and so 
could have a single condition here (assuming initialized to zero when 
!all_fences and !cursor->fences). For some value of optimisation. :) 
Probably not worth it.

But you could only assign cursor->fences if all_fences, in 
dma_resv_iter_first, so wouldn't have to duplicate the all_fences check 
here.

> +
> +	idx = cursor->index++;
> +	return rcu_dereference_protected(cursor->fences->shared[idx],
> +					 dma_resv_held(cursor->obj));
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_next);
> +
>   /**
>    * dma_resv_copy_fences - Copy all fences from src to dst.
>    * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 764138ad8583..3df7ef23712d 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -179,6 +179,8 @@ struct dma_resv_iter {
>   
>   struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
>   struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
>   
>   /**
>    * dma_resv_iter_begin - initialize a dma_resv_iter object
> @@ -244,6 +246,23 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>   	for (fence = dma_resv_iter_first_unlocked(cursor);		\
>   	     fence; fence = dma_resv_iter_next_unlocked(cursor))
>   
> +/**
> + * dma_resv_for_each_fence - fence iterator
> + * @cursor: a struct dma_resv_iter pointer
> + * @obj: a dma_resv object pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object while holding the
> + * &dma_resv.lock. @all_fences controls if the shared fences are returned as
> + * well. The cursor initialisation is part of the iterator and the fence stays
> + * valid as long as the lock is held.

I'd be super cautious and explicitly spell out that reference is not 
held in contrast to the unlocked iterator.

> + */
> +#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
> +	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
> +	     fence = dma_resv_iter_first(cursor); fence;	\
> +	     fence = dma_resv_iter_next(cursor))
> +
>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>   
> 

Regards,

Tvrtko
