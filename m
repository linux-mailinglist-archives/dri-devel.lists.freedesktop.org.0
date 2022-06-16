Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D25C54E09A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4001C113D0C;
	Thu, 16 Jun 2022 12:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71334113D0C;
 Thu, 16 Jun 2022 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655381595; x=1686917595;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m8qiybRQCFnt3wnzjlWozPzNZrmvAfdG6+vQjxMFElA=;
 b=LkaAVEE8Ib3W4IJ+fd7eqCuTfj8/Tz3JMNzR6aXv18EiaBK3HW9Eqvrt
 /zvAe81PPQ+HjEC64vg7qbgnT2QyYFcmKsfQUM9phzzTGAdiFMTmsb0RY
 sl5ANZehEqjooV0C1H6pUtQY6PR+uDI7YYgUDoyZd+me76hrE9eHzeNuR
 2mJM5bUpYQfrdog26oTBCSYS3IYNC2wI3xI3cpFe1yrh60dj9xq8cCKkq
 PWfnBl08L/xc8iSJGuQf/GdA4JZ9uDjnM2BuaDMqZ2IC4xWgBhcUcN5/E
 m5gwcvHXVjx+CiLPHd3wv52DA+JcJt9sJkO/IqlMljGqMmeYSEaWwuPkz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="365588075"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="365588075"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:13:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="912131996"
Received: from mstokes1-mobl.ger.corp.intel.com (HELO [10.213.198.82])
 ([10.213.198.82])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:13:13 -0700
