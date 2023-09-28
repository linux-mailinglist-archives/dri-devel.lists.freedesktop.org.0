Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B97B149D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 09:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B9B10E5DA;
	Thu, 28 Sep 2023 07:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765B10E067;
 Thu, 28 Sep 2023 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695885592; x=1727421592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cQcVLMNA85Zv2ngrvu+1jSwpfMuONx+fWSxF05D6PEM=;
 b=j7LARM4gkj4wpmtS1YxRE9KmakhFTrtLZjE1EIImtPvBnVCNNdGVDYQt
 IKOVb6He/u0T1pVvFszMNhjus44gxDUm3ge+ohZT1sPtjBIckEKiRtlLG
 Zp/DVEuRMW5fzVIwkeMsj+F3/e3zDhZcsOCFnOhDpauYPpuydss2AIP7r
 tniXQBWpMdMeQgxZZ4bzfF9yEzJKBF9fytx9A5XFCkRGbDTpiRMeom0ju
 S46pDFbFFuRnuRbOJyRMpvPS3+Chn6JopdT5JYJ6Eg0QtAY0K+HRRsOUl
 o2C3S0YVbSJ5nOBm+dNiQsPpRGYawIp+/sxImDYtYd0balA51oDebI2/y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361374626"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="361374626"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752869969"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="752869969"
Received: from mnazleas-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.37.197])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:19:48 -0700
Date: Thu, 28 Sep 2023 09:19:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 3/4] drm/i915: Reset steer semaphore for media GT on
 resume
Message-ID: <ZRUpDcKowRXpWjD9@ashyti-mobl2.lan>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927210357.17461-3-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927210357.17461-3-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Wed, Sep 27, 2023 at 11:03:56PM +0200, Nirmoy Das wrote:
> During resume, the steer semaphore on GT1 was observed to be held. The
> hardware team has confirmed the safety of clearing the steer semaphore
> during driver load/resume, as no lock acquisitions can occur in this
> process by other agents.
> 
> v2: reset on resume not in intel_gt_init().
> v3: do the reset on intel_gt_resume_early()
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

In the previous version I added my r-b here. Please consider it
for the next version:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Even though there are still some quesions coming from Matt.

Thanks,
Andi

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index dab73980c9f1..59cebf205b72 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -13,6 +13,7 @@
>  #include "intel_engine_pm.h"
>  #include "intel_gt.h"
>  #include "intel_gt_clock_utils.h"
> +#include "intel_gt_mcr.h"
>  #include "intel_gt_pm.h"
>  #include "intel_gt_print.h"
>  #include "intel_gt_requests.h"
> @@ -218,6 +219,17 @@ void intel_gt_pm_fini(struct intel_gt *gt)
>  
>  void intel_gt_resume_early(struct intel_gt *gt)
>  {
> +	/*
> +	 * Reset the steer semaphore on GT1, as we have observed it
> +	 * remaining held after a suspend operation. Confirmation
> +	 * from the hardware team ensures the safety of resetting
> +	 * the steer semaphore during driver load/resume, as there
> +	 * are no lock acquisitions during this process by other
> +	 * agents.
> +	 */
> +	if (MEDIA_VER(gt->i915) >= 13 && gt->type == GT_MEDIA)
> +		intel_gt_mcr_lock_reset(gt);
> +
>  	intel_uncore_resume_early(gt->uncore);
>  	intel_gt_check_and_clear_faults(gt);
>  }
> -- 
> 2.41.0
