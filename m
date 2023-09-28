Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC967B27A2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 23:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5701410E6AE;
	Thu, 28 Sep 2023 21:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341BC10E6AE;
 Thu, 28 Sep 2023 21:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695937346; x=1727473346;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XSK3lIfHsNt+XPdYFMrEPjhYa2PveYb5Yf0D3W8AJsA=;
 b=jdb2Rkp85ekf6pAOXSUPu8bP0zv79Za2xAgAwoegTl67hCvVOkmgX9oa
 ETyamlWfaBnRX33eAvTI7Ly1AkHfukNuUddsoPFlegJPpjMq9hu/CkCNe
 N11frEppcjR8xk4wLs2fjvEPeJyuT5e4PUPUOi/H34jC8HjKbzBUgZVhY
 UUXpgk2rAjGjNOMasGmi4L2JwPmGSLaOhGDL1OsoznVLelSwlsTUYPPLJ
 /3vIwFOGsEeie3mUUCgWYg3Zb1aTVZFrD9l1YRjBeORWgs8J5LpJ5Ui46
 6bj2yOwBUaXCnOt60HYRAubC8vzkoLQWwpFzvi4HeX22Mh9Xywme2kGvS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468464588"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="468464588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 14:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840065895"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="840065895"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.92])
 ([10.213.10.92])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 14:42:24 -0700
Message-ID: <d8f739f9-a40d-1a69-e223-95441b249c98@intel.com>
Date: Thu, 28 Sep 2023 23:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v7 1/4] drm/i915: Introduce
 intel_gt_mcr_lock_sanitize()
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230928130015.6758-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230928130015.6758-1-nirmoy.das@intel.com>
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
> Implement intel_gt_mcr_lock_sanitize() to provide a mechanism
> for cleaning the steer semaphore when absolutely necessary.
> 
> v2: remove unnecessary lock(Andi, Matt)
>      improve the kernel doc(Matt)
>      s/intel_gt_mcr_lock_clear/intel_gt_mcr_lock_sanitize
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  1 +
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index bf4a933de03a..326c2ed1d99b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -419,6 +419,28 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>   		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>   }
>   
> +/**
> + * intel_gt_mcr_lock_sanitize - Sanitize MCR steering lock
> + * @gt: GT structure
> + *
> + * This will be used to sanitize the initial status of the hardware lock
> + * during driver load and resume since there won't be any concurrent access
> + * from other agents at those times, but it's possible that boot firmware
> + * may have left the lock in a bad state.
> + *
> + */
> +void intel_gt_mcr_lock_sanitize(struct intel_gt *gt)
> +{
> +	/*
> +	 * This gets called at load/resume time, so we shouldn't be
> +	 * racing with other driver threads grabbing the mcr lock.
> +	 */
> +	lockdep_assert_not_held(&gt->mcr_lock);
> +
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);

I wonder if it wouldn't be useful to check and report if it is locked 
before unconditional release, no strong feelings.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +}
> +
>   /**
>    * intel_gt_mcr_read - read a specific instance of an MCR register
>    * @gt: GT structure
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> index 41684495b7da..01ac565a56a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> @@ -11,6 +11,7 @@
>   void intel_gt_mcr_init(struct intel_gt *gt);
>   void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
>   void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
> +void intel_gt_mcr_lock_sanitize(struct intel_gt *gt);
>   
>   u32 intel_gt_mcr_read(struct intel_gt *gt,
>   		      i915_mcr_reg_t reg,

