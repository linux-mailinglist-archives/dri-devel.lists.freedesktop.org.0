Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D527B2DE6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3679210E6D7;
	Fri, 29 Sep 2023 08:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB08D10E6CC;
 Fri, 29 Sep 2023 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695976667; x=1727512667;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xz8d8GoDzs3kDhmUg2Lc1L3byZX99FHQxfjfiVY7eis=;
 b=TfGmJuYxDzI3NtgLKboBH6uDzhy7phKz0BHfPaGwv+4TAuc7DLS0aRFj
 5DlO5PUf7KNcg4IX8W6JLodM7OrkCGkAQOXKiBWFomaIy42VWk6flOwCH
 F/gyvEDhMknSckKt7RM+yiExJ4w53UB4hluOaeSY//s0dnDK96rXhSI2u
 ndLBedU6Ejs9v1D7neOJ5sFLZml2oLrlMPln+ixlfLpE9k/O20ZXqoTUY
 MmI5HnlLyWfnzOCvEzZ7RpNnIGO+PdujfSVIuEPlsqbIDBh9+oI4yfWb3
 pfGogmorucrB6602sUwT7G1pHRgX7LcygZYA2ULxf7gK47dqsL76/WSEW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372611507"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="372611507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 01:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753311224"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="753311224"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.39.203])
 ([10.252.39.203])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 01:37:45 -0700
Message-ID: <7de6ddeb-0252-66a4-2c1e-8f1405b311af@linux.intel.com>
Date: Fri, 29 Sep 2023 10:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 1/4] drm/i915: Introduce intel_gt_mcr_lock_sanitize()
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230928130015.6758-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230928130015.6758-1-nirmoy.das@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org, andi.shyti@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks reviewing this series. Merged it in  gt-next so hopefully we have 
bit greener CI for MTL now.


Regards,

Nirmoy

On 9/28/2023 3:00 PM, Nirmoy Das wrote:
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
