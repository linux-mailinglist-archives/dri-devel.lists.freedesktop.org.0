Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A498C39218B
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 22:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CFA6EDD9;
	Wed, 26 May 2021 20:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069C26EDD1;
 Wed, 26 May 2021 20:35:53 +0000 (UTC)
IronPort-SDR: WyS+Tyn4Zkk3e2CSicGU+qsV0f96ERhD1XDFmLKTP7UejSPHHaGeqDaNvuE/bIzzTp2GGHhvwv
 r9o/gQIxSJvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="189946129"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="189946129"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 13:35:53 -0700
IronPort-SDR: /dtH8R0eCEEG0z73RnhNBYfq5i45VAo3PaMEPM18hG99BBOmAbuwhzN9fWussVHBt6mlGFuT0D
 hgUi7BaLTeXA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547370541"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 13:35:52 -0700
Date: Wed, 26 May 2021 13:28:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 31/97] drm/i915/guc: Early initialization of GuC send
 registers
Message-ID: <20210526202846.GA20237@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-32-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-32-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:45PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Base offset and count of the GuC scratch registers, used for
> sending MMIO messages to GuC, can be initialized earlier with
> other GuC members that also depends on platform.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 454c8d886499..235c1997f32d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -60,15 +60,8 @@ void intel_guc_init_send_regs(struct intel_guc *guc)
>  	enum forcewake_domains fw_domains = 0;
>  	unsigned int i;
>  
> -	if (INTEL_GEN(gt->i915) >= 11) {
> -		guc->send_regs.base =
> -				i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
> -		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
> -	} else {
> -		guc->send_regs.base = i915_mmio_reg_offset(SOFT_SCRATCH(0));
> -		guc->send_regs.count = GUC_MAX_MMIO_MSG_LEN;
> -		BUILD_BUG_ON(GUC_MAX_MMIO_MSG_LEN > SOFT_SCRATCH_COUNT);
> -	}
> +	GEM_BUG_ON(!guc->send_regs.base);
> +	GEM_BUG_ON(!guc->send_regs.count);
>  
>  	for (i = 0; i < guc->send_regs.count; i++) {
>  		fw_domains |= intel_uncore_forcewake_for_reg(gt->uncore,
> @@ -181,11 +174,18 @@ void intel_guc_init_early(struct intel_guc *guc)
>  		guc->interrupts.reset = gen11_reset_guc_interrupts;
>  		guc->interrupts.enable = gen11_enable_guc_interrupts;
>  		guc->interrupts.disable = gen11_disable_guc_interrupts;
> +		guc->send_regs.base =
> +			i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
> +		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
> +
>  	} else {
>  		guc->notify_reg = GUC_SEND_INTERRUPT;
>  		guc->interrupts.reset = gen9_reset_guc_interrupts;
>  		guc->interrupts.enable = gen9_enable_guc_interrupts;
>  		guc->interrupts.disable = gen9_disable_guc_interrupts;
> +		guc->send_regs.base = i915_mmio_reg_offset(SOFT_SCRATCH(0));
> +		guc->send_regs.count = GUC_MAX_MMIO_MSG_LEN;
> +		BUILD_BUG_ON(GUC_MAX_MMIO_MSG_LEN > SOFT_SCRATCH_COUNT);
>  	}
>  }
>  
> -- 
> 2.28.0
> 
