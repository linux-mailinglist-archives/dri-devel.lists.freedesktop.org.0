Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB986B038
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6E10E429;
	Wed, 28 Feb 2024 13:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnhHcWpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5832010E347;
 Wed, 28 Feb 2024 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709126677; x=1740662677;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5ZjZziv5CVbUZkII9bTipMOjq3kA/gt03wX5KRihxUA=;
 b=AnhHcWpEmWvPVZlUBnhY9cs3n0KLJrX3KNQeqjW4pMYBhgxD/AHIN5Li
 q0dNqi/OqKxFOMVOX3b3XRsv+vsfYAbJozjCy06AfkOOTv1e6fKnfIYas
 B9dqrbIxSskNI/Mia8c+mMYPVKYlfQdFDvzkFkEwThoTGdda5TfE2ZKwQ
 2SSws8uXUtIOpa5If0cqlXo7xN8kPGvij3ooI4bcMvl/2AFR5D/mGF83G
 quzJnAhz/Xed/FWAnDENrUpuvKBNkq1ApsCK59xoWk7WYTmyOCnLtMyHI
 rEnqQKuyRI+04C6Us7cX5nEjGbYG8IQ3TOLZoDPFfSYLF3i2YtFbwahW1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20974684"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="20974684"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 05:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7813025"
Received: from mcox1-mobl1.ger.corp.intel.com (HELO [10.213.233.55])
 ([10.213.233.55])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 05:24:34 -0800
Message-ID: <ab30e804-fb48-4283-b427-36278b406fb8@linux.intel.com>
Date: Wed, 28 Feb 2024 13:24:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: check before removing mm notifier
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Shawn Lee <shawn.c.lee@intel.com>
References: <20240219125047.28906-1-nirmoy.das@intel.com>
 <3c1a25f9-b1ee-4832-a89c-68813cc72416@linux.intel.com>
 <96eec421-090a-4420-ab94-098414334e29@linux.intel.com>
 <5f37d10a-d27f-4365-9411-7d5692633df6@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <5f37d10a-d27f-4365-9411-7d5692633df6@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/02/2024 09:26, Nirmoy Das wrote:
> Hi Tvrtko,
> 
> On 2/27/2024 10:04 AM, Tvrtko Ursulin wrote:
>>
>> On 21/02/2024 11:52, Nirmoy Das wrote:
>>> Merged it to drm-intel-gt-next with s/check/Check
>>
>> Shouldn't this have had:
>>
>> Fixes: ed29c2691188 ("drm/i915: Fix userptr so we do not have to worry 
>> about obj->mm.lock, v7.")
>> Cc: <stable@vger.kernel.org> # v5.13+
>>
>> ?
>>
> Yes. Sorry, I missed that. Can we still the tag ?

I've added them and force pushed the branch since commit was still at 
the top.

FYI + Jani, Joonas and Rodrigo

Regards,

Tvrtko

> 
> 
> Thanks,
> 
> Nirmoy
> 
>> Regards,
>>
>> Tvrtko
>>
>>> On 2/19/2024 1:50 PM, Nirmoy Das wrote:
>>>> Error in mmu_interval_notifier_insert() can leave a NULL
>>>> notifier.mm pointer. Catch that and return early.
>>>>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Cc: Shawn Lee <shawn.c.lee@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>>> index 0e21ce9d3e5a..61abfb505766 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>>> @@ -349,6 +349,9 @@ i915_gem_userptr_release(struct 
>>>> drm_i915_gem_object *obj)
>>>>   {
>>>>       GEM_WARN_ON(obj->userptr.page_ref);
>>>> +    if (!obj->userptr.notifier.mm)
>>>> +        return;
>>>> +
>>>> mmu_interval_notifier_remove(&obj->userptr.notifier);
>>>>       obj->userptr.notifier.mm = NULL;
>>>>   }
