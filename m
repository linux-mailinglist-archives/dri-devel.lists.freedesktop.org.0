Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C16938A90D
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 12:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BE56F3DA;
	Thu, 20 May 2021 10:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E486E237;
 Thu, 20 May 2021 10:57:51 +0000 (UTC)
IronPort-SDR: 7ST+mX/t3qMfG/jMSwlPqwNN2PgCIRWe8+FoQiB0oi4uoQoKGV0Ge9qFsHoqWJIPp19KWUPEVJ
 0xnVKG2dmFrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="201253547"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="201253547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 03:57:49 -0700
IronPort-SDR: +oXgSXW6UWIvLNV6LiMtndiFBJM/JbHxvznt/XB6i1GofyCh+dEmV7UG57bHS104oqmN7GikPN
 gw3aVlTrMYRg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440401267"
Received: from fgrogers-mobl.ger.corp.intel.com (HELO [10.213.241.97])
 ([10.213.241.97])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 03:57:46 -0700
Subject: Re: [Intel-gfx] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <YKTyDNyVgmR3z1H5@phenom.ffwll.local> <20210519171157.GA5202@sdutt-i7>
 <CAKMK7uG1qCcpwBFaUf06daY6gnxmNbNcZbBX+Yxb64qZkBMF8g@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b7542e1c-6631-d486-ae16-6aef3213d7bc@linux.intel.com>
