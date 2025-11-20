Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62010C74725
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971D010E74D;
	Thu, 20 Nov 2025 14:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Ytnbh0pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58C510E74D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:08:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so7805675e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763647697; x=1764252497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JXstQUEqL/bZuziJRZPRZ2cDQPTUDlyNI00lh/nMSWI=;
 b=Ytnbh0pv7w8Fv7FgnMv7MbNrD3zx4sIegB39FXI5dWouaPNuMZpKt0eQRroOEPwbAJ
 1SZQrVl0saJbDUsHjiMLsSqDkPHRU/6RLs9O/sykuUm7PtGoWw6xjRGbeWbmpRJUSmC8
 +jXf/oxpjI+UqO1pXLi+o9mgUxFCeDVSEt+EbTTRgAZHPTd09zxHGL+tQ1E+HEdH3UWJ
 XULmVyIpWspA+GWZ0pd2B0dXqOMGSjC8laTf/HHhTJ9Y19v2HNOiLMjTsz1CQRUOcmrZ
 0Uk2bRydn+Mz1Yr7uASXlqOX1Blj9tjtpF+m5y5vX26cJc/dJtY6BApd/PfrBshXBkuT
 kQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763647697; x=1764252497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXstQUEqL/bZuziJRZPRZ2cDQPTUDlyNI00lh/nMSWI=;
 b=s/XLuT6q0ZyavzEgvLZ4n1K2nv3Qt/C0d3p8k2+Rw/5Jj5hyRwM2DJCvwVIoP4KyoW
 r+fyRt035UMi3Q3TUJusNGV6lyMeE1oSbWghkHGtgQXS7PerTwo/5z8OgZf/pMr6JKAQ
 u5cS/a7zE4Au2mRDWL0nTC+e/E556YmjIbZ8p+iPf/4j8nRQbdypEqEQOrs7XZwVhU8s
 38lQPM08hTrQ6OpKwMbyMHIFlBd8CTIupmLjCbvfskxccLq0w3tIgL2PE/DpirLAzvMy
 RHyV3o126iT49eVj3B76zm8YvegWMr5/w3SN/eALe1D1GHwR5k9GPD5dNV6w41J5uMPd
 ECtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqkbHGwxHQtpMW+dcqK014u74JvLNv6NNVhWc/LZPctvfF0elgYTYI2RhKa3oy3QCkqT2TDVFpPOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWH84v3zEjCAkGaL4L+ApPmYeeBPWTo5ugJ6maP5FA7BDeZal5
 QOtEIXkNzSeVNAFC5ZMahfAVf/vzcDKfMFV4HtTFpWV2yMg1N1HZgo/xWaNXIjrcebM=
X-Gm-Gg: ASbGncuuXEQQp6G1OmVx0PdQlAUgOakKkunDmlUXyXO2jJJ7rA4DVOvMbPHTY6YiMwa
 Slo3DIIYk3TthaUEFtjlTIkZyZ7qBJWLrbXGoueY4zqpiVJ6WNs2hdV+PwJPxqg7hVyUpwwlfG2
 6W1E78Y/qd3TM/aR84Pfm/KPkv4ld5kjwOWBYmKOcTfIboQ6ddeN8ZKfj1pXrV5EZGBIf1BIpNW
 04YCpUeLd+u5KSGIG/zj/4atfT4f+o64hpLm/NWW7QnbygCCUoDnRxSLEl8k8xUwkszMWrZanGd
 XUEkLoqeG+F6iMIF2ff1q0e3LOb3G0ibEoQnlO38cztjiGrXZ9fg6WTr4dafTB/c0GNg48RXskE
 p/Dk0N0dUh46JbOHSDgU7ICUFgOdCceX/78LPCLidiGLxF6Eps8NffUpOXqChhOYcLL2k0pnJOu
 1FKv7Hb6zRDzM1T/r1KOwOC3ZZQUcRCq0H
X-Google-Smtp-Source: AGHT+IGiYICzT0SiSdJ79J+OFCjv7rFWlIQ83a4GvCv8TxbMfVeiavtPjbFnDFmUN/8OlFIRX6N7Lg==
X-Received: by 2002:a05:600c:4704:b0:477:7d94:5d0e with SMTP id
 5b1f17b1804b1-477b8a9ab58mr30259805e9.27.1763647696641; 
 Thu, 20 Nov 2025 06:08:16 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b82d8023sm51152575e9.4.2025.11.20.06.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 06:08:16 -0800 (PST)
Message-ID: <1036b926-a874-443a-a1bb-78c7889e7895@ursulin.net>
Date: Thu, 20 Nov 2025 14:08:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] dma-buf: protected fence ops by RCU v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-3-christian.koenig@amd.com>
 <ef0f9459-6733-4e0a-9c06-c36c02e5a93c@ursulin.net>
 <35d7ab6c-bd4d-4267-8ae1-2637d6c0f1ff@amd.com>
 <ed7595b4-b6e4-4a7f-ad35-e3a3cf063e72@ursulin.net>
 <7e436158-41ed-4c4b-a0e1-7d4bf03e3499@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <7e436158-41ed-4c4b-a0e1-7d4bf03e3499@amd.com>
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


On 20/11/2025 14:03, Christian König wrote:
> On 11/18/25 17:03, Tvrtko Ursulin wrote:
>>>>> @@ -448,13 +465,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>>     static inline bool
>>>>>     dma_fence_is_signaled(struct dma_fence *fence)
>>>>>     {
>>>>> +    const struct dma_fence_ops *ops;
>>>>> +
>>>>>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>>             return true;
>>>>>     -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>>> +    rcu_read_lock();
>>>>> +    ops = rcu_dereference(fence->ops);
>>>>> +    if (ops->signaled && ops->signaled(fence)) {
>>>>> +        rcu_read_unlock();
>>>>
>>>> With the unlocked version two threads could race and one could make the fence->lock go away just around here, before the dma_fence_signal below will take it. It seems it is only safe to rcu_read_unlock before signaling if using the embedded fence (later in the series). Can you think of a downside to holding the rcu read lock to after signaling? that would make it safe I think.
>>>
>>> Well it's good to talk about it but I think that it is not necessary to protect the lock in this particular case.
>>>
>>> See the RCU protection is only for the fence->ops pointer, but the lock can be taken way after the fence is already signaled.
>>>
>>> That's why I came up with the patch to move the lock into the fence in the first place.
>>
>> Right. And you think there is nothing to gain with the option of keeping the rcu_read_unlock() to after signalling? Ie. why not plug a potential race if we can for no negative effect.
> 
> I thought quite a bit over that, but at least of hand I can't come up with a reason why we should do this. The signaling path doesn't need the RCU read side lock as far as I can see.

Okay, and thanks, it indeed sounds right for the signalling path. Any 
races hitting this would mean a more serious problem in the driver 
implementation.

Regards,

Tvrtko

