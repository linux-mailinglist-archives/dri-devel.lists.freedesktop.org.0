Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D413D638BA1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 14:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C6710E0DB;
	Fri, 25 Nov 2022 13:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3340D10E0DB;
 Fri, 25 Nov 2022 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669384450; x=1700920450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vrs5C/ZesKC4+QbZiU7e035GDgOIShjPL6jQHflzGpU=;
 b=DCqCd8UnGgxOzZ2EE2lhKzSSHdFaryY/IdNVltRe8kYmi2xn/DCMsFVM
 9auKfGN0Yqis5/GfcsV1hxkmwuKAQkzR9Atsq4eZ5wcjCnIbCinLKsssx
 DkfZLEXF6eMlbExkAnhSDAD7EsBab539gfPfs7PV4S4gtYZnjUzdKJoO0
 ubVh5HnNgHfv0TPI1Kc7KibQt6F+G6FBXcvsMt+dxnV2iA9pwdAjZ6A3b
 3dc61xBC5VC2ahlwcMDysUUQ6ka9nGj55jMVNdXXwqhXneiAnm3NT00K4
 5mi2DRhAwxkiO08eDLWbabIPoJU47dvAo04nAM2tVjeT4v0HYrYq/urdb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="314521165"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="314521165"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 05:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="971577672"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="971577672"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga005.fm.intel.com with SMTP; 25 Nov 2022 05:54:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Nov 2022 15:54:02 +0200
Date: Fri, 25 Nov 2022 15:54:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/huc: fix leak of debug object in huc load fence
 on driver unload
Message-ID: <Y4DI+gq1rVQXDRbg@intel.com>
References: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
X-Patchwork-Hint: comment
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 04:56:51PM -0800, Daniele Ceraolo Spurio wrote:
> The fence is always initialized in huc_init_early, but the cleanup in
> huc_fini is only being run if HuC is enabled. This causes a leaking of
> the debug object when HuC is disabled/not supported, which can in turn
> trigger a warning if we try to register a new debug offset at the same
> address on driver reload.
> 
> To fix the issue, make sure to always run the cleanup code.

This oopsing in ci now. Somehow the patchwork run did not
hit that oops.

> 
> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Reported-by: Brian Norris <briannorris@chromium.org>
> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
> 
> Note: I didn't manage to repro the reported warning, but I did confirm
> that we weren't correctly calling i915_sw_fence_fini and that this patch
> fixes that.
> 
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c | 12 +++++++-----
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  1 +
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index fbc8bae14f76..83735a1528fe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -300,13 +300,15 @@ int intel_huc_init(struct intel_huc *huc)
>  
>  void intel_huc_fini(struct intel_huc *huc)
>  {
> -	if (!intel_uc_fw_is_loadable(&huc->fw))
> -		return;
> -
> +	/*
> +	 * the fence is initialized in init_early, so we need to clean it up
> +	 * even if HuC loading is off.
> +	 */
>  	delayed_huc_load_complete(huc);
> -
>  	i915_sw_fence_fini(&huc->delayed_load.fence);
> -	intel_uc_fw_fini(&huc->fw);
> +
> +	if (intel_uc_fw_is_loadable(&huc->fw))
> +		intel_uc_fw_fini(&huc->fw);
>  }
>  
>  void intel_huc_suspend(struct intel_huc *huc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index dbd048b77e19..41f08b55790e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -718,6 +718,7 @@ int intel_uc_runtime_resume(struct intel_uc *uc)
>  
>  static const struct intel_uc_ops uc_ops_off = {
>  	.init_hw = __uc_check_hw,
> +	.fini = __uc_fini, /* to clean-up the init_early initialization */
>  };
>  
>  static const struct intel_uc_ops uc_ops_on = {
> -- 
> 2.37.3

-- 
Ville Syrjälä
Intel
