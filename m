Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4C3BA7C3
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 10:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112906E0E1;
	Sat,  3 Jul 2021 08:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A031D6E0E1;
 Sat,  3 Jul 2021 08:21:20 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AB4D15FF20;
 Sat,  3 Jul 2021 10:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1625300478;
 bh=Gcuzp3YsucIdHx5Ruy1UiowdXvF92eAmDMSLQ/OWEa8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=N8nXf/TWYYJ6WumvNy/FcdsF3XK+7Y5PW1k3UVqTOyppngFWVn3zria6RNUt3DEGl
 JknpZZ8yTt+lHsLG0DSOexMcvUxBBJOPHtwsYZERfZjN4DTs9irbQor83aF/xigbu3
 xvvFkMVa8kUYHfaRkjUeFSN4FUBi2qDJ8dVtoRSJvX4V71aUora/cCOTrZtl54XhUR
 sK21Srb5QgKHfAFCfi8NDkrvKXKSt26j87zjJtip4faJU3ti8zylD3He4g5Q6At+n4
 SaHGqUHsD9H6dYdoNi5QldIROMdkypUOhomB+LKiuVgPdqhVs6wCyezlt6ne24HTMD
 2JR4I90Cd5AbA==
Subject: Re: [Intel-gfx] [PATCH 47/47] drm/i915/guc: Unblock GuC submission on
 Gen11+
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
 <20210701111410.3fc6551e@eldfell>
 <050296b9-8958-353a-9f76-699bfbafa1c1@free.fr>
 <CAKMK7uH1svoSEGa=sv+BsU4_BMou2sEJQWddQgy1XDMYtz7-Dw@mail.gmail.com>
 <20210702102944.3a8c4915@eldfell>
 <2d3b06c3-5f69-5045-191f-3fd705a3fb40@free.fr>
 <a7e1ab69-7d68-4f34-1c92-c32c6c38f8f0@intel.com>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <7889d935-65fb-5f11-ac5d-f9d757b9ee84@free.fr>
Date: Sat, 3 Jul 2021 11:21:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a7e1ab69-7d68-4f34-1c92-c32c6c38f8f0@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 18:07, Michal Wajdeczko wrote:
> 
> 
> On 02.07.2021 10:09, Martin Peres wrote:
>> On 02/07/2021 10:29, Pekka Paalanen wrote:
>>> On Thu, 1 Jul 2021 21:28:06 +0200
>>> Daniel Vetter <daniel@ffwll.ch> wrote:
>>>
>>>> On Thu, Jul 1, 2021 at 8:27 PM Martin Peres <martin.peres@free.fr>
>>>> wrote:
>>>>>
>>>>> On 01/07/2021 11:14, Pekka Paalanen wrote:
>>>>>> On Wed, 30 Jun 2021 11:58:25 -0700
>>>>>> John Harrison <john.c.harrison@intel.com> wrote:
>>>>>>   
>>>>>>> On 6/30/2021 01:22, Martin Peres wrote:
>>>>>>>> On 24/06/2021 10:05, Matthew Brost wrote:
>>>>>>>>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>>>>
>>>>>>>>> Unblock GuC submission on Gen11+ platforms.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>>>> Signed-off-by: Daniele Ceraolo Spurio
>>>>>>>>> <daniele.ceraolospurio@intel.com>
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
>>>>>>>>>      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
>>>>>>>>>      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
>>>>>>>>>      drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14
>>>>>>>>> +++++++++-----
>>>>>>>>>      4 files changed, 19 insertions(+), 7 deletions(-)
>>>>>>>>>    
>>>>>>
>>>>>> ...
>>>>>>   
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>>>>>> index 7a69c3c027e9..61be0aa81492 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>>>>>>> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct
>>>>>>>>> intel_uc *uc)
>>>>>>>>>              return;
>>>>>>>>>          }
>>>>>>>>>      -    /* Default: enable HuC authentication only */
>>>>>>>>> -    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>>>>>>>> +    /* Intermediate platforms are HuC authentication only */
>>>>>>>>> +    if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
>>>>>>>>> +        drm_dbg(&i915->drm, "Disabling GuC only due to old
>>>>>>>>> platform\n");
>>>>>>>>
>>>>>>>> This comment does not seem accurate, given that DG1 is barely
>>>>>>>> out, and
>>>>>>>> ADL is not out yet. How about:
>>>>>>>>
>>>>>>>> "Disabling GuC on untested platforms"?
>>>>>>>>    
>>>>>>> Just because something is not in the shops yet does not mean it is
>>>>>>> new.
>>>>>>> Technology is always obsolete by the time it goes on sale.
>>>>>>
>>>>>> That is a very good reason to not use terminology like "new", "old",
>>>>>> "current", "modern" etc. at all.
>>>>>>
>>>>>> End users like me definitely do not share your interpretation of
>>>>>> "old".
>>>>>
>>>>> Yep, old and new is relative. In the end, what matters is the
>>>>> validation
>>>>> effort, which is why I was proposing "untested platforms".
>>>>>
>>>>> Also, remember that you are not writing these messages for Intel
>>>>> engineers, but instead are writing for Linux *users*.
>>>>
>>>> It's drm_dbg. Users don't read this stuff, at least not users with no
>>>> clue what the driver does and stuff like that.
>>>
>>> If I had a problem, I would read it, and I have no clue what anything
>>> of that is.
>>
>> Exactly.
>>
>> This level of defense for what is clearly a bad *debug* message (at the
>> very least, the grammar) makes no sense at all!
>>
>> I don't want to hear arguments like "Not my patch" from a developer
>> literally sending the patch to the ML and who added his SoB to the
>> patch, playing with words, or minimizing the problem of having such a
>> message.
> 
> Agree that 'not my patch' is never a good excuse, but equally we can't
> blame original patch author as patch was updated few times since then.

I never wanted to blame the author here, I was only speaking about the 
handling of feedback on the patch.

> 
> Maybe to avoid confusions and simplify reviews, we could split this
> patch into two smaller: first one that really unblocks GuC submission on
> all Gen11+ (see __guc_submission_supported) and second one that updates
> defaults for Gen12+ (see uc_expand_default_options), as original patch
> (from ~2019) evolved more than what title/commit message says.

Both work for me, as long as it is a collaborative effort.

Cheers,
Martin

> 
> Then we can fix all messaging and make sure it's clear and understood.
> 
> Thanks,
> Michal
> 
>>
>> All of the above are just clear signals for the community to get off
>> your playground, which is frankly unacceptable. Your email address does
>> not matter.
>>
>> In the spirit of collaboration, your response should have been "Good
>> catch, how about XXXX or YYYY?". This would not have wasted everyone's
>> time in an attempt to just have it your way.
>>
>> My level of confidence in this GuC transition was already low, but you
>> guys are working hard to shoot yourself in the foot. Trust should be
>> earned!
>>
>> Martin
>>
>>>
>>>
>>> Thanks,
>>> pq
>>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
