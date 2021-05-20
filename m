Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2038B4AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF936F4B5;
	Thu, 20 May 2021 16:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAC66F4B5;
 Thu, 20 May 2021 16:54:37 +0000 (UTC)
IronPort-SDR: JOYWo00zgrSBwhASLz4E1V6GDQqAhKuWbi//2VEhGMmeDVDA4oHZq/wAugJp/0dNp+zvgbRmjB
 Js1sU+DwTFOQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188402397"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="188402397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 09:54:36 -0700
IronPort-SDR: 0EKUd1tdqexe8L0b2n75itgG4ha+jc2CI0b43n25ItLBaKRhkU2mRiZk3hyVmt05ZLi0l70SjH
 YZrbpAsfY2Lg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440525798"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 09:54:36 -0700
Date: Thu, 20 May 2021 09:47:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 04/97] drm/i915/guc: skip disabling CTBs before
 sanitizing the GuC
Message-ID: <20210520164723.GA16494@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-5-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-5-matthew.brost@intel.com>
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

On Thu, May 06, 2021 at 12:13:18PM -0700, Matthew Brost wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> If we're about to sanitize the GuC, something might have going wrong
> beforehand, so we should avoid trying to talk to it. Even if GuC is
> still running fine, the sanitize will reset its internal state and clear
> the CTB registration, so there is still no need to explicitly do so.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/2469
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 6abb8f2dc33d..892c1315ce49 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -504,7 +504,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>  
>  	ret = intel_guc_sample_forcewake(guc);
>  	if (ret)
> -		goto err_communication;
> +		goto err_log_capture;
>  
>  	if (intel_uc_uses_guc_submission(uc))
>  		intel_guc_submission_enable(guc);
> @@ -529,8 +529,6 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	/*
>  	 * We've failed to load the firmware :(
>  	 */
> -err_communication:
> -	guc_disable_communication(guc);
>  err_log_capture:
>  	__uc_capture_load_err_log(uc);
>  err_out:
> @@ -558,9 +556,6 @@ static void __uc_fini_hw(struct intel_uc *uc)
>  	if (intel_uc_uses_guc_submission(uc))
>  		intel_guc_submission_disable(guc);
>  
> -	if (guc_communication_enabled(guc))
> -		guc_disable_communication(guc);
> -
>  	__uc_sanitize(uc);
>  }
>  
> @@ -577,7 +572,6 @@ void intel_uc_reset_prepare(struct intel_uc *uc)
>  	if (!intel_guc_is_ready(guc))
>  		return;
>  
> -	guc_disable_communication(guc);
>  	__uc_sanitize(uc);
>  }
>  
> -- 
> 2.28.0
> 
