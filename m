Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A796E5688
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 03:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732D10E668;
	Tue, 18 Apr 2023 01:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D0610E667;
 Tue, 18 Apr 2023 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681782020; x=1713318020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OskGLZarC97afV+YZCPgIYWfaMrOVQDkgNhECV3vFHY=;
 b=M0sRnfmyB5bFGxaPUs/aIs0JUAQqmXXxKx8Vxmzf/2p6VukCdDe3HYtA
 GLm47YCrETt+194Q74FoCMkXWCzTRZH6456o22Nf8z54jlcF+i5eo9s40
 JOcz+DMYCSDPAWXG/5J7nWjrxofOJnxMRUFkszETrs/DmCPrdEEY2c4zW
 XZkUGAp44ZVwRAUjOQPUtOx+1I9BmxhOouUhpIScUo36sdOx8COOrANIw
 yC+fkFlkxZezjTChVJiDONNxKCfJ6+meh0pKmxuV6/LTruijfBI+ihUSq
 ePBg5ElCtYsIXryH9HEU0+5qq3Dv8PZ5g8wlAKjc8+3vmCM9WetPylp46 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="345046096"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="345046096"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 18:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="1020618509"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="1020618509"
Received: from sslose-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.56.168])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 18:40:17 -0700
Date: Tue, 18 Apr 2023 03:39:54 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Provide sysfs for
 efficient freq
Message-ID: <ZD306iP1tDnekIn0@ashyti-mobl2.lan>
References: <20230418000915.3489494-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418000915.3489494-1-vinay.belgaumkar@intel.com>
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

Hi Vinay,

Looks good, just few minor comments below,

[...]

> @@ -267,13 +267,11 @@ static int run_test(struct intel_gt *gt, int test_type)
>  	}
>  
>  	/*
> -	 * Set min frequency to RPn so that we can test the whole
> -	 * range of RPn-RP0. This also turns off efficient freq
> -	 * usage and makes results more predictable.
> +	 * Turn off efficient freq so RPn/RP0 ranges are obeyed
>  	 */
> -	err = slpc_set_min_freq(slpc, slpc->min_freq);
> +	err = intel_guc_slpc_set_ignore_eff_freq(slpc, true);
>  	if (err) {
> -		pr_err("Unable to update min freq!");
> +		pr_err("Unable to turn off efficient freq!");

drm_err()? or gt_err()? As we are here we can use a proper
printing.

How is this change related to the scope of this patch?

>  		return err;
>  	}
>  
> @@ -358,9 +356,10 @@ static int run_test(struct intel_gt *gt, int test_type)
>  			break;
>  	}
>  
> -	/* Restore min/max frequencies */
> -	slpc_set_max_freq(slpc, slpc_max_freq);
> +	/* Restore min/max frequencies and efficient flag */
>  	slpc_set_min_freq(slpc, slpc_min_freq);
> +	slpc_set_max_freq(slpc, slpc_max_freq);
> +	intel_guc_slpc_set_ignore_eff_freq(slpc, false);

mmhhh... do we care here about the return value?

>  
>  	if (igt_flush_test(gt->i915))
>  		err = -EIO;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 026d73855f36..b1b70ee3001b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -277,6 +277,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  
>  	slpc->max_freq_softlimit = 0;
>  	slpc->min_freq_softlimit = 0;
> +	slpc->ignore_eff_freq = false;
>  	slpc->min_is_rpmax = false;
>  
>  	slpc->boost_freq = 0;
> @@ -457,6 +458,31 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>  	return ret;
>  }
>  
> +int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val)
> +{
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;
> +	int ret = 0;

no need to initialize ret here.

> +
> +	mutex_lock(&slpc->lock);
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	ret = slpc_set_param(slpc,
> +			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> +			     val);
> +	if (ret) {
> +		guc_probe_error(slpc_to_guc(slpc), "Failed to set efficient freq(%d): %pe\n",
> +				val, ERR_PTR(ret));
> +		goto out;
> +	}
> +
> +	slpc->ignore_eff_freq = val;

nit that you can ignore: if you put this under else and save
brackets and a goto.

Andi
