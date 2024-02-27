Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8527E868C30
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422410E8C9;
	Tue, 27 Feb 2024 09:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPfiIP2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A49410E8B0;
 Tue, 27 Feb 2024 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709025987; x=1740561987;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d7qvb68AxhQIcifAepC6POl/VMX++0DCVgcmzXKpFRs=;
 b=kPfiIP2CpdS4qRkn6a7hSieKfQ1PHGxpxaUkpvXrPFhl++msnbQ92PR6
 5oCwK7OGo4mQ4H1hIRuRaEExAXOKYtaEsN0iwHy+VmukgxnzT4qCvLdEo
 N1nSAZHxkpYoC3UZBzpJQD47qRD5o0dhWPV4vYIJGeYbvN98RspMCfhdB
 s3JLCinfk4QOKr1Gw4Z/qg8Pa0L3kIjB6vWv7aE7c13cTnJ4b/rbKEhSM
 Gv8b9e//dQra/T/w+KikMDRHMjyulSjJWP+c+pyGcCepqnqnHh2X3YUyT
 LTQJWuDRQ4SNqn4EjX4NPza5zCOdI9gBet2uk7YJKQQsh9AeSxaTiFmSu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25821277"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="25821277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6843722"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:26:25 -0800
Message-ID: <5f37d10a-d27f-4365-9411-7d5692633df6@linux.intel.com>
Date: Tue, 27 Feb 2024 10:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: check before removing mm notifier
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Shawn Lee <shawn.c.lee@intel.com>
References: <20240219125047.28906-1-nirmoy.das@intel.com>
 <3c1a25f9-b1ee-4832-a89c-68813cc72416@linux.intel.com>
 <96eec421-090a-4420-ab94-098414334e29@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <96eec421-090a-4420-ab94-098414334e29@linux.intel.com>
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

Hi Tvrtko,

On 2/27/2024 10:04 AM, Tvrtko Ursulin wrote:
>
> On 21/02/2024 11:52, Nirmoy Das wrote:
>> Merged it to drm-intel-gt-next with s/check/Check
>
> Shouldn't this have had:
>
> Fixes: ed29c2691188 ("drm/i915: Fix userptr so we do not have to worry 
> about obj->mm.lock, v7.")
> Cc: <stable@vger.kernel.org> # v5.13+
>
> ?
>
Yes. Sorry, I missed that. Can we still the tag ?


Thanks,

Nirmoy

> Regards,
>
> Tvrtko
>
>> On 2/19/2024 1:50 PM, Nirmoy Das wrote:
>>> Error in mmu_interval_notifier_insert() can leave a NULL
>>> notifier.mm pointer. Catch that and return early.
>>>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Shawn Lee <shawn.c.lee@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>> index 0e21ce9d3e5a..61abfb505766 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>> @@ -349,6 +349,9 @@ i915_gem_userptr_release(struct 
>>> drm_i915_gem_object *obj)
>>>   {
>>>       GEM_WARN_ON(obj->userptr.page_ref);
>>> +    if (!obj->userptr.notifier.mm)
>>> +        return;
>>> +
>>> mmu_interval_notifier_remove(&obj->userptr.notifier);
>>>       obj->userptr.notifier.mm = NULL;
>>>   }
