Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460EAA32C3C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB0B10E939;
	Wed, 12 Feb 2025 16:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAMzhP/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E951310E937;
 Wed, 12 Feb 2025 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739378806; x=1770914806;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=s8YUVWPojGVBQrybTJ6nlFjsjR/2htImSgmWhiUy0DM=;
 b=aAMzhP/a1eFoFxCD9XyP1j2cCcbKEBcRFzKysswVCLeHoBvjoKUFjBBI
 8do9DMdEa+TmB0EXYvywGYqDz4JHn0TTQ5VbMeMmA//ong6tEe8OVG7zZ
 qgOLbGADUwvYROPKRGzuDY4M5Mr/j/OWxvuheuxkkVjoZ0EsinJKEyQbp
 s2hIyzDhw1TPOdi4u72DDwgXbVS3hRcdhA7niJIjF7YSRw0UkscO9jENA
 +gdw3JAKbE6iCl7cSwqq7mjWF1a/6Kiquu6P9nONrJsnjKoBrY4RC9R8W
 VSpadFhe3WMu7HFwLylsWfTV0XytIHROYLqTovaVl+oCb4hSP2Cr3NDCb A==;
X-CSE-ConnectionGUID: 2cyWF9buTNW9LoclXZwqMQ==
X-CSE-MsgGUID: LzjBx8uIScqnEqJChm7/wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43979678"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="43979678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:46:45 -0800
X-CSE-ConnectionGUID: NoLCkyqdTdO7O/hCuV6t9w==
X-CSE-MsgGUID: BNvHaralQ7Kd1lVNUkM93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112729955"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:46:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH] drm: Fix DSC BPP increment decoding
In-Reply-To: <20250212161851.4007005-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250212161851.4007005-1-imre.deak@intel.com>
Date: Wed, 12 Feb 2025 18:46:40 +0200
Message-ID: <87h64zyutr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 12 Feb 2025, Imre Deak <imre.deak@intel.com> wrote:
> Starting with DPCD version 2.0 bits 6:3 of the DP_DSC_BITS_PER_PIXEL_INC
> DPCD register contains the NativeYCbCr422_MAX_bpp_DELTA field, which can
> be non-zero as opposed to earlier DPCD versions, hence decoding the
> bit_per_pixel increment value at bits 2:0 in the same register requires
> applying a mask, do so.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Fixes: 0c2287c96521 ("drm/display/dp: Add helper function to get DSC bpp precision")
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

But we should really clean up the macros:

#define DP_DSC_BITS_PER_PIXEL_INC           0x06F
# define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
# define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0

These are both for DPCD 0x6e, not 0x6f. They're misleading here. And
they should contain the /* DP 2.0 */ comment.

And a similar macro for 0x6f bits 6:3 could be added.

BR,
Jani.


> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  include/drm/display/drm_dp.h            | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index c488d160a3c1f..f5c596234729d 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2602,7 +2602,7 @@ u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
>  {
>  	u8 bpp_increment_dpcd = dsc_dpcd[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT];
>  
> -	switch (bpp_increment_dpcd) {
> +	switch (bpp_increment_dpcd & DP_DSC_BITS_PER_PIXEL_MASK) {
>  	case DP_DSC_BITS_PER_PIXEL_1_16:
>  		return 16;
>  	case DP_DSC_BITS_PER_PIXEL_1_8:
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 784a32bfbad8f..c413ef68f9a30 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -359,6 +359,7 @@
>  # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
>  # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
>  # define DP_DSC_BITS_PER_PIXEL_1_1          0x4
> +# define DP_DSC_BITS_PER_PIXEL_MASK         0x7
>  
>  #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
>  # define DP_PSR_IS_SUPPORTED                1

-- 
Jani Nikula, Intel
