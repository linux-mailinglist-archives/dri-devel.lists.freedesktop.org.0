Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E554EE57
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 02:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADE410FB5F;
	Fri, 17 Jun 2022 00:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8B210FB7C;
 Fri, 17 Jun 2022 00:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655424780; x=1686960780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e8TsB9XMUMBvZYzqj+0+StbCDXQ7BLYEb+01/z3Yqyo=;
 b=nPx7HtA9IojyCZ7VoKIQo88VDw7kSZ7ibYExrlStjrF+vStrpVAP+UWf
 Knl40cMoQURY6Wc1F/pY9bfad8Cmbsspad3XzoOpKUQHTnFM2R7pkBko1
 wHv23SXkSjQkhX1l5QOt/RxOve8UqXi4wz59Iwnk2bTpBHFz+Hx51uQht
 AmPb6lLpxSq8xy0JA4TtdoHfaqYV8YYARVkIkvlBwBfuONZV0vvI2vvRK
 gsnSoM94RI1zli0TgRHOJAJ7M+UzpBpGAAPVdj94TnivOJY1+tWLL3g4N
 v782lGZADTs/gLS5WgFxJb+HVZJfRpvoAy5B2Mz9w+PrDJh1TnW/eMUhC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268071661"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268071661"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 17:13:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="560105786"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 17:12:59 -0700
Date: Thu, 16 Jun 2022 17:12:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v2 3/9] drm/i915/dg2: Add DG2_NB_MBD subplatform
Message-ID: <YqvHCa4j8QwMNrmd@mdroper-desk1.amr.corp.intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-4-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616120106.24353-4-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jon.ewins@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 05:31:00PM +0530, Anshuman Gupta wrote:
> DG2 NB SKU need to distinguish between MBD and AIC to probe
> the VRAM Self Refresh feature support. Adding those sub platform
> accordingly.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>  drivers/gpu/drm/i915/intel_device_info.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_device_info.h | 11 +++++++----
>  include/drm/i915_pciids.h                | 23 ++++++++++++++++-------
>  4 files changed, 47 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index a5bc6a774c5a..f1f8699eedfd 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1007,10 +1007,13 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, INTEL_PONTEVECCHIO)
>  
>  #define IS_DG2_G10(dev_priv) \
> +	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10_NB_MBD) || \
>  	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10)
>  #define IS_DG2_G11(dev_priv) \
> +	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11_NB_MBD) || \
>  	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11)
>  #define IS_DG2_G12(dev_priv) \
> +	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12_NB_MBD) || \
>  	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12)
>  #define IS_ADLS_RPLS(dev_priv) \
>  	IS_SUBPLATFORM(dev_priv, INTEL_ALDERLAKE_S, INTEL_SUBPLATFORM_RPL)
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index f0bf23726ed8..93da555adc4e 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -187,6 +187,18 @@ static const u16 subplatform_rpl_ids[] = {
>  	INTEL_RPLP_IDS(0),
>  };
>  
> +static const u16 subplatform_g10_mb_mbd_ids[] = {
> +	INTEL_DG2_G10_NB_MBD_IDS(0),
> +};
> +
> +static const u16 subplatform_g11_mb_mbd_ids[] = {
> +	INTEL_DG2_G11_NB_MBD_IDS(0),
> +};
> +
> +static const u16 subplatform_g12_mb_mbd_ids[] = {
> +	INTEL_DG2_G12_NB_MBD_IDS(0),
> +};

We only need a single MBD subplatform, not three new subplatforms.
Unless I'm forgetting something, a single device ID can be assigned two
two independent subplatforms at the same time.  So the decision about
whether to set the G10, G11, or G12 bit is one decision.  The decision
about whether to set the MBD bit is a completely separate decision that
doesn't care about the G10/G11/G12 stuff.

