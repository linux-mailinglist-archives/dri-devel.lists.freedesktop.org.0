Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D74E7A3B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 19:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73DF10E97E;
	Fri, 25 Mar 2022 18:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6052C10E765;
 Fri, 25 Mar 2022 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648233344; x=1679769344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/vxYYG4v4v8iIvE0b4/s4yHUy8Js5mIkhsD/lb9aMPU=;
 b=Tbx4bt0nDbdzKlXNiVI0sWlq8luhi8R+YG6JvSwRNWT8qzYhlN3ieYtD
 r9pwQ27lenayl//iXdOKZUXPPlTJ07u5KVABdhHQxuU7TDFfBJRb8SwFf
 IS/JwVD6ngleNBfopcvJffGCYsxXfvrQDV3NbUiW88rCw8QSMkHFTVbIZ
 A/FFxSlNW7VWUpcg9CvlDwNsv4Edmjt9lgVE9PNcMM1J7B3pWgSOFV3Ny
 O0000Vbx4V6aryW2wdTSvUYTfwm6b9H5PsHWJLBykVI2yETGhTEsQ9/lU
 w81ltefWcAo3dlFzRAxVS5TgFNveP3x0h4eNceCcpdnbonCtf4uVaL76r A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="246178185"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="246178185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 11:35:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="584553184"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 11:35:39 -0700
Date: Fri, 25 Mar 2022 11:29:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915: fix remaining_timeout in
 intel_gt_retire_requests_timeout
Message-ID: <20220325182928.GA5457@jons-linux-dev-box>
References: <20220325175839.2717499-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325175839.2717499-1-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 10:58:39AM -0700, Daniele Ceraolo Spurio wrote:
> In intel_gt_wait_for_idle, we use the remaining timeout returned from
> intel_gt_retire_requests_timeout to wait on the GuC being idle. However,
> the returned variable can have a negative value if something goes wrong
> during the wait, leading to us hitting a GEM_BUG_ON in the GuC wait
> function.
> To fix this, make sure to only return the timeout if it is positive.
> 
> Fixes: b97060a99b01b ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index edb881d756309..ef70c209976d8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -197,7 +197,7 @@ out_active:	spin_lock(&timelines->lock);
>  		active_count++;
>  
>  	if (remaining_timeout)
> -		*remaining_timeout = timeout;
> +		*remaining_timeout = timeout > 0 ? timeout : 0;
>  
>  	return active_count ? timeout : 0;
>  }
> -- 
> 2.25.1
> 
