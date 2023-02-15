Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA736977D1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 09:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B7410EA63;
	Wed, 15 Feb 2023 08:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CB810EA63;
 Wed, 15 Feb 2023 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676448855; x=1707984855;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RNKQox9CFqVlAFMw/lwU6eu6LZATD/8ysyzEDjMc2io=;
 b=YULl/UES9YCCCovarTPYYFiiGD5WjD2kh56yF5M8nI7y0lBVrzqWrDt1
 JkLidRgSzzXuXQDJE07Jg6WRAFMdXBQmfjkXrIyEoOuLmuORkur84IVgJ
 qanBfFelYA/0pif6sviwG/yTKGQP8+srqkJG+SzQ7CwQ8E+fcSGic3ocO
 B75serXTfpjG4vHVIuPdqI9FtQxgHF9QevyVn3tlY58O41yJuPSDpJMs7
 Qm/vZYug3x5b783rUr1zD8oUu14xkncI58exJ3ulv42SR3yzRPp0StLVR
 gyyNqc6ZpZDRofph31QlFrYUxsD+CWCFYcu3uEY4u8KAcgjhEdv8SYzu1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="315026190"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="315026190"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 00:14:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701937706"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="701937706"
Received: from odaniele-mobl2.ger.corp.intel.com (HELO [10.213.228.205])
 ([10.213.228.205])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 00:14:14 -0800
Message-ID: <6c122e1a-6634-fdbd-005b-abaa390f4656@linux.intel.com>
Date: Wed, 15 Feb 2023 08:14:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Consolidate TLB invalidation flow
To: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20230201165146.4056691-1-tvrtko.ursulin@linux.intel.com>
 <f575e344-e915-c85f-49cd-28fa426bcfd6@intel.com>
 <117482b6-7baf-5b79-27ed-7c33630bd86d@linux.intel.com>
 <983c9904-e9f7-1aa2-fb8c-738ad47195a7@intel.com>
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <983c9904-e9f7-1aa2-fb8c-738ad47195a7@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/02/2023 09:39, Andrzej Hajda wrote:
> On 02.02.2023 09:33, Tvrtko Ursulin wrote:
>>
>> On 02/02/2023 07:43, Andrzej Hajda wrote:
>>> On 01.02.2023 17:51, Tvrtko Ursulin wrote:
>>
>> [snip]
>>
>>
>>
>> Btw - do you have any idea why the test is suppressed already?! CI 
>> told me BAT was a success...
> 
> 
> Except this patch, igt@i915_selftest@live@gt_tlb always succeeds[1][2]. 
> So I guess this is just CI logic which do not trust new tests, sounds 
> reasonable. Lets wait few days to see if it changes.

Did another run and it is all still green. Also have another r-b from 
Matt now. Okay to merge from your point of view?

Regards,

Tvrtko

> [1]: 
> http://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=d3cc1f04e52acd0f911cd54fd855a3f085a40e14
> [2]: 
> https://lore.kernel.org/intel-gfx/?q=igt%40i915_selftest%40live%40gt_tlb
> 
> 
> Regards
> Andrzej
> 
>>
>> Regards,
>>
>> Tvrtko
> 
