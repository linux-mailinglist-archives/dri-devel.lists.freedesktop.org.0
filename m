Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9C486280
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD7D10E9E1;
	Thu,  6 Jan 2022 09:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F68A10E9E2;
 Thu,  6 Jan 2022 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641462987; x=1672998987;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P1gix/DAfDhKjaNSCgWqNzXdlOl/b/dN71yoovFuz0o=;
 b=MBhBg3DkwHG77BPyOUTgA+TQ831vEcW0hNJzvWmzWubJHA1fc+8fYFRf
 7KeoGtfsrcrunGL64PCx68ht9guQFsCVdtPDMv0wJyQgXxivyDHelnHyK
 MZ6F4evzRH8kxVDzYB+qJ8i7DJp2aSKlp8yA4b89TbGlRqcPOLTGYIZtB
 UW82OaSJ7emEh2yU3GlcwpIkrzwHENEiq5lGxGk9ek+7eH7Ym21ayU/0w
 QJ9XqHSPmk+g7uCwzYbSoHk7w2RrzO8LtUOCd8yVL9LHT3RXGeboBr/l3
 ct4Qpncc0pS/O7k3WbGcjaHhfGkKiJp3W1aZpkCtyvGghcW9pIasYo4Mr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229957266"
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="229957266"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 01:56:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="472832907"
Received: from leitchrx-mobl.ger.corp.intel.com (HELO [10.213.202.197])
 ([10.213.202.197])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 01:56:05 -0800
Message-ID: <40920051-1aef-1e14-ec7e-03d158e02c22@linux.intel.com>
Date: Thu, 6 Jan 2022 09:56:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock timeline mutex directly in
 error path of eb_pin_timeline
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20220104233056.11245-1-matthew.brost@intel.com>
 <3ae7e493-4b77-9e87-ca6f-34f85cab4ecb@linux.intel.com>
 <20220105162402.GA33126@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220105162402.GA33126@jons-linux-dev-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/01/2022 16:24, Matthew Brost wrote:
> On Wed, Jan 05, 2022 at 09:35:44AM +0000, Tvrtko Ursulin wrote:
>>
>> On 04/01/2022 23:30, Matthew Brost wrote:
>>> Don't use the interruptable version of the timeline mutex lock in the
>>
>> interruptible
>>
>>> error path of eb_pin_timeline as the cleanup must always happen.
>>>
>>> v2:
>>>    (John Harrison)
>>>     - Don't check for interrupt during mutex lock
>>>
>>> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> index e9541244027a..e96e133cbb1f 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>> @@ -2516,9 +2516,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
>>>    				      timeout) < 0) {
>>>    			i915_request_put(rq);
>>> -			tl = intel_context_timeline_lock(ce);
>>> +			mutex_lock(&ce->timeline->mutex);
>>
>> On the other hand it is more user friendly to handle signals (which maybe
>> does not matter in this case, not sure any longer how long hold time it can
>> have) but there is also a question of consistency within the very function
>> you are changing.
>>
>> Apart from consistency, what about the parent-child magic
>> intel_context_timeline_lock does and you wouldn't have here?
>>
>> And what about the very existence of intel_context_timeline_lock as a
>> component boundary separation API, if it is used inconsistently throughout
>> i915_gem_execbuffer.c?
> 
> intel_context_timeline_lock does 2 things:
> 
> 1. Handles lockdep nesting of timeline locks for parent-child contexts
> ensuring locks are acquired from parent to last child, then released
> last child to parent
> 2. Allows the mutex lock to be interrupted
> 
> This helper should be used in setup steps where a user can signal abort
> (context pinning time + request creation time), by 'should be' I mean
> this was how it was done before I extended the execbuf IOCTL for
> multiple BBs. Slightly confusing but this is what was in place so I
> stuck with it.
> 
> This code here is an error path that only hold at most 1 timeline lock
> (no nesting required) and is a path that must be executed as it is a
> cleanup step (not allowed to be interrupted by user, intel_context_exit
> must be called or we have dangling engine PM refs).
> 
> Make sense? I probably should update the comment message to explain this
> a bit better as it did take me a bit to understand how this locking
> worked.

The part which does not make sense is this:

eb_pin_timeline()
{
...
	tl = intel_context_timeline_lock(ce);
	if (IS_ERR(tl))
		return PTR_ERR(tl);

... do some throttling, and if it fail:
			mutex_lock(&ce->timeline->mutex);

Therefore argument that at most one timeline lock is held and the extra 
stuff is not needed does not hold for me. Why would the throttling 
failed path be different than the initial step in this respect?

Using two ways to lock the same mutex withing 10 lines of code is confusing.

In my mind we have this question of API usage consistency, and also the 
unanswered questions of whether reacting to signals during taking this 
mutex matters (what are the pessimistic lock hold times and what 
influences them?).

Note that first lock handles signals, throttling also handles signals, 
so why wouldn't the cleanup path? Just because then you don't have to 
bother with error unwind is to only reason I can see.

So I suggest you just do proper error unwind and be done with it.

  if (rq) {
	ret = i915_request_wait()
	i915_request_put(rq)
	if (ret)
		goto err;
  }

  return 0;

  err:

  tl = intel_context_timeline_lock()
  intel_context_exit()
  intel_context_timeline_unlock()

  return nonblock ? ... : ...;

Regards,

Tvrtko

> 
> Matt
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>    			intel_context_exit(ce);
>>> -			intel_context_timeline_unlock(tl);
>>> +			mutex_unlock(&ce->timeline->mutex);
>>>    			if (nonblock)
>>>    				return -EWOULDBLOCK;
>>>
