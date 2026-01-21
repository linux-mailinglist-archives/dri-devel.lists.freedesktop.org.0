Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMGNCWKWcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:03:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1454096
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF9D10E736;
	Wed, 21 Jan 2026 09:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="du5ufxhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BD710E731
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 09:03:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47ee4338e01so28143435e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 01:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768986205; x=1769591005; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tb8Mn8B23oXD3x5lo61XV5oiWaFxeJkWqEBxP3u53ow=;
 b=du5ufxhDgvYez0+wRDwkaLmOsVRf54QRMwvIgJVHUUDaIPoGYO7IIS/G7vPP6xmrsi
 v9VOHR8lVOcx+SJ694AVBEavTgRTKnogkFKA+DUTNeqv8gARNV8Ms5nMBs+YyJMVt1tp
 bDNkpCqjMq3Bw8sqQE5F2vOPODBv/xLk7M9WgsFVlH6OMT4G/m9hI7Vm2Uf9SEORqo59
 BeX2xuCmjlWg9lzWsJkX6Hm/Bwj9dwujDXsQTgIGFkIFbxZmpqVYrIgCnzf4wFgil5Tm
 gpRdO6zdhwxnkVPrZznWv+hUMBY89HD04APHl6tjkJ7DZzdH78DmION4qHW6AilV9wuP
 3dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768986205; x=1769591005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tb8Mn8B23oXD3x5lo61XV5oiWaFxeJkWqEBxP3u53ow=;
 b=mRbRGAhMV4jSrF/LbxSSjjcMv/mueVL7VfI4nSglLvdt2vIPicFv/B2p7NSdObH9ia
 yfn8Cy1hihSURRcnaesrsllNUCgEJhRKEGyURq4l8MTaJ3QJR/eY0B5Oudl6kvMG9Vns
 IBQAnJgeKLwJ6A8dfzrJpHzbzCec1y3XuopL26q4tn0LxNhbIEdlO50OQlmFnR9xZaoB
 KtIQjO6x2L5tuIO+ttZns89BXP0Us1O7zHcyzHMbXp3ZocTn9tlaHVMpq9JluiDhk0gI
 /X8x4HKmAjepB52o4Em+QMHYqOA3jSfUhnyShJ1CzImCXLk6mgK0HIsB9P9nak7A9xDx
 Xg6w==
X-Gm-Message-State: AOJu0YxbcXG/38B14iJeupgMmgdkISvVnsbBcsYyjS77dAVQLfMusH1K
 bLqQEQO/HNAjqa9v/y4sMtm1RR+q8duzkdPlq2GEbf3IVJnqlCGSXpNCd7AV/E/Z/VE=
X-Gm-Gg: AZuq6aLalLE3kfh/8iJcphvxHY4UfAnWhPvv0hRZ0R/1J1JwBJr8JScfota6QgQ/sOi
 d6KOzyjKBgXdum6ok/mFSGlBjO3oQx5/iGHhSvjjlRZWRXoYqXdXxI/HbxvtwCAcqGZ9RrNhPEX
 +xShSTJgYE4VDtw0rVmj8S1ZnqwUNPS0KHkSdNQ4TTjPPErM/Hgamc8q54OBe3n51R70MIYHq8Q
 SScYIUSanZM0aIfOcEIRE6YRE6vJiks8MjvMVoblQaTybEGw6aOQsqjkCgZi6AQTxOFebMqImYW
 1uySplE9P5117eWGzjrmhv+yAUSQqnI8lm/9bGtgEPWFjx0jggb82HNx8mQFhDLyShMxbbGGOGu
 3Di1d8QiTSfRKBYgoJ0tZpJ69zkbuNy0IhZaBSghqQi9DYV176AOiO0hyfJzeLO8Cb/NADoJGq/
 gBQiFyagzpmGLzN6rGBTwikeyqK0oYAvax
X-Received: by 2002:a05:600c:1552:b0:477:63a4:88fe with SMTP id
 5b1f17b1804b1-4801eab9de6mr188120905e9.2.1768986205218; 
 Wed, 21 Jan 2026 01:03:25 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c3dbd8sm15321305e9.10.2026.01.21.01.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 01:03:24 -0800 (PST)
