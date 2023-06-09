Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87B729C36
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A21C10E134;
	Fri,  9 Jun 2023 14:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E210E134
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686319621; x=1717855621;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xIcS1us+cqc+bXAF+Xn3jYFVJb03CcsY7ACSvB5SgXg=;
 b=OtRuxchKVmukmShbjbNm2rEYHZ8u15+C/yPws8sBrqFeyEINWxJ7JzOn
 7LGZP+Gwat95N5Q3oCbfVArfbZN/AJ1v9+lRivNFbQV53I+c4lVuunDCp
 MjAS5cw5ZDuopjwIJkIgQHuT3NSn7r9X+DVClh/susWCVV2ewsc6ru2Di
 I31BK1O4QfXgE6NfcuVVsoamVyvYvsdzvM/0WVnNH147qlMarlfgfT49M
 n0hMRaA50sQPaxXqVKeD++IkSMzRNM4xHT6+8FPxQLWqgtyytZV7IYhqa
 KASjAJF9yJsHFArxWuMsSjK9BhOoY0NtwgjXpMj8/ZiJmIwSZheX6gRsT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="356495644"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356495644"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854752828"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="854752828"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO [10.213.210.241])
 ([10.213.210.241])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:06:59 -0700
Message-ID: <d6bd9e95-abc1-cd39-eb07-a5f1abf4699b@linux.intel.com>
Date: Fri, 9 Jun 2023 15:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-fence: Bypass signaling annotation from
 dma_fence_is_signaled
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com>
 <b8f0ea1e-4ab3-8ff1-5e69-4e723adf8c2a@amd.com>
 <9bbc64c9-d4af-9183-f002-01225ae8f74b@linux.intel.com>
 <12232c7b-fe68-81b2-49bf-fbd7a4351552@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <12232c7b-fe68-81b2-49bf-fbd7a4351552@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/06/2023 13:52, Christian König wrote:
> Am 09.06.23 um 14:09 schrieb Tvrtko Ursulin:
>>
>> On 09/06/2023 07:32, Christian König wrote:
>>> Am 08.06.23 um 16:30 schrieb Tvrtko Ursulin:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> For dma_fence_is_signaled signaling critical path annotations are an
>>>> annoying cause of false positives when using dma_fence_is_signaled and
>>>> indirectly higher level helpers such as dma_resv_test_signaled etc.
>>>>
>>>> Drop the critical path annotation since the "is signaled" API does not
>>>> guarantee to ever change the signaled status anyway.
>>>>
>>>> We do that by adding a low level _dma_fence_signal helper and use it 
>>>> from
>>>> dma_fence_is_signaled.
>>>
>>> I have been considering dropping the signaling from the 
>>> dma_fence_is_signaled() function altogether.
>>>
>>> Doing this together with the spin locking we have in the dma_fence is 
>>> just utterly nonsense since the purpose of the external spinlock is 
>>> to keep the signaling in order while this here defeats that.
>>>
>>> The quick check is ok I think, but signaling the dma_fence and 
>>> issuing the callbacks should always come from the interrupt handler.
>>
>> What do you think is broken with regards to ordering with the current 
>> code? The unlocked fast check?
> 
> Well it's not broken, the complexity just doesn't make sense.
> 
> The dma_fence->lock is a pointer to a spinlock_t instead of a spinlock_t 
> itself. That was done to make sure that all dma_fence objects from a 
> single context (or in other words hardware device) signal in the order 
> of their sequence number, e.g. 1 first, then 2, then 3 etc...
> 
> But when somebody uses the dma_fence_is_signaled() function it's 
> perfectly possible that this races with an interrupt handler which wants 
> to signal fences on another CPU.
> 
> In other words we get:
> CPU A:
> dma_fence_is_signaled(fence with seqno=3)
> fence->ops->signaled() returns true
> dma_fence_signal()
> spin_lock_irqsave(fence->lock)
> signal seqno=3
> ...
> 
> CPU B:
> device_driver_interrupt_handler()
> spin_lock_irqsave(driver->lock) <- busy waits for CPU A to complete
> signal seqno=1
> signal seqno=2
> seqno=3 is already signaled.
> signal seqno=4
> ...

Right I see. However hm.. would the order of be guaranteed anyway, if 
someone would be observing what CPU B is doing via the 
dma_fence_is_signaled->test_bit? And in which scenarios would it matter 
if out of order signaled status could be observed?

> Either fence->lock should not be a pointer or we should not signal the 
> fence from dma_fence_is_signaled().
> 
> I strongly think that later should be the way to go.

Despite having wrote the above, I don't have any objections to removing 
this either. I don't see anything in the contract that requires it, but 
it was probably a bit before my time to know why it was added so I don't 
know if it could cause any subtle issues. It should be okay to try and see.

Regards,

Tvrtko
