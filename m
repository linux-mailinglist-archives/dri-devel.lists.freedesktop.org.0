Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A95A9167
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CA110E645;
	Thu,  1 Sep 2022 07:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1BF10E645;
 Thu,  1 Sep 2022 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662019144; x=1693555144;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6kOTEsUQXK5PIWBPxx8QfQMYIxEAVUDw1dxE6s5TPy4=;
 b=A5oHRNxDT7AF4mv+phiKlHOpuqGHzhz8CMhwA6CXI7zRSmg8quOFTihb
 O/zl8qYAlSxJG/84Slzcd9/42T7bfewZFpadt/BYaPa9bbS1+5XHzMHX7
 BGGtZ/CVuB4SdEWn81CIFVT3Ax7LMMHp62khYASF9dbmbnABiGeMQO8uM
 F81WyusZF+EB67Y673PTcx2PMrEw+/lm0VPNjNvEJ0NQogOjIgNqyKRCG
 0P5+6aTMBogkGNhiSS+R4MqbSetOXua8iZbXXCz7lPEPjcZvHKgxZ7Je8
 H0ZmDoSGUQlMzCpiGuwCXOr7IMNCM9vxpkgY9y0FwBqdP+wT7+0RXrH/H g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296432114"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="296432114"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 00:59:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="673737658"
Received: from jarlathd-mobl.ger.corp.intel.com (HELO [10.213.200.31])
 ([10.213.200.31])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 00:59:02 -0700
Message-ID: <f0ee82ec-03bd-1e02-affe-98f127b2d72a@linux.intel.com>
Date: Thu, 1 Sep 2022 08:58:57 +0100
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220901050910.GG10283@nvishwa1-DESK>
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



On 01/09/2022 06:09, Niranjana Vishwanathapura wrote:
> On Wed, Aug 31, 2022 at 08:38:48AM +0100, Tvrtko Ursulin wrote:
>>
>> On 27/08/2022 20:43, Andi Shyti wrote:
>>> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>
>>> Implement new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
>>> works in vm_bind mode. The vm_bind mode only works with
>>> this new execbuf3 ioctl.
>>>
>>> The new execbuf3 ioctl will not have any list of objects to validate
>>> bind as all required objects binding would have been requested by the
>>> userspace before submitting the execbuf3.
>>>
>>> And the legacy support like relocations etc are removed.
>>>
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---

[snip]

>>> +static void signal_fence_array(const struct i915_execbuffer *eb,
>>> +                   struct dma_fence * const fence)
>>> +{
>>> +    unsigned int n;
>>> +
>>> +    for (n = 0; n < eb->num_fences; n++) {
>>> +        struct drm_syncobj *syncobj;
>>> +        unsigned int flags;
>>> +
>>> +        syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
>>> +        if (!(flags & I915_TIMELINE_FENCE_SIGNAL))
>>> +            continue;
>>> +
>>> +        if (eb->fences[n].chain_fence) {
>>> +            drm_syncobj_add_point(syncobj,
>>> +                          eb->fences[n].chain_fence,
>>> +                          fence,
>>> +                          eb->fences[n].value);
>>> +            /*
>>> +             * The chain's ownership is transferred to the
>>> +             * timeline.
>>> +             */
>>> +            eb->fences[n].chain_fence = NULL;
>>> +        } else {
>>> +            drm_syncobj_replace_fence(syncobj, fence);
>>> +        }
>>> +    }
>>> +}
>> Semi-random place to ask - how many of the code here is direct copy of 
>> existing functions from i915_gem_execbuffer.c? There seems to be some 
>> 100% copies at least. And then some more with small tweaks. Spend some 
>> time and try to figure out some code sharing?
>>
> 
> During VM_BIND design review, maintainers expressed thought on keeping
> execbuf3 completely separate and not touch the legacy execbuf path.

Got a link so this maintainer can see what exactly was said? Just to 
make sure there isn't any misunderstanding on what "completely separate" 
means to different people.

> I also think, execbuf3 should be fully separate. We can do some code
> sharing where is a close 100% copy (there is a TODO in cover letter).
> There are some changes like the timeline fence array handling here
> which looks similar, but the uapi is not exactly the same. Probably,
> we should keep them separate and not try to force code sharing at
> least at this point.

Okay did not spot that TODO in the cover. But fair since it is RFC to be 
unfinished.

I do however think it should be improved before considering the merge. 
Because looking at the patch, 100% copies are:

for_each_batch_create_order
for_each_batch_add_order
eb_throttle
eb_pin_timeline
eb_pin_engine
eb_put_engine
__free_fence_array
put_fence_array
await_fence_array
signal_fence_array
retire_requests
eb_request_add
eb_requests_get
eb_requests_put
eb_find_context

Quite a lot.

Then there is a bunch of almost same functions which could be shared if 
there weren't two incompatible local struct i915_execbuffer's. 
Especially given when the out fence TODO item gets handled a chunk more 
will also become a 100% copy.

This could be done by having a common struct i915_execbuffer and then 
eb2 and eb3 specific parts which inherit from it. After that is done it 
should be easier to see if it makes sense to do something more and how.

Regards,

Tvrtko
