Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86BD9C1C11
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 12:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4244910E095;
	Fri,  8 Nov 2024 11:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="kpV1u8nS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8F210E095
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 11:22:43 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4315baec69eso18232335e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 03:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1731064962; x=1731669762;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h36EJUve+WwS4l6rC/mrA6lUowUTAe1gho0nIQsHUwU=;
 b=kpV1u8nSYsFfbanO9PVjYy97qnPkUxxlv6pp3SB5FI9s9cn/AC0DEjBDhFFZJ21SZG
 Qky728X6LMtn/G1arKaa5aGSHVeNNa6qQMdNIcUB2b8vJjPUlTgrwE+LB4avjIU3WxYM
 uxtMQCouJo4snzOUxUb8gJ2q+jlprmRCpRR1dpTQHS2hmALlbvz2+2NdoGE73plsMhCj
 vtcqculbV7o7ihAARWTV/XQNS+FSvxe4KMkIofAMhPllqgpFPLPBZZ5p8rX7pffCMduu
 LPrZhP7AdZchG7L6k6+OJY4mKWwczT1n6Uz9JRvULCWITyCpvYiTLgUr6oxZc3cwYYiT
 lXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731064962; x=1731669762;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h36EJUve+WwS4l6rC/mrA6lUowUTAe1gho0nIQsHUwU=;
 b=Pv0+lpGssNOE8vfKXTDj8gUMBrAGNCvyVDS3wat4vo8J7aR5DbbANnrAYG/EfhKw5q
 VZIPAwPjlPt+4ld4xTbqm42Csa2hpG16IrLXrKYVs7sskb3z+mSTrVCg1iOxpmeupjHm
 /ym6WEXKs+yYGTU706C9Ul2PNkNTnFLa0+60FMHHb6+rGE/Z0WbOENjXveDl5o2J2INZ
 GoWO7WMiuiyGuLFf4o9nEOmbLUUdFrG0PTZhe3Qo6EYRVIo09havIjWLIEriWPt7uvUT
 Km089Tz0xKExqU9iIBb6L63FtRq/Pb0bSHfKYd9AaQRLvnATKrQFOztJoDJOnPF8hsm0
 vsXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE53puaHQvpDrGNrH/ZMTvU3Rep7ROtjuPeaT1d6UsfbtusGifgdOnDkm4Ypm8kr4VPCFoOw6/fNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxUEZ6ZjPUXDpYGF+LVFkO9/+rExv4l6T+DhF8vHNXMSVMUZf3
 ZUTZZZxktCjLgV2d8BJ0sIYH0U4ZW3IWTd+ChrFuUCj4MFGTe38MxP5GmeODlg0=
X-Google-Smtp-Source: AGHT+IHsa+/KLyMstCqYwRfBJSo/bQQmBnV67zwnq2I7i2gDt1UI7iMs5+BOvBO0+4Uzzw83hMWgEw==
X-Received: by 2002:a5d:5f81:0:b0:37d:5232:a963 with SMTP id
 ffacd0b85a97d-381f1866f10mr1894742f8f.14.1731064962128; 
 Fri, 08 Nov 2024 03:22:42 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97ce0fsm4292816f8f.33.2024.11.08.03.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 03:22:41 -0800 (PST)
Message-ID: <d2882342-ec87-4e41-a7f8-6d7cf8fb3b20@ursulin.net>
Date: Fri, 8 Nov 2024 11:22:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-3-christian.koenig@amd.com>
 <bf0a51cb-a112-45d7-b55f-47a75ed87da6@ursulin.net>
Content-Language: en-GB
In-Reply-To: <bf0a51cb-a112-45d7-b55f-47a75ed87da6@ursulin.net>
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


On 07/11/2024 16:00, Tvrtko Ursulin wrote:
> 
> On 24/10/2024 13:41, Christian König wrote:
>> The merge function initially handled only individual fences and
>> arrays which in turn were created by the merge function. This allowed
>> to create the new array by a simple merge sort based on the fence
>> context number.
>>
>> The problem is now that since the addition of timeline sync objects
>> userspace can create chain containers in basically any fence context
>> order.
>>
>> If those are merged together it can happen that we create really
>> large arrays since the merge sort algorithm doesn't work any more.
>>
>> So put an insert sort behind the merge sort which kicks in when the
>> input fences are not in the expected order. This isn't as efficient
>> as a heap sort, but has better properties for the most common use
>> case.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 39 ++++++++++++++++++++++++++----
>>   1 file changed, 34 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 628af51c81af..d9aa280d9ff6 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -106,7 +106,7 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>           fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>>       count = 0;
>> -    do {
>> +    while (true) {
>>           unsigned int sel;
>>   restart:
>> @@ -144,11 +144,40 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>               }
>>           }
>> -        if (tmp) {
>> -            array[count++] = dma_fence_get(tmp);
>> -            fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +        if (!tmp)
>> +            break;
>> +
>> +        /*
>> +         * We could use a binary search here, but since the assumption
>> +         * is that the main input are already sorted dma_fence_arrays
>> +         * just looking from end has a higher chance of finding the
>> +         * right location on the first try
>> +         */
>> +
>> +        for (i = count; i--;) {
>> +            if (likely(array[i]->context < tmp->context))
>> +                break;
>> +
>> +            if (array[i]->context == tmp->context) {
>> +                if (dma_fence_is_later(tmp, array[i])) {
>> +                    dma_fence_put(array[i]);
>> +                    array[i] = dma_fence_get(tmp);
>> +                }
>> +                fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +                goto restart;
>> +            }
>>           }
>> -    } while (tmp);
>> +
>> +        ++i;
>> +        /*
>> +         * Make room for the fence, this should be a nop most of the
>> +         * time.
>> +         */
>> +        memcpy(&array[i + 1], &array[i], (count - i) * sizeof(*array));
>> +        array[i] = dma_fence_get(tmp);
>> +        fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +        count++;
> 
> Having ventured into this function for the first time, I can say that 
> this is some smart code which is not easy to grasp. It could definitely 
> benefit from a high level comment before the do-while loop to explain 
> what it is going to do.
> 
> Next and tmp local variable names I also wonder if could be renamed to 
> something more descriptive.
> 
> And the algorithmic complexity of the end result, given the multiple 
> loops and gotos, I have no idea what it could be.
> 
> Has a dumb solution been considered like a two-pass with a 
> pessimistically allocated fence array been considered? Like:
> 
> 1) Populate array with all unsignalled unwrapped fences. (O(count))
> 
> 2) Bog standard include/linux/sort.h by context and seqno. (O(count*log 
> (count)))
> 
> 3) Walk array and squash same context to latest fence. (Before this 
> patch that wasn't there, right?). (O(count)) (Overwrite in place, no 
> memcpy needed.)
> 
> Algorithmic complexity of that would be obvious and code much simpler.

