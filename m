Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719999C8FB2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 17:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF5210E0AC;
	Thu, 14 Nov 2024 16:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a1oyTZE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECBD10E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P8lYHt+1bJQjBebIWL1lwJgegPFJe3JiIiEHUo4KVmc=; b=a1oyTZE3hinL4r10g9aDEK0oLB
 DGHumSrcyPR3HM0Wj8e3FmcHF8UjitkNdbYG/RAITculHe9pljhwjNhhNhgAI4G/+BPVsnlEFY1IC
 3isy01KJToBKqKAzzcjZVeuc/FoOW9JRWMdDL9I0KjVc3gLiZrojfR2031grhz8cHXGYmRQd64w8u
 ZYyVs1IiyK8AZb94nH2nxMOASo7CWBtK/JMAofIg5OTbIahbwBnGaDLwwGMnEALrMAwOs44vWI65B
 FrGFZhJKvuR3H+s88rmupT8IrYPEbYVFvUxEeUe9L4ZP0EDL7+9yaUY0UfEt3JiaJ/sXs6OGPcvrX
 xS5/yFXQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tBch9-006sVl-6p; Thu, 14 Nov 2024 17:27:47 +0100
Message-ID: <4419dab0-d22b-49d4-b208-6ff022934c95@igalia.com>
Date: Thu, 14 Nov 2024 16:27:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Use kernel's sort for merging fences
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Friedrich Vock <friedrich.vock@gmx.de>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20241114111500.77358-1-tursulin@igalia.com>
 <757d59ec-2735-477e-9648-a2b82a52659c@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <757d59ec-2735-477e-9648-a2b82a52659c@amd.com>
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


