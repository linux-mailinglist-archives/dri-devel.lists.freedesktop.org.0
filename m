Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC438ED2F
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 17:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A016E88D;
	Mon, 24 May 2021 15:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A626E886;
 Mon, 24 May 2021 15:33:24 +0000 (UTC)
IronPort-SDR: J+wfFT0PG2NZNbEhVs/wy2I//mpZIHakhSmYoQQpfeoRpZ5BuGFRXsvmD5kces+YFdO+i2iiXV
 epb5wnlxf5AA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="265859013"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="265859013"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 08:33:22 -0700
IronPort-SDR: qWQMDt9niCgHnzlwAlUgB2o2w+LZhixSSSDjB+rH0toywABsIJlpBoj7nLPOdfPyyO5ILDIdG1
 gTej0Vt3ohKg==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="413634506"
Received: from gtenuto-mobl1.ger.corp.intel.com (HELO [10.213.210.116])
 ([10.213.210.116])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 08:33:20 -0700
Subject: Re: [Intel-gfx] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
To: Matthew Brost <matthew.brost@intel.com>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <882a70cf-74d6-3de4-ff76-b20d3f1eea6d@linux.intel.com>
 <20210521164853.GD22003@sdutt-i7>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9cb04352-656c-6bd7-14c2-5bede3ac1a24@linux.intel.com>
Date: Mon, 24 May 2021 16:33:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521164853.GD22003@sdutt-i7>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, daniel.vetter@intel.com,
 mesa-dev@lists.freedesktop.org, karl@freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/05/2021 17:48, Matthew Brost wrote:
> On Fri, May 21, 2021 at 01:00:54PM +0100, Tvrtko Ursulin wrote:

[snip]

>>> + * enables parallel submission across multiple engine classes. In this case each
>>> + * context's logical engine mask indicates where that context can placed. It is
>>> + * implied in this mode that all contexts have mutual exclusive placement (e.g.
>>> + * if one context is running CS0 no other contexts can run on CS0).
>>
>> I think talk about logical context and its mask is too implementation detail
>> at the uapi level. Instead I would suggest more userspace programmer centric
>> description.
> 
> Ok, can you give me suggestion? Writing DOC isn't really my strength.

Yeah, not mine either. Maybe we need to hire a technical writer. :)

I think in general I would just talk a bit how until now submission was 
along a single engine only and this is adding a wide submission model, 
expanding how it works with more details and only then talking about 
logical contexts if needed.

It depends a bit whether our userspace clients still predominantly think 
in terms of engines, or is it contexts? I don't have an answer there.

It probably isn't the most important thing and probably with a few 
tweaks of what you have it can be good enough. Key probably is simply 
coming up with as intuitive as possible diagrams, with consistent 
naming, showing how the wide engine is built and how it works.

>>> + *
>>> + * Example 1 pseudo code:
>>> + * CSX[Y] = engine class X, logical instance Y
>>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>> + * set_engines(INVALID)
>>> + * set_parallel(engine_index=0, width=2, num_siblings=2,
>>> + *		engines=CS0[0],CS0[1],CS1[0],CS1[1])
>>> + *
>>> + * Results in the following valid placements:
>>> + * CS0[0], CS1[0]
>>> + * CS0[0], CS1[1]
>>> + * CS0[1], CS1[0]
>>> + * CS0[1], CS1[1]
>>> + *
>>> + * This can also be though of as 2 virtual engines:
>>> + * VE[0] = CS0[0], CS0[1]
>>> + * VE[1] = CS1[0], CS1[1]
>>
>> Ah okay so essentially similar to what I was proposing a year ago. But then
>> it is no longer "set_parallel" really. It is one slot in the engine map,
>> right, with the idea to super class intel_context in the implementation?
>>
> 
> Yes, it is bascially a super class intel_context. In the implementation is
> parent-child with the parent having a linked list of child intel_contexts.
>   
>> So really a wide virtual engine, as opposed to single one. In which case I
>> think it makes sense to stay close to the existing naming of the
>> load_balance extension for consistency. Load_balance_wide?
>> Load_balance_parallel? Multi?
> 
> I like the way is named but I also don't want to argue about this as I don't
> really care. If someone else says this should be renamed, let's do it.

I don't care too much apart from a general desire for more consistency 
and fewer terms in use.

>> I also have to say the notation "CS0[0]" - I who know this problem space am
>> finding it hard to penetrate what that actually means. (Also uppercase IMO
>> makes it hard to read, but maybe it is just me.)
>>
> 
> Yea, now I think about it CS0[0] is bad because of using numbers twice. How
> about CSX[0] & CSY[1]? I used upper case because in the i915 all engine classes
> defines are upper case but agree it might be easier to read it lower case.

What would X and Y represent? Or if I paste this part:

  * VE[0] = CS0[0], CS0[1]
  * VE[1] = CS1[0], CS1[1]

Which index is engine instance and what is the other index?

>> Looking a bit lower below, extension seems to be taking a 2d array of
>> class:instance pairs, right? If so then reading these docs in order, or even
>> just looking further down, I don't think that is explicitly called out
>> clearly enough.
>>
>> So I think a paragraph or two explaining clearly how the 2d array of engines
>> corresponds to the allowed engines for full virtual engine width. Or maybe
>> just a 2d diagram?
>>
>>    2-wide virtual engine:
>>      .engines = [
>>        /* channel 0 allowed engines: */  [cs0, cs1],
>>        /* channel 1 allowed engines: */  [cs0, cs1]
>>       ]
>>
>> Not sure if that's better.
>>
> 
> Yes, it is a 2-d array. Agree the explaination could be better.
> 
>> Also to be noted, this only allows uniform number of allowed engines per
>> channel. I am not saying we need the non-uniform setup today but with bonds
>> there isn't this limitation.
>>
> 
> Not exactly. You could do something like this.
> 
> witdth = 2
> siblings = 2
> engines = CSX[0], CSX[1], CSY[0], INVALID
> 
> This would allow a placement of:
> 
> CSX[0], CSY[0]
> CSX[1], CSY[0]
> 
> In this case the siblings is just a max value of each entry.

Okay fair, did not think about that or saw it mentioned.

Regards,

Tvrtko
