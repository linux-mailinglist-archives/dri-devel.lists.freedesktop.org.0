Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE19AFD9B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 11:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B012F10EA34;
	Fri, 25 Oct 2024 09:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="NhZb+81M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D05510EA34
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:05:13 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d47eff9acso1246556f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1729847112; x=1730451912;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+FmD+1g5YmX7z2WvYj0+39IceVpFqbsC33qjY9DeDs=;
 b=NhZb+81M/RnB+DKdwdNiDDheBP6XAixpHOvUMYoijK8bt7ngAcOHLdprRZA0T2YC1W
 iCd1EKZ7+JieDE57mT6Cu6vCdp6KyLTZ+L0Tp1DCv/NmPtH1R1Q3ko858fMLlnjxFN/k
 EVVfiP5EvLOakRtejSW3wjywpUt8KNpxhxSifD/LqDRAwobXJl2iQenjk46v6MoUGTn2
 xyZ9poS25vpFMMytcNidtgWhAHlHkebndOhDOpDalwmTevupSLA69VkNB0RtTYPCVB+U
 rTNIoEF5LKIoG8tOxSknqAQMO1KIpBC5Znghu5RQf1Ow7etsBtAMyjll+ulkyC85CcCZ
 lmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729847112; x=1730451912;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c+FmD+1g5YmX7z2WvYj0+39IceVpFqbsC33qjY9DeDs=;
 b=kZa9AENE8ak079fF2oT2DhGL9nwJPS/uum0g/Ew/6XjHirgehr1c6zsQmjHBBqz0hR
 UeD1F6KJxwtu/GTV1UTU20v1m50HGMPRchJbo9pZkAMeNahkMh3jaHDPlMzQ4ur1SDMV
 fFU+bSEiQ216YWlr+qjT2oDxhWTvcKRSSQrkEphp8mYaPDM1RuaNU+1urtxbkmoSx2D1
 TV/9YKg0QpXYTk5kEe0omKJbHPrZf/ucjPq4zQ2FfKQC7jKwV44OZao4H8/KDUm04Fei
 ZcuIqfRd1fC+gKsZ8lBTsirJsakT164Ac+g6ws4n87LK8go0pm+w6q7IjtNe4cHUrAq5
 CaJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeb4eWXQpFxcMOETZqTGOG7vNzFTwd5tVPn8a7sujVPwKh/sGJj59OIWr9L70p5GXSTrr3xLMasag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxioz8CvmjLvP7ka33QVIuDWA0OGVexYlqMKGXzgZXk6DoWECk
 6Njn4Za79RPLqRkE3DoovMewH/LC94M7rUyxSQ01qVqepSnO3dHG7vAntD1AK1s=
X-Google-Smtp-Source: AGHT+IHz1nhV2KxAfDSiXWpgPQjKyE1ZPc/R8nYAOHH2oKM6WUs3Sw/08dL41DzBItcxC9nvMo2Xmg==
X-Received: by 2002:adf:e386:0:b0:374:af19:7992 with SMTP id
 ffacd0b85a97d-37efcee8c34mr6359642f8f.7.1729847111698; 
 Fri, 25 Oct 2024 02:05:11 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058bb4461sm980136f8f.113.2024.10.25.02.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 02:05:11 -0700 (PDT)
Message-ID: <ca23d4c5-74ff-4d1d-ace0-72ecd51aa527@ursulin.net>
Date: Fri, 25 Oct 2024 10:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
 <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
Content-Language: en-GB
In-Reply-To: <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
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


On 25/10/2024 09:59, Tvrtko Ursulin wrote:
> 
> On 24/10/2024 13:41, Christian König wrote:
>> Reports indicates that some userspace applications try to merge more than
>> 80k of fences into a single dma_fence_array leading to a warning from
>> kzalloc() that the requested size becomes to big.
>>
>> While that is clearly an userspace bug we should probably handle that 
>> case
>> gracefully in the kernel.
>>
>> So we can either reject requests to merge more than a reasonable 
>> amount of
>> fences (64k maybe?) or we can start to use kvzalloc() instead of 
>> kzalloc().
>> This patch here does the later.
> 
> Rejecting would potentially be safer, otherwise there is a path for 
> userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
> ("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) and 
> spam dmesg at will.

Actually that is a WARN_ON_*ONCE* there so maybe not so critical to 
invent a limit. Up for discussion I suppose.

Regards,

Tvrtko

> 
> Question is what limit to set...
> 
> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: stable@vger.kernel.org
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>> b/drivers/dma-buf/dma-fence-array.c
>> index 8a08ffde31e7..46ac42bcfac0 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct 
>> dma_fence *fence)
>>       for (i = 0; i < array->num_fences; ++i)
>>           dma_fence_put(array->fences[i]);
>> -    kfree(array->fences);
>> -    dma_fence_free(fence);
>> +    kvfree(array->fences);
>> +    kvfree_rcu(fence, rcu);
>>   }
>>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
>> @@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int 
>> num_fences)
>>   {
>>       struct dma_fence_array *array;
>> -    return kzalloc(struct_size(array, callbacks, num_fences), 
>> GFP_KERNEL);
>> +    return kvzalloc(struct_size(array, callbacks, num_fences), 
>> GFP_KERNEL);
>>   }
>>   EXPORT_SYMBOL(dma_fence_array_alloc);
