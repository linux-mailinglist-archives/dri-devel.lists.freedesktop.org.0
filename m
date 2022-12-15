Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216DF64E148
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861CA10E4DF;
	Thu, 15 Dec 2022 18:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED7510E4D3;
 Thu, 15 Dec 2022 18:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671130106; x=1702666106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ogspCvicFhhzdkF7v9AuTncGKWm32X+u+8OosTh5eL4=;
 b=kGPtBf5XS/BKS+F9kzlOpKaSFhfF9V8B4vvJJjbbbeGzTze2Po8wmfyd
 CKoH2awW/zA06cJcbCigDDPUGzGGZDUQzrBVutizki5ryyNoG2ZvaOZuI
 ZN5OaNOSuajUg7U3n9VgyrPmPIOYaXBeEEtvbMU3f3OWmVhV0nITtqdOt
 LBasB82bpAdr0GL/ZnpIEctjAgQnbEnxoJGquqrDuSB6i2EsOnti5k/9/
 jlIRbknxdGOdPfqVMepdDXEnmffRT3Bzg3/9CQp8PEJmfT+ZF8C4qJbtU
 LA6PV+uuls7aXX22GQd+koKkqigoJoaDoGa5+qO9dz5M96BEm3Bq2xKNV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="317470496"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="317470496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:48:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="894889082"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="894889082"
Received: from popovaan-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.59.139])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:48:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/hwmon: Display clamped PL1 limit
In-Reply-To: <20221215184409.2467595-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221215184409.2467595-1-ashutosh.dixit@intel.com>
Date: Thu, 15 Dec 2022 20:48:21 +0200
Message-ID: <87bko4v6yy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Dec 2022, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> HW allows arbitrary PL1 limits to be set but silently clamps these values
> to "typical but not guaranteed" min/max values in pkg_power_sku
> register. Follow the same pattern for sysfs, allow arbitrary PL1 limits to
> be set but display clamped values when read.

The commit message lacks the most important thing: why?


BR,
Jani.

>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c        | 39 ++++++++++++++++++++----
>  drivers/gpu/drm/i915/intel_mchbar_regs.h |  2 ++
>  2 files changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index cca7a4350ec8f..1225bc432f0d5 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -359,6 +359,38 @@ hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
>  	}
>  }
>  
> +/*
> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> + * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read. Write/read I1 also follows the same pattern.
> + */
> +static int
> +hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u64 r, min, max;
> +
> +	*val = hwm_field_read_and_scale(ddat,
> +					hwmon->rg.pkg_rapl_limit,
> +					PKG_PWR_LIM_1,
> +					hwmon->scl_shift_power,
> +					SF_POWER);
> +
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read64(ddat->uncore, hwmon->rg.pkg_power_sku);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*val = clamp_t(u64, *val, min, max);
> +
> +	return 0;
> +}
> +
>  static int
>  hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>  {
> @@ -368,12 +400,7 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>  
>  	switch (attr) {
>  	case hwmon_power_max:
> -		*val = hwm_field_read_and_scale(ddat,
> -						hwmon->rg.pkg_rapl_limit,
> -						PKG_PWR_LIM_1,
> -						hwmon->scl_shift_power,
> -						SF_POWER);
> -		return 0;
> +		return hwm_power_max_read(ddat, val);
>  	case hwmon_power_rated_max:
>  		*val = hwm_field_read_and_scale(ddat,
>  						hwmon->rg.pkg_power_sku,
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index f93e9af43ac35..73900c098d591 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -194,6 +194,8 @@
>   */
>  #define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
>  #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
> +#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
>  #define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
>  #define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
>  #define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)

-- 
Jani Nikula, Intel Open Source Graphics Center
