Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFAF6E77F0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 13:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC99810E935;
	Wed, 19 Apr 2023 11:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851E910E931;
 Wed, 19 Apr 2023 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681902109; x=1713438109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YySZ/JsO35Ah0v1jyl2olZmVzwk3cnBTph8u1T+UcX0=;
 b=egF0wm7Q9/HB2cF8rwX54v5JbIS5OhkriezCjteeKThJ1r4nCezCm/ok
 4wiC+wO/+nyvRmyXGXH5/g+xezsRz07mfdo2EmPlS50caUcnnOJOWEL7o
 3XlO2vgYiZ3y+Hy9dGdxyEP6uQpchrDfL7urgILVGcEETJDy7WM2IqsHm
 t6Zhmf+R88utqJNj8ozoGIsnE2kggPQpy5ALG4z/D0scTiNXfm5Rag4Bz
 VjX0rBGL5o+QXBS/JqoV3gwDlXymXukz8TqE8Id28WMX0m8mZuZej3SfM
 VHp7Kx0R7D43nfApar6liFmn/qj4IoQsYz/G1qEHwYlz7afZHVES5ySTq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344164583"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="344164583"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802887383"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802887383"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:01:45 -0700
Date: Wed, 19 Apr 2023 13:01:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Message-ID: <ZD/KFgdE4mtvKCPJ@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-3-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-3-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Sun, Apr 16, 2023 at 11:24:57PM -0700, fei.yang@intel.com wrote:
> From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> 
> On MTL, GT can no longer allocate on LLC - only the CPU can.
> This, along with addition of support for L4 cache calls a
> MOCS/PAT table update.
> Alos the PAT index registers are multicasted for primary GT,

/Alos/Also/

[...]

> +static void xelpmp_setup_private_ppat(struct intel_uncore *uncore)
> +{
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(0), MTL_PPAT_L4_0_WB);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(1), MTL_PPAT_L4_1_WT);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(2), MTL_PPAT_L4_3_UC);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(3),
> +			   MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(4),
> +			   MTL_PPAT_L4_0_WB | MTL_3_COH_2W);

nit: I think it's more readable if we either keep everything in
one line or we break the line for everyone. Even if we break the
80 characters rule.

[...]

> @@ -603,16 +639,22 @@ void setup_private_pat(struct intel_gt *gt)
>  
>  	GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> -		xehp_setup_private_ppat(gt);
> -	else if (GRAPHICS_VER(i915) >= 12)
> -		tgl_setup_private_ppat(uncore);
> -	else if (GRAPHICS_VER(i915) >= 11)
> -		icl_setup_private_ppat(uncore);
> -	else if (IS_CHERRYVIEW(i915) || IS_GEN9_LP(i915))
> -		chv_setup_private_ppat(uncore);
> -	else
> -		bdw_setup_private_ppat(uncore);
> +	if (gt->type == GT_MEDIA) {
> +		xelpmp_setup_private_ppat(gt->uncore);

nit: if you add a return here you save the else.

> +	} else {
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +			xelpg_setup_private_ppat(gt);
> +		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +			xehp_setup_private_ppat(gt);
> +		else if (GRAPHICS_VER(i915) >= 12)
> +			tgl_setup_private_ppat(uncore);
> +		else if (GRAPHICS_VER(i915) >= 11)
> +			icl_setup_private_ppat(uncore);
> +		else if (IS_CHERRYVIEW(i915) || IS_GEN9_LP(i915))
> +			chv_setup_private_ppat(uncore);
> +		else
> +			bdw_setup_private_ppat(uncore);
> +	}

[...]

> -static u32 global_mocs_offset(void)
> +static u32 global_mocs_offset(struct intel_gt *gt)
>  {
> -	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
> +	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) + gt->uncore->gsi_offset;

There is one open question here coming from one of previous
Matt's reviews. Would it make sense to have this in a different
patch?

Andi
