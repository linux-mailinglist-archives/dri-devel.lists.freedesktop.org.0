Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54FBE461B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94C10E073;
	Thu, 16 Oct 2025 15:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="q0HeWPnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566C410EA2E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 15:57:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-471131d6121so6993525e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760630259; x=1761235059;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0ILIfXRJsUxZXhrCDor+YP2U09ZqnXIHrajm0QpBgi4=;
 b=q0HeWPnHv9ewOnmm65tUjzLAi7HwUi+ra50BnAW4Ai7lLvqHfC7eUBOt/wcw/Zio65
 BIkLj6lckH2XBt95n4IBpTga93hikDMbMXH0jG6zNnUndSz3DI0V3QYYM4qTY1ZgBJ8v
 /kLC7RPKy3Q2CPr9rWPm6M58GdvhITxmH8StIK5ly5klhMdAiO19+dwt+bGRvFPS59Bd
 fuliJcEvnLccfze/svAkInh88gD8OweFGxst7AdyRYbHjBjh1jlV68TFqTKkNCIVr1G0
 NwuI1iWUKOgsrShLSmGPtPjSb3Rl8mafcocksoo9Mmy4gtLP3+NNYGjLhJ7QlXlFyQpc
 vOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760630259; x=1761235059;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ILIfXRJsUxZXhrCDor+YP2U09ZqnXIHrajm0QpBgi4=;
 b=cskhOW5ci+rOJ6/qobtdWcnEcr2DrT1TgCDEcFS44EGQUJBZUgTLHfBMwrTEFCsJLV
 gklj2HAkuWwDUwjWOwHFKVVPvGMdJ2v8tVaUu1epCscHJj5uzdDlE5BaKqaRxGJLQIWr
 L58FjjWp4FoOoburBd387STgtdFdzwmRG+XExCFosJSbyx7uxpJJ1PtJ3dBTgzsWo1CW
 p8tMKsssdHKpdxkhDGsFrjmhyImDH3PXcoS8liEMRgwKH+Hqltz1VUU0wHQSWs//B294
 vKnrn84ERJZhHIyR1srvtuP5ryF1BXXqHJvfXOKgmORmVLjdHjAq37Wir0Iy1h15OV1v
 OqwQ==
X-Gm-Message-State: AOJu0Ywo8R7giReKnZp211gJWAbK+EW2fPzjJ/X4pfO5g9rrlZqhFhdx
 uDf+cdL3FtFRukuNJMCSHVPr65WOiloRE1szNzo25Rp09L2t6hTUhOSvhCpWMLYJYgg=
X-Gm-Gg: ASbGncst6Fnltbl3OAQoOeHz9qAT28wXrL79PLCLZBaOMjK1qKGRpN8Af1Qn9TrEAl8
 NYY2vU/yU6wkWvcafWkIwrDXwgZ0GK3AiQOP+cwFozGgaqOqs/jGM2cG6L7wagBLV8MwnYdMeS2
 oxkxKWL2i5G18Rvgji/3ZWiloEppnX6q0RxBsg8mmLqgOlcqa7hMyGP+z4l2peqxAlXzSA6zPrF
 eLv6enB/RwGJfD5tRRZikFsz4LQeWYkEOwZPnUXIqYYVzGlEzBmMG1p0FW3nf8Ok/42NqDOwEch
 77aXf474wehj3RmH+XlFMRXBuX9DxLibo0T95sMwJz5XKoRvpnsfxzrZRMQr/z4xG3bYBlNvIh6
 CJYS2R24/IboNoiP2BCoF31JlYdpT3vwL3Yca8bi3UE/NiO1FFtJQ2Vr818eDz7qi/Tvcf/V6GN
 X2YfPPnxEX7CPpMOc=
X-Google-Smtp-Source: AGHT+IF2VSlDCRVmqOrc7Eq0CBMtRQB5YvQerCB2FT5AEVTbohitqAFQBhhTJz8LAW2lgMNIOIuIzQ==
X-Received: by 2002:a05:600c:37c7:b0:471:12ef:84be with SMTP id
 5b1f17b1804b1-47117900c2dmr3465495e9.22.1760630258280; 
 Thu, 16 Oct 2025 08:57:38 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144b5c34sm38753535e9.10.2025.10.16.08.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 08:57:37 -0700 (PDT)
Message-ID: <23bafbad-fcc9-4baa-9bd5-d4ea37c397f3@ursulin.net>
Date: Thu, 16 Oct 2025 16:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] dma-buf: detach fence ops on signal
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-5-christian.koenig@amd.com>
 <d5ea9ed0-d599-4b9f-92c8-a2e711371017@ursulin.net>