On 14/11/2024 13:48, Christian König wrote:
> Am 14.11.24 um 12:14 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> One alternative to the fix Christian proposed in
>> https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/
>> is to replace the rather complex open coded sorting loops with the kernel
>> standard sort followed by a context squashing pass.
>>
>> Proposed advantage of this would be readability but one concern Christian
>> raised was that there could be many fences, that they are typically 
>> mostly
>> sorted, and so the kernel's heap sort would be much worse by the proposed
>> algorithm.
>>
>> I had a look running some games and vkcube to see what are the typical
>> number of input fences. Tested scenarios:
>>
>> 1) Hogwarts Legacy under Gamescope
>>
>> 450 calls per second to __dma_fence_unwrap_merge.
>>
>> Percentages per number of fences buckets, before and after checking for
>> signalled status, sorting and flattening:
>>
>>     N       Before      After
>>     0       0.91%
>>     1      69.40%
>>    2-3     28.72%       9.4%  (90.6% resolved to one fence)
>>    4-5      0.93%
>>    6-9      0.03%
>>    10+
>>
>> 2) Cyberpunk 2077 under Gamescope
>>
>> 1050 calls per second, amounting to 0.01% CPU time according to perf top.
>>
>>     N       Before      After
>>     0       1.13%
>>     1      52.30%
>>    2-3     40.34%       55.57%
>>    4-5      1.46%        0.50%
>>    6-9      2.44%
>>    10+      2.34%
>>
>> 3) vkcube under Plasma
>>
>> 90 calls per second.
>>
>>     N       Before      After
>>     0
>>     1
>>    2-3      100%         0%   (Ie. all resolved to a single fence)
>>    4-5
>>    6-9
>>    10+
>>
>> In the case of vkcube all invocations in the 2-3 bucket were actually
>> just two input fences.
>>
>>  From these numbers it looks like the heap sort should not be a
>> disadvantage, given how the dominant case is <= 2 input fences which heap
>> sort solves with just one compare and swap. (And for the case of one 
>> input
>> fence we have a fast path in the previous patch.)
>>
>> A complementary possibility is to implement a different sorting algorithm
>> under the same API as the kernel's sort() and so keep the simplicity,
>> potentially moving the new sort under lib/ if it would be found more
>> widely useful.
>>
>> v2:
>>   * Hold on to fence references and reduce commentary. (Christian)
>>   * Record and use latest signaled timestamp in the 2nd loop too.
>>   * Consolidate zero or one fences fast paths.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3617
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: Gustavo Padovan <gustavo@padovan.org>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>> Cc: linux-media@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> Cc: <stable@vger.kernel.org> # v6.0+
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 129 ++++++++++++++---------------
>>   1 file changed, 64 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 628af51c81af..26cad03340ce 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/dma-fence-chain.h>
>>   #include <linux/dma-fence-unwrap.h>
>>   #include <linux/slab.h>
>> +#include <linux/sort.h>
>>   /* Internal helper to start new array iteration, don't use directly */
>>   static struct dma_fence *
>> @@ -59,6 +60,25 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>> dma_fence_unwrap *cursor)
>>   }
>>   EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
>> +
>> +static int fence_cmp(const void *_a, const void *_b)
>> +{
>> +    struct dma_fence *a = *(struct dma_fence **)_a;
>> +    struct dma_fence *b = *(struct dma_fence **)_b;
>> +
>> +    if (a->context < b->context)
>> +        return -1;
>> +    else if (a->context > b->context)
>> +        return 1;
>> +
>> +    if (dma_fence_is_later(b, a))
>> +        return -1;
>> +    else if (dma_fence_is_later(a, b))
>> +        return 1;
>> +
>> +    return 0;
>> +}
>> +
>>   /* Implementation for the dma_fence_merge() marco, don't use 
>> directly */
>>   struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>                          struct dma_fence **fences,
>> @@ -67,8 +87,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
>> int num_fences,
>>       struct dma_fence_array *result;
>>       struct dma_fence *tmp, **array;
>>       ktime_t timestamp;
>> -    unsigned int i;
>> -    size_t count;
>> +    int i, j, count;
>>       count = 0;
>>       timestamp = ns_to_ktime(0);
>> @@ -96,78 +115,58 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>       if (!array)
>>           return NULL;
>> -    /*
>> -     * This trashes the input fence array and uses it as position for 
>> the
>> -     * following merge loop. This works because the dma_fence_merge()
>> -     * wrapper macro is creating this temporary array on the stack 
>> together
>> -     * with the iterators.
>> -     */
>> -    for (i = 0; i < num_fences; ++i)
>> -        fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>> -
>>       count = 0;
>> -    do {
>> -        unsigned int sel;
>> -
>> -restart:
>> -        tmp = NULL;
>> -        for (i = 0; i < num_fences; ++i) {
>> -            struct dma_fence *next;
>> -
>> -            while (fences[i] && dma_fence_is_signaled(fences[i]))
>> -                fences[i] = dma_fence_unwrap_next(&iter[i]);
>> -
>> -            next = fences[i];
>> -            if (!next)
>> -                continue;
>> -
>> -            /*
>> -             * We can't guarantee that inpute fences are ordered by
>> -             * context, but it is still quite likely when this
>> -             * function is used multiple times. So attempt to order
>> -             * the fences by context as we pass over them and merge
>> -             * fences with the same context.
>> -             */
>> -            if (!tmp || tmp->context > next->context) {
>> -                tmp = next;
>> -                sel = i;
>> -
>> -            } else if (tmp->context < next->context) {
>> -                continue;
>> -
>> -            } else if (dma_fence_is_later(tmp, next)) {
>> -                fences[i] = dma_fence_unwrap_next(&iter[i]);
>> -                goto restart;
>> +    for (i = 0; i < num_fences; ++i) {
>> +        dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>> +            if (!dma_fence_is_signaled(tmp)) {
>> +                array[count++] = dma_fence_get(tmp);
>>               } else {
>> -                fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> -                goto restart;
>> +                ktime_t t = dma_fence_timestamp(tmp);
>> +
>> +                if (ktime_after(t, timestamp))
>> +                    timestamp = t;
>>               }
>>           }
>> +    }
>> -        if (tmp) {
>> -            array[count++] = dma_fence_get(tmp);
>> -            fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +    if (count == 0 || count == 1)
>> +        goto return_fastpath;
>> +
>> +    sort(array, count, sizeof(*array), fence_cmp, NULL);
>> +
>> +    /*
>> +     * Only keep the most recent fence for each context.
>> +     */
>> +    j = 0;
>> +    tmp = array[0];
>> +    for (i = 1; i < count; i++) {
>> +        if (array[i]->context != tmp->context)
>> +            array[j++] = tmp;
>> +        else
>> +            dma_fence_put(tmp);
> 
> If I'm not completely mistaken that can result in dropping the first 
> element but not assigning it again.
> 
> E.g. array[0] is potentially invalid after the loop.

Hmm I don't see it but I could be blind.

It only drops the reference for the previous (tmp) if the context is the 
same. When it finds a new context it saves the previous (tmp) into the 
first free slot (j++).

> 
>> +        tmp = array[i];
>> +    }
>> +    if (j == 0 || tmp->context != array[j - 1]->context) {
>> +        array[j++] = tmp;
>> +    }

Or if all fences are from the same context, or only the last input fence 
is different, it saves the last to the next free slot.

> Maybe adjust the sort criteria so that the highest seqno comes first.
> 
> This reduces the whole loop to something like this:
> 
> j = 0;
> for (i = 1; i < count; i++) {
>      if (array[i]->context == array[j]->context)
>          dma_fence_put(array[i]);
>      else
>          array[++j] = array[i];
> }
> count = ++j;

AFAICS it works and gets rid of the condition outside the loop I had. 
Very neat, thank you! Let me incorporate that, and also see if I can add 
some more test cases on top of your selftest to exercise more corner cases.

Regards,

Tvrtko

>> +    count = j;
>> +
>> +    if (count > 1) {
>> +        result = dma_fence_array_create(count, array,
>> +                        dma_fence_context_alloc(1),
>> +                        1, false);
>> +        if (!result) {
>> +            tmp = NULL;
>> +            goto return_tmp;
>>           }
>> -    } while (tmp);
>> -
>> -    if (count == 0) {
>> -        tmp = dma_fence_allocate_private_stub(ktime_get());
>> -        goto return_tmp;
>> +        return &result->base;
>>       }
>> -    if (count == 1) {
>> +return_fastpath:
>> +    if (count == 0)
>> +        tmp = dma_fence_allocate_private_stub(timestamp);
>> +    else
>>           tmp = array[0];
>> -        goto return_tmp;
>> -    }
>> -
>> -    result = dma_fence_array_create(count, array,
>> -                    dma_fence_context_alloc(1),
>> -                    1, false);
>> -    if (!result) {
>> -        tmp = NULL;
>> -        goto return_tmp;
>> -    }
>> -    return &result->base;
>>   return_tmp:
>>       kfree(array);
> 
