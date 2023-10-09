Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF087BEADC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7B010E2D8;
	Mon,  9 Oct 2023 19:50:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C8D10E19E;
 Mon,  9 Oct 2023 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696881046; x=1728417046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ItxRFLsrWOuxuPB0lHGallBO5g6Mlbl7S3FMxUNTNIY=;
 b=f458r4BRGG3y49vKzynZEERYrRM9WL3Pf6kLw6apBgmbfY3UMVjUDuvq
 cs685683bozWVkOer/u8adcqQHoChXyJaMw+BYQeQI1PsOtjzzrO167mW
 MCIwg5Pk7x8ce9jQ+zK/zaHz4U6Dbsy+XrILwBYujaNQMRfH88yKuYb0V
 8l66nGlfWf8y52KitDTNq8UefFldEMJRSBZVdGznbBUJN2lv/30FLaZtb
 iDegy4LTEkQQWKq6JoSGViIrjuQbIW7YxG8O4+2eQKLfosYUu/zcv0xvw
 se7FZClmxeF6a0z3glCNskH+0zMfMbVWTQQTEG5w2wz0bdm/4ZfcrFkmY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="470495809"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="470495809"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703034077"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="703034077"
Received: from ibrahim2-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.42.185])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:50:43 -0700
Date: Mon, 9 Oct 2023 21:50:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: More use of GT specific
 print helpers
Message-ID: <ZSRZjS6YOrOcIEoY@ashyti-mobl2.lan>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
 <20231009183802.673882-2-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009183802.673882-2-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

...

>  	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
> -		drm_warn_once(&gt->i915->drm, "GSC irq: intf_id %d is out of range", intf_id);
> +		gt_warn_once(gt, "GSC irq: intf_id %d is out of range", intf_id);
>  		return;
>  	}
>  
>  	if (!HAS_HECI_GSC(gt->i915)) {
> -		drm_warn_once(&gt->i915->drm, "GSC irq: not supported");
> +		gt_warn_once(gt, "GSC irq: not supported");
>  		return;
>  	}
>  
> @@ -300,7 +301,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
>  
>  	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
>  	if (ret)
> -		drm_err_ratelimited(&gt->i915->drm, "error handling GSC irq: %d\n", ret);
> +		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
>  }
>  
>  void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
> index 55a336a9ff061..7fdc78c79273e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_print.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
> @@ -16,6 +16,9 @@
>  #define gt_warn(_gt, _fmt, ...) \
>  	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>  
> +#define gt_warn_once(_gt, _fmt, ...) \
> +	drm_warn_once(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +

I would add the gt_warn_once() part in a different patch.

Andi