Message-ID: <784a071a-02c4-6a8a-0022-7f833841057b@linux.intel.com>
Date: Thu, 16 Jun 2022 13:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v2 3/9] drm/i915/dg2: Add DG2_NB_MBD
 subplatform
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-4-anshuman.gupta@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220616120106.24353-4-anshuman.gupta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/06/2022 13:01, Anshuman Gupta wrote:
> DG2 NB SKU need to distinguish between MBD and AIC to probe
> the VRAM Self Refresh feature support. Adding those sub platform
> accordingly.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>   drivers/gpu/drm/i915/intel_device_info.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/i915/intel_device_info.h | 11 +++++++----
>   include/drm/i915_pciids.h                | 23 ++++++++++++++++-------
>   4 files changed, 47 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index a5bc6a774c5a..f1f8699eedfd 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1007,10 +1007,13 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, INTEL_PONTEVECCHIO)
>   
>   #define IS_DG2_G10(dev_priv) \
> +	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10_NB_MBD) || \
>   	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10)
>   #define IS_DG2_G11(dev_priv) \
> +	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11_NB_MBD) || \
>   	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11)
>   #define IS_DG2_G12(dev_priv) \
> +	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12_NB_MBD) || \
>   	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12)
>   #define IS_ADLS_RPLS(dev_priv) \
>   	IS_SUBPLATFORM(dev_priv, INTEL_ALDERLAKE_S, INTEL_SUBPLATFORM_RPL)
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index f0bf23726ed8..93da555adc4e 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -187,6 +187,18 @@ static const u16 subplatform_rpl_ids[] = {
>   	INTEL_RPLP_IDS(0),
>   };
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
> +
>   static const u16 subplatform_g10_ids[] = {
>   	INTEL_DG2_G10_IDS(0),
>   	INTEL_ATS_M150_IDS(0),
> @@ -246,6 +258,15 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>   	} else if (find_devid(devid, subplatform_rpl_ids,
>   			      ARRAY_SIZE(subplatform_rpl_ids))) {
>   		mask = BIT(INTEL_SUBPLATFORM_RPL);
> +	} else if (find_devid(devid, subplatform_g10_mb_mbd_ids,
> +			      ARRAY_SIZE(subplatform_g10_mb_mbd_ids))) {
> +		mask = BIT(INTEL_SUBPLATFORM_G10_NB_MBD);
> +	} else if (find_devid(devid, subplatform_g11_mb_mbd_ids,
> +			      ARRAY_SIZE(subplatform_g11_mb_mbd_ids))) {
> +		mask = BIT(INTEL_SUBPLATFORM_G11_NB_MBD);
> +	} else if (find_devid(devid, subplatform_g12_mb_mbd_ids,
> +			      ARRAY_SIZE(subplatform_g12_mb_mbd_ids))) {
> +		mask = BIT(INTEL_SUBPLATFORM_G12_NB_MBD);
>   	} else if (find_devid(devid, subplatform_g10_ids,
>   			      ARRAY_SIZE(subplatform_g10_ids))) {
>   		mask = BIT(INTEL_SUBPLATFORM_G10);
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 08341174ee0a..c929e2d7e59c 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -97,7 +97,7 @@ enum intel_platform {
>    * it is fine for the same bit to be used on multiple parent platforms.
>    */
>   
> -#define INTEL_SUBPLATFORM_BITS (3)
> +#define INTEL_SUBPLATFORM_BITS (6)
>   #define INTEL_SUBPLATFORM_MASK (BIT(INTEL_SUBPLATFORM_BITS) - 1)
>   
>   /* HSW/BDW/SKL/KBL/CFL */
> @@ -111,9 +111,12 @@ enum intel_platform {
>   #define INTEL_SUBPLATFORM_UY	(0)
>   
>   /* DG2 */
> -#define INTEL_SUBPLATFORM_G10	0
> -#define INTEL_SUBPLATFORM_G11	1
> -#define INTEL_SUBPLATFORM_G12	2
> +#define INTEL_SUBPLATFORM_G10_NB_MBD	0
> +#define INTEL_SUBPLATFORM_G11_NB_MBD	1
> +#define INTEL_SUBPLATFORM_G12_NB_MBD	2
> +#define INTEL_SUBPLATFORM_G10	3
> +#define INTEL_SUBPLATFORM_G11	4
> +#define INTEL_SUBPLATFORM_G12	5

Ugh I feel this "breaks" the subplatform idea.. feels like it is just 
too many bits when two separate sets of information get tracked (Gxx 
plus MBD).

How about a separate "is_mbd" flag in runtime_info? You can split the 
PCI IDs split as you have done, but do a search against the MBD ones and 
set the flag.

Regards,

Tvrtko

>   
>   /* ADL */
>   #define INTEL_SUBPLATFORM_RPL	0
> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> index 4585fed4e41e..198be417bb2d 100644
> --- a/include/drm/i915_pciids.h
> +++ b/include/drm/i915_pciids.h
> @@ -693,32 +693,41 @@
>   	INTEL_VGA_DEVICE(0xA7A9, info)
>   
>   /* DG2 */
> -#define INTEL_DG2_G10_IDS(info) \
> +#define INTEL_DG2_G10_NB_MBD_IDS(info) \
>   	INTEL_VGA_DEVICE(0x5690, info), \
>   	INTEL_VGA_DEVICE(0x5691, info), \
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
>   	INTEL_VGA_DEVICE(0x56A0, info), \
>   	INTEL_VGA_DEVICE(0x56A1, info), \
>   	INTEL_VGA_DEVICE(0x56A2, info)
>   
>   #define INTEL_DG2_G11_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5693, info), \
> -	INTEL_VGA_DEVICE(0x5694, info), \
> -	INTEL_VGA_DEVICE(0x5695, info), \
>   	INTEL_VGA_DEVICE(0x56A5, info), \
>   	INTEL_VGA_DEVICE(0x56A6, info), \
>   	INTEL_VGA_DEVICE(0x56B0, info), \
>   	INTEL_VGA_DEVICE(0x56B1, info)
>   
>   #define INTEL_DG2_G12_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5696, info), \
> -	INTEL_VGA_DEVICE(0x5697, info), \
>   	INTEL_VGA_DEVICE(0x56A3, info), \
>   	INTEL_VGA_DEVICE(0x56A4, info), \
>   	INTEL_VGA_DEVICE(0x56B2, info), \
>   	INTEL_VGA_DEVICE(0x56B3, info)
>   
>   #define INTEL_DG2_IDS(info) \
> +	INTEL_DG2_G10_NB_MBD_IDS(info), \
> +	INTEL_DG2_G11_NB_MBD_IDS(info), \
> +	INTEL_DG2_G12_NB_MBD_IDS(info), \
>   	INTEL_DG2_G10_IDS(info), \
>   	INTEL_DG2_G11_IDS(info), \
>   	INTEL_DG2_G12_IDS(info)
