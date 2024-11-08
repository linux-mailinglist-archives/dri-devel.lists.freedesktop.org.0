Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE99C21B7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4742110E9FC;
	Fri,  8 Nov 2024 16:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="bP7E3hLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D8410E262
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:13:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso20337725e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1731082380; x=1731687180;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R4poXxfRfxPLdn8k7VS6ytr5E4cYnD80y1QbF6VF3NM=;
 b=bP7E3hLfi/J+L0EvDVbVm30sr6CkTojecD+UOndLOoYlIjuxALFX6pIjEtsj7Zol8v
 hBou9DYKtHNW4ALC6kXSApNQeeLnbKIocxyEJ2HXmwZXeJ+gC1ZVXLlptykv44Pw+U4a
 hN6szLJMOtyNVqMqKcSjBuoImUCsFomocIy1g/8aZm3OVuYDu/RC8fET4WU16AYLMx+8
 ZAQuj7f/jYMG6pG5APyL6KBtjxr0xhfVS7YkGEFukTW7QVw+DxuBevuvcxJ7SnoCStkQ
 hqplpXa0+2g+Lk5InqkrNjfslYGUWplVHIOLMOztc0Ii4Y0F9iA2/H75FZjkITTVkWIc
 M8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082380; x=1731687180;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R4poXxfRfxPLdn8k7VS6ytr5E4cYnD80y1QbF6VF3NM=;
 b=EmpbDieen471lJXlpf9g5nykH5cvyhehq6XSMyY/sIJDlPjLGfIr56nWuAh6rBrPDW
 SANI00qoDVC7fEooFxjKY+AKKt+mRohFbcO51Ppt78V1HWP0pt21+OVbeg8EnbRnG64G
 ASFSOU/01Y6l+h+BrehuwFpj6xxjjGivqMqMkIDZMRJnfOuF3KzdjGd9Q6Gi/mV+UskI
 IeX6S9YAmkr9iysQt21oxiOiwtjjVFFq58CWNECRbb/JOuJe9w/zqh52ABMavlnc6AQd
 Cb7u5v6Pu76ZBxW9e+r+wa1EOcJ9Q82HDNjq+nzziv+2CCUjNX9j/jRMKnkBIhFqDN2Q
 90bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX97j+I5RboLOoCV+Rh8RUqM72JqC4H2ai9ficwfT6wewXocg1yu58b4u6FPHqlb0hDmU4kkRgnoFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7wVr9j9SM+DSdj2wpBo98+dwpo7VLWINPcD3tFCyohCD5t+jG
 LjyfxEBAOWrYbKQz60tZZXf2SNK+ptgwTZ8IEnd5TpQVam64MiiGjqCB87fsenw=
X-Google-Smtp-Source: AGHT+IHfX3drXiakOCwi9XTVwxzLJGsb7nYv+TEqYteAVJt7pnOy3693z7LQm/H5Wf0iUbe2RkXDVA==
X-Received: by 2002:a05:600c:4e8b:b0:42c:c401:6d8b with SMTP id
 5b1f17b1804b1-432b74feb99mr28658015e9.7.1731082380245; 
 Fri, 08 Nov 2024 08:13:00 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6b3505sm108531955e9.15.2024.11.08.08.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 08:12:59 -0800 (PST)
Message-ID: <b1383d57-39f0-460b-9793-435f60f7f722@ursulin.net>
Date: Fri, 8 Nov 2024 16:12:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-3-christian.koenig@amd.com>
 <bf0a51cb-a112-45d7-b55f-47a75ed87da6@ursulin.net>
 <d2882342-ec87-4e41-a7f8-6d7cf8fb3b20@ursulin.net>
 <810e2380-1215-4b85-85b5-6b558f7fd62a@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <810e2380-1215-4b85-85b5-6b558f7fd62a@gmail.com>
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


