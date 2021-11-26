Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE745EE6E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 14:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6BB6EA5F;
	Fri, 26 Nov 2021 13:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ADD6E96B;
 Fri, 26 Nov 2021 13:03:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215684903"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="215684903"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:03:30 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="498396105"
Received: from slee54-mobl2.amr.corp.intel.com (HELO [10.209.166.109])
 ([10.209.166.109])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:03:28 -0800
Message-ID: <d3314baa-0720-ac04-f02b-024027cb81c4@linux.intel.com>
Date: Fri, 26 Nov 2021 13:03:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable bonding on gen12+ platforms
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210728192100.132425-1-matthew.brost@intel.com>
 <23d6e809-1d6e-ae35-1aee-e6f0c8c90419@intel.com>
 <CAKMK7uGt3xcquCAkoMNhF4=yVPQpVpWM7zKS8jPQ=wzha-VPfA@mail.gmail.com>
 <20210807050222.GP1556418@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20210807050222.GP1556418@mdroper-desk1.amr.corp.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/08/2021 06:02, Matt Roper wrote:
> On Fri, Aug 06, 2021 at 08:54:59PM +0200, Daniel Vetter wrote:
>> On Fri, Aug 6, 2021 at 8:25 PM John Harrison <john.c.harrison@intel.com> wrote:
>>> On 7/28/2021 12:21, Matthew Brost wrote:
>>>> Disable bonding on gen12+ platforms aside from ones already supported by
>>>> the i915 - TGL, RKL, and ADL-S.

Does this needs adjusting for the change in ADL-P plans?

Regards,

Tvrtko

>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> index 05c3ee191710..9c3672bac0e2 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> @@ -446,6 +446,13 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>>>>        u16 idx, num_bonds;
>>>>        int err, n;
>>>>
>>>> +     if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915) &&
>>>> +         !IS_ROCKETLAKE(i915) && !IS_ALDERLAKE_S(i915)) {
>>>> +             drm_dbg(&i915->drm,
>>>> +                     "Bonding on gen12+ aside from TGL, RKL, and ADL_S not allowed\n");
>>> I would have said not supported rather than not allowed. Either way:
>>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>>
>> Either is fine with me.
>>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
> 
> Applied to drm-intel-gt-next (with the suggested debug message wording
> tweak).  Thanks for the patch and reviews.
> 
> 
> Matt
> 
>>>
>>>> +             return -ENODEV;
>>>> +     }
>>>> +
>>>>        if (get_user(idx, &ext->virtual_index))
>>>>                return -EFAULT;
>>>>
>>>
>>
>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
> 
