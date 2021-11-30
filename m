Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1E46345D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 13:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328BA6E4C5;
	Tue, 30 Nov 2021 12:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7856E4C5;
 Tue, 30 Nov 2021 12:34:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="299598667"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="299598667"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:32:51 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="595368207"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.206])
 ([10.249.254.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:32:47 -0800
Message-ID: <edffb310-942a-ab1c-0bb1-7996649ec96e@linux.intel.com>
Date: Tue, 30 Nov 2021 13:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 1/2] dma-fence: Avoid establishing a locking order
 between fence classes
Content-Language: en-US
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/30/21 13:19, Thomas Hellström wrote:
> The locking order for taking two fence locks is implicitly defined in
> at least two ways in the code:
>
> 1) Fence containers first and other fences next, which is defined by
> the enable_signaling() callbacks of dma_fence_chain and
> dma_fence_array.
> 2) Reverse signal order, which is used by __i915_active_fence_set().
>
> Now 1) implies 2), except for the signal_on_any mode of dma_fence_array
> and 2) does not imply 1), and also 1) makes locking order between
> different containers confusing.
>
> Establish 2) and fix up the signal_on_any mode by calling
> enable_signaling() on such fences unlocked at creation.
>
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 13 +++--
>   drivers/dma-buf/dma-fence-chain.c |  3 +-
>   drivers/dma-buf/dma-fence.c       | 79 +++++++++++++++++++++----------
>   include/linux/dma-fence.h         |  3 ++
>   4 files changed, 69 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 3e07f961e2f3..0322b92909fe 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -84,8 +84,8 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   		 * insufficient).
>   		 */
>   		dma_fence_get(&array->base);
> -		if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
> -					   dma_fence_array_cb_func)) {
> +		if (dma_fence_add_callback_nested(array->fences[i], &cb[i].cb,
> +						  dma_fence_array_cb_func)) {
>   			int error = array->fences[i]->error;
>   
>   			dma_fence_array_set_pending_error(array, error);
> @@ -158,6 +158,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   {
>   	struct dma_fence_array *array;
>   	size_t size = sizeof(*array);
> +	struct dma_fence *fence;
>   
>   	/* Allocate the callback structures behind the array. */
>   	size += num_fences * sizeof(struct dma_fence_array_cb);
> @@ -165,8 +166,9 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   	if (!array)
>   		return NULL;
>   
> +	fence = &array->base;
>   	spin_lock_init(&array->lock);
> -	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
> +	dma_fence_init(fence, &dma_fence_array_ops, &array->lock,
>   		       context, seqno);
>   	init_irq_work(&array->work, irq_dma_fence_array_work);
>   
> @@ -174,7 +176,10 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>   	array->fences = fences;
>   
> -	array->base.error = PENDING_ERROR;
> +	fence->error = PENDING_ERROR;
> +
> +	if (signal_on_any)
> +		dma_fence_enable_sw_signaling(fence);

Oh, this looks strange. Was meant to call the 
dma_fence_array_enable_signaling() without the lock held here.

/Thomas


