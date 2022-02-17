Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888044BA6C0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA3D10EC1D;
	Thu, 17 Feb 2022 17:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BE710EC0F;
 Thu, 17 Feb 2022 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645117831; x=1676653831;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RV1/zRyEwCoR8FZXhaBDTe01G9IyU/7jozYmZfAU5/0=;
 b=PDh9U/EHCBs63SPD2o/tkYlGmH0bW157PVLaSu4F+3oJf6XgpKoq/QQP
 Zy07baWs4vtB8LPmhJ2zLhjCk5sCz+u6iF5itc0q8vauQ7zCfMTvxfqCm
 r9K/+SmZRSM/blS9iyTJXNOxcBTHoVTHPO9873sf99CsP+4j1q0wcEwTf
 no3MKN4vcpsOG+VTel6+Re/54wQNUhbdLJI0kmHGQzXI8spsSc0x7N/R1
 01DTfPL0ysrA0iVl9t6tpv7pbqAcTfMaXPtQwBis4zYN1eRVUnpRDvCB/
 hU2A+ev3FywHDFsLOi/thd73V6Yfv8oIl9tz2iBRNLZw0JZHDafn0cIk8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="275514540"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="275514540"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:09:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530368756"
Received: from markorti-mobl.ger.corp.intel.com (HELO [10.213.216.21])
 ([10.213.216.21])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:09:32 -0800
Message-ID: <1f5d5458-0602-fb17-6f65-8dac25ffd47f@linux.intel.com>
Date: Thu, 17 Feb 2022 17:09:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Correct the param count
 for unset param
Content-Language: en-US
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220216181504.7155-1-vinay.belgaumkar@intel.com>
 <9c817a6f-ba41-1b68-5a7a-30032881057b@linux.intel.com>
 <8e9b9f61-d0ad-9278-4ba8-08a934cfacb6@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <8e9b9f61-d0ad-9278-4ba8-08a934cfacb6@intel.com>
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


On 17/02/2022 17:04, Belgaumkar, Vinay wrote:
> 
> On 2/17/2022 1:41 AM, Tvrtko Ursulin wrote:
>>
>> On 16/02/2022 18:15, Vinay Belgaumkar wrote:
>>> SLPC unset param H2G only needs one parameter - the id of the
>>> param.
>>>
>>> Fixes: 025cb07bebfa ("drm/i915/guc/slpc: Cache platform frequency 
>>> limits")
>>
>> How serious is this? Does it need backporting? If so:
>>
>> Cc: <stable@vger.kernel.org> # v5.15+
>>
>> ?
> 
> This path (unset_param) is not being exercised currently, so not very 
> serious.

Got it, and looking at the code it seems to hold - no possible entry to 
the path at the moment.

Note for the future - this is useful stuff to put in commit messages, 
especially when Fixes: is present. ;)

Regards,

Tvrtko


> Thanks,
> 
> Vinay.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> index 13b27b8ff74e..ba21ace973da 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> @@ -110,7 +110,7 @@ static int guc_action_slpc_unset_param(struct 
>>> intel_guc *guc, u8 id)
>>>   {
>>>       u32 request[] = {
>>>           GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>>> -        SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
>>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
>>>           id,
>>>       };
