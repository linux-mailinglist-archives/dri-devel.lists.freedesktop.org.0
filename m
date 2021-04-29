Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52D36E668
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 10:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0756ED8F;
	Thu, 29 Apr 2021 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0866ED8F;
 Thu, 29 Apr 2021 08:01:26 +0000 (UTC)
IronPort-SDR: 2QZfFc4OCdwqjG3aqSrQGjHZx2ReFXeeewV8C0qY2oRuK/Q4c90tFXGNVDYqiEzCET5Zf1RVGh
 hYfJbtZTRQhA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="196506374"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="196506374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:01:23 -0700
IronPort-SDR: 1zNokl+0kAVzKLwJO6m8td0ANbprZbVmYSiqqTZPbbdz6SMc9D+ijrVYMm7PBKQA+yr/eOte6a
 9HFFicopgApA==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="458631444"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO [10.213.208.64])
 ([10.213.208.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:01:21 -0700
Subject: Re: [Intel-gfx] [PATCH 09/21] drm/i915/gem: Disallow creating
 contexts with too many engines
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-10-jason@jlekstrand.net>
 <YIk14zVfa8Mw4rUF@phenom.ffwll.local>
 <6b388d4d-1d50-94f3-344a-5b6b3639e8ad@linux.intel.com>
 <YIlrCmvC10oAiRcL@phenom.ffwll.local>
 <27db8ded-3b17-748e-f602-a8c1aef7367f@linux.intel.com>
 <CAOFGe94czhE=SHZLOWmH6vPRs1ujhsP9BBxc6i+N_bkPZ+6UHw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8a1e496c-683d-0a26-03a7-14993ba82acf@linux.intel.com>
Date: Thu, 29 Apr 2021 09:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe94czhE=SHZLOWmH6vPRs1ujhsP9BBxc6i+N_bkPZ+6UHw@mail.gmail.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2021 18:09, Jason Ekstrand wrote:
> On Wed, Apr 28, 2021 at 9:26 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> On 28/04/2021 15:02, Daniel Vetter wrote:
>>> On Wed, Apr 28, 2021 at 11:42:31AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 28/04/2021 11:16, Daniel Vetter wrote:
>>>>> On Fri, Apr 23, 2021 at 05:31:19PM -0500, Jason Ekstrand wrote:
>>>>>> There's no sense in allowing userspace to create more engines than it
>>>>>> can possibly access via execbuf.
>>>>>>
>>>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>>>>> ---
>>>>>>     drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++----
>>>>>>     1 file changed, 3 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>> index 5f8d0faf783aa..ecb3bf5369857 100644
>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>> @@ -1640,11 +1640,10 @@ set_engines(struct i915_gem_context *ctx,
>>>>>>                     return -EINVAL;
>>>>>>             }
>>>>>> -  /*
>>>>>> -   * Note that I915_EXEC_RING_MASK limits execbuf to only using the
>>>>>> -   * first 64 engines defined here.
>>>>>> -   */
>>>>>>             num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
>>>>>
>>>>> Maybe add a comment like /* RING_MASK has not shift, so can be used
>>>>> directly here */ since I had to check that :-)
>>>>>
>>>>> Same story about igt testcases needed, just to be sure.
>>>>>
>>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>
>>>> I am not sure about the churn vs benefit ratio here. There are also patches
>>>> which extend the engine selection field in execbuf2 over the unused
>>>> constants bits (with an explicit flag). So churn upstream and churn in
>>>> internal (if interesting) for not much benefit.
>>>
>>> This isn't churn.
>>>
>>> This is "lock done uapi properly".
> 
> Pretty much.

Still haven't heard what concrete problems it solves.

>> IMO it is a "meh" patch. Doesn't fix any problems and will create work
>> for other people and man hours spent which no one will ever properly
>> account against.
>>
>> Number of contexts in the engine map should not really be tied to
>> execbuf2. As is demonstrated by the incoming work to address more than
>> 63 engines, either as an extension to execbuf2 or future execbuf3.
> 
> Which userspace driver has requested more than 64 engines in a single context?

No need to artificially limit hardware capabilities in the uapi by 
implementing a policy in the kernel. Which will need to be 
removed/changed shortly anyway. This particular patch is work and 
creates more work (which other people who will get to fix the fallout 
will spend man hours to figure out what and why broke) for no benefit. 
Or you are yet to explain what the benefit is in concrete terms.

Why don't you limit it to number of physical engines then? Why don't you 
filter out duplicates? Why not limit the number of buffer objects per 
client or global based on available RAM + swap relative to minimum 
object size? Reductio ad absurdum yes, but illustrating the, in this 
case, a thin line between "locking down uapi" and adding too much policy 
where it is not appropriate.

> Also, for execbuf3, I'd like to get rid of contexts entirely and have
> engines be their own userspace-visible object.  If we go this
> direction, you can have UINT32_MAX of them.  Problem solved.

Not the problem I am pointing at though.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
