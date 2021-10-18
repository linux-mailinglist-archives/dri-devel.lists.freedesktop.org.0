Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F54316DC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDF889312;
	Mon, 18 Oct 2021 11:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA90882A9;
 Mon, 18 Oct 2021 11:07:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="314420515"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="314420515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 04:07:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="443367705"
Received: from wohlrab-mobl1.ger.corp.intel.com (HELO [10.252.45.25])
 ([10.252.45.25])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 04:07:26 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use dma_resv_iter for waiting in
 i915_gem_object_wait_reservation.
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20211013104123.1877827-1-maarten.lankhorst@linux.intel.com>
 <8625e3ca-57f8-e387-1742-808e3599786f@linux.intel.com>
 <c3888f2f-8f30-68f6-2c69-961035c7573a@linux.intel.com>
 <2e438a2b-290d-6519-c73e-6747c9d7db50@linux.intel.com>
 <87224679-f1b0-8164-c5bd-29d596235a4a@linux.intel.com>
 <0ddf31af-c13e-3436-253d-8f1c076bd844@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <32318e3a-dac3-df92-b77c-b1438d4f7e06@linux.intel.com>
Date: Mon, 18 Oct 2021 13:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0ddf31af-c13e-3436-253d-8f1c076bd844@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Op 14-10-2021 om 15:56 schreef Tvrtko Ursulin:
>
> On 14/10/2021 14:45, Maarten Lankhorst wrote:
>> Op 14-10-2021 om 15:25 schreef Tvrtko Ursulin:
>>>
>>> On 14/10/2021 13:05, Maarten Lankhorst wrote:
>>>> Op 14-10-2021 om 10:37 schreef Tvrtko Ursulin:
>>>>>
>>>>> On 13/10/2021 11:41, Maarten Lankhorst wrote:
>>>>>> No memory should be allocated when calling i915_gem_object_wait,
>>>>>> because it may be called to idle a BO when evicting memory.
>>>>>>
>>>>>> Fix this by using dma_resv_iter helpers to call
>>>>>> i915_gem_object_wait_fence() on each fence, which cleans up the code a lot.
>>>>>> Also remove dma_resv_prune, it's questionably.
>>>>>>
>>>>>> This will result in the following lockdep splat.
>>>>>
>>>>> <snip>
>>>>>
>>>>>> @@ -37,56 +36,17 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>>>>>>                      unsigned int flags,
>>>>>>                      long timeout)
>>>>>>     {
>>>>>> -    struct dma_fence *excl;
>>>>>> -    bool prune_fences = false;
>>>>>> -
>>>>>> -    if (flags & I915_WAIT_ALL) {
>>>>>> -        struct dma_fence **shared;
>>>>>> -        unsigned int count, i;
>>>>>> -        int ret;
>>>>>> +    struct dma_resv_iter cursor;
>>>>>> +    struct dma_fence *fence;
>>>>>>     -        ret = dma_resv_get_fences(resv, &excl, &count, &shared);
>>>>>> -        if (ret)
>>>>>> -            return ret;
>>>>>> -
>>>>>> -        for (i = 0; i < count; i++) {
>>>>>> -            timeout = i915_gem_object_wait_fence(shared[i],
>>>>>> -                                 flags, timeout);
>>>>>> -            if (timeout < 0)
>>>>>> -                break;
>>>>>> +    dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
>>>>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>>>>     -            dma_fence_put(shared[i]);
>>>>>> -        }
>>>>>> -
>>>>>> -        for (; i < count; i++)
>>>>>> -            dma_fence_put(shared[i]);
>>>>>> -        kfree(shared);
>>>>>> -
>>>>>> -        /*
>>>>>> -         * If both shared fences and an exclusive fence exist,
>>>>>> -         * then by construction the shared fences must be later
>>>>>> -         * than the exclusive fence. If we successfully wait for
>>>>>> -         * all the shared fences, we know that the exclusive fence
>>>>>> -         * must all be signaled. If all the shared fences are
>>>>>> -         * signaled, we can prune the array and recover the
>>>>>> -         * floating references on the fences/requests.
>>>>>> -         */
>>>>>> -        prune_fences = count && timeout >= 0;
>>>>>> -    } else {
>>>>>> -        excl = dma_resv_get_excl_unlocked(resv);
>>>>>> +        timeout = i915_gem_object_wait_fence(fence, flags, timeout);
>>>>>> +        if (timeout <= 0)
>>>>>> +            break;
>>>>>
>>>>> You have another change in behaviour here, well a bug really. When userspace passes in zero timeout you fail to report activity in other than the first fence.
>>>>
>>>> Hmm, not necessarily, passing 0 to i915_gem_object_wait_fence timeout = 0 is a special case and means test only. It will return 1 on success.
>>>
>>> I tried to enumerate the whole chain here. All for timeout == 0. Please double check I did not make a mistake somewhere since there are many return code inversions here.
>>>
>>> As building blocks for the whole "game" we have:
>>>
>>> 1. dma_fence_default_wait, it returns for states:
>>>           not signaled -> 0
>>>      signaled -> 1
>>>
>>> 2. i915_request_wait
>>>
>>>      not signaled -> -ETIME
>>>      signaled -> 0
>>>
>>> Then i915_gem_object_wait_fence builds on top of it and has therefore these possible outputs:
>>>
>>>      signaled -> 0
>>>      not signaled:
>>>          i915 path -> -ETIME
>>>          ext fence -> 0
>>>
>>> So this looks a like problem already with 0 for signaled and not signaled. Unless it is by design that the return value does not want to report external fences? But it is not documented and it still waits on them so odd.
>>>
>>> Then in i915_gem_object_wait_reservation we have a loop:
>>>
>>>          for (i = 0; i < count; i++) {
>>>              timeout = i915_gem_object_wait_fence(shared[i],
>>>                                   flags, timeout);
>>>              if (timeout < 0)
>>>                  break;
>>>
>>> So short circuit happens only for i915 fences, by virtue of no negative return codes otherwise.
>>>
>>> If we focus for i915 fences only for a moment. It means it keeps skipping signaled to check if any is not, therefore returning -ETIME if any is not signaled. i915_gem_object_wait passes the negative return on.
>>>
>>> With your patch you have:
>>>
>>> +        timeout = i915_gem_object_wait_fence(fence, flags, timeout);
>>> +        if (timeout <= 0)
>>> +            break;
>>>
>>> Which means you break on first signaled fence (i915 or external), therefore missing to report any possible subsequent  unsignaled fences. So gem_wait ioctl breaks unless I am missing something.
>>
>> You're cc'd on a mail I sent to König regarding this.
>> "Re: [PATCH 20/28] drm/i915: use new iterator in i915_gem_object_wait_reservation"
>> 5accca25-8ac3-47ca-ee56-8b33c208fc80@linux.intel.com
>>
>>
>> timeout = 0 is a special case, fence_wait should return 1 if signaled, or 0 if waiting. Not -ETIME, as i915 does currently.
>>
>> This means our i915_fence_wait() handler is currently very wrong too, needs to be fixed. It returns 0 if timeout = 0 even
>> if signaled.
>>
>> I think it cancels the fail in our gem_object_wait, but more consistency is definitely needed first.
>>
>> I think it's best to keep the current semantics for i915_reuest_wait, but make it a wrapper around a
>> fixed i915_request_wait_timeout(), which would have the correct return semantics.
>
> Okay you are opening up a new issue here. What I am saying is don't break gem_wait. :) Christian's patch did not have the "<=" bug, it simply preserved the existing behaviour.
>
> Then for the fence->wait() issue you raise, comment is lacking:
>
>      * Must return -ERESTARTSYS if the wait is intr = true and the wait was
>      * interrupted, and remaining jiffies if fence has signaled, or 0 if wait
>      * timed out. Can also return other error values on custom implementations,
>      * which should be treated as if the fence is signaled. For example a hardware
>      * lockup could be reported like that.
>
> No mention of the timeout == 0 special case so that needs to be fixed as well. Plenty of issues to work on.
>
> Regards,
>
> Tvrtko
>
Yeah, I fixed this in the next series, but it's a mess.

I added i915_request_wait_timeout that has dma-fence semantics, and used it inside i915_fence_wait.

The second patch converted i915_gem_object_wait_reservation to use dma-fence semantics, based on Königs patch and made i915_gem_object_wait handle 0 as -ETIME as well.

Still lacking the documentation update.

~Maarten

