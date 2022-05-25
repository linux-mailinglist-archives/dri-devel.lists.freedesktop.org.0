Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C1534101
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 18:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B406C10E173;
	Wed, 25 May 2022 16:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C9510E173;
 Wed, 25 May 2022 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653494744; x=1685030744;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yCXllhI0kzcmnCZ6nkadcuv8JacFGkoYPJVzCiTjuoY=;
 b=gvJ8F+vJEdpl4R9EBKW7xPIK/iJ1N+X6Z2F87qVL4/6t9BrSoEfR5/FN
 fl4VhOuvRoiLF7Gb0Xb0TkKew74GEUmTUmjyCAhYeBcQQlgXPXeTbYVQ7
 gMJVjz6f8Ej/kb/idLkFNw9VClNhv0pGGOIdptj2nKm2TE7tu38D9TZT4
 5UFmGo4AG/zEZrzFgOsMkoRX7MzSVGhUcl5pFqJ0QDSL1D3U8kziDfFu6
 lDmLhCcR6rPiYePeJZTbEQq57sjAQ176APYrNFbvnVXlLIITksP4+YYIV
 54Dxav9i/PjwXhRWOzGQ6rBXkhYpVsg875ASeB/hFjAzdc0O59Pdm62Ca Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="273855111"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="273855111"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 09:03:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="676923259"
Received: from isobansk-mobl.ger.corp.intel.com (HELO [10.213.230.191])
 ([10.213.230.191])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 09:03:15 -0700
Message-ID: <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
Date: Wed, 25 May 2022 17:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/i915/dg2: Catch and log more unexpected values in
 DG1_MSTR_TILE_INTR
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220524094339.1692212-1-tvrtko.ursulin@linux.intel.com>
 <Yo0bBxHBH8cZcnN4@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yo0bBxHBH8cZcnN4@mdroper-desk1.amr.corp.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2022 18:51, Matt Roper wrote:
> On Tue, May 24, 2022 at 10:43:39AM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Catch and log any garbage in the register, including no tiles marked, or
>> multiple tiles marked.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> We caught garbage in DG1_MSTR_TILE_INTR with DG2 (actual value 0xF9D2C008)
>> during glmark and more badness. So I thought lets log all possible failure
>> modes from here and also use per device logging.
>> ---
>>   drivers/gpu/drm/i915/i915_irq.c | 33 ++++++++++++++++++++++-----------
>>   drivers/gpu/drm/i915/i915_reg.h |  1 +
>>   2 files changed, 23 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>> index 73cebc6aa650..79853d3fc1ed 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.c
>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>> @@ -2778,24 +2778,30 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>   	u32 gu_misc_iir;
>>   
>>   	if (!intel_irqs_enabled(i915))
>> -		return IRQ_NONE;
>> +		goto none;
>>   
>>   	master_tile_ctl = dg1_master_intr_disable(regs);
>> -	if (!master_tile_ctl) {
>> -		dg1_master_intr_enable(regs);
>> -		return IRQ_NONE;
>> +	if (!master_tile_ctl)
>> +		goto enable_none;
>> +
>> +	if (master_tile_ctl & ~(DG1_MSTR_IRQ | DG1_MSTR_TILE_MASK)) {
>> +		drm_warn(&i915->drm, "Garbage in master_tile_ctl: 0x%08x!\n",
>> +			 master_tile_ctl);
> 
> I know we have a bunch of them already, but shouldn't we be avoiding
> printk-based stuff like this inside interrupt handlers?  Should we be
> migrating all these error messages over to trace_printk or something
> similar that's safer to use?

Not sure - I kind of think some really unexpected and worrying 
situations should be loud and on by default. Risk is then spam if not 
ratelimited. Maybe we should instead ratelimit most errors/warnings 
coming for irq handlers?

In this particular case at least DRM_ERROR with no device info is the 
odd one out in the entire file so I'd suggest changing at least that, if 
the rest of my changes is of questionable benefit.

Regards,

Tvrtko

> 
> 
> Matt
> 
>> +		goto enable_none;
>>   	}
>>   
>>   	/* FIXME: we only support tile 0 for now. */
>> -	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
>> -		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
>> -		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
>> -	} else {
>> -		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
>> -		dg1_master_intr_enable(regs);
>> -		return IRQ_NONE;
>> +	if (REG_FIELD_GET(DG1_MSTR_TILE_MASK, master_tile_ctl) !=
>> +	    DG1_MSTR_TILE(0)) {
>> +		drm_warn(&i915->drm, "Unexpected irq from tile %u!\n",
>> +			 ilog2(REG_FIELD_GET(DG1_MSTR_TILE_MASK,
>> +					     master_tile_ctl)));
>> +		goto enable_none;
>>   	}
>>   
>> +	master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
>> +	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
>> +
>>   	gen11_gt_irq_handler(gt, master_ctl);
>>   
>>   	if (master_ctl & GEN11_DISPLAY_IRQ)
>> @@ -2810,6 +2816,11 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>   	pmu_irq_stats(i915, IRQ_HANDLED);
>>   
>>   	return IRQ_HANDLED;
>> +
>> +enable_none:
>> +	dg1_master_intr_enable(regs);
>> +none:
>> +	return IRQ_NONE;
>>   }
>>   
>>   /* Called from drm generic code, passed 'crtc' which
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index d8579ab9384c..eefa301c6430 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -5774,6 +5774,7 @@
>>   
>>   #define DG1_MSTR_TILE_INTR		_MMIO(0x190008)
>>   #define   DG1_MSTR_IRQ			REG_BIT(31)
>> +#define   DG1_MSTR_TILE_MASK		REG_GENMASK(3, 0)
>>   #define   DG1_MSTR_TILE(t)		REG_BIT(t)
>>   
>>   #define GEN11_DISPLAY_INT_CTL		_MMIO(0x44200)
>> -- 
>> 2.32.0
>>
> 
