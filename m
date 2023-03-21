Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26306C3084
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 12:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11AA10E194;
	Tue, 21 Mar 2023 11:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9810E17C;
 Tue, 21 Mar 2023 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679398668; x=1710934668;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=n+McgxN2lD1q0U/3+XMYbC9TBoc1ZzG3HKi07BaPfyc=;
 b=V8gAwwvfdnwhh7ksCE4hL6p9/QW854v58SmCaome5cLGFhrpzA7OXsKf
 mK0JTGPHA2FvCd6oRKMWI17yW/CnDWEiOLMD/3xYAzYmfoGw1L11F/x7A
 zQfCM+0WVJolxU9niAVLtM7djlkqMfggr/Id4AfgVDOQ1r3Zl4SwSunpk
 YU1MDxHQ/viDtkYDHCj8MEFAk+ZlfTp+yDOa1V6jwAK/hezDfjSgqEHN5
 m9ZPBWWJEsrXJL2t1SYg8sMDjyqb5VK4hPcHn1yM8mdaCkg7Rk/E6IxEM
 ro44u3rpzJ7Iwqrv8yo59/C+i8cGq0WaZpgdAVjmUWTbQpbV2j8ZuGl0x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338948772"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="338948772"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="745812029"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="745812029"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:37:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Matt
 Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Sanitycheck MMIO access early
 in driver load
In-Reply-To: <20230320202326.296498-2-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230320202326.296498-1-andi.shyti@linux.intel.com>
 <20230320202326.296498-2-andi.shyti@linux.intel.com>
Date: Tue, 21 Mar 2023 13:37:44 +0200
Message-ID: <877cva8hdj.fsf@intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Mar 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> We occasionally see the PCI device in a non-accessible state at the
> point the driver is loaded.  When this happens, all BAR accesses will
> read back as 0xFFFFFFFF.  Rather than reading registers and
> misinterpreting their (invalid) values, let's specifically check for
> 0xFFFFFFFF in a register that cannot have that value to see if the
> device is accessible.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 34 +++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index e1e1f34490c8e..14ec45e6facfa 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2602,11 +2602,45 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>  	return 0;
>  }
>  
> +static int sanity_check_mmio_access(struct intel_uncore *uncore)
> +{
> +	struct drm_i915_private *i915 = uncore->i915;
> +
> +	if (GRAPHICS_VER(i915) < 8)
> +		return 0;
> +
> +	/*
> +	 * Sanitycheck that MMIO access to the device is working properly.  If
> +	 * the CPU is unable to communcate with a PCI device, BAR reads will
> +	 * return 0xFFFFFFFF.  Let's make sure the device isn't in this state
> +	 * before we start trying to access registers.
> +	 *
> +	 * We use the primary GT's forcewake register as our guinea pig since
> +	 * it's been around since HSW and it's a masked register so the upper
> +	 * 16 bits can never read back as 1's if device access is operating
> +	 * properly.
> +	 *
> +	 * If MMIO isn't working, we'll wait up to 2 seconds to see if it
> +	 * recovers, then give up.
> +	 */
> +#define COND (__raw_uncore_read32(uncore, FORCEWAKE_MT) != ~0)
> +	if (wait_for(COND, 2000) == -ETIMEDOUT) {

I guess this somewhat reimplements intel_wait_for_register_fw()?

> +		drm_err(&i915->drm, "Device is non-operational; MMIO access returns 0xFFFFFFFF!\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  int intel_uncore_init_mmio(struct intel_uncore *uncore)
>  {
>  	struct drm_i915_private *i915 = uncore->i915;
>  	int ret;
>  
> +	ret = sanity_check_mmio_access(uncore);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * The boot firmware initializes local memory and assesses its health.
>  	 * If memory training fails, the punit will have been instructed to

-- 
Jani Nikula, Intel Open Source Graphics Center
