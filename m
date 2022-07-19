Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2D57967E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA74D12BE98;
	Tue, 19 Jul 2022 09:42:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9912BEB4;
 Tue, 19 Jul 2022 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658223725; x=1689759725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OarTs8EUcTh1i0l8yZjkfehzkHqJVaej9X/AGltyPFE=;
 b=R1F2X0PjD5jDKMTE80xfQ8vrUF6aYo3jxw3h8mNrh7QlKFDuRL1T+tWB
 Y/UGio0Mtl4Y7UC9+yrwhHhXVg34sMzLRVXL6U+ElNEcU8MUypdXGyK/X
 dnQxJZ5ZVTdiOTviT+dQFeGeJAeIVXh91+I8es2Bmv1obxIbJaLvNdt5y
 9Mc+eVSCo0L2Pi+HlDLH8pw0m7dM4jQtyIj1z3o+yCrlyqp5N0kkgl8Ih
 XSeGdNg7S2timsIv+f8yfae55GPEIX/RCrelj+cVJFhC2UfvVtACcONP9
 fjWIJQY4jtjApO4WLJVWSVDn0bmU7qKdlmyiWbI8xgiLOsR835kNcd00P w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350411256"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="350411256"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:42:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="601531469"
Received: from ssherida-mobl.ger.corp.intel.com (HELO [10.213.201.170])
 ([10.213.201.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:42:03 -0700
Message-ID: <0337c3d4-811e-1f5a-fe26-f0e8068497b8@linux.intel.com>
Date: Tue, 19 Jul 2022 10:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/i915: Remove bogus GEM_BUG_ON in
 unpark
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-2-John.C.Harrison@Intel.com>
 <d1cfac14-4c01-ce53-586f-01f8998bbab4@linux.intel.com>
 <c86064c9-cbcc-cdc5-0654-0493c8d3d444@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c86064c9-cbcc-cdc5-0654-0493c8d3d444@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/07/2022 01:05, John Harrison wrote:
> On 7/18/2022 05:15, Tvrtko Ursulin wrote:
>>
>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>> From: Matthew Brost <matthew.brost@intel.com>
>>>
>>> Remove bogus GEM_BUG_ON which compared kernel context timeline seqno to
>>> seqno in memory on engine PM unpark. If a GT reset occurred these values
>>> might not match as a kernel context could be skipped. This bug was
>>> hidden by always switching to a kernel context on park (execlists
>>> requirement).
>>
>> Reset of the kernel context? Under which circumstances does that happen?
> As per description, the issue is with full GT reset.
> 
>>
>> It is unclear if the claim is this to be a general problem or the 
>> assert is only invalid with the GuC. Lack of a CI reported issue 
>> suggests it is not a generic problem?
> Currently it is not an issue because we always switch to the kernel 
> context because that's how execlists works and the entire driver is 
> fundamentally based on execlist operation. When we stop using the kernel 
> context as a (non-functional) barrier when using GuC submission, then 
> you would see an issue without this fix.

Issue is with GuC, GuC and full reset, or with full reset regardless of 
the backend?

If issue is only with GuC patch should have drm/i915/guc prefix as 
minimum. But if it actually only becomes a problem when GuC backend 
stops parking with the kernel context when I think the whole unpark code 
should be refactored in a cleaner way than just removing the one assert. 
Otherwise what is the point of leaving everything else in there?

Or if the issue is backend agnostic, *if* full reset happens to hit 
during parking, then it is different. Wouldn't that be a race with 
parking and reset which probably shouldn't happen to start with.

Regards,

Tvrtko

> 
> John.
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> index b0a4a2dbe3ee9..fb3e1599d04ec 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> @@ -68,8 +68,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
>>>                ce->timeline->seqno,
>>>                READ_ONCE(*ce->timeline->hwsp_seqno),
>>>                ce->ring->emit);
>>> -        GEM_BUG_ON(ce->timeline->seqno !=
>>> -               READ_ONCE(*ce->timeline->hwsp_seqno));
>>>       }
>>>         if (engine->unpark)
> 
