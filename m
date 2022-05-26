Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF96534D53
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 12:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74210F063;
	Thu, 26 May 2022 10:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C9C10F061;
 Thu, 26 May 2022 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653560998; x=1685096998;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BWEi/uo+RKpXvSMjt6JAPWUfVVbM/L8mnQ3keKLD3U0=;
 b=BqF4A2dPCy2CWyuIF6qxtCMxSLN5WKEdC90dQfdmsZCeOe94RW8lTy3G
 rXtXRxEMvRYPrlVUD8Mh1Rt+bQMEuzN2sTV43XN7JkhXjc18Lh+WzupSl
 +7lEWUJqw/2abbC3IJnuf0fgRT7axbx/xaakxUEd869F/i/O0mLHZPR5+
 pRq2t5+dvOfjqNa9FXSZs1h8+juRXL3ToEH2YhebcGkvxb5FzsKwqV2Tw
 UmgCQfj5rMR3Obcniz1q3fK7NCORT8IJdBbIhkT9Rf2EsrrhM76/3MuIw
 28BFOHGzCy1pnkzyB8azGEn5Hfdu8wFK6ZOSWhkx3CFby4+RjZIrmA7gJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274219107"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="274219107"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 03:29:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="664873468"
Received: from tkinch-mobl.ger.corp.intel.com (HELO [10.213.214.182])
 ([10.213.214.182])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 03:29:51 -0700
Message-ID: <1ac432c1-a8fb-71fd-4e66-94aa3f80debf@linux.intel.com>
Date: Thu, 26 May 2022 11:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/i915/dg2: Catch and log more unexpected values in
 DG1_MSTR_TILE_INTR
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220524094339.1692212-1-tvrtko.ursulin@linux.intel.com>
 <Yo0bBxHBH8cZcnN4@mdroper-desk1.amr.corp.intel.com>
 <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
 <20220525181417.wnilka4bigyi5fle@ldmartin-desk2>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220525181417.wnilka4bigyi5fle@ldmartin-desk2>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/05/2022 19:14, Lucas De Marchi wrote:
> On Wed, May 25, 2022 at 05:03:13PM +0100, Tvrtko Ursulin wrote:
>>
>> On 24/05/2022 18:51, Matt Roper wrote:
>>> On Tue, May 24, 2022 at 10:43:39AM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Catch and log any garbage in the register, including no tiles 
>>>> marked, or
>>>> multiple tiles marked.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>> We caught garbage in DG1_MSTR_TILE_INTR with DG2 (actual value 
>>>> 0xF9D2C008)
>>>> during glmark and more badness. So I thought lets log all possible 
>>>> failure
>>>> modes from here and also use per device logging.
>>>> ---
>>>>  drivers/gpu/drm/i915/i915_irq.c | 33 ++++++++++++++++++++++-----------
>>>>  drivers/gpu/drm/i915/i915_reg.h |  1 +
>>>>  2 files changed, 23 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_irq.c 
>>>> b/drivers/gpu/drm/i915/i915_irq.c
>>>> index 73cebc6aa650..79853d3fc1ed 100644
>>>> --- a/drivers/gpu/drm/i915/i915_irq.c
>>>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>>>> @@ -2778,24 +2778,30 @@ static irqreturn_t dg1_irq_handler(int irq, 
>>>> void *arg)
>>>>      u32 gu_misc_iir;
>>>>      if (!intel_irqs_enabled(i915))
>>>> -        return IRQ_NONE;
>>>> +        goto none;
>>>>      master_tile_ctl = dg1_master_intr_disable(regs);
>>>> -    if (!master_tile_ctl) {
>>>> -        dg1_master_intr_enable(regs);
>>>> -        return IRQ_NONE;
>>>> +    if (!master_tile_ctl)
>>>> +        goto enable_none;
>>>> +
>>>> +    if (master_tile_ctl & ~(DG1_MSTR_IRQ | DG1_MSTR_TILE_MASK)) {
>>>> +        drm_warn(&i915->drm, "Garbage in master_tile_ctl: 0x%08x!\n",
>>>> +             master_tile_ctl);
>>>
>>> I know we have a bunch of them already, but shouldn't we be avoiding
>>> printk-based stuff like this inside interrupt handlers?  Should we be
>>> migrating all these error messages over to trace_printk or something
>>> similar that's safer to use?
>>
>> Not sure - I kind of think some really unexpected and worrying 
>> situations should be loud and on by default. Risk is then spam if not 
>> ratelimited. Maybe we should instead ratelimit most errors/warnings 
>> coming for irq handlers?
>>
>> In this particular case at least DRM_ERROR with no device info is the 
>> odd one out in the entire file so I'd suggest changing at least that, 
>> if the rest of my changes is of questionable benefit.
> 
> I'd rather remove the printk's from irq rather than adding more. At the 
> very
> least, they should be the _once variant or ratelimited. One of the few
> cases to even deserve a unlikely(), even to document this shouldn't
> really be happening.

I would support ratelimited for all the unexpected bits set, no bits 
set, or similar conditions. I wouldn't remove such printks to 
micro-optimize things. That would potentially lose important feedback in 
cases when we hit truly unexpected situations.

But annotating them as unlikely would be a good thing.

> Our irq handlers (particularly on dgfx and multi-gt) are already too
> long running... I don't like making them any onger or slower.

How come? I mean which interrupts are a problem there? Isn't GuC 
supposed to be taking on that load on itself, isn't that one of the main 
selling points?

Regards,

Tvrtko
