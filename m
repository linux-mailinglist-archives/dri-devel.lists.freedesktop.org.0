Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA21C6A7B8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 17:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7E210E4F0;
	Tue, 18 Nov 2025 16:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="fUNccxNC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A7210E4EE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 16:03:52 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so38158155e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763481831; x=1764086631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NPy7MtRGfLlvM770xBVrc8IbPL912/1L/AULTvqcMyg=;
 b=fUNccxNCDfvOexIOEQ+5uB/HfaSEOPW1K+S0LBe+aoJRYL/dmrhLA9TS68EcU3iYrg
 ocSOOByfG1PC+6Yt/CeMKZ7JjjZiOVE+2nx4e7ikTqChfzxmVtA+lynlkzR2bNVE2nvk
 vFfa0Uhd5sMgyCq4RaUNehKv2Qbu1kG6eMWmNcNfFPbfAW1yLc3dsS1HKDy377G1DoK2
 T/JfdKbT9heEwgFa5VoGWbZwQ4BQPAZz5bVA7csdf6oQ2V/YwZ5ah/nOiIHyqR8YAUvB
 Kj3MpwTnQOVq60LaWSW2KYan1Dg7c1UlH2APFgHdH09RxsEOHYceQTiMPdWII9Gh65j6
 Kp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763481831; x=1764086631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPy7MtRGfLlvM770xBVrc8IbPL912/1L/AULTvqcMyg=;
 b=FauaxhwH9kg6D64olQBIo1NNkB49Vc3j/yI6ZWt7mCMZUPpSrCAQagrw68KahM69A8
 XIRH3EgBr1If1hRkjhxeX74f97EaMm48Mf7XADoGXRAiLy7C5rEw1TKmUiLAMujl6ip6
 YMDTdc7oUYqR0T5SaBBk48EipUG8bTMldPiA7q1S3Cq+K7qMjjTPoSl/RdRDZl0Rk+aV
 4SbTMEHozZbz4xRCCJZo4ZOuTBVMd4TA4QY4xtcqwM0yJU0fi8uVu0IZmETgqdMh43Ik
 I839QVpjeFbkLaVq15piRb7xMYDP5CveeevMImDljf1M653wNl6wPoqMBR8230wn/its
 xUOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxbH3/ClOHc+uEROh4tCA/Dev6qUcxsVQnfVk6iVaxCqiDzkT8eXubcHFd52NMB5b38Gsz97T0za4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+BMzrJaiW7a/cL4zRtKJb8i6yodH9fvVlY2OkBd9Z7VZIJNY0
 AzGB8Hv16QSitpjD0jvpBPgP12MNQgL+wRm6gkm2RjdQi/tmmuAh19LvyVz9qNb8Il8=
X-Gm-Gg: ASbGncuxr5cY1WkLjhI3Zk+P0yhHJ7/rfUU0g0VjvXivJEVgKQzKKPwrQU89tsrtQO/
 WxrF7tJDfQwsuFvU9Okd7DKKCK1C1+CmBZnICM0ZBI0OZvnLILKRVvP/GV/tNQQoiflFCmQOxoT
 YmqRC8n4i0XsGRWVWVaQpoDYC48nVCEawEwlZKh06vdMuFSq2DrMRtyXQjc5iu16T0Rox81Se4q
 6HWh5ZmWcTFlFmMMn1u6bBy2Up2OaK7gOpX16E9ZBCdmskI8o1c7F6qlcbFUuFjaaKaLXZLJvFp
 k0R/0HW1Xl4hgpzpYBKo3H39Jj82QbmjlMkbyHCAEaytE+i/2409tudTETosxoPMWvSYQkZjU2N
 gZTzhwlueeADHMmuU3oZEMy3W4iN1EvuhXXq5J8jGRU7ieSiaGzvDisODoP8gaeBk5S8HrN/qsO
 BDaEDB4STyrqbMIOLg1yNgzHrv+8u0MGUm
X-Google-Smtp-Source: AGHT+IGysRbMzbECL6E+MizQEQGrtqhmQyxOI0y7D4OkZygIod9v97e1L6AKbj5saKClh+dNolGEFw==
X-Received: by 2002:a05:600c:4695:b0:477:63b4:ef7a with SMTP id
 5b1f17b1804b1-4778feaa8a1mr139503735e9.20.1763481830363; 
 Tue, 18 Nov 2025 08:03:50 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a973390csm20979025e9.4.2025.11.18.08.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 08:03:49 -0800 (PST)
Message-ID: <ed7595b4-b6e4-4a7f-ad35-e3a3cf063e72@ursulin.net>
Date: Tue, 18 Nov 2025 16:03:48 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <35d7ab6c-bd4d-4267-8ae1-2637d6c0f1ff@amd.com>
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


