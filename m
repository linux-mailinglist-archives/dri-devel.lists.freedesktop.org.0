Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834973C6249
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 19:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DBA89D42;
	Mon, 12 Jul 2021 17:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B7189CF8;
 Mon, 12 Jul 2021 17:57:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="208209316"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="208209316"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 10:57:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="412661034"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.125.18])
 ([10.209.125.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 10:57:17 -0700
Subject: Re: [PATCH 16/47] drm/i915/guc: Disable engine barriers with GuC
 during unpin
To: Matthew Brost <matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-17-matthew.brost@intel.com>
 <8d056c1a-dc4a-baed-1664-0f86db9e7c5c@intel.com>
 <20210710030010.GA187079@DUT030-TGLY.fm.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <2b80175b-3ead-d219-ef77-d3f3bcc4835f@intel.com>
Date: Mon, 12 Jul 2021 10:57:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710030010.GA187079@DUT030-TGLY.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/2021 20:00, Matthew Brost wrote:
> On Fri, Jul 09, 2021 at 03:53:29PM -0700, John Harrison wrote:
>> On 6/24/2021 00:04, Matthew Brost wrote:
>>> Disable engine barriers for unpinning with GuC. This feature isn't
>>> needed with the GuC as it disables context scheduling before unpinning
>>> which guarantees the HW will not reference the context. Hence it is
>>> not necessary to defer unpinning until a kernel context request
>>> completes on each engine in the context engine mask.
>>>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
>>>    drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
>>>    drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
>>>    3 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>>> index 1499b8aace2a..7f97753ab164 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>> @@ -80,7 +80,7 @@ static int intel_context_active_acquire(struct intel_context *ce)
>>>    	__i915_active_acquire(&ce->active);
>>> -	if (intel_context_is_barrier(ce))
>>> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
>>>    		return 0;
>> Would be better to have a scheduler flag to say whether barriers are
>> required or not. That would prevent polluting front end code with back end
>> details.
>>
> I guess an engine flag is slightly better but I still don't love that
> as we have to test if the context is a barrier (kernel context) and then
> call a function that is basically backend specific after. IMO we really
> need to push all of this to a vfunc. If you really want me to make this
> an engine flag I can, but in the end it just seems like that will
> trash the code (adding an engine flag just to remove it). I think this
> is just a clean up we write down, and figure out a bit later as nothing
> is functionally wrong + quite clear that it is something that should be
> cleaned up.
>
> Matt
Flag, vfunc, whatever. I just mean that it would be better to abstract 
it out in some manner. Maybe a flag/vfunc on the ce object? That way it 
would swallow the 'ignore kernel contexts' test as well. But yes, 
probably best to add it to the todo list and move on as it is not going 
to be a two minute quick fix. I've added a comment to the Jira, so...

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
>> John.
>>
>>
>>>    	/* Preallocate tracking nodes */
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
>>> index 8a7199afbe61..a592a9605dc8 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
>>> @@ -16,6 +16,7 @@
>>>    #include "intel_engine_types.h"
>>>    #include "intel_ring_types.h"
>>>    #include "intel_timeline_types.h"
>>> +#include "uc/intel_guc_submission.h"
>>>    #define CE_TRACE(ce, fmt, ...) do {					\
>>>    	const struct intel_context *ce__ = (ce);			\
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
>>> index 26685b927169..fa7b99a671dd 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
>>> @@ -209,7 +209,13 @@ static int __live_active_context(struct intel_engine_cs *engine)
>>>    	 * This test makes sure that the context is kept alive until a
>>>    	 * subsequent idle-barrier (emitted when the engine wakeref hits 0
>>>    	 * with no more outstanding requests).
>>> +	 *
>>> +	 * In GuC submission mode we don't use idle barriers and we instead
>>> +	 * get a message from the GuC to signal that it is safe to unpin the
>>> +	 * context from memory.
>>>    	 */
>>> +	if (intel_engine_uses_guc(engine))
>>> +		return 0;
>>>    	if (intel_engine_pm_is_awake(engine)) {
>>>    		pr_err("%s is awake before starting %s!\n",
>>> @@ -357,7 +363,11 @@ static int __live_remote_context(struct intel_engine_cs *engine)
>>>    	 * on the context image remotely (intel_context_prepare_remote_request),
>>>    	 * which inserts foreign fences into intel_context.active, does not
>>>    	 * clobber the idle-barrier.
>>> +	 *
>>> +	 * In GuC submission mode we don't use idle barriers.
>>>    	 */
>>> +	if (intel_engine_uses_guc(engine))
>>> +		return 0;
>>>    	if (intel_engine_pm_is_awake(engine)) {
>>>    		pr_err("%s is awake before starting %s!\n",

