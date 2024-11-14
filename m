Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616279C84D7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79410E23B;
	Thu, 14 Nov 2024 08:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qHR7w8Ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22810E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HY0wTbfLqbt1prUJgc8Ei5eGy41sdcUTaZrFhJqJZtM=; b=qHR7w8PhMrVObiYhlr+7IoFLv7
 7tNp3kYWNsdpJAYhWiCbthKz/nhCiMb+iJIrBWh57zj5kKvkzhGb6On9SU73kFm8eZs++poUicO/w
 FNuSQQ3L/eA/sYv8OI5JygTpmCxIyfQyxkqrD/TcHmSLi6aovaplyJX6epu1BSH/CnudIVQ5zq+/M
 IKXxPvFKk0iMo1hDONsqYHIPuuOjzBf599cjkaL2PYSYio51vilJDkbUPfsP4dDL4jtJ6m5BBCYkY
 GGtQCWYSnio4OEoZFOJjrnzhcSpOY7z81Z6ZFGaWGMdli5q3GCJ3Ii6LDiFwPbz9PRtPIkIs1ucYv
 DfnN1dTw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tBVDo-006iRn-9J; Thu, 14 Nov 2024 09:29:00 +0100
Message-ID: <f2b68c80-65e0-431d-b355-aa7b439d229b@igalia.com>
Date: Thu, 14 Nov 2024 08:28:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/2] dma-fence: Use kernel's sort for merging fences
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Friedrich Vock <friedrich.vock@gmx.de>
References: <20241113171947.57446-1-tursulin@igalia.com>
 <20241113171947.57446-2-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241113171947.57446-2-tursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/11/2024 17:19, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> One alternative to the fix Christian proposed in
> https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/
> is to replace the rather complex open coded sorting loops with the kernel
> standard sort followed by a context squashing pass.
> 
> Proposed advantage of this would be readability but one concern Christian
> raised was that there could be many fences, that they are typically mostly
> sorted, and so the kernel's heap sort would be much worse by the proposed
> algorithm.
> 
> I had a look running some games and vkcube to see what are the typical
> number of input fences. Tested scenarios:
> 
> 1) Hogwarts Legacy under Gamescope
> 
> 450 calls per second to __dma_fence_unwrap_merge.
> 
> Percentages per number of fences buckets, before and after checking for
> signalled status, sorting and flattening:
> 
>     N       Before      After
>     0       0.91%
>     1      69.40%
>    2-3     28.72%       9.4%  (90.6% resolved to one fence)
>    4-5      0.93%
>    6-9      0.03%
>    10+
> 
> 2) Cyberpunk 2077 under Gamescope
> 
> 1050 calls per second, amounting to 0.01% CPU time according to perf top.

This was undercounted, 1050/s is actually only for when two or more 
fences are in the input array. Therefore the number of "raw" calls is 
much higher, around 2x more according to these percentages, or even more 
for Hogwarths. Which I guess strengthens the argument for the single 
fence fast path from the previous patch.

>     N       Before      After
>     0       1.13%
>     1      52.30%
>    2-3     40.34%       55.57%
>    4-5      1.46%        0.50%
>    6-9      2.44%
>    10+      2.34%
> 
> 3) vkcube under Plasma
> 
> 90 calls per second.
> 
>     N       Before      After
>     0
>     1
>    2-3      100%         0%   (Ie. all resolved to a single fence)
>    4-5
>    6-9
>    10+
> 
> In the case of vkcube all invocations in the 2-3 bucket were actually
> just two input fences.
> 
>  From these numbers it looks like the heap sort should not be a
> disadvantage, given how the dominant case is <= 2 input fences which heap
> sort solves with just one compare and swap. (And for the case of one input
> fence we have a fast path in the previous patch.)
> 
> A complementary possibility is to implement a different sorting algorithm
> under the same API as the kernel's sort() and so keep the simplicity,
> potentially moving the new sort under lib/ if it would be found more
> widely useful.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Fixes: https://gitlab.freedesktop.org/drm/amd/-/issues/3617

It should at least.

Regards,

