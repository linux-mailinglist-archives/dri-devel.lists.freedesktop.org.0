Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9AF976CCD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86810EBC1;
	Thu, 12 Sep 2024 14:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBKvXpQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B74910EBC1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:55:47 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3787ddbd5a2so717758f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726152946; x=1726757746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CF7j2OK0jaMWO0GuJysJ5dfS9/D0kcEj03xpWw4OP/Q=;
 b=DBKvXpQ+0tegwLZ/30LG/lhy6zRcrwTjgZ6PsjNa2GjzMTjfy1FEDq4d0NJugRrqdW
 D6NJ9wX6hfIRQ/wKxX3UHC64nWrgHfGfv5hfogc1xc74ftSekbsa6aLdfqYtI9fGwK/I
 xfsM1t1TMadO6X3633Osdk6FvrfhQgfIto2MCV+KokktTSy6i0F5D9nCwgZ1ClurLzFl
 auu7FYBpG4qaXepeiewwCzPchKgpCNaPoWgRQBajeOpR9DlXr8bZZOlqm/LzXUJKc8Rq
 ovAoczt1RtyE7UMfbpkSjAw8uGV1ARTjm+Uz06Gs6gac8WmQF9RsefZD2mRFeOZWLaJu
 D1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726152946; x=1726757746;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CF7j2OK0jaMWO0GuJysJ5dfS9/D0kcEj03xpWw4OP/Q=;
 b=FfEnrFwzNi7fzsVHu5W9vCzHs1TQdOAf8vmDiuiSh9kB3EuS0qFr4m8jxtQfrZzv0N
 5M7mbw3OWEXUwHTLbn1n5UhtQhCIyE9/3kSWd7Q6JfcMzmXGVamB6fQc/Nek9WQ9mbIQ
 zzyEBEn7iFigXrq0X1l332qJbtO75OXoCYDObYr9U1YTyNs8sil62henLj5CFEXLFqBp
 skwgk8dU1kYkz0Tquvmzrr+1olkr/f2+SD6QyTublI5IFXVjEhQwRbjKMiOPagLoBpoy
 HeCGjhVXRlUbikhKFuvN1WLzIHYaW+xtZvd0KgNRRiB8CUqVM/U+erLRPAl0RT90UvfT
 0rFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh6U14oHSnsO4lhOV3rzYspZMciSXOWbghQnpuObIQNe/OyFNZWY1Hc2uk6ufV2CaVu7s6zFqTRLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGpgVX36WmSOE/TtzvSmBFjks6k+OoYRoZylA1PQSJeg2+iU4D
 lXSXogLnzrJ2qjVdSybD9E4VuYh2geyJXhbv6kWlIx/+RMFgQOM7
X-Google-Smtp-Source: AGHT+IF6XT309tTehkJ1r9a88nIFBhqP2rR9eZ8VYH7JIZwekPMagc3S+Dlyzxivva8xL08p/23C/Q==
X-Received: by 2002:a05:6000:4581:b0:374:c05f:231d with SMTP id
 ffacd0b85a97d-378c2a76541mr1797178f8f.0.1726152944994; 
 Thu, 12 Sep 2024 07:55:44 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a1absm14817360f8f.1.2024.09.12.07.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:55:44 -0700 (PDT)
Message-ID: <d8161fdb-411c-4a8f-bb2c-456d7bf6ebd7@gmail.com>
Date: Thu, 12 Sep 2024 16:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dma-buf: add WARN_ON() illegal dma-fence signaling
To: Philipp Stanner <pstanner@redhat.com>, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20240911085903.1496-1-christian.koenig@amd.com>
 <20240911085903.1496-2-christian.koenig@amd.com>
 <55b17b3e4af2ee28d44645535f0c8995c72f842c.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <55b17b3e4af2ee28d44645535f0c8995c72f842c.camel@redhat.com>
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

Am 11.09.24 um 11:44 schrieb Philipp Stanner:
> On Wed, 2024-09-11 at 10:58 +0200, Christian König wrote:
>> Calling the signaling a NULL fence is obviously a coding error in a
>> driver. Those functions unfortunately just returned silently without
>> raising a warning.
> Good catch
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-
>> fence.c
>> index 0393a9bba3a8..325a263ac798 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -412,7 +412,7 @@ int dma_fence_signal_timestamp(struct dma_fence
>> *fence, ktime_t timestamp)
>>   	unsigned long flags;
>>   	int ret;
>>   
>> -	if (!fence)
>> +	if (WARN_ON(!fence))
>>   		return -EINVAL;
> While one can do that, as far as I can see there are only a hand full
> of users of that function anyways.

The dma_fence_signal() function has tons of users, it's basically the 
core of the DMA-buf framework.

> Couldn't one (additionally) add the error check of
> dma_fenc_signal_timestapm() to those? Like in
> dma_fenc_allocate_private_stub().
>
> It seems some of them are void functions, though. Hm.
> There is also the attribute __must_check that could be considered now
> or in the future for such functions.

I actually want to remove the error return from dma_fence_signal() and 
the other variants. There is no valid reason that those functions should 
fail.

The only user is some obscure use case in AMDs KFD driver and I would 
rather like to clean that one up.

Regards,
Christian.

>
> Regards,
> P.
>
>
>>   
>>   	spin_lock_irqsave(fence->lock, flags);
>> @@ -464,7 +464,7 @@ int dma_fence_signal(struct dma_fence *fence)
>>   	int ret;
>>   	bool tmp;
>>   
>> -	if (!fence)
>> +	if (WARN_ON(!fence))
>>   		return -EINVAL;
>>   
>>   	tmp = dma_fence_begin_signalling();

