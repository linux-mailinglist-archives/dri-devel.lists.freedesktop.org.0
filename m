Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B85F376F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 23:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8096D10E012;
	Mon,  3 Oct 2022 21:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6498610E012;
 Mon,  3 Oct 2022 21:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664831121; x=1696367121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qiYqJpmLqwJvheSAPoxbEvbqQ2iLEHPRq69OgGegij4=;
 b=d6t6eatIinsU9X1lLiybatoqfLiPJYkEBwNStv9vWQ1OgiTo7bB67DZt
 uyo1Z0fWG0YJsKd7b2Nn6Zc+obvY3lbGc1GlloWilv0gZ3Q6S5U1ulNgK
 Cy2jbxKp+00PBhjPJ7gKmfQdcM17hAU/uMPwaZGZz3soshORkPxPrJpHt
 0VwqH8SR1FrohojnDlgBGrvu7T5Fv5H6jU356vvGPU5ohBKbcYiNlX+g8
 CxnkcLapVq7LacPy9XwmFC+aFLUO9C19BZY7SnNn/nUwrCNOL4hQp6OBc
 NAMlUfrT9X7Mk5kAfQbIDBw4bPFfkTL93OT8KTR9c/2snLMkOTNnapc7i w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="366858268"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="366858268"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:05:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="618885484"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="618885484"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:05:18 -0700
Date: Mon, 3 Oct 2022 23:05:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP
 setting
Message-ID: <YztOiqUsMTzfK4q3@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-4-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-4-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

[...]

>  hwm_get_preregistration_info(struct drm_i915_private *i915)
>  {
>  	struct i915_hwmon *hwmon = i915->hwmon;
> +	struct intel_uncore *uncore = &i915->uncore;
> +	intel_wakeref_t wakeref;
> +	u32 val_sku_unit;
>  
> -	if (IS_DG1(i915) || IS_DG2(i915))
> +	if (IS_DG1(i915) || IS_DG2(i915)) {
>  		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> -	else
> +		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
> +		hwmon->rg.pkg_power_sku = PCU_PACKAGE_POWER_SKU;
> +		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +	} else {
>  		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
> +		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +	}
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref) {
> +		/*
> +		 * The contents of register hwmon->rg.pkg_power_sku_unit do not change,
> +		 * so read it once and store the shift values.
> +		 */
> +		if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit)) {
> +			val_sku_unit = intel_uncore_read(uncore,
> +							 hwmon->rg.pkg_power_sku_unit);
> +		} else {
> +			val_sku_unit = 0;
> +		}

please remove the brackets here and, just a small nitpick:

move val_sky_unit inside the "with_intel_runtime_pm()" and
initialize it to '0', you will save the else statement.

Other than that:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
