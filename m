Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2A69F29D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 11:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD8710E930;
	Wed, 22 Feb 2023 10:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA6410E2D6;
 Wed, 22 Feb 2023 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677061395; x=1708597395;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dVAnUDy/qeaH7ic3s2Fok+Gc1I+0bKwabb4CdLxWZeo=;
 b=WRYeYWMwd3X4f+QtiZ3GB5mQAtmkB3RqJN2WaRw3bLT9jgpGsO/NHvOi
 0TmW9rdvPdyHeTgq9nYPBd+vdWuxX8EXj2CqDzcUI5Pfzt1TSzE9j5Oj0
 v/g03qMC7uks2rgSB4OrjFTjKGhhjCs09E3Rr817pwBEV3OWCcu/AEQs8
 yvSj5zx5+S1tW+capkQpBv65Zx2eKjZgkXOSsZCRswjM3b7oVHzDTFxiF
 5gc1nc7AFPrWrTLGZ/Sz5eBCAOBRfhvup5/NdKSqEbOgkekiDr9gMq2M6
 ZvoGKVtGOA4Q48K8DEmGjovco6b0yMoPXKFlmMYTCOeVofK0ZjfzrZ12m w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330614956"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="330614956"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 02:23:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814881408"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="814881408"
Received: from hhammad-mobl1.ger.corp.intel.com (HELO [10.213.231.87])
 ([10.213.231.87])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 02:23:11 -0800
Message-ID: <b65a2fe2-6f68-2116-9599-2940e66d166b@linux.intel.com>
Date: Wed, 22 Feb 2023 10:23:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 01/14] dma-buf/dma-fence: Add deadline awareness
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-2-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230218211608.1630586-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2023 21:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a way to hint to the fence signaler of an upcoming deadline, such as
> vblank, which the fence waiter would prefer not to miss.  This is to aid
> the fence signaler in making power management decisions, like boosting
> frequency as the deadline approaches and awareness of missing deadlines
> so that can be factored in to the frequency scaling.
> 
> v2: Drop dma_fence::deadline and related logic to filter duplicate
>      deadlines, to avoid increasing dma_fence size.  The fence-context
>      implementation will need similar logic to track deadlines of all
>      the fences on the same timeline.  [ckoenig]
> v3: Clarify locking wrt. set_deadline callback
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
>   include/linux/dma-fence.h   | 20 ++++++++++++++++++++
>   2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 0de0482cd36e..763b32627684 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -912,6 +912,26 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>   }
>   EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>   
> +
> +/**
> + * dma_fence_set_deadline - set desired fence-wait deadline
> + * @fence:    the fence that is to be waited on
> + * @deadline: the time by which the waiter hopes for the fence to be
> + *            signaled
> + *
> + * Inform the fence signaler of an upcoming deadline, such as vblank, by
> + * which point the waiter would prefer the fence to be signaled by.  This
> + * is intended to give feedback to the fence signaler to aid in power
> + * management decisions, such as boosting GPU frequency if a periodic
> + * vblank deadline is approaching.
> + */
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> +		fence->ops->set_deadline(fence, deadline);
> +}
> +EXPORT_SYMBOL(dma_fence_set_deadline);
> +
>   /**
>    * dma_fence_describe - Dump fence describtion into seq_file
>    * @fence: the 6fence to describe
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..d77f6591c453 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,

Would this bit be better left out from core implementation, given how 
the approach is the component which implements dma-fence has to track 
the actual deadline and all?

Also taking a step back - are we all okay with starting to expand the 
relatively simple core synchronisation primitive with side channel data 
like this? What would be the criteria for what side channel data would 
be acceptable? Taking note the thing lives outside drivers/gpu/.

Regards,

Tvrtko

>   	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>   };
>   
> @@ -257,6 +258,23 @@ struct dma_fence_ops {
>   	 */
>   	void (*timeline_value_str)(struct dma_fence *fence,
>   				   char *str, int size);
> +
> +	/**
> +	 * @set_deadline:
> +	 *
> +	 * Callback to allow a fence waiter to inform the fence signaler of
> +	 * an upcoming deadline, such as vblank, by which point the waiter
> +	 * would prefer the fence to be signaled by.  This is intended to
> +	 * give feedback to the fence signaler to aid in power management
> +	 * decisions, such as boosting GPU frequency.
> +	 *
> +	 * This is called without &dma_fence.lock held, it can be called
> +	 * multiple times and from any context.  Locking is up to the callee
> +	 * if it has some state to manage.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>   };
>   
>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> @@ -583,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   	return ret < 0 ? ret : 0;
>   }
>   
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
> +
>   struct dma_fence *dma_fence_get_stub(void);
>   struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);
