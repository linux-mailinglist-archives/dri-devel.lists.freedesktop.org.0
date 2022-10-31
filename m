Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE2C613717
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5A910E26A;
	Mon, 31 Oct 2022 12:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B855B10E26A;
 Mon, 31 Oct 2022 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667220904; x=1698756904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rSWLdL8m0oCkwslLKnfoICTgEgY3F478zxqvtP/G19w=;
 b=Rx1G+A/jtDx4nD2TLF7/zBLQTmL/1yjukyXNcbqpCacRJbDaSNNOSCFh
 rkEtSJFkNYgdbBhpwysZDcsUgoeZt8DoAhzk18vp2fX16IpIJdJC3eGOz
 QAdGl8p/XfNRKBLjpM52/Iee81frlURrITIYD+zVq7XxIvgkzn1GhoAEF
 41c+mnK5t/zMcdNiQrv41atleU4KA2Cl67Syo+dUsIzj2pachU2sB+Z8x
 dxRnRz8NRzDoaA+ZZELCdpIGCP9lF05GCIkXtT1zHMW3Txjpss8u0bmGV
 RRAp3Ae1lrMLjNV18fggtZvtx2wzh9cFnbVOfbqcJ/BF3JoEQy8EL7sun g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="373099209"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="373099209"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 05:55:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="962767864"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="962767864"
Received: from aawaisi-mobl1.ger.corp.intel.com (HELO [10.213.221.7])
 ([10.213.221.7])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 05:55:02 -0700
Message-ID: <d7eca606-9067-08d2-560f-fc3edf6e8ceb@linux.intel.com>
Date: Mon, 31 Oct 2022 12:55:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/mtl: add GSC CS interrupt support
Content-Language: en-US
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
 <2125e5fd-e8d1-f4c1-7af1-58fb61f38049@linux.intel.com>
 <4bffd427-be49-0e67-b7e1-a5dd565786c6@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4bffd427-be49-0e67-b7e1-a5dd565786c6@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/10/2022 18:00, Ceraolo Spurio, Daniele wrote:
> On 10/28/2022 1:38 AM, Tvrtko Ursulin wrote:
>>
>> On 27/10/2022 23:15, Daniele Ceraolo Spurio wrote:
>>> The GSC CS re-uses the same interrupt bits that the GSC used in older
>>> platforms. This means that we can now have an engine interrupt coming
>>> out of OTHER_CLASS, so we need to handle that appropriately.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c | 78 ++++++++++++++------------
>>>   1 file changed, 43 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>> index f26882fdc24c..34ff1ee7e931 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>> @@ -81,35 +81,27 @@ gen11_other_irq_handler(struct intel_gt *gt, 
>>> const u8 instance,
>>>             instance, iir);
>>>   }
>>>   -static void
>>> -gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
>>> -             const u8 instance, const u16 iir)
>>> +static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 
>>> instance)
>>>   {
>>> -    struct intel_engine_cs *engine;
>>> -
>>> -    /*
>>> -     * Platforms with standalone media have their media engines in 
>>> another
>>> -     * GT.
>>> -     */
>>> -    if (MEDIA_VER(gt->i915) >= 13 &&
>>> -        (class == VIDEO_DECODE_CLASS || class == 
>>> VIDEO_ENHANCEMENT_CLASS)) {
>>> -        if (!gt->i915->media_gt)
>>> -            goto err;
>>> +    struct intel_gt *media_gt = gt->i915->media_gt;
>>>   -        gt = gt->i915->media_gt;
>>> +    /* we expect the non-media gt to be passed in */
>>> +    GEM_BUG_ON(gt == media_gt);
>>> +
>>> +    if (!media_gt)
>>> +        return gt;
>>> +
>>> +    switch (class) {
>>> +    case VIDEO_DECODE_CLASS:
>>> +    case VIDEO_ENHANCEMENT_CLASS:
>>> +        return media_gt;
>>> +    case OTHER_CLASS:
>>> +        if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, 
>>> GSC0))
>>> +            return media_gt;
>>> +        fallthrough;
>>> +    default:
>>> +        return gt;
>>>       }
>>> -
>>> -    if (instance <= MAX_ENGINE_INSTANCE)
>>> -        engine = gt->engine_class[class][instance];
>>> -    else
>>> -        engine = NULL;
>>> -
>>> -    if (likely(engine))
>>> -        return intel_engine_cs_irq(engine, iir);
>>> -
>>> -err:
>>> -    WARN_ONCE(1, "unhandled engine interrupt class=0x%x, 
>>> instance=0x%x\n",
>>> -          class, instance);
>>>   }
>>>     static void
>>> @@ -118,12 +110,24 @@ gen11_gt_identity_handler(struct intel_gt *gt, 
>>> const u32 identity)
>>>       const u8 class = GEN11_INTR_ENGINE_CLASS(identity);
>>>       const u8 instance = GEN11_INTR_ENGINE_INSTANCE(identity);
>>>       const u16 intr = GEN11_INTR_ENGINE_INTR(identity);
>>> +    struct intel_engine_cs *engine;
>>>         if (unlikely(!intr))
>>>           return;
>>>   -    if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
>>> -        return gen11_engine_irq_handler(gt, class, instance, intr);
>>> +    /*
>>> +     * Platforms with standalone media have the media and GSC 
>>> engines in
>>> +     * another GT.
>>> +     */
>>> +    gt = pick_gt(gt, class, instance);
>>> +
>>> +    if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE)
>>> +        engine = gt->engine_class[class][instance];
>>> +    else
>>> +        engine = NULL;
>>> +
>>> +    if (engine)
>>> +        return intel_engine_cs_irq(engine, intr);
>>
>> Drive by observation - you could fold the above two ifs into one since 
>> engine appears unused afterwards.
> 
> engine can be NULL in both branches of the if statement, so to get a 
> unified if we'd have to do something like:
> 
> if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE) {
>          struct intel_engine_cs *engine = 
> gt->engine_class[class][instance];
>          if (engine)
>                  return intel_engine_cs_irq(engine, intr);
> }
> 
> Is this what you are suggesting?

Right, two ifs are needed after all. Well at least it would avoid the 
pointless engine = NULL assignment. Up to you.

Absence of any out-of-range class/instance logging is intentional?

Regards,

Tvrtko
