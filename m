Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09F7AFF25
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 10:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046EF10E4B0;
	Wed, 27 Sep 2023 08:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B767B10E4AE;
 Wed, 27 Sep 2023 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695805074; x=1727341074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jvFAjiC5hqNj1e5yR6WuQfhuIpF8kq7toX5FXXbGE1A=;
 b=SPN79wNfqXCXw7CPXxRCWNiPDqITYrbRwdOH09tRlgZ60ToAkwv+KrtK
 Lm0NDcsfY0yJkLAPMj9EjpL+A4fAxhziBJ9UHncXzbubdZKL6uf/mGXAL
 3xgYN0YM1ASgSgxqRBKuLbyiyJ17QqUSVrjQNKRR1l87gUBEGEoQY7SXj
 hKkHZEZT1jPQJVFXDx1oeItmoJnbs3ZWcGd2+l/fDbiDMCXSnZbTfdO+8
 JDPNOv0m9wMgUzqI6HvFPKkTEJSDasV8cvn5BTYAviXRIX1bkDvTYE+jW
 n834xmFFhTBpZcl7vRqjeucaDt5fw8uid/9ZBBQfuk59uv6WBv/cVjxqT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366833331"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366833331"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 01:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752489680"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752489680"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.23.248])
 ([10.213.23.248])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 01:57:52 -0700
Message-ID: <e0b9c9a1-1eec-867d-bef6-92c087439595@intel.com>
Date: Wed, 27 Sep 2023 10:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/mtl: Skip MCR ops for ring fault
 register
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230927082430.4609-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230927082430.4609-1-nirmoy.das@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.09.2023 10:24, Nirmoy Das wrote:
> On MTL GEN12_RING_FAULT_REG is not replicated so don't
> do mcr based operation for this register.
> 
> v2: use MEDIA_VER() instead of GRAPHICS_VER()(Matt).
> v3: s/"MEDIA_VER(i915) == 13"/"MEDIA_VER(i915) >= 13"(Matt)
>      improve comment.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c      | 13 ++++++++++++-
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>   drivers/gpu/drm/i915/i915_gpu_error.c   | 10 +++++++++-
>   3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 93062c35e072..c78b8a171431 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -262,10 +262,21 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>   				   I915_MASTER_ERROR_INTERRUPT);
>   	}
>   
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * For the media GT, this ring fault register is not replicated,
> +	 * so don't do mcr ops on it.
> +	 */
> +	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
> +		intel_uncore_rmw(uncore, XELPMP_RING_FAULT_REG,
> +				 RING_FAULT_VALID, 0);
> +		intel_uncore_posting_read(uncore,
> +					  XELPMP_RING_FAULT_REG);
> +
> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
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
> index f4ebcfb70289..de0ee9a4874d 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1234,7 +1234,15 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
>   	if (GRAPHICS_VER(i915) >= 6) {
>   		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
>   
> -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +		/*
> +		 * For the media GT, this ring fault register is not replicated,
> +		 * so don't do mcr ops on it.
> +		 */
> +		if (MEDIA_VER(i915) >= 13 && engine->gt->type == GT_MEDIA)
> +			ee->fault_reg = intel_uncore_read(engine->uncore,
> +							  XELPMP_RING_FAULT_REG);
> +
> +		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>   			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
>   							      XEHP_RING_FAULT_REG);
>   		else if (GRAPHICS_VER(i915) >= 12)