On 08/11/2024 14:58, Christian König wrote:
> Am 08.11.24 um 12:22 schrieb Tvrtko Ursulin:
>> On 07/11/2024 16:00, Tvrtko Ursulin wrote:
>>> On 24/10/2024 13:41, Christian König wrote:
>>>> The merge function initially handled only individual fences and
>>>> arrays which in turn were created by the merge function. This allowed
>>>> to create the new array by a simple merge sort based on the fence
>>>> context number.
>>>>
>>>> The problem is now that since the addition of timeline sync objects
>>>> userspace can create chain containers in basically any fence context
>>>> order.
>>>>
>>>> If those are merged together it can happen that we create really
>>>> large arrays since the merge sort algorithm doesn't work any more.
>>>>
>>>> So put an insert sort behind the merge sort which kicks in when the
>>>> input fences are not in the expected order. This isn't as efficient
>>>> as a heap sort, but has better properties for the most common use
>>>> case.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/dma-buf/dma-fence-unwrap.c | 39 
>>>> ++++++++++++++++++++++++++----
>>>>   1 file changed, 34 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>>>> b/drivers/dma-buf/dma-fence-unwrap.c
>>>> index 628af51c81af..d9aa280d9ff6 100644
>>>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>>>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>>>> @@ -106,7 +106,7 @@ struct dma_fence 
>>>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>>>           fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>>>>       count = 0;
>>>> -    do {
>>>> +    while (true) {
>>>>           unsigned int sel;
>>>>   restart:
>>>> @@ -144,11 +144,40 @@ struct dma_fence 
>>>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>>>               }
>>>>           }
>>>> -        if (tmp) {
>>>> -            array[count++] = dma_fence_get(tmp);
>>>> -            fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>>>> +        if (!tmp)
>>>> +            break;
>>>> +
>>>> +        /*
>>>> +         * We could use a binary search here, but since the assumption
>>>> +         * is that the main input are already sorted dma_fence_arrays
>>>> +         * just looking from end has a higher chance of finding the
>>>> +         * right location on the first try
>>>> +         */
>>>> +
>>>> +        for (i = count; i--;) {
>>>> +            if (likely(array[i]->context < tmp->context))
>>>> +                break;
>>>> +
>>>> +            if (array[i]->context == tmp->context) {
>>>> +                if (dma_fence_is_later(tmp, array[i])) {
>>>> +                    dma_fence_put(array[i]);
>>>> +                    array[i] = dma_fence_get(tmp);
>>>> +                }
>>>> +                fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>>>> +                goto restart;
>>>> +            }
>>>>           }
>>>> -    } while (tmp);
>>>> +
>>>> +        ++i;
>>>> +        /*
>>>> +         * Make room for the fence, this should be a nop most of the
>>>> +         * time.
>>>> +         */
>>>> +        memcpy(&array[i + 1], &array[i], (count - i) * 
>>>> sizeof(*array));
>>>> +        array[i] = dma_fence_get(tmp);
>>>> +        fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>>>> +        count++;
>>>
>>> Having ventured into this function for the first time, I can say that 
>>> this is some smart code which is not easy to grasp. It could 
>>> definitely benefit from a high level comment before the do-while loop 
>>> to explain what it is going to do.
>>>
>>> Next and tmp local variable names I also wonder if could be renamed 
>>> to something more descriptive.
>>>
>>> And the algorithmic complexity of the end result, given the multiple 
>>> loops and gotos, I have no idea what it could be.
>>>
>>> Has a dumb solution been considered like a two-pass with a 
>>> pessimistically allocated fence array been considered? Like:
>>>
>>> 1) Populate array with all unsignalled unwrapped fences. (O(count))
>>>
>>> 2) Bog standard include/linux/sort.h by context and seqno. 
>>> (O(count*log (count)))
>>>
>>> 3) Walk array and squash same context to latest fence. (Before this 
>>> patch that wasn't there, right?). (O(count)) (Overwrite in place, no 
>>> memcpy needed.)
>>>
>>> Algorithmic complexity of that would be obvious and code much simpler.
>>
>> FWIW something like the below passes selftests. How does it look to 
>> you? Do you think more or less efficient and more or less readable?
> 
> Yeah I was considering the exact same thing.
> 
> What hold me back was the fact that the heap sort() implementation is 
> really inefficient for the most common use case of this. In other words 
> two arrays with fences already sorted is basically just O(count).
> 
> And I'm also not sure how many fences we see in those arrays in 
> practice. With Vulkan basically trying to feed multiple contexts to keep 
> all CPUs busy we might have quite a number here.

