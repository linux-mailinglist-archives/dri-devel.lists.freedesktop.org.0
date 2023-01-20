Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0467506B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 10:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EF710E379;
	Fri, 20 Jan 2023 09:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD1D10E371;
 Fri, 20 Jan 2023 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674206098; x=1705742098;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yNvXGoAuVxy6uMkPU/cTHfYgkLHn+NTJaq357zby8es=;
 b=BjK6UfYOTMPaTMd+tvxUn7q+1ZgKoVr0XY5C+xZV2a0UUyzZuQMNkNFM
 +8erRzrrxqI56PZWvuGqPVsHfDcmpay7inJehP425OyqmSUwe/LW1jGIN
 8N4JYcM3m+yPqC7fAu6pAmfLPbWH41R5s0WxeeZv1dJoQGvMigNghmBC6
 28kc4nCM7/WC0q/qVmPt6ZJKTIgx0+3bLGmAAqhUPTWw70lCM4IYfWRkQ
 3t8BLEJm2Jt0LvJNRb6q9iEmn9B0Vh6kZV64eAXiiiumCXdwD5l3dTW6o
 JjLcspZxPuGfVQ49ssthXyx6qFwzSX1W+CWkDMLHUzZfxr7oXfcO4+yb9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305214691"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="305214691"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 01:14:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="803013919"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="803013919"
Received: from ajgorman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.28.233])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 01:14:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR completion
In-Reply-To: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
Date: Fri, 20 Jan 2023 11:14:46 +0200
Message-ID: <873585a7p5.fsf@intel.com>
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
Cc: Vivi@freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023, Alan Previn <alan.previn.teres.alexis@intel.com> wrote:
> The Driver-FLR flow may inadvertently exit early before the full
> completion of the re-init of the internal HW state if we only poll
> GU_DEBUG Bit31 (polling for it to toggle from 0 -> 1). Instead
> we need a two-step completion wait-for-completion flow that also
> involves GU_CNTL. See the patch and new code comments for detail.
> This is new direction from HW architecture folks.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 8dee9e62a73e..959869e2ff05 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2748,6 +2748,12 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>  	/* Trigger the actual Driver-FLR */
>  	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
>  
> +	/* Completion Step 1 - poll for 'CNTL-BIT31 = 0' wait for hw teardown to complete */

Please don't use comments to repeat what the code already says.

Here, you could just say, "Wait for hardware teardown to complete",
which describes what the code does at a higher level, but does not
duplicate any of it.

> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
> +					 DRIVERFLR_STATUS, 0,
> +					 flr_timeout_ms);
> +
> +	/* Completion: Step 2 - poll for 'DEBUG-BIT31 = 1' for hw/fw re-init to complete */

"Wait for hardware/firmware re-init to complete"

>  	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
>  					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>  					 flr_timeout_ms);
> @@ -2756,6 +2762,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>  		return;
>  	}
>  
> +	/* Write 1 to clear GU_DEBUG's sticky completion status bit */

"Clear sticky completion status" maybe?

>  	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>  }
>  
>
> base-commit: 0a0ee61784df01ac098a92bd43673ee30c629f13

-- 
Jani Nikula, Intel Open Source Graphics Center