FWIW something like the below passes selftests. How does it look to you? 
Do you think more or less efficient and more or less readable?

commit 8a7c3ea7e7af85e813bf5fc151537ae37be1d6d9
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Nov 8 10:14:15 2024 +0000

     __dma_fence_unwrap_merge

     Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
b/drivers/dma-buf/dma-fence-unwrap.c
index 628af51c81af..47d67e482e96 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -12,6 +12,7 @@
  #include <linux/dma-fence-chain.h>
  #include <linux/dma-fence-unwrap.h>
  #include <linux/slab.h>
+#include <linux/sort.h>

  /* Internal helper to start new array iteration, don't use directly */
  static struct dma_fence *
@@ -59,17 +60,39 @@ struct dma_fence *dma_fence_unwrap_next(struct 
dma_fence_unwrap *cursor)
  }
  EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);

+
+static int fence_cmp(const void *_a, const void *_b)
+{
+	const struct dma_fence *a = *(const struct dma_fence **)_a;
+	const struct dma_fence *b = *(const struct dma_fence **)_b;
+
+	if (a->context < b->context)
+		return -1;
+	else if (a->context > b->context)
+		return 1;
+
+	if (a->seqno < b->seqno)
+		return -1;
+	else if (a->seqno > b->seqno)
+		return 1;
+
+	return 0;
+}
+
  /* Implementation for the dma_fence_merge() marco, don't use directly */
  struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
  					   struct dma_fence **fences,
  					   struct dma_fence_unwrap *iter)
  {
-	struct dma_fence_array *result;
  	struct dma_fence *tmp, **array;
+	struct dma_fence_array *result;
  	ktime_t timestamp;
-	unsigned int i;
-	size_t count;
+	int i, j, count;

+	/*
+	 * Count number of unwrapped fences and fince the latest signaled
+	 * timestamp.
+	 */
  	count = 0;
  	timestamp = ns_to_ktime(0);
  	for (i = 0; i < num_fences; ++i) {
@@ -92,63 +115,41 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
int num_fences,
  	if (count == 0)
  		return dma_fence_allocate_private_stub(timestamp);

+	/*
+	 * Allocate and populate the array.
+	 */
  	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
  	if (!array)
  		return NULL;

-	/*
-	 * This trashes the input fence array and uses it as position for the
-	 * following merge loop. This works because the dma_fence_merge()
-	 * wrapper macro is creating this temporary array on the stack together
-	 * with the iterators.
-	 */
-	for (i = 0; i < num_fences; ++i)
-		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
-
  	count = 0;
-	do {
-		unsigned int sel;
-
-restart:
-		tmp = NULL;
-		for (i = 0; i < num_fences; ++i) {
-			struct dma_fence *next;
-
-			while (fences[i] && dma_fence_is_signaled(fences[i]))
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-
-			next = fences[i];
-			if (!next)
-				continue;
-
-			/*
-			 * We can't guarantee that inpute fences are ordered by
-			 * context, but it is still quite likely when this
-			 * function is used multiple times. So attempt to order
-			 * the fences by context as we pass over them and merge
-			 * fences with the same context.
-			 */
-			if (!tmp || tmp->context > next->context) {
-				tmp = next;
-				sel = i;
-
-			} else if (tmp->context < next->context) {
-				continue;
-
-			} else if (dma_fence_is_later(tmp, next)) {
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-				goto restart;
-			} else {
-				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-				goto restart;
-			}
+	for (i = 0; i < num_fences; ++i) {
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
+			if (!dma_fence_is_signaled(tmp))
+				array[count++] = tmp;
  		}
+	}
+
+	/*
+	 * Sort in context and seqno order.
+	 */
+	sort(array, count, sizeof(*array), fence_cmp, NULL);

-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+	/*
+	 * Only keep the most recent fence for each context.
+	 */
+	j = 0;
+	tmp = array[0];
+	for (i = 1; i < count; i++) {
+		if (array[i]->context != tmp->context) {
+			array[j++] = dma_fence_get(tmp);
  		}
-	} while (tmp);
+		tmp = array[i];
+	}
+	if (tmp->context != array[j - 1]->context) {
+		array[j++] = dma_fence_get(tmp);
+	}
+	count = j;

  	if (count == 0) {
  		tmp = dma_fence_allocate_private_stub(ktime_get());


Regards,

Tvrtko


> 
> Regards,
> 
> Tvrtko
> 
>> +    };
>>       if (count == 0) {
>>           tmp = dma_fence_allocate_private_stub(ktime_get());
