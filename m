Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B629B5796D7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A3E11AFB5;
	Tue, 19 Jul 2022 09:57:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFBB11B92A;
 Tue, 19 Jul 2022 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658224619; x=1689760619;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ug1RSPJP3dXyVvhWyJLd8eK1kcXS/u3k8TcWfFrWyV4=;
 b=Yzahm3jgCVAhGd70uWiXgQnWKzdhnDQMRy9lq4Uhccnw/4cfZv58/2Bg
 /oFO7oezEslqGBH+AW4dmDF59GOkFvBxEOmZoiGHdi3i3cRgpRYQTSwJK
 FZ0vqZYUVi3qsZS0Mil1TTDLE5vanZ/y1lLa0b/fsq0RuC2LBN8cLVeF5
 zroghzcNG/QTbejEUffho3MktUgC9vxBe4nqm7f7rgaOLWz/CgDaGzdeR
 gsnqpzyjgjRl59XaxtK6eNjCFJ29qgLMn/PsS6poeFbdk024mCbXS1ROq
 YyUEGUvl4X0zsfsMa0XAVVyByjm+6/UqdCErUTrt/hmggiuXUoJC8nDk0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269474832"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="269474832"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:56:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="601535797"
Received: from ssherida-mobl.ger.corp.intel.com (HELO [10.213.201.170])
 ([10.213.201.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:56:56 -0700
Message-ID: <1f306c55-8443-72b3-a419-40f3cb85b76c@linux.intel.com>
Date: Tue, 19 Jul 2022 10:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 10/12] drm/i915/guc: Support larger contexts
 on newer hardware
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-11-John.C.Harrison@Intel.com>
 <3c8e8b71-1c74-c50d-7b29-29430a11eb10@linux.intel.com>
 <e7673834-a795-8364-96d9-7075bd407ee6@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e7673834-a795-8364-96d9-7075bd407ee6@intel.com>
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


On 19/07/2022 01:13, John Harrison wrote:
> On 7/18/2022 05:35, Tvrtko Ursulin wrote:
>>
>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>> From: Matthew Brost <matthew.brost@intel.com>
>>>
>>> The GuC needs a copy of a golden context for implementing watchdog
>>> resets (aka media resets). This context is larger on newer platforms.
>>> So adjust the size being allocated/copied accordingly.
>>
>> What were the consequences of this being too small? Media watchdog 
>> reset broken impacting userspace? Platforms? Do we have an IGT 
>> testcase? Do we need a Fixes: tag? Copy stable?
> Yes. Not sure if we have an IGT for the media watchdog. I recall writing 
> something a long time back but I don't think it ever got merged due to 
> push back that I don't recall right now. And no because it only affects 
> DG2 onwards which is still forceprobed.

Right, hm, I don't know if the MBD SKU promise for DG2 relies on force 
probe removal or not. My impression certainly was that a bunch of uapi 
we recently merged made people happy in that respect - that we satisfied 
the commit to deliver that support with 5.19. Maybe I am wrong, or 
perhaps to err on the side of safety you could add the right Fixes: tag 
regardless? Pick some patch which enables GuC for DG2 if there isn't 
anything better I guess. Or you could check with James.

Regards,

Tvrtko

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
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>> index ba7541f3ca610..74cbe8eaf5318 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>> @@ -464,7 +464,11 @@ static void fill_engine_enable_masks(struct 
>>> intel_gt *gt,
>>>   }
>>>     #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
>>> -#define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
>>> +#define XEHP_LR_HW_CONTEXT_SIZE (96 * sizeof(u32))
>>> +#define LR_HW_CONTEXT_SZ(i915) (GRAPHICS_VER_FULL(i915) >= 
>>> IP_VER(12, 50) ? \
>>> +                    XEHP_LR_HW_CONTEXT_SIZE : \
>>> +                    LR_HW_CONTEXT_SIZE)
>>> +#define LRC_SKIP_SIZE(i915) (LRC_PPHWSP_SZ * PAGE_SIZE + 
>>> LR_HW_CONTEXT_SZ(i915))
>>>   static int guc_prep_golden_context(struct intel_guc *guc)
>>>   {
>>>       struct intel_gt *gt = guc_to_gt(guc);
>>> @@ -525,7 +529,7 @@ static int guc_prep_golden_context(struct 
>>> intel_guc *guc)
>>>            * on all engines).
>>>            */
>>>           ads_blob_write(guc, ads.eng_state_size[guc_class],
>>> -                   real_size - LRC_SKIP_SIZE);
>>> +                   real_size - LRC_SKIP_SIZE(gt->i915));
>>>           ads_blob_write(guc, ads.golden_context_lrca[guc_class],
>>>                      addr_ggtt);
>>>   @@ -599,7 +603,7 @@ static void guc_init_golden_context(struct 
>>> intel_guc *guc)
>>>           }
>>>             GEM_BUG_ON(ads_blob_read(guc, 
>>> ads.eng_state_size[guc_class]) !=
>>> -               real_size - LRC_SKIP_SIZE);
>>> +               real_size - LRC_SKIP_SIZE(gt->i915));
>>>           GEM_BUG_ON(ads_blob_read(guc, 
>>> ads.golden_context_lrca[guc_class]) != addr_ggtt);
>>>             addr_ggtt += alloc_size;
> 
