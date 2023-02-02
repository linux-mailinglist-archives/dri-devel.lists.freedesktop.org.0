Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA7687790
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A84889E69;
	Thu,  2 Feb 2023 08:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A9F89E69;
 Thu,  2 Feb 2023 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675326833; x=1706862833;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XGTDp8W7XRfYPuIJkD1Dz3Qfs9vsgyne6qOAFPTdulY=;
 b=Qh5W6yeARGREhz0N/rxEeoTl+hCfslN8NZ0OYq3gA203cVQwsOmuJbp3
 1jZSqhAJI8VT4OlT9kP7mBmb0hFhm3xmSd6nKP2uGongf86wxnJaEqRku
 peofDlzisnpVFzF13nzBlZhPblHQzZsqMQ5Q/YVZBfOVoSkasqNyuHYR7
 aYaXJSDv738M+M2xU4xxythTOGDcksWdPcKG9OySbw2lD6z/BNtwYN56J
 LUcVWctb+pVuveQKeWTCKjntxOaq6Z3Lqt678byrwrp7fcObDIXc9VTV3
 m6cDZwuMo/80N/eYVC8tp3gLytKE5Hoc6ePHwNUC+VXVcGvC5qPTFtQkT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308731575"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="308731575"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 00:33:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993996851"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="993996851"
Received: from stirulak-mobl3.ger.corp.intel.com (HELO [10.213.219.106])
 ([10.213.219.106])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 00:33:52 -0800
Message-ID: <117482b6-7baf-5b79-27ed-7c33630bd86d@linux.intel.com>
Date: Thu, 2 Feb 2023 08:33:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Consolidate TLB invalidation flow
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20230201165146.4056691-1-tvrtko.ursulin@linux.intel.com>
 <f575e344-e915-c85f-49cd-28fa426bcfd6@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f575e344-e915-c85f-49cd-28fa426bcfd6@intel.com>
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


On 02/02/2023 07:43, Andrzej Hajda wrote:
> On 01.02.2023 17:51, Tvrtko Ursulin wrote:

[snip]

>> +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs 
>> *engine)
>> +{
>> +    static const union intel_engine_tlb_inv_reg gen8_regs[] = {
>> +        [RENDER_CLASS].reg        = GEN8_RTCR,
>> +        [VIDEO_DECODE_CLASS].reg    = GEN8_M1TCR, /* , GEN8_M2TCR */
>> +        [VIDEO_ENHANCEMENT_CLASS].reg    = GEN8_VTCR,
>> +        [COPY_ENGINE_CLASS].reg        = GEN8_BTCR,
>> +    };
>> +    static const union intel_engine_tlb_inv_reg gen12_regs[] = {
>> +        [RENDER_CLASS].reg        = GEN12_GFX_TLB_INV_CR,
>> +        [VIDEO_DECODE_CLASS].reg    = GEN12_VD_TLB_INV_CR,
>> +        [VIDEO_ENHANCEMENT_CLASS].reg    = GEN12_VE_TLB_INV_CR,
>> +        [COPY_ENGINE_CLASS].reg        = GEN12_BLT_TLB_INV_CR,
>> +        [COMPUTE_CLASS].reg        = GEN12_COMPCTX_TLB_INV_CR,
>> +    };
>> +    static const union intel_engine_tlb_inv_reg xehp_regs[] = {
>> +        [RENDER_CLASS].mcr_reg          = XEHP_GFX_TLB_INV_CR,
>> +        [VIDEO_DECODE_CLASS].mcr_reg      = XEHP_VD_TLB_INV_CR,
>> +        [VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
>> +        [COPY_ENGINE_CLASS].mcr_reg      = XEHP_BLT_TLB_INV_CR,
>> +        [COMPUTE_CLASS].mcr_reg          = XEHP_COMPCTX_TLB_INV_CR,
>> +    };
>> +    struct drm_i915_private *i915 = engine->i915;
>> +    const union intel_engine_tlb_inv_reg *regs;
>> +    union intel_engine_tlb_inv_reg reg;
>> +    unsigned int class = engine->class;
>> +    unsigned int num = 0;
>> +    u32 val;
>> +
>> +    /*
>> +     * New platforms should not be added with catch-all-newer (>=)
>> +     * condition so that any later platform added triggers the below 
>> warning
>> +     * and in turn mandates a human cross-check of whether the 
>> invalidation
>> +     * flows have compatible semantics.
>> +     *
>> +     * For instance with the 11.00 -> 12.00 transition three out of five
>> +     * respective engine registers were moved to masked type. Then 
>> after the
>> +     * 12.00 -> 12.50 transition multi cast handling is required too.
>> +     */
>> +
>> +    if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
>> +        GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
>> +        regs = xehp_regs;
>> +        num = ARRAY_SIZE(xehp_regs);
>> +    } else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
>> +           GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
>> +        regs = gen12_regs;
>> +        num = ARRAY_SIZE(gen12_regs);
>> +    } else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
>> +        regs = gen8_regs;
>> +        num = ARRAY_SIZE(gen8_regs);
>> +    } else if (GRAPHICS_VER(i915) < 8) {
>> +        return 0;
>> +    }
>> +
>> +    if (gt_WARN_ONCE(engine->gt, !num,
>> +             "Platform does not implement TLB invalidation!"))
>> +        return -ENODEV;
>> +
>> +    if (gt_WARN_ON_ONCE(engine->gt,
>> +                 class >= num ||
>> +                 (!regs[class].reg.reg &&
>> +                  !regs[class].mcr_reg.reg)))
>> +        return -ERANGE;
>> +
>> +    reg = regs[class];
>> +
>> +    if (GRAPHICS_VER(i915) == 8 && class == VIDEO_DECODE_CLASS) {
> 
> As selftest pointed out it should cover also gen 9-11.
> Btw maybe it is worth to convert this pseudo array indexing to direct 
> assignment:
> if ((GRAPHICS_VER(i915) <= 11 && class == VIDEO_DECODE_CLASS && 
> engine->instance == 1) {
>      reg.reg = GEN8_M2TCR;
>      val = 0;
> }

Yes good call, v4 sent.

Btw - do you have any idea why the test is suppressed already?! CI told 
me BAT was a success...

Regards,

Tvrtko
