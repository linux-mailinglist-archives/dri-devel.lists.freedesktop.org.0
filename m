Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F765553F92
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 02:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB795112F3C;
	Wed, 22 Jun 2022 00:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CE4112F3C;
 Wed, 22 Jun 2022 00:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655858043; x=1687394043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=59nkzfKw2tBTEx6vVXowe743kSkpZDY+LsQDM32sJoc=;
 b=CytEvpYcMu64mzjfhr0M2n2RBUPMAhpMhICFbBY0OTDGdqxWL/rlv00B
 GEa1B8XLL8bYEq74xNsWxTQTqxvyQjg1sli8EP9spkW4XIAvZ0hyCiDCk
 qGcrdUqr2O/4ccYKcuJXpml/Qk5Rne5dUmP2m55s5nXullsoUJyKbIXH5
 rn7W88m2L97bNMDZttmcVZP6+xcaBAdb1ey4DxtOH1SQCtRpu9tjlS7jO
 W/TlUzp8gFNqFcEElTNTMw2SlkdSg/dvNkPBVi5Xl7RXPGcWmF1FzyaIZ
 Qpwc6nF/k7QAuVqcLqDjLvqjTIuZtcB5zARyD4t9KzzEU2u3TJ9Bfr7nh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="366597583"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="366597583"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 17:34:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="591902651"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 17:34:02 -0700
Date: Tue, 21 Jun 2022 17:34:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: ADL-N should use the same GuC
 FW as ADL-S
Message-ID: <YrJjefR67IzdYrwJ@mdroper-desk1.amr.corp.intel.com>
References: <20220621233005.3952293-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621233005.3952293-1-daniele.ceraolospurio@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 04:30:05PM -0700, Daniele Ceraolo Spurio wrote:
> The only difference between the ADL S and P GuC FWs is the HWConfig
> support. ADL-N does not support HWConfig, so we should use the same
> binary as ADL-S, otherwise the GuC might attempt to fetch a config
> table that does not exist. ADL-N is internally identified as an ADL-P,
> so we need to special-case it in the FW selection code.
> 
> Fixes: 7e28d0b26759 ("drm/i915/adl-n: Enable ADL-N platform")
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Would the config table still get used somehow even though we return
false for ADL-N in has_table()?

Even if it couldn't be used, this change makes the behavior more clear
and explicit.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index d2c5c9367cc4..ef2d10184ee2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -162,6 +162,15 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>  	u8 rev = INTEL_REVID(i915);
>  	int i;
>  
> +	/*
> +	 * The only difference between the ADL GuC FWs is the HWConfig support.
> +	 * ADL-N does not support HWConfig, so we should use the same binary as
> +	 * ADL-S, otherwise the GuC might attempt to fetch a config table that
> +	 * does not exist.
> +	 */
> +	if (IS_ADLP_N(i915))
> +		p = INTEL_ALDERLAKE_S;
> +
>  	GEM_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
>  	fw_blobs = blobs_all[uc_fw->type].blobs;
>  	fw_count = blobs_all[uc_fw->type].count;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
