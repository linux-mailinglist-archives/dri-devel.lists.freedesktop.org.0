Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028243BA084
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 14:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728A6E15E;
	Fri,  2 Jul 2021 12:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CD06E15E;
 Fri,  2 Jul 2021 12:33:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="230397212"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="230397212"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 05:33:55 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="455938952"
Received: from juanniex-mobl.ger.corp.intel.com (HELO [10.213.253.90])
 ([10.213.253.90])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 05:33:53 -0700
Subject: Re: [Intel-gfx] [PATCH 01/53] drm/i915: Add "release id" version
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-2-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e15c0271-8663-6122-f7af-80c642fd2a4f@linux.intel.com>
Date: Fri, 2 Jul 2021 13:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701202427.1547543-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/07/2021 21:23, Matt Roper wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Besides the arch version returned by GRAPHICS_VER(), new platforms
> contain a "release id" to make clear the difference from one platform to
> another. Although for the first ones we may use them as if they were a

What does "first ones" refer to here?

> major/minor version, that is not true for all platforms: we may have a
> `release_id == n` that is closer to `n - 2` than to `n - 1`.

Hm this is a bit confusing. Is the sentence simply trying to say that, 
as the release id number is growing, hw capabilities are not simply 
accumulating but can be removed as well? Otherwise I am not sure how the 
user of these macros is supposed to act on this sentence.

> However the release id number is not defined by hardware until we start
> using the GMD_ID register. For the platforms before that register is
> useful we will set the values in software and we can set them as we
> please. So the plan is to set them so we can group different features
> under a single GRAPHICS_VER_FULL() check.
> 
> After GMD_ID is used, the usefulness of a "full version check" will be
> greatly reduced and will be mostly used for deciding workarounds and a
> few code paths. So it makes sense to keep it as a separate field from
> graphics_ver.
> 
> Also, currently there is not much use for the release id in media and
> display, so keep them out.
> 
> This is a mix of 2 independent changes: one by me and the other by Matt
> Roper.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_drv.h          | 6 ++++++
>   drivers/gpu/drm/i915/intel_device_info.c | 2 ++
>   drivers/gpu/drm/i915/intel_device_info.h | 2 ++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 6dff4ca01241..9639800485b9 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1258,11 +1258,17 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
>    */
>   #define IS_GEN(dev_priv, n)		(GRAPHICS_VER(dev_priv) == (n))
>   
> +#define IP_VER(ver, release)		((ver) << 8 | (release))
> +
>   #define GRAPHICS_VER(i915)		(INTEL_INFO(i915)->graphics_ver)
> +#define GRAPHICS_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->graphics_ver, \
> +					       INTEL_INFO(i915)->graphics_ver_release)
>   #define IS_GRAPHICS_VER(i915, from, until) \
>   	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
>   
>   #define MEDIA_VER(i915)			(INTEL_INFO(i915)->media_ver)
> +#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media_ver, \
> +					       INTEL_INFO(i915)->media_ver_release)
>   #define IS_MEDIA_VER(i915, from, until) \
>   	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
>   
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 7eaa92fee421..e8ad14f002c1 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -97,7 +97,9 @@ void intel_device_info_print_static(const struct intel_device_info *info,
>   				    struct drm_printer *p)
>   {
>   	drm_printf(p, "graphics_ver: %u\n", info->graphics_ver);
> +	drm_printf(p, "graphics_ver_release: %u\n", info->graphics_ver_release);

I get the VER and VER_FULL in the macros but could 'ver' and 
'ver_release' here and in the code simply be renamed to 'ver'/'version' 
and 'release'? Maybe it is just me but don't think I encountered the 
term "version release" before.

Regards,

Tvrtko

>   	drm_printf(p, "media_ver: %u\n", info->media_ver);
> +	drm_printf(p, "media_ver_release: %u\n", info->media_ver_release);
>   	drm_printf(p, "display_ver: %u\n", info->display.ver);
>   	drm_printf(p, "gt: %d\n", info->gt);
>   	drm_printf(p, "iommu: %s\n", iommu_name());
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index b326aff65cd6..944a5ff4df49 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -162,7 +162,9 @@ enum intel_ppgtt_type {
>   
>   struct intel_device_info {
>   	u8 graphics_ver;
> +	u8 graphics_ver_release;
>   	u8 media_ver;
> +	u8 media_ver_release;
>   
>   	u8 gt; /* GT number, 0 if undefined */
>   	intel_engine_mask_t platform_engine_mask; /* Engines supported by the HW */
> 
