Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD04B8507
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C7710E9D6;
	Wed, 16 Feb 2022 09:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A61510E9C6;
 Wed, 16 Feb 2022 09:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645005507; x=1676541507;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2Nl47R+l/Dyorm/plhVMc/vkL37v28gUnjuXNQsPVTw=;
 b=bxgpQMfjk6IssU3fRQF3bQ+LSrNTwc5iw6+YC7N+Rv8yN3sBL0oJlxk4
 SX+wCJ11PlJTtxjUGGxzZNMGM8Tin0bdJhdaDKZfNerBlP2nReFaPZcH2
 npQ5Y/tXb32SJCx5nPuBAaNiuwHH4zpj7YU7nvw4nwTT1ZHRsc1VjoeKZ
 cX6B+whTkT/N8HXLn8p4yH2FyGPOK/RovLRHnoYyNqx4mWnhrZvmjfbIr
 IBMGGxMd8KbTz1EkOLSXgHhexMM/e9k/zIJiMeL5P1zctn+n5T2Smm4zR
 zJPmz7hckNbw/pnjZAzsfEM4b23nCwN6Lx5UVUADPu5LhFXhKcf/i3oX/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230529728"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="230529728"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:57:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="502952891"
Received: from sphadnis-mobl1.amr.corp.intel.com (HELO [10.212.82.113])
 ([10.212.82.113])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:57:52 -0800
Message-ID: <9a7b0e48-b00f-be11-7fc7-bc26719cbc1e@linux.intel.com>
Date: Wed, 16 Feb 2022 09:57:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915/gt: fix unsigned integer to signed assignment
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20220216083849.91239-1-jiapeng.chong@linux.alibaba.com>
 <87h78z5gmp.fsf@intel.com> <YgzBpX2SKCh4cb19@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YgzBpX2SKCh4cb19@intel.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 rodrigo.vivi@intel.com, christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/02/2022 09:19, Ville Syrjälä wrote:
> On Wed, Feb 16, 2022 at 11:02:06AM +0200, Jani Nikula wrote:
>> On Wed, 16 Feb 2022, Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:
>>> Eliminate the follow smatch warning:
>>>
>>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4640
>>> guc_create_virtual() warn: assigning (-2) to unsigned variable
>>> 've->base.instance'.
>>>
>>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4641
>>> guc_create_virtual() warn: assigning (-2) to unsigned variable
>>> 've->base.uabi_instance'.
>>>
>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>>
>> The report seems to be valid, but I don't think this is the fix.
>>
>> Where do we even check for invalid instance/uabi_instance in code?
> 
> The whole thing seems rather poorly documented as there's a matching
> uabi struct with __u16's and the negative values are defined right
> there in the uapi header as well.

Negative ones are exception values to be used in conjunction with the virtual engine uapi (see "DOC: Virtual Engine uAPI" and also comment next to I915_CONTEXT_PARAM_ENGINES).

AFAIK assigning negative int to unsigned int is defined and fine.

Compiler does warn on comparisons which is why we have:

./gem/i915_gem_busy.c:  if (id == (u16)I915_ENGINE_CLASS_INVALID)
./gem/i915_gem_busy.c:  if (id == (u16)I915_ENGINE_CLASS_INVALID)
./gem/i915_gem_context.c:               if (ci.engine_class == (u16)I915_ENGINE_CLASS_INVALID &&
./gem/i915_gem_context.c:                   ci.engine_instance == (u16)I915_ENGINE_CLASS_INVALID_NONE)

So I think no action needed here.

Regards,

Tvrtko
  
>>
>> BR,
>> Jani.
>>
>>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>> index 36365bdbe1ee..dc7cc06c68e7 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>> @@ -328,10 +328,10 @@ struct intel_engine_cs {
>>>   	intel_engine_mask_t logical_mask;
>>>   
>>>   	u8 class;
>>> -	u8 instance;
>>> +	s8 instance;
>>>   
>>>   	u16 uabi_class;
>>> -	u16 uabi_instance;
>>> +	s16 uabi_instance;
>>>   
>>>   	u32 uabi_capabilities;
>>>   	u32 context_size;
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
> 
