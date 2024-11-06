Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C619BE661
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 12:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6637F10E6BF;
	Wed,  6 Nov 2024 11:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EZd6YlQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939E410E6BF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 11:59:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso5047488f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 03:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730894345; x=1731499145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Y87pMnWFoa3I37VV8/r2muz4wO+tB140v+PKTUy8BI=;
 b=EZd6YlQa+rx9Z+zFlKwWYYNBNDRRNIwjLcT6oj/uSr0QkdThYNXAm3GNGxK1QJ52Xs
 4jkvGNWjb50ID8B62DWChQxdnjeo/E0uokQXLX7HkQ49WxKx5lng4d1NpX5Mlppysp1w
 zYYAplj5pY0U9dcUXD4e5G4h+I9Y1r9fzwbcvJroHw4NLTro2dycZZ3D9YaCdv+5fant
 ahp1Gpntss5tiDUjRnnAH61B4oyfGade2KhevYEMZSkFgwFlO2DsH0nIR8W7cva2ldNv
 7bYvO0IDMImMi3dQVViGK413S2Dp53S700Z4Xr6hW4VPghpKvYZupf134e1sDgUupG3x
 aliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730894345; x=1731499145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Y87pMnWFoa3I37VV8/r2muz4wO+tB140v+PKTUy8BI=;
 b=MZNENHsEACl/0TfBgEsiM8yw71+4yKnoCPg19n1gZYzsJ++xMAVqCTlHel990knVrA
 kxrOuPbZ7Dl975R6m4fHj9hhyEFb466yIoiHB4cOIkhy4R/13rOFceXNSGzmoaCSdvIr
 zYNLQmc0VZozaqbIvrKwpAIB/AAq0EiqoRQO0AXL2VNkaC9wJDkYdHhvypVXPp0qsJLz
 TQW87RKQsKRKMJfZYB8ZoAauK03uTGsGwtnFKOyR21QX252XcAQ8auBvUfZ7o3IP6Xv4
 COj/oe+QMUuU19nIo6C3rK9+UDey+98iVLHcx7/zchw6WeYSgHKdU8d6AMGSSIWoKtwn
 AFMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBrJ64qAAp3w6+j+TcV2lCH80UOnOefEiAPCtirDCU1ebpsMMxD/73jg7uH3cBxO8NnN6GjF9o6UQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+XRG734DmWRDfA9sZACVLhLAp/eB8oupIH6mlny9Q1GbWc1ah
 TE/Et6RSw11Gm3WPs/xnHC4Oy5fqu55ZETaT1Voez1EtSU2VjLZ3
X-Google-Smtp-Source: AGHT+IFg9E6elVz+or/lQqOgtLdlpoV/nnD8qYAb6a9NpLfMMZrK3a1k2HMk8oyLpqzu9iyteOFbmQ==
X-Received: by 2002:a05:6000:2805:b0:37d:4657:ea7d with SMTP id
 ffacd0b85a97d-381bea26687mr12845863f8f.49.1730894344497; 
 Wed, 06 Nov 2024 03:59:04 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116a7a6sm18893363f8f.92.2024.11.06.03.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 03:59:04 -0800 (PST)
Message-ID: <1a93003c-44fb-416a-9446-8f74d6121a98@gmail.com>
Date: Wed, 6 Nov 2024 12:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
To: Friedrich Vock <friedrich.vock@gmx.de>, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-3-christian.koenig@amd.com>
 <c93698d1-5b83-4314-bf9f-d1540d5cdf2d@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c93698d1-5b83-4314-bf9f-d1540d5cdf2d@gmx.de>
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

Am 30.10.24 um 19:10 schrieb Friedrich Vock:
> On 24.10.24 14:41, Christian König wrote:
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
>>
>>       count = 0;
>> -    do {
>> +    while (true) {
>>           unsigned int sel;
>>
>>   restart:
>> @@ -144,11 +144,40 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>               }
>>           }
>>
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
>
> This is broken. The first iteration of this loop will always index out
> of bounds.

Nope, that is correct. The condition is evaluated before the loop, so 
the i-- reduces the index to the last element in the array.

Regards,
Christian.


> What you probably want here is:
>
> +        for (i = count - 1; count && i--;) {
>
> This intentionally overflows for count == 0, but the ++i after the loop
> undoes that. Maybe it would be worth a comment to point out that's
> intentional.
>
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
>
> Need memmove here, src and dst alias.
>
> I took it for a spin with these things fixed and it seemed to resolve
> the issue as well. How do you want to proceed? I guess I would be
> comfortable putting a Reviewed-by and/or Tested-by on a version with
> these things fixed (with the usual caveat that I'm not a maintainer - I
> guess the process requires (at least one) reviewer to be?).
>
> By the way, I guess you might've had some internal branches where this
> fix needed to go into quick or something? Usually I'm happy to make a v2
> for my patches myself, too ;)
>
> Regards,
> Friedrich
>
>> +        array[i] = dma_fence_get(tmp);
>> +        fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>> +        count++;
>> +    };
>>
>>       if (count == 0) {
>>           tmp = dma_fence_allocate_private_stub(ktime_get());
>

