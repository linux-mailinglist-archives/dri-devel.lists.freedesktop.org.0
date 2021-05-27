Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305AD39349E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 19:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEE26F486;
	Thu, 27 May 2021 17:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34A86F486;
 Thu, 27 May 2021 17:17:21 +0000 (UTC)
IronPort-SDR: j7ovlxpTWyTLPyHfAjefAyJghB1i/QvMFuxFs4CDACBhRRkzj9T3oHN6YHJ4XldrC5BWw5PdoU
 52LeLqtaGRNw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="202554796"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="202554796"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 10:17:21 -0700
IronPort-SDR: 4Yv2RyOYNqjU3JSMdAmNxHwzobo335NxT7cI0MmfEyBqZTy+/AWYlnZqpDWdyqoAxSdSOCQJNd
 SVryNUIamAyw==
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="477577832"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.116.237])
 ([10.209.116.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 10:17:20 -0700
Subject: Re: [Intel-gfx] [PATCH 06/18] drm/i915/guc: Drop
 guc->interrupts.enabled
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210526064237.77853-1-matthew.brost@intel.com>
 <20210526064237.77853-7-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <3b1eadf8-b043-365f-ada9-3a87901e8159@intel.com>
Date: Thu, 27 May 2021 10:17:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526064237.77853-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

On 5/25/2021 23:42, Matthew Brost wrote:
> Drop the variable guc->interrupts.enabled as this variable is just
> leading to bugs creeping into the code.
>
> e.g. A full GPU reset disables the GuC interrupts but forgot to clear
> guc->interrupts.enabled, guc->interrupts.enabled being true suppresses
> interrupts from getting re-enabled and now we are broken.
>
> It is harmless to enable interrupt while already enabled so let's just
> delete this variable to avoid bugs like this going forward.
Is it worth leaving the enabled flag in place but only using it to trip 
a WARN to catch such cases in a less catastrophic manner? Or are there 
valid reasons for calling enable when already enabled?

Either way, it seems like a plausible change and CI is happy with it, so:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

John.

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c | 27 +++++++++-----------------
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h |  1 -
>   2 files changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index ab2c8fe8cdfa..18da9ed15728 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -96,12 +96,9 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
>   	spin_lock_irq(&gt->irq_lock);
> -	if (!guc->interrupts.enabled) {
> -		WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
> -			     gt->pm_guc_events);
> -		guc->interrupts.enabled = true;
> -		gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
> -	}
> +	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
> +		     gt->pm_guc_events);
> +	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>   	spin_unlock_irq(&gt->irq_lock);
>   }
>   
> @@ -112,7 +109,6 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>   
>   	spin_lock_irq(&gt->irq_lock);
> -	guc->interrupts.enabled = false;
>   
>   	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
>   
> @@ -134,18 +130,14 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>   static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> +	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>   
>   	spin_lock_irq(&gt->irq_lock);
> -	if (!guc->interrupts.enabled) {
> -		u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
> -
> -		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
> -		intel_uncore_write(gt->uncore,
> -				   GEN11_GUC_SG_INTR_ENABLE, events);
> -		intel_uncore_write(gt->uncore,
> -				   GEN11_GUC_SG_INTR_MASK, ~events);
> -		guc->interrupts.enabled = true;
> -	}
> +	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
> +	intel_uncore_write(gt->uncore,
> +			   GEN11_GUC_SG_INTR_ENABLE, events);
> +	intel_uncore_write(gt->uncore,
> +			   GEN11_GUC_SG_INTR_MASK, ~events);
>   	spin_unlock_irq(&gt->irq_lock);
>   }
>   
> @@ -154,7 +146,6 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
>   	spin_lock_irq(&gt->irq_lock);
> -	guc->interrupts.enabled = false;
>   
>   	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
>   	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index c20f3839de12..4abc59f6f3cd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -33,7 +33,6 @@ struct intel_guc {
>   	unsigned int msg_enabled_mask;
>   
>   	struct {
> -		bool enabled;
>   		void (*reset)(struct intel_guc *guc);
>   		void (*enable)(struct intel_guc *guc);
>   		void (*disable)(struct intel_guc *guc);