I can add some instrumentation and run some games next week.

Another option is adding the sort algorithm you want with the same API 
as kernel's sort. Even if a local implementation that may already 
increase readability of the merging process.

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>>
>> commit 8a7c3ea7e7af85e813bf5fc151537ae37be1d6d9
>> Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Date:   Fri Nov 8 10:14:15 2024 +0000
>>
>>     __dma_fence_unwrap_merge
>>
>>     Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 628af51c81af..47d67e482e96 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/dma-fence-chain.h>
>>  #include <linux/dma-fence-unwrap.h>
>>  #include <linux/slab.h>
>> +#include <linux/sort.h>
>>
>>  /* Internal helper to start new array iteration, don't use directly */
>>  static struct dma_fence *
>> @@ -59,17 +60,39 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>> dma_fence_unwrap *cursor)
>>  }
>>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
>>
>> +
>> +static int fence_cmp(const void *_a, const void *_b)
>> +{
>> +    const struct dma_fence *a = *(const struct dma_fence **)_a;
>> +    const struct dma_fence *b = *(const struct dma_fence **)_b;
>> +
>> +    if (a->context < b->context)
>> +        return -1;
>> +    else if (a->context > b->context)
>> +        return 1;
>> +
>> +    if (a->seqno < b->seqno)
>> +        return -1;
>> +    else if (a->seqno > b->seqno)
>> +        return 1;
>> +
>> +    return 0;
>> +}
>> +
>>  /* Implementation for the dma_fence_merge() marco, don't use directly */
>>  struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>                         struct dma_fence **fences,
>>                         struct dma_fence_unwrap *iter)
>>  {
>> -    struct dma_fence_array *result;
>>      struct dma_fence *tmp, **array;
>> +    struct dma_fence_array *result;
>>      ktime_t timestamp;
>> -    unsigned int i;
>> -    size_t count;
>> +    int i, j, count;
>>
>> +    /*
>> +     * Count number of unwrapped fences and fince the latest signaled
>> +     * timestamp.
>> +     */
>>      count = 0;
>>      timestamp = ns_to_ktime(0);
>>      for (i = 0; i < num_fences; ++i) {
>> @@ -92,63 +115,41 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>      if (count == 0)
>>          return dma_fence_allocate_private_stub(timestamp);
>>
>> +    /*
>> +     * Allocate and populate the array.
>> +     */
>>      array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>>      if (!array)
>>          return NULL;
>>
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
>>      count = 0;
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
>> -            } else {
>> -                fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> -                goto restart;
>> -            }
>> +    for (i = 0; i < num_fences; ++i) {
>> +        dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>> +            if (!dma_fence_is_signaled(tmp))
>> +                array[count++] = tmp;
>>          }
>> +    }
>> +
>> +    /*
>> +     * Sort in context and seqno order.
>> +     */
>> +    sort(array, count, sizeof(*array), fence_cmp, NULL);
>>
>> -        if (tmp) {
>> -            array[count++] = dma_fence_get(tmp);
>> -            fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +    /*
>> +     * Only keep the most recent fence for each context.
>> +     */
>> +    j = 0;
>> +    tmp = array[0];
>> +    for (i = 1; i < count; i++) {
>> +        if (array[i]->context != tmp->context) {
>> +            array[j++] = dma_fence_get(tmp);
>>          }
>> -    } while (tmp);
>> +        tmp = array[i];
>> +    }
>> +    if (tmp->context != array[j - 1]->context) {
>> +        array[j++] = dma_fence_get(tmp);
>> +    }
>> +    count = j;
>>
>>      if (count == 0) {
>>          tmp = dma_fence_allocate_private_stub(ktime_get());
>>
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +    };
>>>>       if (count == 0) {
>>>>           tmp = dma_fence_allocate_private_stub(ktime_get());
> 