On 18/11/2025 14:28, Christian König wrote:
> On 11/14/25 11:50, Tvrtko Ursulin wrote:
>>> @@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
>>>            spin_unlock_irqrestore(fence->lock, flags);
>>>        }
>>>    -    rcu_read_unlock();
>>> -
>>> -    if (fence->ops->release)
>>> -        fence->ops->release(fence);
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (ops->release)
>>> +        ops->release(fence);
>>>        else
>>>            dma_fence_free(fence);
>>> +    rcu_read_unlock();
>>
>> Risk being a spin lock in the release callback will trigger a warning on PREEMPT_RT. But at least the current code base does not have anything like that AFAICS so I guess it is okay.
> 
> I don't think that this is a problem. When PREEMPT_RT is enabled both RCU and spinlocks become preemptible.
> 
> So as far as I know it is perfectly valid to grab a spinlock under an rcu read side critical section.

Looking at the source just now, I think it is possible I mixed it up 
with preempt_disable()+spin_lock().
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 64639e104110..77f07735f556 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -66,7 +66,7 @@ struct seq_file;
>>>     */
>>>    struct dma_fence {
>>>        spinlock_t *lock;
>>> -    const struct dma_fence_ops *ops;
>>> +    const struct dma_fence_ops __rcu *ops;
>>>        /*
>>>         * We clear the callback list on kref_put so that by the time we
>>>         * release the fence it is unused. No one should be adding to the
>>> @@ -218,6 +218,10 @@ struct dma_fence_ops {
>>>         * timed out. Can also return other error values on custom implementations,
>>>         * which should be treated as if the fence is signaled. For example a hardware
>>>         * lockup could be reported like that.
>>> +     *
>>> +     * Implementing this callback prevents the BO from detaching after
>>
>> s/BO/fence/
>>
>>> +     * signaling and so it is mandatory for the module providing the
>>> +     * dma_fence_ops to stay loaded as long as the dma_fence exists.
>>>         */
>>>        signed long (*wait)(struct dma_fence *fence,
>>>                    bool intr, signed long timeout);
>>> @@ -229,6 +233,13 @@ struct dma_fence_ops {
>>>         * Can be called from irq context.  This callback is optional. If it is
>>>         * NULL, then dma_fence_free() is instead called as the default
>>>         * implementation.
>>> +     *
>>> +     * Implementing this callback prevents the BO from detaching after
>>
>> Ditto.
> 
> Both fixed, thanks.
> 
>>
>>> +     * signaling and so it is mandatory for the module providing the
>>> +     * dma_fence_ops to stay loaded as long as the dma_fence exists.
>>> +     *
>>> +     * If the callback is implemented the memory backing the dma_fence
>>> +     * object must be freed RCU safe.
>>>         */
>>>        void (*release)(struct dma_fence *fence);
>>>    @@ -418,13 +429,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>>>    static inline bool
>>>    dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>    {
>>> +    const struct dma_fence_ops *ops;
>>> +
>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>            return true;
>>>    -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> +    rcu_read_lock();
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (ops->signaled && ops->signaled(fence)) {
>>> +        rcu_read_unlock();
>>>            dma_fence_signal_locked(fence);
>>>            return true;
>>>        }
>>> +    rcu_read_unlock();
>>>          return false;
>>>    }
>>> @@ -448,13 +465,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>    static inline bool
>>>    dma_fence_is_signaled(struct dma_fence *fence)
>>>    {
>>> +    const struct dma_fence_ops *ops;
>>> +
>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>            return true;
>>>    -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> +    rcu_read_lock();
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (ops->signaled && ops->signaled(fence)) {
>>> +        rcu_read_unlock();
>>
>> With the unlocked version two threads could race and one could make the fence->lock go away just around here, before the dma_fence_signal below will take it. It seems it is only safe to rcu_read_unlock before signaling if using the embedded fence (later in the series). Can you think of a downside to holding the rcu read lock to after signaling? that would make it safe I think.
> 
> Well it's good to talk about it but I think that it is not necessary to protect the lock in this particular case.
> 
> See the RCU protection is only for the fence->ops pointer, but the lock can be taken way after the fence is already signaled.
> 
> That's why I came up with the patch to move the lock into the fence in the first place.

Right. And you think there is nothing to gain with the option of keeping 
the rcu_read_unlock() to after signalling? Ie. why not plug a potential 
race if we can for no negative effect.

Regards,

Tvrtko

>> Regards,
>>
>> Tvrtko
>>
>>>            dma_fence_signal(fence);
>>>            return true;
>>>        }
>>> +    rcu_read_unlock();
>>>          return false;
>>>    }
>>
> 