Message-ID: <a478f6b8-e0d9-4dcb-8372-4673a7f75571@ursulin.net>
Date: Wed, 21 Jan 2026 09:03:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dma-buf: inline spinlock for fence protection v4
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260120105655.7134-1-christian.koenig@amd.com>
 <20260120105655.7134-6-christian.koenig@amd.com>
 <5de308d9-9ed9-4ae7-8b0e-1ec53282c5e9@ursulin.net>
 <4e5c0b99-bbc1-4785-bee8-52b82d696d59@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <4e5c0b99-bbc1-4785-bee8-52b82d696d59@amd.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Queue-Id: 82A1454096
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 21/01/2026 08:48, Christian König wrote:
> On 1/20/26 12:41, Tvrtko Ursulin wrote:
>>
>> On 20/01/2026 10:54, Christian König wrote:
>>> Implement per-fence spinlocks, allowing implementations to not give an
>>> external spinlock to protect the fence internal statei. Instead a spinlock
>>> embedded into the fence structure itself is used in this case.
>>>
>>> Shared spinlocks have the problem that implementations need to guarantee
>>> that the lock live at least as long all fences referencing them.
>>>
>>> Using a per-fence spinlock allows completely decoupling spinlock producer
>>> and consumer life times, simplifying the handling in most use cases.
>>>
>>> v2: improve naming, coverage and function documentation
>>> v3: fix one additional locking in the selftests
>>> v4: separate out some changes to make the patch smaller,
>>>       fix one amdgpu crash found by CI systems
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/dma-buf/dma-fence.c             | 25 +++++++++++++++++-------
>>>    drivers/dma-buf/sync_debug.h            |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  2 +-
>>>    drivers/gpu/drm/drm_crtc.c              |  2 +-
>>>    drivers/gpu/drm/drm_writeback.c         |  2 +-
>>>    drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
>>>    drivers/gpu/drm/qxl/qxl_release.c       |  3 ++-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   |  3 ++-
>>>    drivers/gpu/drm/xe/xe_hw_fence.c        |  3 ++-
>>
>> i915 needed changes too, based on the kbuild report.
> 
> Going to take a look now.
>   
>> Have you seen my note about the RCU sparse warning as well?
> 
> Nope, I must have missed that mail.

No worries, it was this one:

https://lore.kernel.org/dri-devel/d74dec32-82ef-471f-b04c-2f97971e1f2a@ursulin.net/

> ...
>>>    +/**
>>> + * dma_fence_spinlock - return pointer to the spinlock protecting the fence
>>> + * @fence: the fence to get the lock from
>>> + *
>>> + * Return either the pointer to the embedded or the external spin lock.
>>> + */
>>> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
>>> +{
>>> +    return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
>>> +        &fence->inline_lock : fence->extern_lock;
>>> +}
>>
>> You did not want to move this helper into "dma-buf: abstract fence locking" ?
> 
> I was avoiding that to keep the pre-requisite patch smaller, cause this change here seemed independent to that.
> 
> But thinking about it I could make a third patch which introduces dma_fence_spinlock() and changes all the container_of uses.
> 
>> I think that would have been better to keep everything mechanical in one patch, and then this patch which changes behaviour does not touch any drivers but only dma-fence core.
>>
>> Also, what about adding something like dma_fence_container_of() in that patch as well?
> 
> I would rather like to avoid that. Using the spinlock pointer with container_of seemed to be a bit of a hack to me in the first place and I don't want to encourage people to do that in new code as well.

I agree dma_fence_container_of would be a bit of questionable taste.

My thinking was from the angle, as you have dma_fence_spinlock() which 
is fence->lock accessor at runtime, while container_of is the same but 
needs to be compile time, and since there are the patches which touch a 
bunch of drivers purely mechanical, maybe wrap both. Then the patch 
which add the inline mode only changes dma-fence.h|c and so can be 
easily reverted should things go bad.

I don't however think this reasoning fully applies, since there would be 
no change in behaviour until each an every turns on the inline lock 
mode. So I guess for me I would be happy if dma_fence_spinlock() would 
be in the same patch as the dma_fence_lock_irqsave(). Logic being 
abstracting access to the lock can be justified to go together.

For container_of I don't know what to do. I don't see how it can be a 
separate patch if there is no accessor? In which case I guess just leave 
it as is.

Regards,

Tvrtko

>>
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>>    /**
>>>     * dma_fence_lock_irqsave - irqsave lock the fence
>>>     * @fence: the fence to lock
>>> @@ -385,7 +403,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>>     * Lock the fence, preventing it from changing to the signaled state.
>>>     */
>>>    #define dma_fence_lock_irqsave(fence, flags)    \
>>> -    spin_lock_irqsave(fence->lock, flags)
>>> +    spin_lock_irqsave(dma_fence_spinlock(fence), flags)
>>>      /**
>>>     * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
>>> @@ -395,7 +413,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>>     * Unlock the fence, allowing it to change it's state to signaled again.
>>>     */
>>>    #define dma_fence_unlock_irqrestore(fence, flags)    \
>>> -    spin_unlock_irqrestore(fence->lock, flags)
>>> +    spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
>>>      #ifdef CONFIG_LOCKDEP
>>>    bool dma_fence_begin_signalling(void);
>>
> 

