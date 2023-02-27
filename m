Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7ED6A40A6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A45810E3C9;
	Mon, 27 Feb 2023 11:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EA410E3C4;
 Mon, 27 Feb 2023 11:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677497428; x=1709033428;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uwPKurPwcmCHqbPfjdZowjITYLffAlyMmbWpMsp+eKw=;
 b=QTnHFG8M3t3tGvC+TwXX9ipQik6UWIPKj4iPgogErvPsbsrW5RUtdeJw
 cCmd/kqEX5bvF4HpezecVSVsCg2dqTMugFJqc39pYk0yD7UAj8IAvlFn2
 /dumEk8vIB5Jo4wvJJF2I9SpSIHHUjgpwZw8wWNCnCqwajVvCXxbs5Cu+
 Iuh8Z2cTFSyvWJHD4kTCBje7UGdOEgzFOYIlid6ZQskVVZwfMYwNI0L6K
 /EE+f5PtB4eqDgth25r3vjmgl6+rIgJFSX12Je2sY1IvSmu8YJqCALnZn
 CGAo1SvudwDcf4iWbTUtxL8M8pi17kRz2TokjoLL4GLFS//U5QCfTzf/E w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="322082176"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="322082176"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:30:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="666992772"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="666992772"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:30:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Set wedged if enable guc communication failed
In-Reply-To: <20230224231724.769343-1-zhanjun.dong@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230224231724.769343-1-zhanjun.dong@intel.com>
Date: Mon, 27 Feb 2023 13:30:23 +0200
Message-ID: <87y1oj1h2o.fsf@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Feb 2023, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
> Add err code check for enable_communication on resume path, set wedged if failed.

I can see that this is *what* the code does, but the commit message
should answer the question *why*.

>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 5 ++++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c | 9 +++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index cef3d6f5c34e..f3bb7cbbd293 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -401,8 +401,11 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
>  	intel_ggtt_restore_fences(gt->ggtt);
>  
>  	ret = intel_uc_runtime_resume(&gt->uc);
> -	if (ret)
> +	if (ret) {
> +		/* Set wedge if uc resume failed */

This comment is just a reiteration of the C code in English, but doesn't
provide any useful additional information.

BR,
Jani.

> +		intel_gt_set_wedged(gt);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 6648691bd645..d4f428acf20a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -698,8 +698,13 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>  	/* Make sure we enable communication if and only if it's disabled */
>  	GEM_BUG_ON(enable_communication == intel_guc_ct_enabled(&guc->ct));
>  
> -	if (enable_communication)
> -		guc_enable_communication(guc);
> +	if (enable_communication) {
> +		err = guc_enable_communication(guc);
> +		if (err) {
> +			guc_dbg(guc, "Failed to resume, %pe", ERR_PTR(err));
> +			return err;
> +		}
> +	}
>  
>  	/* If we are only resuming GuC communication but not reloading
>  	 * GuC, we need to ensure the ARAT timer interrupt is enabled

-- 
Jani Nikula, Intel Open Source Graphics Center
