Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98319C8595
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 10:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8B810E7BA;
	Thu, 14 Nov 2024 09:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VtBaeUpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7381810E7BA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=953PFm7GA+VYkEc2R2TMQnGGPby6anjYHqY8jvbImpM=; b=VtBaeUpt6NpBIvWy4VvQ/CTaPu
 LlVDmQ6xPLG0VBjGprylZz5yVmn5oIYYveK57597C5VwkXb9TCD6ljx9Rl0X4Kwc6cD1I+xwDQeNl
 oU9r2KrsYaTYloyIQXmkpSL/4aThfhOVr6g740hHb4Dfq3B+TA+4Q3KaWPLqOgqpYTIU7yCvgFlOF
 kzlbvUFiky9sHbVMcDIfS2B6Z4sMdVfimVFw+MI7wsHY1uiNK1v80AbSm4dYn6lRy69z4vYvUb3mq
 +BoLSv6kDli3VeV8+aKC2Ws/C6lcPD6LD7cW+UOcLJKJc7ptvoeEeK/OkHVxMJc7ecj4AxAQOO3Lk
 4fN7wr8w==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tBVmx-006izY-2z; Thu, 14 Nov 2024 10:05:19 +0100
Message-ID: <14e723bb-d269-47c7-b5cd-cf296a05c49d@igalia.com>
Date: Thu, 14 Nov 2024 09:05:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Add a single fence fast path for fence
 merging
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Friedrich Vock <friedrich.vock@gmx.de>
References: <20241113171947.57446-1-tursulin@igalia.com>
 <9dbdbf44-3f50-4ccc-807b-0e7010e04cbb@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9dbdbf44-3f50-4ccc-807b-0e7010e04cbb@amd.com>
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


On 14/11/2024 08:53, Christian König wrote:
> Am 13.11.24 um 18:19 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Testing some workloads in two different scenarios, such as games running
>> under Gamescope on a Steam Deck, or vkcube under a Plasma desktop, shows
>> that in a significant portion of calls the dma_fence_unwrap_merge helper
>> is called with just a single unsignalled fence.
>>
>> Therefore it is worthile to add a fast path for that case and so bypass
>> the memory allocation and insertion sort attempts.
> 
> You should probably re-order the patches since we need to backport the 
> second as bug fix while the first is just an improvement.

Ok.

> There is also a bug in this patch which needs to be fixed.
> 
>> Tested scenarios:
>>
>> 1) Hogwarts Legacy under Gamescope
>>
>> 450 calls per second to __dma_fence_unwrap_merge.
>>
>> Percentages per number of fences buckets, before and after checking for
>> signalled status, sorting and flattening:
>>
>>     N       Before      After
>>     0       0.85%
>>     1      69.80%        ->   The new fast path.
>>    2-9     29.36%        9%   (Ie. 91% of this bucket flattened to 1 
>> fence)
>>   10-19
>>   20-40
>>    50+
>>
>> 2) Cyberpunk 2077 under Gamescope
>>
>> 1050 calls per second.
>>
>>     N       Before      After
>>     0       0.71%
>>     1      52.53%        ->    The new fast path.
>>    2-9     44.38%      50.60%  (Ie. half resolved to a single fence)
>>   10-19     2.34%
>>   20-40     0.06%
>>    50+
>>
>> 3) vkcube under Plasma
>>
>> 90 calls per second.
>>
>>     N       Before      After
>>     0
>>     1
>>    2-9      100%         0%   (Ie. all resolved to a single fence)
>>   10-19
>>   20-40
>>    50+
>>
>> In the case of vkcube all invocations in the 2-9 bucket were actually
>> just two input fences.
> 
> Nice to have some numbers at hand.
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 628af51c81af..75c3e37fd617 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -64,8 +64,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
>> int num_fences,
>>                          struct dma_fence **fences,
>>                          struct dma_fence_unwrap *iter)
>>   {
>> +    struct dma_fence *tmp, *signaled, **array;
> 
> I would name that unsignaled instead.

Indeed. And a polite way of pointing out my brain was completely 
reversed. :)

>>       struct dma_fence_array *result;
>> -    struct dma_fence *tmp, **array;
>>       ktime_t timestamp;
>>       unsigned int i;
>>       size_t count;
>> @@ -75,6 +75,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
>> int num_fences,
>>       for (i = 0; i < num_fences; ++i) {
>>           dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>>               if (!dma_fence_is_signaled(tmp)) {
>> +                signaled = tmp;
> 
> You need to grab a reference to tmp here if you want to keep it.
> 
> It's perfectly possible that tmp is garbage collected as soon as you go 
> to the next iteration or leave the loop.

Yep.. same bug in the second patch.

Regards,

Tvrtko

>>                   ++count;
>>               } else {
>>                   ktime_t t = dma_fence_timestamp(tmp);
>> @@ -88,9 +89,14 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
>> int num_fences,
>>       /*
>>        * If we couldn't find a pending fence just return a private 
>> signaled
>>        * fence with the timestamp of the last signaled one.
>> +     *
>> +     * Or if there was a single unsignaled fence left we can return it
>> +     * directly and early since that is a major path on many workloads.
>>        */
>>       if (count == 0)
>>           return dma_fence_allocate_private_stub(timestamp);
>> +    else if (count == 1)
>> +        return dma_fence_get(signaled);
>>       array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>>       if (!array)
> 