> +
>  static const u16 subplatform_g10_ids[] = {
>  	INTEL_DG2_G10_IDS(0),
>  	INTEL_ATS_M150_IDS(0),
> @@ -246,6 +258,15 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>  	} else if (find_devid(devid, subplatform_rpl_ids,
>  			      ARRAY_SIZE(subplatform_rpl_ids))) {
>  		mask = BIT(INTEL_SUBPLATFORM_RPL);
> +	} else if (find_devid(devid, subplatform_g10_mb_mbd_ids,
> +			      ARRAY_SIZE(subplatform_g10_mb_mbd_ids))) {
> +		mask = BIT(INTEL_SUBPLATFORM_G10_NB_MBD);
> +	} else if (find_devid(devid, subplatform_g11_mb_mbd_ids,
> +			      ARRAY_SIZE(subplatform_g11_mb_mbd_ids))) {
> +		mask = BIT(INTEL_SUBPLATFORM_G11_NB_MBD);
> +	} else if (find_devid(devid, subplatform_g12_mb_mbd_ids,
> +			      ARRAY_SIZE(subplatform_g12_mb_mbd_ids))) {
> +		mask = BIT(INTEL_SUBPLATFORM_G12_NB_MBD);

Assuming you consolidate MBD back down to just a single extra
subplatform, the lookup and bit setting should happen in a separate 'if'
statement (not an 'else' block).

        if (find_devid(devid, subplatform_mbd_ids,
                       ARRAY_SIZE(subplatform_mbd_ids)))
                mask |= BIT(INTEL_SUBPLATFORM_MBD);


Matt

>  	} else if (find_devid(devid, subplatform_g10_ids,
>  			      ARRAY_SIZE(subplatform_g10_ids))) {
>  		mask = BIT(INTEL_SUBPLATFORM_G10);
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 08341174ee0a..c929e2d7e59c 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -97,7 +97,7 @@ enum intel_platform {
>   * it is fine for the same bit to be used on multiple parent platforms.
>   */
>  
> -#define INTEL_SUBPLATFORM_BITS (3)
> +#define INTEL_SUBPLATFORM_BITS (6)
>  #define INTEL_SUBPLATFORM_MASK (BIT(INTEL_SUBPLATFORM_BITS) - 1)
>  
>  /* HSW/BDW/SKL/KBL/CFL */
> @@ -111,9 +111,12 @@ enum intel_platform {
>  #define INTEL_SUBPLATFORM_UY	(0)
>  
>  /* DG2 */
> -#define INTEL_SUBPLATFORM_G10	0
> -#define INTEL_SUBPLATFORM_G11	1
> -#define INTEL_SUBPLATFORM_G12	2
> +#define INTEL_SUBPLATFORM_G10_NB_MBD	0
> +#define INTEL_SUBPLATFORM_G11_NB_MBD	1
> +#define INTEL_SUBPLATFORM_G12_NB_MBD	2
> +#define INTEL_SUBPLATFORM_G10	3
> +#define INTEL_SUBPLATFORM_G11	4
> +#define INTEL_SUBPLATFORM_G12	5
>  
>  /* ADL */
>  #define INTEL_SUBPLATFORM_RPL	0
> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> index 4585fed4e41e..198be417bb2d 100644
> --- a/include/drm/i915_pciids.h
> +++ b/include/drm/i915_pciids.h
> @@ -693,32 +693,41 @@
>  	INTEL_VGA_DEVICE(0xA7A9, info)
>  
>  /* DG2 */
> -#define INTEL_DG2_G10_IDS(info) \
> +#define INTEL_DG2_G10_NB_MBD_IDS(info) \
>  	INTEL_VGA_DEVICE(0x5690, info), \
>  	INTEL_VGA_DEVICE(0x5691, info), \
> -	INTEL_VGA_DEVICE(0x5692, info), \
> +	INTEL_VGA_DEVICE(0x5692, info)
> +
> +#define INTEL_DG2_G11_NB_MBD_IDS(info) \
> +	INTEL_VGA_DEVICE(0x5693, info), \
> +	INTEL_VGA_DEVICE(0x5694, info), \
> +	INTEL_VGA_DEVICE(0x5695, info)
> +
> +#define INTEL_DG2_G12_NB_MBD_IDS(info) \
> +	INTEL_VGA_DEVICE(0x5696, info), \
> +	INTEL_VGA_DEVICE(0x5697, info)
> +
> +#define INTEL_DG2_G10_IDS(info) \
>  	INTEL_VGA_DEVICE(0x56A0, info), \
>  	INTEL_VGA_DEVICE(0x56A1, info), \
>  	INTEL_VGA_DEVICE(0x56A2, info)
>  
>  #define INTEL_DG2_G11_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5693, info), \
> -	INTEL_VGA_DEVICE(0x5694, info), \
> -	INTEL_VGA_DEVICE(0x5695, info), \
>  	INTEL_VGA_DEVICE(0x56A5, info), \
>  	INTEL_VGA_DEVICE(0x56A6, info), \
>  	INTEL_VGA_DEVICE(0x56B0, info), \
>  	INTEL_VGA_DEVICE(0x56B1, info)
>  
>  #define INTEL_DG2_G12_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5696, info), \
> -	INTEL_VGA_DEVICE(0x5697, info), \
>  	INTEL_VGA_DEVICE(0x56A3, info), \
>  	INTEL_VGA_DEVICE(0x56A4, info), \
>  	INTEL_VGA_DEVICE(0x56B2, info), \
>  	INTEL_VGA_DEVICE(0x56B3, info)
>  
>  #define INTEL_DG2_IDS(info) \
> +	INTEL_DG2_G10_NB_MBD_IDS(info), \
> +	INTEL_DG2_G11_NB_MBD_IDS(info), \
> +	INTEL_DG2_G12_NB_MBD_IDS(info), \
>  	INTEL_DG2_G10_IDS(info), \
>  	INTEL_DG2_G11_IDS(info), \
>  	INTEL_DG2_G12_IDS(info)
> -- 
> 2.26.2
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
