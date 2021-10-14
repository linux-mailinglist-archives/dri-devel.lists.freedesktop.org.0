Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D142DA46
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA63E6EA9E;
	Thu, 14 Oct 2021 13:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3246EA9E;
 Thu, 14 Oct 2021 13:26:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="288543178"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="288543178"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 06:26:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="525049908"
Received: from ebarkhuy-mobl2.ger.corp.intel.com (HELO [10.213.193.241])
 ([10.213.193.241])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 06:25:59 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use dma_resv_iter for waiting in
 i915_gem_object_wait_reservation.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211013104123.1877827-1-maarten.lankhorst@linux.intel.com>
 <8625e3ca-57f8-e387-1742-808e3599786f@linux.intel.com>
 <c3888f2f-8f30-68f6-2c69-961035c7573a@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2e438a2b-290d-6519-c73e-6747c9d7db50@linux.intel.com>
Date: Thu, 14 Oct 2021 14:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c3888f2f-8f30-68f6-2c69-961035c7573a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 14/10/2021 13:05, Maarten Lankhorst wrote:
> Op 14-10-2021 om 10:37 schreef Tvrtko Ursulin:
>>
>> On 13/10/2021 11:41, Maarten Lankhorst wrote:
>>> No memory should be allocated when calling i915_gem_object_wait,
>>> because it may be called to idle a BO when evicting memory.
>>>
>>> Fix this by using dma_resv_iter helpers to call
>>> i915_gem_object_wait_fence() on each fence, which cleans up the code a lot.
>>> Also remove dma_resv_prune, it's questionably.
>>>
>>> This will result in the following lockdep splat.
>>
>> <snip>
>>
>>> @@ -37,56 +36,17 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>>>                     unsigned int flags,
>>>                     long timeout)
>>>    {
>>> -    struct dma_fence *excl;
>>> -    bool prune_fences = false;
>>> -
>>> -    if (flags & I915_WAIT_ALL) {
>>> -        struct dma_fence **shared;
>>> -        unsigned int count, i;
>>> -        int ret;
>>> +    struct dma_resv_iter cursor;
>>> +    struct dma_fence *fence;
>>>    -        ret = dma_resv_get_fences(resv, &excl, &count, &shared);
>>> -        if (ret)
>>> -            return ret;
>>> -
>>> -        for (i = 0; i < count; i++) {
>>> -            timeout = i915_gem_object_wait_fence(shared[i],
>>> -                                 flags, timeout);
>>> -            if (timeout < 0)
>>> -                break;
>>> +    dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>    -            dma_fence_put(shared[i]);
>>> -        }
>>> -
>>> -        for (; i < count; i++)
>>> -            dma_fence_put(shared[i]);
>>> -        kfree(shared);
>>> -
>>> -        /*
>>> -         * If both shared fences and an exclusive fence exist,
>>> -         * then by construction the shared fences must be later
>>> -         * than the exclusive fence. If we successfully wait for
>>> -         * all the shared fences, we know that the exclusive fence
>>> -         * must all be signaled. If all the shared fences are
>>> -         * signaled, we can prune the array and recover the
>>> -         * floating references on the fences/requests.
>>> -         */
>>> -        prune_fences = count && timeout >= 0;
>>> -    } else {
>>> -        excl = dma_resv_get_excl_unlocked(resv);
>>> +        timeout = i915_gem_object_wait_fence(fence, flags, timeout);
>>> +        if (timeout <= 0)
>>> +            break;
>>
>> You have another change in behaviour here, well a bug really. When userspace passes in zero timeout you fail to report activity in other than the first fence.
> 
> Hmm, not necessarily, passing 0 to i915_gem_object_wait_fence timeout = 0 is a special case and means test only. It will return 1 on success.

I tried to enumerate the whole chain here. All for timeout == 0. Please double check I did not make a mistake somewhere since there are many return code inversions here.

As building blocks for the whole "game" we have:

1. dma_fence_default_wait, it returns for states:
	
	not signaled -> 0
	signaled -> 1

2. i915_request_wait

	not signaled -> -ETIME
	signaled -> 0

Then i915_gem_object_wait_fence builds on top of it and has therefore these possible outputs:

	signaled -> 0
	not signaled:
		i915 path -> -ETIME
		ext fence -> 0

So this looks a like problem already with 0 for signaled and not signaled. Unless it is by design that the return value does not want to report external fences? But it is not documented and it still waits on them so odd.

Then in i915_gem_object_wait_reservation we have a loop:

		for (i = 0; i < count; i++) {
			timeout = i915_gem_object_wait_fence(shared[i],
							     flags, timeout);
			if (timeout < 0)
				break;

So short circuit happens only for i915 fences, by virtue of no negative return codes otherwise.

If we focus for i915 fences only for a moment. It means it keeps skipping signaled to check if any is not, therefore returning -ETIME if any is not signaled. i915_gem_object_wait passes the negative return on.

With your patch you have:

+        timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+        if (timeout <= 0)
+            break;

Which means you break on first signaled fence (i915 or external), therefore missing to report any possible subsequent  unsignaled fences. So gem_wait ioctl breaks unless I am missing something.

Regards,

Tvrtko

> 
> Of course it is still broken, I sent a reply to könig about it, hope it will get fixed and respun. :)
> 
> ~Maarten
> 