Tvrtko

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 129 ++++++++++++++++-------------
>   1 file changed, 73 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 75c3e37fd617..750dc20a9e9d 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -12,6 +12,7 @@
>   #include <linux/dma-fence-chain.h>
>   #include <linux/dma-fence-unwrap.h>
>   #include <linux/slab.h>
> +#include <linux/sort.h>
>   
>   /* Internal helper to start new array iteration, don't use directly */
>   static struct dma_fence *
> @@ -59,6 +60,25 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>   }
>   EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
>   
> +
> +static int fence_cmp(const void *_a, const void *_b)
> +{
> +	struct dma_fence *a = *(struct dma_fence **)_a;
> +	struct dma_fence *b = *(struct dma_fence **)_b;
> +
> +	if (a->context < b->context)
> +		return -1;
> +	else if (a->context > b->context)
> +		return 1;
> +
> +	if (dma_fence_is_later(b, a))
> +		return -1;
> +	else if (dma_fence_is_later(a, b))
> +		return 1;
> +
> +	return 0;
> +}
> +
>   /* Implementation for the dma_fence_merge() marco, don't use directly */
>   struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   					   struct dma_fence **fences,
> @@ -67,9 +87,12 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	struct dma_fence *tmp, *signaled, **array;
>   	struct dma_fence_array *result;
>   	ktime_t timestamp;
> -	unsigned int i;
> -	size_t count;
> +	int i, j, count;
>   
> +	/*
> +	 * Count number of unwrapped fences and fince the latest signaled
> +	 * timestamp.
> +	 */
>   	count = 0;
>   	timestamp = ns_to_ktime(0);
>   	for (i = 0; i < num_fences; ++i) {
> @@ -98,74 +121,68 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	else if (count == 1)
>   		return dma_fence_get(signaled);
>   
> +	/*
> +	 * Allocate and populate the array.
> +	 */
>   	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>   	if (!array)
>   		return NULL;
>   
> -	/*
> -	 * This trashes the input fence array and uses it as position for the
> -	 * following merge loop. This works because the dma_fence_merge()
> -	 * wrapper macro is creating this temporary array on the stack together
> -	 * with the iterators.
> -	 */
> -	for (i = 0; i < num_fences; ++i)
> -		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
> -
>   	count = 0;
> -	do {
> -		unsigned int sel;
> -
> -restart:
> -		tmp = NULL;
> -		for (i = 0; i < num_fences; ++i) {
> -			struct dma_fence *next;
> -
> -			while (fences[i] && dma_fence_is_signaled(fences[i]))
> -				fences[i] = dma_fence_unwrap_next(&iter[i]);
> -
> -			next = fences[i];
> -			if (!next)
> -				continue;
> -
> -			/*
> -			 * We can't guarantee that inpute fences are ordered by
> -			 * context, but it is still quite likely when this
> -			 * function is used multiple times. So attempt to order
> -			 * the fences by context as we pass over them and merge
> -			 * fences with the same context.
> -			 */
> -			if (!tmp || tmp->context > next->context) {
> -				tmp = next;
> -				sel = i;
> -
> -			} else if (tmp->context < next->context) {
> -				continue;
> -
> -			} else if (dma_fence_is_later(tmp, next)) {
> -				fences[i] = dma_fence_unwrap_next(&iter[i]);
> -				goto restart;
> -			} else {
> -				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> -				goto restart;
> -			}
> +	for (i = 0; i < num_fences; ++i) {
> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
> +			if (!dma_fence_is_signaled(tmp))
> +				array[count++] = tmp;
>   		}
> -
> -		if (tmp) {
> -			array[count++] = dma_fence_get(tmp);
> -			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +	}
> +
> +	/*
> +	 * Equal fast-path as the above one, in case some fences got signalled
> +	 * in the meantime.
> +	 */
> +	if (count == 0) {
> +		tmp = dma_fence_allocate_private_stub(timestamp);
> +		goto return_tmp;
> +	} else if (count == 1) {
> +		tmp = dma_fence_get(array[0]);
> +		goto return_tmp;
> +	}
> +
> +	/*
> +	 * Sort in context and seqno order.
> +	 */
> +	sort(array, count, sizeof(*array), fence_cmp, NULL);
> +
> +	/*
> +	 * Only keep the most recent fence for each context.
> +	 */
> +	j = 0;
> +	tmp = array[0];
> +	for (i = 1; i < count; i++) {
> +		if (array[i]->context != tmp->context) {
> +			array[j++] = dma_fence_get(tmp);
>   		}
> -	} while (tmp);
> -
> +		tmp = array[i];
> +	}
> +	if (j == 0 || tmp->context != array[j - 1]->context) {
> +		array[j++] = dma_fence_get(tmp);
> +	}
> +	count = j;
> +
> +	/*
> +	 * And another fast-path as the earlier ones.
> +	 */
>   	if (count == 0) {
>   		tmp = dma_fence_allocate_private_stub(ktime_get());
>   		goto return_tmp;
> -	}
> -
> -	if (count == 1) {
> +	} else if (count == 1) {
>   		tmp = array[0];
>   		goto return_tmp;
>   	}
>   
> +	/*
> +	 * Finnaly create the output fence array.
> +	 */
>   	result = dma_fence_array_create(count, array,
>   					dma_fence_context_alloc(1),
>   					1, false);
