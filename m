Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BABB40DA88
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6627F6EDA7;
	Thu, 16 Sep 2021 13:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176636EDA4;
 Thu, 16 Sep 2021 13:01:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="209647001"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="209647001"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:00:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="553911087"
Received: from kumardhx-mobl1.gar.corp.intel.com (HELO [10.252.50.13])
 ([10.252.50.13])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:00:41 -0700
Subject: Re: [PATCH v2] kernel/locking: Add context to ww_mutex_trylock.
To: Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
 <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
 <96ab9cf1-250a-8f34-51ec-4a7f66a87b39@linux.intel.com>
 <YTnETRSy9H0CRdpc@hirez.programming.kicks-ass.net>
 <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
 <YTtznr85mg5xXouP@hirez.programming.kicks-ass.net>
 <e8a7754e-23e7-0250-5718-101a56d008f0@linux.intel.com>
 <YUBGPdDDjKlxAuXJ@hirez.programming.kicks-ass.net>
 <205e1591-343b-fb77-cfca-9c16af1484bd@linux.intel.com>
 <YUCpfrbfPSZvD3Xl@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <a374d768-213e-58e7-d281-1c46d1c0c105@linux.intel.com>
Date: Thu, 16 Sep 2021 15:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUCpfrbfPSZvD3Xl@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

Op 14-09-2021 om 15:54 schreef Daniel Vetter:
> On Tue, Sep 14, 2021 at 02:43:02PM +0200, Maarten Lankhorst wrote:
>> Op 14-09-2021 om 08:50 schreef Peter Zijlstra:
>>> On Mon, Sep 13, 2021 at 10:42:36AM +0200, Maarten Lankhorst wrote:
>>>
>>>>> +/**
>>>>> + * ww_mutex_trylock - tries to acquire the w/w mutex with optional acquire context
>>>>> + * @ww: mutex to lock
>>>>> + * @ww_ctx: optional w/w acquire context
>>>>> + *
>>>>> + * Trylocks a mutex with the optional acquire context; no deadlock detection is
>>>>> + * possible. Returns 1 if the mutex has been acquired successfully, 0 otherwise.
>>>>> + *
>>>>> + * Unlike ww_mutex_lock, no deadlock handling is performed. However, if a @ctx is
>>>>> + * specified, -EALREADY handling may happen in calls to ww_mutex_trylock.
>>>>> + *
>>>>> + * A mutex acquired with this function must be released with ww_mutex_unlock.
>>>>> + */
>>>>> +int ww_mutex_trylock(struct ww_mutex *ww, struct ww_acquire_ctx *ww_ctx)
>>>>> +{
>>>>> +	if (!ww_ctx)
>>>>> +		return mutex_trylock(&ww->base);
>>>>> +
>>>>> +	MUTEX_WARN_ON(ww->base.magic != &ww->base);
>>>>> +
>>>>> +	if (unlikely(ww_ctx == READ_ONCE(ww->ctx)))
>>>>> +		return -EALREADY;
>>>> I'm not 100% sure this is a good idea, because it would make the
>>>> trylock weird.  For i915 I checked manually, because I didn't want to
>>>> change the function signature. This is probably the other extreme.
>>>>
>>>> "if (ww_mutex_trylock())" would look correct, but actually be wrong
>>>> and lead to double unlock without adjustments.  Maybe we could make a
>>>> ww_mutex_trylock_ctx_err, which would return -EALREADY or -EBUSY on
>>>> failure, and 0 on success?  We could keep ww_mutex_trylock without
>>>> ctx, probably just #define as (!ww_mutex_trylock_ctx_err(lock, NULL))
>>> Urgh, yeah. Also, I suppose that if we already own it, we'll just fail
>>> the trylock anyway. Let me take this out.
>>>
>>>>> +	/*
>>>>> +	 * Reset the wounded flag after a kill. No other process can
>>>>> +	 * race and wound us here, since they can't have a valid owner
>>>>> +	 * pointer if we don't have any locks held.
>>>>> +	 */
>>>>> +	if (ww_ctx->acquired == 0)
>>>>> +		ww_ctx->wounded = 0;
>>>> Yeah I guess this needs fixing too. Not completely sure since trylock
>>>> wouldn't do the whole ww dance, but since it's our first lock,
>>>> probably best to do so regardless so other users don't trip over it.
>>> This is actually critical, because if this trylock is the first lock
>>> acquisition for the context, there won't be any other opportunity to
>>> reset this value.
>>>
>>>>> +
>>>>> +	if (__mutex_trylock(&ww->base)) {
>>>>> +		ww_mutex_set_context_fastpath(ww, ww_ctx);
>>>>> +		mutex_acquire_nest(&ww->base.dep_map, 0, 1, &ww_ctx->dep_map, _RET_IP_);
>>>>> +		return 1;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(ww_mutex_trylock);
>>> Updated version below...
>>>
>>> ---
>>> Subject: kernel/locking: Add context to ww_mutex_trylock()
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Date: Thu, 9 Sep 2021 11:32:18 +0200
>>>
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> i915 will soon gain an eviction path that trylock a whole lot of locks
>>> for eviction, getting dmesg failures like below:
>>>
>>>   BUG: MAX_LOCK_DEPTH too low!
>>>   turning off the locking correctness validator.
>>>   depth: 48  max: 48!
>>>   48 locks held by i915_selftest/5776:
>>>    #0: ffff888101a79240 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x88/0x160
>>>    #1: ffffc900009778c0 (reservation_ww_class_acquire){+.+.}-{0:0}, at: i915_vma_pin.constprop.63+0x39/0x1b0 [i915]
>>>    #2: ffff88800cf74de8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_vma_pin.constprop.63+0x5f/0x1b0 [i915]
>>>    #3: ffff88810c7f9e38 (&vm->mutex/1){+.+.}-{3:3}, at: i915_vma_pin_ww+0x1c4/0x9d0 [i915]
>>>    #4: ffff88810bad5768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>>>    #5: ffff88810bad60e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>>>   ...
>>>    #46: ffff88811964d768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>>>    #47: ffff88811964e0e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>>>   INFO: lockdep is turned off.
>>>
>>> Fixing eviction to nest into ww_class_acquire is a high priority, but
>>> it requires a rework of the entire driver, which can only be done one
>>> step at a time.
>>>
>>> As an intermediate solution, add an acquire context to
>>> ww_mutex_trylock, which allows us to do proper nesting annotations on
>>> the trylocks, making the above lockdep splat disappear.
>>>
>>> This is also useful in regulator_lock_nested, which may avoid dropping
>>> regulator_nesting_mutex in the uncontended path, so use it there.
>>>
>>> TTM may be another user for this, where we could lock a buffer in a
>>> fastpath with list locks held, without dropping all locks we hold.
>>>
>>> [peterz: rework actual ww_mutex_trylock() implementations]
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>> ---
>> My original patch series with this patch in place still passes i915 selftests, looks good to me. :)
> For merge logistics, can we pls have a stable branch? I expect that the
> i915 patches will be ready for 5.16.
>
> Or send it in for -rc2 so that the interface change doesn't cause needless
> conflicts, whatever you think is best.
> -Daniel
Yeah, some central branch drm could pull from, would make upstreaming patches that depends on it easier. :)
