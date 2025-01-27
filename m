Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FCA1D964
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 16:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9A310E564;
	Mon, 27 Jan 2025 15:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4qd6Rq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5590610E564;
 Mon, 27 Jan 2025 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737991268; x=1769527268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=br5CnArb+fohQiflJ1xaEDt09kxgvePXIEhap5j5zLU=;
 b=Y4qd6Rq7AuIlGn9t5FHDS2LAsR/OToo9fW0LvMjHhra8cGskBujNfo3u
 km5N4CbMTUTCwdqfGCQHbx+HZodU3DL/1w/f0pmT1UDfZq40BXgQIlOzI
 mU7VUYQNjdN9uF4BAeksvBC4eiOUKb99xsuLoJn5ntRQsfAsWXPxmQ7Dh
 HyM5cgBgq5BB4WeAIBce/wd9vOlsez/LdK1ANUoCmLspNgEvVAZBSVYbd
 qaGqFWeaDmQaI2KvpM6orpYZnNee8kVukIKuPdbpVFlFVzmxzFXIZ424t
 K2kN0eaby/rbNU3HcE3powOwnVzxvb1DogAHfhQX7qFIt4nXd/NBnLDBY g==;
X-CSE-ConnectionGUID: /mj8Y64kSp2oMuyMxHZFhg==
X-CSE-MsgGUID: kn3tXTzJSwyPkEO1x8gASA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38339359"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38339359"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:21:08 -0800
X-CSE-ConnectionGUID: HBNz1FS3RveYhrYmFTu1mQ==
X-CSE-MsgGUID: ON91t+rWS+KVvYE8wHbDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="113456273"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.248])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:21:05 -0800
Date: Mon, 27 Jan 2025 16:21:01 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
Message-ID: <Z5ekXVihQSDjxqQK@ashyti-mobl2.lan>
References: <20250123162351.1364395-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123162351.1364395-1-zhanjun.dong@intel.com>
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

Hi Zhanjun,

On Thu, Jan 23, 2025 at 08:23:51AM -0800, Zhanjun Dong wrote:
> The purpose of synchronize_irq is to wait for any pending IRQ handlers for the
> interrupt to complete, if synchronize_irq called before interrupt disabled, an
> tiny timing window created, where no more pending IRQ, but interrupt not
> disabled yet. Meanwhile, if the interrupt event happened in this timing window,
> an unexpected IRQ handling will be triggered.

I get the meaning, but could you please rephrase it to a more
meaningful sentence, please?

> Fixed by always disable interrupt ahead of synchronize_irq.

Please, don't use the past simple form, use the imperative form:

"Always disable interrupt ahead..."

or better:

"Always disable interrupts before calling intel_synchronyze_irq()"

> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
> Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
> Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
> Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
> Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")

There is an issue here, each fixes is introduced in different
kernel versions and they can't be mixed all together as it would
be impossible to backport them to the stable brances.

E.g.:
Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
Cc: <stable@vger.kernel.org> # v5.5+

Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
Cc: <stable@vger.kernel.org> # v5.16+

Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
Cc: <stable@vger.kernel.org> # v5.3+

Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
Cc: <stable@vger.kernel.org> # v4.10+

Could you please split this patch in the four different patches
that address the four different fixes?

> 

No blank lines in the tag section, please.

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> ---
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c      | 3 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c   | 4 ++--
>  drivers/gpu/drm/i915/pxp/intel_pxp_irq.c | 2 +-
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fa304ea088e4..0fe7a8d7f460 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -244,8 +244,8 @@ static void rps_disable_interrupts(struct intel_rps *rps)
>  	gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
>  	spin_unlock_irq(gt->irq_lock);
>  
> +	rps_reset_interrupts(rps);
>  	intel_synchronize_irq(gt->i915);
> -

Sebastian has already commented in his review, but please don't
remove this blank line.

Andi

>  	/*
>  	 * Now that we will not be generating any more work, flush any
>  	 * outstanding tasks. As we are called on the RPS idle path,
