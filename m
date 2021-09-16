Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E740D487
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A873E6EADC;
	Thu, 16 Sep 2021 08:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6329A6EADC;
 Thu, 16 Sep 2021 08:31:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="219329307"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="219329307"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 01:31:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="516698901"
Received: from ipoconno-mobl3.ger.corp.intel.com (HELO [10.213.234.111])
 ([10.213.234.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 01:31:05 -0700
Subject: Re: [Intel-gfx] [PATCH 08/27] drm/i915: Add logical engine mapping
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-9-matthew.brost@intel.com>
 <c599bfef-418f-9a25-9e90-c20117dc4665@linux.intel.com>
 <20210910194955.GA24003@jons-linux-dev-box>
 <d95ee5e5-7118-cd98-49c0-964f22ade45d@linux.intel.com>
 <20210913165029.GA8526@jons-linux-dev-box>
 <68b40289-b8c6-9740-b1a6-f37ea4ffc2f7@linux.intel.com>
 <20210914180436.GA11006@jons-linux-dev-box>
 <04d062aa-1978-ec0d-5905-a9914fd5e2f9@linux.intel.com>
 <20210915165833.GA15792@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b3559aad-5266-c86c-ff9e-b6f43984d37d@linux.intel.com>
Date: Thu, 16 Sep 2021 09:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915165833.GA15792@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/09/2021 17:58, Matthew Brost wrote:
> On Wed, Sep 15, 2021 at 09:24:15AM +0100, Tvrtko Ursulin wrote:
>>
>> On 14/09/2021 19:04, Matthew Brost wrote:
>>> On Tue, Sep 14, 2021 at 09:34:08AM +0100, Tvrtko Ursulin wrote:
>>>>
>>
>> 8<
>>
>>>> Today we have:
>>>>
>>>> for_each intel_engines: // intel_engines is a flat list of all engines
>>>> 	intel_engine_setup()
>>>>
>>>> You propose to change it to:
>>>>
>>>> for_each engine_class:
>>>>      for 0..max_global_engine_instance:
>>>>         for_each intel_engines:
>>>>            skip engine not present
>>>>            skip class not matching
>>>>
>>>>            count logical instance
>>>>
>>>>      for_each intel_engines:
>>>>         skip engine not present
>>>>         skip wrong class
>>>>
>>>>         intel_engine_setup()
>>>>
>>>>
>>>> I propose:
>>>>
>>>> // Leave as is:
>>>>
>>>> for_each intel_engines:
>>>>      intel_engine_setup()
>>>>
>>>> // Add:
>>>>
>>>> for_each engine_class:
>>>>      logical = 0
>>>>      for_each gt->engine_class[class]:
>>>>         skip engine not present
>>>>
>>>>         engine->logical_instance = logical++
>>>>
>>>>
>>>> When code which actually needs a preturbed "map" arrives you add that in to
>>>> this second loop.
>>>>
>>>
>>> See above, why introduce an algorithm that doesn't work for future parts
>>> + future patches are land imminently? It makes zero sense whatsoever.
>>> With your proposal we would literally land code to just throw it away a
>>> couple of months from now + break patches we intend to land soon. This
>>
>> It sure works, it just walks the per class list instead of walking the flat
>> list skipping one class at the time.
>>
>> Just add the map based transformation to the second pass later, when it
>> becomes required.
>>
> 
> I can flatten the algorithm if that helps alleviate your concerns but
> with that being said, I've played around this locally and IMO makes the
> code way more ugly. Sure it eliminates some iterations of the loop but
> who really cares about that in a one time setup function?
> 
>>> algorithm works and has no reason whatsoever to be optimal as it a one
>>> time setup call. I really don't understand why we are still talking
>>> about this paint color.
>>
>> I don't think bike shedding is not an appropriate term when complaint is how
>> proposed algorithm is needlessly complicated.
>>
> 
> Are you just ignoring the fact that the algorithm (map) is needed in
> pending patches? IMO it is more complicated to write throw away code
> when the proper algorithm is already written. If the logical mapping was
> straight forward on all platforms as the ones currently upstream I would
> 100% agree with your suggestion, but it isn't on unembargoed platforms
> eminently going upstream. The algorithm I have works for the current
> platforms + the pending platforms. IMO is 100% acceptable to merge
> something looking towards a known future.

FWIW my 2c is that unused bits detract from review. And my gut feeling 
still is that code can be written in a simpler way and that the map 
transform can still plug in easily on top in a later series.

I said FWIW since even if I am right you can still view my comments as 
external/community inputs at this point and proceed however you wish.

Regards,

Tvrtko