Content-Language: en-GB
In-Reply-To: <d5ea9ed0-d599-4b9f-92c8-a2e711371017@ursulin.net>
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


On 16/10/2025 09:56, Tvrtko Ursulin wrote:
> 
> On 13/10/2025 14:48, Christian König wrote:
>> When neither a release nor a wait operation is specified it is possible
>> to let the dma_fence live on independent of the module who issued it.
>>
>> This makes it possible to unload drivers and only wait for all their
>> fences to signal.
> 
> Have you looked at whether the requirement to not have the release and 
> wait callbacks will exclude some drivers from being able to benefit from 
> this?

I had a browse and this seems to be the situation:

Custom .wait:
  - radeon, qxl, nouveau, i915

Those would therefore still be vulnerable to the unbind->unload 
sequence. Actually not sure about qxl, but other three are PCI so in 
theory at least. I915 at least supports unbind and unload.

Custom .release:
  - vgem, nouveau, lima, pvr, i915, usb-gadget, industrialio, etnaviv, xe

Out of those there do not actually need a custom release and could 
probably be weaned off it:
  - usb-gadget, industrialio, etnaviv, xe

(Xe would lose a debug assert and some would have their kfrees replaced 
with kfree_rcu. Plus build time asserts added the struct dma-fence 
remains first in the respective driver structs. It sounds feasible.)

That would leave us with .release in:
  - vgem, nouveau, lima, pvr, i915

Combined list of custom .wait + .release:
  - radeon, qxl, nouveau, i915, lima, pvr, vgem

 From those the ones which support unbind and module unload would remain 
potentially vulnerable to use after free.

It doesn't sound great to only solve it partially but maybe it is a 
reasonable next step. Where could we go from there to solve it for everyone?

Regards,

Tvrtko

>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
>>   include/linux/dma-fence.h   |  4 ++--
>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 982f2b2a62c0..39f73edf3a33 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct 
>> dma_fence *fence,
>>                         &fence->flags)))
>>           return -EINVAL;
>> +    /*
>> +     * When neither a release nor a wait operation is specified set 
>> the ops
>> +     * pointer to NULL to allow the fence structure to become 
>> independent
>> +     * who originally issued it.
>> +     */
>> +    if (!fence->ops->release && !fence->ops->wait)
>> +        RCU_INIT_POINTER(fence->ops, NULL);
>> +
>>       /* Stash the cb_list before replacing it with the timestamp */
>>       list_replace(&fence->cb_list, &cb_list);
>> @@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, 
>> bool intr, signed long timeout)
>>       rcu_read_lock();
>>       ops = rcu_dereference(fence->ops);
>>       trace_dma_fence_wait_start(fence);
>> -    if (ops->wait) {
>> +    if (ops && ops->wait) {
>>           /*
>>            * Implementing the wait ops is deprecated and not supported 
>> for
>>            * issuer independent fences, so it is ok to use the ops 
>> outside
>> @@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
>>       }
>>       ops = rcu_dereference(fence->ops);
>> -    if (ops->release)
>> +    if (ops && ops->release)
>>           ops->release(fence);
>>       else
>>           dma_fence_free(fence);
>> @@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct 
>> dma_fence *fence)
>>       rcu_read_lock();
>>       ops = rcu_dereference(fence->ops);
>> -    if (!was_set && ops->enable_signaling) {
>> +    if (!was_set && ops && ops->enable_signaling) {
>>           trace_dma_fence_enable_signal(fence);
>>           if (!ops->enable_signaling(fence)) {
>> @@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence 
>> *fence, ktime_t deadline)
>>       rcu_read_lock();
>>       ops = rcu_dereference(fence->ops);
>> -    if (ops->set_deadline && !dma_fence_is_signaled(fence))
>> +    if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>>           ops->set_deadline(fence, deadline);
>>       rcu_read_unlock();
>>   }
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 38421a0c7c5b..e1ba1d53de88 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>       rcu_read_lock();
>>       ops = rcu_dereference(fence->ops);
>> -    if (ops->signaled && ops->signaled(fence)) {
>> +    if (ops && ops->signaled && ops->signaled(fence)) {
>>           rcu_read_unlock();
>>           dma_fence_signal_locked(fence);
>>           return true;
>> @@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>>       rcu_read_lock();
>>       ops = rcu_dereference(fence->ops);
>> -    if (ops->signaled && ops->signaled(fence)) {
>> +    if (ops && ops->signaled && ops->signaled(fence)) {
>>           rcu_read_unlock();
>>           dma_fence_signal(fence);
>>           return true;
> 

