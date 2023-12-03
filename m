Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1D8021A1
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 09:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE83B10E26E;
	Sun,  3 Dec 2023 08:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A9710E26E;
 Sun,  3 Dec 2023 08:12:06 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-27fe16e8e02so636134a91.0; 
 Sun, 03 Dec 2023 00:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701591126; x=1702195926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o/vcuqZ4fJLLKaosyQPQg2UkPXyexycK32D3E42tjTI=;
 b=m/4PW/pER7mLQMNkJy/QvGCNmGHk7EWUy3L389JH5/vfzbri0nc63TmXL4951Pnxsj
 S8Y5UHPGfm+Ssb5uA17jd7evwKIWjtM75+VQioXF+rzyBzBF+KSSICxZ6HtEgao0QR71
 ohKz1VLmMSkY43fr4sANtW0peIb69ADfPN16kSfuORHiIEivvTzk26iTbxje6ECEUgxM
 HJ0pB5C/yPLYuZSmDMpRCH9okoFtYspPg7XxXmohvZJGE3GkeQkDeE9nmlO3VEwoTufj
 4MbXCqGsDm1//GZ9pnYXr2mJO+UPItij1wIu+P4BjXw8SyAUmAfEL6qvZ2WwkIWDcNrt
 mJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701591126; x=1702195926;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o/vcuqZ4fJLLKaosyQPQg2UkPXyexycK32D3E42tjTI=;
 b=tEsEvkv8MsTslBIvm4PVH2rUDW9TEyh407KGMBvTKjLcK1rlxXElq5HOvAA7N57S3a
 A6KzDDA8H5fCoDCd78drhMg66CVTu3IMN4AE2o7uBwd0gq98MJfX8tfMfqC4WA0VUfnv
 3/Gcs62tTZRnxm+XxHtRKGMLY2XNK7ssR1nML9YH0q1kEPT4iDg/UKdUtbaYtglOAxEw
 0xUMHJODNQGHU8C518qvl4/S9I816TQfauOH7UaqnJGcIALLOPU0xG8u5SMFRHyjhv2B
 STQvgFXrAHOWMhXgd/07oWhUQa8Ib19VwZ5SdDJRb8vMGUsB/FaS/6VlJDhKkGRfQKK8
 yrSw==
X-Gm-Message-State: AOJu0Yzacc4ol5wXwHUOxDznajjgQI0UpSL4kfRRdodM0+1lKvF3Qs6i
 dAP2+f/CK69CZ0pFG3Fj7F0=
X-Google-Smtp-Source: AGHT+IE6jDWJnhDlocs06VpaYFk7tPb3o8MK+SewA2ckAVy/M4/ZakP8Bj6Mei+J9VnyXmmjhg+BTQ==
X-Received: by 2002:a17:903:2308:b0:1ce:63bf:e4c9 with SMTP id
 d8-20020a170903230800b001ce63bfe4c9mr34229294plh.0.1701591126293; 
 Sun, 03 Dec 2023 00:12:06 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
 by smtp.gmail.com with ESMTPSA id
 ay7-20020a1709028b8700b001acae9734c0sm6216064plb.266.2023.12.03.00.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 00:12:05 -0800 (PST)
Message-ID: <b5b06804-a8a1-44d9-8e85-063d2cca2f91@gmail.com>
Date: Sun, 3 Dec 2023 13:41:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver: gpu: Fix warning directly dereferencing a rcu
 pointer
To: Danilo Krummrich <dakr@redhat.com>
References: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
 <f5a69710-f1a6-444d-9d2a-7c07589a2bdc@redhat.com>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <f5a69710-f1a6-444d-9d2a-7c07589a2bdc@redhat.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/30/23 05:22, Danilo Krummrich wrote:
> Hi Abhinav,
> 
> Thanks for sending this follow-up patch.
> 
> On 11/26/23 15:57, Abhinav Singh wrote:
>> Fix a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
>>
>> We should not be directly dereferencing a rcu pointer. To get a normal
>> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
>> function unrcu_pointer(...). The non __rcu tagged pointer then can be
>> dereferenced just like a normal pointer.
> 
> Can you please add a brief explanation why unrcu_pointer() is fine here?
Is this description okay
"The reason for using unrcu_pointer(...) instead of rcu_dereference(...)
or rcu_dereference_protected(...) is because, before nv10_fence_emit() 
and nv_04_fence_emit() did not add this fence to the fence context's
pending list, thus channel doesn't need any protection" ?
> 
>>
>> I tested with qemu with this command
>> qemu-system-x86_64 \
>>     -m 2G \
>>     -smp 2 \
>>     -kernel bzImage \
>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial 
>> net.ifnames=0" \
>>     -drive file=bullseye.img,format=raw \
>>     -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
>>     -net nic,model=e1000 \
>>     -enable-kvm \
>>     -nographic \
>>     -pidfile vm.pid \
>>     2>&1 | tee vm.log
>> with lockdep enabled.
> 
> How is that relevant for this patch?
> 
> - Danilo
To test rcu related code lockdep must be enabled, it gives any warning 
or error message if we are dealing inappropriately with rcu pointers. So 
I tested this lockdep enabled. I added the test description in this 
patch as well 
https://lore.kernel.org/all/0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com/ 
which is very similar to this patch so I thought I should here as well. 
Is it not relevant here?

Thank You,
Abhinav Singh
> 
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nv10_fence.c | 2 +-
>>   drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c 
>> b/drivers/gpu/drm/nouveau/nv10_fence.c
>> index c6a0db5b9e21..845b64c079ed 100644
>> --- a/drivers/gpu/drm/nouveau/nv10_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv10_fence.c
>> @@ -32,7 +32,7 @@
>>   int
>>   nv10_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nvif_push *push = fence->channel->chan.push;
>> +    struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>>       int ret = PUSH_WAIT(push, 2);
>>       if (ret == 0) {
>>           PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
>> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c 
>> b/drivers/gpu/drm/nouveau/nv84_fence.c
>> index 812b8c62eeba..d42e72e23dec 100644
>> --- a/drivers/gpu/drm/nouveau/nv84_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv84_fence.c
>> @@ -85,7 +85,7 @@ nv84_fence_chid(struct nouveau_channel *chan)
>>   static int
>>   nv84_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nouveau_channel *chan = fence->channel;
>> +    struct nouveau_channel *chan = unrcu_pointer(fence->channel);
>>       struct nv84_fence_chan *fctx = chan->fence;
>>       u64 addr = fctx->vma->addr + nv84_fence_chid(chan) * 16;
> 

