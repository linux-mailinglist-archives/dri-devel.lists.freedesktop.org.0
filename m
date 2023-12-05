Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D233D804FC5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8459010E4C6;
	Tue,  5 Dec 2023 10:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F152710E4C6;
 Tue,  5 Dec 2023 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701770725; x=1733306725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bd8s5lBFO1g3uZrQdXrfJvJyjA3WX4Gp4e1cYLPgeWM=;
 b=BWcM3252bXlVRAtsAdPE0qJ1HSEhxiy00DcA0B5kEzJASBBGYMiHe2Ir
 EtR9kiKU47F/PWQDHzZ95IdXPIl1wJhNSXnrzhO3+LvLcAV6G1yG26d/h
 E3B4Sw8yiRqw5UGoozCvT2dGfJuvC2qbp4AinqYaD+JZVng6OEjMVeI+Y
 DJkcsSTIHPB5ew7qQ7IBeHqWOovX5KSAQYT2tdsj/PrnE2RIzPRRz03pX
 lLXi0q2mIJ0gwMrD7FuFct/Jas/oDUyKcp59IHXnpPj8xmvGW97D7h+Mu
 J7uuUdLAuvt+GEy+1a3QVlgQ/aIVO50Xzg/yiG+IG+aYKkUpyL9Xyj9gs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="374059110"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="374059110"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 02:05:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764273562"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="764273562"
Received: from ctgorman-mobl.ger.corp.intel.com (HELO [10.213.202.242])
 ([10.213.202.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 02:05:22 -0800
Message-ID: <ddde1612-bfd1-4892-b915-87034a0a7cb3@linux.intel.com>
Date: Tue, 5 Dec 2023 10:05:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Reduce log severity on reset
 prepare.
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20231201154443.16660-1-nirmoy.das@intel.com>
 <cff13a24-2f7f-4d44-8fd4-a45cbfa1c76e@linux.intel.com>
 <d50cc22d-670a-49e3-92c7-361fdac66fc6@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <d50cc22d-670a-49e3-92c7-361fdac66fc6@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/12/2023 08:50, Nirmoy Das wrote:
> Hi Tvrtko,
> 
> On 12/5/2023 9:34 AM, Tvrtko Ursulin wrote:
>>
>> On 01/12/2023 15:44, Nirmoy Das wrote:
>>> gen8_engine_reset_prepare() can fail when HW fails to set
>>> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
>>> error as driver will retry.
>>>
>>> Let the caller of gen8_engine_reset_prepare() decide if a
>>> failure in gen8_engine_reset_prepare is an error or not.
>>
>> No complaints per se but I don't see the caller deciding and it is not 
>> really reducing log level but converting to trace. So commit message 
>> and patch do not align for me which I think should be improved.
> 
> 
> I meant the return value is checked by the caller, gen8_reset_engines(). 
> I will resend with a improved commit message.

Ah okay, maybe my bad for not figuring out that possibility. I guess it 
might be passable as is, but yes, clearer commit text would be better.

Trace is good enough - we are not usually interested in seeing those as 
dbg/info/notice?

Regards,

Tvrtko

> 
> Thanks,
> 
> Nirmoy
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> index d5ed904f355d..e6fbc6202c80 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct 
>>> intel_engine_cs *engine)
>>>       ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>>>                          700, 0, NULL);
>>>       if (ret)
>>> -        gt_err(engine->gt,
>>> -               "%s reset request timed out: {request: %08x, 
>>> RESET_CTL: %08x}\n",
>>> -               engine->name, request,
>>> -               intel_uncore_read_fw(uncore, reg));
>>> +        GT_TRACE(engine->gt,
>>> +             "%s reset request timed out: {request: %08x, RESET_CTL: 
>>> %08x}\n",
>>> +             engine->name, request,
>>> +             intel_uncore_read_fw(uncore, reg));
>>>         return ret;
>>>   }
