Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CB67B14B9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 09:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE7C10E067;
	Thu, 28 Sep 2023 07:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D5710E067;
 Thu, 28 Sep 2023 07:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695885856; x=1727421856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GzIvZcRUR23aqiFWRtkRtitT4+i2L3cIy5kat0soE2k=;
 b=AbOn3laFB4ZDE0ONgW/15lMiHBG+OzRz0M5774isuOC03ROZ7vr2wQoY
 BfHCsOK+fz1M8KyKjFH6riC2x2kXsPROb0GvM/v/xvlugPZ36kId90huu
 Op+9FKVvNf3fPfsuzPonJvMJ7aSPqt1+qh83iN5xhl9EYd6408hRG8Elq
 kwhBVGin3lDhuhc0QKMeN6kx1pj8oBZPK0+TAtqEkl2Pbrj0nexYS6fBy
 Vs0GywA9CPPynQWB0r++z1OIQPxB+n5/X7LLXn1g7Gr+69UsvaSK+3a6g
 hRoEIaKAMk0JIK+3KgI5Jj3YuficAnReLOh45eloaw73/k0nx4vGnTgk2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361375610"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="361375610"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752870696"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="752870696"
Received: from mnazleas-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.37.197])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:24:12 -0700
Date: Thu, 28 Sep 2023 09:24:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 2/4] drm/i915: Introduce the intel_gt_resume_early()
Message-ID: <ZRUqFuG7FQdOqI2N@ashyti-mobl2.lan>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927210357.17461-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927210357.17461-2-nirmoy.das@intel.com>
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

On Wed, Sep 27, 2023 at 11:03:55PM +0200, Nirmoy Das wrote:
> Move early resume functions of gt to a proper file.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c | 6 ++++++
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h | 1 +
>  drivers/gpu/drm/i915/i915_driver.c    | 6 ++----
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 5a942af0a14e..dab73980c9f1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -216,6 +216,12 @@ void intel_gt_pm_fini(struct intel_gt *gt)
>  	intel_rc6_fini(&gt->rc6);
>  }
>  
> +void intel_gt_resume_early(struct intel_gt *gt)
> +{
> +	intel_uncore_resume_early(gt->uncore);
> +	intel_gt_check_and_clear_faults(gt);
> +}
> +

should this go into the gt/ directory? Besides, if we don't need
spinlocks in the whole reset function, we could directly have the

   intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);

here, so that we avoid having one line functions.

Andi
