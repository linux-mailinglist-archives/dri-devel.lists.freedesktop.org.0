Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC1414C32
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21886E831;
	Wed, 22 Sep 2021 14:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBDF6E831;
 Wed, 22 Sep 2021 14:37:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="309161512"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="309161512"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 07:36:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="704043056"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 07:36:31 -0700
Subject: Re: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v4
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-2-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <093432d2-de8e-9684-03aa-7cb4842ea755@linux.intel.com>
Date: Wed, 22 Sep 2021 15:36:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922091044.2612-2-christian.koenig@amd.com>
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


On 22/09/2021 10:10, Christian König wrote:
> Abstract the complexity of iterating over all the fences
> in a dma_resv object.
> 
> The new loop handles the whole RCU and retry dance and
> returns only fences where we can be sure we grabbed the
> right one.
> 
> v2: fix accessing the shared fences while they might be freed,
>      improve kerneldoc, rename _cursor to _iter, add
>      dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end
> 
> v3: restructor the code, move rcu_read_lock()/unlock() into the
>      iterator, add dma_resv_iter_is_restarted()
> 
> v4: fix NULL deref when no explicit fence exists, drop superflous
>      rcu_read_lock()/unlock() calls.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 95 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   | 95 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 190 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 84fbe60629e3..7768140ab36d 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,6 +323,101 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>   }
>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>   
> +/**
> + * dma_resv_iter_restart_unlocked - restart the unlocked iterator
> + * @cursor: The dma_resv_iter object to restart
> + *
> + * Restart the unlocked iteration by initializing the cursor object.
> + */
> +static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
> +{
> +	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
> +	cursor->index = -1;
> +	if (cursor->all_fences)
> +		cursor->fences = dma_resv_shared_list(cursor->obj);
> +	else
> +		cursor->fences = NULL;
> +	cursor->is_restarted = true;
> +}
> +
> +/**
> + * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
> + * @cursor: cursor to record the current position
> + *
> + * Return all the fences in the dma_resv object which are not yet signaled.
> + * The returned fence has an extra local reference so will stay alive.
> + * If a concurrent modify is detected the whole iterration is started over again.

iteration

> + */
> +static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
> +{
> +	struct dma_resv *obj = cursor->obj;
> +
> +	do {
> +		/* Drop the reference from the previous round */
> +		dma_fence_put(cursor->fence);
> +
> +		if (cursor->index++ == -1) {
> +			cursor->fence = dma_resv_excl_fence(obj);
> +
> +		} else if (!cursor->fences ||
> +			   cursor->index >= cursor->fences->shared_count) {
> +			cursor->fence = NULL;
> +
> +		} else {
> +			struct dma_resv_list *fences = cursor->fences;
> +			unsigned int idx = cursor->index;
> +
> +			cursor->fence = rcu_dereference(fences->shared[idx]);
> +		}
> +		if (cursor->fence)
> +			cursor->fence = dma_fence_get_rcu(cursor->fence);
> +	} while (cursor->fence && dma_fence_is_signaled(cursor->fence));
> +}
> +
> +/**
> + * dma_resv_iter_first_unlocked - first fence in an unlocked dma_resv obj.
> + * @cursor: the cursor with the current position
> + *
> + * Returns the first fence from an unlocked dma_resv obj.
> + */
> +struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
> +{
> +	rcu_read_lock();
> +	do {
> +		dma_resv_iter_restart_unlocked(cursor);
> +		dma_resv_iter_walk_unlocked(cursor);
> +	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
> +	rcu_read_unlock();
> +
> +	return cursor->fence;
> +}
> +EXPORT_SYMBOL(dma_resv_iter_first_unlocked);

Why is this one split from dma_resv_iter_begin and even exported? I 
couldn't find any users in the series.

> +
> +/**
> + * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv obj.
> + * @cursor: the cursor with the current position
> + *
> + * Returns the next fence from an unlocked dma_resv obj.
> + */
> +struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
> +{
> +	bool restart;
> +
> +	rcu_read_lock();
> +	cursor->is_restarted = false;
> +	restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
> +	do {
> +		if (restart)
> +			dma_resv_iter_restart_unlocked(cursor);
> +		dma_resv_iter_walk_unlocked(cursor);
> +		restart = true;
> +	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
> +	rcu_read_unlock();
> +
> +	return cursor->fence;
> +}
> +EXPORT_SYMBOL(dma_resv_iter_next_unlocked);

Couldn't dma_resv_iter_first_unlocked and dma_resv_iter_next_unlocked 
share the same implementation? Especially if you are able to replace 
cursor->is_restarted with cursor->index == -1.

> +
>   /**
>    * dma_resv_copy_fences - Copy all fences from src to dst.
>    * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 9100dd3dc21f..baf77a542392 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -149,6 +149,101 @@ struct dma_resv {
>   	struct dma_resv_list __rcu *fence;
>   };
>   
> +/**
> + * struct dma_resv_iter - current position into the dma_resv fences
> + *
> + * Don't touch this directly in the driver, use the accessor function instead.
> + */
> +struct dma_resv_iter {
> +	/** @obj: The dma_resv object we iterate over */
> +	struct dma_resv *obj;
> +
> +	/** @all_fences: If all fences should be returned */
> +	bool all_fences;
> +
> +	/** @fence: the currently handled fence */
> +	struct dma_fence *fence;
> +
> +	/** @seq: sequence number to check for modifications */
> +	unsigned int seq;
> +
> +	/** @index: index into the shared fences */
> +	unsigned int index;
> +
> +	/** @fences: the shared fences */
> +	struct dma_resv_list *fences;
> +
> +	/** @is_restarted: true if this is the first returned fence */
> +	bool is_restarted;
> +};
> +
> +struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
> +
> +/**
> + * dma_resv_iter_begin - initialize a dma_resv_iter object
> + * @cursor: The dma_resv_iter object to initialize
> + * @obj: The dma_resv object which we want to iterator over

iterate

> + * @all_fences: If all fences should be returned or just the exclusive one
> + */
> +static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
> +				       struct dma_resv *obj,
> +				       bool all_fences)
> +{
> +	cursor->obj = obj;
> +	cursor->all_fences = all_fences;
> +	cursor->fence = NULL;
> +}
> +
> +/**
> + * dma_resv_iter_end - cleanup a dma_resv_iter object
> + * @cursor: the dma_resv_iter object which should be cleaned up
> + *
> + * Make sure that the reference to the fence in the cursor is properly
> + * dropped.
> + */
> +static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
> +{
> +	dma_fence_put(cursor->fence);
> +}
> +
> +/**
> + * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
> + * @cursor: the cursor of the current position
> + *
> + * Returns true if the currently returned fence is the exclusive one.
> + */
> +static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
> +{
> +	return cursor->index == -1;
> +}
> +
> +/**
> + * dma_resv_iter_is_restarted - test if this is the first fence after a restart
> + * @cursor: the cursor with the current position
> + *
> + * Return true if this is the first fence in an interation after a restart.

iteration

> + */
> +static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
> +{
> +	return cursor->is_restarted;
> +}
> +
> +/**
> + * dma_resv_for_each_fence_unlocked - unlocked fence iterator
> + * @cursor: a struct dma_resv_iter pointer
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object without holding the
> + * &dma_resv.lock and using RCU instead. The cursor needs to be initialized
> + * with dma_resv_iter_begin() and cleaned up with dma_resv_iter_end(). Inside
> + * the iterator a reference to the dma_fence is hold and the RCU lock dropped.

held

> + * When the dma_resv is modified the iteration starts over again.
> + */
> +#define dma_resv_for_each_fence_unlocked(cursor, fence)			\
> +	for (fence = dma_resv_iter_first_unlocked(cursor);		\
> +	     fence; fence = dma_resv_iter_next_unlocked(cursor))
> +
>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>   
> 

Regards,

Tvrtko
