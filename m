Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D47B2845
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 00:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD7F10E0AC;
	Thu, 28 Sep 2023 22:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD0210E0AC;
 Thu, 28 Sep 2023 22:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695939295; x=1727475295;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=04VTBaFQ8xCz8kV7Ievov62O8Mf7bf81E/vo6s+RViA=;
 b=lS7Lpg9Afyxhy9MonArn4fjyCVMt0Ky/Oh8iW1TanKZ0yv9TATxeaCCE
 qBTXKx2QIZSYD6XR5Y9z+mGuCKH/hn/ruMIbJYxEsD8/4edk4RqnPe1+N
 TVMWoOYEdLIKXtsHeOf2qXDv0+yhgXM7QhTaBBgZXVNEa0GIqmB/DdZas
 RCG2jcZRFEYRfwL0EwxBo5Jp/XjEnW3DDYEpj1rxwuyVMIDEIbih3x8x9
 1BQHoYUdosc22gEsSXSt1c9Fmm4oGhf/iciWKvrIw1F3S66ZBZ5N/GDkG
 NZVFagRLdEMPnT315BJ1I7CdYFoy3evifZM6M0gIVGlSUj/lYTtgmXMqW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372545595"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="372545595"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 15:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726399269"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="726399269"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.92])
 ([10.213.10.92])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 15:14:39 -0700
Message-ID: <7108ed53-22c7-3f37-119b-a6d2d0f84f88@intel.com>
Date: Fri, 29 Sep 2023 00:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v7 4/4] drm/i915/mtl: Skip MCR ops for ring
 fault register
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230928130015.6758-1-nirmoy.das@intel.com>
 <20230928130015.6758-4-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230928130015.6758-4-nirmoy.das@intel.com>
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
Cc: matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.09.2023 15:00, Nirmoy Das wrote:
> On MTL GEN12_RING_FAULT_REG is not replicated so don't
> do mcr based operation for this register.
> 
> v2: use MEDIA_VER() instead of GRAPHICS_VER()(Matt).
> v3: s/"MEDIA_VER(i915) == 13"/"MEDIA_VER(i915) >= 13"(Matt)
>      improve comment.
> v4: improve the comment further(Andi)
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c      | 13 ++++++++++++-
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>   drivers/gpu/drm/i915/i915_gpu_error.c   | 11 ++++++++++-
>   3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 93062c35e072..dff8bba1f5d4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -262,10 +262,21 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>   				   I915_MASTER_ERROR_INTERRUPT);
>   	}
>   
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * For the media GT, this ring fault register is not replicated,
> +	 * so don't do multicast/replicated register read/write operation on it.
> +	 */
> +	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
> +		intel_uncore_rmw(uncore, XELPMP_RING_FAULT_REG,
> +				 RING_FAULT_VALID, 0);
> +		intel_uncore_posting_read(uncore,
> +					  XELPMP_RING_FAULT_REG);
> +
> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {

WA 14017387313 suggests to "remove Semaphore acquisition steps for all 
GAM ranges" (XELPMP_RING_FAULT_REG is in GAM range), just FYI.

Regards
Andrzej


>   		intel_gt_mcr_multicast_rmw(gt, XEHP_RING_FAULT_REG,
>   					   RING_FAULT_VALID, 0);
>   		intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
> +
>   	} else if (GRAPHICS_VER(i915) >= 12) {
>   		intel_uncore_rmw(uncore, GEN12_RING_FAULT_REG, RING_FAULT_VALID, 0);
>   		intel_uncore_posting_read(uncore, GEN12_RING_FAULT_REG);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cca4bac8f8b0..eecd0a87a647 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1084,6 +1084,7 @@
>   
>   #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
>   #define XEHP_RING_FAULT_REG			MCR_REG(0xcec4)
> +#define XELPMP_RING_FAULT_REG			_MMIO(0xcec4)
>   #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
>   #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
>   #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index f4ebcfb70289..b4e31e59c799 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1234,7 +1234,16 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
>   	if (GRAPHICS_VER(i915) >= 6) {
>   		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
>   
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +		/*
> +		 * For the media GT, this ring fault register is not replicated,
> +		 * so don't do multicast/replicated register read/write
> +		 * operation on it.
> +		 */
> +		if (MEDIA_VER(i915) >= 13 && engine->gt->type == GT_MEDIA)
> +			ee->fault_reg = intel_uncore_read(engine->uncore,
> +							  XELPMP_RING_FAULT_REG);
> +
> +		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>   			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
>   							      XEHP_RING_FAULT_REG);
>   		else if (GRAPHICS_VER(i915) >= 12)

