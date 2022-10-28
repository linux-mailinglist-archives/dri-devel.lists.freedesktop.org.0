Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B80610C56
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 10:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003C610E1BB;
	Fri, 28 Oct 2022 08:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169A310E1BB;
 Fri, 28 Oct 2022 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666946292; x=1698482292;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V0mOKCCNr4n4zYWEHeESOZyOoMBZlX9qP3JGy2LCotg=;
 b=ILxv1kg8BAjoMPg3ra15ujEjXdfnpQPdYJpcGj7Pruw+fnG4B2N/DzDO
 JXDumypGmiwNzk/Y2NqSQRDZmfFgIDllVxtIQvKUjG1WBpobhJJpJ0V5C
 I3v1FpR6uGlwXbQ94gATJM9WvvdKjHuu0dkYH+BwlNeUDDbAzRScF54Sk
 SuHVWAA2OH/Hd92T19czvuIyAi2S7LMSZxRDZDF6p4mdROf3sfzJz0E5M
 8goNpRvD9HcjlG9WUqY+dcLV10pHIuHqOaLdMjTe/3dfEy9E84oXUYC8S
 HLNR4Aecfx33p31Pbz1ovGiFo46vwThDJTY2GMPUGFo4cYZgOgM/lQFZq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="288160532"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="288160532"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 01:38:11 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="665995214"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="665995214"
Received: from nalinset-mobl1.ger.corp.intel.com (HELO [10.213.204.34])
 ([10.213.204.34])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 01:38:10 -0700
Message-ID: <2125e5fd-e8d1-f4c1-7af1-58fb61f38049@linux.intel.com>
Date: Fri, 28 Oct 2022 09:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/mtl: add GSC CS interrupt support
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/10/2022 23:15, Daniele Ceraolo Spurio wrote:
> The GSC CS re-uses the same interrupt bits that the GSC used in older
> platforms. This means that we can now have an engine interrupt coming
> out of OTHER_CLASS, so we need to handle that appropriately.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c | 78 ++++++++++++++------------
>   1 file changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index f26882fdc24c..34ff1ee7e931 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -81,35 +81,27 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
>   		  instance, iir);
>   }
>   
> -static void
> -gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
> -			 const u8 instance, const u16 iir)
> +static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
>   {
> -	struct intel_engine_cs *engine;
> -
> -	/*
> -	 * Platforms with standalone media have their media engines in another
> -	 * GT.
> -	 */
> -	if (MEDIA_VER(gt->i915) >= 13 &&
> -	    (class == VIDEO_DECODE_CLASS || class == VIDEO_ENHANCEMENT_CLASS)) {
> -		if (!gt->i915->media_gt)
> -			goto err;
> +	struct intel_gt *media_gt = gt->i915->media_gt;
>   
> -		gt = gt->i915->media_gt;
> +	/* we expect the non-media gt to be passed in */
> +	GEM_BUG_ON(gt == media_gt);
> +
> +	if (!media_gt)
> +		return gt;
> +
> +	switch (class) {
> +	case VIDEO_DECODE_CLASS:
> +	case VIDEO_ENHANCEMENT_CLASS:
> +		return media_gt;
> +	case OTHER_CLASS:
> +		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
> +			return media_gt;
> +		fallthrough;
> +	default:
> +		return gt;
>   	}
> -
> -	if (instance <= MAX_ENGINE_INSTANCE)
> -		engine = gt->engine_class[class][instance];
> -	else
> -		engine = NULL;
> -
> -	if (likely(engine))
> -		return intel_engine_cs_irq(engine, iir);
> -
> -err:
> -	WARN_ONCE(1, "unhandled engine interrupt class=0x%x, instance=0x%x\n",
> -		  class, instance);
>   }
>   
>   static void
> @@ -118,12 +110,24 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
>   	const u8 class = GEN11_INTR_ENGINE_CLASS(identity);
>   	const u8 instance = GEN11_INTR_ENGINE_INSTANCE(identity);
>   	const u16 intr = GEN11_INTR_ENGINE_INTR(identity);
> +	struct intel_engine_cs *engine;
>   
>   	if (unlikely(!intr))
>   		return;
>   
> -	if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
> -		return gen11_engine_irq_handler(gt, class, instance, intr);
> +	/*
> +	 * Platforms with standalone media have the media and GSC engines in
> +	 * another GT.
> +	 */
> +	gt = pick_gt(gt, class, instance);
> +
> +	if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE)
> +		engine = gt->engine_class[class][instance];
> +	else
> +		engine = NULL;
> +
> +	if (engine)
> +		return intel_engine_cs_irq(engine, intr);

Drive by observation - you could fold the above two ifs into one since 
engine appears unused afterwards.

Regards,

Tvrtko

>   
>   	if (class == OTHER_CLASS)
>   		return gen11_other_irq_handler(gt, instance, intr);
> @@ -206,7 +210,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>   	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,	  0);
>   	if (CCS_MASK(gt))
>   		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>   		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, 0);
>   
>   	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
> @@ -233,7 +237,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>   		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
>   	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>   		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>   		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~0);
>   
>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
> @@ -249,7 +253,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   {
>   	struct intel_uncore *uncore = gt->uncore;
>   	u32 irqs = GT_RENDER_USER_INTERRUPT;
> -	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
> +	u32 gsc_mask = 0;
>   	u32 dmask;
>   	u32 smask;
>   
> @@ -261,6 +265,11 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   	dmask = irqs << 16 | irqs;
>   	smask = irqs << 16;
>   
> +	if (HAS_ENGINE(gt, GSC0))
> +		gsc_mask = irqs;
> +	else if (HAS_HECI_GSC(gt->i915))
> +		gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
> +
>   	BUILD_BUG_ON(irqs & 0xffff0000);
>   
>   	/* Enable RCS, BCS, VCS and VECS class interrupts. */
> @@ -268,9 +277,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask);
>   	if (CCS_MASK(gt))
>   		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
> -	if (HAS_HECI_GSC(gt->i915))
> -		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE,
> -				   gsc_mask);
> +	if (gsc_mask)
> +		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask);
>   
>   	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>   	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
> @@ -296,7 +304,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>   		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
>   	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>   		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (gsc_mask)
>   		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>   
>   	/*
