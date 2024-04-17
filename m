Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ABD8A8542
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C46A113544;
	Wed, 17 Apr 2024 13:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrztF3gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08C6113544;
 Wed, 17 Apr 2024 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713361842; x=1744897842;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pJdF8hrnJwuqV2TRl1VS/Uounhlzqb5kh11Beec5rDE=;
 b=LrztF3gmKZ/drMWr7V7YghEwWYzrzmiiZ30+DSlHgPtILyt9zU8hkNWL
 pfA0Q+474wquCJa0XL9oixSMkCf1p9yPATrMp5pw2KHa8HMWmEbxyMzdZ
 CiqO5FEKr6u2Q73F6S+pr41jOJwWn5/3KFuO40JDldyn3mZ2NJ9XB0j6y
 a+45V86MSN+P7Owveuy+QYRxWA0QPgjCuC5hanKQCYmMrViVabYsI9JYf
 yNZrSuE/vgl+9Jvg0sLaX6ZSVO6uAVLX4ecM69bMG24MUef95kutDOwQe
 nVi+cZzj1PVKQFIS+D4U6EZh3xPCwM8UgWn/2KsTwgwib6wj5R7cQot32 w==;
X-CSE-ConnectionGUID: XJpfpRMyRxaYNleNhGOFyw==
X-CSE-MsgGUID: 9xnGpX0pR7GJ/+gCwWGZag==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8777989"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8777989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:50:42 -0700
X-CSE-ConnectionGUID: 8AsVgJ13Sn6L6jWQb50u4Q==
X-CSE-MsgGUID: 02iDpjicQcuzz/pQacZqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22685608"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2024 06:50:39 -0700
Received: from [10.252.45.94] (unknown [10.252.45.94])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 494F832EA6;
 Wed, 17 Apr 2024 14:50:33 +0100 (IST)
Message-ID: <fa0574b1-cff1-48b1-bc8e-ccd5a8b2d0a6@intel.com>
Date: Wed, 17 Apr 2024 15:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Extract xe_gt_idle() helper
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
 <20240417084145.242480-4-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240417084145.242480-4-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 17.04.2024 10:41, Aravind Iddamsetty wrote:
> This would be used in other places outside of gt_reset path.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 31 +++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_gt.h |  1 +
>  2 files changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cfa5da900461..59f497d575ad 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +/* Idle the GT */

as this is a public function, can we have a proper kernel-doc here?

and maybe some hint what should be done if this function fails?

> +int xe_gt_idle(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	xe_gt_sanitize(gt);
> +
> +	xe_uc_gucrc_disable(&gt->uc);
> +	xe_uc_stop_prepare(&gt->uc);
> +	xe_gt_pagefault_reset(gt);
> +
> +	err = xe_uc_stop(&gt->uc);
> +	if (err)
> +		return err;
> +
> +	xe_gt_tlb_invalidation_reset(gt);
> +
> +	return err;
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
> @@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
>  	}
>  
>  	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_sanitize(gt);
>  
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
>  
> -	xe_uc_gucrc_disable(&gt->uc);
> -	xe_uc_stop_prepare(&gt->uc);
> -	xe_gt_pagefault_reset(gt);
> -
> -	err = xe_uc_stop(&gt->uc);
> -	if (err)
> -		goto err_out;
> -
> -	xe_gt_tlb_invalidation_reset(gt);
> +	xe_gt_idle(gt);
>  
>  	err = do_gt_reset(gt);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index ed6ea8057e35..d62af1725ff6 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  void xe_gt_remove(struct xe_gt *gt);
> +int xe_gt_idle(struct xe_gt *gt);
>  
>  /**
>   * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