Date: Thu, 20 May 2021 11:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG1qCcpwBFaUf06daY6gnxmNbNcZbBX+Yxb64qZkBMF8g@mail.gmail.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, karl@freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/05/2021 10:54, Daniel Vetter wrote:
> On Wed, May 19, 2021 at 7:19 PM Matthew Brost <matthew.brost@intel.com> wrote:
>>
>> On Wed, May 19, 2021 at 01:10:04PM +0200, Daniel Vetter wrote:
>>> On Tue, May 18, 2021 at 04:58:30PM -0700, Matthew Brost wrote:
>>>> Add entry fpr i915 new parallel submission uAPI plan.
>>>>
>>>> v2:
>>>>   (Daniel Vetter):
>>>>    - Expand logical order explaination
>>>>    - Add dummy header
>>>>    - Only allow N BBs in execbuf IOCTL
>>>>    - Configure parallel submission per slot not per gem context
>>>>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Tony Ye <tony.ye@intel.com>
>>>> CC: Carl Zhang <carl.zhang@intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
>>>>   Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
>>>>   2 files changed, 196 insertions(+), 1 deletion(-)
>>>>   create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
>>>>
>>>> diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
>>>> new file mode 100644
>>>> index 000000000000..8c64b983ccad
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
>>>> @@ -0,0 +1,144 @@
>>>> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
>>>> +
>>>> +/*
>>>> + * i915_context_engines_parallel_submit:
>>>> + *
>>>> + * Setup a slot to allow multiple BBs to be submitted in a single execbuf IOCTL.
>>>> + * Those BBs will then be scheduled to run on the GPU in parallel. Multiple
>>>> + * hardware contexts are created internally in the i915 run these BBs. Once a
>>>> + * slot is configured for N BBs only N BBs can be submitted in each execbuf
>>>> + * IOCTL and this is implict behavior (e.g. the user doesn't tell the execbuf
>>>> + * IOCTL there are N BBs, the execbuf IOCTL know how many BBs there are based on
>>>> + * the slots configuration).
>>>> + *
>>>> + * Their are two currently defined ways to control the placement of the
>>>> + * hardware contexts on physical engines: default behavior (no flags) and
>>>> + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in the
>>>> + * future as new hardware / use cases arise. Details of how to use this
>>>> + * interface below above the flags.
>>>> + *
>>>> + * Returns -EINVAL if hardware context placement configuration invalid or if the
>>>> + * placement configuration isn't supported on the platform / submission
>>>> + * interface.
>>>> + * Returns -ENODEV if extension isn't supported on the platform / submission
>>>> + * inteface.
>>>> + */
>>>> +struct i915_context_engines_parallel_submit {
>>>> +   struct i915_user_extension base;
>>>> +
>>>> +   __u16 engine_index;     /* slot for parallel engine */
>>>> +   __u16 width;            /* number of contexts per parallel engine */
>>>> +   __u16 num_siblings;     /* number of siblings per context */
>>>> +   __u16 mbz16;
>>>
>>> Ok the big picture looks reasonable now, the flags still confuse me.
>>>
>>
>> Yea, it is a bit confusing.
>>
>>>> +/*
>>>> + * Default placement behvavior (currently unsupported):
>>>> + *
>>>> + * Rather than restricting parallel submission to a single class with a
>>>> + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
>>>> + * enables parallel submission across multiple engine classes. In this case each
>>>> + * context's logical engine mask indicates where that context can placed. It is
>>>> + * implied in this mode that all contexts have mutual exclusive placement (e.g.
>>>> + * if one context is running CS0 no other contexts can run on CS0).
>>>> + *
>>>> + * Example 1 pseudo code:
>>>> + * CSX[Y] = engine class X, logical instance Y
>>>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>>> + * set_engines(INVALID)
>>>> + * set_parallel(engine_index=0, width=2, num_siblings=2,
>>>> + *         engines=CS0[0],CS0[1],CS1[0],CS1[1])
>>>> + *
>>>> + * Results in the following valid placements:
>>>> + * CS0[0], CS1[0]
>>>> + * CS0[0], CS1[1]
>>>> + * CS0[1], CS1[0]
>>>> + * CS0[1], CS1[1]
>>>> + *
>>>> + * This can also be though of as 2 virtual engines:
>>>> + * VE[0] = CS0[0], CS0[1]
>>>> + * VE[1] = CS1[0], CS1[1]
>>>> + *
>>>> + * Example 2 pseudo code:
>>>> + * CS[X] = generic engine of same class, logical instance X
>>>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>>> + * set_engines(INVALID)
>>>> + * set_parallel(engine_index=0, width=2, num_siblings=3,
>>>> + *         engines=CS[0],CS[1],CS[2],CS[0],CS[1],CS[2])
>>>> + *
>>>> + * Results in the following valid placements:
>>>> + * CS[0], CS[1]
>>>> + * CS[0], CS[2]
>>>> + * CS[1], CS[0]
>>>> + * CS[1], CS[2]
>>>> + * CS[2], CS[0]
>>>> + * CS[2], CS[1]
>>>> + *
>>>> + *
>>>> + * This can also be though of as 2 virtual engines:
>>>> + * VE[0] = CS[0], CS[1], CS[2]
>>>> + * VE[1] = CS[0], CS[1], CS[2]
>>>> +
>>>> + * This enables a use case where all engines are created equally, we don't care
>>>> + * where they are scheduled, we just want a certain number of resources, for
>>>> + * those resources to be scheduled in parallel, and possibly across multiple
>>>> + * engine classes.
>>>> + */
>>>
>>> So I don't really get what this does compared to setting the flag below.
>>> Is this just about running the batchbuffers the wrong way round, i.e. if
>>> you have (simplest case)
>>>
>>> width=2, num_sibglings=1, engines=CS[0], CS[1]
>>>
>>> Then both
>>> CS[0], CS[1]
>>> and
>>> CS[1], CS[0]
>>> are possible options for running 2 batches? Iow, the backend is allowed to
>>> run the batchbuffers the wrong way round, which gains us nothing, since we
>>> assume the batches take equally long and engines interchangeable. There is
>>> no scheduling scenario where this additional flexibility can help.
>>>
>>> Also we don't have flags to select the only available and then specify an
>>> entire pipe dream about what the non-flag mode does, without an
>>> implementation. What is this about?
>>>
>>> If it's just "because bonded allowed this" then I think we should just
>>> unceremonously ditch this. Bummer for the nice kerenldoc you wrote, but
>>> welp.
>>>
>>
>> High level the flags came out of internal discussions how this interface
>> should look. The default placement behavior is theoretically possible
>> with execlists but has no use cases. The GuC supports / current use
>> cases are a subset of what is possible with I915_PARALLEL_IMPLICT_BONDS.
>>
>> Argued about for months and this is where we landed. At the end of the
>> day I think we needed to show that this interface supports more
>> placement rules than what the GuC supports / current use cases to future
>> proof this interface.
>>
>> For what is it worth it seems kinda backwards that we landed on the
>> default behavior not being supported in our current stack / HW.
> 
> Yeah I think that should be inverted, doesn't make sense.
> 
> What I still don't get (and I've read Tvrtko's reply with the example)
> is what exactly is the difference between implicit and not implicit
> mode? Can you do a single example where the only difference is whether
> this flag is set, and then explain with that what are the actual
> differences in scheduling options that the backend is allowed to pick
> for the set of N patches?
> 
> I'm feeling a bit dense, but I'm really not seeing what's even going on here :-(

2-wide compute context:

  .engine_map([-1, -1])
  .load_balance(0: [cs0, cs1, cs2, cs3]) // place virtual engine at slot 0
  .load_balance(1: [cs0, cs1, cs2, cs3])
  .set_parallel()

This tells the scheduler any two of the four possible engines can be used. cs0 + cs3 is fine, cs3 + cs1 also, ... any. Only implicit rule is they have to be different and that works for all.

2-wide "implicit bonds mode" aka media fixed function limitation:

  .engine_map([-1, -1])
  .load_balance(0: [cs0, cs2])
  .load_balance(1: [cs1, cs3])
  .set_parallel(flags = implicit_bond)

Think of implicit flag creating a "link" between vertical columns in each virtual engine slot. So valid pairs end up cs0 + cs1 and cs2 + cs3 only.

You can also think of the implicit flag as a shortcut to avoid specifying bonds via the existing extension. In which case context setup would be written along the lines of:

  .engine_map([-1, -1])
  .load_balance(0: [cs0, cs2])
  .load_balance(1: [cs1, cs3])
  .bond(1: master = cs0, bond = [cs1])
  .bond(1: master = cs2, bond = [cs3])
  .set_parallel()

So the implicit flag is just a shortcut to avoid typing the bonds. Not really needed as explained in my previous reply.

This was at least the "old" set_parallel. I see this latest RFC changed things a bit which I don't really follow yet.

It's not perfect but needs to add very little (just one context extension, on top of multi batch execbuf which is needed anyways), doesn't need to deprecate anything, didn't require rewrites of the UMD, and it all works today and in the future.

I did not really like this new uapi for all the reasons I listed already, but as not many people were seeing the advantage of not churning on the uapi, if we are churning already I did suggests a different idea. I mean if we are churning we might as well go full in. So that proposal, which didn't get any traction, was along the lines of:

  .engine_map([-1])
  .load_balance_wide(0: width=2, engines=[[cs0, cs2], [cs1, cs3]])

This would create an explicit wide virtual engine which should work for GuC fine I think. For execlists it may require a bit of extra glue but I don't think too much.

Advantage is there is one engine in the map now and it is N-wide by definition.

Since no one did bite on that idea back then, I didn't really pursue is to see if it works for all use cases. But I think it should even if it probably requires further thinking to be sure.

If we apply it to compute use case..

  .engine_map([-1])
  .load_balance_wide(0: width=2, engines=[[cs0, cs1, cs2, cs3], [cs0, cs1, cs2, cs3]])

This means the only implicit wart in there is that cs0 + cs0 obviously shouldn't be picked. But that should be fine both for execlists and hopefully for the GuC.

Regards,

Tvrtko
