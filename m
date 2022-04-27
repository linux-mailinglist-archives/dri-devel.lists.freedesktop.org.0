Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A9F5116DD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 14:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A223C10F3EC;
	Wed, 27 Apr 2022 12:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4556210F3EC;
 Wed, 27 Apr 2022 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651063195; x=1682599195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qP33DCimD8AvzY0Sp5gX8CdfK1C4zLx3dtp704GKhJA=;
 b=JGe6LO+ZR1HTI+zYyot1t6iTJLX6qRzTQNEZxd790yr1IrZKwdyl8QeP
 SCCgMH3RmAdDH9sLCYp6AUYeFoMjE+n0BcJMXWCKURtqR+Fctk/i/y2Uo
 WsvGc9wO0TC/3DRfsCDHeszPzVVMcbT7iy3ItMMrRMq/ZB3Jc8Hi+Zua3
 8x+Khn7c3UYM1gL0Rsmf1vUdv45OQ9iz2eihT/b7flwdeW6KDwXmduB/H
 ExmomDxHoZUjbKgoIUJ3tEckR8n76dCZ9RudVU7DVJpSz+I89IF+rmSQR
 wtl3amq8God30B6q6b6NRRUt1+lZ7ZVtSj2isBTlzEoW+USxoQp2C9/lM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="253294171"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="253294171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:39:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="580572330"
Received: from iqirene-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.37.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:39:44 -0700
Date: Wed, 27 Apr 2022 08:39:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/huc: check HW directly for HuC auth status
Message-ID: <Ymk5iP3rhcO89Gkb@intel.com>
References: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
 <20220427002617.1767295-2-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427002617.1767295-2-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 05:26:14PM -0700, Daniele Ceraolo Spurio wrote:
> The huc_is_authenticated function return is based on our SW tracking of
> the HuC auth status. However, around suspend/resume and reset this can
> go out of sync with the actual HW state, which is why we use
> huc_check_state() to look at the actual HW state. Instead of having this
> duality, just make huc_is_authenticated() return the HW state and use it
> everywhere we need to know if HuC is running.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c | 23 ++++++++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_huc.h |  5 -----
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 556829de9c172..773020e69589a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -80,6 +80,18 @@ void intel_huc_fini(struct intel_huc *huc)
>  	intel_uc_fw_fini(&huc->fw);
>  }
>  
> +static bool huc_is_authenticated(struct intel_huc *huc)
> +{
> +	struct intel_gt *gt = huc_to_gt(huc);
> +	intel_wakeref_t wakeref;
> +	u32 status = 0;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		status = intel_uncore_read(gt->uncore, huc->status.reg);
> +
> +	return (status & huc->status.mask) == huc->status.value;
> +}
> +
>  /**
>   * intel_huc_auth() - Authenticate HuC uCode
>   * @huc: intel_huc structure
> @@ -96,7 +108,7 @@ int intel_huc_auth(struct intel_huc *huc)
>  	struct intel_guc *guc = &gt->uc.guc;
>  	int ret;
>  
> -	GEM_BUG_ON(intel_huc_is_authenticated(huc));
> +	GEM_BUG_ON(huc_is_authenticated(huc));
>  
>  	if (!intel_uc_fw_is_loaded(&huc->fw))
>  		return -ENOEXEC;
> @@ -150,10 +162,6 @@ int intel_huc_auth(struct intel_huc *huc)
>   */
>  int intel_huc_check_status(struct intel_huc *huc)
>  {
> -	struct intel_gt *gt = huc_to_gt(huc);
> -	intel_wakeref_t wakeref;
> -	u32 status = 0;
> -
>  	switch (__intel_uc_fw_status(&huc->fw)) {
>  	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>  		return -ENODEV;
> @@ -167,10 +175,7 @@ int intel_huc_check_status(struct intel_huc *huc)
>  		break;
>  	}
>  
> -	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		status = intel_uncore_read(gt->uncore, huc->status.reg);
> -
> -	return (status & huc->status.mask) == huc->status.value;

oh, these variable names look so generic, while it looks like the only usage
for them is for mask = loaded and value = loaded...

But anyway it is better this indirection with some generic name than duplicating
the definition depending on platform in here...

so:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> +	return huc_is_authenticated(huc);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 73ec670800f2b..77d813840d76c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -50,11 +50,6 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
>  	return intel_uc_fw_is_available(&huc->fw);
>  }
>  
> -static inline bool intel_huc_is_authenticated(struct intel_huc *huc)
> -{
> -	return intel_uc_fw_is_running(&huc->fw);
> -}
> -
>  void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
>  
>  #endif
> -- 
> 2.25.1
> 
