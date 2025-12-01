Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC6C98170
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAEB10E418;
	Mon,  1 Dec 2025 15:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D9A210E418
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:46:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F52C153B;
 Mon,  1 Dec 2025 07:46:39 -0800 (PST)
Received: from [10.57.76.143] (unknown [10.57.76.143])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26CD63F66E;
 Mon,  1 Dec 2025 07:46:44 -0800 (PST)
Message-ID: <1d9cef1f-3b51-42a9-b1e8-794d67f8e328@arm.com>
Date: Mon, 1 Dec 2025 15:46:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251125104443.82974-2-phasta@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251125104443.82974-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 25/11/2025 10:44, Philipp Stanner wrote:
> The dma_fence framework checks at many places whether the signaled bit
> of a fence is already set. The code can be simplified and made more
> readable by providing a helper function for that.
> 
> Add __dma_fence_is_signaled(), which _only_ checks whether a fence is
> signaled. Use it internally.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/dma-buf/dma-fence.c | 19 +++++++++----------
>  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
>  2 files changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39e6f93dc310..3a48896ded62 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	lockdep_assert_held(fence->lock);
>  
> -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				      &fence->flags)))
> +	if (unlikely(__dma_fence_is_signaled(fence)))

Here you are replacing test_and_set_bit(), but the helper just does
test_bit() - so this is changing the behaviour (and I suspect is wrong).

Thanks,
Steve

>  		return -EINVAL;
>  
>  	/* Stash the cb_list before replacing it with the timestamp */
> @@ -545,7 +544,7 @@ void dma_fence_release(struct kref *kref)
>  	trace_dma_fence_destroy(fence);
>  
>  	if (!list_empty(&fence->cb_list) &&
> -	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	    !__dma_fence_is_signaled(fence)) {
>  		const char __rcu *timeline;
>  		const char __rcu *driver;
>  		unsigned long flags;
> @@ -602,7 +601,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  				   &fence->flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		return false;
>  
>  	if (!was_set && fence->ops->enable_signaling) {
> @@ -666,7 +665,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>  	if (WARN_ON(!fence || !func))
>  		return -EINVAL;
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	if (__dma_fence_is_signaled(fence)) {
>  		INIT_LIST_HEAD(&cb->node);
>  		return -ENOENT;
>  	}
> @@ -783,7 +782,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  
>  	spin_lock_irqsave(fence->lock, flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		goto out;
>  
>  	if (intr && signal_pending(current)) {
> @@ -800,7 +799,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  	cb.task = current;
>  	list_add(&cb.base.node, &fence->cb_list);
>  
> -	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
> +	while (!__dma_fence_is_signaled(fence) && ret > 0) {
>  		if (intr)
>  			__set_current_state(TASK_INTERRUPTIBLE);
>  		else
> @@ -832,7 +831,7 @@ dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
>  
>  	for (i = 0; i < count; ++i) {
>  		struct dma_fence *fence = fences[i];
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +		if (__dma_fence_is_signaled(fence)) {
>  			if (idx)
>  				*idx = i;
>  			return true;
> @@ -1108,7 +1107,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!__dma_fence_is_signaled(fence))
>  		return fence->ops->get_driver_name(fence);
>  	else
>  		return "detached-driver";
> @@ -1140,7 +1139,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!__dma_fence_is_signaled(fence))
>  		return fence->ops->get_timeline_name(fence);
>  	else
>  		return "signaled-timeline";
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..d32bf1b5b07d 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -401,6 +401,26 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  
> +/*
> + * __dma_fence_is_signaled - Only check whether a fence is signaled yet.
> + * @fence: the fence to check
> + *
> + * This function just checks whether @fence is signaled, without interacting
> + * with the fence in any way. The user must, therefore, ensure through other
> + * means that fences get signaled eventually.
> + *
> + * This function uses test_bit(), which is thread-safe. Naturally, this function
> + * should be used opportunistically; a fence could get signaled at any moment
> + * after the check is done.
> + *
> + * Return: true if signaled, false otherwise.
> + */
> +static inline bool
> +__dma_fence_is_signaled(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +}
> +
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
>   *                                is signaled yet.
> @@ -418,7 +438,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  static inline bool
>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> @@ -448,7 +468,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>  static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {

