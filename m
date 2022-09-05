Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE25AD5C1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19110E3FD;
	Mon,  5 Sep 2022 15:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE98910E3F9;
 Mon,  5 Sep 2022 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662390542; x=1693926542;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C8JMmGtA70vG2m2C6NWOtCM5PtgVfohPoc+fOZ5x1Uc=;
 b=SdoGZW0ymYWRTO1koLmVNovpx2YDwJpWCSnMvkzPgcem81nP2V61HulL
 3/eOGQMWzSroL+f5yADpJ4A9ukDK8O4lQLFVR0xOlNSVpiYTDMjqOXUY7
 m4pETXwl8p7HjbyJRn1U8SaO/59et2Xa5d8r0118exQsZClOJcBVw8uwB
 qEAx+pfbYeewhRA8nsuvxNDFTS7xmBhPoEDak5puUhZsGmHGyWkN/VLls
 T2FkmAnQDr1YWbMrplsd3+4fyTOdXFgI+Esqiu87t1Ub+FzBsAIHH/z/p
 qEeJir+azsS+m319iJ1PmWNTRWIi5bWcctbqpuydZQERR/Mo8hz+hJsY8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296411362"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="296411362"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 08:09:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="675324113"
Received: from hpigot-mobl1.ger.corp.intel.com (HELO [10.213.237.107])
 ([10.213.237.107])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 08:08:58 -0700
Message-ID: <c8055bb0-1aee-c6fb-1b59-f1cd36c39a50@linux.intel.com>
Date: Mon, 5 Sep 2022 16:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [RFC PATCH v3 10/17] drm/i915/vm_bind: Implement
 I915_GEM_EXECBUFFER3 ioctl
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-11-andi.shyti@linux.intel.com>
 <8ecb0b8f-f253-1318-444a-8370960c6140@linux.intel.com>
 <20220901050910.GG10283@nvishwa1-DESK>
 <f0ee82ec-03bd-1e02-affe-98f127b2d72a@linux.intel.com>
 <20220902054158.GJ10283@nvishwa1-DESK>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220902054158.GJ10283@nvishwa1-DESK>
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
Cc: Ramalingam C <ramalingampc2008@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/09/2022 06:41, Niranjana Vishwanathapura wrote:
> On Thu, Sep 01, 2022 at 08:58:57AM +0100, Tvrtko Ursulin wrote:
>>
>>
>> On 01/09/2022 06:09, Niranjana Vishwanathapura wrote:
>>> On Wed, Aug 31, 2022 at 08:38:48AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 27/08/2022 20:43, Andi Shyti wrote:
>>>>> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>>>
>>>>> Implement new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
>>>>> works in vm_bind mode. The vm_bind mode only works with
>>>>> this new execbuf3 ioctl.
>>>>>
>>>>> The new execbuf3 ioctl will not have any list of objects to validate
>>>>> bind as all required objects binding would have been requested by the
>>>>> userspace before submitting the execbuf3.
>>>>>
>>>>> And the legacy support like relocations etc are removed.
>>>>>
>>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>>> <niranjana.vishwanathapura@intel.com>
>>>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> ---
>>
>> [snip]
>>
>>>>> +static void signal_fence_array(const struct i915_execbuffer *eb,
>>>>> +                   struct dma_fence * const fence)
>>>>> +{
>>>>> +    unsigned int n;
>>>>> +
>>>>> +    for (n = 0; n < eb->num_fences; n++) {
>>>>> +        struct drm_syncobj *syncobj;
>>>>> +        unsigned int flags;
>>>>> +
>>>>> +        syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
>>>>> +        if (!(flags & I915_TIMELINE_FENCE_SIGNAL))
>>>>> +            continue;
>>>>> +
>>>>> +        if (eb->fences[n].chain_fence) {
>>>>> +            drm_syncobj_add_point(syncobj,
>>>>> +                          eb->fences[n].chain_fence,
>>>>> +                          fence,
>>>>> +                          eb->fences[n].value);
>>>>> +            /*
>>>>> +             * The chain's ownership is transferred to the
>>>>> +             * timeline.
>>>>> +             */
>>>>> +            eb->fences[n].chain_fence = NULL;
>>>>> +        } else {
>>>>> +            drm_syncobj_replace_fence(syncobj, fence);
>>>>> +        }
>>>>> +    }
>>>>> +}
>>>> Semi-random place to ask - how many of the code here is direct copy 
>>>> of existing functions from i915_gem_execbuffer.c? There seems to be 
>>>> some 100% copies at least. And then some more with small tweaks. 
>>>> Spend some time and try to figure out some code sharing?
>>>>
>>>
>>> During VM_BIND design review, maintainers expressed thought on keeping
>>> execbuf3 completely separate and not touch the legacy execbuf path.
>>
>> Got a link so this maintainer can see what exactly was said? Just to 
>> make sure there isn't any misunderstanding on what "completely 
>> separate" means to different people.
> 
> Here is one (search for copypaste/copy-paste)
> https://patchwork.freedesktop.org/patch/486608/?series=93447&rev=3
> It is hard to search for old discussion threads. May be maintainers
> can provide feedback here directly. Dave, Daniel? :)

Thanks. I had a read and don't see a fundamental conflict with what I 
said. Conclusion seemed to be to go with a new ioctl and implement code 
sharing where it makes sense. Which is what TODO in the cover letter 
acknowledges so there should be no disagreement really.

>>> I also think, execbuf3 should be fully separate. We can do some code
>>> sharing where is a close 100% copy (there is a TODO in cover letter).
>>> There are some changes like the timeline fence array handling here
>>> which looks similar, but the uapi is not exactly the same. Probably,
>>> we should keep them separate and not try to force code sharing at
>>> least at this point.
>>
>> Okay did not spot that TODO in the cover. But fair since it is RFC to 
>> be unfinished.
>>
>> I do however think it should be improved before considering the merge. 
>> Because looking at the patch, 100% copies are:
>>
>> for_each_batch_create_order
>> for_each_batch_add_order
>> eb_throttle
>> eb_pin_timeline
>> eb_pin_engine
>> eb_put_engine
>> __free_fence_array
>> put_fence_array
>> await_fence_array
>> signal_fence_array
>> retire_requests
>> eb_request_add
>> eb_requests_get
>> eb_requests_put
>> eb_find_context
>>
>> Quite a lot.
>>
>> Then there is a bunch of almost same functions which could be shared 
>> if there weren't two incompatible local struct i915_execbuffer's. 
>> Especially given when the out fence TODO item gets handled a chunk 
>> more will also become a 100% copy.
>>
> 
> There are difinitely a few which is 100% copies hence should have a
> shared code.
> But some are not. Like, fence_array stuff though looks very similar,
> the uapi structures are different between execbuf3 and legacy execbuf.
> The internal flags are also different (eg., __EXEC3_ENGINE_PINNED vs
> __EXEC_ENGINE_PINNED) which causes minor differences hence not a
> 100% copy.
> 
> So, I am not convinced if it is worth carrying legacy stuff into
> execbuf3 code. I think we need to look at these on a case by case
> basis and see if abstracting common functionality to a separate
> shared code makes sense or it is better to keep the code separate.

No one is suggesting to carry any legacy stuff into eb3. What I'd 
suggest is to start something like i915_gem_eb_common.h|c and stuff the 
100% copies from the above list in there.

Common struct eb with struct eb2 and eb3 inheriting from it should do 
the trick. Similarly eb->flags shouldn't be a hard problem to solve.

Then you see what remains and whether it makes sense to consolidate further.

Regards,

Tvrtko

>> This could be done by having a common struct i915_execbuffer and then 
>> eb2 and eb3 specific parts which inherit from it. After that is done 
>> it should be easier to see if it makes sense to do something more and 
>> how.
> 
> I am not a big fan of it. I think we should not try to load the execbuf3
> code with the legacy stuff.
> 
> Niranjana
> 
>>
>> Regards,
>>
>> Tvrtko
