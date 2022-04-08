Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8986F4F922D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E1B10E36C;
	Fri,  8 Apr 2022 09:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640CC10E36C;
 Fri,  8 Apr 2022 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649411106; x=1680947106;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nW+Qw1/raVWP7Zq3uOpGmsaCz35o3QfnAr4BpaRj0Dg=;
 b=TifqtYCSUUhB/1L7Np+U+z30qcMs+seNfFrN/q97/b3hDYFGH6KJF4mD
 kNTb/UHDsciQzSQ9D4ObqOJPYxIxAfJPBoLpXn0c7a5a3OZlzvHAp4nQZ
 4gIh8B48Uh6u/Q0FH3vEPqPu0iT4q1XCGPX+B/SJnIBG6Z2ZhqPsndNDB
 jx19VFJs6slGwqHsvIcUNctek22FWXZDjxCrvVeV7k3w2yij8VyQn1u09
 J9cSViUs4bPESVfPaweRt3cuc53pM2yZ3VSVv//6LkNaXjU7zJiymCrMq
 oVbGtaQVV7XbG79gtI6/B8X7birQdjlD0wTNQ+mNG+aeTA6lpm58IP1AT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="242150698"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="242150698"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:45:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="571431495"
Received: from ddobson-mobl.ger.corp.intel.com (HELO [10.213.224.220])
 ([10.213.224.220])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:45:03 -0700
Message-ID: <5b6a4f83-0a0c-6916-1f75-a44f8b36ade7@linux.intel.com>
Date: Fri, 8 Apr 2022 10:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Use platform specific
 defaults for GuC/HuC enabling
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20210603164812.19045-1-matthew.brost@intel.com>
 <20210603164812.19045-2-matthew.brost@intel.com>
 <062c1a4b-f35d-6ecf-14a0-b41b438d3464@linux.intel.com>
 <006e88f8-38c5-3cda-0c89-cb97fa0cd817@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <006e88f8-38c5-3cda-0c89-cb97fa0cd817@intel.com>
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


On 07/04/2022 21:49, John Harrison wrote:
> On 4/7/2022 08:49, Tvrtko Ursulin wrote:
>> On 03/06/2021 17:48, Matthew Brost wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The meaning of 'default' for the enable_guc module parameter has been
>>> updated to accurately reflect what is supported on current platforms.
>>> So start using the defaults instead of forcing everything off.
>>> Although, note that right now, the default is for everything to be off
>>> anyway. So this is not a change for current platforms.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_params.c | 2 +-
>>>   drivers/gpu/drm/i915/i915_params.h | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_params.c 
>>> b/drivers/gpu/drm/i915/i915_params.c
>>> index 0320878d96b0..e07f4cfea63a 100644
>>> --- a/drivers/gpu/drm/i915/i915_params.c
>>> +++ b/drivers/gpu/drm/i915/i915_params.c
>>> @@ -160,7 +160,7 @@ i915_param_named_unsafe(edp_vswing, int, 0400,
>>>   i915_param_named_unsafe(enable_guc, int, 0400,
>>>       "Enable GuC load for GuC submission and/or HuC load. "
>>>       "Required functionality can be selected using bitmask values. "
>>> -    "(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load)");
>>> +    "(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load)");
>>>     i915_param_named(guc_log_level, int, 0400,
>>>       "GuC firmware logging level. Requires GuC to be loaded. "
>>> diff --git a/drivers/gpu/drm/i915/i915_params.h 
>>> b/drivers/gpu/drm/i915/i915_params.h
>>> index 4a114a5ad000..f27eceb82c0f 100644
>>> --- a/drivers/gpu/drm/i915/i915_params.h
>>> +++ b/drivers/gpu/drm/i915/i915_params.h
>>> @@ -59,7 +59,7 @@ struct drm_printer;
>>>       param(int, disable_power_well, -1, 0400) \
>>>       param(int, enable_ips, 1, 0600) \
>>>       param(int, invert_brightness, 0, 0600) \
>>> -    param(int, enable_guc, 0, 0400) \
>>> +    param(int, enable_guc, -1, 0400) \
>>>       param(int, guc_log_level, -1, 0400) \
>>>       param(char *, guc_firmware_path, NULL, 0400) \
>>>       param(char *, huc_firmware_path, NULL, 0400) \
>>
>> What is the BKM to use this with multi-GPU setups? Specifically I have 
>> a TGL+DG1 laptop (off the shelf) and want to have GuC with DG1 only. 
>> If I pass i915.enable_guc=3 it seems it wants to enable it for TGL as 
>> well and wedges the GPU if it can't?
>>
> I don't think there is one.
> 
> Module parameters are driver global and therefore apply to all cards in 
> the system, both discrete and integrated. The '-1' default can and does 
> have different meanings for each card. So in the TGL+DG1 case, TGL 
> should default to execlist and DG1 should already be defaulting to GuC. 
> So the -1 setting should do what you want. But if you did need to 
> override for one specific card only then I think you would need to do 
> that with a code change and rebuild.

You are right, I was on a kernel where DG1 wasn't yet defaulting to GuC 
hence the confusion when I tried to pass enable_guc=3 that broke TGL as 
well, but because I had no up to date firmware for it.

We really need per device modparams, as long as we have modparams..

Regards,

Tvrtko
